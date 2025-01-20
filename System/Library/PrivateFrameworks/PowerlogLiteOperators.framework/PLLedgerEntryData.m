@interface PLLedgerEntryData
- (int64_t)balance;
- (int64_t)credit;
- (int64_t)debit;
- (void)setBalance:(int64_t)a3;
- (void)setCredit:(int64_t)a3;
- (void)setDebit:(int64_t)a3;
@end

@implementation PLLedgerEntryData

- (int64_t)credit
{
  return self->_credit;
}

- (void)setCredit:(int64_t)a3
{
  self->_credit = a3;
}

- (int64_t)debit
{
  return self->_debit;
}

- (void)setDebit:(int64_t)a3
{
  self->_debit = a3;
}

- (int64_t)balance
{
  return self->_balance;
}

- (void)setBalance:(int64_t)a3
{
  self->_balance = a3;
}

@end