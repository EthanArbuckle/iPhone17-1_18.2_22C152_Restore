@interface SharedWithYouItemObserver
- (_TtC12PhotosUICore25SharedWithYouItemObserver)init;
- (void)assetFetchResultProvider:(id)a3 didChangeAssetFetchResult:(id)a4 forAssetCollection:(id)a5;
- (void)socialLayerHighlightProvider:(id)a3 didChangeSocialLayerHighlight:(id)a4 forAsset:(id)a5;
@end

@implementation SharedWithYouItemObserver

- (void)assetFetchResultProvider:(id)a3 didChangeAssetFetchResult:(id)a4 forAssetCollection:(id)a5
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v7 = self;
  sub_1AA0D512C(a4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)socialLayerHighlightProvider:(id)a3 didChangeSocialLayerHighlight:(id)a4 forAsset:(id)a5
{
  swift_getKeyPath();
  sub_1AA0D5474(&qword_1E9829958, (void (*)(uint64_t))type metadata accessor for SharedWithYouItemObserver);
  swift_unknownObjectRetain();
  id v7 = a4;
  swift_unknownObjectRetain();
  v8 = self;
  sub_1AB230B5C();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  swift_release();
}

- (_TtC12PhotosUICore25SharedWithYouItemObserver)init
{
  result = (_TtC12PhotosUICore25SharedWithYouItemObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC12PhotosUICore25SharedWithYouItemObserver___observationRegistrar;
  uint64_t v4 = sub_1AB230BAC();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end