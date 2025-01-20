@interface TUIAnalyticsSession
+ (id)currentInputModeIdentifier;
+ (id)preferredEventName:(id)a3;
- (BOOL)isSessionActive;
- (void)beginSession;
- (void)dealloc;
- (void)endSession;
@end

@implementation TUIAnalyticsSession

- (BOOL)isSessionActive
{
  return self->_sessionActive;
}

- (void)dealloc
{
  [(TUIAnalyticsSession *)self endSession];
  v3.receiver = self;
  v3.super_class = (Class)TUIAnalyticsSession;
  [(TUIAnalyticsSession *)&v3 dealloc];
}

- (void)endSession
{
  self->_sessionActive = 0;
}

- (void)beginSession
{
  self->_sessionActive = 1;
}

+ (id)currentInputModeIdentifier
{
  v2 = [MEMORY[0x1E4FB1910] sharedInputModeController];
  objc_super v3 = [v2 currentInputMode];
  v4 = [v3 identifierWithLayouts];

  return v4;
}

+ (id)preferredEventName:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && [v3 length])
  {
    v5 = [NSString stringWithFormat:@"%@.%@", @"UIKBAnalytics", v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end