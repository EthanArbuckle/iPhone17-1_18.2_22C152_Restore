@interface OfferSelectionTemplateController
- (_TtC8VideosUI32OfferSelectionTemplateController)initWithCoder:(id)a3;
- (void)vuiCollectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 at:(id)a6;
- (void)vui_viewDidAppear:(BOOL)a3;
- (void)vui_viewDidLayoutSubviews;
@end

@implementation OfferSelectionTemplateController

- (_TtC8VideosUI32OfferSelectionTemplateController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E376FA34();
}

- (void)vui_viewDidLayoutSubviews
{
  v2 = self;
  sub_1E377012C();
}

- (void)vui_viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1E3770278(a3);
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_2_220((void **)((char *)&self->super.super.super.super.super.isa
                                  + OBJC_IVAR____TtC8VideosUI32OfferSelectionTemplateController____lazy_storage___pinningFooterView));
}

- (void)vuiCollectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 at:(id)a6
{
  sub_1E38764B8();
  OUTLINED_FUNCTION_0_10();
  uint64_t v10 = v9;
  MEMORY[0x1F4188790](v11);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E387C928();
  sub_1E3876448();
  id v14 = a3;
  id v15 = a4;
  v16 = self;
  sub_1E37703A4((uint64_t)v14, (uint64_t)v15);

  swift_bridgeObjectRelease();
  (*(void (**)(char *))(v10 + 8))(v13);
}

@end