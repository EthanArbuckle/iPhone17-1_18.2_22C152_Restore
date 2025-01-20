@interface FilePickerParameterSummaryEditor
- (_TtC14WorkflowEditor32FilePickerParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)beginEditingNewArrayElementFromPresentationAnchor:(id)a3;
- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4;
- (void)cancelEditingWithCompletionHandler:(id)a3;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)documentPickerWasCancelled:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
@end

@implementation FilePickerParameterSummaryEditor

- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_234A3ECEC((uint64_t)v8, v7);
}

- (void)beginEditingNewArrayElementFromPresentationAnchor:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_234A3ED68(v4);
}

- (void)cancelEditingWithCompletionHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  id v6 = self;
  sub_234AE9618((uint64_t)&unk_2687D4980, v5);
}

- (_TtC14WorkflowEditor32FilePickerParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5
{
  return (_TtC14WorkflowEditor32FilePickerParameterSummaryEditor *)sub_234A3FF30(a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor32FilePickerParameterSummaryEditor_modal));
}

- (void)documentPickerWasCancelled:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_234A400AC(v4);
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  sub_234B38378();
  uint64_t v6 = sub_234B3B718();
  id v7 = a3;
  v8 = self;
  sub_234A401F0(v7, v6);

  swift_bridgeObjectRelease();
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_234A403A4();
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  int64_t v9 = sub_234A40414((uint64_t)v8, v7);

  return v9;
}

@end