@interface PKDashboardBankConnectItem
+ (NSDateFormatter)nextPaymentDateFormatter;
+ (id)dashboardBankConnectCreditCardItemFrom:(id)a3;
+ (id)dashboardBankConnectDebitCardItemFrom:(id)a3;
+ (id)formatAvailableBalance:(id)a3 for:(unint64_t)a4;
+ (id)formatBookedBalance:(id)a3 for:(unint64_t)a4;
+ (id)fromAccount:(id)a3;
+ (id)identifier;
+ (id)payBillActionFor:(id)a3;
+ (id)transferActionFor:(id)a3;
- (BOOL)hasMultipleBalances;
- (BOOL)isAccountEnabled;
- (BOOL)isAccountMismatched;
- (BOOL)isPaymentOverdue;
- (NSDate)asOfDate;
- (NSString)availableBalance;
- (NSString)balanceSubtitle;
- (NSString)balanceTitle;
- (NSString)bookedBalance;
- (NSString)creditLimit;
- (NSString)displayedBalance;
- (NSString)minimumCreditPayment;
- (NSString)paymentDueDate;
- (id)payBillAction;
- (id)transferAction;
- (unint64_t)accountType;
- (void)setAccountType:(unint64_t)a3;
- (void)setAsOfDate:(id)a3;
- (void)setAvailableBalance:(id)a3;
- (void)setBookedBalance:(id)a3;
- (void)setCreditLimit:(id)a3;
- (void)setHasMultipleBalances:(BOOL)a3;
- (void)setIsAccountEnabled:(BOOL)a3;
- (void)setIsAccountMismatched:(BOOL)a3;
- (void)setIsPaymentOverdue:(BOOL)a3;
- (void)setMinimumCreditPayment:(id)a3;
- (void)setPayBillAction:(id)a3;
- (void)setPaymentDueDate:(id)a3;
- (void)setTransferAction:(id)a3;
@end

@implementation PKDashboardBankConnectItem

