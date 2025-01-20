@interface CHPillLabelView
+ (id)cacheKeyForColor:(id)a3 size:(CGSize)a4;
+ (id)imageForCacheKey:(id)a3;
+ (id)pillImageForColor:(id)a3 size:(CGSize)a4;
+ (id)pillImages;
+ (void)setImage:(id)a3 forCacheKey:(id)a4;
- (CGSize)intrinsicContentSize;
- (CHPillLabelView)initWithFrame:(CGRect)a3;
- (UIColor)pillBackgroundColor;
- (UIImageView)imageView;
- (UILabel)label;
- (id)firstBaselineAnchor;
- (id)lastBaselineAnchor;
- (void)applyConstraints;
- (void)setImageView:(id)a3;
- (void)setIntegerValue:(int64_t)a3;
- (void)setLabel:(id)a3;
- (void)setPillBackgroundColor:(id)a3;
@end

@implementation CHPillLabelView

+ (id)pillImages
{
  if (qword_10096B5C8 != -1) {
    dispatch_once(&qword_10096B5C8, &stru_1008ADDA0);
  }
  v2 = (void *)qword_10096B5C0;

  return v2;
}

+ (id)cacheKeyForColor:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v16 = 0.0;
  double v17 = 0.0;
  double v14 = 0.0;
  double v15 = 0.0;
  [a3 getRed:&v17 green:&v16 blue:&v15 alpha:&v14];
  v6 = +[NSNumber numberWithDouble:v17];
  v7 = +[NSNumber numberWithDouble:v16];
  v8 = +[NSNumber numberWithDouble:v15];
  v9 = +[NSNumber numberWithDouble:v14];
  v10 = +[NSNumber numberWithDouble:width];
  v11 = +[NSNumber numberWithDouble:height];
  v12 = +[NSString stringWithFormat:@"%@_%@_%@_%@_%@_%@", v6, v7, v8, v9, v10, v11];

  return v12;
}

+ (id)imageForCacheKey:(id)a3
{
  id v4 = a3;
  v5 = [a1 pillImages];
  v6 = [v5 objectForKey:v4];

  return v6;
}

+ (void)setImage:(id)a3 forCacheKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 pillImages];
  [v8 setObject:v7 forKey:v6];
}

+ (id)pillImageForColor:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  id v8 = [a1 cacheKeyForColor:v7 size:width, height];
  v9 = [a1 imageForCacheKey:v8];
  if (!v9)
  {
    v15.double width = width;
    v15.double height = height;
    UIGraphicsBeginImageContextWithOptions(v15, 0, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v7 CGColor]);
    v16.origin.x = 0.0;
    v16.origin.y = 0.0;
    v16.size.double width = width;
    v16.size.double height = height;
    CGContextFillEllipseInRect(CurrentContext, v16);
    v11 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    v9 = [v11 resizableImageWithCapInsets:1 resizingMode:0.0 width * 0.5, 0.0, width * 0.5];

    if (v9) {
      [a1 setImage:v9 forCacheKey:v8];
    }
  }
  id v12 = v9;

  return v12;
}

- (CHPillLabelView)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CHPillLabelView;
  v3 = -[CHPillLabelView initWithFrame:](&v16, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = +[UIColor clearColor];
    [(CHPillLabelView *)v3 setBackgroundColor:v4];

    [(CHPillLabelView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v5) = 1148846080;
    [(CHPillLabelView *)v3 setContentCompressionResistancePriority:1 forAxis:v5];
    LODWORD(v6) = 1148846080;
    [(CHPillLabelView *)v3 setContentHuggingPriority:1 forAxis:v6];
    id v7 = (UILabel *)objc_alloc_init((Class)UILabel);
    label = v3->_label;
    v3->_label = v7;

    [(UILabel *)v3->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = +[UIFont systemFontOfSize:9.0 weight:UIFontWeightSemibold];
    [(UILabel *)v3->_label setFont:v9];

    v10 = +[UIColor blackColor];
    [(UILabel *)v3->_label setTextColor:v10];

    v11 = +[UIColor secondaryLabelColor];
    id v12 = [objc_opt_class() pillImageForColor:v11 size:14.0, 14.0];
    v13 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v12];
    imageView = v3->_imageView;
    v3->_imageView = v13;

    [(UIImageView *)v3->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CHPillLabelView *)v3 addSubview:v3->_imageView];
    [(CHPillLabelView *)v3 addSubview:v3->_label];
    [(CHPillLabelView *)v3 applyConstraints];
  }
  return v3;
}

