--[[
Copyright 2016 YANG Huan (sy.yanghuan@gmail.com).
Copyright 2016 Redmoon Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
--]]

local System = System
local traceback = debug.traceback
local tconcat = table.concat
local tinsert = table.insert

local function toString(this)
  local t = {}
  local message, innerException, stackTrace = this.message, this.innerException, this.errorStack
  tinsert(t, this.__name__)
  if message ~= nil and #message > 0 then
    tinsert(t, ": ")
    tinsert(t, message)
  end
  if innerException then
    tinsert(t, "---> ")
    tinsert(t, innerException:ToString())
  end
  if stackTrace then
    tinsert(t, stackTrace)
  end
  return tconcat(t)
end

System.define("System.Exception", {
  __tostring = toString,

  __ctor__ = function(this, message, innerException) 
    this.message = message
    this.innerException = innerException
  end,

  getMessage = function(this) 
    return this.message
  end,

  getInnerException = function(this) 
    return this.innerException
  end,

  getStackTrace = function(this) 
    return this.errorStack
  end,

  ToString = toString,

  traceback = function(this, lv)
    this.errorStack = traceback("", lv and lv + 3 or 3)
  end
})

System.define("System.ArgumentException", {
  __tostring = toString,
  __inherits__ = { System.Exception },

  __ctor__ = function(this, message, paramName, innerException) 
    System.Exception.__ctor__(this, message or "Value does not fall within the expected range.", innerException)
    this.paramName = paramName
  end,

  getParamName = function(this) 
    return this.paramName
  end
})

System.define("System.ArgumentNullException", {
  __tostring = toString,
  __inherits__ = { System.ArgumentException },

  __ctor__ = function(this, paramName, message, innerException) 
    if not message then
      message = "Value cannot be null."
      if paramName then 
        message = message .. "\nParameter name = " .. paramName
      end
    end
    System.ArgumentException.__ctor__(this, message, paramName, innerException)
  end
})

System.define("System.ArgumentOutOfRangeException", {
  __tostring = toString,
  __inherits__ = { System.ArgumentException },

  __ctor__ = function(this, paramName, message, innerException, actualValue) 
    if not message then
      message = "Value is out of range."
      if paramName then
        message = message .. "\nParameter name = " .. paramName
      end
    end
    System.ArgumentException.__ctor__(this, message, paramName, innerException)
    this.actualValue = actualValue
  end,

  getActualValue = function(this) 
      return this.actualValue
  end
})

System.define("System.CultureNotFoundException", {
  __tostring = toString,
  __inherits__ = { System.ArgumentException },

  __ctor__ = function(this, paramName, invalidCultureName, message, innerException, invalidCultureId) 
    if not message then 
      message = "Culture is not supported."
      if paramName then
        message = message .. "\nParameter name = " .. paramName
      end
      if invalidCultureName then
        message = message .. "\n" .. invalidCultureName .. " is an invalid culture identifier."
      end
    end
    System.ArgumentException.__ctor__(this, message, paramName, innerException)
    this.invalidCultureName = invalidCultureName
    this.invalidCultureId = invalidCultureId
  end,

  getInvalidCultureName = function(this)
    return this.invalidCultureName
  end,

  getInvalidCultureId = function(this) 
    return this.invalidCultureId
  end
})

System.define("System.KeyNotFoundException", {
  __tostring = toString,
  __inherits__ = { System.Exception },

  __ctor__ = function(this, message, innerException) 
    System.Exception.__ctor__(this, message or "Key not found.", innerException)
  end
})

System.define("System.ArithmeticException", {
  __tostring = toString,
  __inherits__ = { System.Exception },

  __ctor__ = function(this, message, innerException) 
    System.Exception.__ctor__(this, message or "Overflow or underflow in the arithmetic operation.", innerException)
  end
})

System.define("System.DivideByZeroException", {
  __tostring = toString,
  __inherits__ = { System.ArithmeticException },

  __ctor__ = function(this, message, innerException) 
    System.ArithmeticException.__ctor__(this, message or "Division by 0.", innerException)
  end
})

System.define("System.OverflowException", {
  __tostring = toString,
  __inherits__ = { System.ArithmeticException },

  __ctor__ = function(this, message, innerException) 
    System.ArithmeticException.__ctor__(this, message or "Arithmetic operation resulted in an overflow.", innerException)
  end
})

System.define("System.FormatException", {
  __tostring = toString,
  __inherits__ = { System.Exception },

  __ctor__ = function(this, message, innerException) 
    System.Exception.__ctor__(this, message or "Invalid format.", innerException)
  end
})

System.define("System.InvalidCastException", {
  __tostring = toString,
  __inherits__ = { System.Exception },

  __ctor__ = function(this, message, innerException) 
    System.Exception.__ctor__(this, message or "The cast is not valid.", innerException)
  end
})

System.define("System.InvalidOperationException", {
  __tostring = toString,
  __inherits__ = { System.Exception },

  __ctor__ = function(this, message, innerException) 
    System.Exception.__ctor__(this, message or "Operation is not valid due to the current state of the object.", innerException)
  end
})

System.define("System.NotImplementedException", {
  __tostring = toString,
  __inherits__ = { System.Exception },

  __ctor__ = function(this, message, innerException) 
    System.Exception.__ctor__(this, message or "The method or operation is not implemented.", innerException)
  end
})

System.define("System.NotSupportedException", {
  __tostring = toString,
  __inherits__ = { System.Exception },

  __ctor__ = function(this, message, innerException) 
    System.Exception.__ctor__(this, message or "Specified method is not supported.", innerException)
  end
})

System.define("System.NullReferenceException", {
  __tostring = toString,
  __inherits__ = { System.Exception },

  __ctor__ = function(this, message, innerException) 
    System.Exception.__ctor__(this, message or "Object is null.", innerException)
  end
})

System.define("System.RankException", {
  __tostring = toString,
  __inherits__ = { System.Exception },

  __ctor__ = function(this, message, innerException) 
    System.Exception.__ctor__(this, message or "Attempted to operate on an array with the incorrect number of dimensions.", innerException)
  end
})

System.define("System.TypeLoadException", {
  __tostring = toString,
  __inherits__ = { System.Exception },

  __ctor__ = function(this, message, innerException) 
    System.Exception.__ctor__(this, message or "Failed when load type.", innerException)
  end
})