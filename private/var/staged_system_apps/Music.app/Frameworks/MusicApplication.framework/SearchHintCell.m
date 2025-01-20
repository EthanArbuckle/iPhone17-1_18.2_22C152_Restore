@interface SearchHintCell
- (_TtC16MusicApplication14SearchHintCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication14SearchHintCell)initWithFrame:(CGRect)a3;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SearchHintCell

- (_TtC16MusicApplication14SearchHintCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication14SearchHintCell *)sub_2524C8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication14SearchHintCell)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication14SearchHintCell__highlightedText);
  void *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication14SearchHintCell____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication14SearchHintCell____lazy_storage___magnifierImageView) = 0;
  id v5 = a3;

  result = (_TtC16MusicApplication14SearchHintCell *)sub_AB8280();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2526BC();
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  id v5 = self;
  v6 = sub_2533C4(v4);

  return v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_2529C0(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication14SearchHintCell____lazy_storage___titleLabel));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication14SearchHintCell____lazy_storage___magnifierImageView);
}

@end