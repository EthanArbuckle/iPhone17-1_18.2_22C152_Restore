@interface FullScreenAssetControllerCoordinator
- (_TtC7Journal36FullScreenAssetControllerCoordinator)init;
- (void)presentationControllerDidDismiss:(id)a3;
@end

@implementation FullScreenAssetControllerCoordinator

- (void)presentationControllerDidDismiss:(id)a3
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC7Journal36FullScreenAssetControllerCoordinator_presentedController) = 0;
  _objc_release_x1();
}

- (_TtC7Journal36FullScreenAssetControllerCoordinator)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC7Journal36FullScreenAssetControllerCoordinator_presentedController) = 0;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Journal36FullScreenAssetControllerCoordinator_onDelete);
  void *v3 = AudioRecordingActivityState.hash(into:);
  v3[1] = 0;
  swift_unknownObjectWeakInit();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FullScreenAssetControllerCoordinator();
  return [(FullScreenAssetControllerCoordinator *)&v5 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7Journal36FullScreenAssetControllerCoordinator_presentedController));
  swift_release();

  swift_unknownObjectWeakDestroy();
}

@end