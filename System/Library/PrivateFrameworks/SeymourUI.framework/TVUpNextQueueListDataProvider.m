@interface TVUpNextQueueListDataProvider
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (_TtC9SeymourUI29TVUpNextQueueListDataProvider)init;
@end

@implementation TVUpNextQueueListDataProvider

- (_TtC9SeymourUI29TVUpNextQueueListDataProvider)init
{
  result = (_TtC9SeymourUI29TVUpNextQueueListDataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_239C25118(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC9SeymourUI29TVUpNextQueueListDataProvider_onFocusSettled));
  sub_239C25118(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC9SeymourUI29TVUpNextQueueListDataProvider_onUpNextQueueItemsChanged));

  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI29TVUpNextQueueListDataProvider_metricPage;
  uint64_t v4 = sub_23A7F6C38();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  BOOL v9 = sub_239EEF218(v6);

  return v9;
}

@end