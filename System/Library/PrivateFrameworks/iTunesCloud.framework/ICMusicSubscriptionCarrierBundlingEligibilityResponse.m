@interface ICMusicSubscriptionCarrierBundlingEligibilityResponse
- (BOOL)isFamilySubscription;
- (BOOL)needsHeaderEnrichment;
- (BOOL)needsSilentSMS;
- (BOOL)wantsDelayedRetry;
- (ICMusicSubscriptionCarrierBundlingEligibilityResponse)initWithEligibilityDictionary:(id)a3 cellularProviderName:(id)a4 phoneNumber:(id)a5;
- (NSError)error;
- (NSString)SMSSessionIdentifier;
- (NSString)cellularProviderName;
- (NSString)headerEnrichmentMessage;
- (NSString)headerEnrichmentSessionIdentifier;
- (NSString)phoneNumber;
- (NSString)silentSMSMessage;
- (NSString)silentSMSNumber;
- (NSURL)headerEnrichmentURL;
- (double)delayInterval;
- (int64_t)carrierBundlingStatusType;
@end

@implementation ICMusicSubscriptionCarrierBundlingEligibilityResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_cellularProviderName, 0);
  objc_storeStrong((id *)&self->_silentSMSNumber, 0);
  objc_storeStrong((id *)&self->_silentSMSMessage, 0);
  objc_storeStrong((id *)&self->_headerEnrichmentURL, 0);
  objc_storeStrong((id *)&self->_headerEnrichmentSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_headerEnrichmentMessage, 0);
  objc_storeStrong((id *)&self->_SMSSessionIdentifier, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (NSString)cellularProviderName
{
  return self->_cellularProviderName;
}

- (NSString)silentSMSNumber
{
  return self->_silentSMSNumber;
}

- (NSString)silentSMSMessage
{
  return self->_silentSMSMessage;
}

- (BOOL)needsSilentSMS
{
  return self->_needsSilentSMS;
}

- (BOOL)needsHeaderEnrichment
{
  return self->_needsHeaderEnrichment;
}

- (NSURL)headerEnrichmentURL
{
  return self->_headerEnrichmentURL;
}

- (NSString)headerEnrichmentSessionIdentifier
{
  return self->_headerEnrichmentSessionIdentifier;
}

- (NSString)headerEnrichmentMessage
{
  return self->_headerEnrichmentMessage;
}

- (BOOL)wantsDelayedRetry
{
  return self->_wantsDelayedRetry;
}

- (double)delayInterval
{
  return self->_delayInterval;
}

- (NSString)SMSSessionIdentifier
{
  return self->_SMSSessionIdentifier;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)isFamilySubscription
{
  return self->_familySubscription;
}

- (int64_t)carrierBundlingStatusType
{
  return self->_carrierBundlingStatusType;
}

- (ICMusicSubscriptionCarrierBundlingEligibilityResponse)initWithEligibilityDictionary:(id)a3 cellularProviderName:(id)a4 phoneNumber:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v61.receiver = self;
  v61.super_class = (Class)ICMusicSubscriptionCarrierBundlingEligibilityResponse;
  v11 = [(ICMusicSubscriptionCarrierBundlingEligibilityResponse *)&v61 init];
  if (!v11) {
    goto LABEL_55;
  }
  uint64_t v12 = [v8 objectForKey:@"failureType"];
  v13 = [v8 objectForKey:@"status"];
  uint64_t v14 = [v8 objectForKey:@"errorCode"];
  v55 = (void *)v14;
  v56 = v13;
  v58 = v10;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v13 integerValue])
  {
    v15 = &ICStoreServerErrorDomain;
  }
  else if (objc_opt_respondsToSelector())
  {
    v15 = &ICStoreServerErrorDomain;
    v13 = (void *)v12;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v17 = 0;
      goto LABEL_12;
    }
    v15 = &ICMusicSubscriptionCarrierBundlingServerErrorDomain;
    v13 = (void *)v14;
  }
  id v16 = v13;
  v17 = *v15;
  if (!v16)
  {
LABEL_12:
    id v16 = [v8 objectForKey:@"fuseCarrierBundleStatus"];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v21 = [v16 integerValue];
    }
    else
    {
      v59 = v17;
      v22 = [v8 objectForKey:@"checkBack"];
      v23 = [v8 objectForKey:@"startFuseHeaderEnrichment"];
      v24 = [v8 objectForKey:@"startFuseManualSms"];
      v25 = [v8 objectForKey:@"hasFuseCarrierBundleSubscription"];
      if (objc_opt_respondsToSelector() & 1) != 0 && ([v22 BOOLValue])
      {
        uint64_t v21 = 6;
      }
      else if (objc_opt_respondsToSelector() & 1) != 0 && ([v25 BOOLValue])
      {
        uint64_t v21 = 1;
      }
      else if (objc_opt_respondsToSelector() & 1) != 0 && ([v24 BOOLValue])
      {
        uint64_t v21 = 5;
      }
      else if (objc_opt_respondsToSelector())
      {
        if ([v23 BOOLValue]) {
          uint64_t v21 = 4;
        }
        else {
          uint64_t v21 = 2;
        }
      }
      else
      {
        uint64_t v21 = 2;
      }

      v17 = v59;
    }
    switch(v21)
    {
      case 1:
        uint64_t v26 = 1;
        goto LABEL_35;
      case 2:
        uint64_t v26 = 3;
        goto LABEL_35;
      case 3:
        v11->_carrierBundlingStatusType = 0;
        goto LABEL_38;
      case 4:
        v11->_carrierBundlingStatusType = 0;
        v11->_needsHeaderEnrichment = 1;
        goto LABEL_38;
      case 5:
        uint64_t v26 = 4;
LABEL_35:
        v11->_carrierBundlingStatusType = v26;
        break;
      case 6:
        v11->_carrierBundlingStatusType = 0;
        v11->_wantsDelayedRetry = 1;
        break;
      case 7:
        v11->_carrierBundlingStatusType = 0;
        v11->_needsSilentSMS = 1;
        break;
      default:
        goto LABEL_38;
    }
    goto LABEL_38;
  }
  v18 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v17, objc_msgSend(v16, "integerValue"), 0);
  uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICError", -7601, v18, @"Eligibility response not valid %@", v8);
  error = v11->_error;
  v11->_error = (NSError *)v19;

