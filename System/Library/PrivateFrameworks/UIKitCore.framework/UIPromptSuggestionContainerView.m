@interface UIPromptSuggestionContainerView
- (_TtC5UIKit31UIPromptSuggestionContainerView)initWithCoder:(id)a3;
- (_TtC5UIKit31UIPromptSuggestionContainerView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
@end

@implementation UIPromptSuggestionContainerView

- (_TtC5UIKit31UIPromptSuggestionContainerView)initWithFrame:(CGRect)a3
{
  return (_TtC5UIKit31UIPromptSuggestionContainerView *)sub_185A09B10(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5UIKit31UIPromptSuggestionContainerView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5UIKit31UIPromptSuggestionContainerView_suggestionViews) = (Class)MEMORY[0x1E4FBC860];
  uint64_t v5 = OBJC_IVAR____TtC5UIKit31UIPromptSuggestionContainerView_contentView;
  id v6 = objc_allocWithZone((Class)UIView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC5UIKit31UIPromptSuggestionContainerView *)sub_186A1F60C();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_185A0A488();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_185A0A780((uint64_t)a4, x, y);

  return v10;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5UIKit31UIPromptSuggestionContainerView_contentView);
}

@end