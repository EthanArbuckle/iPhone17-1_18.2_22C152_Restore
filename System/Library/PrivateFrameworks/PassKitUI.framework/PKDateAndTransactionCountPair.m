@interface PKDateAndTransactionCountPair
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (unint64_t)hash;
- (unint64_t)transactionCount;
- (void)setDate:(id)a3;
- (void)setTransactionCount:(unint64_t)a3;
@end

@implementation PKDateAndTransactionCountPair

- (BOOL)isEqual:(id)a3
{
  v4 = (PKDateAndTransactionCountPair *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (PKEqualObjects()) {
      BOOL v7 = self->_transactionCount == v6->_transactionCount;
    }
    else {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (self->_date)
  {
    v4[0] = self->_date;
    v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
    PKCombinedHash();
  }
  else
  {
    PKCombinedHash();
  }
  return PKIntegerHash();
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (unint64_t)transactionCount
{
  return self->_transactionCount;
}

- (void)setTransactionCount:(unint64_t)a3
{
  self->_transactionCount = a3;
}

- (void).cxx_destruct
{
}

@end