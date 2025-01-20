@interface LemonadeOneUpPresentationDelegate
- (BOOL)oneUpPresentationWantsShowInLibraryButton:(id)a3;
- (_TtC12PhotosUICoreP33_7168310A7BB869661DCEBE4E2645382233LemonadeOneUpPresentationDelegate)init;
- (id)oneUpPresentation:(id)a3 presentingScrollViewForAssetReference:(id)a4;
- (id)oneUpPresentation:(id)a3 regionOfInterestForAssetReference:(id)a4;
- (id)oneUpPresentationDataSourceManager:(id)a3;
- (id)oneUpPresentationInitialAssetReference:(id)a3;
- (id)oneUpPresentationMediaProvider:(id)a3;
- (int64_t)oneUpPresentationOrigin:(id)a3;
- (void)oneUpPresentation:(id)a3 scrollAssetReferenceToVisible:(id)a4;
- (void)oneUpPresentation:(id)a3 setHiddenAssetReferences:(id)a4;
@end

@implementation LemonadeOneUpPresentationDelegate

- (id)oneUpPresentationDataSourceManager:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC12PhotosUICoreP33_7168310A7BB869661DCEBE4E2645382233LemonadeOneUpPresentationDelegate_assetsDataSourceManager));
}

- (id)oneUpPresentationMediaProvider:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC12PhotosUICoreP33_7168310A7BB869661DCEBE4E2645382233LemonadeOneUpPresentationDelegate_mediaProvider));
}

- (int64_t)oneUpPresentationOrigin:(id)a3
{
  return 0;
}

- (id)oneUpPresentation:(id)a3 regionOfInterestForAssetReference:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = sub_1AA1732CC(v7);

  return v9;
}

- (void)oneUpPresentation:(id)a3 scrollAssetReferenceToVisible:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1AA172670(v6, v7);
}

- (void)oneUpPresentation:(id)a3 setHiddenAssetReferences:(id)a4
{
  uint64_t v4 = (uint64_t)a4;
  if (a4)
  {
    sub_1A9B21070(0, &qword_1E9819B80);
    sub_1AA176964();
    uint64_t v4 = sub_1AB23AFCC();
  }
  id v7 = a3;
  v8 = self;
  sub_1AA1769CC(v4);
}

- (id)oneUpPresentationInitialAssetReference:(id)a3
{
  uint64_t v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC12PhotosUICoreP33_7168310A7BB869661DCEBE4E2645382233LemonadeOneUpPresentationDelegate_assetsDataSourceManager);
  id v5 = a3;
  id v6 = self;
  id v7 = objc_msgSend(v4, sel_dataSource);
  uint64_t v8 = *(uint64_t *)((char *)&v6->super.isa
                  + OBJC_IVAR____TtC12PhotosUICoreP33_7168310A7BB869661DCEBE4E2645382233LemonadeOneUpPresentationDelegate_initialAsset);
  objc_msgSend(v7, sel_indexPathForObjectID_, v8);
  long long v14 = v15;
  uint64_t v9 = v16;
  uint64_t v10 = v17;
  id v11 = objc_allocWithZone((Class)off_1E5DA55E0);
  long long v15 = v14;
  uint64_t v16 = v9;
  uint64_t v17 = v10;
  id v12 = objc_msgSend(v11, sel_initWithSectionObject_itemObject_subitemObject_indexPath_, 0, v8, 0, &v15);

  return v12;
}

- (BOOL)oneUpPresentationWantsShowInLibraryButton:(id)a3
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC12PhotosUICoreP33_7168310A7BB869661DCEBE4E2645382233LemonadeOneUpPresentationDelegate_wantsShowInLibraryButton);
}

- (id)oneUpPresentation:(id)a3 presentingScrollViewForAssetReference:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1AA176A8C(v7);
  uint64_t v10 = v9;

  return v10;
}

- (_TtC12PhotosUICoreP33_7168310A7BB869661DCEBE4E2645382233LemonadeOneUpPresentationDelegate)init
{
  result = (_TtC12PhotosUICoreP33_7168310A7BB869661DCEBE4E2645382233LemonadeOneUpPresentationDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_7168310A7BB869661DCEBE4E2645382233LemonadeOneUpPresentationDelegate_initialAsset));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_7168310A7BB869661DCEBE4E2645382233LemonadeOneUpPresentationDelegate_assetsDataSourceManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_7168310A7BB869661DCEBE4E2645382233LemonadeOneUpPresentationDelegate_mediaProvider));
  swift_unknownObjectUnownedDestroy();
  sub_1AA176C00((uint64_t)self+ OBJC_IVAR____TtC12PhotosUICoreP33_7168310A7BB869661DCEBE4E2645382233LemonadeOneUpPresentationDelegate_context);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_7168310A7BB869661DCEBE4E2645382233LemonadeOneUpPresentationDelegate_sourceImageViewSpec));
  swift_bridgeObjectRelease();
}

@end