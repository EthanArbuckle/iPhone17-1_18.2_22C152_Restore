@interface TitleSectionHeaderView
- (NSString)accessibilityTitle;
- (NSString)subtitle;
- (NSString)title;
- (UIButton)accessibilityImageButton;
- (UIButton)accessibilitySystemStyleButton;
- (UIColor)backgroundColor;
- (UIView)accessibilityAdditionalContentView;
- (_TtC12NowPlayingUI22TitleSectionHeaderView)initWithCoder:(id)a3;
- (_TtC12NowPlayingUI22TitleSectionHeaderView)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)music_inheritedLayoutInsetsDidChange;
- (void)preferredContentSizeDidChangeWithNewContentSizeCategory:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TitleSectionHeaderView

- (_TtC12NowPlayingUI22TitleSectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC12NowPlayingUI22TitleSectionHeaderView *)sub_7FA04(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12NowPlayingUI22TitleSectionHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_83EE4();
}

- (NSString)title
{
  return (NSString *)sub_7FFD0();
}

- (void)setTitle:(id)a3
{
  uint64_t v4 = sub_1299F0();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_title);
  uint64_t *v5 = v4;
  v5[1] = v6;
  v9 = self;
  swift_bridgeObjectRelease();
  uint64_t v7 = *v5;
  uint64_t v8 = v5[1];
  swift_bridgeObjectRetain();
  sub_55970(v7, v8);
  [(TitleSectionHeaderView *)v9 setNeedsLayout];
}

- (NSString)subtitle
{
  return (NSString *)sub_7FFD0();
}

- (void)setSubtitle:(id)a3
{
  uint64_t v4 = sub_1299F0();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_subtitle);
  uint64_t *v5 = v4;
  v5[1] = v6;
  uint64_t v7 = self;
  swift_bridgeObjectRelease();
  sub_8009C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_8063C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_81F54((uint64_t)a3);
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
    uint64_t v8 = v4;
    unsigned __int8 v9 = [v7 floating];
    char v10 = v5[OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_floating];
    v5[OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_floating] = v9;
    sub_82334(v10);

    id v5 = v8;
  }
}

- (void)preferredContentSizeDidChangeWithNewContentSizeCategory:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_84294();
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
  uint64_t v6 = *(void **)&v5[OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_externalBackgroundColor];
  *(void *)&v5[OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_externalBackgroundColor] = a3;
}

- (UIView)accessibilityAdditionalContentView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_additionalContentView));
}

- (UIButton)accessibilitySystemStyleButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_systemStyleButton));
}

- (UIButton)accessibilityImageButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_imageButton));
}

- (NSString)accessibilityTitle
{
  swift_bridgeObjectRetain();
  NSString v2 = sub_1299B0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_832C8(*(void **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_imageStyleButtonArtworkPlaceholder), *(void *)&self->forSizing[OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_imageStyleButtonArtworkPlaceholder], self->title[OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_imageStyleButtonArtworkPlaceholder + 7]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_imageStyleButtonArtworkCatalog));
  objc_release(*(id *)&self->title[OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_systemStyleButtonAttributedTitle
                                 + 15]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_FB70(*(uint64_t *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_buttonHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_additionalContentView));
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_topHairlineView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_bottomHairlineView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_titleTextDrawingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_subtitleTextDrawingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_systemStyleButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_imageButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_floatingBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_externalBackgroundColor));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_layoutInvalidationHandler);

  sub_FB70(v3);
}

@end