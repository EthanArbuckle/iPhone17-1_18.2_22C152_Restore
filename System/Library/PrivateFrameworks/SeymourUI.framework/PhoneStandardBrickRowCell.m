@interface PhoneStandardBrickRowCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC9SeymourUI25PhoneStandardBrickRowCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI25PhoneStandardBrickRowCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation PhoneStandardBrickRowCell

- (_TtC9SeymourUI25PhoneStandardBrickRowCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI25PhoneStandardBrickRowCell *)sub_239EE0008(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI25PhoneStandardBrickRowCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239EE2710();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_239EE093C();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  v9 = self;
  id v10 = [(PhoneStandardBrickRowCell *)v9 contentView];
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
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25PhoneStandardBrickRowCell_delegate);
  sub_239C752B4((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25PhoneStandardBrickRowCell_itemInfo);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25PhoneStandardBrickRowCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25PhoneStandardBrickRowCell_separator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25PhoneStandardBrickRowCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25PhoneStandardBrickRowCell_titleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI25PhoneStandardBrickRowCell_textLayoutGuide);
}

@end