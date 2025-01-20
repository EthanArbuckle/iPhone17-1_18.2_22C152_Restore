@interface FCIntroductoryOffer
- (FCIntroductoryOffer)initWithOfferType:(int)a3 priceFormatted:(id)a4 recurringSubscriptionPeriod:(id)a5 numOfPeriods:(unint64_t)a6;
- (NSString)priceFormatted;
- (NSString)subscriptionPeriodInISO_8601;
- (int)offerType;
- (unint64_t)numOfPeriods;
- (void)setNumOfPeriods:(unint64_t)a3;
- (void)setOfferType:(int)a3;
- (void)setPriceFormatted:(id)a3;
- (void)setSubscriptionPeriodInISO_8601:(id)a3;
@end

@implementation FCIntroductoryOffer

- (FCIntroductoryOffer)initWithOfferType:(int)a3 priceFormatted:(id)a4 recurringSubscriptionPeriod:(id)a5 numOfPeriods:(unint64_t)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  if (!a3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v16 = (void *)[[NSString alloc] initWithFormat:@"Offer Type cannot be unknown. Must be a unsupported intro offer type."];
    *(_DWORD *)buf = 136315906;
    v21 = "-[FCIntroductoryOffer initWithOfferType:priceFormatted:recurringSubscriptionPeriod:numOfPeriods:]";
    __int16 v22 = 2080;
    v23 = "FCIntroductoryOffer.m";
    __int16 v24 = 1024;
    int v25 = 27;
    __int16 v26 = 2114;
    v27 = v16;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v11) {
      goto LABEL_6;
    }
  }
  else if (v11)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "priceFormatted");
    *(_DWORD *)buf = 136315906;
    v21 = "-[FCIntroductoryOffer initWithOfferType:priceFormatted:recurringSubscriptionPeriod:numOfPeriods:]";
    __int16 v22 = 2080;
    v23 = "FCIntroductoryOffer.m";
    __int16 v24 = 1024;
    int v25 = 28;
    __int16 v26 = 2114;
    v27 = v17;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  if (!v12 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "recurringSubscriptionPeriod");
    *(_DWORD *)buf = 136315906;
    v21 = "-[FCIntroductoryOffer initWithOfferType:priceFormatted:recurringSubscriptionPeriod:numOfPeriods:]";
    __int16 v22 = 2080;
    v23 = "FCIntroductoryOffer.m";
    __int16 v24 = 1024;
    int v25 = 29;
    __int16 v26 = 2114;
    v27 = v18;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v19.receiver = self;
  v19.super_class = (Class)FCIntroductoryOffer;
  v13 = [(FCIntroductoryOffer *)&v19 init];
  v14 = v13;
  if (v13)
  {
    v13->_offerType = a3;
    objc_storeStrong((id *)&v13->_priceFormatted, a4);
    v14->_numOfPeriods = a6;
    objc_storeStrong((id *)&v14->_subscriptionPeriodInISO_8601, a5);
  }

  return v14;
}

- (int)offerType
{
  return self->_offerType;
}

- (void)setOfferType:(int)a3
{
  self->_offerType = a3;
}

- (unint64_t)numOfPeriods
{
  return self->_numOfPeriods;
}

- (void)setNumOfPeriods:(unint64_t)a3
{
  self->_numOfPeriods = a3;
}

- (NSString)priceFormatted
{
  return self->_priceFormatted;
}

- (void)setPriceFormatted:(id)a3
{
}

- (NSString)subscriptionPeriodInISO_8601
{
  return self->_subscriptionPeriodInISO_8601;
}

- (void)setSubscriptionPeriodInISO_8601:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionPeriodInISO_8601, 0);
  objc_storeStrong((id *)&self->_priceFormatted, 0);
}

@end