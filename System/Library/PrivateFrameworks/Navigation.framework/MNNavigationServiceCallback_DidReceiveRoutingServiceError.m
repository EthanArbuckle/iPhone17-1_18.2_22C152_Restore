@interface MNNavigationServiceCallback_DidReceiveRoutingServiceError
+ (BOOL)supportsSecureCoding;
- (MNNavigationServiceCallback_DidReceiveRoutingServiceError)initWithCoder:(id)a3;
- (NSError)error;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setError:(id)a3;
@end

@implementation MNNavigationServiceCallback_DidReceiveRoutingServiceError

- (unint64_t)type
{
  return 3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (MNNavigationServiceCallback_DidReceiveRoutingServiceError)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MNNavigationServiceCallback_DidReceiveRoutingServiceError;
  v5 = [(MNNavigationServiceCallbackParameters *)&v14 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"_error"];
    error = v5->_error;
    v5->_error = (NSError *)v10;

    v12 = v5;
  }

  return v5;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end