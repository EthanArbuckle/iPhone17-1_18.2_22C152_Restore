@interface TPLCDView
+ (double)defaultLabelFontSize;
+ (double)defaultTextFontSize;
- (BOOL)shouldCenterContentView;
- (BOOL)shouldCenterText;
- (BOOL)verticallyCenterTextViewIfLabelless;
- (CGRect)_imageViewFrame;
- (CGRect)_labelFrame;
- (CGRect)_text1Frame;
- (CGRect)fullSizedContentViewFrame;
- (TPLCDView)initWithDefaultSizeForOrientation:(int64_t)a3;
- (double)_labelVInset;
- (double)_textVInset;
- (id)label;
- (id)secondLineText;
- (id)subImage;
- (id)text;
- (void)_resetContentViewFrame;
- (void)blinkLabel;
- (void)didFinishAnimatingLCDLabelFadeOut:(id)a3 finished:(id)a4 context:(id)a5;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setContentsAlpha:(double)a3;
- (void)setLabel:(id)a3;
- (void)setLabel:(id)a3 animate:(BOOL)a4;
- (void)setLabelFontSize:(double)a3;
- (void)setLayoutAsLabelled:(BOOL)a3;
- (void)setShadowColor:(id)a3;
- (void)setSubImage:(id)a3;
- (void)setText:(id)a3;
- (void)setTextFontSize:(double)a3;
- (void)setVerticallyCenterTextViewIfLabelless:(BOOL)a3;
@end

@implementation TPLCDView

- (CGRect)fullSizedContentViewFrame
{
  [(TPLCDView *)self bounds];
  double v3 = v2;
  double v5 = v4;
  v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;

  if (v8 >= v10) {
    double v8 = v10;
  }
  [(id)objc_opt_class() defaultHeightForOrientation:4];
  double v12 = v11;
  double v13 = floor((v3 - v8) * 0.5);
  double v14 = floor((v5 - v12) * 0.5);
  double v15 = v8;
  result.size.height = v12;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)_resetContentViewFrame
{
  contentView = self->_contentView;
  [(TPLCDView *)self fullSizedContentViewFrame];
  -[UIView setFrame:](contentView, "setFrame:");
  [(TPLCDView *)self setNeedsLayout];
}

- (TPLCDView)initWithDefaultSizeForOrientation:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TPLCDView;
  double v3 = [(TPLCDBar *)&v8 initWithDefaultSizeForOrientation:a3];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(TPLCDView *)v3 fullSizedContentViewFrame];
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:");
    contentView = v3->_contentView;
    v3->_contentView = (UIView *)v5;

    [(UIView *)v3->_contentView setAutoresizingMask:45];
    [(TPLCDView *)v3 addSubview:v3->_contentView];
  }
  return v3;
}

+ (double)defaultTextFontSize
{
  return 36.0;
}

+ (double)defaultLabelFontSize
{
  return 18.0;
}

- (BOOL)shouldCenterText
{
  return self->_imageView == 0;
}

- (BOOL)shouldCenterContentView
{
  double v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  return (v4 & 0xFFFFFFFFFFFFFFFBLL) == 1 && self->_imageView != 0;
}

- (void)setContentsAlpha:(double)a3
{
  -[TPLCDTextView setAlpha:](self->_textView, "setAlpha:");
  [(TPLCDTextView *)self->_labelView setAlpha:a3];
  imageView = self->_imageView;
  [(TPLCDSubImageView *)imageView setAlpha:a3];
}

- (double)_labelVInset
{
  double v3 = [(TPLCDView *)self subImage];

  [(UIView *)self->_contentView bounds];
  double v4 = floor(CGRectGetMidY(v7));
  double v5 = 5.0;
  if (!v3) {
    double v5 = 18.0;
  }
  return v4 + v5;
}

- (double)_textVInset
{
  [(UIView *)self->_contentView bounds];
  return floor(CGRectGetMidY(v3)) + -32.0;
}

- (void)setTextFontSize:(double)a3
{
  textView = self->_textView;
  id v4 = [MEMORY[0x1E4FB08E0] _thinSystemFontOfSize:a3];
  [(TPLCDTextView *)textView setFont:v4];
}

