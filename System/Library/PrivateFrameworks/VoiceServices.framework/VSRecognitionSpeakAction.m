@interface VSRecognitionSpeakAction
- (VSRecognitionSpeakAction)initWithSpokenFeedbackString:(id)a3 willTerminate:(BOOL)a4;
- (id)perform;
- (int)completionType;
@end

@implementation VSRecognitionSpeakAction

- (id)perform
{
  return 0;
}

- (int)completionType
{
  return *((unsigned char *)&self->super + 41) == 0;
}

- (VSRecognitionSpeakAction)initWithSpokenFeedbackString:(id)a3 willTerminate:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)VSRecognitionSpeakAction;
  v6 = [(VSRecognitionSpeakAction *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(VSRecognitionAction *)v6 setSpokenFeedbackString:a3];
    *((unsigned char *)&v7->super + 41) = a4;
  }
  return v7;
}

@end