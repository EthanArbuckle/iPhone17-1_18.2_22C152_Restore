@interface SiriTipsController
- (_TtC11MobileTimer18SiriTipsController)init;
- (_TtP11MobileTimer26SiriTipsControllerDelegate_)delegate;
- (void)cancel;
- (void)checkForSiriTips;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation SiriTipsController

- (_TtC11MobileTimer18SiriTipsController)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_delegate) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_tipView) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_checkForSiriTipsTask) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_updateTipStatusTask) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SiriTipsController();
  return [(SiriTipsController *)&v3 init];
}

- (_TtP11MobileTimer26SiriTipsControllerDelegate_)delegate
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();

  return (_TtP11MobileTimer26SiriTipsControllerDelegate_ *)v2;
}

- (void)setDelegate:(id)a3
{
  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_delegate);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (void)dealloc
{
  v2 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xD8);
  objc_super v3 = self;
  v2();
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for SiriTipsController();
  [(SiriTipsController *)&v4 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_release();

  swift_release();
}

- (void)checkForSiriTips
{
  v2 = self;
  sub_1000608F0();
}

- (void)cancel
{
  v2 = self;
  sub_1000633A4();
}

@end