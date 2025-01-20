@interface UILabel
+ (CGSize)bkSizeForString:(id)a3 constrainedToSize:(CGSize)a4 font:(id)a5 lineBreakMode:(int64_t)a6;
+ (CGSize)bkSizeForString:(id)a3 font:(id)a4;
- (void)bkSetText:(id)a3 font:(id)a4 lineBreakMode:(int64_t)a5;
@end

@implementation UILabel

+ (CGSize)bkSizeForString:(id)a3 font:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)NSAttributedString);
  v8 = +[NSNumber numberWithFloat:0.0];
  v9 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v5, NSFontAttributeName, v8, NSKernAttributeName, 0);

  id v10 = [v7 initWithString:v6 attributes:v9];
  [v10 size];
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

+ (CGSize)bkSizeForString:(id)a3 constrainedToSize:(CGSize)a4 font:(id)a5 lineBreakMode:(int64_t)a6
{
  double height = a4.height;
  double width = a4.width;
  id v10 = a5;
  id v11 = a3;
  id v12 = objc_alloc_init((Class)NSMutableParagraphStyle);
  [v12 setLineBreakMode:a6];
  id v13 = objc_alloc((Class)NSAttributedString);
  double v14 = +[NSNumber numberWithFloat:0.0];
  double v15 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v10, NSFontAttributeName, v14, NSKernAttributeName, v12, NSParagraphStyleAttributeName, 0);

  id v16 = [v13 initWithString:v11 attributes:v15];
  [v16 boundingRectWithSize:3 options:0 context:width height];
  double v18 = v17;
  double v20 = v19;

  double v21 = v18;
  double v22 = v20;
  result.double height = v22;
  result.double width = v21;
  return result;
}

- (void)bkSetText:(id)a3 font:(id)a4 lineBreakMode:(int64_t)a5
{
  id v13 = a3;
  id v8 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v9 = objc_alloc_init((Class)NSMutableParagraphStyle);
    [v9 setLineBreakMode:a5];
    id v10 = objc_alloc((Class)NSAttributedString);
    id v11 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v8, NSFontAttributeName, &off_1E9398, NSKernAttributeName, v9, NSParagraphStyleAttributeName, 0);

    id v12 = [v10 initWithString:v13 attributes:v11];
    [(UILabel *)self setAttributedText:v12];

    id v8 = v9;
  }
  else
  {
    [(UILabel *)self setText:v13];
    [(UILabel *)self setFont:v8];
  }
}

@end