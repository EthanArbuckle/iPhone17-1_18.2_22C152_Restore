@interface IntelligenceUI.PromptComposeViewController
- (_TtCO5UIKit14IntelligenceUI27PromptComposeViewController)initWithCoder:(id)a3;
- (_TtCO5UIKit14IntelligenceUI27PromptComposeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
@end

@implementation IntelligenceUI.PromptComposeViewController

- (void)loadView
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtCO5UIKit14IntelligenceUI27PromptComposeViewController_promptComposeView);
  uint64_t v4 = *(void *)(v3 + OBJC_IVAR____TtCO5UIKit14IntelligenceUI17PromptComposeView_entryView)
     + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_delegate;
  swift_beginAccess();
  *(void *)(v4 + 8) = &protocol witness table for IntelligenceUI.PromptComposeViewController;
  swift_unknownObjectWeakAssign();
  [(UIViewController *)self setView:v3];
}

- (_TtCO5UIKit14IntelligenceUI27PromptComposeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_186A1E95C();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtCO5UIKit14IntelligenceUI27PromptComposeViewController *)IntelligenceUI.PromptComposeViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtCO5UIKit14IntelligenceUI27PromptComposeViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtCO5UIKit14IntelligenceUI27PromptComposeViewController_promptComposeView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for IntelligenceUI.PromptComposeView());
  id v7 = a3;
  id v8 = self;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for IntelligenceUI.PromptComposeViewController();
  v9 = [(UIViewController *)&v11 initWithCoder:v7];

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5UIKit14IntelligenceUI27PromptComposeViewController_promptComposeView));
}

@end