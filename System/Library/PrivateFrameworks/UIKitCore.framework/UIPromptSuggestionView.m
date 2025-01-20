@interface UIPromptSuggestionView
- (BOOL)isHighlighted;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3;
- (_TtC5UIKit22UIPromptSuggestionView)initWithCoder:(id)a3;
- (_TtC5UIKit22UIPromptSuggestionView)initWithFrame:(CGRect)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation UIPromptSuggestionView

- (_TtC5UIKit22UIPromptSuggestionView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s5UIKit22UIPromptSuggestionViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UIPromptSuggestionView(0);
  return [(UIControl *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for UIPromptSuggestionView(0);
  v4 = (char *)v8.receiver;
  [(UIControl *)&v8 setHighlighted:v3];
  v5 = *(void **)&v4[OBJC_IVAR____TtC5UIKit22UIPromptSuggestionView_label];
  unsigned int v6 = objc_msgSend(v4, sel_isHighlighted, v8.receiver, v8.super_class);
  double v7 = 0.65;
  if (!v6) {
    double v7 = 1.0;
  }
  objc_msgSend(v5, sel_setAlpha_, v7);
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  double v7 = self;
  if ([(UIControl *)v7 isTouchInside]) {
    [(UIControl *)v7 performPrimaryAction];
  }
}

- (_TtC5UIKit22UIPromptSuggestionView)initWithFrame:(CGRect)a3
{
  result = (_TtC5UIKit22UIPromptSuggestionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_185A2D960((uint64_t)self + OBJC_IVAR____TtC5UIKit22UIPromptSuggestionView_configuration, type metadata accessor for UIPromptSuggestionView.Configuration);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit22UIPromptSuggestionView_backdropView));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit22UIPromptSuggestionView_imageButtonView));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5UIKit22UIPromptSuggestionView_contentView);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5UIKit22UIPromptSuggestionView_label);
  id v6 = self;
  id v7 = objc_msgSend(v5, sel_numberOfLines);
  id v8 = (Class *)((char *)&v6->super.super.super.super.isa + OBJC_IVAR____TtC5UIKit22UIPromptSuggestionView_configuration);
  swift_beginAccess();
  if (*v8) {
    double v9 = 60.0;
  }
  else {
    double v9 = 34.0;
  }
  objc_msgSend(v5, sel_textRectForBounds_limitedToNumberOfLines_, v7, 0.0, 0.0, width - v9, height);
  double v11 = v10;
  double v13 = v12;

  double v14 = v13 + 28.0;
  double v15 = v9 + v11;
  result.double height = v14;
  result.double width = v15;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  -[UIPromptSuggestionView sizeThatFits:](self, sel_sizeThatFits_, a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  [(UIView *)v2 bounds];
  -[UIPromptSuggestionView sizeThatFits:](v2, sel_sizeThatFits_, v3, v4);
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  UIPromptSuggestionView.layoutSubviews()();
}

@end