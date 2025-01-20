@interface PXPhotosContentInlinePlaybackController
- (BOOL)canPlayAsset:(id)a3;
- (BOOL)isContentViewVisible;
- (BOOL)isDisplayAssetEligibleForAutoPlayback:(id)a3;
- (BOOL)shouldDisplayPreviousNonNullPixelBufferForPixelBufferSource:(id)a3;
- (BOOL)shouldEnablePlayback;
- (CGRect)currentVisibleRect;
- (CGRect)frameForPlaybackRecord:(id)a3 minPlayableSize:(CGSize *)a4;
- (NSString)debugDescription;
- (PXDisplayAsset)currentHoveredDisplayAsset;
- (PXPhotosContentInlinePlaybackController)init;
- (PXPhotosContentInlinePlaybackControllerDelegate)delegate;
- (PXScrollViewSpeedometer)scrollViewSpeedometer;
- (UIEdgeInsets)criticallyVisibleEdgeInsets;
- (id)createPlaybackRecordForDisplayAsset:(id)a3 mediaProvider:(id)a4 geometryReference:(id)a5;
- (id)filterSortedRecordsToPlay:(id)a3;
- (id)pixelBufferSourceForDisplayAsset:(id)a3 mediaProvider:(id)a4 spriteReference:(id)a5;
- (int64_t)maxNumberOfPlayingItems;
- (int64_t)numberOfItemsToPlay;
- (void)recyclePixelBufferSourceForDisplayAssets:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsContentViewVisible:(BOOL)a3;
- (void)setNumberOfItemsToPlay:(int64_t)a3;
- (void)setScrollViewSpeedometer:(id)a3;
@end

@implementation PXPhotosContentInlinePlaybackController

- (int64_t)numberOfItemsToPlay
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___PXPhotosContentInlinePlaybackController_numberOfItemsToPlay);
  swift_beginAccess();
  return *v2;
}

- (void)setNumberOfItemsToPlay:(int64_t)a3
{
  v5 = (int64_t *)((char *)self + OBJC_IVAR___PXPhotosContentInlinePlaybackController_numberOfItemsToPlay);
  swift_beginAccess();
  int64_t v6 = *v5;
  int64_t *v5 = a3;
  v7 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.isa) + 0x70);
  v8 = self;
  if (v6 > 0 == v7() < 1) {
    [(PXGridInlinePlaybackController *)v8 invalidatePlaybackEnabled];
  }
}

- (PXScrollViewSpeedometer)scrollViewSpeedometer
{
  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___PXPhotosContentInlinePlaybackController_scrollViewSpeedometer);
  swift_beginAccess();
  return (PXScrollViewSpeedometer *)*v2;
}

- (void)setScrollViewSpeedometer:(id)a3
{
  v5 = (void **)((char *)&self->super.super.isa
               + OBJC_IVAR___PXPhotosContentInlinePlaybackController_scrollViewSpeedometer);
  swift_beginAccess();
  int64_t v6 = *v5;
  int64_t *v5 = a3;
  id v7 = a3;
  v8 = self;
  sub_1AA889878(v6);
}

- (PXPhotosContentInlinePlaybackControllerDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___PXPhotosContentInlinePlaybackController_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1AD10DA80](v2);
  return (PXPhotosContentInlinePlaybackControllerDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (id)pixelBufferSourceForDisplayAsset:(id)a3 mediaProvider:(id)a4 spriteReference:(id)a5
{
  swift_unknownObjectRetain();
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = [(PXGridInlinePlaybackController *)v11 checkOutPlaybackRecordForDisplayAsset:a3 mediaProvider:v9 geometryReference:v10];
  if (v12)
  {
    v13 = v12;
    v14 = (void *)swift_dynamicCastObjCProtocolConditional();

    if (!v14) {
  }
    }
  else
  {

    v14 = 0;
  }
  swift_unknownObjectRelease();

  return v14;
}

- (void)recyclePixelBufferSourceForDisplayAssets:(id)a3
{
  sub_1A9DE69E8();
  sub_1AB23AADC();
  v4 = self;
  id v5 = (id)sub_1AB23AABC();
  [(PXGridInlinePlaybackController *)v4 checkInPlaybackRecordForDisplayAssets:v5];

  swift_bridgeObjectRelease();
}

- (BOOL)shouldDisplayPreviousNonNullPixelBufferForPixelBufferSource:(id)a3
{
  return [(PXPhotosContentInlinePlaybackController *)self isContentViewVisible];
}

- (BOOL)isContentViewVisible
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PhotosContentInlinePlaybackController();
  return [(PXGridInlinePlaybackController *)&v3 isContentViewVisible];
}

