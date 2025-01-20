@interface WFDrawerActionCell
- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerActionCell)initWithCoder:(id)a3;
- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerActionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4;
- (void)layoutSubviews;
@end

@implementation WFDrawerActionCell

- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerActionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerActionCell *)sub_22DAD7984((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DAD2D98);
}

- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerActionCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_22DAD3800();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_22DAD39F0();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  double v4 = sub_22DAD461C();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  double v6 = self;
  sub_22DAD4F7C();

  swift_unknownObjectRelease();
  sub_22D9A6F3C(0, &qword_268596A08);
  double v7 = (void *)sub_22DC92B38();
  swift_bridgeObjectRelease();
  return v7;
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  double v6 = self;
  sub_22DAD529C();

  swift_unknownObjectRelease();
}

- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4
{
  return OUTLINED_FUNCTION_30() & 1;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  id v10 = sub_22DAD53C4();

  swift_unknownObjectRelease();
  return v10;
}

- (void).cxx_destruct
{
  sub_22D9CAD04((uint64_t)self + OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerActionCell_action, &qword_268596978);
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerActionCell_actionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerActionCell_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerActionCell_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerActionCell_infoButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerActionCell_internalBadge));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerActionCell_topHitsScrollView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end