- (void)setText:(id)a3
{
  id v9 = a3;
  [(TPLCDView *)self _resetContentViewFrame];
  textView = self->_textView;
  if (!textView)
  {
    double v5 = (void *)MEMORY[0x1E4FB08E0];
    [(id)objc_opt_class() defaultTextFontSize];
    v6 = objc_msgSend(v5, "_thinSystemFontOfSize:");
    CGRect v7 = objc_alloc_init(TPLCDTextView);
    objc_super v8 = self->_textView;
    self->_textView = v7;

    [(TPLCDTextView *)self->_textView setLCDTextFont:v6];
    [(UIView *)self->_contentView addSubview:self->_textView];

    textView = self->_textView;
  }
  [(TPLCDTextView *)textView setText:v9];
  [(TPLCDView *)self layoutIfNeeded];
}

- (id)text
{
  return [(TPLCDTextView *)self->_textView text];
}

- (CGRect)_text1Frame
{
  [(TPLCDView *)self _textVInset];
  double v4 = v3;
  double v5 = v3;
  [(TPLCDView *)self _labelVInset];
  double v7 = v6;
  [(UIView *)self->_contentView bounds];
  double v9 = v8;
  double v10 = v7 - v4;
  if (!self->_labelView && (*((unsigned char *)self + 448) & 1) == 0)
  {
    [(TPLCDView *)self _textVInset];
    double v5 = v11;
  }
  double v12 = v9 + -40.0;
  if (self->_imageView)
  {
    if ([(TPLCDView *)self shouldCenterContentView]) {
      double v13 = 0.0;
    }
    else {
      double v13 = 20.0;
    }
    if ([(TPLCDView *)self verticallyCenterTextViewIfLabelless]
      && !self->_labelView)
    {
      [(TPLCDSubImageView *)self->_imageView frame];
      double v15 = v14;
      [(TPLCDSubImageView *)self->_imageView bounds];
      double v5 = v15 + v16 * 0.5 - (v10 + 5.0) * 0.5;
    }
    else
    {
      double v5 = v4 + -6.0;
    }
    [(TPLCDTextView *)self->_textView sizeToFit];
    if (v12 >= v17) {
      double v18 = v17;
    }
    else {
      double v18 = v9 + -40.0;
    }
    [(UIView *)self->_contentView bounds];
    double v20 = v19;
    [(TPLCDSubImageView *)self->_imageView bounds];
    if (v18 >= v20 - (v21 + 42.0)) {
      double v12 = v20 - (v21 + 42.0);
    }
    else {
      double v12 = v18;
    }
  }
  else
  {
    double v13 = 20.0;
  }
  double v22 = v13;
  double v23 = v5;
  double v24 = v12;
  double v25 = v10 + 5.0;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGRect)_labelFrame
{
  [(UIView *)self->_contentView bounds];
  double v4 = v3;
  double v6 = v5;
  [(TPLCDView *)self _labelVInset];
  double v8 = v7;
  double v9 = v4 + -40.0;
  if (self->_imageView)
  {
    if ([(TPLCDView *)self shouldCenterContentView]) {
      double v10 = 0.0;
    }
    else {
      double v10 = 20.0;
    }
    double v8 = v8 + -1.0;
    [(TPLCDTextView *)self->_labelView sizeToFit];
    if (v9 >= v11) {
      double v9 = v11;
    }
    [(TPLCDSubImageView *)self->_imageView bounds];
    if (v9 >= v4 - (v12 + 42.0)) {
      double v9 = v4 - (v12 + 42.0);
    }
  }
  else
  {
    double v10 = 20.0;
  }
  double v13 = v6 - v8;
  double v14 = v10;
  double v15 = v8;
  double v16 = v9;
  result.size.height = v13;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)_imageViewFrame
{
  imageView = self->_imageView;
  if (imageView)
  {
    [(TPLCDSubImageView *)imageView bounds];
    double v5 = v4;
    double v7 = v6;
    [(UIView *)self->_contentView bounds];
    double v9 = v8 + -20.0 - v5;
    [(UIView *)self->_contentView bounds];
    float v11 = (v10 - v7) * 0.5;
    double v12 = (float)(roundf(v11) + -4.0);
  }
  else
  {
    double v9 = *MEMORY[0x1E4F1DB28];
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v13 = v9;
  double v14 = v5;
  double v15 = v7;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v12;
  result.origin.x = v13;
  return result;
}

- (void)layoutSubviews
{
  contentView = self->_contentView;
  [(TPLCDView *)self fullSizedContentViewFrame];
  -[UIView setFrame:](contentView, "setFrame:");
  BOOL v4 = [(TPLCDView *)self shouldCenterText];
  [(TPLCDTextView *)self->_textView setCenterText:v4];
  [(TPLCDTextView *)self->_labelView setCenterText:v4];
  double v5 = 0.0;
  double v6 = 0.0;
  if (self->_imageView)
  {
    [(TPLCDView *)self _imageViewFrame];
    double v6 = v7;
    -[TPLCDSubImageView setFrame:](self->_imageView, "setFrame:");
  }
  if (self->_textView)
  {
    [(TPLCDView *)self textFrame];
    double v5 = v8;
    -[TPLCDTextView setFrame:](self->_textView, "setFrame:");
  }
  if (self->_labelView)
  {
    [(TPLCDView *)self _labelFrame];
    double v10 = v9;
    -[TPLCDTextView setFrame:](self->_labelView, "setFrame:");
  }
  else
  {
    double v10 = 0.0;
  }
  if ([(TPLCDView *)self shouldCenterContentView])
  {
    [(UIView *)self->_contentView frame];
    double v12 = v11;
    double v14 = v13;
    if (v5 >= v10) {
      double v15 = v5;
    }
    else {
      double v15 = v10;
    }
    double v16 = v6 + v15 + 40.0;
    [(TPLCDView *)self bounds];
    double v18 = self->_contentView;
    double v19 = floor((v17 - v16) * 0.5);
    -[UIView setFrame:](v18, "setFrame:", v19, v12, v16, v14);
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)TPLCDView;
  [(TPLCDView *)&v3 didMoveToWindow];
  [(TPLCDView *)self setNeedsLayout];
}

- (void)didFinishAnimatingLCDLabelFadeOut:(id)a3 finished:(id)a4 context:(id)a5
{
}

- (void)setLabelFontSize:(double)a3
{
  labelView = self->_labelView;
  id v4 = [MEMORY[0x1E4FB08E0] systemFontOfSize:a3];
  [(TPLCDTextView *)labelView setFont:v4];
}

- (void)setLabel:(id)a3
{
}

- (void)setLabel:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  id v16 = a3;
  [(TPLCDView *)self _resetContentViewFrame];
  if (v4)
  {
    [MEMORY[0x1E4FB1EB0] beginAnimations:@"lcdViewFadeLabelOut" context:self->_labelView];
    [MEMORY[0x1E4FB1EB0] setAnimationDuration:0.5];
    [MEMORY[0x1E4FB1EB0] setAnimationDelegate:self];
    [MEMORY[0x1E4FB1EB0] setAnimationDidStopSelector:sel_didFinishAnimatingLCDLabelFadeOut_finished_context_];
    [(TPLCDTextView *)self->_labelView setAlpha:0.0];
    [MEMORY[0x1E4FB1EB0] endAnimations];
    labelView = self->_labelView;
    self->_labelView = 0;
  }
  uint64_t v7 = [v16 length];
  double v8 = self->_labelView;
  if (v7)
  {
    if (!v8)
    {
      double v9 = objc_alloc_init(TPLCDTextView);
      double v10 = self->_labelView;
      self->_labelView = v9;

      double v11 = self->_labelView;
      double v12 = (void *)MEMORY[0x1E4FB08E0];
      [(id)objc_opt_class() defaultLabelFontSize];
      double v13 = objc_msgSend(v12, "systemFontOfSize:");
      [(TPLCDTextView *)v11 setLCDTextFont:v13];

      [(TPLCDTextView *)self->_labelView setMinimumFontSize:14.0];
      [(UIView *)self->_contentView addSubview:self->_labelView];
      double v8 = self->_labelView;
    }
    [(TPLCDTextView *)v8 setText:v16];
  }
  else if (v8)
  {
    [(TPLCDTextView *)v8 removeFromSuperview];
    double v14 = self->_labelView;
    self->_labelView = 0;
  }
  if (v4)
  {
    double v15 = self->_labelView;
    if (v15)
    {
      [(TPLCDTextView *)v15 setAlpha:0.0];
      [MEMORY[0x1E4FB1EB0] beginAnimations:@"lcdViewFadeLabelIn"];
      [MEMORY[0x1E4FB1EB0] setAnimationDuration:0.5];
      [(TPLCDTextView *)self->_labelView setAlpha:1.0];
      [MEMORY[0x1E4FB1EB0] endAnimations];
    }
  }
  [(TPLCDView *)self layoutIfNeeded];
}

