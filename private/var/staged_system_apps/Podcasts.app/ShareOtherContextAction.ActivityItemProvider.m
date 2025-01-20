@interface ShareOtherContextAction.ActivityItemProvider
- (_TtCC8Podcasts23ShareOtherContextActionP33_EEA9E3C8BAC5199A99988C7A83F9625320ActivityItemProvider)init;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (id)activityViewControllerPlaceholderItem:(id)a3;
@end

@implementation ShareOtherContextAction.ActivityItemProvider

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  swift_bridgeObjectRetain();
  v3 = (void *)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();

  return v3;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  swift_bridgeObjectRetain();
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v4;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  uint64_t v5 = type metadata accessor for URL();
  __chkstk_darwin();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)self+ OBJC_IVAR____TtCC8Podcasts23ShareOtherContextActionP33_EEA9E3C8BAC5199A99988C7A83F9625320ActivityItemProvider_link, v5);
  v8 = (void *)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();

  return v8;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v5 = objc_allocWithZone((Class)LPLinkMetadata);
  id v6 = a3;
  uint64_t v7 = self;
  id v8 = [v5 init];
  URL._bridgeToObjectiveC()((NSURL *)OBJC_IVAR____TtCC8Podcasts23ShareOtherContextActionP33_EEA9E3C8BAC5199A99988C7A83F9625320ActivityItemProvider_link);
  uint64_t v10 = v9;
  [v8 setURL:v9];

  NSString v11 = String._bridgeToObjectiveC()();
  [v8 setTitle:v11];

  return v8;
}

- (_TtCC8Podcasts23ShareOtherContextActionP33_EEA9E3C8BAC5199A99988C7A83F9625320ActivityItemProvider)init
{
  result = (_TtCC8Podcasts23ShareOtherContextActionP33_EEA9E3C8BAC5199A99988C7A83F9625320ActivityItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self
     + OBJC_IVAR____TtCC8Podcasts23ShareOtherContextActionP33_EEA9E3C8BAC5199A99988C7A83F9625320ActivityItemProvider_link;
  uint64_t v4 = type metadata accessor for URL();
  id v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end