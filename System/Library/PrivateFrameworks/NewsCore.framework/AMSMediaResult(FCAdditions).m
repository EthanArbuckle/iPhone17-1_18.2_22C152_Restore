@interface AMSMediaResult(FCAdditions)
- (id)fc_appAdamID;
- (id)fc_bundleID;
- (id)fc_externalVersionID;
- (id)fc_introductoryOffers;
- (id)fc_offerName;
- (id)fc_subscriptionPeriodInISO_8601;
- (uint64_t)isPeriodValid:()FCAdditions;
@end

@implementation AMSMediaResult(FCAdditions)

- (uint64_t)isPeriodValid:()FCAdditions
{
  id v3 = a3;
  v4 = v3;
  if (v3 && [v3 hasPrefix:@"P"])
  {
    v5 = objc_msgSend(v4, "substringWithRange:", 1, objc_msgSend(v4, "length") - 1);
    if ([v5 length])
    {
      uint64_t v6 = 0;
      while (1)
      {
        unsigned int v7 = [v5 characterAtIndex:v6] - 68;
        if (v7 < 0x16 && ((0x298211u >> v7) & 1) != 0) {
          break;
        }
        if ([v5 length] <= (unint64_t)++v6) {
          goto LABEL_8;
        }
      }
      uint64_t v8 = (0x280201u >> v7) & 1;
    }
    else
    {
LABEL_8:
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)fc_subscriptionPeriodInISO_8601
{
  v2 = [a1 responseDataItems];
  id v3 = [v2 firstObject];

  objc_opt_class();
  v4 = [v3 objectForKey:@"attributes"];
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  unsigned int v7 = [v6 objectForKey:@"offers"];
  uint64_t v8 = [v7 firstObject];
  objc_opt_class();
  v9 = [v8 objectForKey:@"recurringSubscriptionPeriod"];
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  id v11 = v10;

  if (!v11)
  {
    objc_opt_class();
    v12 = [v6 objectForKey:@"recurringSubscriptionPeriod"];
    if (v12)
    {
      if (objc_opt_isKindOfClass()) {
        v13 = v12;
      }
      else {
        v13 = 0;
      }
    }
    else
    {
      v13 = 0;
    }
    id v11 = v13;
  }
  if ([a1 isPeriodValid:v11]) {
    v14 = v11;
  }
  else {
    v14 = 0;
  }
  id v15 = v14;

  return v15;
}

- (id)fc_offerName
{
  v1 = [a1 responseDataItems];
  v2 = [v1 firstObject];

  objc_opt_class();
  id v3 = [v2 objectForKey:@"attributes"];
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;

  objc_opt_class();
  id v6 = [v5 objectForKey:@"offerName"];
  unsigned int v7 = v6;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v7;
    }
    else {
      id v6 = 0;
    }
  }
  id v8 = v6;

  return v8;
}

- (id)fc_introductoryOffers
{
  v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = [a1 responseDataItems];
  v4 = [v3 firstObject];

  objc_opt_class();
  v30 = v4;
  id v5 = [v4 objectForKey:@"attributes"];
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  v29 = v7;
  id v8 = [v7 objectForKey:@"offers"];
  v9 = [v8 firstObject];
  objc_opt_class();
  v10 = [v9 objectForKey:@"discounts"];
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }
  id v12 = v11;

  v13 = [v12 firstObject];
  objc_opt_class();
  v14 = [v13 objectForKey:@"priceFormatted"];
  if (v14)
  {
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }
  id v16 = v15;

  objc_opt_class();
  v17 = [v13 objectForKey:@"recurringSubscriptionPeriod"];
  if (v17)
  {
    if (objc_opt_isKindOfClass()) {
      v18 = v17;
    }
    else {
      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
  }
  id v19 = v18;

  objc_opt_class();
  v20 = [v13 objectForKey:@"numOfPeriods"];
  if (v20)
  {
    if (objc_opt_isKindOfClass()) {
      v21 = v20;
    }
    else {
      v21 = 0;
    }
  }
  else
  {
    v21 = 0;
  }
  id v22 = v21;

  objc_opt_class();
  v23 = [v13 objectForKey:@"modeType"];
  if (v23)
  {
    if (objc_opt_isKindOfClass()) {
      v24 = v23;
    }
    else {
      v24 = 0;
    }
  }
  else
  {
    v24 = 0;
  }
  id v25 = v24;

  if ([v25 isEqualToString:@"PayAsYouGo"])
  {
    uint64_t v26 = 1;
  }
  else if ([v25 isEqualToString:@"PayUpFront"])
  {
    uint64_t v26 = 2;
  }
  else
  {
    if (![v25 isEqualToString:@"FreeTrial"]) {
      goto LABEL_38;
    }
    uint64_t v26 = 3;
  }
  v27 = -[FCIntroductoryOffer initWithOfferType:priceFormatted:recurringSubscriptionPeriod:numOfPeriods:]([FCIntroductoryOffer alloc], "initWithOfferType:priceFormatted:recurringSubscriptionPeriod:numOfPeriods:", v26, v16, v19, [v22 unsignedIntegerValue]);
  [v2 addObject:v27];

LABEL_38:
  return v2;
}

- (id)fc_appAdamID
{
  v1 = [a1 responseDataItems];
  v2 = [v1 firstObject];

  objc_opt_class();
  id v3 = [v2 objectForKey:@"relationships"];
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;

  objc_opt_class();
  id v6 = [v5 objectForKey:@"app"];
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  objc_opt_class();
  v9 = [v8 objectForKey:@"data"];
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  id v11 = v10;

  objc_opt_class();
  id v12 = [v11 firstObject];
  v13 = [v12 objectForKey:@"id"];
  if (v13)
  {
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }
  id v15 = v14;

  if (v15)
  {
    id v16 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v15, "intValue"));
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (id)fc_externalVersionID
{
  v1 = [a1 responseDataItems];
  v2 = [v1 firstObject];

  objc_opt_class();
  id v3 = [v2 objectForKeyedSubscript:@"attributes"];
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;

  objc_opt_class();
  id v6 = [v5 objectForKeyedSubscript:@"platformAttributes"];
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  objc_opt_class();
  v9 = [v8 objectForKeyedSubscript:@"ios"];
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  id v11 = v10;

  objc_opt_class();
  id v12 = [v11 objectForKeyedSubscript:@"externalVersionId"];
  if (v12)
  {
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }
  id v14 = v13;

  return v14;
}

- (id)fc_bundleID
{
  v1 = [a1 responseDataItems];
  v2 = [v1 firstObject];

  objc_opt_class();
  id v3 = [v2 objectForKeyedSubscript:@"attributes"];
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;

  objc_opt_class();
  id v6 = [v5 objectForKeyedSubscript:@"platformAttributes"];
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  objc_opt_class();
  v9 = [v8 objectForKeyedSubscript:@"ios"];
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  id v11 = v10;

  objc_opt_class();
  id v12 = [v11 objectForKey:@"bundleId"];
  if (v12)
  {
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }
  id v14 = v13;

  return v14;
}

@end