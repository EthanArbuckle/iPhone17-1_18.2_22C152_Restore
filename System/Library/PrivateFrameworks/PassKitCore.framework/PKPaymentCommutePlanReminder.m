@interface PKPaymentCommutePlanReminder
+ (BOOL)supportsSecureCoding;
- (PKPaymentCommutePlanReminder)initWithCoder:(id)a3;
- (PKPaymentCommutePlanReminder)initWithTimeInterval:(double)a3;
- (double)timeInterval;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setTimeInterval:(double)a3;
@end

@implementation PKPaymentCommutePlanReminder

- (PKPaymentCommutePlanReminder)initWithTimeInterval:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentCommutePlanReminder;
  result = [(PKPaymentCommutePlanReminder *)&v5 init];
  if (result) {
    result->_timeInterval = a3;
  }
  return result;
}

- (PKPaymentCommutePlanReminder)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentCommutePlanReminder;
  objc_super v5 = [(PKPaymentCommutePlanReminder *)&v7 init];
  if (v5) {
    v5->_timeInterval = (double)[v4 decodeIntegerForKey:@"timeInterval"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; timeInterval: %f; >",
               objc_opt_class(),
               self,
               *(void *)&self->_timeInterval);
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (void)setTimeInterval:(double)a3
{
  self->_timeInterval = a3;
}

@end