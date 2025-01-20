@interface PKVirtualCardEnrollmentResponse
+ (BOOL)jsonDataOptional;
- (PKVirtualCardEnrollmentResponse)initWithData:(id)a3;
@end

@implementation PKVirtualCardEnrollmentResponse

- (PKVirtualCardEnrollmentResponse)initWithData:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKVirtualCardEnrollmentResponse;
  return [(PKPaymentRewrapResponseBase *)&v4 initWithData:a3];
}

+ (BOOL)jsonDataOptional
{
  return 1;
}

@end