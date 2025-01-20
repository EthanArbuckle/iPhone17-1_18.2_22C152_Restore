@interface SiriPresentationActivationCancelReasonTransport
+ (BOOL)supportsSecureCoding;
- (NSNumber)transport;
- (SiriPresentationActivationCancelReasonTransport)initWithCoder:(id)a3;
- (SiriPresentationActivationCancelReasonTransport)initWithSiriPresentationActivationCancelReason:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)cancelReason;
- (void)encodeWithCoder:(id)a3;
- (void)setTransport:(id)a3;
@end

@implementation SiriPresentationActivationCancelReasonTransport

- (SiriPresentationActivationCancelReasonTransport)initWithSiriPresentationActivationCancelReason:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SiriPresentationActivationCancelReasonTransport;
  v4 = [(SiriPresentationActivationCancelReasonTransport *)&v7 init];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
    [(SiriPresentationActivationCancelReasonTransport *)v4 setTransport:v5];
  }
  return v4;
}

- (id)description
{
  v2 = NSString;
  v3 = [(SiriPresentationActivationCancelReasonTransport *)self transport];
  v4 = [v2 stringWithFormat:@"SiriPresentationActivationCancelReason:%@", v3];

  return v4;
}

- (unint64_t)cancelReason
{
  v2 = [(SiriPresentationActivationCancelReasonTransport *)self transport];
  unint64_t v3 = [v2 integerValue];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  unint64_t v5 = [(SiriPresentationActivationCancelReasonTransport *)self cancelReason];
  return (id)[v4 initWithSiriPresentationActivationCancelReason:v5];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SiriPresentationActivationCancelReasonTransport)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriPresentationActivationCancelReasonTransport;
  unint64_t v5 = [(SiriPresentationActivationCancelReasonTransport *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transport"];
    transport = v5->_transport;
    v5->_transport = (NSNumber *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SiriPresentationActivationCancelReasonTransport *)self transport];
  [v4 encodeObject:v5 forKey:@"transport"];
}

- (NSNumber)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
}

- (void).cxx_destruct
{
}

@end