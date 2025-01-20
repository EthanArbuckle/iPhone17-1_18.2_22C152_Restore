@interface SiriAnalyticsError
- (NSString)message;
- (SiriAnalyticsError)init;
- (SiriAnalyticsError)initWithErrorType:(unint64_t)a3 message:(id)a4;
- (unint64_t)errorType;
@end

@implementation SiriAnalyticsError

- (void).cxx_destruct
{
}

- (NSString)message
{
  return self->_message;
}

- (unint64_t)errorType
{
  return self->_errorType;
}

- (SiriAnalyticsError)initWithErrorType:(unint64_t)a3 message:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = v7;
  if (v7)
  {
    v14 = @"message";
    v15[0] = v7;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  }
  else
  {
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)SiriAnalyticsError;
  v10 = [(SiriAnalyticsError *)&v13 initWithDomain:@"com.apple.siri.analytics" code:a3 userInfo:v9];
  v11 = v10;
  if (v10)
  {
    v10->_errorType = a3;
    objc_storeStrong((id *)&v10->_message, a4);
  }

  return v11;
}

- (SiriAnalyticsError)init
{
  return 0;
}

@end