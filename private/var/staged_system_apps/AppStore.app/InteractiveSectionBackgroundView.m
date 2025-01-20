@interface InteractiveSectionBackgroundView
- (_TtC8AppStore32InteractiveSectionBackgroundView)initWithCoder:(id)a3;
- (_TtC8AppStore32InteractiveSectionBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation InteractiveSectionBackgroundView

- (_TtC8AppStore32InteractiveSectionBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore32InteractiveSectionBackgroundView *)sub_10044BE18(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore32InteractiveSectionBackgroundView)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC8AppStore32InteractiveSectionBackgroundView *)sub_10044E1E4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10044C124();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10044C228();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32InteractiveSectionBackgroundView_materialView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32InteractiveSectionBackgroundView_topBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32InteractiveSectionBackgroundView_bottomBackgroundView));
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore32InteractiveSectionBackgroundView_currentState, (uint64_t *)&unk_100990400);
}

@end