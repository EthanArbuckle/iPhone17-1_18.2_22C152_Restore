@interface TPSSharingActivityItemSource
- (UIImage)appIcon;
- (UIImage)preview;
- (_TtC4Tips28TPSSharingActivityItemSource)init;
- (_TtC4Tips28TPSSharingActivityItemSource)initWithTip:(id)a3;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (id)activityViewControllerPlaceholderItem:(id)a3;
@end

@implementation TPSSharingActivityItemSource

- (_TtC4Tips28TPSSharingActivityItemSource)initWithTip:(id)a3
{
  id v3 = a3;
  v4 = (_TtC4Tips28TPSSharingActivityItemSource *)sub_1000739A0(v3);

  return v4;
}

- (UIImage)appIcon
{
  id v2 = sub_100073B10();

  return (UIImage *)v2;
}

- (UIImage)preview
{
  id v2 = self;
  id v3 = sub_100073704();

  return (UIImage *)v3;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_100073DC0();

  return v6;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  id v3 = (void *)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();

  return v3;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return 0;
}

- (_TtC4Tips28TPSSharingActivityItemSource)init
{
  result = (_TtC4Tips28TPSSharingActivityItemSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Tips28TPSSharingActivityItemSource_assetsConfiguration);
}

@end