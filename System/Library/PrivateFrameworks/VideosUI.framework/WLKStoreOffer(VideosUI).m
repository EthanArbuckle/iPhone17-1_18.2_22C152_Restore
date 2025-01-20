@interface WLKStoreOffer(VideosUI)
- (id)_localize:()VideosUI token:value:;
- (id)vui_subscriptionOfferButtonText;
- (id)vui_subscriptionOfferDisclaimerText;
@end

@implementation WLKStoreOffer(VideosUI)

- (id)vui_subscriptionOfferButtonText
{
  v2 = [a1 dictionary];
  v3 = objc_msgSend(v2, "vui_stringForKey:", @"ctaCopy");

  if ([v3 length])
  {
    id v4 = v3;
    goto LABEL_24;
  }
  if ([a1 offerType] != 4)
  {
    id v4 = 0;
    goto LABEL_24;
  }
  v5 = [a1 title];
  v6 = +[VUILocalizationManager sharedInstance];
  v7 = [v6 localizedStringForKey:@"TV.Button.SubscribeChannel"];

  id v4 = [a1 _localize:v7 token:@"channelName" value:v5];
  uint64_t v8 = [a1 subscriptionType];
  if (v8 == 3)
  {
    v12 = [a1 introOfferPeriod];
    v10 = v12;
    if (v12)
    {
      v13 = [v12 type];
      uint64_t v14 = *MEMORY[0x1E4FB52C8];
      if ([v13 isEqual:*MEMORY[0x1E4FB52C8]])
      {
        v15 = [v10 duration];
        int v16 = [v15 isEqualToNumber:&unk_1F3F3D130];
      }
      else
      {
        int v16 = 0;
      }

      v17 = [v10 duration];
      uint64_t v18 = [v17 integerValue];

      v19 = [v10 type];
      char v20 = [v19 isEqual:*MEMORY[0x1E4FB52D0]];

      if ((v20 & 1) != 0 || v16)
      {
        v25 = +[VUILocalizationManager sharedInstance];
        uint64_t v24 = [v25 localizedStringForKey:@"TV.Button.FreeYears"];

        if (v16) {
          uint64_t v26 = 1;
        }
        else {
          uint64_t v26 = v18;
        }
        objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v24, @"%d", 0, v26);
        goto LABEL_20;
      }
      v21 = [v10 type];
      int v22 = [v21 isEqual:v14];

      if (v22)
      {
        v23 = +[VUILocalizationManager sharedInstance];
        uint64_t v24 = [v23 localizedStringForKey:@"TV.Button.FreeMonths"];

        objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v24, @"%d", 0, v18);
        uint64_t v11 = LABEL_20:;

        id v4 = (id)v24;
        goto LABEL_21;
      }
    }
LABEL_22:

    goto LABEL_23;
  }
  if (v8 == 2)
  {
    v9 = +[VUILocalizationManager sharedInstance];
    v10 = [v9 localizedStringForKey:@"TV.Button.SubscribeChannelFree"];

    uint64_t v11 = [a1 _localize:v10 token:@"channelName" value:v5];
LABEL_21:

    id v4 = (id)v11;
    goto LABEL_22;
  }
LABEL_23:

LABEL_24:
  return v4;
}

- (id)vui_subscriptionOfferDisclaimerText
{
  v2 = [a1 dictionary];
  v3 = objc_msgSend(v2, "vui_stringForKey:", @"legalLine");

  if ([v3 length])
  {
    id v4 = v3;
    goto LABEL_27;
  }
  v5 = [a1 renewalPeriod];
  if ([a1 specialOfferEligible])
  {
    v6 = [a1 freeTrialPeriod];
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [a1 introOfferPeriod];
    }
    v9 = v8;

    v10 = [v9 type];
    uint64_t v11 = [v5 type];
    v12 = (void *)v11;
    id v4 = 0;
    if (v10 && v11)
    {
      v13 = [v9 duration];
      uint64_t v14 = [v13 integerValue];

      v15 = [v9 type];
      int v16 = [v15 isEqual:*MEMORY[0x1E4FB52D0]];

      if (v16)
      {
        v17 = [v9 duration];
        uint64_t v14 = 12 * [v17 integerValue];

        id v18 = (id)*MEMORY[0x1E4FB52C8];
        v10 = v18;
      }
      if (_FreeTrialLocMap_onceToken != -1) {
        dispatch_once(&_FreeTrialLocMap_onceToken, &__block_literal_global_88);
      }
      v19 = NSString;
      id v20 = (id)_FreeTrialLocMap___freeMap;
      v33 = v12;
      v21 = [v19 stringWithFormat:@"%@_%@", v10, v12];
      int v22 = [v20 objectForKey:v21];

      if (v22)
      {
        v23 = +[VUILocalizationManager sharedInstance];
        uint64_t v24 = [v23 localizedStringForKey:v22];

        v25 = objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v24, @"%d", 0, v14);
        uint64_t v26 = [a1 formattedPrice];
        id v4 = [a1 _localize:v25 token:@"price" value:v26];
      }
      else
      {
        id v4 = 0;
      }

      v12 = v33;
    }

    if (v4) {
      goto LABEL_26;
    }
  }
  else
  {
    id v4 = 0;
  }
  if (v5)
  {
    v27 = [v5 type];
    if (_PaidSubscriptionLocMap_onceToken != -1) {
      dispatch_once(&_PaidSubscriptionLocMap_onceToken, &__block_literal_global_66);
    }
    v28 = [(id)_PaidSubscriptionLocMap___paidMap objectForKey:v27];
    if (v28)
    {
      v29 = +[VUILocalizationManager sharedInstance];
      v30 = [v29 localizedStringForKey:v28];

      v31 = [a1 formattedPrice];
      id v4 = [a1 _localize:v30 token:@"price" value:v31];
    }
    else
    {
      id v4 = 0;
    }
  }
LABEL_26:

LABEL_27:
  return v4;
}

- (id)_localize:()VideosUI token:value:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (v7 && v8 && v9)
  {
    uint64_t v11 = [NSString stringWithFormat:@"@@%@@@", v8];
    v12 = [v7 stringByReplacingOccurrencesOfString:v11 withString:v10];
  }
  else
  {
    v13 = VUIDefaultLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v16 = v7;
      __int16 v17 = 2112;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "WLKStoreOffer+VideosUI - Invalid localization input: string:%@ token:%@ value:%@", buf, 0x20u);
    }

    v12 = 0;
  }

  return v12;
}

@end