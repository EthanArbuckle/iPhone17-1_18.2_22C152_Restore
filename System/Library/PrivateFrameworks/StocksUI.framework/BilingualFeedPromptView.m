@interface BilingualFeedPromptView
- (_TtC8StocksUI23BilingualFeedPromptView)initWithCoder:(id)a3;
- (_TtC8StocksUI23BilingualFeedPromptView)initWithFrame:(CGRect)a3;
@end

@implementation BilingualFeedPromptView

- (_TtC8StocksUI23BilingualFeedPromptView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI23BilingualFeedPromptView *)sub_20A574140(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI23BilingualFeedPromptView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A57477C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI23BilingualFeedPromptView_messageLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI23BilingualFeedPromptView_enableBilingualFeedButton));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8StocksUI23BilingualFeedPromptView_neverShowBilingualFeedPromptsButton);
}

@end