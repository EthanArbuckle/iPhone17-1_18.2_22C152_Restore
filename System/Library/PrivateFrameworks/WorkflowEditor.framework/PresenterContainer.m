@interface PresenterContainer
- (_TtC14WorkflowEditorP33_460410A17E70035D97A591FA113148C318PresenterContainer)init;
- (void)moduleSummaryPresenter:(id)a3 didCommitParameterState:(id)a4;
- (void)moduleSummaryPresenter:(id)a3 didStageParameterState:(id)a4;
- (void)moduleSummaryPresenterDidFinish:(id)a3;
- (void)revealAction:(id)a3 preScrollHandler:(id)a4 goBackHandler:(id)a5 scrolledAwayHandler:(id)a6;
- (void)showActionOutputPickerAllowingShortcutInput:(BOOL)a3 variableProvider:(id)a4 completionHandler:(id)a5;
- (void)showParameterEditingHint:(id)a3;
@end

@implementation PresenterContainer

- (void)moduleSummaryPresenter:(id)a3 didStageParameterState:(id)a4
{
}

- (void)moduleSummaryPresenter:(id)a3 didCommitParameterState:(id)a4
{
}

- (void)moduleSummaryPresenterDidFinish:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_234A7C1D0();
}

- (void)showActionOutputPickerAllowingShortcutInput:(BOOL)a3 variableProvider:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  swift_unknownObjectRetain();
  v10 = self;
  sub_234A7C2B4(v6, (uint64_t)a4, (uint64_t)sub_234A7EEDC, v9);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)revealAction:(id)a3 preScrollHandler:(id)a4 goBackHandler:(id)a5 scrolledAwayHandler:(id)a6
{
  v10 = _Block_copy(a4);
  v11 = _Block_copy(a5);
  v12 = _Block_copy(a6);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v10;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v11;
  if (v12)
  {
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v12;
    v12 = sub_23498D640;
  }
  else
  {
    uint64_t v15 = 0;
  }
  id v16 = a3;
  v17 = self;
  sub_234A7C40C((uint64_t)v16, (uint64_t)sub_23498B5AC, v13, (uint64_t)sub_23498D640, v14, (uint64_t)v12, v15);
  sub_2349159D0((uint64_t)v12);

  swift_release();
  swift_release();
}

- (void)showParameterEditingHint:(id)a3
{
  if (a3) {
    sub_234B3B588();
  }
  id v4 = self;
  sub_234A7C6C0();

  swift_bridgeObjectRelease();
}

- (_TtC14WorkflowEditorP33_460410A17E70035D97A591FA113148C318PresenterContainer)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14WorkflowEditorP33_460410A17E70035D97A591FA113148C318PresenterContainer_presenter));
  swift_release();
  sub_2349159D0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC14WorkflowEditorP33_460410A17E70035D97A591FA113148C318PresenterContainer_onShowActionOutputPicker));
  sub_2349159D0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC14WorkflowEditorP33_460410A17E70035D97A591FA113148C318PresenterContainer_onRevealAction));
  sub_2349159D0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC14WorkflowEditorP33_460410A17E70035D97A591FA113148C318PresenterContainer_onFinish));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC14WorkflowEditorP33_460410A17E70035D97A591FA113148C318PresenterContainer_parameterEditingHint);
  uint64_t v4 = *(void *)&self->presenter[OBJC_IVAR____TtC14WorkflowEditorP33_460410A17E70035D97A591FA113148C318PresenterContainer_parameterEditingHint];
  sub_234A7EE54(v3, v4);
}

@end