@interface CleanRTFTextView
- (BOOL)_shouldAdjustKeyboardGuidesForTextFormattingIfNeeded;
- (BOOL)_shouldHandleTextFormattingChangeValue:(id)a3;
- (_TtC7JournalP33_52B12D7015364A2A97B4965365E27BCB16CleanRTFTextView)initWithCoder:(id)a3;
- (_TtC7JournalP33_52B12D7015364A2A97B4965365E27BCB16CleanRTFTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (id)_configurationForTextFormattingOptions;
@end

@implementation CleanRTFTextView

- (BOOL)_shouldAdjustKeyboardGuidesForTextFormattingIfNeeded
{
  return 0;
}

- (BOOL)_shouldHandleTextFormattingChangeValue:(id)a3
{
  uint64_t v3 = type metadata accessor for UITextFormattingViewController.ChangeValue();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UITextFormattingViewController.ChangeValue._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return 1;
}

- (id)_configurationForTextFormattingOptions
{
  id v2 = sub_100223E94();

  return v2;
}

- (_TtC7JournalP33_52B12D7015364A2A97B4965365E27BCB16CleanRTFTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for CleanRTFTextView();
  return -[CleanRTFTextView initWithFrame:textContainer:](&v10, "initWithFrame:textContainer:", a4, x, y, width, height);
}

- (_TtC7JournalP33_52B12D7015364A2A97B4965365E27BCB16CleanRTFTextView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CleanRTFTextView();
  return [(CleanRTFTextView *)&v5 initWithCoder:a3];
}

@end