@interface WindowScene
- (UIResponder)nextResponder;
- (_TtC5TeaUI11WindowScene)initWithSession:(id)a3 connectionOptions:(id)a4;
@end

@implementation WindowScene

- (UIResponder)nextResponder
{
  v2 = self;
  id v3 = sub_1B6016B00();

  return (UIResponder *)v3;
}

- (_TtC5TeaUI11WindowScene)initWithSession:(id)a3 connectionOptions:(id)a4
{
  return (_TtC5TeaUI11WindowScene *)WindowScene.init(session:connectionOptions:)(a3, a4);
}

@end