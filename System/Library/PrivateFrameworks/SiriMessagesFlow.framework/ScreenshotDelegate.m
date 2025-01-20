@interface ScreenshotDelegate
- (_TtC16SiriMessagesFlowP33_AC72C49DCF17A2EF063087622590466618ScreenshotDelegate)init;
- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutputFiles:(id)a4 error:(id)a5 cancelled:(BOOL)a6;
@end

@implementation ScreenshotDelegate

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutputFiles:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  uint64_t v7 = (uint64_t)a4;
  if (a4)
  {
    sub_25D17DBEC(0, &qword_26A671A98);
    uint64_t v7 = sub_25D53E4C0();
  }
  id v10 = a3;
  id v11 = a5;
  v12 = self;
  sub_25D2D612C(v10, v7, a5);

  swift_bridgeObjectRelease();
}

- (_TtC16SiriMessagesFlowP33_AC72C49DCF17A2EF063087622590466618ScreenshotDelegate)init
{
}

- (void).cxx_destruct
{
}

@end