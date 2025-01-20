@interface NSURL
- (id)ft_referralURLWithSourceIdentifier:(id)a3 appConfigTreatmentID:(id)a4 widgetEngagement:(id)a5 otherQueryItems:(id)a6 sharedDirectoryFileURL:(id)a7;
@end

@implementation NSURL

- (id)ft_referralURLWithSourceIdentifier:(id)a3 appConfigTreatmentID:(id)a4 widgetEngagement:(id)a5 otherQueryItems:(id)a6 sharedDirectoryFileURL:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v40 = a7;
  if (!v12 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000E7AB8();
    if (v15) {
      goto LABEL_6;
    }
  }
  else if (v15)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000E79D8();
  }
LABEL_6:
  id v16 = [objc_alloc((Class)NSURLComponents) initWithURL:self resolvingAgainstBaseURL:1];
  v17 = [v16 queryItems];
  v18 = +[NSMutableArray arrayWithArray:v17];

  if (v13)
  {
    uint64_t v19 = FCWidgetModeGroupIDPathComponent;
    [v13 stringValue];
    v21 = id v20 = v13;
    v22 = +[NSURLQueryItem queryItemWithName:v19 value:v21];
    [v18 addObject:v22];

    id v13 = v20;
  }
  if (v14)
  {
    id v39 = v12;
    id v23 = v13;
    v24 = +[NSUUID UUID];
    v25 = [v24 UUIDString];

    v26 = [v40 URLByAppendingPathComponent:v25];
    v27 = [v14 data];
    unsigned int v28 = [v27 writeToURL:v26 atomically:1];

    if (v28)
    {
      uint64_t v29 = FCWidgetEngagementFilePathQueryItemName;
      v30 = [v26 path];
      v31 = +[NSURLQueryItem queryItemWithName:v29 value:v30];
      [v18 addObject:v31];
    }
    id v13 = v23;
    id v12 = v39;
  }
  v32 = +[NSDate date];
  v33 = [v32 fc_stringWithISO8601Format];

  if (v33)
  {
    v34 = +[NSURLQueryItem queryItemWithName:FCUserActionDatePathComponent value:v33];
    [v18 addObject:v34];
  }
  [v18 addObjectsFromArray:v15];
  [v16 setQueryItems:v18];
  v35 = [v16 URL];
  v36 = FTCampaignIdentifierForSourceIdentifier(v12);
  v37 = [v35 nss_URLWithCampaignID:v36];

  return v37;
}

@end