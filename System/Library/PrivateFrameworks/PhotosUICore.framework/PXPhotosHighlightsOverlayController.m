@interface PXPhotosHighlightsOverlayController
- (BOOL)canHandleObjectReference:(id)a3;
- (NSArray)availableLenses;
- (PXPhotosHighlightsOverlayController)init;
- (PXPhotosHighlightsOverlayController)initWithPhotoLibrary:(id)a3;
- (PXPhotosLensControlItem)currentLens;
- (PXPhotosOverlayControllerDelegate)delegate;
- (PXPhotosViewModel)photosViewModel;
- (id)overlayLayoutProvider;
- (void)handleTapWithHitTestResult:(id)a3;
- (void)setCurrentLens:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPhotosViewModel:(id)a3;
@end

@implementation PXPhotosHighlightsOverlayController

- (PXPhotosHighlightsOverlayController)initWithPhotoLibrary:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PXPhotosHighlightsOverlayController____lazy_storage___rootLayout) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PXPhotosHighlightsOverlayController_currentLens) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PXPhotosHighlightsOverlayController_photosViewModel) = 0;
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.isa + OBJC_IVAR___PXPhotosHighlightsOverlayController_isSwitchingLens) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PXPhotosHighlightsOverlayController_photoLibrary) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PhotosHighlightsOverlayController();
  id v5 = a3;
  return [(PXPhotosHighlightsOverlayController *)&v7 init];
}

- (id)overlayLayoutProvider
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = self;
  v7[4] = sub_1AA76B7F4;
  v7[5] = v3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 1107296256;
  v7[2] = sub_1A9F10B0C;
  v7[3] = &block_descriptor_236;
  v4 = _Block_copy(v7);
  id v5 = self;
  swift_release();
  return v4;
}

- (NSArray)availableLenses
{
  sub_1A9CD3AF4();
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1AB2EDD40;
  uint64_t v4 = qword_1E98BAB38;
  id v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  swift_beginAccess();
  *(void *)(v3 + 32) = qword_1E98BAB40;
  uint64_t v6 = qword_1E98BAB48;
  swift_unknownObjectRetain();
  if (v6 != -1) {
    swift_once();
  }
  swift_beginAccess();
  *(void *)(v3 + 40) = qword_1E98BAB50;
  sub_1AB23AAFC();
  swift_unknownObjectRetain();

  sub_1AA377758();
  objc_super v7 = (void *)sub_1AB23AABC();
  swift_bridgeObjectRelease();
  return (NSArray *)v7;
}

- (PXPhotosLensControlItem)currentLens
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();
  return (PXPhotosLensControlItem *)v2;
}

- (void)setCurrentLens:(id)a3
{
  id v5 = (id *)((char *)&self->super.isa + OBJC_IVAR___PXPhotosHighlightsOverlayController_currentLens);
  swift_beginAccess();
  *id v5 = a3;
  swift_unknownObjectRetain_n();
  uint64_t v6 = self;
  sub_1AA769C04();
}

- (PXPhotosViewModel)photosViewModel
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___PXPhotosHighlightsOverlayController_photosViewModel);
  swift_beginAccess();
  return (PXPhotosViewModel *)*v2;
}

- (void)setPhotosViewModel:(id)a3
{
  uint64_t v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___PXPhotosHighlightsOverlayController_photosViewModel);
  swift_beginAccess();
  id v5 = *v4;
  void *v4 = a3;
  id v6 = a3;
}

- (PXPhotosOverlayControllerDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___PXPhotosHighlightsOverlayController_delegate;
  swift_beginAccess();
  uint64_t v3 = (void *)MEMORY[0x1AD10DA80](v2);
  return (PXPhotosOverlayControllerDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (void)handleTapWithHitTestResult:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AA76A7B4(v4);
}

- (BOOL)canHandleObjectReference:(id)a3
{
  return swift_dynamicCastClass() != 0;
}

- (PXPhotosHighlightsOverlayController)init
{
  result = (PXPhotosHighlightsOverlayController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXPhotosHighlightsOverlayController____lazy_storage___rootLayout));
  swift_unknownObjectRelease();

  uint64_t v3 = (char *)self + OBJC_IVAR___PXPhotosHighlightsOverlayController_delegate;
  sub_1A9D6D380((uint64_t)v3);
}

@end