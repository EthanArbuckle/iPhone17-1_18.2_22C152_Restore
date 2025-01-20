@interface PXPlacesMapOptionsController
- (BOOL)enableUserTrackingButton;
- (PXPlacesMapOptionsController)init;
- (PXPlacesMapOptionsController)initWithMapModeController:(id)a3 mapFetchResultController:(id)a4 locationAuthorizationMonitor:(id)a5;
- (PXPlacesMapOptionsControllerDelegate)delegate;
- (unint64_t)mapStyle;
- (unint64_t)perspectiveButtonState;
- (void)chooseMapViewDidTapAttributionWithURL:(id)a3;
- (void)chooseMapViewDidTapCardForMapStyle:(unint64_t)a3;
- (void)mapOptionsViewDidTapMapModeSettingsButton:(id)a3;
- (void)mapOptionsViewDidTapPerspectiveButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnableUserTrackingButton:(BOOL)a3;
@end

@implementation PXPlacesMapOptionsController

- (PXPlacesMapOptionsControllerDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___PXPlacesMapOptionsController_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1AD10DA80](v2);
  return (PXPlacesMapOptionsControllerDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)mapStyle
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PXPlacesMapOptionsController_mapModeController);
  v3 = self;
  unint64_t v4 = sub_1AA97A398((uint64_t)objc_msgSend(v2, sel_mapStyle));

  return v4;
}

- (unint64_t)perspectiveButtonState
{
  v2 = self;
  unint64_t v3 = sub_1AA978D24();

  return v3;
}

- (BOOL)enableUserTrackingButton
{
  v2 = (BOOL *)self + OBJC_IVAR___PXPlacesMapOptionsController_enableUserTrackingButton;
  swift_beginAccess();
  return *v2;
}

- (void)setEnableUserTrackingButton:(BOOL)a3
{
  v5 = (BOOL *)self + OBJC_IVAR___PXPlacesMapOptionsController_enableUserTrackingButton;
  swift_beginAccess();
  BOOL *v5 = a3;
  v6 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x90);
  v7 = self;
  v8 = (void *)v6();
  if (v8)
  {
    objc_msgSend(v8, sel_mapOptionsControllerDidInvalidateMapOptions_, v7);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (PXPlacesMapOptionsController)initWithMapModeController:(id)a3 mapFetchResultController:(id)a4 locationAuthorizationMonitor:(id)a5
{
}

- (PXPlacesMapOptionsController)init
{
  result = (PXPlacesMapOptionsController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A9D6D380((uint64_t)self + OBJC_IVAR___PXPlacesMapOptionsController_delegate);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXPlacesMapOptionsController_currentChooseMapSheetController));

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)mapOptionsViewDidTapMapModeSettingsButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  PlacesMapOptionsController.mapOptionsViewDidTapMapModeSettingsButton(_:)(v4);
}

- (void)mapOptionsViewDidTapPerspectiveButton:(id)a3
{
  uint64_t v5 = sub_1AB23576C();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5, v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PXPlacesMapOptionsController_mapModeController);
  id v11 = a3;
  v15 = self;
  if (objc_msgSend(v10, sel_toggle3DModeIfPossible))
  {

    v12 = v15;
  }
  else
  {
    uint64_t v13 = sub_1AA0BF9CC();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v13, v5);
    sub_1A9E512BC();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
}

- (void)chooseMapViewDidTapCardForMapStyle:(unint64_t)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PXPlacesMapOptionsController_mapModeController);
  uint64_t v5 = self;
  objc_msgSend(v4, sel_setMapStyle_, sub_1AA97A9DC(a3));
}

- (void)chooseMapViewDidTapAttributionWithURL:(id)a3
{
  uint64_t v3 = sub_1AB2305AC();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3, v5);
  uint64_t v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB23052C();
  _s12PhotosUICore26PlacesMapOptionsControllerC06chooseD28ViewDidTapAttributionWithURLyy10Foundation0M0VF_0((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

@end