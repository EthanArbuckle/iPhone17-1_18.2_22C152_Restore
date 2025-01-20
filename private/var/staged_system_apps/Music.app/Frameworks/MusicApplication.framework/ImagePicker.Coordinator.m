@interface ImagePicker.Coordinator
- (_TtCV11MusicCoreUI11ImagePicker11Coordinator)init;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)documentPickerWasCancelled:(id)a3;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
@end

@implementation ImagePicker.Coordinator

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  _s3__C7InfoKeyVMa_0(0);
  sub_934968(&qword_DF3200, _s3__C7InfoKeyVMa_0);
  uint64_t v6 = sub_AB6250();
  id _ = a3;
  v7 = self;
  ImagePicker.Coordinator.imagePickerController(_:didFinishPickingMediaWithInfo:)((UIImagePickerController)_, (Swift::OpaquePointer)v6);
  swift_bridgeObjectRelease();
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  id v4 = a3;
  v5 = self;
  ImagePicker.Coordinator.imagePickerControllerDidCancel(_:)((UIImagePickerController)v4);
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  sub_AB0930();
  uint64_t v6 = sub_AB69B0();
  id _ = a3;
  v7 = self;
  ImagePicker.Coordinator.documentPicker(_:didPickDocumentsAt:)((UIDocumentPickerViewController)_, (Swift::OpaquePointer)v6);
  swift_bridgeObjectRelease();
}

- (void)documentPickerWasCancelled:(id)a3
{
  uint64_t v5 = type metadata accessor for ImagePicker(0) - 8;
  __chkstk_darwin();
  v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_934A04((uint64_t)self + OBJC_IVAR____TtCV11MusicCoreUI11ImagePicker11Coordinator_imagePicker, (uint64_t)v7);
  v8 = &v7[*(int *)(v5 + 40)];
  uint64_t v9 = *(void *)v8;
  uint64_t v10 = *((void *)v8 + 1);
  LOBYTE(v8) = v8[16];
  uint64_t v14 = v9;
  uint64_t v15 = v10;
  char v16 = (char)v8;
  v13[7] = 0;
  id v11 = a3;
  v12 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_DF9DF0);
  sub_AB4C80();
  [v11 dismissViewControllerAnimated:1 completion:0];
  sub_934A68((uint64_t)v7);
}

- (void)presentationControllerDidDismiss:(id)a3
{
}

- (_TtCV11MusicCoreUI11ImagePicker11Coordinator)init
{
  result = (_TtCV11MusicCoreUI11ImagePicker11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_934A68((uint64_t)self + OBJC_IVAR____TtCV11MusicCoreUI11ImagePicker11Coordinator_imagePicker);
  sub_1A528(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtCV11MusicCoreUI11ImagePicker11Coordinator_pickHandler));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV11MusicCoreUI11ImagePicker11Coordinator____lazy_storage___downloadFailureAlertController);
}

@end