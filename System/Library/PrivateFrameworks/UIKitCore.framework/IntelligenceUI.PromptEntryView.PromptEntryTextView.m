@interface IntelligenceUI.PromptEntryView.PromptEntryTextView
- (BOOL)_supportsWritingTools;
- (_TtCCO5UIKit14IntelligenceUI15PromptEntryViewP33_75F9C46457AA903D9A8178C1F5C6F21019PromptEntryTextView)initWithCoder:(id)a3;
- (_TtCCO5UIKit14IntelligenceUI15PromptEntryViewP33_75F9C46457AA903D9A8178C1F5C6F21019PromptEntryTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
@end

@implementation IntelligenceUI.PromptEntryView.PromptEntryTextView

- (BOOL)_supportsWritingTools
{
  return 0;
}

- (_TtCCO5UIKit14IntelligenceUI15PromptEntryViewP33_75F9C46457AA903D9A8178C1F5C6F21019PromptEntryTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)_s15PromptEntryViewC19PromptEntryTextViewCMa();
  return -[UITextView initWithFrame:textContainer:](&v10, sel_initWithFrame_textContainer_, a4, x, y, width, height);
}

- (_TtCCO5UIKit14IntelligenceUI15PromptEntryViewP33_75F9C46457AA903D9A8178C1F5C6F21019PromptEntryTextView)initWithCoder:(id)a3
{
  return (_TtCCO5UIKit14IntelligenceUI15PromptEntryViewP33_75F9C46457AA903D9A8178C1F5C6F21019PromptEntryTextView *)sub_185AAF814(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))_s15PromptEntryViewC19PromptEntryTextViewCMa);
}

@end