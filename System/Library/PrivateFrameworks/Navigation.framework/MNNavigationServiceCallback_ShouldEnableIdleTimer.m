@interface MNNavigationServiceCallback_ShouldEnableIdleTimer
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldEnable;
- (MNNavigationServiceCallback_ShouldEnableIdleTimer)initWithCoder:(id)a3;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setShouldEnable:(BOOL)a3;
@end

@implementation MNNavigationServiceCallback_ShouldEnableIdleTimer

- (unint64_t)type
{
  return 14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MNNavigationServiceCallback_ShouldEnableIdleTimer;
  id v4 = a3;
  [(MNNavigationServiceCallbackParameters *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_shouldEnable, @"_shouldEnable", v5.receiver, v5.super_class);
}

- (MNNavigationServiceCallback_ShouldEnableIdleTimer)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MNNavigationServiceCallback_ShouldEnableIdleTimer;
  objc_super v5 = [(MNNavigationServiceCallbackParameters *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_shouldEnable = [v4 decodeBoolForKey:@"_shouldEnable"];
    v6 = v5;
  }

  return v5;
}

- (BOOL)shouldEnable
{
  return self->_shouldEnable;
}

- (void)setShouldEnable:(BOOL)a3
{
  self->_shouldEnable = a3;
}

@end