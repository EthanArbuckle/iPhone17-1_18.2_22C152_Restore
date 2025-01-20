@interface TapPointCoordinator
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (_TtC5Books19TapPointCoordinator)init;
@end

@implementation TapPointCoordinator

- (_TtC5Books19TapPointCoordinator)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books19TapPointCoordinator_currentTouchType) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(TapPointCoordinator *)&v5 init];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  v9 = (objc_class *)[v7 type];
  *(Class *)((char *)&v8->super.isa + OBJC_IVAR____TtC5Books19TapPointCoordinator_currentTouchType) = v9;

  return 1;
}

@end