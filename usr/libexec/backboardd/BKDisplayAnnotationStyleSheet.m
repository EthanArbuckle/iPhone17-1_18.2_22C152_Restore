@interface BKDisplayAnnotationStyleSheet
- (BKDisplayAnnotationStyle)baseStyle;
- (BKDisplayAnnotationStyle)styleModifier;
- (BKDisplayAnnotationStyle)subnodeStyleModifier;
- (id)newLayerForContent:(id)a3 scale:(double)a4;
- (void)applyToLayer:(id)a3 forContent:(id)a4;
- (void)setBaseStyle:(id)a3;
- (void)setStyleModifier:(id)a3;
- (void)setSubnodeStyleModifier:(id)a3;
- (void)sizeLayer:(id)a3 toFitAtScale:(double)a4;
@end

@implementation BKDisplayAnnotationStyleSheet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subnodeStyleModifier, 0);
  objc_storeStrong((id *)&self->_styleModifier, 0);

  objc_storeStrong((id *)&self->_baseStyle, 0);
}

- (void)setSubnodeStyleModifier:(id)a3
{
}

- (void)setStyleModifier:(id)a3
{
}

- (BKDisplayAnnotationStyle)styleModifier
{
  return self->_styleModifier;
}

- (void)setBaseStyle:(id)a3
{
}

- (BKDisplayAnnotationStyle)baseStyle
{
  return self->_baseStyle;
}

- (id)newLayerForContent:(id)a3 scale:(double)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = +[CATextLayer layer];
    v7 = [v5 string];
    [v6 setString:v7];
    v8 = [@"Text annotation: " stringByAppendingString:v7];
    [v6 setName:v8];

    [v6 setContentsScale:a4];
    [v6 setRasterizationScale:a4];
    [v6 setContentsFormat:kCAContentsFormatAutomatic];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = +[CAShapeLayer layer];
      [v6 setName:@"Shape annotation"];
    }
    else
    {
      v6 = +[CALayer layer];
    }
  }

  return v6;
}

- (BKDisplayAnnotationStyle)subnodeStyleModifier
{
  subnodeStyleModifier = self->_subnodeStyleModifier;
  if (!subnodeStyleModifier) {
    subnodeStyleModifier = self->_styleModifier;
  }
  v3 = subnodeStyleModifier;

  return v3;
}

- (void)sizeLayer:(id)a3 toFitAtScale:(double)a4
{
  id v7 = a3;
  if (objc_opt_respondsToSelector()) {
    [(BKDisplayAnnotationStyle *)self->_baseStyle sizeLayer:v7 toFitAtScale:a4];
  }
  styleModifier = self->_styleModifier;
  if (styleModifier && self->_baseStyle != styleModifier && (objc_opt_respondsToSelector() & 1) != 0) {
    [(BKDisplayAnnotationStyle *)self->_styleModifier sizeLayer:v7 toFitAtScale:a4];
  }
}

- (void)applyToLayer:(id)a3 forContent:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  [(BKDisplayAnnotationStyle *)self->_baseStyle applyToLayer:v8 forContent:v6];
  styleModifier = self->_styleModifier;
  if (styleModifier && self->_baseStyle != styleModifier) {
    [(BKDisplayAnnotationStyle *)styleModifier applyToLayer:v8 forContent:v6];
  }
}

@end