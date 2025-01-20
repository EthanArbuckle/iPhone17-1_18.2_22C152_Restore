@interface PosterSectionFooterView
- (_TtC11PosterBoard23PosterSectionFooterView)initWithCoder:(id)a3;
- (_TtC11PosterBoard23PosterSectionFooterView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation PosterSectionFooterView

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PosterSectionFooterView();
  v2 = (char *)v5.receiver;
  [(PosterSectionFooterView *)&v5 prepareForReuse];
  v3 = &v2[OBJC_IVAR____TtC11PosterBoard23PosterSectionFooterView_symbol];
  *(void *)v3 = 0;
  *((void *)v3 + 1) = 0;
  swift_bridgeObjectRelease();
  v4 = &v2[OBJC_IVAR____TtC11PosterBoard23PosterSectionFooterView_text];
  *(void *)v4 = 0;
  *((void *)v4 + 1) = 0;

  swift_bridgeObjectRelease();
}

- (_TtC11PosterBoard23PosterSectionFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC11PosterBoard23PosterSectionFooterView *)sub_1D32FA3F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11PosterBoard23PosterSectionFooterView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard23PosterSectionFooterView_titleLabel) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC11PosterBoard23PosterSectionFooterView_symbol);
  void *v4 = 0;
  v4[1] = 0;
  objc_super v5 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11PosterBoard23PosterSectionFooterView_text);
  *objc_super v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard23PosterSectionFooterView_titleLabelSpacingFromBottomEdge) = (Class)0x4024000000000000;
  id v6 = a3;

  result = (_TtC11PosterBoard23PosterSectionFooterView *)sub_1D3372A88();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1D32FA7A8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard23PosterSectionFooterView_titleLabel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end