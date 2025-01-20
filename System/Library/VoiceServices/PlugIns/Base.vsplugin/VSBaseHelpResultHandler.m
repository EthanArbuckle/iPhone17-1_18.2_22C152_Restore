@interface VSBaseHelpResultHandler
- (id)actionForRecognitionResult:(id)a3;
@end

@implementation VSBaseHelpResultHandler

- (id)actionForRecognitionResult:(id)a3
{
  if (MGGetBoolAnswer()) {
    CFStringRef v3 = @"HELP_STRING";
  }
  else {
    CFStringRef v3 = @"HELP_STRING_NO_TELEPHONY";
  }
  id v4 = [objc_alloc((Class)VSRecognitionSpeakAction) initWithSpokenFeedbackString:VSBaseLocalizedString(@"Help", (uint64_t)v3), 0 willTerminate];

  return v4;
}

@end