- (id)label
{
  return [(TPLCDTextView *)self->_labelView text];
}

- (void)blinkLabel
{
  id v16 = [MEMORY[0x1E4F39BD8] animation];
  [v16 setKeyPath:@"hidden"];
  objc_super v3 = (void *)MEMORY[0x1E4F1C978];
  LODWORD(v4) = 1.0;
  double v5 = [NSNumber numberWithFloat:v4];
  double v6 = [NSNumber numberWithFloat:0.0];
  uint64_t v7 = objc_msgSend(v3, "arrayWithObjects:", v5, v6, 0);
  [v16 setValues:v7];

  double v8 = (void *)MEMORY[0x1E4F1C978];
  double v9 = [NSNumber numberWithFloat:0.0];
  LODWORD(v10) = 0.5;
  double v11 = [NSNumber numberWithFloat:v10];
  LODWORD(v12) = 1.0;
  double v13 = [NSNumber numberWithFloat:v12];
  double v14 = objc_msgSend(v8, "arrayWithObjects:", v9, v11, v13, 0);
  [v16 setKeyTimes:v14];

  [v16 setDuration:0.3];
  [v16 setCalculationMode:*MEMORY[0x1E4F39D78]];
  LODWORD(v15) = 3.0;
  [v16 setRepeatCount:v15];
  [(TPLCDTextView *)self->_labelView addAnimation:v16 forKey:@"hidden"];
}

