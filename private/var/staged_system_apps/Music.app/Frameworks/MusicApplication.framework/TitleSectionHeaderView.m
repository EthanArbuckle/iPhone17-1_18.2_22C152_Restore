@interface TitleSectionHeaderView
- (NSString)subtitle;
- (NSString)supertitle;
- (NSString)title;
- (UIButton)accessibilitySystemStyleButton;
- (UIColor)backgroundColor;
- (UIView)accessibilityAdditionalContentView;
- (_TtC16MusicApplication22TitleSectionHeaderView)initWithCoder:(id)a3;
- (_TtC16MusicApplication22TitleSectionHeaderView)initWithFrame:(CGRect)a3;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)music_inheritedLayoutInsetsDidChange;
- (void)setBackgroundColor:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSupertitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TitleSectionHeaderView

- (_TtC16MusicApplication22TitleSectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication22TitleSectionHeaderView *)TitleSectionHeaderView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication22TitleSectionHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s16MusicApplication22TitleSectionHeaderViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = sub_1AEEE8(v4);

  return v6;
}

- (NSString)supertitle
{
  return (NSString *)sub_1575BC();
}

- (void)setSupertitle:(id)a3
{
}

- (NSString)title
{
  return (NSString *)sub_1575BC();
}

- (void)setTitle:(id)a3
{
  uint64_t v5 = sub_AB6510();
  uint64_t v7 = v6;
  v8 = (uint64_t *)((char *)self + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_title);
  swift_beginAccess();
  uint64_t *v8 = v5;
  v8[1] = v7;
  id v9 = a3;
  v10 = self;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  Swift::String v11 = String.trim()();
  swift_bridgeObjectRelease();
  TextStackView.Component.textValue.setter(v11._countAndFlagsBits, (uint64_t)v11._object);
  [(TitleSectionHeaderView *)v10 setNeedsLayout];
}

- (NSString)subtitle
{
  return (NSString *)sub_1575BC();
}

- (void)setSubtitle:(id)a3
{
}

- (void)layoutSubviews
{
  v2 = self;
  TitleSectionHeaderView.layoutSubviews()();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  v9.is_nil = (char)v6;
  uint64_t v7 = v6;
  v9.value.super.isa = (Class)a3;
  TitleSectionHeaderView.traitCollectionDidChange(_:)(v9);
}

- (void)music_inheritedLayoutInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TitleSectionHeaderView();
  id v2 = v3.receiver;
  [(TitleSectionHeaderView *)&v3 music_inheritedLayoutInsetsDidChange];
  [v2 setNeedsLayout];
}

- (void)applyLayoutAttributes:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for TitleSectionHeaderView();
  id v4 = a3;
  id v5 = v11.receiver;
  [(TitleSectionHeaderView *)&v11 applyLayoutAttributes:v4];
  self;
  uint64_t v6 = swift_dynamicCastObjCClass();
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    v8 = v4;
    unsigned __int8 v9 = [v7 floating];
    char v10 = v5[OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_floating];
    v5[OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_floating] = v9;
    sub_1AC3C8(v10);

    id v5 = v8;
  }
}

- (UIColor)backgroundColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TitleSectionHeaderView();
  id v2 = [(TitleSectionHeaderView *)&v4 backgroundColor];

  return v2;
}

- (void)setBackgroundColor:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TitleSectionHeaderView();
  id v4 = a3;
  id v5 = (char *)v7.receiver;
  [(TitleSectionHeaderView *)&v7 setBackgroundColor:v4];
  uint64_t v6 = *(void **)&v5[OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_externalBackgroundColor];
  *(void *)&v5[OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_externalBackgroundColor] = a3;
}

- (UIView)accessibilityAdditionalContentView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_additionalContentView));
}

- (UIButton)accessibilitySystemStyleButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_systemStyleButton));
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)&self->supertitle[OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_systemStyleButtonAttributedTitle
                                      + 15]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_accessoryButtonHandler));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_textTappedHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_imageArtworkCatalog));
  sub_9289C((uint64_t)self + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_imageArtworkCornerTreatment);
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_artworkPlaceholder);
  id v4 = *(void **)&self->forSizing[OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_artworkPlaceholder];
  id v5 = *(void **)&self->supertitle[OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_artworkPlaceholder + 7];
  objc_release(*(id *)&self->supertitle[OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_artworkPlaceholder
                                      + 15]);

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_additionalContentView));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_topHairlineView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_bottomHairlineView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_titleTextDrawingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_subtitleTextDrawingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_supertitleTextDrawingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_systemStyleButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_floatingBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_chevronImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_externalBackgroundColor));
  uint64_t v6 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_layoutInvalidationHandler);

  sub_1A528(v6);
}

@end