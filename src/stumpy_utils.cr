module StumpyCore
  class Canvas
    def line(x0, y0, x1, y1, color = RGBA::BLACK)
      steep = (y1 - y0).abs > (x1 - x0).abs

      if steep
        x0, y0 = {y0, x0}
        x1, y1 = {y1, x1}
      end

      if x0 > x1
        x0, x1 = {x1, x0}
        y0, y1 = {y1, y0}
      end

      delta_x = x1 - x0
      delta_y = (y1 - y0).abs

      error = (delta_x / 2).to_i

      ystep = y0 < y1 ? 1 : -1
      y = y0

      ((x0.to_i)...(x1.to_i)).each do |x|
        if steep
          safe_set(y, x, color)
        else
          safe_set(x, y, color)
        end

        error -= delta_y
        if error < 0.0
          y += ystep
          error += delta_x
        end
      end
    end
  end

  struct RGBA
    # 148 CSS colors
    ANTIQUEWHITE         = RGBA.from_hex("#FAEBD7")
    AQUA                 = RGBA.from_hex("#00FFFF")
    AQUAMARINE           = RGBA.from_hex("#7FFFD4")
    AZURE                = RGBA.from_hex("#F0FFFF")
    BEIGE                = RGBA.from_hex("#F5F5DC")
    BISQUE               = RGBA.from_hex("#FFE4C4")
    BLACK                = RGBA.from_hex("#000000")
    BLANCHEDALMOND       = RGBA.from_hex("#FFEBCD")
    BLUE                 = RGBA.from_hex("#0000FF")
    BLUEVIOLET           = RGBA.from_hex("#8A2BE2")
    BROWN                = RGBA.from_hex("#A52A2A")
    BURLYWOOD            = RGBA.from_hex("#DEB887")
    CADETBLUE            = RGBA.from_hex("#5F9EA0")
    CHARTREUSE           = RGBA.from_hex("#7FFF00")
    CHOCOLATE            = RGBA.from_hex("#D2691E")
    CORAL                = RGBA.from_hex("#FF7F50")
    CORNFLOWERBLUE       = RGBA.from_hex("#6495ED")
    CORNSILK             = RGBA.from_hex("#FFF8DC")
    CRIMSON              = RGBA.from_hex("#DC143C")
    CYAN                 = RGBA.from_hex("#00FFFF")
    DARKBLUE             = RGBA.from_hex("#00008B")
    DARKCYAN             = RGBA.from_hex("#008B8B")
    DARKGOLDENROD        = RGBA.from_hex("#B8860B")
    DARKGRAY             = RGBA.from_hex("#A9A9A9")
    DARKGREEN            = RGBA.from_hex("#006400")
    DARKGREY             = RGBA.from_hex("#A9A9A9")
    DARKKHAKI            = RGBA.from_hex("#BDB76B")
    DARKMAGENTA          = RGBA.from_hex("#8B008B")
    DARKOLIVEGREEN       = RGBA.from_hex("#556B2F")
    DARKORANGE           = RGBA.from_hex("#FF8C00")
    DARKORCHID           = RGBA.from_hex("#9932CC")
    DARKRED              = RGBA.from_hex("#8B0000")
    DARKSALMON           = RGBA.from_hex("#E9967A")
    DARKSEAGREEN         = RGBA.from_hex("#8FBC8F")
    DARKSLATEBLUE        = RGBA.from_hex("#483D8B")
    DARKSLATEGRAY        = RGBA.from_hex("#2F4F4F")
    DARKSLATEGREY        = RGBA.from_hex("#2F4F4F")
    DARKTURQUOISE        = RGBA.from_hex("#00CED1")
    DARKVIOLET           = RGBA.from_hex("#9400D3")
    DEEPPINK             = RGBA.from_hex("#FF1493")
    DEEPSKYBLUE          = RGBA.from_hex("#00BFFF")
    DIMGRAY              = RGBA.from_hex("#696969")
    DIMGREY              = RGBA.from_hex("#696969")
    DODGERBLUE           = RGBA.from_hex("#1E90FF")
    FIREBRICK            = RGBA.from_hex("#B22222")
    FLORALWHITE          = RGBA.from_hex("#FFFAF0")
    FORESTGREEN          = RGBA.from_hex("#228B22")
    FUCHSIA              = RGBA.from_hex("#FF00FF")
    GAINSBORO            = RGBA.from_hex("#DCDCDC")
    GHOSTWHITE           = RGBA.from_hex("#F8F8FF")
    GOLD                 = RGBA.from_hex("#FFD700")
    GOLDENROD            = RGBA.from_hex("#DAA520")
    GRAY                 = RGBA.from_hex("#808080")
    GREEN                = RGBA.from_hex("#008000")
    GREENYELLOW          = RGBA.from_hex("#ADFF2F")
    GREY                 = RGBA.from_hex("#808080")
    HONEYDEW             = RGBA.from_hex("#F0FFF0")
    HOTPINK              = RGBA.from_hex("#FF69B4")
    INDIANRED            = RGBA.from_hex("#CD5C5C")
    INDIGO               = RGBA.from_hex("#4B0082")
    IVORY                = RGBA.from_hex("#FFFFF0")
    KHAKI                = RGBA.from_hex("#F0E68C")
    LAVENDER             = RGBA.from_hex("#E6E6FA")
    LAVENDERBLUSH        = RGBA.from_hex("#FFF0F5")
    LAWNGREEN            = RGBA.from_hex("#7CFC00")
    LEMONCHIFFON         = RGBA.from_hex("#FFFACD")
    LIGHTBLUE            = RGBA.from_hex("#ADD8E6")
    LIGHTCORAL           = RGBA.from_hex("#F08080")
    LIGHTCYAN            = RGBA.from_hex("#E0FFFF")
    LIGHTGOLDENRODYELLOW = RGBA.from_hex("#FAFAD2")
    LIGHTGRAY            = RGBA.from_hex("#D3D3D3")
    LIGHTGREEN           = RGBA.from_hex("#90EE90")
    LIGHTGREY            = RGBA.from_hex("#D3D3D3")
    LIGHTPINK            = RGBA.from_hex("#FFB6C1")
    LIGHTSALMON          = RGBA.from_hex("#FFA07A")
    LIGHTSEAGREEN        = RGBA.from_hex("#20B2AA")
    LIGHTSKYBLUE         = RGBA.from_hex("#87CEFA")
    LIGHTSLATEGRAY       = RGBA.from_hex("#778899")
    LIGHTSLATEGREY       = RGBA.from_hex("#778899")
    LIGHTSTEELBLUE       = RGBA.from_hex("#B0C4DE")
    LIGHTYELLOW          = RGBA.from_hex("#FFFFE0")
    LIME                 = RGBA.from_hex("#00FF00")
    LIMEGREEN            = RGBA.from_hex("#32CD32")
    LINEN                = RGBA.from_hex("#FAF0E6")
    MAGENTA              = RGBA.from_hex("#FF00FF")
    MAROON               = RGBA.from_hex("#800000")
    MEDIUMAQUAMARINE     = RGBA.from_hex("#66CDAA")
    MEDIUMBLUE           = RGBA.from_hex("#0000CD")
    MEDIUMORCHID         = RGBA.from_hex("#BA55D3")
    MEDIUMPURPLE         = RGBA.from_hex("#9370DB")
    MEDIUMSEAGREEN       = RGBA.from_hex("#3CB371")
    MEDIUMSLATEBLUE      = RGBA.from_hex("#7B68EE")
    MEDIUMSPRINGGREEN    = RGBA.from_hex("#00FA9A")
    MEDIUMTURQUOISE      = RGBA.from_hex("#48D1CC")
    MEDIUMVIOLETRED      = RGBA.from_hex("#C71585")
    MIDNIGHTBLUE         = RGBA.from_hex("#191970")
    MINTCREAM            = RGBA.from_hex("#F5FFFA")
    MISTYROSE            = RGBA.from_hex("#FFE4E1")
    MOCCASIN             = RGBA.from_hex("#FFE4B5")
    NAVAJOWHITE          = RGBA.from_hex("#FFDEAD")
    NAVY                 = RGBA.from_hex("#000080")
    OLDLACE              = RGBA.from_hex("#FDF5E6")
    OLIVE                = RGBA.from_hex("#808000")
    OLIVEDRAB            = RGBA.from_hex("#6B8E23")
    ORANGE               = RGBA.from_hex("#FFA500")
    ORANGERED            = RGBA.from_hex("#FF4500")
    ORCHID               = RGBA.from_hex("#DA70D6")
    PALEGOLDENROD        = RGBA.from_hex("#EEE8AA")
    PALEGREEN            = RGBA.from_hex("#98FB98")
    PALETURQUOISE        = RGBA.from_hex("#AFEEEE")
    PALEVIOLETRED        = RGBA.from_hex("#DB7093")
    PAPAYAWHIP           = RGBA.from_hex("#FFEFD5")
    PEACHPUFF            = RGBA.from_hex("#FFDAB9")
    PERU                 = RGBA.from_hex("#CD853F")
    PINK                 = RGBA.from_hex("#FFC0CB")
    PLUM                 = RGBA.from_hex("#DDA0DD")
    POWDERBLUE           = RGBA.from_hex("#B0E0E6")
    PURPLE               = RGBA.from_hex("#800080")
    REBECCAPURPLE        = RGBA.from_hex("#663399")
    RED                  = RGBA.from_hex("#FF0000")
    ROSYBROWN            = RGBA.from_hex("#BC8F8F")
    ROYALBLUE            = RGBA.from_hex("#4169E1")
    SADDLEBROWN          = RGBA.from_hex("#8B4513")
    SALMON               = RGBA.from_hex("#FA8072")
    SANDYBROWN           = RGBA.from_hex("#F4A460")
    SEAGREEN             = RGBA.from_hex("#2E8B57")
    SEASHELL             = RGBA.from_hex("#FFF5EE")
    SIENNA               = RGBA.from_hex("#A0522D")
    SILVER               = RGBA.from_hex("#C0C0C0")
    SKYBLUE              = RGBA.from_hex("#87CEEB")
    SLATEBLUE            = RGBA.from_hex("#6A5ACD")
    SLATEGRAY            = RGBA.from_hex("#708090")
    SLATEGREY            = RGBA.from_hex("#708090")
    SNOW                 = RGBA.from_hex("#FFFAFA")
    SPRINGGREEN          = RGBA.from_hex("#00FF7F")
    STEELBLUE            = RGBA.from_hex("#4682B4")
    TAN                  = RGBA.from_hex("#D2B48C")
    TEAL                 = RGBA.from_hex("#008080")
    THISTLE              = RGBA.from_hex("#D8BFD8")
    TOMATO               = RGBA.from_hex("#FF6347")
    TURQUOISE            = RGBA.from_hex("#40E0D0")
    VIOLET               = RGBA.from_hex("#EE82EE")
    WHEAT                = RGBA.from_hex("#F5DEB3")
    WHITE                = RGBA.from_hex("#FFFFFF")
    WHITESMOKE           = RGBA.from_hex("#F5F5F5")
    YELLOW               = RGBA.from_hex("#FFFF00")
    YELLOWGREEN          = RGBA.from_hex("#9ACD32")
  end
end