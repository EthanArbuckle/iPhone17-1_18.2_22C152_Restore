@interface PPXJSAWindowProvider
+ (PPXJSAWindowProvider)sharedProvider;
- (UIWindow)window;
- (id)windowFromOptions:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation PPXJSAWindowProvider

+ (PPXJSAWindowProvider)sharedProvider
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005558;
  block[3] = &unk_100031640;
  block[4] = a1;
  if (qword_100039670 != -1) {
    dispatch_once(&qword_100039670, block);
  }
  v2 = (void *)qword_100039678;

  return (PPXJSAWindowProvider *)v2;
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