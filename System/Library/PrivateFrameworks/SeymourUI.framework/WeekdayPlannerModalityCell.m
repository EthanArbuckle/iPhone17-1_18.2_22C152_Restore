@interface WeekdayPlannerModalityCell
- (BOOL)isHighlighted;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC9SeymourUI26WeekdayPlannerModalityCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI26WeekdayPlannerModalityCell)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
- (void)prepareForReuse;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation WeekdayPlannerModalityCell

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for WeekdayPlannerModalityCell();
  return [(WeekdayPlannerModalityCell *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for WeekdayPlannerModalityCell();
  v4 = (char *)v7.receiver;
  [(WeekdayPlannerModalityCell *)&v7 setHighlighted:v3];
  unsigned int v5 = objc_msgSend(v4, sel_isHighlighted, v7.receiver, v7.super_class);
  v6 = &v4[OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_styleProvider];
  if (v5) {
    v6 = &v4[OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_styleProvider + 8];
  }
  objc_msgSend(v4, sel_setBackgroundColor_, *(void *)v6);
}

- (_TtC9SeymourUI26WeekdayPlannerModalityCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI26WeekdayPlannerModalityCell *)sub_239F05358(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI26WeekdayPlannerModalityCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239F07A44();
}

- (void)didMoveToWindow
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for WeekdayPlannerModalityCell();
  v2 = (char *)v7.receiver;
  [(WeekdayPlannerModalityCell *)&v7 didMoveToWindow];
  id v3 = *(id *)&v2[OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_separatorHeightConstraint];
  id v4 = objc_msgSend(v2, sel_window, v7.receiver, v7.super_class);
  sub_23A7FBD48();
  double v6 = v5;

  objc_msgSend(v3, sel_setConstant_, v6);
  objc_msgSend(v2, sel_setNeedsUpdateConstraints);
}

- (void)prepareForReuse
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A0E7E0);
  MEMORY[0x270FA5388](v3 - 8);
  double v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v6 = (objc_class *)type metadata accessor for WeekdayPlannerModalityCell();
  v11.receiver = self;
  v11.super_class = v6;
  objc_super v7 = self;
  [(WeekdayPlannerModalityCell *)&v11 prepareForReuse];
  [(WeekdayPlannerModalityCell *)v7 directionalLayoutMargins];
  [(WeekdayPlannerModalityCell *)v7 setDirectionalLayoutMargins:sel_setDirectionalLayoutMargins_];
  uint64_t v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_itemInfo;
  swift_beginAccess();
  sub_239C74F28((uint64_t)v5, v9);
  swift_endAccess();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v9 = self;
  id v10 = [(WeekdayPlannerModalityCell *)v9 contentView];
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
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_delegate);
  sub_239C752B4((uint64_t)self + OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_itemInfo);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_separator));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_styleProvider);
  uint64_t v4 = *(void **)((char *)&self->super.super.super.super.super._responderFlags
                + OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_styleProvider);
  double v5 = *(FBSSceneIdentityToken **)((char *)&self->super.super.super.super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_styleProvider);
  double v6 = *(NSMutableArray **)((char *)&self->super.super.super.super._constraintsExceptingSubviewAutoresizingConstraints
                          + OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_styleProvider);
  objc_super v7 = *(UITraitCollection **)((char *)&self->super.super.super.super._cachedTraitCollection
                             + OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_styleProvider);
  uint64_t v8 = *(id *)((char *)&self->super.super.super.super._swiftAnimationInfo
             + OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_styleProvider);
  uint64_t v9 = *(_UITraitChangeRegistry **)((char *)&self->super.super.super.super._traitChangeRegistry
                                  + OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_styleProvider);
  id v10 = *(CALayer **)((char *)&self->super.super.super.super._layerRetained
                    + OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_styleProvider);
  objc_release(*(id *)((char *)&self->super.super.super.super._subviewCache
                     + OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_styleProvider));

  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_titleLabel));
  double v11 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                 + OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_separatorHeightConstraint);
}

@end