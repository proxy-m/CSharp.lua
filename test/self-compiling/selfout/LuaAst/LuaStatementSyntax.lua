-- Generated by CSharp.lua Compiler 1.0.0.0
local System = System
local CSharpLuaLuaAst
local CSharpLuaLuaAstLuaStatementSyntax
local CSharpLuaLuaAstLuaSyntaxNode
System.usingDeclare(function (global) 
  CSharpLuaLuaAst = CSharpLua.LuaAst
  CSharpLuaLuaAstLuaStatementSyntax = CSharpLua.LuaAst.LuaStatementSyntax
  CSharpLuaLuaAstLuaSyntaxNode = CSharpLua.LuaAst.LuaSyntaxNode
end)
System.namespace("CSharpLua.LuaAst", function (namespace) 
  namespace.class("LuaStatementSyntax", function (namespace) 
    namespace.class("EmptyLuaStatementSyntax", function (namespace) 
      local Render, __ctor__
      __ctor__ = function (this) 
        CSharpLuaLuaAst.LuaStatementSyntax.__ctor__(this)
      end
      Render = function (this, renderer) 
      end
      return {
        __inherits__ = function (global) 
          return {
            global.CSharpLua.LuaAst.LuaStatementSyntax
          }
        end, 
        Render = Render, 
        __ctor__ = __ctor__
      }
    end)
    local getSemicolonToken, Empty, __staticCtor__, __ctor__
    __staticCtor__ = function (this) 
      Empty = CSharpLuaLuaAstLuaStatementSyntax.EmptyLuaStatementSyntax()
      this.Empty = Empty
    end
    __ctor__ = function (this) 
      CSharpLuaLuaAst.LuaSyntaxNode.__ctor__(this)
    end
    getSemicolonToken = function (this) 
      return CSharpLuaLuaAstLuaSyntaxNode.Tokens.Semicolon
    end
    return {
      __inherits__ = function (global) 
        return {
          global.CSharpLua.LuaAst.LuaSyntaxNode
        }
      end, 
      getSemicolonToken = getSemicolonToken, 
      __staticCtor__ = __staticCtor__, 
      __ctor__ = __ctor__
    }
  end)
  namespace.class("LuaExpressionStatementSyntax", function (namespace) 
    local Render, __ctor__
    __ctor__ = function (this, expression) 
      CSharpLuaLuaAst.LuaStatementSyntax.__ctor__(this)
      if expression == nil then
        System.throw(System.ArgumentNullException("expression"))
      end
      this.Expression = expression
    end
    Render = function (this, renderer) 
      renderer:Render2(this)
    end
    return {
      __inherits__ = function (global) 
        return {
          global.CSharpLua.LuaAst.LuaStatementSyntax
        }
      end, 
      Render = Render, 
      __ctor__ = __ctor__
    }
  end)
  namespace.class("LuaStatementListSyntax", function (namespace) 
    local Render, __init__, __ctor__
    __init__ = function (this) 
      this.Statements = CSharpLuaLuaAst.LuaSyntaxList_1(CSharpLuaLuaAst.LuaStatementSyntax)()
    end
    __ctor__ = function (this) 
      __init__(this)
      CSharpLuaLuaAst.LuaStatementSyntax.__ctor__(this)
    end
    Render = function (this, renderer) 
      renderer:Render18(this)
    end
    return {
      __inherits__ = function (global) 
        return {
          global.CSharpLua.LuaAst.LuaStatementSyntax
        }
      end, 
      Render = Render, 
      __ctor__ = __ctor__
    }
  end)
  namespace.class("LuaReturnStatementSyntax", function (namespace) 
    local getReturnKeyword, Render, __ctor__
    __ctor__ = function (this, expression) 
      CSharpLuaLuaAst.LuaStatementSyntax.__ctor__(this)
      this.Expression = expression
    end
    getReturnKeyword = function (this) 
      return "return" --[[Keyword.Return]]
    end
    Render = function (this, renderer) 
      renderer:Render25(this)
    end
    return {
      __inherits__ = function (global) 
        return {
          global.CSharpLua.LuaAst.LuaStatementSyntax
        }
      end, 
      getReturnKeyword = getReturnKeyword, 
      Render = Render, 
      __ctor__ = __ctor__
    }
  end)
  namespace.class("LuaMultipleReturnStatementSyntax", function (namespace) 
    local getReturnKeyword, Render, __init__, __ctor__
    __init__ = function (this) 
      this.Expressions = CSharpLuaLuaAst.LuaSyntaxList_1(CSharpLuaLuaAst.LuaExpressionSyntax)()
    end
    __ctor__ = function (this) 
      __init__(this)
      CSharpLuaLuaAst.LuaStatementSyntax.__ctor__(this)
    end
    getReturnKeyword = function (this) 
      return "return" --[[Keyword.Return]]
    end
    Render = function (this, renderer) 
      renderer:Render24(this)
    end
    return {
      __inherits__ = function (global) 
        return {
          global.CSharpLua.LuaAst.LuaStatementSyntax
        }
      end, 
      getReturnKeyword = getReturnKeyword, 
      Render = Render, 
      __ctor__ = __ctor__
    }
  end)
  namespace.class("LuaBreakStatementSyntax", function (namespace) 
    local getBreakKeyword, Render, Statement, __staticCtor__, __ctor__
    __staticCtor__ = function (this) 
      Statement = CSharpLuaLuaAst.LuaBreakStatementSyntax()
      this.Statement = Statement
    end
    __ctor__ = function (this) 
      CSharpLuaLuaAst.LuaStatementSyntax.__ctor__(this)
    end
    getBreakKeyword = function (this) 
      return "break" --[[Keyword.Break]]
    end
    Render = function (this, renderer) 
      renderer:Render47(this)
    end
    return {
      __inherits__ = function (global) 
        return {
          global.CSharpLua.LuaAst.LuaStatementSyntax
        }
      end, 
      getBreakKeyword = getBreakKeyword, 
      Render = Render, 
      __staticCtor__ = __staticCtor__, 
      __ctor__ = __ctor__
    }
  end)
  namespace.class("LuaContinueAdapterStatementSyntax", function (namespace) 
    local getBreak, Render, Statement, __staticCtor__, __ctor__
    __staticCtor__ = function (this) 
      Statement = CSharpLuaLuaAst.LuaContinueAdapterStatementSyntax()
      this.Statement = Statement
    end
    __ctor__ = function (this) 
      CSharpLuaLuaAst.LuaStatementSyntax.__ctor__(this)
      this.Assignment = CSharpLuaLuaAst.LuaExpressionStatementSyntax(CSharpLuaLuaAst.LuaAssignmentExpressionSyntax(CSharpLuaLuaAst.LuaIdentifierNameSyntax.Continue, CSharpLuaLuaAst.LuaIdentifierNameSyntax.True))
    end
    getBreak = function (this) 
      return CSharpLuaLuaAst.LuaBreakStatementSyntax.Statement
    end
    Render = function (this, renderer) 
      renderer:Render48(this)
    end
    return {
      __inherits__ = function (global) 
        return {
          global.CSharpLua.LuaAst.LuaStatementSyntax
        }
      end, 
      getBreak = getBreak, 
      Render = Render, 
      __staticCtor__ = __staticCtor__, 
      __ctor__ = __ctor__
    }
  end)
  namespace.class("LuaBlankLinesStatement", function (namespace) 
    local Render, One, __staticCtor__, __ctor__
    __staticCtor__ = function (this) 
      One = CSharpLuaLuaAst.LuaBlankLinesStatement(1)
      this.One = One
    end
    __ctor__ = function (this, count) 
      CSharpLuaLuaAst.LuaStatementSyntax.__ctor__(this)
      this.Count = count
    end
    Render = function (this, renderer) 
      renderer:Render49(this)
    end
    return {
      __inherits__ = function (global) 
        return {
          global.CSharpLua.LuaAst.LuaStatementSyntax
        }
      end, 
      Count = 0, 
      Render = Render, 
      __staticCtor__ = __staticCtor__, 
      __ctor__ = __ctor__
    }
  end)
  namespace.class("LuaShortCommentStatement", function (namespace) 
    local getSingleCommentToken, Render, __ctor__
    __ctor__ = function (this, comment) 
      CSharpLuaLuaAst.LuaStatementSyntax.__ctor__(this)
      this.Comment = comment
    end
    getSingleCommentToken = function (this) 
      return "--" --[[Tokens.ShortComment]]
    end
    Render = function (this, renderer) 
      renderer:Render50(this)
    end
    return {
      __inherits__ = function (global) 
        return {
          global.CSharpLua.LuaAst.LuaStatementSyntax
        }
      end, 
      getSingleCommentToken = getSingleCommentToken, 
      Render = Render, 
      __ctor__ = __ctor__
    }
  end)
  namespace.class("LuaLongCommentStatement", function (namespace) 
    local getOpenCommentToken, getCloseCommentToken, Render, __ctor__
    __ctor__ = function (this, comment) 
      CSharpLuaLuaAst.LuaStatementSyntax.__ctor__(this)
      this.Comment = comment
    end
    getOpenCommentToken = function (this) 
      return "--[[" --[[Tokens.OpenLongComment]]
    end
    getCloseCommentToken = function (this) 
      return "--]]" --[[Tokens.CloseLongComment]]
    end
    Render = function (this, renderer) 
      renderer:Render51(this)
    end
    return {
      __inherits__ = function (global) 
        return {
          global.CSharpLua.LuaAst.LuaStatementSyntax
        }
      end, 
      getOpenCommentToken = getOpenCommentToken, 
      getCloseCommentToken = getCloseCommentToken, 
      Render = Render, 
      __ctor__ = __ctor__
    }
  end)
  namespace.class("LuaGotoStatement", function (namespace) 
    local getGotoKeyword, Render, __ctor__
    __ctor__ = function (this, identifier) 
      CSharpLuaLuaAst.LuaStatementSyntax.__ctor__(this)
      if identifier == nil then
        System.throw(System.ArgumentNullException("identifier"))
      end
      this.Identifier = identifier
    end
    getGotoKeyword = function (this) 
      return "goto" --[[Keyword.Goto]]
    end
    Render = function (this, renderer) 
      renderer:Render53(this)
    end
    return {
      __inherits__ = function (global) 
        return {
          global.CSharpLua.LuaAst.LuaStatementSyntax
        }
      end, 
      getGotoKeyword = getGotoKeyword, 
      Render = Render, 
      __ctor__ = __ctor__
    }
  end)
  namespace.class("LuaGotoCaseAdapterStatement", function (namespace) 
    local Render, __ctor__
    __ctor__ = function (this, identifier) 
      CSharpLuaLuaAst.LuaStatementSyntax.__ctor__(this)
      if identifier == nil then
        System.throw(System.ArgumentNullException("identifier"))
      end

      local assignment = CSharpLuaLuaAst.LuaAssignmentExpressionSyntax(identifier, CSharpLuaLuaAst.LuaIdentifierNameSyntax.True)
      this.Assignment = CSharpLuaLuaAst.LuaExpressionStatementSyntax(assignment)
      this.GotoStatement = CSharpLuaLuaAst.LuaGotoStatement(identifier)
    end
    Render = function (this, renderer) 
      renderer:Render55(this)
    end
    return {
      __inherits__ = function (global) 
        return {
          global.CSharpLua.LuaAst.LuaStatementSyntax
        }
      end, 
      Render = Render, 
      __ctor__ = __ctor__
    }
  end)
  namespace.class("LuaLabeledStatement", function (namespace) 
    local getPrefixToken, getSuffixToken, Render, __ctor__
    __ctor__ = function (this, identifier, statement) 
      CSharpLuaLuaAst.LuaStatementSyntax.__ctor__(this)
      if identifier == nil then
        System.throw(System.ArgumentNullException("identifier"))
      end
      this.Identifier = identifier
      this.Statement = statement
    end
    getPrefixToken = function (this) 
      return "::" --[[Tokens.Label]]
    end
    getSuffixToken = function (this) 
      return "::" --[[Tokens.Label]]
    end
    Render = function (this, renderer) 
      renderer:Render54(this)
    end
    return {
      __inherits__ = function (global) 
        return {
          global.CSharpLua.LuaAst.LuaStatementSyntax
        }
      end, 
      getPrefixToken = getPrefixToken, 
      getSuffixToken = getSuffixToken, 
      Render = Render, 
      __ctor__ = __ctor__
    }
  end)
end)
