@interface MarketingControllerHandler
- (_TtC9SeymourUI26MarketingControllerHandler)init;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4;
- (void)messageViewController:(id)a3 enqueueEventWithFields:(id)a4 inTopic:(id)a5;
@end

@implementation MarketingControllerHandler

- (_TtC9SeymourUI26MarketingControllerHandler)init
{
  result = (_TtC9SeymourUI26MarketingControllerHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_239C25118(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC9SeymourUI26MarketingControllerHandler_actionHandler));
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI26MarketingControllerHandler_impressionConsumer);
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI26MarketingControllerHandler_metricPage;
  uint64_t v4 = sub_23A7F6C38();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
}

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_23A46F610(v6, v7);
}

- (void)messageViewController:(id)a3 enqueueEventWithFields:(id)a4 inTopic:(id)a5
{
  uint64_t v8 = sub_23A7FF7B8();
  if (a5)
  {
    uint64_t v9 = sub_23A7FF988();
    a5 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v11 = a3;
  v12 = self;
  sub_23A470D08(v8, v9, (unint64_t)a5);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

@end