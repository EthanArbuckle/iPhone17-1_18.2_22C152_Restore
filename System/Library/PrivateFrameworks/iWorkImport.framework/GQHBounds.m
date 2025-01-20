@interface GQHBounds
+ (void)mapBounds:(CGRect)a3 angle:(float)a4 srcGraphicStyle:(id)a5 style:(id)a6 state:(id)a7;
+ (void)mapPosition:(CGPoint)a3 srcGraphicStyle:(id)a4 style:(id)a5 state:(id)a6;
+ (void)mapSize:(CGSize)a3 angle:(float)a4 flipX:(BOOL)a5 flipY:(BOOL)a6 srcGraphicStyle:(id)a7 style:(id)a8 state:(id)a9;
+ (void)mapSize:(CGSize)a3 angle:(float)a4 srcGraphicStyle:(id)a5 style:(id)a6 state:(id)a7;
+ (void)setTransformOriginToZeroInStyle:(id)a3;
@end

@implementation GQHBounds

+ (void)setTransformOriginToZeroInStyle:(id)a3
{
}

+ (void)mapSize:(CGSize)a3 angle:(float)a4 srcGraphicStyle:(id)a5 style:(id)a6 state:(id)a7
{
}

+ (void)mapSize:(CGSize)a3 angle:(float)a4 flipX:(BOOL)a5 flipY:(BOOL)a6 srcGraphicStyle:(id)a7 style:(id)a8 state:(id)a9
{
  BOOL v11 = a6;
  BOOL v12 = a5;
  float width = a3.width;
  float height = a3.height;
  uint64_t v29 = 0;
  if ([a7 hasValueForObjectProperty:68 value:&v29])
  {
    float v16 = (float)+[GQHGraphicStyle strokeWidth:v29];
    float width = width - v16;
    float height = height - v16;
  }
  v17 = off_9CE98;
  [a9 scale];
  [a8 addAttribute:v17 intValue:(int)(v18 * (double)(uint64_t)llroundf(height))];
  v19 = off_9CF68;
  [a9 scale];
  [a8 addAttribute:v19 intValue:(int)(v20 * (double)(uint64_t)llroundf(width))];
  if (a4 != 0.0 || v12 || v11)
  {
    memset(&v28, 0, sizeof(v28));
    double v21 = 1.0;
    if (v12) {
      double v22 = -1.0;
    }
    else {
      double v22 = 1.0;
    }
    if (v11) {
      double v21 = -1.0;
    }
    CGAffineTransformMakeScale(&v28, v22, v21);
    memset(&v27, 0, sizeof(v27));
    CGAffineTransformMakeRotation(&v27, (double)(uint64_t)(360 - llroundf(a4)) * 3.14159265 / 180.0);
    CGAffineTransform t1 = v28;
    memset(&v26, 0, sizeof(v26));
    CGAffineTransform t2 = v27;
    CGAffineTransformConcat(&v26, &t1, &t2);
    CFStringRef v23 = CFStringCreateWithFormat(0, 0, @"matrix(%f, %f, %f, %f, %f, %f)", *(void *)&v26.a, *(void *)&v26.b, *(void *)&v26.c, *(void *)&v26.d, *(void *)&v26.tx, *(void *)&v26.ty);
    [a8 addAttribute:off_9CF90 value:v23];
    CFRelease(v23);
  }
}

+ (void)mapPosition:(CGPoint)a3 srcGraphicStyle:(id)a4 style:(id)a5 state:(id)a6
{
  uint64_t v17 = 0;
  float y = a3.y;
  float x = a3.x;
  if ([a4 hasValueForObjectProperty:68 value:&v17])
  {
    int v10 = +[GQHGraphicStyle strokeWidth:v17];
    if (v10 >= 0) {
      int v11 = v10;
    }
    else {
      int v11 = v10 + 1;
    }
    float v12 = (float)(v11 >> 1);
    float x = x - v12;
    float y = y - v12;
  }
  v13 = off_9CF50;
  [a6 scale];
  [a5 addAttribute:v13 intValue:(int)(v14 * (double)(uint64_t)llroundf(y))];
  v15 = off_9CEA0;
  [a6 scale];
  [a5 addAttribute:v15 intValue:(int)(v16 * (double)(uint64_t)llroundf(x))];
}

+ (void)mapBounds:(CGRect)a3 angle:(float)a4 srcGraphicStyle:(id)a5 style:(id)a6 state:(id)a7
{
  double y = a3.origin.y;
  double x = a3.origin.x;
  double width = a3.size.width;
  *(float *)&a3.size.double width = a4;
  objc_msgSend(a1, "mapSize:angle:srcGraphicStyle:style:state:", width, a3.size.height, a3.size.width);
  objc_msgSend(a1, "mapPosition:srcGraphicStyle:style:state:", a5, a6, a7, x, y);
}

@end