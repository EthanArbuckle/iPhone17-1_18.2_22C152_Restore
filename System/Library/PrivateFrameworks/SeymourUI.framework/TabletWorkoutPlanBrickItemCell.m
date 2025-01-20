@interface TabletWorkoutPlanBrickItemCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC9SeymourUI30TabletWorkoutPlanBrickItemCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI30TabletWorkoutPlanBrickItemCell)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)swapButtonTapped:(id)a3;
@end

@implementation TabletWorkoutPlanBrickItemCell

- (_TtC9SeymourUI30TabletWorkoutPlanBrickItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI30TabletWorkoutPlanBrickItemCell *)sub_239C8052C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI30TabletWorkoutPlanBrickItemCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239C850DC();
}

- (void)didMoveToWindow
{
  v2 = self;
  sub_239C82134();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_239C82280();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_239C82440();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  v9 = self;
  id v10 = [(TabletWorkoutPlanBrickItemCell *)v9 contentView];
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

- (void)swapButtonTapped:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_239C82A3C(v4);
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI30TabletWorkoutPlanBrickItemCell_delegate);
  sub_239C25128((uint64_t)self + OBJC_IVAR____TtC9SeymourUI30TabletWorkoutPlanBrickItemCell_itemInfo, &qword_268A0E7E0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TabletWorkoutPlanBrickItemCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TabletWorkoutPlanBrickItemCell_contentGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TabletWorkoutPlanBrickItemCell_actionButtonContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TabletWorkoutPlanBrickItemCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TabletWorkoutPlanBrickItemCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TabletWorkoutPlanBrickItemCell_captionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TabletWorkoutPlanBrickItemCell_detailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TabletWorkoutPlanBrickItemCell_swapButton));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI30TabletWorkoutPlanBrickItemCell_artworkViewWidthConstraint);
}

@end