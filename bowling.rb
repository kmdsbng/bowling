# -*- encoding: utf-8 -*-

def main
  data = [[5,3],[7,2],[8,:/],[:X],[7,1],[9,:-],[6,2],[:X],[6,:/],[8,:-]]
  result = calc(data)
  ok = 126
  result # => 126
end

def calc(data)
  result = 0
  (0...data.size).each { |i| # 0..10
    frame = data[i]
    frame1, frame2 = frame

    additional = 0
    if frame1 == :-
      frame1 = 0
    end
    if frame1 == :X
      frame1 = 10
      additional_src = data[i+1][0]
      additional += case additional_src
      when :X
        10
      when :-
        0
      else
        additional_src
      end

      additional_src2 = data[i+1][1]
      additional += case additional_src2
      when :/
        10 - additional_src
      when :-
        0
      else
        additional_src2
      end
    end
    if frame2 == :-
      frame2 = 0
    end
    if frame2 == :/
      frame2 = 10 - frame1
      additional_src = data[i+1][0]
      additional = calc_frame2_additional(additional_src)
    end
    result += frame1.to_i + frame2.to_i + additional
  }
  result
end

def calc_frame2_additional(additional_src)
  case additional_src
  when :X
    10
  when :-
    0
  else
    additional_src
  end
end

main