- (void)setIsContentViewVisible:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PhotosContentInlinePlaybackController();
  [(PXGridInlinePlaybackController *)&v4 setIsContentViewVisible:v3];
}

- (id)createPlaybackRecordForDisplayAsset:(id)a3 mediaProvider:(id)a4 geometryReference:(id)a5
{
  swift_unknownObjectRetain();
  id v8 = a4;
  swift_unknownObjectRetain();
  id v9 = self;
  sub_1AB23BC4C();
  swift_unknownObjectRelease();
  id v10 = sub_1AA88A0C8(a3, a4, (uint64_t)v12);
  swift_unknownObjectRelease();

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v10;
}

- (BOOL)canPlayAsset:(id)a3
{
  return sub_1AA88A980(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_canPlay_);
}

- (BOOL)shouldEnablePlayback
{
  v2 = (void *)MEMORY[0x1E4FBC8C8];
  BOOL v3 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.isa) + 0x70);
  objc_super v4 = self;
  if (v3() < 1
    || (id v5 = (void *)(*(uint64_t (**)(void))((*v2 & (uint64_t)v4->super.super.isa) + 0xA0))()) != 0
    && (unsigned __int8 v6 = objc_msgSend(v5, sel_shouldEnablePlaybackFor_, v4),
        swift_unknownObjectRelease(),
        (v6 & 1) == 0))
  {

    return 0;
  }
  else
  {
    unsigned __int8 v7 = objc_msgSend(self, sel_px_accessibilityIsReduceMotionEnabled);

    return v7 ^ 1;
  }
}

- (NSString)debugDescription
{
  v2 = self;
  sub_1AA88A44C();

  BOOL v3 = (void *)sub_1AB23A72C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (CGRect)currentVisibleRect
{
  v2 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.isa) + 0xA0);
  BOOL v3 = self;
  objc_super v4 = (void *)v2();
  if (v4)
  {
    id v5 = v4;
    objc_msgSend(v4, sel_visibleRectFor_, v3);
    objc_msgSend(v5, sel_safeAreaInsetsFor_, v3);
    PXEdgeInsetsInsetRect();
  }

  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = 0.0;
  double v9 = 0.0;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (UIEdgeInsets)criticallyVisibleEdgeInsets
{
  double v2 = *MEMORY[0x1E4FB2848];
  double v3 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v4 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGRect)frameForPlaybackRecord:(id)a3 minPlayableSize:(CGSize *)a4
{
  id v6 = a3;
  double v7 = self;
  sub_1AA88A798(v6, (uint64_t)a4);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (PXDisplayAsset)currentHoveredDisplayAsset
{
  return (PXDisplayAsset *)0;
}

- (BOOL)isDisplayAssetEligibleForAutoPlayback:(id)a3
{
  return sub_1AA88A980(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_isDisplayAssetEligibleForAutoPlayback_);
}

- (id)filterSortedRecordsToPlay:(id)a3
{
  sub_1A9B21070(0, &qword_1E983C030);
  unint64_t v4 = sub_1AB23AADC();
  double v5 = self;
  sub_1AA88AA40(v4);
}

- (int64_t)maxNumberOfPlayingItems
{
  double v2 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.isa) + 0x70);
  double v3 = self;
  int64_t v4 = v2();

  return v4;
}

- (PXPhotosContentInlinePlaybackController)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___PXPhotosContentInlinePlaybackController_numberOfItemsToPlay) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___PXPhotosContentInlinePlaybackController_scrollViewSpeedometer) = 0;
  swift_unknownObjectWeakInit();
  double v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR___PXPhotosContentInlinePlaybackController_scrollViewSpeedometerObservation);
  int64_t v4 = (objc_class *)type metadata accessor for PhotosContentInlinePlaybackController();
  void *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(PXGridInlinePlaybackController *)&v6 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___PXPhotosContentInlinePlaybackController_scrollViewSpeedometer));
  sub_1A9D6D380((uint64_t)self + OBJC_IVAR___PXPhotosContentInlinePlaybackController_delegate);
  swift_unknownObjectRelease();
}

@end