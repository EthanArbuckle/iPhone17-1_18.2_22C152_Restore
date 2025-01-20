@interface MNNavigationServiceCallback_WillEndNavigation
+ (BOOL)supportsSecureCoding;
+ (id)willEndNavigationWithReason:(unint64_t)a3;
- (MNNavigationServiceCallback_WillEndNavigation)initWithCoder:(id)a3;
- (unint64_t)reason;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setReason:(unint64_t)a3;
@end

@implementation MNNavigationServiceCallback_WillEndNavigation

+ (id)willEndNavigationWithReason:(unint64_t)a3
{
  v4 = objc_opt_new();
  [v4 setReason:a3];
  return v4;
}

- (unint64_t)type
{
  return 16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (MNNavigationServiceCallback_WillEndNavigation)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MNNavigationServiceCallback_WillEndNavigation;
  v5 = [(MNNavigationServiceCallbackParameters *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_reason = [v4 decodeIntegerForKey:@"_reason"];
    v6 = v5;
  }

  return v5;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

@end