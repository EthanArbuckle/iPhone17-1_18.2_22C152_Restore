@interface BKShapeView
+ (Class)layerClass;
- (BKShapeView)init;
- (BOOL)fillColorUsesTintColor;
- (BOOL)ignoresTintColorAlpha;
- (BOOL)strokeColorUsesTintColor;
- (UIBezierPath)path;
- (UIColor)fillColor;
- (UIColor)strokeColor;
- (double)lineWidth;
- (id)_tintColorToUse;
- (void)_syncFillColor;
- (void)_syncStrokeColor;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)setFillColor:(id)a3;
- (void)setFillColorUsesTintColor:(BOOL)a3;
- (void)setIgnoresTintColorAlpha:(BOOL)a3;
- (void)setLineWidth:(double)a3;
- (void)setPath:(id)a3;
- (void)setStrokeColor:(id)a3;
- (void)setStrokeColorUsesTintColor:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation BKShapeView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (BKShapeView)init
{
  v6.receiver = self;
  v6.super_class = (Class)BKShapeView;
  v2 = [(BKShapeView *)&v6 init];
  if (v2)
  {
    v3 = +[UITraitCollection bc_allAPITraits];
    id v4 = [(BKShapeView *)v2 registerForTraitChanges:v3 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v2;
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5 = [(BKShapeView *)self fillColor];
  id v6 = [v5 CGColor];
  v7 = [(BKShapeView *)self layer];
  [v7 setFillColor:v6];

  id v10 = [(BKShapeView *)self strokeColor];
  id v8 = [v10 CGColor];
  v9 = [(BKShapeView *)self layer];
  [v9 setStrokeColor:v8];
}

- (UIBezierPath)path
{
  v2 = [(BKShapeView *)self layer];
  v3 = +[UIBezierPath bezierPathWithCGPath:](UIBezierPath, "bezierPathWithCGPath:", [v2 path]);

  return (UIBezierPath *)v3;
}

- (void)setPath:(id)a3
{
  id v4 = [a3 CGPath];
  id v5 = [(BKShapeView *)self layer];
  [v5 setPath:v4];
}

- (void)setFillColor:(id)a3
{
  id v5 = (UIColor *)a3;
  id v6 = v5;
  if (self->_fillColor != v5)
  {
    v9 = v5;
    id v5 = (UIColor *)-[UIColor isEqual:](v5, "isEqual:");
    id v6 = v9;
    if ((v5 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_fillColor, a3);
      v7 = [(UIColor *)v9 CGColor];
      id v8 = [(BKShapeView *)self layer];
      [v8 setFillColor:v7];

      id v6 = v9;
    }
  }

  _objc_release_x1(v5, v6);
}

- (void)setStrokeColor:(id)a3
{
  id v5 = (UIColor *)a3;
  id v6 = v5;
  if (self->_strokeColor != v5)
  {
    v9 = v5;
    id v5 = (UIColor *)-[UIColor isEqual:](v5, "isEqual:");
    id v6 = v9;
    if ((v5 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_strokeColor, a3);
      v7 = [(UIColor *)v9 CGColor];
      id v8 = [(BKShapeView *)self layer];
      [v8 setStrokeColor:v7];

      id v6 = v9;
    }
  }

  _objc_release_x1(v5, v6);
}

- (double)lineWidth
{
  v2 = [(BKShapeView *)self layer];
  [v2 lineWidth];
  double v4 = v3;

  return v4;
}

- (void)setLineWidth:(double)a3
{
  id v4 = [(BKShapeView *)self layer];
  [v4 setLineWidth:a3];
}

- (void)setFillColorUsesTintColor:(BOOL)a3
{
  self->_fillColorUsesTintColor = a3;
  [(BKShapeView *)self _syncFillColor];
}

- (void)setStrokeColorUsesTintColor:(BOOL)a3
{
  self->_strokeColorUsesTintColor = a3;
  [(BKShapeView *)self _syncStrokeColor];
}

- (void)setIgnoresTintColorAlpha:(BOOL)a3
{
  self->_ignoresTintColorAlpha = a3;
  [(BKShapeView *)self _syncFillColor];

  [(BKShapeView *)self _syncStrokeColor];
}

- (void)tintColorDidChange
{
  [(BKShapeView *)self _syncFillColor];

  [(BKShapeView *)self _syncStrokeColor];
}

- (id)_tintColorToUse
{
  unsigned int v3 = [(BKShapeView *)self ignoresTintColorAlpha];
  id v4 = [(BKShapeView *)self tintColor];
  id v5 = v4;
  if (v3)
  {
    uint64_t v6 = [v4 colorWithAlphaComponent:1.0];

    id v5 = (void *)v6;
  }

  return v5;
}

- (void)_syncStrokeColor
{
  if ([(BKShapeView *)self strokeColorUsesTintColor])
  {
    id v3 = [(BKShapeView *)self _tintColorToUse];
    [(BKShapeView *)self setStrokeColor:v3];
  }
}

- (void)_syncFillColor
{
  if ([(BKShapeView *)self fillColorUsesTintColor])
  {
    id v3 = [(BKShapeView *)self _tintColorToUse];
    [(BKShapeView *)self setFillColor:v3];
  }
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (BOOL)fillColorUsesTintColor
{
  return self->_fillColorUsesTintColor;
}

- (BOOL)strokeColorUsesTintColor
{
  return self->_strokeColorUsesTintColor;
}

- (BOOL)ignoresTintColorAlpha
{
  return self->_ignoresTintColorAlpha;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeColor, 0);

  objc_storeStrong((id *)&self->_fillColor, 0);
}

@end