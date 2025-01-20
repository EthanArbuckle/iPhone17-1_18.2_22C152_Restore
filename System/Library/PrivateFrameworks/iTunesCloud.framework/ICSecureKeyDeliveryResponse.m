@interface ICSecureKeyDeliveryResponse
- (ICSecureKeyDeliveryResponse)initWithResponseDictionary:(id)a3 serverPlaybackContextData:(id)a4;
- (ICStoreDialogResponse)dialog;
- (NSData)contentKeyContextData;
- (NSData)serverPlaybackContextData;
- (NSDate)renewalDate;
- (NSDate)rentalExpirationDate;
- (NSDate)rentalPlaybackStartDate;
- (NSError)serverError;
- (id)description;
- (int64_t)failureType;
- (int64_t)status;
- (unint64_t)bulkRefreshWaitInterval;
- (void)finishAssetResourceLoadingRequest:(id)a3 withError:(id)a4;
- (void)setBulkRefreshWaitInterval:(unint64_t)a3;
- (void)setContentKeyContextData:(id)a3;
- (void)setDialog:(id)a3;
- (void)setRenewalDate:(id)a3;
- (void)setRentalExpirationDate:(id)a3;
- (void)setRentalPlaybackStartDate:(id)a3;
- (void)setServerError:(id)a3;
- (void)setServerPlaybackContextData:(id)a3;
@end

@implementation ICSecureKeyDeliveryResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentKeyContextData, 0);
  objc_storeStrong((id *)&self->_serverPlaybackContextData, 0);
  objc_storeStrong((id *)&self->_renewalDate, 0);
  objc_storeStrong((id *)&self->_rentalPlaybackStartDate, 0);
  objc_storeStrong((id *)&self->_rentalExpirationDate, 0);
  objc_storeStrong((id *)&self->_serverError, 0);

  objc_storeStrong((id *)&self->_dialog, 0);
}

- (int64_t)failureType
{
  return self->_failureType;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setContentKeyContextData:(id)a3
{
}

- (NSData)contentKeyContextData
{
  return self->_contentKeyContextData;
}

- (void)setServerPlaybackContextData:(id)a3
{
}

- (NSData)serverPlaybackContextData
{
  return self->_serverPlaybackContextData;
}

- (void)setRenewalDate:(id)a3
{
}

- (NSDate)renewalDate
{
  return self->_renewalDate;
}

- (void)setRentalPlaybackStartDate:(id)a3
{
}

- (NSDate)rentalPlaybackStartDate
{
  return self->_rentalPlaybackStartDate;
}

- (void)setRentalExpirationDate:(id)a3
{
}

- (NSDate)rentalExpirationDate
{
  return self->_rentalExpirationDate;
}

- (void)setBulkRefreshWaitInterval:(unint64_t)a3
{
  self->_bulkRefreshWaitInterval = a3;
}

- (unint64_t)bulkRefreshWaitInterval
{
  return self->_bulkRefreshWaitInterval;
}

- (void)setServerError:(id)a3
{
}

- (NSError)serverError
{
  return self->_serverError;
}

- (void)setDialog:(id)a3
{
}

- (ICStoreDialogResponse)dialog
{
  return self->_dialog;
}

- (void)finishAssetResourceLoadingRequest:(id)a3 withError:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  v7 = [(ICSecureKeyDeliveryResponse *)self renewalDate];
  if (v7)
  {
    v8 = [v12 contentInformationRequest];
    [v8 setRenewalDate:v7];
  }
  v9 = [v12 dataRequest];
  v10 = [(ICSecureKeyDeliveryResponse *)self contentKeyContextData];
  if (v10)
  {
    [v9 respondWithData:v10];
  }
  else
  {
    v11 = [MEMORY[0x1E4F1C9B8] data];
    [v9 respondWithData:v11];
  }
  if (v6) {
    [v12 finishLoadingWithError:v6];
  }
  else {
    [v12 finishLoading];
  }
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = +[ICDeviceInfo currentDeviceInfo];
  int v6 = [v5 isInternalBuild];
  if (v6)
  {
    v7 = [(ICSecureKeyDeliveryResponse *)self contentKeyContextData];
  }
  else
  {
    v7 = @"<redacted>";
  }
  v8 = [(ICSecureKeyDeliveryResponse *)self renewalDate];
  v9 = [v3 stringWithFormat:@"<%@ %p (ckc:%@, renewalDate:%@)>", v4, self, v7, v8];

  if (v6) {

  }
  return v9;
}

