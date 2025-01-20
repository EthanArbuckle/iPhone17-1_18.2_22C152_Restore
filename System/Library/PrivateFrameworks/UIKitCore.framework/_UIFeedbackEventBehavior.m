@interface _UIFeedbackEventBehavior
+ (void)_privateEventOccurred:(int64_t)a3;
+ (void)eventOccurred:(int64_t)a3;
- (void)_activateAndPlayEvent:(int64_t)a3;
- (void)_privateEventOccurred:(int64_t)a3;
- (void)eventOccurred:(int64_t)a3;
@end

@implementation _UIFeedbackEventBehavior

+ (void)eventOccurred:(int64_t)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42___UIFeedbackEventBehavior_eventOccurred___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB25CBD0 != -1) {
    dispatch_once(&qword_1EB25CBD0, block);
  }
  [(id)qword_1EB25CBC8 _activateAndPlayEvent:a3];
}

+ (void)_privateEventOccurred:(int64_t)a3
{
  id v4 = objc_alloc((Class)a1);
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v6 = [NSNumber numberWithInteger:a3];
  v7 = [v5 setWithObject:v6];
  v8 = +[_UINotificationFeedbackGeneratorConfiguration privateConfigurationForTypes:v7];
  id v9 = (id)[v4 initWithConfiguration:v8];

  [v9 _activateAndPlayEvent:a3];
}

- (void)_activateAndPlayEvent:(int64_t)a3
{
  if (pthread_main_np() == 1)
  {
    -[UINotificationFeedbackGenerator _playEventType:atLocation:](self, "_playEventType:atLocation:", a3, 1.79769313e308, 1.79769313e308);
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __50___UIFeedbackEventBehavior__activateAndPlayEvent___block_invoke;
    v5[3] = &unk_1E52D9CD0;
    v5[4] = self;
    v5[5] = a3;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

- (void)eventOccurred:(int64_t)a3
{
}

- (void)_privateEventOccurred:(int64_t)a3
{
}

@end