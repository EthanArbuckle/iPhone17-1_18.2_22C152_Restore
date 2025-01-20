@interface SmartShortcutPickerDetailViewController
- (_TtC10WorkflowUI39SmartShortcutPickerDetailViewController)initWithCoder:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation SmartShortcutPickerDetailViewController

- (_TtC10WorkflowUI39SmartShortcutPickerDetailViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_22DABC354();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_22DABC45C();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_22DABD4B0();
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
  sub_22DABD674(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI39SmartShortcutPickerDetailViewController_materialView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10WorkflowUI39SmartShortcutPickerDetailViewController_hostingView);
}

@end