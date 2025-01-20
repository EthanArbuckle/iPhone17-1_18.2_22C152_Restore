@interface VisualAssetCaptureController
- (_TtC11NotesEditor28VisualAssetCaptureController)init;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
@end

@implementation VisualAssetCaptureController

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  type metadata accessor for InfoKey(0);
  sub_20C09A3BC();
  uint64_t v6 = sub_20C1629D0();
  id v7 = a3;
  v8 = self;
  sub_20C0994F8(v7, v6);

  swift_bridgeObjectRelease();
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20C09A164(v4);
}

- (_TtC11NotesEditor28VisualAssetCaptureController)init
{
  result = (_TtC11NotesEditor28VisualAssetCaptureController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC11NotesEditor28VisualAssetCaptureController_delegate);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11NotesEditor28VisualAssetCaptureController_note);
}

@end