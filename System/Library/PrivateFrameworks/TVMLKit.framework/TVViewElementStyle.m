@interface TVViewElementStyle
- (IKViewElementStyle)style;
- (NSShadow)shadow;
- (NSString)fontWeight;
- (NSString)imageTreatmentName;
- (NSString)ratingStyle;
- (NSString)textHighlightStyle;
- (NSString)textStyle;
- (NSString)textTransform;
- (TVAppStyle)styleMetrics;
- (TVColor)backgroundColor;
- (TVColor)color;
- (TVColor)highlightColor;
- (TVColor)tintColor;
- (TVViewElementStyle)initWithStyle:(id)a3;
- (UIEdgeInsets)focusMargin;
- (UIEdgeInsets)margin;
- (UIEdgeInsets)padding;
- (double)fontSize;
- (double)height;
- (double)interitemSpacing;
- (double)maxHeight;
- (double)maxWidth;
- (double)minHeight;
- (double)minWidth;
- (double)textMinimumScaleFactor;
- (double)width;
- (id)cssValueForStyleProperty:(id)a3;
- (id)darkTintColor;
- (id)valueForStyleProperty:(id)a3;
- (int64_t)alignment;
- (int64_t)contentAlignment;
- (int64_t)position;
- (int64_t)textAlignment;
- (unint64_t)maxTextLines;
- (void)setStyleMetrics:(id)a3;
@end

@implementation TVViewElementStyle

- (TVViewElementStyle)initWithStyle:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TVViewElementStyle;
  v5 = [(TVViewElementStyle *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_style, v4);
  }

  return v6;
}

- (TVAppStyle)styleMetrics
{
  v2 = [(TVViewElementStyle *)self style];
  v3 = objc_msgSend(v2, "tv_styleMetrics");

  return (TVAppStyle *)v3;
}

- (void)setStyleMetrics:(id)a3
{
  id v4 = a3;
  id v5 = [(TVViewElementStyle *)self style];
  objc_msgSend(v5, "tv_setStyleMetrics:", v4);
}

- (id)cssValueForStyleProperty:(id)a3
{
  id v4 = a3;
  id v5 = [(TVViewElementStyle *)self style];
  v6 = objc_msgSend(v5, "tv_cssValueForStyle:", v4);

  return v6;
}

- (id)valueForStyleProperty:(id)a3
{
  id v4 = a3;
  id v5 = [(TVViewElementStyle *)self style];
  v6 = objc_msgSend(v5, "tv_valueForStyle:", v4);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    cachedColorObjects = self->_cachedColorObjects;
    if (!cachedColorObjects)
    {
      objc_super v8 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:5];
      v9 = self->_cachedColorObjects;
      self->_cachedColorObjects = v8;

      cachedColorObjects = self->_cachedColorObjects;
    }
    v10 = [(NSMutableDictionary *)cachedColorObjects objectForKeyedSubscript:v4];
    v11 = v10;
    if (!v10
      || ([(TVColor *)v10 ikColor],
          v12 = objc_claimAutoreleasedReturnValue(),
          v12,
          v12 != v6))
    {
      v13 = [[TVColor alloc] initWithColor:v6];

      [(NSMutableDictionary *)self->_cachedColorObjects setObject:v13 forKeyedSubscript:v4];
      v11 = v13;
    }

    v6 = v11;
  }

  return v6;
}

- (TVColor)backgroundColor
{
  return (TVColor *)[(TVViewElementStyle *)self valueForStyleProperty:@"background-color"];
}

- (TVColor)color
{
  return (TVColor *)[(TVViewElementStyle *)self valueForStyleProperty:@"color"];
}

- (NSString)textTransform
{
  v2 = [(TVViewElementStyle *)self style];
  v3 = objc_msgSend(v2, "tv_textTransform");

  return (NSString *)v3;
}

- (double)fontSize
{
  v2 = [(TVViewElementStyle *)self style];
  objc_msgSend(v2, "tv_fontSize");
  double v4 = v3;

  return v4;
}

- (NSString)fontWeight
{
  v2 = [(TVViewElementStyle *)self style];
  double v3 = objc_msgSend(v2, "tv_fontWeight");

  return (NSString *)v3;
}

- (double)height
{
  v2 = [(TVViewElementStyle *)self style];
  objc_msgSend(v2, "tv_height");
  double v4 = v3;

  return v4;
}

