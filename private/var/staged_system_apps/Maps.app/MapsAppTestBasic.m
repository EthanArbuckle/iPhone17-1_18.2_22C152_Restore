@interface MapsAppTestBasic
- (BOOL)runTest;
@end

@implementation MapsAppTestBasic

- (BOOL)runTest
{
  [(MapsAppTest *)self setupForVKTest];
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10088E194;
  v4[3] = &unk_1012E6708;
  objc_copyWeak(&v5, &location);
  [(MapsAppTest *)self addFullyDrawnCallback:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return 1;
}

@end