LABEL_38:
  v27 = [v8 objectForKey:@"fuseHeaderEnrichmentMessage"];
  if (_NSIsNSString())
  {
    uint64_t v28 = [v27 copy];
    headerEnrichmentMessage = v11->_headerEnrichmentMessage;
    v11->_headerEnrichmentMessage = (NSString *)v28;
  }
  v30 = [v8 objectForKey:@"fuseHeaderEnrichmentSessionId"];
  if (_NSIsNSString())
  {
    uint64_t v31 = [v30 copy];
    headerEnrichmentSessionIdentifier = v11->_headerEnrichmentSessionIdentifier;
    v11->_headerEnrichmentSessionIdentifier = (NSString *)v31;
  }
  uint64_t v33 = [v8 objectForKey:@"fuseHeaderEnrichmentUrl"];
  if (_NSIsNSString())
  {
    uint64_t v34 = [MEMORY[0x1E4F1CB10] URLWithString:v33];
    headerEnrichmentURL = v11->_headerEnrichmentURL;
    v11->_headerEnrichmentURL = (NSURL *)v34;
  }
  v53 = (void *)v33;
  v36 = [v8 objectForKey:@"fuseSilentSMSMessage"];
  if (_NSIsNSString())
  {
    uint64_t v37 = [v36 copy];
    silentSMSMessage = v11->_silentSMSMessage;
    v11->_silentSMSMessage = (NSString *)v37;
  }
  v60 = v17;
  v39 = [v8 objectForKey:@"fuseSilentSMSNumber"];
  if (_NSIsNSString())
  {
    uint64_t v40 = [v39 copy];
    silentSMSNumber = v11->_silentSMSNumber;
    v11->_silentSMSNumber = (NSString *)v40;
  }
  v54 = v27;
  v42 = [v8 objectForKey:@"fuseSmsSessionId"];
  if (_NSIsNSString())
  {
    uint64_t v43 = [v42 copy];
    SMSSessionIdentifier = v11->_SMSSessionIdentifier;
    v11->_SMSSessionIdentifier = (NSString *)v43;
  }
  v57 = (void *)v12;
  v45 = [v8 objectForKey:@"waitTime"];
  if (objc_opt_respondsToSelector())
  {
    [v45 doubleValue];
    v11->_delayInterval = v46 / 1000.0;
  }
  v47 = [v8 objectForKey:@"isFamily"];
  if (objc_opt_respondsToSelector()) {
    v11->_familySubscription = [v47 BOOLValue];
  }
  uint64_t v48 = [v9 copy];
  cellularProviderName = v11->_cellularProviderName;
  v11->_cellularProviderName = (NSString *)v48;

  id v10 = v58;
  uint64_t v50 = [v58 copy];
  phoneNumber = v11->_phoneNumber;
  v11->_phoneNumber = (NSString *)v50;

LABEL_55:
  return v11;
}

@end