@interface ExplicitRestrictionsController.AgeVerificationWrapper
- (_TtCC9MusicCore30ExplicitRestrictionsControllerP33_49A4F392108DD8BCF77701E27C86571422AgeVerificationWrapper)init;
- (void)cloudServiceSetupViewControllerDidDismiss:(id)a3;
- (void)dealloc;
@end

@implementation ExplicitRestrictionsController.AgeVerificationWrapper

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(void (**)(void, void))((char *)&self->super.isa
                                             + OBJC_IVAR____TtCC9MusicCore30ExplicitRestrictionsControllerP33_49A4F392108DD8BCF77701E27C86571422AgeVerificationWrapper_completion);
  v5 = self;
  if (v4)
  {
    sub_10004C8E8((uint64_t)v4);
    v4(0, 0);
    sub_10004CAE0((uint64_t)v4);
  }
  v6.receiver = self;
  v6.super_class = ObjectType;
  [(ExplicitRestrictionsController.AgeVerificationWrapper *)&v6 dealloc];
}

- (void).cxx_destruct
{
  sub_10004CAE0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCC9MusicCore30ExplicitRestrictionsControllerP33_49A4F392108DD8BCF77701E27C86571422AgeVerificationWrapper_completion));
}

- (void)cloudServiceSetupViewControllerDidDismiss:(id)a3
{
  sub_100009854(0, (unint64_t *)&qword_100576320);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = self;
  objc_super v6 = self;
  id v7 = a3;
  static OS_dispatch_queue.asyncOnMainIfNeeded(_:)(sub_1001C87DC, v5);

  swift_release();
}

- (_TtCC9MusicCore30ExplicitRestrictionsControllerP33_49A4F392108DD8BCF77701E27C86571422AgeVerificationWrapper)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC9MusicCore30ExplicitRestrictionsControllerP33_49A4F392108DD8BCF77701E27C86571422AgeVerificationWrapper_completion);
  void *v4 = 0;
  v4[1] = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(ExplicitRestrictionsController.AgeVerificationWrapper *)&v6 init];
}

@end