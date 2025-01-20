@interface SummaryViewHost
- (_TtC14WorkflowEditorP33_060892FA80DB790CDB013ACF6F2F770415SummaryViewHost)initWithCoder:(id)a3;
- (_TtC14WorkflowEditorP33_060892FA80DB790CDB013ACF6F2F770415SummaryViewHost)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)willMoveToWindow:(id)a3;
@end

@implementation SummaryViewHost

- (void)willMoveToWindow:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_234A66158((uint64_t)a3);
}

- (void)dealloc
{
  v2 = self;
  sub_234A662E8();
}

- (void).cxx_destruct
{
}

- (_TtC14WorkflowEditorP33_060892FA80DB790CDB013ACF6F2F770415SummaryViewHost)initWithFrame:(CGRect)a3
{
  return (_TtC14WorkflowEditorP33_060892FA80DB790CDB013ACF6F2F770415SummaryViewHost *)sub_234A663B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC14WorkflowEditorP33_060892FA80DB790CDB013ACF6F2F770415SummaryViewHost)initWithCoder:(id)a3
{
  return (_TtC14WorkflowEditorP33_060892FA80DB790CDB013ACF6F2F770415SummaryViewHost *)sub_234A6644C(a3);
}

@end