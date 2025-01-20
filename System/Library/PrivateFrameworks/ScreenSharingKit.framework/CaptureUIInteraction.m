@interface CaptureUIInteraction
- (UIView)view;
- (_TtC16ScreenSharingKit20CaptureUIInteraction)init;
- (int64_t)_deviceOrientation;
- (void)didMoveToView:(id)a3;
- (void)setView:(id)a3;
- (void)set_deviceOrientation:(int64_t)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation CaptureUIInteraction

- (_TtC16ScreenSharingKit20CaptureUIInteraction)init
{
  result = (_TtC16ScreenSharingKit20CaptureUIInteraction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC16ScreenSharingKit20CaptureUIInteraction__availableHardwareGestures;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5392F8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC16ScreenSharingKit20CaptureUIInteraction__isActive;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A537670);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();

  swift_release();
  sub_25BAC335C((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit20CaptureUIInteraction_bufferedSendingContinuation, (uint64_t *)&unk_26A5393F0);
  v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16ScreenSharingKit20CaptureUIInteraction_telemetry);
}

- (UIView)view
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC16ScreenSharingKit20CaptureUIInteraction__view));
}

- (void)setView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16ScreenSharingKit20CaptureUIInteraction__view);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16ScreenSharingKit20CaptureUIInteraction__view) = (Class)a3;
  id v3 = a3;
}

- (void)willMoveToView:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  CaptureUIInteraction.willMove(to:)((UIView_optional *)a3);
}

- (void)didMoveToView:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  CaptureUIInteraction.didMove(to:)((UIView_optional *)a3);
}

- (int64_t)_deviceOrientation
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC16ScreenSharingKit20CaptureUIInteraction_deviceOrientation);
  swift_beginAccess();
  return *v2;
}

- (void)set_deviceOrientation:(int64_t)a3
{
  id v4 = self;
  CaptureUIInteraction.deviceOrientation.setter(a3);
}

@end