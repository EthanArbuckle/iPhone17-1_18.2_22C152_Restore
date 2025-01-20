@interface IntelligenceUI.PromptEntryView.PrivatePressGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)pressGestureRecognizer:(id)a3 shouldAllowPress:(id)a4;
- (_TtCCO5UIKit14IntelligenceUI15PromptEntryViewP33_75F9C46457AA903D9A8178C1F5C6F21037PrivatePressGestureRecognizerDelegate)init;
@end

@implementation IntelligenceUI.PromptEntryView.PrivatePressGestureRecognizerDelegate

- (BOOL)pressGestureRecognizer:(id)a3 shouldAllowPress:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (_TtCCO5UIKit14IntelligenceUI15PromptEntryViewP33_75F9C46457AA903D9A8178C1F5C6F21037PrivatePressGestureRecognizerDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(IntelligenceUI.PromptEntryView.PrivatePressGestureRecognizerDelegate *)&v3 init];
}

@end