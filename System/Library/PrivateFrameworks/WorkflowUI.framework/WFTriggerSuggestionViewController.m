@interface WFTriggerSuggestionViewController
- (WFTriggerSuggestionViewController)initWithCoder:(id)a3;
- (WFTriggerSuggestionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (WFTriggerSuggestionViewController)initWithTrigger:(id)a3 selectedEntryMetadataData:(id)a4 selectedReference:(id)a5;
- (WFTriggerSuggestionViewControllerDelegate)delegate;
- (id)contentScrollViewForEdge:(unint64_t)a3;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
@end

@implementation WFTriggerSuggestionViewController

- (WFTriggerSuggestionViewControllerDelegate)delegate
{
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_22DB3CF54();
}

- (WFTriggerSuggestionViewController)initWithTrigger:(id)a3 selectedEntryMetadataData:(id)a4 selectedReference:(id)a5
{
  v6 = a4;
  if (a4)
  {
    id v8 = a3;
    id v9 = a5;
    id v10 = v6;
    v6 = (void *)sub_22DC8F0B8();
    unint64_t v12 = v11;
  }
  else
  {
    id v13 = a3;
    id v14 = a5;
    unint64_t v12 = 0xF000000000000000;
  }
  return (WFTriggerSuggestionViewController *)sub_22DB3CF9C(a3, (uint64_t)v6, v12, a5);
}

- (WFTriggerSuggestionViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_22DB3D3E8();
}

- (void)loadView
{
  v2 = self;
  sub_22DB3D4AC();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_22DB3DE84();
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22DB3F12C(v4);
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  id v4 = self;
  id v5 = sub_22DB3F3F0(a3);

  return v5;
}

- (WFTriggerSuggestionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  }
  id v5 = a4;
  sub_22DB3F478();
}

- (void).cxx_destruct
{
  sub_22D9ADBA0((uint64_t)self + OBJC_IVAR___WFTriggerSuggestionViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___WFTriggerSuggestionViewController_hostingController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___WFTriggerSuggestionViewController_searchController));
  swift_release();
  sub_22DA17290(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR___WFTriggerSuggestionViewController_selectedEntryMetadataData), *(void *)((char *)&self->super.super._responderFlags+ OBJC_IVAR___WFTriggerSuggestionViewController_selectedEntryMetadataData));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___WFTriggerSuggestionViewController_selectedReference);
}

@end