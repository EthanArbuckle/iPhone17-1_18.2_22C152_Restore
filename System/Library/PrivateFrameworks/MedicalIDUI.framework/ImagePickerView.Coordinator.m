@interface ImagePickerView.Coordinator
- (_TtCV11MedicalIDUI15ImagePickerView11Coordinator)init;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
@end

@implementation ImagePickerView.Coordinator

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  type metadata accessor for InfoKey(0);
  sub_255E7244C(&qword_269F34DC0, type metadata accessor for InfoKey);
  uint64_t v6 = sub_255EEFC60();
  id v7 = a3;
  v8 = self;
  sub_255E7290C(v6);

  swift_bridgeObjectRelease();
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  uint64_t v5 = sub_255EEE910();
  MEMORY[0x270FA5388](v5 - 8);
  sub_255DAD8AC(0);
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = a3;
  v11 = self;
  sub_255DAB038((uint64_t)v9);
  MEMORY[0x25A29B390](v7);
  sub_255EEE900();
  sub_255EEF980();
  sub_255E72B74((uint64_t)v9, (uint64_t (*)(void))sub_255DAD8AC);
}

- (_TtCV11MedicalIDUI15ImagePickerView11Coordinator)init
{
  result = (_TtCV11MedicalIDUI15ImagePickerView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_255E72B74((uint64_t)self + OBJC_IVAR____TtCV11MedicalIDUI15ImagePickerView11Coordinator_parent, type metadata accessor for ImagePickerView);
  v3 = (char *)self + OBJC_IVAR____TtCV11MedicalIDUI15ImagePickerView11Coordinator_imageProcessor;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end