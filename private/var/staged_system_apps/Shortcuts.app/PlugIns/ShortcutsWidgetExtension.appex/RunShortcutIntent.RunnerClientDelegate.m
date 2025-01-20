@interface RunShortcutIntent.RunnerClientDelegate
- (_TtCV24ShortcutsWidgetExtension17RunShortcutIntentP33_82D064107D62BB69BF784D876A4D3C0420RunnerClientDelegate)init;
- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6;
- (void)workflowRunnerClient:(id)a3 didStartRunningWorkflowWithProgress:(id)a4;
@end

@implementation RunShortcutIntent.RunnerClientDelegate

- (void)workflowRunnerClient:(id)a3 didStartRunningWorkflowWithProgress:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10002EADC(v6, a4);
}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  id v12 = a5;
  sub_10002EF84(v9, (uint64_t)a4, (uint64_t)a5);
}

- (_TtCV24ShortcutsWidgetExtension17RunShortcutIntentP33_82D064107D62BB69BF784D876A4D3C0420RunnerClientDelegate)init
{
}

- (void).cxx_destruct
{
  v2 = (char *)self
     + OBJC_IVAR____TtCV24ShortcutsWidgetExtension17RunShortcutIntentP33_82D064107D62BB69BF784D876A4D3C0420RunnerClientDelegate_continuation;
  uint64_t v3 = sub_100005A10(&qword_100041EC8);
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_release();
}

@end