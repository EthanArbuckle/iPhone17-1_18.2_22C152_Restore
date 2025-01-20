@interface WFTouchCancellingScrollView
- (BOOL)touchesShouldCancelInContentView:(id)a3;
- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080827WFTouchCancellingScrollView)initWithCoder:(id)a3;
- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080827WFTouchCancellingScrollView)initWithFrame:(CGRect)a3;
@end

@implementation WFTouchCancellingScrollView

- (BOOL)touchesShouldCancelInContentView:(id)a3
{
  return OUTLINED_FUNCTION_30() & 1;
}

- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080827WFTouchCancellingScrollView)initWithFrame:(CGRect)a3
{
  return (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080827WFTouchCancellingScrollView *)sub_22DAD96D8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080827WFTouchCancellingScrollView)initWithCoder:(id)a3
{
  return (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080827WFTouchCancellingScrollView *)sub_22DAD9764(a3, (uint64_t (*)(void))type metadata accessor for WFTouchCancellingScrollView);
}

@end