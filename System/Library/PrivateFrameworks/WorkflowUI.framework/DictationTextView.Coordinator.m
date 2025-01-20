@interface DictationTextView.Coordinator
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (_TtCV10WorkflowUI17DictationTextView11Coordinator)init;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
@end

@implementation DictationTextView.Coordinator

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22DBE4D84(v4);
}

- (void)textViewDidBeginEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22DBE5098(v4);
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22DBE51A8();
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  uint64_t v7 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  uint64_t v9 = v8;
  id v10 = a3;
  v11 = self;
  LOBYTE(v7) = sub_22DBE5270(v10, v12, v13, v7, v9);

  swift_bridgeObjectRelease();
  return v7 & 1;
}

- (_TtCV10WorkflowUI17DictationTextView11Coordinator)init
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtCV10WorkflowUI17DictationTextView11Coordinator_textView);
}

@end