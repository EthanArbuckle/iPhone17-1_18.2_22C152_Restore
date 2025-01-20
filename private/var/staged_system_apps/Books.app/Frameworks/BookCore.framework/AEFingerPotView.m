@interface AEFingerPotView
- (AEFingerPotView)initWithFrame:(CGRect)a3;
- (UIImage)menuImage;
- (UIImageView)highlight;
- (UIImageView)selectedOutline;
- (UIPointerInteraction)pointerInteraction;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)layoutSubviews;
- (void)setHighlight:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setMenuImage:(id)a3;
- (void)setPointerInteraction:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectedOutline:(id)a3;
@end

@implementation AEFingerPotView

- (AEFingerPotView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AEFingerPotView;
  v3 = -[AEFingerPotView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(AEFingerPotView *)v3 setAdjustsImageWhenHighlighted:0];
    [(AEFingerPotView *)v4 setShowsTouchWhenHighlighted:0];
    v5 = (UIPointerInteraction *)[objc_alloc((Class)UIPointerInteraction) initWithDelegate:v4];
    pointerInteraction = v4->_pointerInteraction;
    v4->_pointerInteraction = v5;

    [(AEFingerPotView *)v4 addInteraction:v4->_pointerInteraction];
  }
  return v4;
}

- (UIImage)menuImage
{
  return (UIImage *)[(AEFingerPotView *)self backgroundImageForState:0];
}

- (void)setMenuImage:(id)a3
{
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AEFingerPotView *)self isSelected] != a3)
  {
    v15.receiver = self;
    v15.super_class = (Class)AEFingerPotView;
    [(AEFingerPotView *)&v15 setSelected:v3];
    if (v3)
    {
      v5 = [(AEFingerPotView *)self selectedOutline];

      if (!v5)
      {
        id v6 = objc_alloc((Class)UIImageView);
        v7 = IMCommonCoreBundle();
        objc_super v8 = +[UIImage imageNamed:@"ib_text_pop_icon_highlight_swatch_selection" inBundle:v7];
        id v9 = [v6 initWithImage:v8];
        [(AEFingerPotView *)self setSelectedOutline:v9];

        v10 = [(AEFingerPotView *)self selectedOutline];
        [v10 setContentMode:4];

        v11 = [(AEFingerPotView *)self selectedOutline];
        [(AEFingerPotView *)self addSubview:v11];

        v12 = [(AEFingerPotView *)self highlight];

        if (v12)
        {
          v13 = [(AEFingerPotView *)self highlight];
          [(AEFingerPotView *)self bringSubviewToFront:v13];
        }
      }
    }
    v14 = [(AEFingerPotView *)self selectedOutline];
    [v14 setHidden:v3 ^ 1];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AEFingerPotView *)self isHighlighted] != a3)
  {
    v16.receiver = self;
    v16.super_class = (Class)AEFingerPotView;
    [(AEFingerPotView *)&v16 setHighlighted:v3];
    v5 = [(AEFingerPotView *)self highlight];

    if (v5)
    {
      if (v3)
      {
LABEL_4:
        id v6 = [(AEFingerPotView *)self highlight];
        [v6 setAlpha:1.0];

        return;
      }
    }
    else
    {
      id v7 = objc_alloc((Class)UIImageView);
      objc_super v8 = IMCommonCoreBundle();
      id v9 = [(AEFingerPotView *)self traitCollection];
      v10 = +[UIImage imageNamed:@"FingerPot_Pressed" inBundle:v8 compatibleWithTraitCollection:v9];
      id v11 = [v7 initWithImage:v10];
      [(AEFingerPotView *)self setHighlight:v11];

      v12 = [(AEFingerPotView *)self highlight];
      [v12 setOpaque:0];

      v13 = [(AEFingerPotView *)self highlight];
      [v13 setAlpha:0.0];

      v14 = [(AEFingerPotView *)self highlight];
      [(AEFingerPotView *)self addSubview:v14];

      if (v3) {
        goto LABEL_4;
      }
    }
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_13E658;
    v15[3] = &unk_2C3C50;
    v15[4] = self;
    +[UIView animateWithDuration:v15 animations:0.25];
  }
}

- (void)layoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)AEFingerPotView;
  [(AEFingerPotView *)&v26 layoutSubviews];
  BOOL v3 = [(AEFingerPotView *)self imageForState:1];

  [(AEFingerPotView *)self bounds];
  -[AEFingerPotView contentRectForBounds:](self, "contentRectForBounds:");
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  if (v3)
  {
    -[AEFingerPotView imageRectForContentRect:](self, "imageRectForContentRect:", v4, v5, v6, v7);
    double v8 = v12;
    double v9 = v13;
    double v10 = v14;
    double v11 = v15;
  }
  objc_super v16 = [(AEFingerPotView *)self selectedOutline];
  [v16 setFrame:v8, v9, v10, v11];

  v27.origin.double x = v8;
  v27.origin.double y = v9;
  v27.size.double width = v10;
  v27.size.double height = v11;
  double MidX = CGRectGetMidX(v27);
  v28.origin.double x = v8;
  v28.origin.double y = v9;
  v28.size.double width = v10;
  v28.size.double height = v11;
  double MidY = CGRectGetMidY(v28);
  v19 = [(AEFingerPotView *)self highlight];
  [v19 setCenter:MidX, MidY];

  v20 = [(AEFingerPotView *)self highlight];
  [v20 frame];
  CGRect v30 = CGRectIntegral(v29);
  double x = v30.origin.x;
  double y = v30.origin.y;
  double width = v30.size.width;
  double height = v30.size.height;
  v25 = [(AEFingerPotView *)self highlight];
  [v25 setFrame:CGRectMake(x, y, width, height)];
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v5 = a5;

  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = [objc_alloc((Class)UITargetedPreview) initWithView:self];
  double v6 = +[UIPointerHighlightEffect effectWithPreview:v5];
  [(AEFingerPotView *)self bounds];
  double v8 = v7;
  double v10 = v9 - 6.0;
  double v12 = v11 + 0.0;
  double v14 = v13 - (-6.0 - 6.0);
  double v15 = [(AEFingerPotView *)self superview];
  -[AEFingerPotView convertRect:toView:](self, "convertRect:toView:", v15, v10, v12, v14, v8);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  v24 = +[UIPointerShape shapeWithRoundedRect:](UIPointerShape, "shapeWithRoundedRect:", v17, v19, v21, v23);
  v25 = +[UIPointerStyle styleWithEffect:v6 shape:v24];

  return v25;
}

- (UIImageView)selectedOutline
{
  return self->_selectedOutline;
}

- (void)setSelectedOutline:(id)a3
{
}

- (UIImageView)highlight
{
  return self->_highlight;
}

- (void)setHighlight:(id)a3
{
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setPointerInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_highlight, 0);

  objc_storeStrong((id *)&self->_selectedOutline, 0);
}

@end