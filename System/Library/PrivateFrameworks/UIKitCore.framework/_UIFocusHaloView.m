@interface _UIFocusHaloView
+ (BOOL)_supportsInvalidatingFocusCache;
- (BOOL)_isEligibleForFocusInteraction;
- (BOOL)geometryFrozen;
- (UIColor)gapColor;
- (UIColor)haloColor;
- (UITraitCollection)gapSourceTraitCollection;
- (_UIFocusHaloView)initWithFrame:(CGRect)a3;
- (_UIShape)shape;
- (_UIShapeView)gapView;
- (_UIShapeView)haloView;
- (_UIShapeView)maskViewWhenInside;
- (double)gapWidth;
- (double)thickness;
- (double)totalConsumedSpace;
- (id)description;
- (id)focusItemsInRect:(CGRect)a3;
- (id)resolvedGapColor;
- (int64_t)position;
- (void)_updateGapColor;
- (void)_updateHalo;
- (void)_updateHaloForCurrentUserInterfaceStyle;
- (void)didMoveToSuperview;
- (void)setBounds:(CGRect)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setFrame:(CGRect)a3;
- (void)setGapColor:(id)a3;
- (void)setGapSourceTraitCollection:(id)a3;
- (void)setGapView:(id)a3;
- (void)setGapWidth:(double)a3;
- (void)setGeometryFrozen:(BOOL)a3;
- (void)setHaloView:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setMaskViewWhenInside:(id)a3;
- (void)setPosition:(int64_t)a3;
- (void)setShape:(id)a3;
- (void)setThickness:(double)a3;
- (void)tintColorDidChange;
@end

@implementation _UIFocusHaloView

- (_UIFocusHaloView)initWithFrame:(CGRect)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)_UIFocusHaloView;
  v3 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIView *)v3 setUserInteractionEnabled:0];
    v5 = [(UIView *)v4 layer];
    [v5 setAllowsHitTesting:0];

    [(_UIFocusHaloView *)v4 setThickness:3.0];
    [(_UIFocusHaloView *)v4 setGapWidth:1.0];
    v6 = +[UIColor systemBackgroundColor];
    [(_UIFocusHaloView *)v4 setGapColor:v6];

    v7 = self;
    v12[0] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    id v9 = [(UIView *)v4 registerForTraitChanges:v8 withAction:sel__updateHaloForCurrentUserInterfaceStyle];
  }
  return v4;
}

- (void)setShape:(id)a3
{
  id v6 = a3;
  if (([v6 isEqual:self->_shape] & 1) == 0)
  {
    v4 = (_UIShape *)[v6 copy];
    shape = self->_shape;
    self->_shape = v4;

    [(_UIFocusHaloView *)self _updateHalo];
  }
}

- (void)setPosition:(int64_t)a3
{
  if (self->_position != a3)
  {
    self->_position = a3;
    [(_UIFocusHaloView *)self _updateHalo];
  }
}

- (BOOL)_isEligibleForFocusInteraction
{
  return 0;
}

- (id)focusItemsInRect:(CGRect)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (BOOL)_supportsInvalidatingFocusCache
{
  return 1;
}

- (void)_updateHaloForCurrentUserInterfaceStyle
{
  [(_UIFocusHaloView *)self _updateGapColor];
  id v3 = [(_UIFocusHaloView *)self haloColor];
  uint64_t v4 = [v3 CGColor];
  v5 = [(_UIFocusHaloView *)self haloView];
  id v6 = [v5 shapeLayer];
  [v6 setStrokeColor:v4];

  id v10 = [(_UIFocusHaloView *)self resolvedGapColor];
  uint64_t v7 = [v10 CGColor];
  v8 = [(_UIFocusHaloView *)self gapView];
  id v9 = [v8 shapeLayer];
  [v9 setStrokeColor:v7];
}

