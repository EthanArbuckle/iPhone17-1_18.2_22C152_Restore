@interface ClarityUISceneDelegate
- (UIWindow)window;
- (_TtC5Music22ClarityUISceneDelegate)init;
- (void)setWindow:(id)a3;
@end

@implementation ClarityUISceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC5Music22ClarityUISceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music22ClarityUISceneDelegate_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music22ClarityUISceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (_TtC5Music22ClarityUISceneDelegate)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music22ClarityUISceneDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClarityUISceneDelegate();
  return [(ClarityUISceneDelegate *)&v3 init];
}

- (void).cxx_destruct
{
}

@end