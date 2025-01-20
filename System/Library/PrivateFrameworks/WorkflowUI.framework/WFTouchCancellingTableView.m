@interface WFTouchCancellingTableView
- (BOOL)touchesShouldCancelInContentView:(id)a3;
- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080826WFTouchCancellingTableView)initWithCoder:(id)a3;
- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080826WFTouchCancellingTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
@end

@implementation WFTouchCancellingTableView

- (BOOL)touchesShouldCancelInContentView:(id)a3
{
  return OUTLINED_FUNCTION_30() & 1;
}

- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080826WFTouchCancellingTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  return (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080826WFTouchCancellingTableView *)sub_22DAD9594(a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080826WFTouchCancellingTableView)initWithCoder:(id)a3
{
  return (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080826WFTouchCancellingTableView *)sub_22DAD9764(a3, (uint64_t (*)(void))type metadata accessor for WFTouchCancellingTableView);
}

@end