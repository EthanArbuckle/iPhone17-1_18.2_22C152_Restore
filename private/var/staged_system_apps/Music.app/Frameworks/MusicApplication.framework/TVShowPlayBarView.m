@interface TVShowPlayBarView
- (NSString)title;
- (UIButton)accessibilityPlayButton;
- (UIControl)accessibilityContextualActionsButton;
- (_TtC16MusicApplication17TVShowPlayBarView)initWithCoder:(id)a3;
- (_TtC16MusicApplication17TVShowPlayBarView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setTitle:(id)a3;
@end

@implementation TVShowPlayBarView

- (_TtC16MusicApplication17TVShowPlayBarView)initWithFrame:(CGRect)a3
{
  sub_25152C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC16MusicApplication17TVShowPlayBarView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_252228();
}

- (NSString)title
{
  swift_bridgeObjectRetain();
  NSString v2 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setTitle:(id)a3
{
  uint64_t v5 = sub_AB6510();
  uint64_t v7 = v6;
  id v9 = a3;
  v8 = self;
  sub_251A40(v5, v7);
}

- (void)layoutSubviews
{
  NSString v2 = self;
  sub_251B3C();
}

- (UIButton)accessibilityPlayButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC16MusicApplication17TVShowPlayBarView_playButton));
}

- (UIControl)accessibilityContextualActionsButton
{
  return (UIControl *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                              + OBJC_IVAR____TtC16MusicApplication17TVShowPlayBarView_contextualActionsButton));
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication17TVShowPlayBarView_playButtonHandler));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication17TVShowPlayBarView_buildMenu));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17TVShowPlayBarView_bottomHairlineView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17TVShowPlayBarView_playButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17TVShowPlayBarView_contextualActionsButton));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication17TVShowPlayBarView_titleLabel);
}

@end