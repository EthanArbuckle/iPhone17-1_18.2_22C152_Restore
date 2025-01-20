@interface SNTestFailure
- (NSString)message;
- (SNTestFailure)initWithMessage:(id)a3;
- (SNTestFailure)initWithMissingClass:(Class)a3;
@end

@implementation SNTestFailure

- (SNTestFailure)initWithMessage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNTestFailure;
  v6 = [(SNTestFailure *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_message, a3);
  }

  return v7;
}

- (SNTestFailure)initWithMissingClass:(Class)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SNTestFailure;
  v4 = [(SNTestFailure *)&v10 init];
  if (v4)
  {
    id v5 = NSString;
    v6 = NSStringFromClass(a3);
    uint64_t v7 = [v5 stringWithFormat:@"Failed to find expected instance of class '%@'", v6];
    message = v4->_message;
    v4->_message = (NSString *)v7;
  }
  return v4;
}

- (NSString)message
{
  return self->_message;
}

- (void).cxx_destruct
{
}

@end