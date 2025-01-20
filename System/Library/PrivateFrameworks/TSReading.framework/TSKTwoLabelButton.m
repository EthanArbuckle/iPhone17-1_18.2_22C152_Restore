@interface TSKTwoLabelButton
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (UIColor)secondLabelTextColor;
- (UIImage)disabledStateImage;
- (UIImage)highlightedStateImage;
- (UIImage)normalStateImage;
- (UIImageView)imageView;
- (UILabel)secondLabel;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)dealloc;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)p_syncButtonState;
- (void)setDisabledStateImage:(id)a3;
- (void)setHighlightedStateImage:(id)a3;
- (void)setImageView:(id)a3;
- (void)setNormalStateImage:(id)a3;
- (void)setSecondLabel:(id)a3;
- (void)setSecondLabelTextColor:(id)a3;
@end

@implementation TSKTwoLabelButton

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSKTwoLabelButton;
  [(TSKTwoLabelButton *)&v3 dealloc];
}

- (void)p_syncButtonState
{
  uint64_t v3 = [(TSKTwoLabelButton *)self state];
  uint64_t v4 = [(TSKTwoLabelButton *)self titleColorForState:v3];
  uint64_t v5 = [(TSKTwoLabelButton *)self titleShadowColorForState:v3];
  v6 = [(UILabel *)[(TSKTwoLabelButton *)self secondLabel] font];
  [(UILabel *)self->mSecondLabel setShadowColor:v5];
  objc_msgSend((id)-[TSKTwoLabelButton titleLabel](self, "titleLabel"), "shadowOffset");
  -[UILabel setShadowOffset:](self->mSecondLabel, "setShadowOffset:");
  [(UILabel *)self->mSecondLabel setFont:v6];
  if (v3 == 1)
  {
    [(UILabel *)self->mSecondLabel setTextColor:v4];
    -[UILabel setShadowOffset:](self->mSecondLabel, "setShadowOffset:", 0.0, -1.0);
    mImageView = self->mImageView;
    if (!mImageView) {
      return;
    }
    v8 = &OBJC_IVAR___TSKTwoLabelButton_mHighlightedStateImage;
    goto LABEL_9;
  }
  if (self->mSecondLabelTextColor) {
    -[UILabel setTextColor:](self->mSecondLabel, "setTextColor:");
  }
  mImageView = self->mImageView;
  if (mImageView)
  {
    v8 = &OBJC_IVAR___TSKTwoLabelButton_mNormalStateImage;
    if (v3 == 2) {
      v8 = &OBJC_IVAR___TSKTwoLabelButton_mDisabledStateImage;
    }
LABEL_9:
    uint64_t v9 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + *v8);
    [(UIImageView *)mImageView setImage:v9];
  }
}

