@interface EditorShortcutRunner
- (_TtC14WorkflowEditor20EditorShortcutRunner)init;
- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithAllResults:(id)a4 error:(id)a5 cancelled:(BOOL)a6;
- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6;
- (void)workflowRunnerClient:(id)a3 didStartRunningWorkflowWithProgress:(id)a4;
@end

@implementation EditorShortcutRunner

- (void)workflowRunnerClient:(id)a3 didStartRunningWorkflowWithProgress:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = self;
  sub_234A42EF0((uint64_t)v7, a4);
}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithAllResults:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  uint64_t v7 = (uint64_t)a4;
  if (a4)
  {
    sub_23491E3D4(0, &qword_2687D6360);
    sub_23491E3D4(0, (unint64_t *)&unk_2687D4BB0);
    sub_234967E88();
    uint64_t v7 = sub_234B3B3C8();
  }
  id v10 = a3;
  id v11 = a5;
  v12 = self;
  sub_234A43218((uint64_t)v12, v7, a5);

  swift_bridgeObjectRelease();
}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  id v12 = a3;
  id v9 = a4;
  id v10 = self;
  id v11 = a5;
  sub_234A43944((uint64_t)v11, a4, a5);
}

- (_TtC14WorkflowEditor20EditorShortcutRunner)init
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC14WorkflowEditor20EditorShortcutRunner__runningState;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687D4BA0);
  OUTLINED_FUNCTION_4();
  (*(void (**)(char *))(v4 + 8))(v3);

  swift_release();

  swift_release();
}

@end