@interface _TVRMatchPointArtworkView
- (BOOL)touchLocationIsConsideredCenter:(CGPoint)a3;
- (_TVRMatchPointArtworkView)initWithFrame:(CGRect)a3;
- (void)highlightForButtonType:(int64_t)a3 enabled:(BOOL)a4;
- (void)layoutSubviews;
@end

@implementation _TVRMatchPointArtworkView

- (_TVRMatchPointArtworkView)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)_TVRMatchPointArtworkView;
  v3 = -[_TVRMatchPointArtworkView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(_TVRMatchPointArtworkView *)v3 setUserInteractionEnabled:0];
    v5 = [(_TVRMatchPointArtworkView *)v4 layer];
    [v5 setAllowsGroupBlending:0];

    uint64_t v6 = _TVRMakeDirectionalImageView(@"DirectionalControlArrowUp");
    upImageView = v4->_upImageView;
    v4->_upImageView = (UIImageView *)v6;

    uint64_t v8 = _TVRMakeDirectionalImageView(@"DirectionalControlArrowRight");
    rightImageView = v4->_rightImageView;
    v4->_rightImageView = (UIImageView *)v8;

    uint64_t v10 = _TVRMakeDirectionalImageView(@"DirectionalControlArrowDown");
    downImageView = v4->_downImageView;
    v4->_downImageView = (UIImageView *)v10;

    uint64_t v12 = _TVRMakeDirectionalImageView(@"DirectionalControlArrowLeft");
    leftImageView = v4->_leftImageView;
    v4->_leftImageView = (UIImageView *)v12;

    [(_TVRMatchPointArtworkView *)v4 addSubview:v4->_upImageView];
    [(_TVRMatchPointArtworkView *)v4 addSubview:v4->_rightImageView];
    [(_TVRMatchPointArtworkView *)v4 addSubview:v4->_downImageView];
    [(_TVRMatchPointArtworkView *)v4 addSubview:v4->_leftImageView];
    v14 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    selectIndicator = v4->_selectIndicator;
    v4->_selectIndicator = v14;

    [(UIView *)v4->_selectIndicator _setContinuousCornerRadius:24.0];
    v16 = v4->_selectIndicator;
    v17 = [MEMORY[0x263F825C8] whiteColor];
    [(UIView *)v16 setBackgroundColor:v17];

    [(UIView *)v4->_selectIndicator setAlpha:0.24];
    v18 = [(UIView *)v4->_selectIndicator layer];
    v19 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D58]];
    [v18 setCompositingFilter:v19];

    [(_TVRMatchPointArtworkView *)v4 addSubview:v4->_selectIndicator];
  }
  return v4;
}

- (void)highlightForButtonType:(int64_t)a3 enabled:(BOOL)a4
{
  switch(a3)
  {
    case 12:
      v4 = &OBJC_IVAR____TVRMatchPointArtworkView__upImageView;
      goto LABEL_8;
    case 13:
      v4 = &OBJC_IVAR____TVRMatchPointArtworkView__downImageView;
      goto LABEL_8;
    case 14:
      v4 = &OBJC_IVAR____TVRMatchPointArtworkView__leftImageView;
      goto LABEL_8;
    case 15:
      v4 = &OBJC_IVAR____TVRMatchPointArtworkView__rightImageView;
      goto LABEL_8;
    default:
      if (a3 != 1) {
        return;
      }
      v4 = &OBJC_IVAR____TVRMatchPointArtworkView__selectIndicator;
LABEL_8:
      v5 = *(Class *)((char *)&self->super.super.super.isa + *v4);
      double v6 = 0.24;
      if (a4) {
        double v6 = 0.65;
      }
      [v5 setAlpha:v6];
      return;
  }
}

- (void)layoutSubviews
{
  [(_TVRMatchPointArtworkView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(_TVRMatchPointArtworkView *)self superview];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v11 contentInsets];
    double v4 = v4 + v12;
    double v6 = v6 + v13;
    double v8 = v8 - (v12 + v14);
    double v10 = v10 - (v13 + v15);
  }
  selectIndicator = self->_selectIndicator;
  UIRectCenteredIntegralRect();
  -[UIView setFrame:](selectIndicator, "setFrame:");
  [(UIImageView *)self->_upImageView setFrame:_TVRImageFrameForDirectionalImage(self->_upImageView, 1, v4, v6, v8, v10)];
  [(UIImageView *)self->_rightImageView setFrame:_TVRImageFrameForDirectionalImage(self->_rightImageView, 8, v4, v6, v8, v10)];
  [(UIImageView *)self->_downImageView setFrame:_TVRImageFrameForDirectionalImage(self->_downImageView, 4, v4, v6, v8, v10)];
  [(UIImageView *)self->_leftImageView setFrame:_TVRImageFrameForDirectionalImage(self->_leftImageView, 2, v4, v6, v8, v10)];
  v17.receiver = self;
  v17.super_class = (Class)_TVRMatchPointArtworkView;
  [(_TVRMatchPointArtworkView *)&v17 layoutSubviews];
}

- (BOOL)touchLocationIsConsideredCenter:(CGPoint)a3
{
  [(_TVRMatchPointArtworkView *)self bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(UIView *)self->_selectIndicator bounds];
  CGFloat v12 = CGRectGetWidth(v24) + 20.0;
  [(UIView *)self->_selectIndicator bounds];
  CGFloat v13 = CGRectGetHeight(v25) + 20.0;
  v26.origin.CGFloat x = v5;
  v26.origin.CGFloat y = v7;
  v26.size.width = v9;
  v26.size.height = v11;
  CGFloat v14 = (CGRectGetWidth(v26) - v12) * 0.5;
  v27.origin.CGFloat x = v5;
  v27.origin.CGFloat y = v7;
  v27.size.width = v9;
  v27.size.height = v11;
  double v15 = (CGRectGetHeight(v27) - v13) * 0.5;
  CGFloat v16 = v14;
  CGFloat v17 = v12;
  CGFloat v18 = v13;
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  return CGRectContainsPoint(*(CGRect *)&v16, *(CGPoint *)&x);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leftImageView, 0);
  objc_storeStrong((id *)&self->_downImageView, 0);
  objc_storeStrong((id *)&self->_rightImageView, 0);
  objc_storeStrong((id *)&self->_upImageView, 0);
  objc_storeStrong((id *)&self->_selectIndicator, 0);
}

@end