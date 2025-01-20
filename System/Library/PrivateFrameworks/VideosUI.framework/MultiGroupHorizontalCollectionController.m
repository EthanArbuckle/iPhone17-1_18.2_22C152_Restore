@interface MultiGroupHorizontalCollectionController
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 selectionMarginsForItemAtIndexPath:(id)a5;
- (_TtC8VideosUI40MultiGroupHorizontalCollectionController)init;
- (_TtC8VideosUI40MultiGroupHorizontalCollectionController)initWithCoder:(id)a3;
- (_TtC8VideosUI40MultiGroupHorizontalCollectionController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)vuiCollectionView:(id)a3 contextMenuConfigurationForItemAt:(id)a4 point:(CGPoint)a5;
- (id)vuiCollectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)vuiCollectionView:(id)a3 didEndDisplaying:(id)a4 for:(id)a5;
- (void)vuiCollectionView:(id)a3 didSelectItemAt:(id)a4;
- (void)vuiCollectionView:(id)a3 willDisplay:(id)a4 for:(id)a5;
- (void)vuiCollectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 at:(id)a6;
- (void)vuiCollectionView:(id)a3 willEndContextMenuInteraction:(id)a4 animator:(id)a5;
- (void)vuiCollectionView:(id)a3 willPerformPreviewActionForMenuWith:(id)a4 animator:(id)a5;
- (void)vuiScrollViewDidEndDecelerating:(id)a3;
- (void)vuiScrollViewDidScroll:(id)a3;
- (void)vui_loadView;
- (void)vui_viewDidLoad;
@end

@implementation MultiGroupHorizontalCollectionController

- (void)vui_loadView
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E36E00DC();
}

- (void)vui_viewDidLoad
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E36E016C();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1E36E0814();
  swift_unknownObjectRelease();
}

- (_TtC8VideosUI40MultiGroupHorizontalCollectionController)init
{
  return (_TtC8VideosUI40MultiGroupHorizontalCollectionController *)sub_1E36E1038();
}

- (_TtC8VideosUI40MultiGroupHorizontalCollectionController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E36E1184();
}

- (_TtC8VideosUI40MultiGroupHorizontalCollectionController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E36E1294();
}

- (void).cxx_destruct
{
  sub_1E2C3BB24((uint64_t)self + OBJC_IVAR____TtC8VideosUI40MultiGroupHorizontalCollectionController_viewImpressioner, &qword_1EBF87B70);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI40MultiGroupHorizontalCollectionController_contextMenuInteractor));
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI40MultiGroupHorizontalCollectionController____lazy_storage___shelfViewLayout));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI40MultiGroupHorizontalCollectionController____lazy_storage___groupCollectionContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI40MultiGroupHorizontalCollectionController_dataSource));
  sub_1E2C3BB24((uint64_t)self + OBJC_IVAR____TtC8VideosUI40MultiGroupHorizontalCollectionController_lastFocusedIndexPath, (uint64_t *)&unk_1EBF83FF0);
  swift_bridgeObjectRelease();
}

- (void)vuiCollectionView:(id)a3 didSelectItemAt:(id)a4
{
  OUTLINED_FUNCTION_8_44();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_3_19();
  id v7 = v4;
  id v8 = v5;
  sub_1E36E3298();

  OUTLINED_FUNCTION_111();
  v9();
}

- (void)vuiCollectionView:(id)a3 willDisplay:(id)a4 for:(id)a5
{
  uint64_t v9 = sub_1E38764B8();
  OUTLINED_FUNCTION_0_4();
  uint64_t v11 = v10;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_20_9();
  sub_1E3876448();
  id v13 = a3;
  id v14 = a4;
  v15 = self;
  sub_1E36E3624((uint64_t)v15, v14);

  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v5, v9);
}

- (void)vuiCollectionView:(id)a3 didEndDisplaying:(id)a4 for:(id)a5
{
  uint64_t v9 = sub_1E38764B8();
  OUTLINED_FUNCTION_0_4();
  uint64_t v11 = v10;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_20_9();
  sub_1E3876448();
  id v13 = a3;
  id v14 = a4;
  v15 = self;
  sub_1E36E38FC();

  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v5, v9);
}