- (UIEdgeInsets)margin
{
  v2 = [(TVViewElementStyle *)self style];
  objc_msgSend(v2, "tv_margin");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (UIEdgeInsets)focusMargin
{
  v2 = [(TVViewElementStyle *)self style];
  objc_msgSend(v2, "tv_focusMargin");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (double)maxHeight
{
  v2 = [(TVViewElementStyle *)self style];
  objc_msgSend(v2, "tv_maxHeight");
  double v4 = v3;

  return v4;
}

- (double)maxWidth
{
  v2 = [(TVViewElementStyle *)self style];
  objc_msgSend(v2, "tv_maxWidth");
  double v4 = v3;

  return v4;
}

- (double)minHeight
{
  v2 = [(TVViewElementStyle *)self style];
  objc_msgSend(v2, "tv_minHeight");
  double v4 = v3;

  return v4;
}

- (double)minWidth
{
  v2 = [(TVViewElementStyle *)self style];
  objc_msgSend(v2, "tv_minWidth");
  double v4 = v3;

  return v4;
}

- (UIEdgeInsets)padding
{
  v2 = [(TVViewElementStyle *)self style];
  objc_msgSend(v2, "tv_padding");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (int64_t)textAlignment
{
  v2 = [(TVViewElementStyle *)self style];
  int64_t v3 = objc_msgSend(v2, "tv_textAlignment");

  return v3;
}

- (double)width
{
  v2 = [(TVViewElementStyle *)self style];
  objc_msgSend(v2, "tv_width");
  double v4 = v3;

  return v4;
}

- (NSShadow)shadow
{
  v2 = [(TVViewElementStyle *)self style];
  double v3 = objc_msgSend(v2, "tv_shadow");

  return (NSShadow *)v3;
}

- (int64_t)alignment
{
  v2 = [(TVViewElementStyle *)self style];
  int64_t v3 = objc_msgSend(v2, "tv_alignment");

  return v3;
}

- (int64_t)contentAlignment
{
  v2 = [(TVViewElementStyle *)self style];
  int64_t v3 = objc_msgSend(v2, "tv_contentAlignment");

  return v3;
}

- (TVColor)highlightColor
{
  return (TVColor *)[(TVViewElementStyle *)self valueForStyleProperty:@"tv-highlight-color"];
}

- (NSString)imageTreatmentName
{
  v2 = [(TVViewElementStyle *)self style];
  int64_t v3 = objc_msgSend(v2, "tv_imageTreatment");

  return (NSString *)v3;
}

- (double)interitemSpacing
{
  v2 = [(TVViewElementStyle *)self style];
  objc_msgSend(v2, "tv_interitemSpacing");
  double v4 = v3;

  return v4;
}

- (NSString)textHighlightStyle
{
  v2 = [(TVViewElementStyle *)self style];
  double v3 = objc_msgSend(v2, "tv_textHighlightStyle");

  return (NSString *)v3;
}

- (double)textMinimumScaleFactor
{
  v2 = [(TVViewElementStyle *)self style];
  objc_msgSend(v2, "tv_minimumScaleFactor");
  double v4 = v3;

  return v4;
}

- (int64_t)position
{
  v2 = [(TVViewElementStyle *)self style];
  int64_t v3 = objc_msgSend(v2, "tv_position");

  return v3;
}

- (NSString)ratingStyle
{
  v2 = [(TVViewElementStyle *)self style];
  int64_t v3 = objc_msgSend(v2, "tv_ratingStyle");

  return (NSString *)v3;
}

- (unint64_t)maxTextLines
{
  v2 = [(TVViewElementStyle *)self style];
  unint64_t v3 = objc_msgSend(v2, "tv_maxTextLines");

  return v3;
}

- (NSString)textStyle
{
  v2 = [(TVViewElementStyle *)self style];
  unint64_t v3 = objc_msgSend(v2, "tv_textStyle");

  return (NSString *)v3;
}

- (TVColor)tintColor
{
  return (TVColor *)[(TVViewElementStyle *)self valueForStyleProperty:@"tv-tint-color"];
}

- (id)darkTintColor
{
  return [(TVViewElementStyle *)self valueForStyleProperty:@"tv-dark-tint-color"];
}

- (IKViewElementStyle)style
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_style);
  return (IKViewElementStyle *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_style);
  objc_storeStrong((id *)&self->_cachedColorObjects, 0);
}

@end