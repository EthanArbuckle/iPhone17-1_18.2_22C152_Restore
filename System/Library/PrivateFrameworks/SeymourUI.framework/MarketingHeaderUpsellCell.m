@interface MarketingHeaderUpsellCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC9SeymourUI25MarketingHeaderUpsellCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI25MarketingHeaderUpsellCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation MarketingHeaderUpsellCell

- (_TtC9SeymourUI25MarketingHeaderUpsellCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI25MarketingHeaderUpsellCell *)sub_23A76A2DC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI25MarketingHeaderUpsellCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A76B4C0();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_23A76A7E0();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  v9 = self;
  id v10 = [(MarketingHeaderUpsellCell *)v9 contentView];
  *(float *)&double v11 = a4;
  *(float *)&double v12 = a5;
  objc_msgSend(v10, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v11, v12);
  double v14 = v13;
  double v16 = v15;

  double v17 = v14;
  double v18 = v16;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25MarketingHeaderUpsellCell_delegate);
  sub_239C752B4((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25MarketingHeaderUpsellCell_itemInfo);
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI25MarketingHeaderUpsellCell_onElementAppearance));
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI25MarketingHeaderUpsellCell_onElementDisappearance));
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI25MarketingHeaderUpsellCell_onVisibleBoundsChange));
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI25MarketingHeaderUpsellCell_onImpressionableBoundsChange));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI25MarketingHeaderUpsellCell_marketingView);
}

@end