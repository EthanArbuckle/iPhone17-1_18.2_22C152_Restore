@interface PUAudioToolController
- (BOOL)wantsZoomAndPanEnabled;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSArray)leadingToolbarViews;
- (NSString)localizedName;
- (NSString)selectedToolbarIconGlyphName;
- (NSString)toolbarIconAccessibilityLabel;
- (NSString)toolbarIconGlyphName;
- (UIView)centerToolbarView;
- (_TtC15PhotosUIPrivate21PUAudioToolController)initWithCoder:(id)a3;
- (_TtC15PhotosUIPrivate21PUAudioToolController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)toolControllerTag;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)compositionControllerDidChangeForAdjustments:(id)a3;
- (void)setupWithAsset:(id)a3 compositionController:(id)a4 editSource:(id)a5 valuesCalculator:(id)a6;
- (void)slider:(id)a3 willUpdateValue:(double *)a4 withVelocity:(double)a5;
- (void)sliderDidEndScrolling:(id)a3;
- (void)sliderDidScroll:(id)a3;
- (void)sliderWillBeginScrolling:(id)a3;
- (void)sliderWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PUAudioToolController

- (void)viewDidLoad
{
  v2 = self;
  sub_1AEAF09F4();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1AEAF0EA0(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1AEAF0F78(a3);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1AEAF1014();
}

- (_TtC15PhotosUIPrivate21PUAudioToolController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1AEF96DE0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC15PhotosUIPrivate21PUAudioToolController *)sub_1AEAF29B4(v5, v7, a4);
}

- (_TtC15PhotosUIPrivate21PUAudioToolController)initWithCoder:(id)a3
{
  return (_TtC15PhotosUIPrivate21PUAudioToolController *)sub_1AEAF2CF8(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate21PUAudioToolController_toolTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate21PUAudioToolController_audioMixModeCollectionViewContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate21PUAudioToolController_audioMixModeCollectionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate21PUAudioToolController_gradientMask));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate21PUAudioToolController_mixBiasLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate21PUAudioToolController_slider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate21PUAudioToolController_sliderSnappingController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate21PUAudioToolController_muteButton));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1AEF939C0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AEF93980();
  id v10 = a3;
  v11 = self;
  v12 = (void *)sub_1AEAF3110(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  int64_t v7 = sub_1AEAF3358();

  return v7;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_1AEF939C0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AEF93980();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  double v16 = sub_1AEAF340C(v12, v15, (uint64_t)v11);
  double v18 = v17;

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  double v19 = v16;
  double v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1AEF939C0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AEF93980();
  id v10 = a3;
  v11 = self;
  sub_1AEAF3640(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)sliderWillBeginScrolling:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AEAF3E20(v4);
}

- (void)slider:(id)a3 willUpdateValue:(double *)a4 withVelocity:(double)a5
{
  id v8 = a3;
  uint64_t v9 = self;
  sub_1AEAF3FE0(a5, (uint64_t)v9, (uint64_t)a4);
}

- (void)sliderDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AEAF4088(v4);
}

- (void)sliderWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_1AEAF43E4();
}

- (void)sliderDidEndScrolling:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AEAF444C();
}

- (void)setupWithAsset:(id)a3 compositionController:(id)a4 editSource:(id)a5 valuesCalculator:(id)a6
{
  swift_unknownObjectRetain();
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = self;
  sub_1AEAF4580((uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6);
  swift_unknownObjectRelease();
}

- (void)compositionControllerDidChangeForAdjustments:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_1AEF97130();
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = self;
  sub_1AEAF4710(v4);

  swift_bridgeObjectRelease();
}

- (BOOL)wantsZoomAndPanEnabled
{
  return 1;
}

- (NSArray)leadingToolbarViews
{
  if (sub_1AEAF4920())
  {
    sub_1AEA0826C(0, (unint64_t *)&unk_1E9A97350);
    v2 = (void *)sub_1AEF96F60();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (UIView)centerToolbarView
{
  v2 = sub_1AEAF49CC();
  return (UIView *)v2;
}

- (int64_t)toolControllerTag
{
  return 1008;
}

- (NSString)localizedName
{
  return (NSString *)sub_1AEAF4AF4(self, (uint64_t)a2, 0xD00000000000001ALL, 0x80000001AF002650, (uint64_t (*)(void))PULocalizedString);
}

- (NSString)toolbarIconGlyphName
{
  return (NSString *)sub_1AEAF4A70((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_1AEAF4A4C);
}

- (NSString)selectedToolbarIconGlyphName
{
  return (NSString *)sub_1AEAF4A70((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_1AEAF4A4C);
}

- (NSString)toolbarIconAccessibilityLabel
{
  return (NSString *)sub_1AEAF4AF4(self, (uint64_t)a2, 0xD000000000000024, 0x80000001AF002600, MEMORY[0x1E4F911F0]);
}

@end