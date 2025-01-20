@interface RoundedButtonCollectionViewCell
- (_TtC8AppStore31RoundedButtonCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore31RoundedButtonCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)didTapButton:(id)a3;
- (void)layoutSubviews;
@end

@implementation RoundedButtonCollectionViewCell

- (_TtC8AppStore31RoundedButtonCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31RoundedButtonCollectionViewCell *)sub_1007557D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore31RoundedButtonCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100757270();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100755B84();
}

- (void)didTapButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1007562E8(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31RoundedButtonCollectionViewCell_button));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31RoundedButtonCollectionViewCell_dividerView));
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore31RoundedButtonCollectionViewCell_action, (uint64_t *)&unk_1009A9770);
}

@end