- (void)vuiCollectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 at:(id)a6
{
  sub_1E38764B8();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_14();
  sub_1E387C928();
  sub_1E3876448();
  swift_bridgeObjectRelease();
  uint64_t v7 = OUTLINED_FUNCTION_55_0();
  v8(v7);
}

- (void)vuiScrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  OUTLINED_FUNCTION_81();
  sub_1E36E3B80();
}

- (void)vuiScrollViewDidScroll:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1E36E3BEC(v4);
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBF83FF0);
  uint64_t v11 = OUTLINED_FUNCTION_7(v10);
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_8_0();
  if (a5)
  {
    sub_1E3876448();
    uint64_t v12 = sub_1E38764B8();
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v12 = sub_1E38764B8();
    uint64_t v13 = 1;
  }
  __swift_storeEnumTagSinglePayload(v5, v13, 1, v12);
  id v14 = a3;
  id v15 = a4;
  v16 = self;
  sub_1E36E3D3C();

  sub_1E2C3BB24(v5, (uint64_t *)&unk_1EBF83FF0);
  double v17 = OUTLINED_FUNCTION_28_4();
  result.height = v18;
  result.width = v17;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v8 = OUTLINED_FUNCTION_10_4((uint64_t)self, (uint64_t)a2, a3);
  id v9 = v6;
  id v10 = v7;
  sub_1E36E45AC((uint64_t)v10, v11, v5);

  double v12 = OUTLINED_FUNCTION_28_4();
  result.height = v13;
  result.width = v12;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v8 = OUTLINED_FUNCTION_10_4((uint64_t)self, (uint64_t)a2, a3);
  id v9 = v6;
  id v10 = v7;
  sub_1E36E49B8((uint64_t)v10, v11, v5);
  OUTLINED_FUNCTION_22_0();

  double v12 = OUTLINED_FUNCTION_44();
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 selectionMarginsForItemAtIndexPath:(id)a5
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBF83FF0);
  uint64_t v11 = OUTLINED_FUNCTION_7(v10);
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_8_0();
  if (a5)
  {
    sub_1E3876448();
    uint64_t v12 = sub_1E38764B8();
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v12 = sub_1E38764B8();
    uint64_t v13 = 1;
  }
  __swift_storeEnumTagSinglePayload(v5, v13, 1, v12);
  id v14 = a3;
  id v15 = a4;
  v16 = self;
  sub_1E36E4A9C(a3, v17, v5);
  OUTLINED_FUNCTION_22_0();

  sub_1E2C3BB24(v5, (uint64_t *)&unk_1EBF83FF0);
  double v18 = OUTLINED_FUNCTION_44();
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (id)vuiCollectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = sub_1E36E6E1C(v6, v7);

  return v9;
}

- (id)vuiCollectionView:(id)a3 contextMenuConfigurationForItemAt:(id)a4 point:(CGPoint)a5
{
  OUTLINED_FUNCTION_8_44();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_3_19();
  id v9 = v5;
  id v10 = v6;
  uint64_t v11 = (void *)OUTLINED_FUNCTION_11_4();
  uint64_t v12 = sub_1E36E6EC8(v11, v7);

  OUTLINED_FUNCTION_111();
  v13();
  return v12;
}

- (void)vuiCollectionView:(id)a3 willPerformPreviewActionForMenuWith:(id)a4 animator:(id)a5
{
  id v7 = OUTLINED_FUNCTION_10_4((uint64_t)self, (uint64_t)a2, a3);
  id v8 = v5;
  swift_unknownObjectRetain();
  id v9 = v6;
  OUTLINED_FUNCTION_81();
  sub_1E36E7068();

  swift_unknownObjectRelease();
}

- (void)vuiCollectionView:(id)a3 willEndContextMenuInteraction:(id)a4 animator:(id)a5
{
  id v8 = OUTLINED_FUNCTION_10_4((uint64_t)self, (uint64_t)a2, a3);
  id v9 = v6;
  swift_unknownObjectRetain();
  id v10 = v7;
  sub_1E36E7110((uint64_t)v10, v9, v5);

  swift_unknownObjectRelease();
}

@end