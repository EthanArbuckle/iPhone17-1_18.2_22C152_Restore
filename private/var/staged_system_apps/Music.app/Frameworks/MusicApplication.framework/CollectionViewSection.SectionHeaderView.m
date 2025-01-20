@interface CollectionViewSection.SectionHeaderView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtCV16MusicApplication21CollectionViewSection17SectionHeaderView)initWithCoder:(id)a3;
- (_TtCV16MusicApplication21CollectionViewSection17SectionHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation CollectionViewSection.SectionHeaderView

- (_TtCV16MusicApplication21CollectionViewSection17SectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtCV16MusicApplication21CollectionViewSection17SectionHeaderView *)sub_F71D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCV16MusicApplication21CollectionViewSection17SectionHeaderView)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtCV16MusicApplication21CollectionViewSection17SectionHeaderView_contentConfiguration;
  id v5 = a3;
  sub_F6EA4((uint64_t)v4);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtCV16MusicApplication21CollectionViewSection17SectionHeaderView_artworkCachingReference) = 0;
  v6 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtCV16MusicApplication21CollectionViewSection17SectionHeaderView____lazy_storage___contentView);
  void *v6 = 0;
  v6[1] = 0;

  result = (_TtCV16MusicApplication21CollectionViewSection17SectionHeaderView *)sub_AB8280();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  id v2 = v4.receiver;
  [(CollectionViewSection.SectionHeaderView *)&v4 layoutSubviews];
  v3 = sub_F72BC();
  [v2 bounds];
  [v3 setFrame:];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = self;
  v6 = sub_F72BC();
  [v6 sizeThatFits:width, height];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (CGSize)intrinsicContentSize
{
  id v2 = self;
  v3 = sub_F72BC();
  [v3 intrinsicContentSize];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void).cxx_destruct
{
  sub_FD9DC((uint64_t)self + OBJC_IVAR____TtCV16MusicApplication21CollectionViewSection17SectionHeaderView_contentConfiguration);
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtCV16MusicApplication21CollectionViewSection17SectionHeaderView____lazy_storage___contentView);
}

@end