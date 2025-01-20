@interface SFProximityHandoffUIClient
- (_TtC7Sharing26SFProximityHandoffUIClient)init;
- (void)dealloc;
- (void)registerForProximityHandoffInteractionUpdatesWithCompletion:(id)a3;
@end

@implementation SFProximityHandoffUIClient

- (_TtC7Sharing26SFProximityHandoffUIClient)init
{
  return (_TtC7Sharing26SFProximityHandoffUIClient *)SFProximityHandoffUIClient.init()();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  sub_1A5582C0C();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(SFProximityHandoffUIClient *)&v5 dealloc];
}

- (void).cxx_destruct
{
  sub_1A54F5EA8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC7Sharing26SFProximityHandoffUIClient_invalidationHandler));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7Sharing26SFProximityHandoffUIClient____lazy_storage___interface));

  swift_unknownObjectRelease();
}

- (void)registerForProximityHandoffInteractionUpdatesWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  objc_super v5 = self;
  sub_1A5584338((uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

@end