@interface AmbientPhotoFrameController
- (_TtC15PhotosUIPrivate27AmbientPhotoFrameController)init;
- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3;
- (void)openVisibleAssetInPhotosApp;
- (void)thermalStateDidChangeWithNotification:(id)a3;
@end

@implementation AmbientPhotoFrameController

- (void)thermalStateDidChangeWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AEA9F6D0();
}

- (void)openVisibleAssetInPhotosApp
{
  v2 = self;
  sub_1AEAA2124();
}

- (_TtC15PhotosUIPrivate27AmbientPhotoFrameController)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate27AmbientPhotoFrameController_photoLibrary));

  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_20_10(OBJC_IVAR____TtC15PhotosUIPrivate27AmbientPhotoFrameController_posterConfiguration);
  OUTLINED_FUNCTION_20_10(OBJC_IVAR____TtC15PhotosUIPrivate27AmbientPhotoFrameController_posterDescriptor);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate27AmbientPhotoFrameController____lazy_storage___contentView));
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate27AmbientPhotoFrameController_storyView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate27AmbientPhotoFrameController_nonAnimatingPlaybackTimer));
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate27AmbientPhotoFrameController_tapToRadarButtonTitleLeadingConstraint));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15PhotosUIPrivate27AmbientPhotoFrameController_storyMainModel);
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  AmbientPhotoFrameController.collectTapToRadarDiagnostics(into:)(a3);
  swift_unknownObjectRelease();
}

@end