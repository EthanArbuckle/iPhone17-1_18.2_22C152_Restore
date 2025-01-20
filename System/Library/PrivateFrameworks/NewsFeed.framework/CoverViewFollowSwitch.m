@interface CoverViewFollowSwitch
- (_TtC8NewsFeed21CoverViewFollowSwitch)initWithCoder:(id)a3;
- (_TtC8NewsFeed21CoverViewFollowSwitch)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CoverViewFollowSwitch

- (_TtC8NewsFeed21CoverViewFollowSwitch)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed21CoverViewFollowSwitch *)sub_1C0C5287C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed21CoverViewFollowSwitch)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8NewsFeed21CoverViewFollowSwitch_titleLabel;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8NewsFeed21CoverViewFollowSwitch_borderColor) = 0;
  uint64_t v8 = OBJC_IVAR____TtC8NewsFeed21CoverViewFollowSwitch_onTap;
  sub_1BFD22278();
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(v9), sel_init);

  result = (_TtC8NewsFeed21CoverViewFollowSwitch *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  v9.is_nil = (char)v6;
  id v7 = v6;
  v9.value.super.isa = (Class)a3;
  CoverViewFollowSwitch.traitCollectionDidChange(_:)(v9);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed21CoverViewFollowSwitch_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed21CoverViewFollowSwitch_borderColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed21CoverViewFollowSwitch_onTap));
  v3 = (char *)self + OBJC_IVAR____TtC8NewsFeed21CoverViewFollowSwitch_toggleState;
  uint64_t v4 = sub_1C151A17C();
  id v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end