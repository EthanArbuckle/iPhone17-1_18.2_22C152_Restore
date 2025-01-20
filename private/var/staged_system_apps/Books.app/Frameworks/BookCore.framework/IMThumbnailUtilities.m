@interface IMThumbnailUtilities
+ (CGSize)proportionalScaleSize:(CGSize)a3 toDestinationSize:(CGSize)a4 options:(int64_t)a5;
+ (id)scaleImage:(id)a3 toSize:(CGSize)a4 options:(int64_t)a5;
@end

@implementation IMThumbnailUtilities

+ (CGSize)proportionalScaleSize:(CGSize)a3 toDestinationSize:(CGSize)a4 options:(int64_t)a5
{
  double width = (double)(uint64_t)a3.width;
  double v6 = a4.width / width;
  double height = (double)(uint64_t)a3.height;
  double v8 = a4.height / height;
  if (v6 >= v8) {
    double v6 = v8;
  }
  double v9 = v6 * width;
  double v10 = v6 * height;
  if ((a5 & 2) != 0 && v9 / v10 + 0.072 >= 0.667 && v9 / v10 + -0.072 <= 0.667) {
    double v9 = v10 * 0.667;
  }
  v12 = +[UIScreen mainScreen];
  [v12 scale];
  double v14 = v13;

  double v15 = v14 * round(v9 / v14);
  double v16 = v14 * round(v10 / v14);
  result.double height = v16;
  result.double width = v15;
  return result;
}

+ (id)scaleImage:(id)a3 toSize:(CGSize)a4 options:(int64_t)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  [v8 size];
  if (!a5 && (v9 == width ? (BOOL v11 = v10 == height) : (BOOL v11 = 0), v11))
  {
    id v12 = v8;
  }
  else if (v8)
  {
    [v8 size];
    +[IMThumbnailUtilities proportionalScaleSize:toDestinationSize:options:](IMThumbnailUtilities, "proportionalScaleSize:toDestinationSize:options:", a5);
    double v14 = v13;
    double v16 = v15;
    v17 = +[UIGraphicsImageRendererFormat preferredFormat];
    id v18 = [objc_alloc((Class)UIGraphicsImageRenderer) initWithSize:v17 format:v14];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_145E8;
    v20[3] = &unk_2C3F98;
    double v22 = v14;
    double v23 = v16;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    double v26 = v14;
    double v27 = v16;
    id v21 = v8;
    id v12 = [v18 imageWithActions:v20];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

@end