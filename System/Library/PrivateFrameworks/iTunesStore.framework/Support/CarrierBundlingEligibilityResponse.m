@interface CarrierBundlingEligibilityResponse
- (BOOL)isFamilySubscription;
- (BOOL)needsHeaderEnrichment;
- (BOOL)needsSilentSMS;
- (BOOL)wantsDelayedRetry;
- (CarrierBundlingEligibilityResponse)initWithEligibilityDictionary:(id)a3;
- (NSError)error;
- (NSString)SMSSessionIdentifier;
- (NSString)headerEnrichmentMessage;
- (NSString)headerEnrichmentSessionIdentifier;
- (NSString)silentSMSMessage;
- (NSString)silentSMSNumber;
- (NSURL)headerEnrichmentURL;
- (double)delayInterval;
- (int64_t)bundlingStatus;
- (void)setBundlingStatus:(int64_t)a3;
@end

@implementation CarrierBundlingEligibilityResponse

- (CarrierBundlingEligibilityResponse)initWithEligibilityDictionary:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)CarrierBundlingEligibilityResponse;
  v5 = [(CarrierBundlingEligibilityResponse *)&v40 init];
  if (!v5) {
    goto LABEL_25;
  }
  v6 = [v4 objectForKey:@"failureType"];
  v7 = [v4 objectForKey:@"status"];
  v8 = [v4 objectForKey:@"errorCode"];
  if ([v7 integerValue])
  {
    v9 = v7;
LABEL_6:
    [v9 integerValue];
    goto LABEL_7;
  }
  if (objc_opt_respondsToSelector())
  {
    v9 = v6;
    goto LABEL_6;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    error = [v4 objectForKey:@"fuseCarrierBundleStatus"];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v34 = (uint64_t)[error integerValue];
    }
    else
    {
      v35 = [v4 objectForKey:@"checkBack"];
      v38 = [v4 objectForKey:@"startFuseHeaderEnrichment"];
      v39 = [v4 objectForKey:@"startFuseManualSms"];
      v36 = [v4 objectForKey:@"hasFuseCarrierBundleSubscription"];
      if (objc_opt_respondsToSelector() & 1) != 0 && ([v35 BOOLValue])
      {
        uint64_t v34 = 6;
      }
      else if (objc_opt_respondsToSelector() & 1) != 0 && ([v36 BOOLValue])
      {
        uint64_t v34 = 1;
      }
      else if (objc_opt_respondsToSelector() & 1) != 0 && ([v39 BOOLValue])
      {
        uint64_t v34 = 5;
      }
      else if (objc_opt_respondsToSelector())
      {
        if ([v38 BOOLValue]) {
          uint64_t v34 = 4;
        }
        else {
          uint64_t v34 = 2;
        }
      }
      else
      {
        uint64_t v34 = 2;
      }
    }
    switch(v34)
    {
      case 1:
        uint64_t v37 = 1;
        goto LABEL_51;
      case 2:
        uint64_t v37 = 2;
        goto LABEL_51;
      case 3:
        v5->_bundlingStatus = 0;
        goto LABEL_8;
      case 4:
        v5->_bundlingStatus = 0;
        v5->_needsHeaderEnrichment = 1;
        goto LABEL_8;
      case 5:
        uint64_t v37 = 3;
LABEL_51:
        v5->_bundlingStatus = v37;
        break;
      case 6:
        v5->_bundlingStatus = 0;
        v5->_wantsDelayedRetry = 1;
        break;
      case 7:
        v5->_bundlingStatus = 0;
        v5->_needsSilentSMS = 1;
        break;
      default:
        goto LABEL_8;
    }
    goto LABEL_8;
  }
  [v8 integerValue];
LABEL_7:
  uint64_t v10 = SSError();
  error = v5->_error;
  v5->_error = (NSError *)v10;
LABEL_8:

  v12 = [v4 objectForKey:@"fuseHeaderEnrichmentMessage"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = (NSString *)[v12 copy];
    headerEnrichmentMessage = v5->_headerEnrichmentMessage;
    v5->_headerEnrichmentMessage = v13;
  }
  v15 = [v4 objectForKey:@"fuseHeaderEnrichmentSessionId"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16 = (NSString *)[v15 copy];
    headerEnrichmentSessionIdentifier = v5->_headerEnrichmentSessionIdentifier;
    v5->_headerEnrichmentSessionIdentifier = v16;
  }
  v18 = [v4 objectForKey:@"fuseHeaderEnrichmentUrl"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v19 = (NSURL *)[objc_alloc((Class)NSURL) initWithString:v18];
    headerEnrichmentURL = v5->_headerEnrichmentURL;
    v5->_headerEnrichmentURL = v19;
  }
  v21 = [v4 objectForKey:@"fuseSilentSMSMessage"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v22 = (NSString *)[v21 copy];
    silentSMSMessage = v5->_silentSMSMessage;
    v5->_silentSMSMessage = v22;
  }
  v24 = [v4 objectForKey:@"fuseSilentSMSNumber"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v25 = (NSString *)[v24 copy];
    silentSMSNumber = v5->_silentSMSNumber;
    v5->_silentSMSNumber = v25;
  }
  v27 = [v4 objectForKey:@"fuseSmsSessionId"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v28 = (NSString *)[v27 copy];
    smsSessionIdentifier = v5->_smsSessionIdentifier;
    v5->_smsSessionIdentifier = v28;
  }
  v30 = [v4 objectForKey:@"waitTime"];
  if (objc_opt_respondsToSelector())
  {
    [v30 doubleValue];
    v5->_delayInterval = v31 / 1000.0;
  }
  v32 = [v4 objectForKey:@"isFamily"];
  if (objc_opt_respondsToSelector()) {
    v5->_familySubscription = [v32 BOOLValue];
  }

LABEL_25:
  return v5;
}

- (int64_t)bundlingStatus
{
  return self->_bundlingStatus;
}

- (void)setBundlingStatus:(int64_t)a3
{
  self->_bundlingStatus = a3;
}

- (double)delayInterval
{
  return self->_delayInterval;
}

- (NSError)error
{
  return self->_error;
}

- (NSString)headerEnrichmentMessage
{
  return self->_headerEnrichmentMessage;
}

- (NSString)headerEnrichmentSessionIdentifier
{
  return self->_headerEnrichmentSessionIdentifier;
}

- (NSURL)headerEnrichmentURL
{
  return self->_headerEnrichmentURL;
}

- (BOOL)needsHeaderEnrichment
{
  return self->_needsHeaderEnrichment;
}

- (BOOL)needsSilentSMS
{
  return self->_needsSilentSMS;
}

- (NSString)silentSMSMessage
{
  return self->_silentSMSMessage;
}

- (NSString)silentSMSNumber
{
  return self->_silentSMSNumber;
}

- (NSString)SMSSessionIdentifier
{
  return self->_smsSessionIdentifier;
}

- (BOOL)wantsDelayedRetry
{
  return self->_wantsDelayedRetry;
}

- (BOOL)isFamilySubscription
{
  return self->_familySubscription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_silentSMSNumber, 0);
  objc_storeStrong((id *)&self->_silentSMSMessage, 0);
  objc_storeStrong((id *)&self->_smsSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_headerEnrichmentURL, 0);
  objc_storeStrong((id *)&self->_headerEnrichmentSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_headerEnrichmentMessage, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end