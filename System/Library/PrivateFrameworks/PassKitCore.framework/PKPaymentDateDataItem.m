@interface PKPaymentDateDataItem
+ (int64_t)dataType;
- (BOOL)isValidWithError:(id *)a3;
- (NSDate)paymentDate;
- (NSTimeZone)paymentTimeZone;
- (PKPaymentDateDataItem)initWithModel:(id)a3;
- (int64_t)context;
- (int64_t)paymentFrequency;
- (void)setPaymentDate:(id)a3;
- (void)setPaymentFrequency:(int64_t)a3;
- (void)setPaymentTimeZone:(id)a3;
@end

@implementation PKPaymentDateDataItem

+ (int64_t)dataType
{
  return 10;
}

- (PKPaymentDateDataItem)initWithModel:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentDateDataItem;
  return [(PKPaymentDataItem *)&v4 initWithModel:a3];
}

- (int64_t)context
{
  return 1;
}

- (BOOL)isValidWithError:(id *)a3
{
  return 1;
}

- (NSDate)paymentDate
{
  return self->_paymentDate;
}

- (void)setPaymentDate:(id)a3
{
}

- (NSTimeZone)paymentTimeZone
{
  return self->_paymentTimeZone;
}

- (void)setPaymentTimeZone:(id)a3
{
}

- (int64_t)paymentFrequency
{
  return self->_paymentFrequency;
}

- (void)setPaymentFrequency:(int64_t)a3
{
  self->_paymentFrequency = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentTimeZone, 0);
  objc_storeStrong((id *)&self->_paymentDate, 0);
}

@end