- (void)_updateHalo
{
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v64 = [(_UIFocusHaloView *)self shape];
  objc_super v11 = [v64 zeroOriginShape];
  id v12 = [v11 outline];
  uint64_t v13 = [v12 CGPath];

  [(_UIFocusHaloView *)self thickness];
  double v15 = v14 + v14;
  if (![(_UIFocusHaloView *)self position])
  {
    [(_UIFocusHaloView *)self gapWidth];
    double v15 = v15 + v16 + v16;
  }
  v17 = [(_UIFocusHaloView *)self haloView];
  if (!v17)
  {
    v17 = -[UIView initWithFrame:]([_UIShapeView alloc], "initWithFrame:", v4, v6, v8, v10);
    uint64_t v18 = *MEMORY[0x1E4F3A478];
    v19 = [(_UIShapeView *)v17 shapeLayer];
    [v19 setLineJoin:v18];

    uint64_t v20 = *MEMORY[0x1E4F3A458];
    v21 = [(_UIShapeView *)v17 shapeLayer];
    [v21 setLineCap:v20];

    v22 = [(_UIShapeView *)v17 shapeLayer];
    [v22 setAllowsEdgeAntialiasing:1];

    [(UIView *)self addSubview:v17];
    [(_UIFocusHaloView *)self setHaloView:v17];
  }
  v23 = [(_UIShapeView *)v17 shapeLayer];
  [v23 setFillColor:0];

  id v24 = [(_UIFocusHaloView *)self haloColor];
  uint64_t v25 = [v24 CGColor];
  v26 = [(_UIShapeView *)v17 shapeLayer];
  [v26 setStrokeColor:v25];

  v27 = [(_UIShapeView *)v17 shapeLayer];
  [v27 setLineWidth:v15];

  v28 = [(_UIShapeView *)v17 shapeLayer];
  [v28 setPath:v13];

  v29 = [(_UIFocusHaloView *)self gapView];
  if (!v29)
  {
    v29 = -[UIView initWithFrame:]([_UIShapeView alloc], "initWithFrame:", v4, v6, v8, v10);
    uint64_t v30 = *MEMORY[0x1E4F3A478];
    v31 = [(_UIShapeView *)v29 shapeLayer];
    [v31 setLineJoin:v30];

    uint64_t v32 = *MEMORY[0x1E4F3A458];
    v33 = [(_UIShapeView *)v29 shapeLayer];
    [v33 setLineCap:v32];

    v34 = [(_UIShapeView *)v29 shapeLayer];
    [v34 setAllowsEdgeAntialiasing:1];

    [(UIView *)self addSubview:v29];
    [(_UIFocusHaloView *)self setGapView:v29];
  }
  v35 = [(_UIShapeView *)v29 shapeLayer];
  [v35 setPath:v13];

  if ([(_UIFocusHaloView *)self position])
  {
    v36 = [(_UIShapeView *)v29 shapeLayer];
    [v36 setFillColor:0];

    id v37 = [(_UIFocusHaloView *)self resolvedGapColor];
    uint64_t v38 = [v37 CGColor];
    v39 = [(_UIShapeView *)v29 shapeLayer];
    [v39 setStrokeColor:v38];

    [(_UIFocusHaloView *)self gapWidth];
    double v41 = v15 + v40 + v40;
    v42 = [(_UIShapeView *)v29 shapeLayer];
    [v42 setLineWidth:v41];

    v43 = [(_UIShapeView *)v29 shapeLayer];
    [v43 setCompositingFilter:0];

    [(UIView *)self sendSubviewToBack:v29];
    v44 = [(_UIFocusHaloView *)self maskViewWhenInside];

    if (!v44)
    {
      v45 = -[UIView initWithFrame:]([_UIShapeView alloc], "initWithFrame:", v4, v6, v8, v10);
      [(_UIFocusHaloView *)self setMaskViewWhenInside:v45];

      id v46 = +[UIColor blackColor];
      uint64_t v47 = [v46 CGColor];
      v48 = [(_UIFocusHaloView *)self maskViewWhenInside];
      v49 = [v48 shapeLayer];
      [v49 setFillColor:v47];

      v50 = [(_UIFocusHaloView *)self maskViewWhenInside];
      v51 = [v50 shapeLayer];
      [v51 setAllowsEdgeAntialiasing:1];
    }
    v52 = [(_UIFocusHaloView *)self maskViewWhenInside];
    v53 = [v52 shapeLayer];
    [v53 setPath:v13];

    v54 = [(_UIFocusHaloView *)self maskViewWhenInside];
    [(UIView *)self setMaskView:v54];
  }
  else
  {
    id v55 = +[UIColor blackColor];
    uint64_t v56 = [v55 CGColor];

    v57 = [(_UIShapeView *)v29 shapeLayer];
    [v57 setFillColor:v56];

    v58 = [(_UIShapeView *)v29 shapeLayer];
    [v58 setStrokeColor:v56];

    [(_UIFocusHaloView *)self gapWidth];
    double v60 = v59 + v59;
    v61 = [(_UIShapeView *)v29 shapeLayer];
    [v61 setLineWidth:v60];

    uint64_t v62 = *MEMORY[0x1E4F3A098];
    v63 = [(_UIShapeView *)v29 shapeLayer];
    [v63 setCompositingFilter:v62];

    [(UIView *)self bringSubviewToFront:v29];
    [(UIView *)self setMaskView:0];
  }
}

