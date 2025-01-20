@interface SiriMailScene
- (UIWindow)window;
- (_TtC10MobileMail13SiriMailScene)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation SiriMailScene

- (UIWindow)window
{
  v2 = self;
  id v5 = sub_1004320C4();

  return (UIWindow *)v5;
}

- (void)setWindow:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10043217C(a3);
}

- (_TtC10MobileMail13SiriMailScene)init
{
  return (_TtC10MobileMail13SiriMailScene *)sub_100432268();
}

- (void).cxx_destruct
{
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a5;
  v9 = self;
  sub_1004323B0(a3, (uint64_t)a4, (uint64_t)a5);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100432A8C((uint64_t)a3);
}

@end