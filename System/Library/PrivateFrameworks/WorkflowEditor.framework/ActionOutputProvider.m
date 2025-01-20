@interface ActionOutputProvider
- (_TtC14WorkflowEditorP33_23FAE8DFB59B376283EF5C63F037C7FD20ActionOutputProvider)init;
- (void)revealAction:(id)a3 preScrollHandler:(id)a4 goBackHandler:(id)a5 scrolledAwayHandler:(id)a6;
- (void)showActionOutputPickerAllowingShortcutInput:(BOOL)a3 variableProvider:(id)a4 completionHandler:(id)a5;
@end

@implementation ActionOutputProvider

- (void)showActionOutputPickerAllowingShortcutInput:(BOOL)a3 variableProvider:(id)a4 completionHandler:(id)a5
{
  v6 = _Block_copy(a5);
  *(void *)(swift_allocObject() + 16) = v6;
  swift_unknownObjectRetain();
  v7 = self;
  sub_23498B1E4();
  swift_unknownObjectRelease();

  swift_release();
}

- (void)revealAction:(id)a3 preScrollHandler:(id)a4 goBackHandler:(id)a5 scrolledAwayHandler:(id)a6
{
  v8 = _Block_copy(a4);
  v9 = _Block_copy(a5);
  v10 = _Block_copy(a6);
  *(void *)(swift_allocObject() + 16) = v8;
  *(void *)(swift_allocObject() + 16) = v9;
  if (v10) {
    *(void *)(swift_allocObject() + 16) = v10;
  }
  sub_23498B2FC();
}

- (_TtC14WorkflowEditorP33_23FAE8DFB59B376283EF5C63F037C7FD20ActionOutputProvider)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14WorkflowEditorP33_23FAE8DFB59B376283EF5C63F037C7FD20ActionOutputProvider_editorOptions));
}

@end