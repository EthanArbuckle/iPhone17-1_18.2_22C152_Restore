@interface PlayIntentControlsReusableView
- (UIControl)accessibilityPlayButton;
- (UIControl)accessibilityShuffleButton;
- (_TtC16MusicApplication30PlayIntentControlsReusableView)initWithCoder:(id)a3;
- (_TtC16MusicApplication30PlayIntentControlsReusableView)initWithFrame:(CGRect)a3;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PlayIntentControlsReusableView

- (_TtC16MusicApplication30PlayIntentControlsReusableView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication30PlayIntentControlsReusableView *)sub_44DE68(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication30PlayIntentControlsReusableView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_44F44C();
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_44F694(v4);

  return v6;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_44E49C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_44E574();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_44EA68(a3);
}

- (UIControl)accessibilityPlayButton
{
  return (UIControl *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                              + OBJC_IVAR____TtC16MusicApplication30PlayIntentControlsReusableView_layoutManager));
}

- (UIControl)accessibilityShuffleButton
{
  return (UIControl *)*(id *)&self->userInterfaceComponents[OBJC_IVAR____TtC16MusicApplication30PlayIntentControlsReusableView_layoutManager];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication30PlayIntentControlsReusableView_playHandler));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication30PlayIntentControlsReusableView_shuffleHandler));
  swift_bridgeObjectRelease();
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication30PlayIntentControlsReusableView_layoutManager);

  id v4 = *(void **)&self->userInterfaceComponents[OBJC_IVAR____TtC16MusicApplication30PlayIntentControlsReusableView_textComponents];
  swift_bridgeObjectRelease();

  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication30PlayIntentControlsReusableView_textStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication30PlayIntentControlsReusableView_bottomHairlineView));
  id v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication30PlayIntentControlsReusableView_topHairlineView);
}

@end