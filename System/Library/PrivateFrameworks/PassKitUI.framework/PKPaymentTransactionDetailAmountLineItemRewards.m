@interface PKPaymentTransactionDetailAmountLineItemRewards
- (BOOL)hasTrailingLineSeperator;
- (BOOL)isEmphasized;
- (NSString)label;
- (NSString)value;
- (PKPaymentTransactionDetailAmountLineItemRewards)initWithRewardsValueUnit:(unint64_t)a3 eligibleValue:(id)a4 isEligible:(BOOL)a5 totalAmount:(id)a6 hasPromotionalReward:(BOOL)a7 promotionName:(id)a8;
- (unint64_t)lineItemType;
- (void)setHasTrailingLineSeperator:(BOOL)a3;
@end

@implementation PKPaymentTransactionDetailAmountLineItemRewards

- (PKPaymentTransactionDetailAmountLineItemRewards)initWithRewardsValueUnit:(unint64_t)a3 eligibleValue:(id)a4 isEligible:(BOOL)a5 totalAmount:(id)a6 hasPromotionalReward:(BOOL)a7 promotionName:(id)a8
{
  BOOL v10 = a5;
  id v13 = a4;
  id v14 = a6;
  id v15 = a8;
  v28.receiver = self;
  v28.super_class = (Class)PKPaymentTransactionDetailAmountLineItemRewards;
  v16 = [(PKPaymentTransactionDetailAmountLineItemRewards *)&v28 init];
  if (v16)
  {
    if (a3 && a3 != 2)
    {
      if (a3 != 1)
      {
        v22 = 0;
        goto LABEL_20;
      }
      PKRewardsCenterEnabled();
      v17 = PKFormattedStringMinimalFractionDigitsFromNumber();
      if (v10)
      {
        PKLocalizedFeatureString();
        v22 = (NSString *)objc_claimAutoreleasedReturnValue();

LABEL_20:
        uint64_t v21 = 0;
        goto LABEL_21;
      }
      id v27 = v17;
      PKLocalizedFeatureString();
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();

LABEL_18:
      uint64_t v21 = objc_msgSend(v14, "formattedStringValue", v27);
LABEL_21:
      label = v16->_label;
      v16->_label = v22;
      v24 = v22;

      value = v16->_value;
      v16->_value = (NSString *)v21;

      goto LABEL_22;
    }
    int v18 = PKRewardsCenterEnabled();
    if (v15) {
      int v19 = v18;
    }
    else {
      int v19 = 0;
    }
    if (v10)
    {
      if (v19) {
        goto LABEL_14;
      }
    }
    else if (v19)
    {
LABEL_14:
      id v27 = v15;
      uint64_t v20 = PKLocalizedFeatureString();
LABEL_17:
      v22 = (NSString *)v20;
      goto LABEL_18;
    }
    uint64_t v20 = PKLocalizedFeatureString();
    goto LABEL_17;
  }
LABEL_22:

  return v16;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)value
{
  return self->_value;
}

- (BOOL)isEmphasized
{
  return 0;
}

- (unint64_t)lineItemType
{
  return 4;
}

- (BOOL)hasTrailingLineSeperator
{
  return self->_hasTrailingLineSeperator;
}

- (void)setHasTrailingLineSeperator:(BOOL)a3
{
  self->_hasTrailingLineSeperator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end