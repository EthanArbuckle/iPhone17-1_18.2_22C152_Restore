@interface WFActionDetailsViewController
- (_TtC14WorkflowEditor29WFActionDetailsViewController)initWithCoder:(id)a3;
- (_TtC14WorkflowEditor29WFActionDetailsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)handleTapOnDescriptionTextView:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation WFActionDetailsViewController

- (_TtC14WorkflowEditor29WFActionDetailsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_234A6B0BC();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_234A6B2CC();
}

- (void)handleTapOnDescriptionTextView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_234A6BCAC(v4);
}

- (_TtC14WorkflowEditor29WFActionDetailsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_234B3B588();
  }
  id v5 = a4;
  WFActionDetailsViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC14WorkflowEditor29WFActionDetailsViewController_action;
  sub_234B38738();
  OUTLINED_FUNCTION_5_9();
  (*(void (**)(char *))(v4 + 8))(v3);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor29WFActionDetailsViewController_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor29WFActionDetailsViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor29WFActionDetailsViewController_descriptionTextView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor29WFActionDetailsViewController_closeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor29WFActionDetailsViewController_topSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor29WFActionDetailsViewController_bottomSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor29WFActionDetailsViewController_addButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor29WFActionDetailsViewController_pinButton));
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC14WorkflowEditor29WFActionDetailsViewController_dismissalHandler);
  sub_2349159D0(v5);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  WFActionDetailsViewController.scrollViewDidScroll(_:)((UIScrollView *)v5);
}

@end