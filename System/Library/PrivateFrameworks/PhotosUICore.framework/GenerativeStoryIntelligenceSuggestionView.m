@interface GenerativeStoryIntelligenceSuggestionView
- (_TtC12PhotosUICoreP33_A9C40A4A464D1AF98F1002330EE5183541GenerativeStoryIntelligenceSuggestionView)initWithCoder:(id)a3;
- (_TtC12PhotosUICoreP33_A9C40A4A464D1AF98F1002330EE5183541GenerativeStoryIntelligenceSuggestionView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation GenerativeStoryIntelligenceSuggestionView

- (_TtC12PhotosUICoreP33_A9C40A4A464D1AF98F1002330EE5183541GenerativeStoryIntelligenceSuggestionView)initWithCoder:(id)a3
{
  result = (_TtC12PhotosUICoreP33_A9C40A4A464D1AF98F1002330EE5183541GenerativeStoryIntelligenceSuggestionView *)sub_1AB23C1FC();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for GenerativeStoryIntelligenceSuggestionView();
  v2 = (char *)v4.receiver;
  [(GenerativeStoryIntelligenceSuggestionView *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC12PhotosUICoreP33_A9C40A4A464D1AF98F1002330EE5183541GenerativeStoryIntelligenceSuggestionView_backdropView];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);
  objc_msgSend(v3, sel__setCornerRadius_, *(double *)&v2[OBJC_IVAR____TtC12PhotosUICoreP33_A9C40A4A464D1AF98F1002330EE5183541GenerativeStoryIntelligenceSuggestionView_cornerRadius]);
}

- (_TtC12PhotosUICoreP33_A9C40A4A464D1AF98F1002330EE5183541GenerativeStoryIntelligenceSuggestionView)initWithFrame:(CGRect)a3
{
  result = (_TtC12PhotosUICoreP33_A9C40A4A464D1AF98F1002330EE5183541GenerativeStoryIntelligenceSuggestionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_A9C40A4A464D1AF98F1002330EE5183541GenerativeStoryIntelligenceSuggestionView_backdropView));
}

@end