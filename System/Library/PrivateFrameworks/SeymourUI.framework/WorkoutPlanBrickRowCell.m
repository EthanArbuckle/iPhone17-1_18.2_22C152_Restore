@interface WorkoutPlanBrickRowCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC9SeymourUI23WorkoutPlanBrickRowCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI23WorkoutPlanBrickRowCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation WorkoutPlanBrickRowCell

- (_TtC9SeymourUI23WorkoutPlanBrickRowCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI23WorkoutPlanBrickRowCell *)sub_23A403448(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI23WorkoutPlanBrickRowCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A4067CC();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_23A403CC0();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  v9 = self;
  id v10 = [(WorkoutPlanBrickRowCell *)v9 contentView];
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
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI23WorkoutPlanBrickRowCell_delegate);
  sub_239C752B4((uint64_t)self + OBJC_IVAR____TtC9SeymourUI23WorkoutPlanBrickRowCell_itemInfo);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23WorkoutPlanBrickRowCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23WorkoutPlanBrickRowCell_separator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23WorkoutPlanBrickRowCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23WorkoutPlanBrickRowCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23WorkoutPlanBrickRowCell_textLayoutGuide));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end