+ (id)fromAccount:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, sel_accountType);
  if (v4 == (id)1)
  {
    id v5 = sub_19FCB62C0(v3);
    goto LABEL_5;
  }
  if (!v4)
  {
    id v5 = sub_19FCB5A7C(v3);
LABEL_5:
    v6 = v5;
    goto LABEL_7;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

+ (id)dashboardBankConnectDebitCardItemFrom:(id)a3
{
  id v3 = a3;
  id v4 = sub_19FCB5A7C(v3);

  return v4;
}

+ (id)transferActionFor:(id)a3
{
  return sub_19FCB4B18((uint64_t)a1, (uint64_t)a2, a3, (uint64_t (*)(void))sub_19FCB57B4, (uint64_t)&block_descriptor_6_1);
}

+ (id)dashboardBankConnectCreditCardItemFrom:(id)a3
{
  id v3 = a3;
  id v4 = sub_19FCB62C0(v3);

  return v4;
}

+ (id)payBillActionFor:(id)a3
{
  return sub_19FCB4B18((uint64_t)a1, (uint64_t)a2, a3, (uint64_t (*)(void))sub_19FCB5FF8, (uint64_t)&block_descriptor_160);
}

+ (NSDateFormatter)nextPaymentDateFormatter
{
  id v2 = sub_19FCB5DFC();

  return (NSDateFormatter *)v2;
}

+ (id)formatAvailableBalance:(id)a3 for:(unint64_t)a4
{
  return sub_19FCB4C34((uint64_t)a1, (uint64_t)a2, a3, a4, sub_19FCB4CC0);
}

+ (id)formatBookedBalance:(id)a3 for:(unint64_t)a4
{
  return sub_19FCB4C34((uint64_t)a1, (uint64_t)a2, a3, a4, sub_19FCB523C);
}

+ (id)identifier
{
  return @"bankConnectItem";
}

- (NSString)balanceTitle
{
  unint64_t v3 = [(PKDashboardBankConnectItem *)self accountType];
  if (v3 != 1)
  {
    if (v3) {
      goto LABEL_11;
    }
    id v4 = [(PKDashboardBankConnectItem *)self availableBalance];

    if (v4)
    {
      id v5 = @"BANK_CONNECT_DASHBOARD_ASSET_ACCOUNT_AVAILABLE_BALANCE_TITLE";
      goto LABEL_12;
    }
    v6 = [(PKDashboardBankConnectItem *)self bookedBalance];

    if (v6)
    {
      id v5 = @"BANK_CONNECT_DASHBOARD_ASSET_ACCOUNT_BOOKED_BALANCE_TITLE";
      goto LABEL_12;
    }
  }
  v7 = [(PKDashboardBankConnectItem *)self bookedBalance];

  if (v7)
  {
    id v5 = @"BANK_CONNECT_DASHBOARD_LIABILITY_ACCOUNT_BOOKED_BALANCE_TITLE";
    goto LABEL_12;
  }
  v8 = [(PKDashboardBankConnectItem *)self availableBalance];

  if (v8)
  {
    id v5 = @"BANK_CONNECT_DASHBOARD_LIABILITY_ACCOUNT_AVAILABLE_CREDIT_TITLE";
    goto LABEL_12;
  }
LABEL_11:
  id v5 = @"BANK_CONNECT_DASHBOARD_UNAVAILABLE_BALANCE_TITLE";
LABEL_12:
  v9 = PKLocalizedBankConnectString(&v5->isa);

  return (NSString *)v9;
}

- (NSString)displayedBalance
{
  unint64_t v3 = [(PKDashboardBankConnectItem *)self accountType];
  if (v3 == 1)
  {
    id v4 = [(PKDashboardBankConnectItem *)self bookedBalance];
    if (!v4)
    {
      uint64_t v5 = [(PKDashboardBankConnectItem *)self availableBalance];
LABEL_8:
      id v6 = (id)v5;
      if (v5) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
LABEL_6:
    id v6 = v4;

    goto LABEL_10;
  }
  if (!v3)
  {
    id v4 = [(PKDashboardBankConnectItem *)self availableBalance];
    if (!v4)
    {
      uint64_t v5 = [(PKDashboardBankConnectItem *)self bookedBalance];
      goto LABEL_8;
    }
    goto LABEL_6;
  }
LABEL_9:
  PKLocalizedBankConnectString(&cfstr_BankConnectDas_9.isa);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return (NSString *)v6;
}

- (NSString)balanceSubtitle
{
  if ([(PKDashboardBankConnectItem *)self accountType]
    && ([(PKDashboardBankConnectItem *)self bookedBalance],
        (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0)
    && (id v4 = (void *)v3,
        [(PKDashboardBankConnectItem *)self availableBalance],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    id v6 = [(PKDashboardBankConnectItem *)self availableBalance];
    v7 = PKLocalizedBankConnectString(&cfstr_BankConnectDas_10.isa, &stru_1EF1B4C70.isa, v6);
  }
  else
  {
    v7 = 0;
  }

  return (NSString *)v7;
}

- (unint64_t)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(unint64_t)a3
{
  self->_accountType = a3;
}

- (id)transferAction
{
  return self->_transferAction;
}

- (void)setTransferAction:(id)a3
{
}

- (id)payBillAction
{
  return self->_payBillAction;
}

- (void)setPayBillAction:(id)a3
{
}

- (NSString)availableBalance
{
  return self->_availableBalance;
}

- (void)setAvailableBalance:(id)a3
{
}

- (NSString)bookedBalance
{
  return self->_bookedBalance;
}

- (void)setBookedBalance:(id)a3
{
}

- (NSString)creditLimit
{
  return self->_creditLimit;
}

- (void)setCreditLimit:(id)a3
{
}

- (NSString)paymentDueDate
{
  return self->_paymentDueDate;
}

- (void)setPaymentDueDate:(id)a3
{
}

- (NSString)minimumCreditPayment
{
  return self->_minimumCreditPayment;
}

- (void)setMinimumCreditPayment:(id)a3
{
}

- (NSDate)asOfDate
{
  return self->_asOfDate;
}

- (void)setAsOfDate:(id)a3
{
}

- (BOOL)isPaymentOverdue
{
  return self->_isPaymentOverdue;
}

- (void)setIsPaymentOverdue:(BOOL)a3
{
  self->_isPaymentOverdue = a3;
}

- (BOOL)isAccountEnabled
{
  return self->_isAccountEnabled;
}

- (void)setIsAccountEnabled:(BOOL)a3
{
  self->_isAccountEnabled = a3;
}

- (BOOL)isAccountMismatched
{
  return self->_isAccountMismatched;
}

- (void)setIsAccountMismatched:(BOOL)a3
{
  self->_isAccountMismatched = a3;
}

- (BOOL)hasMultipleBalances
{
  return self->_hasMultipleBalances;
}

- (void)setHasMultipleBalances:(BOOL)a3
{
  self->_hasMultipleBalances = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asOfDate, 0);
  objc_storeStrong((id *)&self->_minimumCreditPayment, 0);
  objc_storeStrong((id *)&self->_paymentDueDate, 0);
  objc_storeStrong((id *)&self->_creditLimit, 0);
  objc_storeStrong((id *)&self->_bookedBalance, 0);
  objc_storeStrong((id *)&self->_availableBalance, 0);
  objc_storeStrong(&self->_payBillAction, 0);

  objc_storeStrong(&self->_transferAction, 0);
}

@end