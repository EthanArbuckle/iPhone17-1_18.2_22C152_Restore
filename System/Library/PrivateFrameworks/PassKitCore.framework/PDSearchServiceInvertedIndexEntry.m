@interface PDSearchServiceInvertedIndexEntry
- (NSDate)date;
- (NSDecimalNumber)rewardsValue;
- (PKPaymentTransactionTag)tag;
- (int64_t)category;
- (int64_t)peerPaymentSubType;
- (int64_t)transactionStatus;
- (int64_t)transactionType;
- (unint64_t)rewardsValueUnit;
- (unint64_t)transactionSource;
- (unint64_t)type;
- (void)setCategory:(int64_t)a3;
- (void)setDate:(id)a3;
- (void)setPeerPaymentSubType:(int64_t)a3;
- (void)setRewardsValue:(id)a3;
- (void)setRewardsValueUnit:(unint64_t)a3;
- (void)setTag:(id)a3;
- (void)setTransactionSource:(unint64_t)a3;
- (void)setTransactionStatus:(int64_t)a3;
- (void)setTransactionType:(int64_t)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PDSearchServiceInvertedIndexEntry

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (int64_t)category
{
  return self->_category;
}

- (void)setCategory:(int64_t)a3
{
  self->_category = a3;
}

- (int64_t)transactionType
{
  return self->_transactionType;
}

- (void)setTransactionType:(int64_t)a3
{
  self->_transactionType = a3;
}

- (int64_t)transactionStatus
{
  return self->_transactionStatus;
}

- (void)setTransactionStatus:(int64_t)a3
{
  self->_transactionStatus = a3;
}

- (unint64_t)transactionSource
{
  return self->_transactionSource;
}

- (void)setTransactionSource:(unint64_t)a3
{
  self->_transactionSource = a3;
}

- (int64_t)peerPaymentSubType
{
  return self->_peerPaymentSubType;
}

- (void)setPeerPaymentSubType:(int64_t)a3
{
  self->_peerPaymentSubType = a3;
}

- (unint64_t)rewardsValueUnit
{
  return self->_rewardsValueUnit;
}

- (void)setRewardsValueUnit:(unint64_t)a3
{
  self->_rewardsValueUnit = a3;
}

- (NSDecimalNumber)rewardsValue
{
  return self->_rewardsValue;
}

- (void)setRewardsValue:(id)a3
{
}

- (PKPaymentTransactionTag)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_rewardsValue, 0);
}

@end