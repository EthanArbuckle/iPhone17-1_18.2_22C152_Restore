@interface _BKEndOfBookToastBlurEffectView
+ (Class)layerClass;
- (_BKEndOfBookToastBlurEffectView)init;
- (_BKEndOfBookToastBlurEffectView)initWithFrame:(CGRect)a3;
@end

@implementation _BKEndOfBookToastBlurEffectView

- (_BKEndOfBookToastBlurEffectView)init
{
  return -[_BKEndOfBookToastBlurEffectView initWithFrame:](self, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

- (_BKEndOfBookToastBlurEffectView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_BKEndOfBookToastBlurEffectView;
  v3 = -[_BKEndOfBookToastBlurEffectView initWithFrame:](&v11, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(_BKEndOfBookToastBlurEffectView *)v3 setAutoresizingMask:18];
    [(_BKEndOfBookToastBlurEffectView *)v4 setOpaque:0];
    v5 = [(_BKEndOfBookToastBlurEffectView *)v4 backdropLayer];
    [v5 setEnabled:1];

    v6 = +[CAFilter filterWithType:kCAFilterColorSaturate];
    [v6 setValue:&off_100A836A0 forKey:@"inputAmount"];
    [v6 setName:@"colorSaturate"];
    v7 = +[CAFilter filterWithType:kCAFilterGaussianBlur];
    [v7 setValue:&off_100A82E70 forKey:@"inputRadius"];
    [v7 setValue:&__kCFBooleanTrue forKey:@"inputHardEdges"];
    [v7 setName:@"gaussianBlur"];
    v12[0] = v6;
    v12[1] = v7;
    v8 = +[NSArray arrayWithObjects:v12 count:2];
    v9 = [(_BKEndOfBookToastBlurEffectView *)v4 layer];
    [v9 setFilters:v8];
  }
  return v4;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end