- (void)setSubImage:(id)a3
{
  id v8 = a3;
  [(TPLCDView *)self _resetContentViewFrame];
  imageView = self->_imageView;
  if (v8 && !imageView)
  {
    double v5 = [[TPLCDSubImageView alloc] initWithDefaultSize];
    double v6 = self->_imageView;
    self->_imageView = v5;

    [(UIView *)self->_contentView addSubview:self->_imageView];
    imageView = self->_imageView;
LABEL_5:
    [(TPLCDSubImageView *)imageView setAutoresizingMask:41];
    [(TPLCDSubImageView *)self->_imageView setImage:v8];
    goto LABEL_6;
  }
  if (v8) {
    goto LABEL_5;
  }
  if (imageView)
  {
    [(TPLCDSubImageView *)imageView removeFromSuperview];
    uint64_t v7 = self->_imageView;
    self->_imageView = 0;
  }
LABEL_6:
  [(TPLCDView *)self layoutIfNeeded];
}

- (id)subImage
{
  return [(TPLCDSubImageView *)self->_imageView image];
}

- (void)setShadowColor:(id)a3
{
  textView = self->_textView;
  id v5 = a3;
  [(TPLCDTextView *)textView setShadowColor:v5];
  [(TPLCDTextView *)self->_labelView setShadowColor:v5];
}

- (void)setLayoutAsLabelled:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 448);
  if (((((v3 & 1) == 0) ^ a3) & 1) == 0)
  {
    *((unsigned char *)self + 448) = v3 & 0xFE | a3;
    if (!a3)
    {
      [(TPLCDTextView *)self->_labelView removeFromSuperview];
      labelView = self->_labelView;
      self->_labelView = 0;
    }
    [(TPLCDView *)self layoutIfNeeded];
    [(TPLCDView *)self setNeedsDisplay];
  }
}

- (id)secondLineText
{
  return 0;
}

- (BOOL)verticallyCenterTextViewIfLabelless
{
  return self->_verticallyCenterTextViewIfLabelless;
}

- (void)setVerticallyCenterTextViewIfLabelless:(BOOL)a3
{
  self->_verticallyCenterTextViewIfLabelless = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end