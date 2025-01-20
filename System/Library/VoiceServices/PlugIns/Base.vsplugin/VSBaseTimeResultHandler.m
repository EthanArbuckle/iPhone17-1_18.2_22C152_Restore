@interface VSBaseTimeResultHandler
- (id)actionForRecognitionResult:(id)a3;
@end

@implementation VSBaseTimeResultHandler

- (id)actionForRecognitionResult:(id)a3
{
  v3 = +[NSDate date];
  id v4 = objc_alloc_init((Class)NSDateFormatter);
  [v4 setTimeStyle:1];
  [v4 setDateStyle:0];
  id v5 = [v4 stringFromDate:v3];
  id v6 = VSBaseLocalizedString(@"Time", @"TIME_STRING");
  if (v6) {
    id v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", v6, v5);
  }
  else {
    id v7 = v5;
  }
  v8 = v7;

  id v9 = [objc_alloc((Class)VSRecognitionSpeakAction) initWithSpokenFeedbackString:v8 willTerminate:1];

  return v9;
}

@end