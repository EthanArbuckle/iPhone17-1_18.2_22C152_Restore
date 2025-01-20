@interface SmartShortcutPickerBaseViewController
- (_TtC10WorkflowUI37SmartShortcutPickerBaseViewController)initWithCoder:(id)a3;
- (_TtC10WorkflowUI37SmartShortcutPickerBaseViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredUserInterfaceStyle;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation SmartShortcutPickerBaseViewController

- (_TtC10WorkflowUI37SmartShortcutPickerBaseViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  SmartShortcutPickerBaseViewController.init(coder:)();
}

- (void)dealloc
{
  v2 = self;
  SmartShortcutPickerBaseViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
  sub_22DA4B94C(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC10WorkflowUI37SmartShortcutPickerBaseViewController_style), *(void *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC10WorkflowUI37SmartShortcutPickerBaseViewController_style), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC10WorkflowUI37SmartShortcutPickerBaseViewController_style), *(uint64_t *)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC10WorkflowUI37SmartShortcutPickerBaseViewController_style), *(uint64_t *)((char *)&self->super._view + OBJC_IVAR____TtC10WorkflowUI37SmartShortcutPickerBaseViewController_style), *(uint64_t *)((char *)&self->super._tabBarItem+ OBJC_IVAR____TtC10WorkflowUI37SmartShortcutPickerBaseViewController_style), *(uint64_t *)((char *)&self->super._tab + OBJC_IVAR____TtC10WorkflowUI37SmartShortcutPickerBaseViewController_style), *(uint64_t *)((char *)&self->super._tabElement+ OBJC_IVAR____TtC10WorkflowUI37SmartShortcutPickerBaseViewController_style), *(uint64_t *)((char *)&self->super._navigationItem+ OBJC_IVAR____TtC10WorkflowUI37SmartShortcutPickerBaseViewController_style), *(uint64_t *)((char *)&self->super._toolbarItems+ OBJC_IVAR____TtC10WorkflowUI37SmartShortcutPickerBaseViewController_style), *(uint64_t *)((char *)&self->super._title + OBJC_IVAR____TtC10WorkflowUI37SmartShortcutPickerBaseViewController_style),
    *((unsigned char *)&self->super._nibName + OBJC_IVAR____TtC10WorkflowUI37SmartShortcutPickerBaseViewController_style));
  swift_release();
  swift_release();
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10WorkflowUI37SmartShortcutPickerBaseViewController_collectionView);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v4 = sub_22DC8F2E8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22DC8F298();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_22DA5C434();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_22DA5C610(a3);
}

- (int64_t)preferredUserInterfaceStyle
{
  return sub_22DA5F890();
}

- (_TtC10WorkflowUI37SmartShortcutPickerBaseViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  }
  id v5 = a4;
  SmartShortcutPickerBaseViewController.init(nibName:bundle:)();
}

@end