@interface UIImage
+ (id)_phImageNamed:(id)a3 inBundle:(id)a4 compatibleWithTraitCollection:(id)a5;
+ (id)phCarPlayImageNamed:(id)a3;
+ (id)phCarPlayImageNamed:(id)a3 inBundle:(id)a4;
+ (id)phImageNamed:(id)a3;
+ (id)phPathForImageNamed:(id)a3;
+ (id)phPathForImageNamed:(id)a3 inBundle:(id)a4;
- (id)centerSquareImage;
- (id)shrinkToSize:(CGSize)a3;
@end

@implementation UIImage

- (id)centerSquareImage
{
  [(UIImage *)self size];
  double v4 = v3;
  [(UIImage *)self size];
  if (v4 >= v5) {
    double v6 = v5;
  }
  else {
    double v6 = v4;
  }
  float v7 = v6;
  [(UIImage *)self size];
  double v9 = v8;
  [(UIImage *)self size];
  if (v9 >= v10) {
    double v11 = v9;
  }
  else {
    double v11 = v10;
  }
  float v12 = v11;
  CGFloat v13 = (float)((float)(v12 - v7) * 0.5);
  v14 = self;
  v15 = [(UIImage *)v14 CGImage];
  v20.origin.y = 0.0;
  v20.origin.x = v13;
  v20.size.width = v7;
  v20.size.height = v7;
  v16 = CGImageCreateWithImageInRect(v15, v20);
  v17 = +[UIImage imageWithCGImage:v16 scale:[(UIImage *)v14 imageOrientation] orientation:1.0];
  CGImageRelease(v16);

  return v17;
}

- (id)shrinkToSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  UIGraphicsBeginImageContext(a3);
  -[UIImage drawInRect:](self, "drawInRect:", 0.0, 0.0, width, height);
  double v6 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v6;
}

+ (id)_phImageNamed:(id)a3 inBundle:(id)a4 compatibleWithTraitCollection:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v8)
  {
    id v8 = +[NSBundle mainBundle];
  }
  double v10 = +[UIImage imageNamed:v7 inBundle:v8 compatibleWithTraitCollection:v9];

  return v10;
}

+ (id)phImageNamed:(id)a3
{
  id v3 = a3;
  double v4 = +[UIScreen mainScreen];
  double v5 = [v4 traitCollection];
  double v6 = +[UIImage _phImageNamed:v3 inBundle:0 compatibleWithTraitCollection:v5];

  return v6;
}

+ (id)phCarPlayImageNamed:(id)a3
{
  return _[a1 phCarPlayImageNamed:a3 inBundle:0];
}

+ (id)phCarPlayImageNamed:(id)a3 inBundle:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[UIScreen _carScreen];
  id v8 = [v7 traitCollection];
  id v9 = +[UIImage _phImageNamed:v6 inBundle:v5 compatibleWithTraitCollection:v8];

  return v9;
}

+ (id)phPathForImageNamed:(id)a3
{
  id v3 = a3;
  double v4 = +[NSBundle mainBundle];
  id v5 = +[UIImage phPathForImageNamed:v3 inBundle:v4];

  return v5;
}

+ (id)phPathForImageNamed:(id)a3 inBundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v6 = +[NSBundle mainBundle];
  }
  id v7 = +[UIScreen mainScreen];
  [v7 scale];
  double v9 = v8;

  if (v9 > 1.0)
  {
    double v10 = +[UIScreen mainScreen];
    [v10 scale];
    float v12 = +[NSString stringWithFormat:@"@%dx", (int)v11];

    if ([v5 hasSuffix:v12])
    {
    }
    else
    {
      CGFloat v13 = [v5 stringByAppendingString:v12];
      v14 = [v6 pathForResource:v13 ofType:@"png"];

      if (v14) {
        goto LABEL_8;
      }
    }
  }
  v14 = [v6 pathForResource:v5 ofType:@"png"];
LABEL_8:

  return v14;
}

@end