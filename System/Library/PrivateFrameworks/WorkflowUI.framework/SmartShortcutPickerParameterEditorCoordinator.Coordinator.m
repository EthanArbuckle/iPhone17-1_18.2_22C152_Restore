@interface SmartShortcutPickerParameterEditorCoordinator.Coordinator
- (_TtCC10WorkflowUI45SmartShortcutPickerParameterEditorCoordinatorP33_144DB5BEFA04CF045390510CC999A4A811Coordinator)init;
- (void)moduleSummaryPresenter:(id)a3 didCommitParameterState:(id)a4;
- (void)moduleSummaryPresenter:(id)a3 didStageParameterState:(id)a4;
- (void)moduleSummaryPresenterDidFinish:(id)a3;
@end

@implementation SmartShortcutPickerParameterEditorCoordinator.Coordinator

- (void)moduleSummaryPresenter:(id)a3 didStageParameterState:(id)a4
{
}

- (void)moduleSummaryPresenter:(id)a3 didCommitParameterState:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  sub_22DB11AF4();

  swift_unknownObjectRelease();
}

- (void)moduleSummaryPresenterDidFinish:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_22DB11D18(v4);
}

- (_TtCC10WorkflowUI45SmartShortcutPickerParameterEditorCoordinatorP33_144DB5BEFA04CF045390510CC999A4A811Coordinator)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC10WorkflowUI45SmartShortcutPickerParameterEditorCoordinatorP33_144DB5BEFA04CF045390510CC999A4A811Coordinator_presenter));
  sub_22DB13090((uint64_t)self+ OBJC_IVAR____TtCC10WorkflowUI45SmartShortcutPickerParameterEditorCoordinatorP33_144DB5BEFA04CF045390510CC999A4A811Coordinator_options);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCC10WorkflowUI45SmartShortcutPickerParameterEditorCoordinatorP33_144DB5BEFA04CF045390510CC999A4A811Coordinator_dismissHandler);
  sub_22D9CC274(v3);
}

@end