@interface OfferListLockupCell
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI19OfferListLockupCell)initWithCoder:(id)a3;
- (_TtC8VideosUI19OfferListLockupCell)initWithFrame:(CGRect)a3;
- (void)vui_prepareForReuse;
- (void)vui_setHighlighted:(BOOL)a3;
@end

@implementation OfferListLockupCell

- (_TtC8VideosUI19OfferListLockupCell)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI19OfferListLockupCell *)sub_1E3302894();
}

- (_TtC8VideosUI19OfferListLockupCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E3302944();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  v5 = self;
  char v6 = OUTLINED_FUNCTION_23_13();
  sub_1E33029E4(v6, v7);

  double v8 = OUTLINED_FUNCTION_28_4();
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)vui_setHighlighted:(BOOL)a3
{
  v4 = self;
  sub_1E3302BFC(a3);
}

- (void)vui_prepareForReuse
{
  v2 = self;
  sub_1E3302CD0();
}

- (void).cxx_destruct
{
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI19OfferListLockupCell_containerView);
}

@end