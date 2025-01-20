@interface StackViewController
- (BOOL)collectionView:(id)a3 dragSessionAllowsMoveOperation:(id)a4;
- (BOOL)collectionView:(id)a3 dragSessionIsRestrictedToDraggingApplication:(id)a4;
- (BOOL)shouldRubberbandElementWithCategory:(unint64_t)a3 in:(id)a4 at:(id)a5;
- (BOOL)vui_handleActionInCell:(id)a3 fromSubview:(id)a4 details:(id)a5;
- (_TtC8VideosUI19StackViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI19StackViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 dropPreviewParametersForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)vuiCollectionView:(id)a3 contextMenuConfigurationForItemAt:(id)a4 point:(CGPoint)a5;
- (id)vuiCollectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4;
- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)vuiCollectionView:(id)a3 didEndDisplaying:(id)a4 for:(id)a5;
- (void)vuiCollectionView:(id)a3 didSelectItemAt:(id)a4;
- (void)vuiCollectionView:(id)a3 orthogonalScrollViewDidScroll:(id)a4 section:(int64_t)a5;
- (void)vuiCollectionView:(id)a3 willDisplay:(id)a4 for:(id)a5;
- (void)vuiCollectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 at:(id)a6;
- (void)vuiCollectionView:(id)a3 willEndContextMenuInteraction:(id)a4 animator:(id)a5;
- (void)vuiCollectionView:(id)a3 willPerformPreviewActionForMenuWith:(id)a4 animator:(id)a5;
- (void)vuiScrollViewDidEndScrollingAnimation:(id)a3;
- (void)vuiScrollViewDidScroll:(id)a3;
- (void)vui_cellNeedsReloading:(id)a3;
- (void)vui_viewDidAppear:(BOOL)a3;
- (void)vui_viewDidLayoutSubviews;
- (void)vui_viewDidLoad;
@end

@implementation StackViewController

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  sub_1E38764B8();
  OUTLINED_FUNCTION_0_6();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_20_9();
  sub_1E3876448();
  id v9 = a3;
  swift_unknownObjectRetain();
  v10 = self;
  sub_1E31B6704((uint64_t)v10, v11, v5);

  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_53_0();
  v12();
  sub_1E2BE915C(0, &qword_1EADEC358);
  v13 = (void *)sub_1E387CC88();
  swift_bridgeObjectRelease();
  return v13;
}

- (BOOL)collectionView:(id)a3 dragSessionIsRestrictedToDraggingApplication:(id)a4
{
  return 1;
}

- (BOOL)collectionView:(id)a3 dragSessionAllowsMoveOperation:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  char v7 = sub_1E31B6D64();

  swift_unknownObjectRelease();
  return v7 & 1;
}

- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4
{
  return sub_1E31B73BC(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(void))sub_1E31B6F70);
}

- (id)collectionView:(id)a3 dropPreviewParametersForItemAtIndexPath:(id)a4
{
  return sub_1E31B73BC(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(void))sub_1E31B834C);
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  char v7 = self;
  sub_1E31B74A0(v6, a4);

  swift_unknownObjectRelease();
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBF83FF0);
  MEMORY[0x1F4188790](v8 - 8);
  OUTLINED_FUNCTION_31();
  uint64_t v11 = v10 - v9;
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
  __swift_storeEnumTagSinglePayload(v11, v13, 1, v12);
  id v14 = a3;
  swift_unknownObjectRetain();
  v15 = self;
  id v16 = sub_1E31B807C();

  swift_unknownObjectRelease();
  sub_1E2BEA418(v11, (uint64_t *)&unk_1EBF83FF0);
  return v16;
}

- (_TtC8VideosUI19StackViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E37F2AE8();
}

- (void)vui_viewDidLoad
{
  v2 = self;
  sub_1E37F2DA0();
}

- (void)vui_viewDidAppear:(BOOL)a3
{
  id v3 = self;
  sub_1E37F353C();
}

- (void)vui_viewDidLayoutSubviews
{
  v2 = self;
  sub_1E37F38B0();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  uint64_t v8 = self;
  sub_1E37F4230(a4, width, height);
  swift_unknownObjectRelease();
}

