@interface PXPhotosZoomableOverlayController
- (BOOL)canHandleObjectReference:(id)a3;
- (NSArray)availableLenses;
- (PXPhotosLensControlItem)currentLens;
- (PXPhotosOverlayControllerDelegate)delegate;
- (PXPhotosViewModel)photosViewModel;
- (PXPhotosZoomableOverlayController)init;
- (PXPhotosZoomableOverlayController)initWithPhotoLibrary:(id)a3;
- (id)overlayLayoutProvider;
- (void)setCurrentLens:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOverlayLayoutProvider:(id)a3;
- (void)setPhotosViewModel:(id)a3;
@end

@implementation PXPhotosZoomableOverlayController

- (PXPhotosZoomableOverlayController)initWithPhotoLibrary:(id)a3
{
  return (PXPhotosZoomableOverlayController *)sub_1AA914830((uint64_t)a3);
}

- (id)overlayLayoutProvider
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___PXPhotosZoomableOverlayController_overlayLayoutProvider);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1A9F10B0C;
    aBlock[3] = &block_descriptor_19_5;
    v4 = _Block_copy(aBlock);
    sub_1AB22F8DC();
    swift_release();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setOverlayLayoutProvider:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1A9F11E60;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___PXPhotosZoomableOverlayController_overlayLayoutProvider);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1A9BB8934(v7);
}

- (NSArray)availableLenses
{
  sub_1A9CD3718(0, (unint64_t *)&qword_1E981C7F0, MEMORY[0x1E4FBC838] + 8, MEMORY[0x1E4FBBE00]);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1AB2EDD40;
  v4 = self;
  uint64_t v5 = sub_1AA76952C();
  swift_beginAccess();
  *(void *)(v3 + 32) = *v5;
  swift_unknownObjectRetain();
  v6 = sub_1AA769578();
  swift_beginAccess();
  *(void *)(v3 + 40) = *v6;
  sub_1AB23AAFC();
  swift_unknownObjectRetain();

  sub_1AA377758();
  uint64_t v7 = (void *)sub_1AB23AABC();
  swift_bridgeObjectRelease();
  return (NSArray *)v7;
}

- (PXPhotosViewModel)photosViewModel
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___PXPhotosZoomableOverlayController_photosViewModel);
  swift_beginAccess();
  return (PXPhotosViewModel *)*v2;
}

- (void)setPhotosViewModel:(id)a3
{
  uint64_t v5 = (void **)((char *)&self->super.isa + OBJC_IVAR___PXPhotosZoomableOverlayController_photosViewModel);
  swift_beginAccess();
  v6 = *v5;
  *uint64_t v5 = a3;
  id v7 = a3;
  v8 = self;
  sub_1AA9151E8(v6);
}

- (PXPhotosLensControlItem)currentLens
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();
  return (PXPhotosLensControlItem *)v2;
}

- (void)setCurrentLens:(id)a3
{
  uint64_t v5 = (void **)((char *)&self->super.isa + OBJC_IVAR___PXPhotosZoomableOverlayController_currentLens);
  swift_beginAccess();
  v6 = *v5;
  *uint64_t v5 = a3;
  swift_unknownObjectRetain_n();
  id v7 = self;
  sub_1AA91567C(v6);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (PXPhotosOverlayControllerDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___PXPhotosZoomableOverlayController_delegate;
  swift_beginAccess();
  uint64_t v3 = (void *)MEMORY[0x1AD10DA80](v2);
  return (PXPhotosOverlayControllerDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)canHandleObjectReference:(id)a3
{
  return 0;
}

- (PXPhotosZoomableOverlayController)init
{
  result = (PXPhotosZoomableOverlayController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A9BB8934(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___PXPhotosZoomableOverlayController_overlayLayoutProvider));

  swift_unknownObjectRelease();
  sub_1A9D6D380((uint64_t)self + OBJC_IVAR___PXPhotosZoomableOverlayController_delegate);
  swift_unknownObjectRelease();
}

@end