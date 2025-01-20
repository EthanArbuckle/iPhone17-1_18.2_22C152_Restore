@interface PKShareRedemptionAnalyticsReporter
- (PKShareRedemptionAnalyticsReporter)init;
- (PKShareRedemptionAnalyticsReporter)initWithSessionToken:(id)a3;
- (int64_t)accessPassType;
- (void)_sendEventForPage:(unint64_t)a3 button:(unint64_t)a4 eventType:(id)a5 specifics:(id)a6;
- (void)sendAuthenticationEventForSuccess:(BOOL)a3 specifics:(id)a4;
- (void)sendEvent:(id)a3;
- (void)sendEventForPage:(unint64_t)a3 button:(unint64_t)a4 specifics:(id)a5;
- (void)sendEventForPage:(unint64_t)a3 error:(id)a4 specifics:(id)a5;
- (void)sendEventForPage:(unint64_t)a3 specifics:(id)a4;
- (void)setAccessPassType:(int64_t)a3;
@end

@implementation PKShareRedemptionAnalyticsReporter

- (PKShareRedemptionAnalyticsReporter)init
{
  return [(PKShareRedemptionAnalyticsReporter *)self initWithSessionToken:0];
}

- (PKShareRedemptionAnalyticsReporter)initWithSessionToken:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F87040];
  v6.receiver = self;
  v6.super_class = (Class)PKShareRedemptionAnalyticsReporter;
  return [(PKSharingAnalyticsReporter *)&v6 initWithSubject:v4 sessionToken:a3 reuseExistingSession:0];
}

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  [v4 setObject:@"access" forKeyedSubscript:*MEMORY[0x1E4F867E8]];
  [v4 setObject:@"access" forKeyedSubscript:*MEMORY[0x1E4F867D0]];
  unint64_t accessPassType = self->_accessPassType;
  if (accessPassType >= 7) {
    objc_super v6 = (__CFString *)(id)*MEMORY[0x1E4F86D78];
  }
  else {
    objc_super v6 = off_1E59CC090[accessPassType];
  }
  [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F867C8]];

  v7.receiver = self;
  v7.super_class = (Class)PKShareRedemptionAnalyticsReporter;
  [(PKSharingAnalyticsReporter *)&v7 sendEvent:v4];
}

- (void)sendEventForPage:(unint64_t)a3 specifics:(id)a4
{
}

- (void)sendEventForPage:(unint64_t)a3 error:(id)a4 specifics:(id)a5
{
  id v8 = a4;
  v9 = (void *)[a5 mutableCopy];
  v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v13 = v11;

  v12 = ErrorTypeFromError(v8);

  [v13 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F862F8]];
  [(PKShareRedemptionAnalyticsReporter *)self _sendEventForPage:a3 button:0 eventType:*MEMORY[0x1E4F864A0] specifics:v13];
}

- (void)sendEventForPage:(unint64_t)a3 button:(unint64_t)a4 specifics:(id)a5
{
}

- (void)sendAuthenticationEventForSuccess:(BOOL)a3 specifics:(id)a4
{
  BOOL v4 = a3;
  objc_super v6 = (void *)[a4 mutableCopy];
  objc_super v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v10 = v8;

  if (v4) {
    v9 = @"success";
  }
  else {
    v9 = @"failure";
  }
  [v10 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F86C50]];
  [(PKShareRedemptionAnalyticsReporter *)self _sendEventForPage:1 button:0 eventType:*MEMORY[0x1E4F863F0] specifics:v10];
}

- (void)_sendEventForPage:(unint64_t)a3 button:(unint64_t)a4 eventType:(id)a5 specifics:(id)a6
{
  id v10 = a5;
  id v11 = (void *)[a6 mutableCopy];
  v12 = v11;
  if (v11) {
    id v13 = v11;
  }
  else {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v20 = v13;

  [v20 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F86308]];
  uint64_t v14 = *MEMORY[0x1E4F86730];
  v15 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F86730]];

  if (v15) {
    BOOL v16 = 1;
  }
  else {
    BOOL v16 = a3 > 2;
  }
  if (!v16) {
    [v20 setObject:off_1E59CC0C8[a3] forKeyedSubscript:v14];
  }
  uint64_t v17 = *MEMORY[0x1E4F86120];
  v18 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F86120]];

  if (!v18)
  {
    if (a4 == 1)
    {
      v19 = (void *)MEMORY[0x1E4F86148];
    }
    else
    {
      if (a4 != 2) {
        goto LABEL_15;
      }
      v19 = (void *)MEMORY[0x1E4F861B8];
    }
    [v20 setObject:*v19 forKeyedSubscript:v17];
  }
LABEL_15:
  [(PKShareRedemptionAnalyticsReporter *)self sendEvent:v20];
}

- (int64_t)accessPassType
{
  return self->_accessPassType;
}

- (void)setAccessPassType:(int64_t)a3
{
  self->_unint64_t accessPassType = a3;
}

@end