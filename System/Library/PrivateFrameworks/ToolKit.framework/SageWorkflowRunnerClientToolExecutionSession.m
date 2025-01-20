@interface SageWorkflowRunnerClientToolExecutionSession
- (NSString)debugDescription;
- (_TtC7ToolKit44SageWorkflowRunnerClientToolExecutionSession)init;
- (void)dealloc;
- (void)workflowRunnerClient:(WFSageWorkflowRunnerClient *)a3 postedDialogRequest:(WFDialogRequest *)a4 completionHandler:(id)a5;
- (void)workflowRunnerClient:(id)a3 didStartRunningWorkflowWithProgress:(id)a4;
- (void)workflowRunnerClient:(id)a3 postedEvent:(int64_t)a4;
@end

@implementation SageWorkflowRunnerClientToolExecutionSession

- (void)dealloc
{
  v2 = self;
  sub_25FDE60B8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7ToolKit44SageWorkflowRunnerClientToolExecutionSession_client));
  sub_25FBC02B4((uint64_t)self + OBJC_IVAR____TtC7ToolKit44SageWorkflowRunnerClientToolExecutionSession_currentDialogHandler, &qword_26B3AC970);
  sub_25FBC02B4((uint64_t)self + OBJC_IVAR____TtC7ToolKit44SageWorkflowRunnerClientToolExecutionSession_currentInvocation, &qword_26B3B04F0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3AFB60);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_22();
  v3();
  sub_25FFFD228();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_22();
  v4();
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC7ToolKit44SageWorkflowRunnerClientToolExecutionSession_actionStateObservation);
}

- (void)workflowRunnerClient:(WFSageWorkflowRunnerClient *)a3 postedDialogRequest:(WFDialogRequest *)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_25FDE71C0((uint64_t)&unk_26A7FA618, (uint64_t)v9);
}

- (void)workflowRunnerClient:(id)a3 postedEvent:(int64_t)a4
{
  id v5 = a3;
  v6 = self;
  sub_25FDE72C4();
}

- (void)workflowRunnerClient:(id)a3 didStartRunningWorkflowWithProgress:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_25FDE7630((uint64_t)v8, a4);
}

- (NSString)debugDescription
{
  v2 = self;
  sub_25FDE7C78();

  v3 = (void *)sub_25FFFEC68();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC7ToolKit44SageWorkflowRunnerClientToolExecutionSession)init
{
}

@end