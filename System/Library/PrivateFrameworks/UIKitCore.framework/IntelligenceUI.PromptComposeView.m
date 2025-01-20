@interface IntelligenceUI.PromptComposeView
- (_TtCO5UIKit14IntelligenceUI17PromptComposeView)initWithCoder:(id)a3;
- (_TtCO5UIKit14IntelligenceUI17PromptComposeView)initWithFrame:(CGRect)a3;
@end

@implementation IntelligenceUI.PromptComposeView

- (_TtCO5UIKit14IntelligenceUI17PromptComposeView)initWithFrame:(CGRect)a3
{
  return (_TtCO5UIKit14IntelligenceUI17PromptComposeView *)sub_185B1C274(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCO5UIKit14IntelligenceUI17PromptComposeView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_185B1CC64();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5UIKit14IntelligenceUI17PromptComposeView_entryView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5UIKit14IntelligenceUI17PromptComposeView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5UIKit14IntelligenceUI17PromptComposeView_inputAreaStackView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCO5UIKit14IntelligenceUI17PromptComposeView_contentViewContainer);
}

@end