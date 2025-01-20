@interface FloatingControlsOverlayDelegateProxy
+ (id)protocols;
- (FloatingControlsOverlayDelegateProxy)initWithChromeViewController:(id)a3;
- (id)delegatesForSelector:(SEL)a3 protocol:(id)a4;
@end

@implementation FloatingControlsOverlayDelegateProxy

- (FloatingControlsOverlayDelegateProxy)initWithChromeViewController:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7.receiver = self;
    v7.super_class = (Class)FloatingControlsOverlayDelegateProxy;
    self = [(ChromeDelegateProxy *)&v7 initWithChromeViewController:v4];
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)protocols
{
  if (qword_10160F1B8 != -1) {
    dispatch_once(&qword_10160F1B8, &stru_1012F09F8);
  }
  v2 = (void *)qword_10160F1B0;

  return v2;
}

- (id)delegatesForSelector:(SEL)a3 protocol:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._chromeViewController);
  v5 = [WeakRetained topContext];
  if (objc_opt_respondsToSelector())
  {
    v8 = v5;
    v6 = +[NSArray arrayWithObjects:&v8 count:1];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end