@interface UIFocusHaloEffect
+ (UIFocusHaloEffect)effectWithPath:(UIBezierPath *)bezierPath;
+ (UIFocusHaloEffect)effectWithRect:(CGRect)rect;
+ (UIFocusHaloEffect)effectWithRoundedRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius curve:(CALayerCornerCurve)curve;
+ (id)_effectWithUIShape:(id)a3;
- (BOOL)isEqual:(id)a3;
- (UICoordinateSpace)_shapeCoordinateSpace;
- (UIFocusHaloEffectPosition)position;
- (UIView)containerView;
- (UIView)referenceView;
- (_UIShape)_shape;
- (id)_resolvedEffectForItem:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setContainerView:(UIView *)containerView;
- (void)setPosition:(UIFocusHaloEffectPosition)position;
- (void)setReferenceView:(UIView *)referenceView;
@end

@implementation UIFocusHaloEffect

- (void)setReferenceView:(UIView *)referenceView
{
}

+ (UIFocusHaloEffect)effectWithRoundedRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius curve:(CALayerCornerCurve)curve
{
  v6 = +[_UIShape shapeWithRoundedRect:cornerRadius:cornerCurve:](_UIShape, "shapeWithRoundedRect:cornerRadius:cornerCurve:", curve, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, cornerRadius);
  v7 = [a1 _effectWithUIShape:v6];

  return (UIFocusHaloEffect *)v7;
}

+ (id)_effectWithUIShape:(id)a3
{
  id v4 = a3;
  v5 = [a1 effect];
  v6 = (void *)v5[5];
  v5[5] = v4;

  return v5;
}

- (void)setPosition:(UIFocusHaloEffectPosition)position
{
  self->_position = position;
}

+ (UIFocusHaloEffect)effectWithRect:(CGRect)rect
{
  return +[UIFocusHaloEffect effectWithRoundedRect:cornerRadius:curve:](UIFocusHaloEffect, "effectWithRoundedRect:cornerRadius:curve:", *MEMORY[0x1E4F39EA0], rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, 0.0);
}

+ (UIFocusHaloEffect)effectWithPath:(UIBezierPath *)bezierPath
{
  id v4 = +[_UIShape shapeWithPath:bezierPath];
  v5 = [a1 _effectWithUIShape:v4];

  return (UIFocusHaloEffect *)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UIFocusHaloEffect *)a3;
  if (v4 == self)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(UIFocusHaloEffect *)v5 _shape];
      v7 = [(UIFocusHaloEffect *)self _shape];
      id v8 = v6;
      id v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {
      }
      else
      {
        LOBYTE(v11) = 0;
        v12 = v9;
        id v13 = v8;
        if (!v8 || !v9) {
          goto LABEL_26;
        }
        int v14 = [v8 isEqual:v9];

        if (!v14)
        {
          LOBYTE(v11) = 0;
LABEL_27:

          goto LABEL_28;
        }
      }
      v15 = [(UIFocusHaloEffect *)v5 containerView];
      v16 = [(UIFocusHaloEffect *)self containerView];
      id v13 = v15;
      id v17 = v16;
      v12 = v17;
      if (v13 == v17)
      {
      }
      else
      {
        LOBYTE(v11) = 0;
        v18 = v17;
        id v19 = v13;
        if (!v13 || !v17) {
          goto LABEL_25;
        }
        int v20 = [v13 isEqual:v17];

        if (!v20)
        {
          LOBYTE(v11) = 0;
LABEL_26:

          goto LABEL_27;
        }
      }
      v21 = [(UIFocusHaloEffect *)v5 referenceView];
      v22 = [(UIFocusHaloEffect *)self referenceView];
      id v19 = v21;
      id v23 = v22;
      v18 = v23;
      if (v19 == v23)
      {
      }
      else
      {
        if (!v19 || !v23)
        {

          LOBYTE(v11) = 0;
          goto LABEL_25;
        }
        LODWORD(v11) = [v19 isEqual:v23];

        if (!v11) {
          goto LABEL_25;
        }
      }
      uint64_t v11 = [(UIFocusHaloEffect *)v5 position];
      LOBYTE(v11) = v11 == [(UIFocusHaloEffect *)self position];
