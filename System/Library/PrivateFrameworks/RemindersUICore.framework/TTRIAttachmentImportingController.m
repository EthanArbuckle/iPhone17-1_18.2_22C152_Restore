@interface TTRIAttachmentImportingController
- (_TtC15RemindersUICore33TTRIAttachmentImportingController)init;
- (void)documentCameraViewController:(id)a3 didFinishWithScan:(id)a4;
- (void)documentCameraViewControllerDidCancel:(id)a3;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
@end

@implementation TTRIAttachmentImportingController

- (_TtC15RemindersUICore33TTRIAttachmentImportingController)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&self->delegate[OBJC_IVAR____TtC15RemindersUICore33TTRIAttachmentImportingController_delegate] = 0;
  swift_unknownObjectWeakInit();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(TTRIAttachmentImportingController *)&v5 init];
}

- (void).cxx_destruct
{
}

- (void)imagePickerControllerDidCancel:(id)a3
{
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  type metadata accessor for InfoKey(0);
  sub_1B980A6D4();
  uint64_t v6 = sub_1B996E6E0();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  *(void *)(v7 + 24) = self;
  v11[4] = sub_1B980A7F0;
  v11[5] = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_1B90D81AC;
  v11[3] = &block_descriptor_66_1;
  v8 = _Block_copy(v11);
  v9 = self;
  id v10 = a3;
  _s15RemindersUICore21TTRProcessEnvironmentV24dictionaryRepresentationSDyS2SGvg_0();
  swift_release();
  objc_msgSend(v10, sel_dismissViewControllerAnimated_completion_, 1, v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
}

- (void)documentCameraViewControllerDidCancel:(id)a3
{
}

- (void)documentCameraViewController:(id)a3 didFinishWithScan:(id)a4
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a4;
  *(void *)(v7 + 24) = self;
  v14[4] = sub_1B980A7EC;
  v14[5] = v7;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 1107296256;
  v14[2] = sub_1B90D81AC;
  v14[3] = &block_descriptor_52_4;
  v8 = _Block_copy(v14);
  id v9 = a4;
  id v10 = self;
  id v11 = v9;
  v12 = v10;
  id v13 = a3;
  swift_release();
  objc_msgSend(v13, sel_dismissViewControllerAnimated_completion_, 1, v8);
  _Block_release(v8);
}

@end