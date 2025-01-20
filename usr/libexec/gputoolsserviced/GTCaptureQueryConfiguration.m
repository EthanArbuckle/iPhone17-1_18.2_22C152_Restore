@interface GTCaptureQueryConfiguration
+ (BOOL)supportsSecureCoding;
- (GTCaptureQueryConfiguration)initWithCoder:(id)a3;
- (unint64_t)requestID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GTCaptureQueryConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTCaptureQueryConfiguration)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GTCaptureQueryConfiguration;
  v3 = [(GTCaptureRequest *)&v7 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)GTCaptureQueryConfiguration;
  [(GTCaptureRequest *)&v3 encodeWithCoder:a3];
}

- (unint64_t)requestID
{
  return self->_requestID;
}

@end