LABEL_25:

      goto LABEL_26;
    }
    LOBYTE(v11) = 0;
  }
LABEL_28:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)UIFocusHaloEffect;
  id v4 = [(UIFocusEffect *)&v10 copyWithZone:a3];
  uint64_t v5 = [(UIFocusHaloEffect *)self _shape];
  v6 = (void *)v4[5];
  v4[5] = v5;

  v7 = [(UIFocusHaloEffect *)self containerView];
  [v4 setContainerView:v7];

  id v8 = [(UIFocusHaloEffect *)self referenceView];
  [v4 setReferenceView:v8];

  objc_msgSend(v4, "setPosition:", -[UIFocusHaloEffect position](self, "position"));
  return v4;
}

- (id)_resolvedEffectForItem:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_flags)
  {
    id v9 = self;
  }
  else
  {
    uint64_t v5 = [(UIFocusHaloEffect *)self containerView];
    if (!v5)
    {
      _UIFocusEnvironmentContainingView(v4);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6 == v4)
      {
        id v8 = [v4 superview];
      }
      else
      {
        id v8 = v6;
      }
      uint64_t v5 = v8;
    }
    objc_super v10 = self->__shape;
    uint64_t v11 = self->__shapeCoordinateSpace;
    v12 = v11;
    if (v10)
    {
      if (!v11)
      {
        v12 = _UIFocusEnvironmentContainingView(v4);
      }
    }
    else
    {
      if (_IsKindOfUIView((uint64_t)v4))
      {
        id v13 = v4;
        [v13 bounds];
        double v15 = v14;
        double v17 = v16;
        double v19 = v18;
        double v21 = v20;
        [v13 _cornerRadius];
        double v23 = v22;
        v24 = [v13 _cornerCurve];
        +[_UIShape shapeWithRoundedRect:cornerRadius:cornerCurve:](_UIShape, "shapeWithRoundedRect:cornerRadius:cornerCurve:", v24, v15, v17, v19, v21, v23);
        objc_super v10 = (_UIShape *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        [v4 frame];
        +[_UIShape shapeWithRoundedRect:cornerRadius:cornerCurve:](_UIShape, "shapeWithRoundedRect:cornerRadius:cornerCurve:", *MEMORY[0x1E4F39EA0]);
        objc_super v10 = (_UIShape *)objc_claimAutoreleasedReturnValue();
        _UIParentCoordinateSpaceForFocusItem(v4);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
      }

      v12 = v13;
    }
    id v9 = (UIFocusHaloEffect *)[(UIFocusHaloEffect *)self copy];
    *(unsigned char *)&v9->_flags |= 1u;
    shape = v9->__shape;
    v9->__shape = v10;
    v26 = v10;

    shapeCoordinateSpace = v9->__shapeCoordinateSpace;
    v9->__shapeCoordinateSpace = (UICoordinateSpace *)v12;
    id v28 = v12;

    objc_storeWeak((id *)&v9->_containerView, v5);
  }

  return v9;
}

- (UIView)containerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
  return (UIView *)WeakRetained;
}

- (void)setContainerView:(UIView *)containerView
{
}

- (UIView)referenceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_referenceView);
  return (UIView *)WeakRetained;
}

- (UIFocusHaloEffectPosition)position
{
  return self->_position;
}

- (_UIShape)_shape
{
  return self->__shape;
}

- (UICoordinateSpace)_shapeCoordinateSpace
{
  return self->__shapeCoordinateSpace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__shapeCoordinateSpace, 0);
  objc_storeStrong((id *)&self->__shape, 0);
  objc_destroyWeak((id *)&self->_referenceView);
  objc_destroyWeak((id *)&self->_containerView);
}

@end