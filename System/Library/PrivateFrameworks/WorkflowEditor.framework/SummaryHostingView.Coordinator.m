@interface SummaryHostingView.Coordinator
- (_TtCV14WorkflowEditorP33_060892FA80DB790CDB013ACF6F2F770418SummaryHostingView11Coordinator)init;
- (id)viewControllerForCoordinator:(id)a3;
- (void)revealAction:(id)a3 preScrollHandler:(id)a4 goBackHandler:(id)a5 scrolledAwayHandler:(id)a6;
- (void)showActionOutputPickerAllowingShortcutInput:(BOOL)a3 variableProvider:(id)a4 completionHandler:(id)a5;
- (void)showParameterEditingHint:(id)a3;
- (void)showVariableEditorWithOptions:(id)a3 fromSourceRect:(CGRect)a4;
- (void)summaryCoordinator:(id)a3 disclosureArrowDidChange:(BOOL)a4;
- (void)summaryCoordinator:(id)a3 outputButtonDidChange:(BOOL)a4;
- (void)summaryCoordinatorDidInvalidateSize:(id)a3;
@end

@implementation SummaryHostingView.Coordinator

- (id)viewControllerForCoordinator:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_234A61390();

  return v6;
}

- (void)summaryCoordinatorDidInvalidateSize:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_234A6146C(v4);
}

- (void)summaryCoordinator:(id)a3 disclosureArrowDidChange:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  sub_234A61538();
}

- (void)summaryCoordinator:(id)a3 outputButtonDidChange:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  sub_234A61690();
}

- (void)showActionOutputPickerAllowingShortcutInput:(BOOL)a3 variableProvider:(id)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  swift_unknownObjectRetain();
  v10 = self;
  sub_234A61864(a3, (uint64_t)a4, (uint64_t)sub_23498B5B4, v9);
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
  sub_234A61A78(v16, (uint64_t)sub_23498B5AC, v13, (uint64_t)sub_23498D640, v14, (uint64_t)v12, v15);
  sub_2349159D0((uint64_t)v12);

  swift_release();
  swift_release();
}

- (void)showVariableEditorWithOptions:(id)a3 fromSourceRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  v10 = self;
  sub_234A61E84(v9, x, y, width, height);
}

- (void)showParameterEditingHint:(id)a3
{
  if (a3) {
    sub_234B3B588();
  }
  id v4 = self;
  sub_234A62910();

  swift_bridgeObjectRelease();
}

- (_TtCV14WorkflowEditorP33_060892FA80DB790CDB013ACF6F2F770418SummaryHostingView11Coordinator)init
{
}

- (void).cxx_destruct
{
}

@end