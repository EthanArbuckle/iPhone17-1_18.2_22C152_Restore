@interface SystemShortcutPickerSummaryEditor
- (_TtC14WorkflowEditorP33_C5B21244354E018AE032A433C7339AFA33SystemShortcutPickerSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5;
- (id)viewControllerForEditingWithIdentifier:(id)a3;
- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4;
- (void)cancelEditingWithCompletionHandler:(id)a3;
- (void)smartShortcutPickerViewControllerDidFinishWithSystemAction:(id)a3 error:(id)a4;
@end

@implementation SystemShortcutPickerSummaryEditor

- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_23494DDB8((uint64_t)v6, v7);
}

- (id)viewControllerForEditingWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = (void *)sub_23494DE3C();

  return v6;
}

- (void)cancelEditingWithCompletionHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  id v6 = self;
  sub_234AE9618((uint64_t)&unk_2687D0400, v5);
}

- (void)smartShortcutPickerViewControllerDidFinishWithSystemAction:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v7 = self;
  id v8 = a4;
  sub_23494E890(a3);
}

- (_TtC14WorkflowEditorP33_C5B21244354E018AE032A433C7339AFA33SystemShortcutPickerSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5
{
  return (_TtC14WorkflowEditorP33_C5B21244354E018AE032A433C7339AFA33SystemShortcutPickerSummaryEditor *)sub_23494EB68(a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditorP33_C5B21244354E018AE032A433C7339AFA33SystemShortcutPickerSummaryEditor_modal));
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC14WorkflowEditorP33_C5B21244354E018AE032A433C7339AFA33SystemShortcutPickerSummaryEditor_coordinator);
}

@end