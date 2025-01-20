@interface ChromeNavigationDisplayDelegateProxy
+ (id)protocols;
- (id)delegatesForSelector:(SEL)a3 protocol:(id)a4;
@end

@implementation ChromeNavigationDisplayDelegateProxy

+ (id)protocols
{
  if (qword_10160F0F8 != -1) {
    dispatch_once(&qword_10160F0F8, &stru_1012EEEF8);
  }
  v2 = (void *)qword_10160F0F0;

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