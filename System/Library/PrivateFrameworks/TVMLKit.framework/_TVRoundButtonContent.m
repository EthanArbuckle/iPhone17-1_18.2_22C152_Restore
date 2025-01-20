@interface _TVRoundButtonContent
- (CGRect)_frameForImageView:(id)a3;
- (void)layoutSubviews;
@end

@implementation _TVRoundButtonContent

- (CGRect)_frameForImageView:(id)a3
{
  id v4 = a3;
  [(_TVRoundButtonContent *)self bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [v4 bounds];
  double v14 = v13;
  double v16 = v15;
  v35.origin.x = v6;
  v35.origin.y = v8;
  v35.size.width = v10;
  v35.size.height = v12;
  double MidX = CGRectGetMidX(v35);
  v36.origin.x = v6;
  v36.origin.y = v8;
  v36.size.width = v10;
  v36.size.height = v12;
  double MidY = CGRectGetMidY(v36);
  objc_msgSend(v4, "tv_margin");
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  BOOL v27 = v24 == 0.0;
  BOOL v28 = v26 == 0.0;
  double v29 = v22 + v26;
  double v30 = v20 + v24;
  if (v27 && v28) {
    double v30 = 0.0;
  }
  double v31 = v16 - v30;
  if (v27 && v28) {
    double v29 = 0.0;
  }
  double v32 = v14 - v29;
  double v33 = MidX - v14 * 0.5 + v22;
  double v34 = MidY - v16 * 0.5 + v20;
  result.size.height = v31;
  result.size.width = v32;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)_TVRoundButtonContent;
  [(TVButtonContent *)&v5 layoutSubviews];
  v3 = [(TVButtonContent *)self imageView];
  id v4 = [(TVButtonContent *)self imageView];
  [(_TVRoundButtonContent *)self _frameForImageView:v4];
  objc_msgSend(v3, "setFrame:");
}

@end