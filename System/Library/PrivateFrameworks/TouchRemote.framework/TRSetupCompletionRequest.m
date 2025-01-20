@interface TRSetupCompletionRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)completedSuccessfully;
- (TRSetupCompletionRequest)initWithCoder:(id)a3;
- (id)description;
- (int64_t)errorCode;
- (void)encodeWithCoder:(id)a3;
- (void)setCompletedSuccessfully:(BOOL)a3;
- (void)setErrorCode:(int64_t)a3;
@end

@implementation TRSetupCompletionRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TRSetupCompletionRequest;
  [(TRMessage *)&v6 encodeWithCoder:v4];
  if (self->_completedSuccessfully) {
    [v4 encodeBool:1 forKey:@"cS"];
  }
  int64_t errorCode = self->_errorCode;
  if (errorCode) {
    [v4 encodeInteger:errorCode forKey:@"eC"];
  }
}

- (TRSetupCompletionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TRSetupCompletionRequest;
  v5 = [(TRMessage *)&v7 initWithCoder:v4];
  if (v5)
  {
    v5->_completedSuccessfully = [v4 decodeBoolForKey:@"cS"];
    v5->_int64_t errorCode = [v4 decodeIntegerForKey:@"eC"];
  }

  return v5;
}

- (id)description
{
  if (self->_completedSuccessfully) {
    v3 = @"YES";
  }
  else {
    v3 = @"NO";
  }
  id v4 = [NSString stringWithFormat:@"completedSuccessfully:%@ errorCode:%ld", v3, self->_errorCode];
  v5 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)TRSetupCompletionRequest;
  objc_super v6 = [(TRMessage *)&v9 description];
  objc_super v7 = [v5 stringWithFormat:@"%@ %@", v6, v4];

  return v7;
}

- (BOOL)completedSuccessfully
{
  return self->_completedSuccessfully;
}

- (void)setCompletedSuccessfully:(BOOL)a3
{
  self->_completedSuccessfully = a3;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_int64_t errorCode = a3;
}

@end