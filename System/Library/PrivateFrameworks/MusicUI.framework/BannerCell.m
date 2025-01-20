@interface BannerCell
- (_TtC7MusicUI10BannerCell)initWithCoder:(id)a3;
- (_TtC7MusicUI10BannerCell)initWithFrame:(CGRect)a3;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)layoutSubviews;
@end

@implementation BannerCell

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2299338C8(v4);

  return v4;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_229933A80();
}

- (_TtC7MusicUI10BannerCell)initWithFrame:(CGRect)a3
{
  return (_TtC7MusicUI10BannerCell *)BannerCell.init(frame:)();
}

- (_TtC7MusicUI10BannerCell)initWithCoder:(id)a3
{
  return (_TtC7MusicUI10BannerCell *)BannerCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
}

@end