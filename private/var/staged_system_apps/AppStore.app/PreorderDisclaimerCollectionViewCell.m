@interface PreorderDisclaimerCollectionViewCell
- (_TtC8AppStore36PreorderDisclaimerCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore36PreorderDisclaimerCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PreorderDisclaimerCollectionViewCell

- (_TtC8AppStore36PreorderDisclaimerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore36PreorderDisclaimerCollectionViewCell *)sub_10063C628(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore36PreorderDisclaimerCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10063CD1C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10063CA64();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36PreorderDisclaimerCollectionViewCell_disclaimerLabel));
  id v3 = (char *)self + OBJC_IVAR____TtC8AppStore36PreorderDisclaimerCollectionViewCell_itemLayoutContext;

  sub_1000A1D30((uint64_t)v3);
}

@end