- (double)totalConsumedSpace
{
  [(_UIFocusHaloView *)self thickness];
  double v4 = v3;
  [(_UIFocusHaloView *)self gapWidth];
  return v4 + v5 + v4 + v5;
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)_UIFocusHaloView;
  [(UIView *)&v3 didMoveToSuperview];
  [(_UIFocusHaloView *)self _updateGapColor];
}

- (void)tintColorDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)_UIFocusHaloView;
  [(UIView *)&v7 tintColorDidChange];
  id v3 = [(_UIFocusHaloView *)self haloColor];
  uint64_t v4 = [v3 CGColor];
  double v5 = [(_UIFocusHaloView *)self haloView];
  double v6 = [v5 shapeLayer];
  [v6 setStrokeColor:v4];
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(_UIFocusHaloView *)self geometryFrozen])
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIFocusHaloView;
    [(UIView *)&v5 setHidden:v3];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (![(_UIFocusHaloView *)self geometryFrozen])
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIFocusHaloView;
    -[UIView setFrame:](&v8, sel_setFrame_, x, y, width, height);
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (![(_UIFocusHaloView *)self geometryFrozen])
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIFocusHaloView;
    -[UIView setBounds:](&v8, sel_setBounds_, x, y, width, height);
  }
}

- (void)setCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (![(_UIFocusHaloView *)self geometryFrozen])
  {
    v6.receiver = self;
    v6.super_class = (Class)_UIFocusHaloView;
    -[UIView setCenter:](&v6, sel_setCenter_, x, y);
  }
}

- (void)setThickness:(double)a3
{
  if (vabdd_f64(a3, self->_thickness) > 2.22044605e-16)
  {
    self->_thickness = a3;
    [(_UIFocusHaloView *)self _updateHalo];
  }
}

- (void)setGapWidth:(double)a3
{
  if (vabdd_f64(a3, self->_gapWidth) > 2.22044605e-16)
  {
    self->_gapWidth = a3;
    [(_UIFocusHaloView *)self _updateHalo];
  }
}

- (UIColor)haloColor
{
  BOOL v3 = [(UIView *)self traitCollection];
  uint64_t v4 = [(UIView *)self tintColor];
  objc_super v5 = [v4 resolvedColorWithTraitCollection:v3];

  return (UIColor *)v5;
}

- (id)resolvedGapColor
{
  BOOL v3 = [(_UIFocusHaloView *)self gapSourceTraitCollection];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(UIView *)self traitCollection];
  }
  objc_super v6 = v5;

  objc_super v7 = [(_UIFocusHaloView *)self gapColor];
  objc_super v8 = [v7 resolvedColorWithTraitCollection:v6];

  return v8;
}

