@interface PosterSectionHeaderView
- (NSString)title;
- (_TtC11PosterBoard23PosterSectionHeaderView)initWithCoder:(id)a3;
- (_TtC11PosterBoard23PosterSectionHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)posterPairDidUpdateLocalizedTitle:(id)a3;
- (void)prepareForReuse;
- (void)setTitle:(id)a3;
@end

@implementation PosterSectionHeaderView

- (NSString)title
{
  if (*(void *)((char *)&self->super.super.super._responderFlags
                 + OBJC_IVAR____TtC11PosterBoard23PosterSectionHeaderView_title))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1D3372258();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (void)setTitle:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1D3372288();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC11PosterBoard23PosterSectionHeaderView_title);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC11PosterBoard23PosterSectionHeaderView_title);
  uint64_t v8 = *(void *)((char *)&self->super.super.super._responderFlags
                 + OBJC_IVAR____TtC11PosterBoard23PosterSectionHeaderView_title);
  uint64_t *v6 = v4;
  v6[1] = v5;
  v9 = self;
  sub_1D3310748(v7, v8);

  swift_bridgeObjectRelease();
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PosterSectionHeaderView();
  v2 = (char *)v6.receiver;
  [(PosterSectionHeaderView *)&v6 prepareForReuse];
  v3 = &v2[OBJC_IVAR____TtC11PosterBoard23PosterSectionHeaderView_title];
  uint64_t v4 = *(void *)&v2[OBJC_IVAR____TtC11PosterBoard23PosterSectionHeaderView_title];
  uint64_t v5 = *(void *)&v2[OBJC_IVAR____TtC11PosterBoard23PosterSectionHeaderView_title + 8];
  *(void *)v3 = 0;
  *((void *)v3 + 1) = 0;
  sub_1D3310748(v4, v5);

  swift_bridgeObjectRelease();
}

- (_TtC11PosterBoard23PosterSectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC11PosterBoard23PosterSectionHeaderView *)sub_1D33108CC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11PosterBoard23PosterSectionHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1D3310FF4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1D3310C1C();
}

- (void)posterPairDidUpdateLocalizedTitle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1D3310E2C((uint64_t)v4);
}

- (void).cxx_destruct
{
  sub_1D32CE208((uint64_t)self + OBJC_IVAR____TtC11PosterBoard23PosterSectionHeaderView_delegate);
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11PosterBoard23PosterSectionHeaderView_titleLabel);
}

@end