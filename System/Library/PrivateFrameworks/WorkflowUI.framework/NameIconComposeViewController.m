@interface NameIconComposeViewController
- (BOOL)textFieldShouldReturn:(id)a3;
- (_TtC10WorkflowUI29NameIconComposeViewController)initWithCoder:(id)a3;
- (_TtC10WorkflowUI29NameIconComposeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)cancel;
- (void)done;
- (void)glyphPicker:(id)a3 didSelectGlyphWithCharacter:(unsigned __int16)a4;
- (void)keyboardWillChange:(id)a3;
- (void)presentationControllerDidAttemptToDismiss:(id)a3;
- (void)updateIsModalInPresentation;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation NameIconComposeViewController

- (_TtC10WorkflowUI29NameIconComposeViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_22DB74388();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_22DB7450C();
}

- (void)updateIsModalInPresentation
{
  v2 = self;
  sub_22DB74AD4();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_22DB74B98(a3);
}

- (void)keyboardWillChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22DB74C80();
}

- (void)cancel
{
  v2 = self;
  sub_22DB75874();
}

- (void)done
{
  v2 = self;
  sub_22DB7594C();
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22DB75AF0();
}

- (_TtC10WorkflowUI29NameIconComposeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  }
  id v5 = a4;
  NameIconComposeViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  sub_22DB7658C(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10WorkflowUI29NameIconComposeViewController_mode), *((unsigned char *)&self->super.super._responderFlags + OBJC_IVAR____TtC10WorkflowUI29NameIconComposeViewController_mode));
  sub_22D9ADBA0((uint64_t)self + OBJC_IVAR____TtC10WorkflowUI29NameIconComposeViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI29NameIconComposeViewController____lazy_storage___scrollViewBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI29NameIconComposeViewController____lazy_storage___glyphPickerHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI29NameIconComposeViewController____lazy_storage___contentViewScrollViewEqualHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI29NameIconComposeViewController____lazy_storage___contentViewViewEqualHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI29NameIconComposeViewController____lazy_storage___scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI29NameIconComposeViewController____lazy_storage___contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI29NameIconComposeViewController____lazy_storage___iconTextFieldOuterContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI29NameIconComposeViewController____lazy_storage___iconTextFieldInnerContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI29NameIconComposeViewController____lazy_storage___iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI29NameIconComposeViewController____lazy_storage___textField));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10WorkflowUI29NameIconComposeViewController____lazy_storage___glyphPicker);
}

- (void)glyphPicker:(id)a3 didSelectGlyphWithCharacter:(unsigned __int16)a4
{
  id v6 = a3;
  v7 = self;
  NameIconComposeViewController.glyphPicker(_:didSelectGlyphWith:)((uint64_t)v7, a4);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = (UITextField *)a3;
  id v5 = self;
  NameIconComposeViewController.textFieldShouldReturn(_:)(v4);

  return 1;
}

@end