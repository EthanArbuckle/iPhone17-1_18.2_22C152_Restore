@interface MoveToFolderViewController
- (_TtC10WorkflowUI26MoveToFolderViewController)initWithCoder:(id)a3;
- (_TtC10WorkflowUI26MoveToFolderViewController)initWithDatabase:(id)a3 shortcutsToMove:(id)a4;
- (_TtC10WorkflowUI26MoveToFolderViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)cancel;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation MoveToFolderViewController

- (_TtC10WorkflowUI26MoveToFolderViewController)initWithDatabase:(id)a3 shortcutsToMove:(id)a4
{
  sub_22D9A6F3C(0, &qword_26AEF9C00);
  uint64_t v5 = sub_22DC92B48();
  MoveToFolderViewController.init(database:shortcutsToMove:)(a3, v5);
  return result;
}

- (_TtC10WorkflowUI26MoveToFolderViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_22DA6AC60();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_22DA6AD38();
}

- (void)cancel
{
  v2 = self;
  sub_22DA6AE58();
}

- (_TtC10WorkflowUI26MoveToFolderViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  }
  id v5 = a4;
  MoveToFolderViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  sub_22D9ADBA0((uint64_t)self + OBJC_IVAR____TtC10WorkflowUI26MoveToFolderViewController_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI26MoveToFolderViewController____lazy_storage___layout));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI26MoveToFolderViewController____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI26MoveToFolderViewController____lazy_storage___dataSource));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10WorkflowUI26MoveToFolderViewController_iconImage);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_22DC8F2E8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22DC8F298();
  id v10 = a3;
  v11 = self;
  MoveToFolderViewController.collectionView(_:didSelectItemAt:)();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end