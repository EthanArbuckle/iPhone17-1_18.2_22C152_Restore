@interface AlertTemplateController
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (NSArray)preferredFocusEnvironments;
- (_TtC8VideosUI23AlertTemplateController)initWithCoder:(id)a3;
- (_TtC8VideosUI23AlertTemplateController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didReceivePhysicalPlayForItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)vui_loadView;
- (void)vui_viewDidDisappear:(BOOL)a3;
- (void)vui_viewDidLayoutSubviews;
@end

@implementation AlertTemplateController

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  sub_1E3515F10();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EADED388);
  v3 = (void *)sub_1E387CC88();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)vui_loadView
{
  v2 = self;
  sub_1E3516738();
}

- (void)vui_viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_1E351688C(a3);
}

- (void)vui_viewDidLayoutSubviews
{
  v2 = self;
  sub_1E35169F8();
}

- (_TtC8VideosUI23AlertTemplateController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1E387C928();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC8VideosUI23AlertTemplateController *)sub_1E3517B24(v5, v7, a4);
}

- (_TtC8VideosUI23AlertTemplateController)initWithCoder:(id)a3
{
  return (_TtC8VideosUI23AlertTemplateController *)sub_1E3517C8C(a3);
}

- (void).cxx_destruct
{
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return sub_1E35180B4();
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7 = sub_1E38764B8();
  OUTLINED_FUNCTION_0_4();
  uint64_t v9 = v8;
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_13();
  sub_1E3876448();
  id v11 = a3;
  v12 = self;
  v13 = (void *)sub_1E35180EC(v11);

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v4, v7);
  return v13;
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  uint64_t v5 = sub_1E38764B8();
  OUTLINED_FUNCTION_0_4();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_8();
  sub_1E3876448();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v4, v5);
  return 0;
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBF83FF0);
  uint64_t v6 = OUTLINED_FUNCTION_7(v5);
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_31();
  uint64_t v9 = v8 - v7;
  id v10 = a3;
  id v11 = self;
  sub_1E35186B8();

  uint64_t v12 = sub_1E38764B8();
  v13 = 0;
  if (__swift_getEnumTagSinglePayload(v9, 1, v12) != 1)
  {
    v13 = (void *)sub_1E3876428();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v9, v12);
  }
  return v13;
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  sub_1E3518968();
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
}

- (void)collectionView:(id)a3 didReceivePhysicalPlayForItemAtIndexPath:(id)a4
{
}

@end