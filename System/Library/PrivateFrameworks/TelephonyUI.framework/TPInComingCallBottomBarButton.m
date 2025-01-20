@interface TPInComingCallBottomBarButton
- (CGRect)imageRectForContentRect:(CGRect)a3;
- (CGRect)titleRectForContentRect:(CGRect)a3;
- (CGSize)intrinsicContentSize;
- (TPInComingCallBottomBarButton)initWithFrame:(CGRect)a3;
- (double)diameter;
- (double)titleRectYOffset;
- (void)setDiameter:(double)a3;
@end

@implementation TPInComingCallBottomBarButton

- (TPInComingCallBottomBarButton)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)TPInComingCallBottomBarButton;
  v3 = -[TPInComingCallBottomBarButton initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v3)
  {
    +[TPUIConfiguration defaultHeight];
    -[TPInComingCallBottomBarButton setDiameter:](v3, "setDiameter:");
    v4 = [(TPInComingCallBottomBarButton *)v3 titleLabel];
    [v4 setTextAlignment:1];

    v5 = +[TPUIConfiguration defaultFont];
    v6 = [(TPInComingCallBottomBarButton *)v3 titleLabel];
    [v6 setFont:v5];

    v7 = [(TPInComingCallBottomBarButton *)v3 titleLabel];
    [v7 setLineBreakMode:4];

    v8 = [MEMORY[0x1E4FB1618] whiteColor];
    [(TPInComingCallBottomBarButton *)v3 setTintColor:v8];

    v9 = [(TPInComingCallBottomBarButton *)v3 titleLabel];
    [v9 setNumberOfLines:0];

    [(TPInComingCallBottomBarButton *)v3 diameter];
    double v11 = v10 * 0.5;
    v12 = [(TPInComingCallBottomBarButton *)v3 layer];
    [v12 setCornerRadius:v11];
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  [(TPInComingCallBottomBarButton *)self diameter];
  double v4 = v3;
  [(TPInComingCallBottomBarButton *)self diameter];
  double v6 = v5;
  double v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v17.receiver = self;
  v17.super_class = (Class)TPInComingCallBottomBarButton;
  -[TPInComingCallBottomBarButton imageRectForContentRect:](&v17, sel_imageRectForContentRect_, a3.origin.x, a3.origin.y);
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  double x = width * 0.5 - v5 * 0.5;
  double y = height * 0.5 - v7 * 0.5;
  double v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v11 scale];
  if (v12 == 1.0)
  {
    v18.origin.double x = x;
    v18.origin.double y = y;
    v18.size.double width = v6;
    v18.size.double height = v8;
    CGRect v19 = CGRectIntegral(v18);
    double x = v19.origin.x;
    double y = v19.origin.y;
    CGFloat v6 = v19.size.width;
    CGFloat v8 = v19.size.height;
  }

  double v13 = x;
  double v14 = y;
  double v15 = v6;
  double v16 = v8;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v40[1] = *MEMORY[0x1E4F143B8];
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  uint64_t v10 = [(TPInComingCallBottomBarButton *)self currentTitle];
  if (v10)
  {
    double v11 = (void *)v10;
    double v12 = [(TPInComingCallBottomBarButton *)self currentTitle];
    uint64_t v13 = [v12 length];

    if (v13)
    {
      double v14 = [(TPInComingCallBottomBarButton *)self titleLabel];
      [v14 preferredMaxLayoutWidth];
      double v16 = v15;
      objc_super v17 = [v14 font];
      CGRect v18 = v17;
      if (v17)
      {
        id v19 = v17;
      }
      else
      {
        id v19 = [(id)objc_opt_class() defaultFont];
      }
      v20 = v19;

      uint64_t v39 = *MEMORY[0x1E4FB06F8];
      v40[0] = v20;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
      v22 = [(TPInComingCallBottomBarButton *)self currentTitle];
      objc_msgSend(v22, "boundingRectWithSize:options:attributes:context:", 1, v21, 0, 3.40282347e38, 3.40282347e38);
      double v24 = v23;
      double v26 = v25;

      double v27 = ceil(v24);
      if (v16 >= v27) {
        double v8 = v27;
      }
      else {
        double v8 = v16;
      }
      if (v8 == v16)
      {
        v28 = [(TPInComingCallBottomBarButton *)self currentTitle];
        objc_msgSend(v28, "boundingRectWithSize:options:attributes:context:", 1, v21, 0, v16, 3.40282347e38);
        double v30 = v29;

        double v31 = ceil(v30);
        if (v31 <= 45.0) {
          double v9 = v31;
        }
        else {
          double v9 = 45.0;
        }
      }
      else
      {
        double v9 = ceil(v26);
      }
      double v32 = width * 0.5 - v8 * 0.5;
      [(TPInComingCallBottomBarButton *)self titleRectYOffset];
      double v34 = height + v33;
      if (v8 == v16 && v9 == 45.0) {
        [v14 setAdjustsFontSizeToFitWidth:1];
      }
      double v6 = ceil(v32);
      double v7 = ceil(v34);
    }
  }
  double v35 = v6;
  double v36 = v7;
  double v37 = v8;
  double v38 = v9;
  result.size.double height = v38;
  result.size.double width = v37;
  result.origin.double y = v36;
  result.origin.double x = v35;
  return result;
}

- (double)titleRectYOffset
{
  if (titleRectYOffset_onceToken != -1) {
    dispatch_once(&titleRectYOffset_onceToken, &__block_literal_global_6);
  }
  return *(double *)&titleRectYOffset_yOffset;
}

unint64_t __49__TPInComingCallBottomBarButton_titleRectYOffset__block_invoke()
{
  unint64_t result = +[TPUIConfiguration inCallBottomBarSpacing];
  double v1 = 8.0;
  if (result == 6) {
    double v1 = 11.0;
  }
  titleRectYOffset_yOffset = *(void *)&v1;
  return result;
}

- (double)diameter
{
  return self->_diameter;
}

- (void)setDiameter:(double)a3
{
  self->_diameter = a3;
}

@end