@interface LiveActivityWebEmbedAttributesProvider
- (BOOL)supportsLiveActivities;
- (_TtC7NewsUI238LiveActivityWebEmbedAttributesProvider)init;
@end

@implementation LiveActivityWebEmbedAttributesProvider

- (BOOL)supportsLiveActivities
{
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa+ OBJC_IVAR____TtC7NewsUI238LiveActivityWebEmbedAttributesProvider_liveActivityManager), *(void *)&self->liveActivityManager[OBJC_IVAR____TtC7NewsUI238LiveActivityWebEmbedAttributesProvider_liveActivityManager+ 16]);
  v3 = self;
  char v4 = sub_1DFDEFE80();

  return v4 & 1;
}

- (_TtC7NewsUI238LiveActivityWebEmbedAttributesProvider)init
{
  result = (_TtC7NewsUI238LiveActivityWebEmbedAttributesProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end