- (_TtC8VideosUI19StackViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E37F6504();
}

- (void).cxx_destruct
{
  sub_1E2BEA270((uint64_t)self + OBJC_IVAR____TtC8VideosUI19StackViewController_collectionImpressioner, &qword_1EBF8B120);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI19StackViewController____lazy_storage___collectionView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI19StackViewController____lazy_storage___dataSource));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1E2C5FB90(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI19StackViewController_cellConfigurator));
  sub_1E2C5FB90(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI19StackViewController_cellActionInterceptor));
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF84080);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_47();
  v3();
  sub_1E320309C(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI19StackViewController_verticalPaginationMonitor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI19StackViewController_contextMenuInteractor));
  v4 = (char *)self + OBJC_IVAR____TtC8VideosUI19StackViewController_signpostID;
  sub_1E3877478();
  OUTLINED_FUNCTION_2();
  char v7 = *(void (**)(char *, uint64_t))(v6 + 8);
  v7(v4, v5);
}

- (void)vuiCollectionView:(id)a3 willDisplay:(id)a4 for:(id)a5
{
}

- (void)vuiCollectionView:(id)a3 didEndDisplaying:(id)a4 for:(id)a5
{
}

- (void)vuiCollectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 at:(id)a6
{
  uint64_t v7 = sub_1E38764B8();
  OUTLINED_FUNCTION_0_4();
  uint64_t v9 = v8;
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_14();
  sub_1E387C928();
  sub_1E3876448();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v6, v7);
}

- (void)vuiCollectionView:(id)a3 didSelectItemAt:(id)a4
{
  OUTLINED_FUNCTION_8_44();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_3_19();
  id v7 = v4;
  id v8 = v5;
  sub_1E37F75E0();

  uint64_t v9 = OUTLINED_FUNCTION_7_2();
  v10(v9);
}

- (void)vuiCollectionView:(id)a3 orthogonalScrollViewDidScroll:(id)a4 section:(int64_t)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  uint64_t v9 = self;
  sub_1E37F7850(v8, a4, a5);

  swift_unknownObjectRelease();
}

- (id)vuiCollectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = sub_1E37F8254(v6, v7);

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
  uint64_t v11 = sub_1E37F8300(v9, v7);

  uint64_t v12 = OUTLINED_FUNCTION_7_2();
  v13(v12);
  return v11;
}

- (void)vuiCollectionView:(id)a3 willPerformPreviewActionForMenuWith:(id)a4 animator:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  id v9 = self;
  sub_1E37F84D0();

  swift_unknownObjectRelease();
}

- (void)vuiCollectionView:(id)a3 willEndContextMenuInteraction:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  id v10 = self;
  sub_1E37F8588((uint64_t)v10, v9, a5);

  swift_unknownObjectRelease();
}

- (void)vuiScrollViewDidEndScrollingAnimation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = (void *)OUTLINED_FUNCTION_0_25();
  sub_1E37F8730(v6);
}

- (void)vuiScrollViewDidScroll:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = (void *)OUTLINED_FUNCTION_0_25();
  sub_1E37F8864(v6);
}

- (BOOL)shouldRubberbandElementWithCategory:(unint64_t)a3 in:(id)a4 at:(id)a5
{
  sub_1E38764B8();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_6();
  sub_1E3876448();
  id v9 = a4;
  id v10 = self;
  LOBYTE(a3) = sub_1E37F89F8(a3, v9);

  OUTLINED_FUNCTION_107();
  OUTLINED_FUNCTION_53_0();
  v11();
  return a3 & 1;
}

- (void)vui_cellNeedsReloading:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  OUTLINED_FUNCTION_0_25();
  sub_1E37F8BA8();
}

- (BOOL)vui_handleActionInCell:(id)a3 fromSubview:(id)a4 details:(id)a5
{
  uint64_t v8 = sub_1E387C678();
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = self;
  uint64_t v12 = OUTLINED_FUNCTION_64_2();
  LOBYTE(a4) = sub_1E37F8FF8(v12, (uint64_t)a4, v8);

  swift_bridgeObjectRelease();
  return a4 & 1;
}

@end