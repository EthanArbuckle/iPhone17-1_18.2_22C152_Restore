@interface NTKRichComplicationCircularImageView
+ (BOOL)handlesComplicationTemplate:(id)a3;
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
- (NTKRichComplicationCircularImageView)init;
- (void)_handleTemplate:(id)a3 reason:(int64_t)a4;
@end

@implementation NTKRichComplicationCircularImageView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 10;
}

- (NTKRichComplicationCircularImageView)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationCircularImageView;
  return [(NTKRichComplicationBaseCircularImageView *)&v3 initWithFamily:10];
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v7 = [a3 imageProvider];
  v6 = [(NTKRichComplicationBaseCircularImageView *)self imageView];
  [v6 setImageProvider:v7 reason:a4];
}

@end