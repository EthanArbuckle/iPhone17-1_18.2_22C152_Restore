@interface NotificationService
- (_TtC7NewsUI219NotificationService)init;
- (void)handleEngagementRequest:(id)a3 completion:(id)a4;
@end

@implementation NotificationService

- (_TtC7NewsUI219NotificationService)init
{
  result = (_TtC7NewsUI219NotificationService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DF9E23F0((uint64_t)self + OBJC_IVAR____TtC7NewsUI219NotificationService_warmingSheetPresenter);
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI219NotificationService_metricsProvider;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (void)handleEngagementRequest:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_1DF9E115C(v8, (uint64_t)sub_1DF9E2394, v7);

  swift_release();
}

@end