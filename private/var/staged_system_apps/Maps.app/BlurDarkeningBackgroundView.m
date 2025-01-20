@interface BlurDarkeningBackgroundView
+ (id)_topFilterLayerBackgroundColor;
- (BOOL)animatingLayers;
- (BlurDarkeningBackgroundView)initWithFrame:(CGRect)a3;
- (id)_roundedCornersResizableImageWithColor:(id)a3;
- (int64_t)appearance;
- (int64_t)roundedCornersStyle;
- (void)_applyAppearance;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setAnimatingLayers:(BOOL)a3;
- (void)setAppearance:(int64_t)a3;
- (void)setRoundedCornersStyle:(int64_t)a3;
@end

@implementation BlurDarkeningBackgroundView

+ (id)_topFilterLayerBackgroundColor
{
  return +[UIColor colorWithRed:0.0 green:0.0 blue:0.313725501 alpha:0.0299999993];
}

- (BlurDarkeningBackgroundView)initWithFrame:(CGRect)a3
{
  v27.receiver = self;
  v27.super_class = (Class)BlurDarkeningBackgroundView;
  v3 = -[BlurDarkeningBackgroundView initWithFrame:](&v27, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(BlurDarkeningBackgroundView *)v3 setUserInteractionEnabled:0];
    id v5 = objc_alloc((Class)UIImageView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v9 = [v5 initWithFrame:CGRectZero.origin.x, y, width, height];
    bottomFilterView = v4->_bottomFilterView;
    v4->_bottomFilterView = v9;

    [(UIImageView *)v4->_bottomFilterView setOpaque:0];
    [(BlurDarkeningBackgroundView *)v4 addSubview:v4->_bottomFilterView];
    v11 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, y, width, height];
    topFilterView = v4->_topFilterView;
    v4->_topFilterView = v11;

    [(UIImageView *)v4->_topFilterView setOpaque:0];
    [(BlurDarkeningBackgroundView *)v4 addSubview:v4->_topFilterView];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v13 = [(BlurDarkeningBackgroundView *)v4 layer];
    v28[0] = v13;
    v14 = [(UIImageView *)v4->_bottomFilterView layer];
    v28[1] = v14;
    v15 = [(UIImageView *)v4->_topFilterView layer];
    v28[2] = v15;
    v16 = +[NSArray arrayWithObjects:v28 count:3];

    id v17 = [v16 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v24;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          [v21 setAllowsGroupOpacity:0];
          [v21 setAllowsGroupBlending:0];
        }
        id v18 = [v16 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v18);
    }

    [(BlurDarkeningBackgroundView *)v4 _applyAppearance];
  }
  return v4;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)BlurDarkeningBackgroundView;
  [(BlurDarkeningBackgroundView *)&v3 layoutSubviews];
  if (![(BlurDarkeningBackgroundView *)self animatingLayers])
  {
    [(BlurDarkeningBackgroundView *)self bounds];
    -[UIImageView setFrame:](self->_bottomFilterView, "setFrame:");
    [(BlurDarkeningBackgroundView *)self bounds];
    -[UIImageView setFrame:](self->_topFilterView, "setFrame:");
  }
}

- (void)setRoundedCornersStyle:(int64_t)a3
{
  if (self->_roundedCornersStyle != a3)
  {
    self->_roundedCornersStyle = a3;
    v4 = [(BlurDarkeningBackgroundView *)self window];

    if (v4)
    {
      [(BlurDarkeningBackgroundView *)self _maps_setNeedsUpdateWithSelector:"_applyAppearance"];
    }
  }
}

- (void)setAppearance:(int64_t)a3
{
  if (self->_appearance != a3)
  {
    self->_appearance = a3;
    v4 = [(BlurDarkeningBackgroundView *)self window];

    if (v4)
    {
      [(BlurDarkeningBackgroundView *)self _applyAppearance];
    }
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)BlurDarkeningBackgroundView;
  [(BlurDarkeningBackgroundView *)&v3 didMoveToWindow];
  [(BlurDarkeningBackgroundView *)self _applyAppearance];
}

- (void)_applyAppearance
{
  [(BlurDarkeningBackgroundView *)self _maps_setNeedsUpdate:0 withSelector:a2];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10083DC2C;
  v4[3] = &unk_1012E5D08;
  v4[4] = self;
  objc_super v3 = objc_retainBlock(v4);
  if (+[UIView _maps_shouldAdoptImplicitAnimationParameters])
  {
    +[UIView transitionWithView:self duration:0 options:v3 animations:0 completion:0.0];
  }
  else
  {
    ((void (*)(void *))v3[2])(v3);
  }
}

- (id)_roundedCornersResizableImageWithColor:(id)a3
{
  double scale = self->_scale;
  id v4 = a3;
  v10.double width = 13.0;
  v10.double height = 13.0;
  UIGraphicsBeginImageContextWithOptions(v10, 0, scale);
  [v4 setFill];

  id v5 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", CGPointZero.x, CGPointZero.y, 13.0, 13.0, 5.0);
  [v5 fill];

  v6 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  v7 = [v6 resizableImageWithCapInsets:6.0, 6.0, 6.0, 6.0];

  return v7;
}

- (int64_t)appearance
{
  return self->_appearance;
}

- (int64_t)roundedCornersStyle
{
  return self->_roundedCornersStyle;
}

- (BOOL)animatingLayers
{
  return self->_animatingLayers;
}

- (void)setAnimatingLayers:(BOOL)a3
{
  self->_animatingLayers = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomFilterView, 0);

  objc_storeStrong((id *)&self->_topFilterView, 0);
}

@end