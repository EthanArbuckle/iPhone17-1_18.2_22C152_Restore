@interface TagFieldHostView.Coordinator
- (_TtCV14WorkflowEditor16TagFieldHostView11Coordinator)init;
- (void)revealAction:(id)a3 preScrollHandler:(id)a4 goBackHandler:(id)a5 scrolledAwayHandler:(id)a6;
- (void)showActionOutputPickerAllowingShortcutInput:(BOOL)a3 variableProvider:(id)a4 completionHandler:(id)a5;
- (void)showParameterEditingHint:(id)a3;
@end

@implementation TagFieldHostView.Coordinator

- (void)showActionOutputPickerAllowingShortcutInput:(BOOL)a3 variableProvider:(id)a4 completionHandler:(id)a5
{
  v6 = _Block_copy(a5);
  *(void *)(swift_allocObject() + 16) = v6;
  swift_unknownObjectRetain();
  v7 = self;
  sub_2349A973C();
  swift_unknownObjectRelease();

  swift_release();
}

- (void)revealAction:(id)a3 preScrollHandler:(id)a4 goBackHandler:(id)a5 scrolledAwayHandler:(id)a6
{
  v10 = _Block_copy(a4);
  v11 = _Block_copy(a5);
  v12 = _Block_copy(a6);
  *(void *)(swift_allocObject() + 16) = v10;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v11;
  if (v12)
  {
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v12;
    v12 = sub_23498D640;
  }
  else
  {
    uint64_t v14 = 0;
  }
  id v15 = a3;
  v16 = self;
  sub_2349A9930(v15, v17, v18, (uint64_t)sub_23498B5AC, v13, (uint64_t)v12, v14);
  sub_2349159D0((uint64_t)v12);

  swift_release();
  swift_release();
}

- (void)showParameterEditingHint:(id)a3
{
  if (a3) {
    sub_234B3B588();
  }
  v4 = self;
  sub_2349A9EB0();

  swift_bridgeObjectRelease();
}

- (_TtCV14WorkflowEditor16TagFieldHostView11Coordinator)init
{
}

- (void).cxx_destruct
{
}

@end