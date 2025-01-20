@interface ChromeMapViewDelegateProxy
+ (id)protocols;
- (BOOL)preferChromeForSelector:(SEL)a3 protocol:(id)a4;
- (id)delegatesForSelector:(SEL)a3 protocol:(id)a4;
@end

@implementation ChromeMapViewDelegateProxy

+ (id)protocols
{
  if (qword_1016107A8 != -1) {
    dispatch_once(&qword_1016107A8, &stru_101316E00);
  }
  v2 = (void *)qword_1016107A0;

  return v2;
}

- (id)delegatesForSelector:(SEL)a3 protocol:(id)a4
{
  id v6 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  p_chromeViewController = &self->super._chromeViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._chromeViewController);
  v9 = [WeakRetained navigationDisplay];
  v10 = [v9 mapViewDelegate];

  if (v10) {
    [v6 addObject:v10];
  }
  id v11 = objc_loadWeakRetained((id *)p_chromeViewController);
  v12 = [v11 mapViewDelegateForSelector:a3];

  if (v12) {
    [v6 addObject:v12];
  }
  id v13 = [v6 copy];

  return v13;
}

- (BOOL)preferChromeForSelector:(SEL)a3 protocol:(id)a4
{
  return "mapView:viewForAnnotation:" == a3 || "mapViewDidStartUserInteraction:" == a3;
}

@end