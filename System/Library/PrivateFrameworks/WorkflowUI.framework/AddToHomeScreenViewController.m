@interface AddToHomeScreenViewController
- (_TtC10WorkflowUI29AddToHomeScreenViewController)initWithCoder:(id)a3;
- (_TtC10WorkflowUI29AddToHomeScreenViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)addHomeScreenShortcut;
- (void)cancel;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
@end

@implementation AddToHomeScreenViewController

- (void)cancel
{
  v2 = self;
  sub_22D9FAECC();
}

- (void)addHomeScreenShortcut
{
  v2 = self;
  sub_22D9FAF2C();
}

- (_TtC10WorkflowUI29AddToHomeScreenViewController)initWithCoder:(id)a3
{
}

- (_TtC10WorkflowUI29AddToHomeScreenViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  }
  id v5 = a4;
  AddToHomeScreenViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10WorkflowUI29AddToHomeScreenViewController_collectionViewController);
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  type metadata accessor for InfoKey(0);
  sub_22D9FC5A0(&qword_268592CB0, type metadata accessor for InfoKey);
  uint64_t v6 = sub_22DC92888();
  id v7 = a3;
  v8 = self;
  AddToHomeScreenViewController.imagePickerController(_:didFinishPickingMediaWithInfo:)((UIImagePickerController *)v8, (Swift::OpaquePointer)v6);

  swift_bridgeObjectRelease();
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  sub_22DC8F098();
  uint64_t v6 = sub_22DC92B48();
  id v7 = a3;
  v8 = self;
  AddToHomeScreenViewController.documentPicker(_:didPickDocumentsAt:)((UIDocumentPickerViewController *)v8, (Swift::OpaquePointer)v6);

  swift_bridgeObjectRelease();
}

@end