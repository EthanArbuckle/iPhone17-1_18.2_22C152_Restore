@interface UINotificationFeedbackGenerator
+ (Class)_configurationClass;
- (double)_preparationTimeoutForStyle:(int64_t)a3;
- (id)_categoryForType:(int64_t)a3;
- (id)_stats_key;
- (void)_notificationOccurred:(int64_t)a3 atLocation:(CGPoint)a4;
- (void)_playEventType:(int64_t)a3 atLocation:(CGPoint)a4;
- (void)_playEventType:(void *)a3 senderID:(void *)a4 powerSourceID:(double)a5 atLocation:(double)a6;
- (void)_privateNotificationOccurred:(int64_t)a3;
- (void)_privateNotificationOccurred:(int64_t)a3 atLocation:(CGPoint)a4 powerSourceID:(id)a5;
- (void)_privateNotificationOccurred:(int64_t)a3 atLocation:(CGPoint)a4 senderID:(unint64_t)a5;
- (void)_stopEventType:(int64_t)a3;
- (void)notificationOccurred:(UINotificationFeedbackType)notificationType;
@end

@implementation UINotificationFeedbackGenerator

+ (Class)_configurationClass
{
  return (Class)objc_opt_class();
}

- (id)_categoryForType:(int64_t)a3
{
  if ((a3 | 2) == 0x3EA)
  {
    v4 = @"lock";
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (double)_preparationTimeoutForStyle:(int64_t)a3
{
  double result = 0.0;
  if (a3 != 2)
  {
    uint64_t v7 = v3;
    uint64_t v8 = v4;
    v6.receiver = self;
    v6.super_class = (Class)UINotificationFeedbackGenerator;
    [(UIFeedbackGenerator *)&v6 _preparationTimeoutForStyle:0.0];
  }
  return result;
}

- (void)_playEventType:(void *)a3 senderID:(void *)a4 powerSourceID:(double)a5 atLocation:(double)a6
{
  id v18 = a4;
  if (a1)
  {
    [a1 _clientDidUpdateGeneratorWithSelector:sel__playEventType_senderID_powerSourceID_atLocation_];
    v11 = [a1 _eventConfiguration];
    v12 = [v11 feedbacks];
    v13 = [NSNumber numberWithInteger:a2];
    v14 = [v12 objectForKeyedSubscript:v13];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v18) {
        id v15 = v18;
      }
      else {
        id v15 = a3;
      }
      v16 = [v14 completeFeedbackPatternWithSenderID:v15];

      v17 = [a1 _categoryForType:a2];
      [v16 _setCategory:v17];

      objc_msgSend(a1, "_playFeedback:atLocation:", v16, a5, a6);
      v14 = v16;
    }
  }
}

- (void)_playEventType:(int64_t)a3 atLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  [(UIFeedbackGenerator *)self _clientDidUpdateGeneratorWithSelector:a2];
  uint64_t v8 = [(UINotificationFeedbackGenerator *)self _eventConfiguration];
  v9 = [v8 feedbacks];
  v10 = [NSNumber numberWithInteger:a3];
  id v12 = [v9 objectForKeyedSubscript:v10];

  v11 = [(UINotificationFeedbackGenerator *)self _categoryForType:a3];
  [v12 _setCategory:v11];

  -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v12, x, y);
}

- (void)_stopEventType:(int64_t)a3
{
  v5 = [(UINotificationFeedbackGenerator *)self _eventConfiguration];
  objc_super v6 = [v5 feedbacks];
  uint64_t v7 = [NSNumber numberWithInteger:a3];
  id v8 = [v6 objectForKeyedSubscript:v7];

  [(UIFeedbackGenerator *)self _stopFeedback:v8];
}

- (void)notificationOccurred:(UINotificationFeedbackType)notificationType
{
}

- (void)_notificationOccurred:(int64_t)a3 atLocation:(CGPoint)a4
{
}

- (void)_privateNotificationOccurred:(int64_t)a3
{
}

- (void)_privateNotificationOccurred:(int64_t)a3 atLocation:(CGPoint)a4 senderID:(unint64_t)a5
{
}

- (void)_privateNotificationOccurred:(int64_t)a3 atLocation:(CGPoint)a4 powerSourceID:(id)a5
{
}

- (id)_stats_key
{
  return @"notification";
}

@end