- (void)setPillBackgroundColor:(id)a3
{
  p_pillBackgroundColor = &self->_pillBackgroundColor;
  objc_storeStrong((id *)&self->_pillBackgroundColor, a3);
  id v6 = a3;
  [objc_opt_class() pillImageForColor:*p_pillBackgroundColor size:14.0, 14.0];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(UIImageView *)self->_imageView setImage:v7];
}

- (CGSize)intrinsicContentSize
{
  v2 = [(CHPillLabelView *)self label];
  [v2 intrinsicContentSize];
  double v4 = v3 + 6.0;

  double v5 = 14.0;
  if (v4 >= 14.0) {
    double v5 = v4;
  }
  double v6 = 14.0;
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (void)applyConstraints
{
  double v3 = [(CHPillLabelView *)self label];
  LODWORD(v4) = 1148846080;
  [v3 setContentCompressionResistancePriority:0 forAxis:v4];

  double v5 = [(CHPillLabelView *)self label];
  LODWORD(v6) = 1148846080;
  [v5 setContentCompressionResistancePriority:1 forAxis:v6];

  id v7 = [(CHPillLabelView *)self label];
  LODWORD(v8) = 1148846080;
  [v7 setContentHuggingPriority:0 forAxis:v8];

  v9 = [(CHPillLabelView *)self label];
  LODWORD(v10) = 1148846080;
  [v9 setContentHuggingPriority:1 forAxis:v10];

  v11 = [(CHPillLabelView *)self label];
  id v12 = [v11 centerXAnchor];
  v13 = [(CHPillLabelView *)self centerXAnchor];
  double v14 = [v12 constraintEqualToAnchor:v13];
  [v14 setActive:1];

  CGSize v15 = [(CHPillLabelView *)self label];
  objc_super v16 = [v15 centerYAnchor];
  double v17 = [(CHPillLabelView *)self centerYAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  [v18 setActive:1];

  v19 = [(CHPillLabelView *)self imageView];
  v20 = [v19 centerXAnchor];
  v21 = [(CHPillLabelView *)self centerXAnchor];
  v22 = [v20 constraintEqualToAnchor:v21 constant:0.0];
  [v22 setActive:1];

  v23 = [(CHPillLabelView *)self imageView];
  v24 = [v23 centerYAnchor];
  v25 = [(CHPillLabelView *)self label];
  v26 = [v25 centerYAnchor];
  v27 = [v24 constraintEqualToAnchor:v26 constant:0.0];
  [v27 setActive:1];

  v28 = [(CHPillLabelView *)self imageView];
  v29 = [v28 heightAnchor];
  v30 = [v29 constraintEqualToConstant:14.0];
  [v30 setActive:1];

  v31 = [(CHPillLabelView *)self imageView];
  v32 = [v31 widthAnchor];
  v33 = [(CHPillLabelView *)self label];
  v34 = [v33 widthAnchor];
  v35 = [v32 constraintEqualToAnchor:v34 multiplier:1.0 constant:6.0];

  LODWORD(v36) = 1144750080;
  [v35 setPriority:v36];
  v37 = [(CHPillLabelView *)self imageView];
  v38 = [v37 widthAnchor];
  v39 = [v38 constraintGreaterThanOrEqualToConstant:14.0];

  LODWORD(v40) = 1148846080;
  [v39 setPriority:v40];
  v42[0] = v35;
  v42[1] = v39;
  v41 = +[NSArray arrayWithObjects:v42 count:2];
  +[NSLayoutConstraint activateConstraints:v41];
}

- (void)setIntegerValue:(int64_t)a3
{
  double v4 = +[NSNumber numberWithInteger:a3];
  id v6 = +[NSNumberFormatter localizedStringFromNumber:v4 numberStyle:0];

  double v5 = [(CHPillLabelView *)self label];
  [v5 setText:v6];
}

- (id)firstBaselineAnchor
{
  v2 = [(CHPillLabelView *)self label];
  double v3 = [v2 firstBaselineAnchor];

  return v3;
}

- (id)lastBaselineAnchor
{
  v2 = [(CHPillLabelView *)self label];
  double v3 = [v2 lastBaselineAnchor];

  return v3;
}

- (UIColor)pillBackgroundColor
{
  return self->_pillBackgroundColor;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_pillBackgroundColor, 0);
}

@end