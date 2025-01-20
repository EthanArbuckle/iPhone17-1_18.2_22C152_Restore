@interface MNNavigationServiceCallback_DidEndNavigation
+ (BOOL)supportsSecureCoding;
+ (id)didEndNavigationWithReason:(unint64_t)a3;
- (MNNavigationServiceCallback_DidEndNavigation)initWithCoder:(id)a3;
- (unint64_t)reason;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setReason:(unint64_t)a3;
@end

@implementation MNNavigationServiceCallback_DidEndNavigation

+ (id)didEndNavigationWithReason:(unint64_t)a3
{
  v4 = objc_opt_new();
  [v4 setReason:a3];
  return v4;
}

- (unint64_t)type
{
  return 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (MNNavigationServiceCallback_DidEndNavigation)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MNNavigationServiceCallback_DidEndNavigation;
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