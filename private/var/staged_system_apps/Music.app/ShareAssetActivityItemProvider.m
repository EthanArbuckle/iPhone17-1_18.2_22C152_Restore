@interface ShareAssetActivityItemProvider
- (_TtC5Music30ShareAssetActivityItemProvider)init;
- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (id)activityViewControllerPlaceholderItem:(id)a3;
@end

@implementation ShareAssetActivityItemProvider

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_10054D384();

  return v6;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  id v4 = a3;
  v5 = self;
  MusicAppDestination.SharePageDescriptor.data.getter();

  v6 = (void *)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();

  return v6;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  v17[3] = &type metadata for Data;
  v17[0] = MusicAppDestination.SharePageDescriptor.data.getter();
  v17[1] = v9;

  v10 = sub_100068990(v17, (uint64_t)&type metadata for Data);
  uint64_t v11 = *(&type metadata for Data - 1);
  __n128 v12 = __chkstk_darwin(v10);
  v14 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v11 + 16))(v14, v12);
  v15 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  (*(void (**)(char *, void *))(v11 + 8))(v14, &type metadata for Data);
  sub_1000760E4((uint64_t)v17);

  return v15;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  uint64_t v7 = type metadata accessor for MusicAppDestination.SharePageDescriptor.Kind();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = self;
  MusicAppDestination.SharePageDescriptor.kind.getter();
  sub_10054B970();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  NSString v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v14;
}

- (_TtC5Music30ShareAssetActivityItemProvider)init
{
  result = (_TtC5Music30ShareAssetActivityItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC5Music30ShareAssetActivityItemProvider_descriptor;
  uint64_t v3 = type metadata accessor for MusicAppDestination.SharePageDescriptor();
  id v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end