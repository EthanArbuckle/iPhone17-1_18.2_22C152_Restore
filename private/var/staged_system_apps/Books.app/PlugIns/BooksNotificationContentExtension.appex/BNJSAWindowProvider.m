@interface BNJSAWindowProvider
+ (id)sharedInstance;
- (UIWindow)window;
- (id)windowFromOptions:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation BNJSAWindowProvider

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004C80;
  block[3] = &unk_1000085F0;
  block[4] = a1;
  if (qword_10000D0C0 != -1) {
    dispatch_once(&qword_10000D0C0, block);
  }
  v2 = (void *)qword_10000D0C8;

  return v2;
}

- (id)windowFromOptions:(id)a3
{
  return 0;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (void).cxx_destruct
{
}

@end