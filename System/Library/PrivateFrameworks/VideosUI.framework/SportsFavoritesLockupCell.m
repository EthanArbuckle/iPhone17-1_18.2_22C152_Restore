@interface SportsFavoritesLockupCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8VideosUI25SportsFavoritesLockupCell)initWithCoder:(id)a3;
- (_TtC8VideosUI25SportsFavoritesLockupCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation SportsFavoritesLockupCell

- (_TtC8VideosUI25SportsFavoritesLockupCell)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI25SportsFavoritesLockupCell *)sub_1E3747B6C();
}

- (_TtC8VideosUI25SportsFavoritesLockupCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E3747C80();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_1E3747D5C(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1E3747FF0();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1E3748A54();
}

- (void)setHighlighted:(BOOL)a3
{
  v4 = self;
  sub_1E3748B24(a3);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  double v5 = self;
  sub_1E3748E74(a3);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25SportsFavoritesLockupCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25SportsFavoritesLockupCell_logoImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25SportsFavoritesLockupCell_accessoryImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25SportsFavoritesLockupCell_topSeparatorView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI25SportsFavoritesLockupCell_bottomSeparatorView);
}

@end