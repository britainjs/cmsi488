# Autogenerated from a Treetop grammar. Edits may be lost.


require 'polyglot'
require 'treetop'

module EvalPoly
  include Treetop::Runtime

  def root
    @root ||= :poly
  end

  module Poly0
  end

  module Poly1
    def resolve (x)
        result = 0
        elements.each { |n| result += n.resolve(x)}
        return result
    end
  end

  def _nt_poly
    start_index = index
    if node_cache[:poly].has_key?(index)
      cached = node_cache[:poly][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    i1 = index
    r2 = _nt_negTerm
    if r2
      r1 = r2
    else
      r3 = _nt_term
      if r3
        r1 = r3
      else
        @index = i1
        r1 = nil
      end
    end
    s0 << r1
    if r1
      s4, i4 = [], index
      loop do
        i5 = index
        r6 = _nt_posTerm
        if r6
          r5 = r6
        else
          r7 = _nt_negTerm
          if r7
            r5 = r7
          else
            @index = i5
            r5 = nil
          end
        end
        if r5
          s4 << r5
        else
          break
        end
      end
      r4 = instantiate_node(SyntaxNode,input, i4...index, s4)
      s0 << r4
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Poly0)
      r0.extend(Poly1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:poly][start_index] = r0

    r0
  end

  module Term0
    def num
      elements[0]
    end

  end

  module Term1
    def resolve (x)
        result = 1
        elements.each { |n| result *= n.resolve(x)}
        return result
    end
  end

  def _nt_term
    start_index = index
    if node_cache[:term].has_key?(index)
      cached = node_cache[:term][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    r1 = _nt_exponent
    if r1
      r0 = r1
    else
      i2, s2 = index, []
      r3 = _nt_num
      s2 << r3
      if r3
        r5 = _nt_exponent
        if r5
          r4 = r5
        else
          r4 = instantiate_node(SyntaxNode,input, index...index)
        end
        s2 << r4
      end
      if s2.last
        r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
        r2.extend(Term0)
        r2.extend(Term1)
      else
        @index = i2
        r2 = nil
      end
      if r2
        r0 = r2
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:term][start_index] = r0

    r0
  end

  module PosTerm0
    def term
      elements[1]
    end
  end

  module PosTerm1
    def resolve (x)
        result = 0
        elements.each {|n| result += n.resolve(x)}
    end
  end

  def _nt_posTerm
    start_index = index
    if node_cache[:posTerm].has_key?(index)
      cached = node_cache[:posTerm][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?('+', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('+')
      r1 = nil
    end
    s0 << r1
    if r1
      r2 = _nt_term
      s0 << r2
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(PosTerm0)
      r0.extend(PosTerm1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:posTerm][start_index] = r0

    r0
  end

  module NegTerm0
    def term
      elements[1]
    end
  end

  module NegTerm1
    def resolve (x)
        result = 0
        elements.each {|n| result -= n.resolve(x)}
    end
  end

  def _nt_negTerm
    start_index = index
    if node_cache[:negTerm].has_key?(index)
      cached = node_cache[:negTerm][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?('-', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('-')
      r1 = nil
    end
    s0 << r1
    if r1
      r2 = _nt_term
      s0 << r2
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(NegTerm0)
      r0.extend(NegTerm1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:negTerm][start_index] = r0

    r0
  end

  module Var0
    def resolve (x)
        x.to_i
    end
  end

  def _nt_var
    start_index = index
    if node_cache[:var].has_key?(index)
      cached = node_cache[:var][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    if has_terminal?('x', false, index)
      r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
      r0.extend(Var0)
      @index += 1
    else
      terminal_parse_failure('x')
      r0 = nil
    end

    node_cache[:var][start_index] = r0

    r0
  end

  module Exponent0
    def num
      elements[1]
    end
  end

  module Exponent1
    def var
      elements[0]
    end

  end

  module Exponent2
    def resolve (x)
        var.resolve(x)
    end
  end

  def _nt_exponent
    start_index = index
    if node_cache[:exponent].has_key?(index)
      cached = node_cache[:exponent][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_var
    s0 << r1
    if r1
      i3, s3 = index, []
      if has_terminal?('^', false, index)
        r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure('^')
        r4 = nil
      end
      s3 << r4
      if r4
        r5 = _nt_num
        s3 << r5
      end
      if s3.last
        r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
        r3.extend(Exponent0)
      else
        @index = i3
        r3 = nil
      end
      if r3
        r2 = r3
      else
        r2 = instantiate_node(SyntaxNode,input, index...index)
      end
      s0 << r2
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Exponent1)
      r0.extend(Exponent2)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:exponent][start_index] = r0

    r0
  end

  module Num0
    def resolve (x)
        return text_value.to_f
    end
  end

  def _nt_num
    start_index = index
    if node_cache[:num].has_key?(index)
      cached = node_cache[:num][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      if has_terminal?('\G[0-9]', true, index)
        r1 = true
        @index += 1
      else
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      @index = i0
      r0 = nil
    else
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Num0)
    end

    node_cache[:num][start_index] = r0

    r0
  end

end

class EvalPolyParser < Treetop::Runtime::CompiledParser
  include EvalPoly
end
    