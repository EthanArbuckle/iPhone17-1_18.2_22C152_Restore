@interface WidgetLocalNewsChannelService
- (_TtC7NewsUI229WidgetLocalNewsChannelService)init;
- (void)fetchWidgetLocalNewsChannelIDWithCompletion:(id)a3;
@end

@implementation WidgetLocalNewsChannelService

- (void)fetchWidgetLocalNewsChannelIDWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  sub_1DE9CB798();
  v6 = self;
  sub_1DFDEE090();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_1DFCE7F84;
  *(void *)(v7 + 24) = v5;
  swift_retain();
  v8 = (void *)sub_1DFDEDCE0();
  sub_1DFDEDE00();
  swift_release();
  swift_release();

  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_1DFCE7F84;
  *(void *)(v9 + 24) = v5;
  swift_retain();
  v10 = (void *)sub_1DFDEDCE0();
  sub_1DFDEDE50();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

- (_TtC7NewsUI229WidgetLocalNewsChannelService)init
{
  result = (_TtC7NewsUI229WidgetLocalNewsChannelService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end