- (void)layoutSubviews
{
  v41[1] = *MEMORY[0x263EF8340];
  if (self->mImageView)
  {
    -[TSKTwoLabelButton addSubview:](self, "addSubview:");
    [(TSKTwoLabelButton *)self setContentHorizontalAlignment:1];
    [(TSKTwoLabelButton *)self setContentVerticalAlignment:1];
    CGFloat v37 = *(double *)(MEMORY[0x263F001A8] + 8);
    CGFloat v38 = *MEMORY[0x263F001A8];
    [(TSKTwoLabelButton *)self bounds];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    double v8 = v7;
    CGFloat v10 = v9;
    v11 = (void *)[(TSKTwoLabelButton *)self currentTitle];
    uint64_t v40 = *MEMORY[0x263F1C238];
    v41[0] = objc_msgSend((id)-[TSKTwoLabelButton titleLabel](self, "titleLabel"), "font");
    objc_msgSend(v11, "sizeWithAttributes:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v41, &v40, 1));
    double v13 = v12;
    double v33 = v12;
    double v15 = v14;
    [(UIImageView *)self->mImageView frame];
    double v34 = v17;
    CGFloat rect = v10;
    double v18 = v16;
    double v19 = v13 + 0.0 + v17;
    double v32 = v15;
    if (v15 <= v16) {
      CGFloat v20 = v16;
    }
    else {
      CGFloat v20 = v15;
    }
    CGFloat v36 = v6;
    v42.origin.double x = v4;
    v42.origin.double y = v6;
    v42.size.width = v8;
    v42.size.height = v10;
    double MidX = CGRectGetMidX(v42);
    v43.origin.double x = v4;
    v43.origin.double y = v6;
    v43.size.width = v8;
    v43.size.height = v10;
    double MidY = CGRectGetMidY(v43);
    v44.origin.double x = v38;
    v44.origin.double y = v37;
    v44.size.width = v19;
    v44.size.height = v20;
    double v22 = CGRectGetMidX(v44);
    v45.origin.double x = v38;
    v45.origin.double y = v37;
    v45.size.width = v19;
    v45.size.height = v20;
    CGFloat v23 = MidY - CGRectGetMidY(v45);
    v46.origin.double x = v38;
    v46.origin.double y = v37;
    v46.size.width = v19;
    v46.size.height = v20;
    CGRect v47 = CGRectOffset(v46, MidX - v22, v23);
    double y = v47.origin.y;
    if (v47.origin.x >= 0.0) {
      double x = v47.origin.x;
    }
    else {
      double x = 5.0;
    }
    double v26 = x;
    double v28 = v32;
    double v27 = v33;
    double v29 = CGRectGetMaxX(v47) + 0.0;
    v48.origin.double x = v29;
    v48.origin.double y = y + 1.0;
    v48.size.width = v34;
    v48.size.height = v18;
    double MaxX = CGRectGetMaxX(v48);
    v49.origin.double y = v36;
    v49.origin.double x = v4;
    v49.size.width = v8;
    v49.size.height = rect;
    if (MaxX > CGRectGetMaxX(v49) + -5.0) {
      double v29 = v8 - (v34 + 5.0);
    }
    -[TSKTwoLabelButton setTitleEdgeInsets:](self, "setTitleEdgeInsets:", y, x, 0.0, *(void *)&MidX);
    -[UIImageView setFrame:](self->mImageView, "setFrame:", v29, y + 1.0, v34, v18);
  }
  v39.receiver = self;
  v39.super_class = (Class)TSKTwoLabelButton;
  [(TSKTwoLabelButton *)&v39 layoutSubviews];
  [(TSKTwoLabelButton *)self p_syncButtonState];
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TSKTwoLabelButton;
  BOOL v5 = [(TSKTwoLabelButton *)&v7 beginTrackingWithTouch:a3 withEvent:a4];
  [(TSKTwoLabelButton *)self p_syncButtonState];
  return v5;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TSKTwoLabelButton;
  BOOL v5 = [(TSKTwoLabelButton *)&v7 continueTrackingWithTouch:a3 withEvent:a4];
  [(TSKTwoLabelButton *)self p_syncButtonState];
  return v5;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TSKTwoLabelButton;
  [(TSKTwoLabelButton *)&v5 endTrackingWithTouch:a3 withEvent:a4];
  [(TSKTwoLabelButton *)self p_syncButtonState];
}

- (void)cancelTrackingWithEvent:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSKTwoLabelButton;
  [(TSKTwoLabelButton *)&v4 cancelTrackingWithEvent:a3];
  [(TSKTwoLabelButton *)self p_syncButtonState];
}

- (UILabel)secondLabel
{
  return self->mSecondLabel;
}

- (void)setSecondLabel:(id)a3
{
}

- (UIImageView)imageView
{
  return self->mImageView;
}

- (void)setImageView:(id)a3
{
}

- (UIImage)normalStateImage
{
  return self->mNormalStateImage;
}

- (void)setNormalStateImage:(id)a3
{
}

- (UIImage)highlightedStateImage
{
  return self->mHighlightedStateImage;
}

- (void)setHighlightedStateImage:(id)a3
{
}

- (UIImage)disabledStateImage
{
  return self->mDisabledStateImage;
}

- (void)setDisabledStateImage:(id)a3
{
}

- (UIColor)secondLabelTextColor
{
  return self->mSecondLabelTextColor;
}

- (void)setSecondLabelTextColor:(id)a3
{
}

@end