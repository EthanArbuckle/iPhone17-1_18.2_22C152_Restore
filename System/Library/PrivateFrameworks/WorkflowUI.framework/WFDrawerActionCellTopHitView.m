@interface WFDrawerActionCellTopHitView
- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080828WFDrawerActionCellTopHitView)initWithCoder:(id)a3;
- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080828WFDrawerActionCellTopHitView)initWithFrame:(CGRect)a3;
- (void)didSelect:(id)a3;
- (void)layoutSubviews;
@end

@implementation WFDrawerActionCellTopHitView

- (void)layoutSubviews
{
  v2 = self;
  sub_22DAD6830();
}

- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080828WFDrawerActionCellTopHitView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_22DAD69D8();
}

- (void)didSelect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22DAD6AAC();
}

- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080828WFDrawerActionCellTopHitView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_release();
  id v3 = (char *)self
     + OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080828WFDrawerActionCellTopHitView_topHit;
  uint64_t v4 = sub_22DC8F3B8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080828WFDrawerActionCellTopHitView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080828WFDrawerActionCellTopHitView_thumbnailBorderView));
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080828WFDrawerActionCellTopHitView_label);
}

@end