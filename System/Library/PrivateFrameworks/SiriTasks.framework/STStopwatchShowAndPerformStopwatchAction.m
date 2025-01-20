@interface STStopwatchShowAndPerformStopwatchAction
+ (BOOL)supportsSecureCoding;
- (STStopwatchShowAndPerformStopwatchAction)initWithCoder:(id)a3;
- (id)_initWithAction:(unint64_t)a3;
- (unint64_t)action;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STStopwatchShowAndPerformStopwatchAction

- (STStopwatchShowAndPerformStopwatchAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STStopwatchShowAndPerformStopwatchAction;
  v5 = [(AFSiriRequest *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_action = [v4 decodeIntegerForKey:@"_action"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStopwatchShowAndPerformStopwatchAction;
  id v4 = a3;
  [(AFSiriRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_action, @"_action", v5.receiver, v5.super_class);
}

- (unint64_t)action
{
  return self->_action;
}

- (id)_initWithAction:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStopwatchShowAndPerformStopwatchAction;
  id result = [(AFSiriRequest *)&v5 init];
  if (result) {
    *((void *)result + 5) = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end