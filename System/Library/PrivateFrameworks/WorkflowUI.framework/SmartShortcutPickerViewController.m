@interface SmartShortcutPickerViewController
- (_TtC10WorkflowUI33SmartShortcutPickerViewController)initWithCoder:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation SmartShortcutPickerViewController

- (_TtC10WorkflowUI33SmartShortcutPickerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  SmartShortcutPickerViewController.init(coder:)();
}

- (void)dealloc
{
  v2 = self;
  SmartShortcutPickerViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI33SmartShortcutPickerViewController_progressiveView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10WorkflowUI33SmartShortcutPickerViewController_searchBar);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_22DB88010();
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4 = self;
  sub_22DB8894C(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_22DB889EC(a3);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_22DB88AB8();
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
  sub_22DB88DA4(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)keyboardWillShow:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22DB8A2BC(v4);
}

- (void)keyboardWillHide:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22DB8A404();
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v6 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  uint64_t v8 = v7;
  id v9 = a3;
  id v10 = self;
  v11._countAndFlagsBits = v6;
  v11._object = v8;
  SmartShortcutPickerViewController.searchBar(_:textDidChange:)((WFSearchBar *)v10, v11);

  swift_bridgeObjectRelease();
}

@end