- (void)_updateGapColor
{
  BOOL v3 = [(UIView *)self superview];
  if (v3)
  {
    v17 = v3;
    if ([(_UIFocusHaloView *)self position] == 1)
    {
      uint64_t v4 = v17;
      while (1)
      {
        uint64_t v18 = v4;
        id v5 = [(UIView *)v4 backgroundColor];
        char v6 = [v5 _isOpaque];

        if (v6) {
          break;
        }
        uint64_t v4 = v18;
        if ((*(void *)&v18->super._viewFlags & 0x80000000) == 0)
        {
          uint64_t v7 = [(UIView *)v18 superview];

          uint64_t v4 = (_UIFocusHaloView *)v7;
          if (v7) {
            continue;
          }
        }
        goto LABEL_9;
      }
      uint64_t v4 = v18;
LABEL_9:
      v17 = v4;
      objc_super v8 = [(UIView *)v4 backgroundColor];
      int v9 = [v8 _isOpaque];

      if (v9)
      {
        double v10 = [(UIView *)v17 backgroundColor];
        objc_super v11 = v17;
      }
      else
      {
        double v10 = +[UIColor clearColor];
        objc_super v11 = self;
      }
      [(_UIFocusHaloView *)self setGapColor:v10];

      id v12 = [(UIView *)v11 traitCollection];
      [(_UIFocusHaloView *)self setGapSourceTraitCollection:v12];

      id v13 = [(_UIFocusHaloView *)self resolvedGapColor];
      uint64_t v14 = [v13 CGColor];
      double v15 = [(_UIFocusHaloView *)self gapView];
      double v16 = [v15 shapeLayer];
      [v16 setStrokeColor:v14];
    }
    BOOL v3 = v17;
  }
}

- (id)description
{
  if (os_variant_has_internal_diagnostics())
  {
    v10.receiver = self;
    v10.super_class = (Class)_UIFocusHaloView;
    id v5 = [(UIView *)&v10 description];
    BOOL v3 = (void *)[v5 mutableCopy];

    objc_msgSend(v3, "replaceCharactersInRange:withString:", objc_msgSend(v3, "length") - 1, 1, @"; ");
    char v6 = NSString;
    uint64_t v7 = [(_UIFocusHaloView *)self shape];
    objc_super v8 = [v6 stringWithFormat:@"shape = %@ ", v7];;
    [v3 appendString:v8];

    [(_UIFocusHaloView *)self position];
    [v3 appendString:@"position = outside; "];
    if ([(_UIFocusHaloView *)self geometryFrozen]) {
      [v3 appendString:@"geometryFrozen = YES; "];
    }
    [v3 appendString:@">"];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_UIFocusHaloView;
    BOOL v3 = [(UIView *)&v9 description];
  }
  return v3;
}

- (_UIShape)shape
{
  return self->_shape;
}

- (int64_t)position
{
  return self->_position;
}

- (double)thickness
{
  return self->_thickness;
}

- (double)gapWidth
{
  return self->_gapWidth;
}

- (BOOL)geometryFrozen
{
  return self->_geometryFrozen;
}

- (void)setGeometryFrozen:(BOOL)a3
{
  self->_geometryFrozen = a3;
}

- (_UIShapeView)haloView
{
  return self->_haloView;
}

- (void)setHaloView:(id)a3
{
}

- (_UIShapeView)gapView
{
  return self->_gapView;
}

- (void)setGapView:(id)a3
{
}

- (_UIShapeView)maskViewWhenInside
{
  return self->_maskViewWhenInside;
}

- (void)setMaskViewWhenInside:(id)a3
{
}

- (UIColor)gapColor
{
  return self->_gapColor;
}

- (void)setGapColor:(id)a3
{
}

- (UITraitCollection)gapSourceTraitCollection
{
  return self->_gapSourceTraitCollection;
}

- (void)setGapSourceTraitCollection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gapSourceTraitCollection, 0);
  objc_storeStrong((id *)&self->_gapColor, 0);
  objc_storeStrong((id *)&self->_maskViewWhenInside, 0);
  objc_storeStrong((id *)&self->_gapView, 0);
  objc_storeStrong((id *)&self->_haloView, 0);
  objc_storeStrong((id *)&self->_shape, 0);
}

@end