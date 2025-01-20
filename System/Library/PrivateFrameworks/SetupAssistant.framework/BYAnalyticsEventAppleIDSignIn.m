@interface BYAnalyticsEventAppleIDSignIn
- (BYAnalyticsEventAppleIDSignIn)initWithAnalyticsManager:(id)a3 context:(unint64_t)a4;
- (NSDate)authenticationStartDate;
- (NSDate)completionDate;
- (NSDate)signInStartDate;
- (id)_eventPayload;
- (unint64_t)context;
- (void)markSignInCompleted;
- (void)markSignInStartedAfterAuthenticationCompleted;
- (void)setAuthenticationStartDate:(id)a3;
- (void)setCompletionDate:(id)a3;
- (void)setContext:(unint64_t)a3;
- (void)setSignInStartDate:(id)a3;
@end

@implementation BYAnalyticsEventAppleIDSignIn

- (BYAnalyticsEventAppleIDSignIn)initWithAnalyticsManager:(id)a3 context:(unint64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BYAnalyticsEventAppleIDSignIn;
  v7 = [(BYAnalyticsEventAppleIDSignIn *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_context = a4;
    v7->_authenticationStartDate = (NSDate *)(id)[MEMORY[0x1E4F1C9C8] date];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__BYAnalyticsEventAppleIDSignIn_initWithAnalyticsManager_context___block_invoke;
    v10[3] = &unk_1E5D2C910;
    v11 = v8;
    [v6 addEvent:@"com.apple.setupassistant.ios.appleid.signin.duration" withPayloadBlock:v10 persist:0];
  }
  return v8;
}

uint64_t __66__BYAnalyticsEventAppleIDSignIn_initWithAnalyticsManager_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _eventPayload];
}

- (void)markSignInStartedAfterAuthenticationCompleted
{
  self->_signInStartDate = (NSDate *)(id)[MEMORY[0x1E4F1C9C8] date];
}

- (void)markSignInCompleted
{
  v3 = [(BYAnalyticsEventAppleIDSignIn *)self signInStartDate];

  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"Attempted to mark sign-in as completed without completing authentication" reason:0 userInfo:0];
    objc_exception_throw(v4);
  }
  self->_completionDate = (NSDate *)(id)[MEMORY[0x1E4F1C9C8] date];
}

- (id)_eventPayload
{
  v20[4] = *MEMORY[0x1E4F143B8];
  v3 = [(BYAnalyticsEventAppleIDSignIn *)self completionDate];

  if (v3)
  {
    unint64_t v4 = [(BYAnalyticsEventAppleIDSignIn *)self context];
    if (v4 > 2) {
      v5 = 0;
    }
    else {
      v5 = off_1E5D2CD60[v4];
    }
    v7 = [(BYAnalyticsEventAppleIDSignIn *)self signInStartDate];
    v8 = [(BYAnalyticsEventAppleIDSignIn *)self authenticationStartDate];
    [v7 timeIntervalSinceDate:v8];
    double v10 = v9;

    v11 = [(BYAnalyticsEventAppleIDSignIn *)self completionDate];
    objc_super v12 = [(BYAnalyticsEventAppleIDSignIn *)self signInStartDate];
    [v11 timeIntervalSinceDate:v12];
    double v14 = v13;

    v19[0] = @"authenticateDuration";
    v15 = [NSNumber numberWithDouble:v10];
    v20[0] = v15;
    v19[1] = @"signInDuration";
    v16 = [NSNumber numberWithDouble:v14];
    v20[1] = v16;
    v19[2] = @"totalDuration";
    v17 = [NSNumber numberWithDouble:v10 + v14];
    v19[3] = @"context";
    v20[2] = v17;
    v20[3] = v5;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:4];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (NSDate)authenticationStartDate
{
  return self->_authenticationStartDate;
}

- (void)setAuthenticationStartDate:(id)a3
{
  self->_authenticationStartDate = (NSDate *)a3;
}

- (NSDate)signInStartDate
{
  return self->_signInStartDate;
}

- (void)setSignInStartDate:(id)a3
{
  self->_signInStartDate = (NSDate *)a3;
}

- (NSDate)completionDate
{
  return self->_completionDate;
}

- (void)setCompletionDate:(id)a3
{
  self->_completionDate = (NSDate *)a3;
}

@end