@interface PhotosSearchResultViewController
- (_TtC12PhotosUICore32PhotosSearchResultViewController)initWithCoder:(id)a3;
- (_TtC12PhotosUICore32PhotosSearchResultViewController)initWithConfiguration:(id)a3;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)viewDidLoad;
@end

@implementation PhotosSearchResultViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1AA4BA294();
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    v8 = sub_1AA24EFF8;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = a3;
  v11 = self;
  sub_1AA4BA418((uint64_t)v10, a4, (uint64_t)v8, v9);
  sub_1A9BB8934((uint64_t)v8);
}

- (_TtC12PhotosUICore32PhotosSearchResultViewController)initWithConfiguration:(id)a3
{
  *(void *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC12PhotosUICore32PhotosSearchResultViewController_searchDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12PhotosUICore32PhotosSearchResultViewController_debugAssetRetrievalTypeMap) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PhotosSearchResultViewController();
  return [(PXPhotosUIViewController *)&v6 initWithConfiguration:a3];
}

- (_TtC12PhotosUICore32PhotosSearchResultViewController)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC12PhotosUICore32PhotosSearchResultViewController_searchDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12PhotosUICore32PhotosSearchResultViewController_debugAssetRetrievalTypeMap) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PhotosSearchResultViewController();
  return [(PXPhotosUIViewController *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_1A9D6D380((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore32PhotosSearchResultViewController_searchDelegate);
  swift_bridgeObjectRelease();
}

@end