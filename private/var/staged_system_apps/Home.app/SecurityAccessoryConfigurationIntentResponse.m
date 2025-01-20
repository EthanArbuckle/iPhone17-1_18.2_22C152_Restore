@interface SecurityAccessoryConfigurationIntentResponse
- (SecurityAccessoryConfigurationIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation SecurityAccessoryConfigurationIntentResponse

- (SecurityAccessoryConfigurationIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SecurityAccessoryConfigurationIntentResponse;
  v7 = [(SecurityAccessoryConfigurationIntentResponse *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_code = a3;
    [(SecurityAccessoryConfigurationIntentResponse *)v7 setUserActivity:v6];
  }

  return v8;
}

- (int64_t)code
{
  return self->_code;
}

- (void)setCode:(int64_t)a3
{
  self->_code = a3;
}

@end