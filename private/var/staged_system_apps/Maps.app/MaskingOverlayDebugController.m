@interface MaskingOverlayDebugController
+ (id)navigationDestinationTitle;
- (MaskingOverlayDebugController)init;
- (void)prepareContent;
@end

@implementation MaskingOverlayDebugController

- (MaskingOverlayDebugController)init
{
  v6.receiver = self;
  v6.super_class = (Class)MaskingOverlayDebugController;
  v2 = [(MapsDebugValuesViewController *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

+ (id)navigationDestinationTitle
{
  return @"Masking Overlay";
}

- (void)prepareContent
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100CF6CC0;
  v4[3] = &unk_1012E7EF8;
  objc_copyWeak(&v5, &location);
  id v3 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Masking Overlay Debug" content:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

@end