- (ICSecureKeyDeliveryResponse)initWithResponseDictionary:(id)a3 serverPlaybackContextData:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(ICSecureKeyDeliveryResponse *)self init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_serverPlaybackContextData, a4);
    uint64_t v10 = objc_msgSend(v6, "ic_integerValueForKey:", @"status");
    v9->_status = v10;
    if (v10)
    {
      v11 = objc_msgSend(v6, "ic_dictionaryValueForKey:", @"dialog");
      if (v11)
      {
        id v12 = [[ICStoreDialogResponse alloc] initWithResponseDictionary:v11];
        dialog = v9->_dialog;
        v9->_dialog = v12;
      }
      uint64_t v14 = objc_msgSend(v6, "ic_integerValueForKey:", @"failureType");
      v9->_failureType = v14;
      if (v14)
      {
        uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICStoreServerError" code:v14 userInfo:0];
        serverError = v9->_serverError;
        v9->_serverError = (NSError *)v15;
      }
      v9->_bulkRefreshWaitInterval = (int)objc_msgSend(v6, "ic_intValueForKey:", @"download-repair-wait");
LABEL_25:

      goto LABEL_26;
    }
    v11 = [v6 objectForKey:@"ckc"];
    if (_NSIsNSString())
    {
      v17 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v11 options:0];
    }
    else
    {
      if (!_NSIsNSData()) {
        goto LABEL_13;
      }
      v17 = v11;
    }
    contentKeyContextData = v9->_contentKeyContextData;
    v9->_contentKeyContextData = v17;

LABEL_13:
    v19 = +[ICDefaults standardDefaults];
    v20 = [v19 secureKeyRenewalTimeOverride];

    if ([v20 longLongValue])
    {
      v21 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v34 = 138543618;
        v35 = v9;
        __int16 v36 = 2114;
        v37 = v20;
        _os_log_impl(&dword_1A2D01000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@]: [SKD] - using secure key renewalTime override: %{public}@", (uint8_t *)&v34, 0x16u);
      }

      v22 = (void *)MEMORY[0x1E4F1C9C8];
      [v20 doubleValue];
      v23 = v22;
    }
    else
    {
      objc_msgSend(v6, "ic_doubleValueForKey:", @"renew-after");
      if (v24 == 0.0)
      {
LABEL_20:
        objc_msgSend(v6, "ic_doubleValueForKey:", @"expiration-time");
        if (v27 != 0.0)
        {
          uint64_t v28 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v27 / 1000.0];
          rentalExpirationDate = v9->_rentalExpirationDate;
          v9->_rentalExpirationDate = (NSDate *)v28;
        }
        objc_msgSend(v6, "ic_doubleValueForKey:", @"playback-start-time");
        if (v30 != 0.0)
        {
          uint64_t v31 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v30 / 1000.0];
          rentalPlaybackStartDate = v9->_rentalPlaybackStartDate;
          v9->_rentalPlaybackStartDate = (NSDate *)v31;
        }
        v9->_bulkRefreshWaitInterval = (int)objc_msgSend(v6, "ic_intValueForKey:", @"download-repair-wait");

        goto LABEL_25;
      }
      v23 = (void *)MEMORY[0x1E4F1C9C8];
    }
    uint64_t v25 = objc_msgSend(v23, "dateWithTimeIntervalSinceNow:");
    renewalDate = v9->_renewalDate;
    v9->_renewalDate = (NSDate *)v25;

    goto LABEL_20;
  }
LABEL_26:

  return v9;
}

@end