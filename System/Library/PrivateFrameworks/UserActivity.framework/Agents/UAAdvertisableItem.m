@interface UAAdvertisableItem
- (BOOL)alwaysEligible;
- (BOOL)alwaysPick;
- (id)description;
- (id)logString;
- (id)statusString;
- (int64_t)alwaysPickValue;
@end

@implementation UAAdvertisableItem

- (id)logString
{
  v3 = &AnalyticsSendEvent_ptr;
  id v4 = [(UAAdvertisableItem *)self type];
  if (v4 == (id)1)
  {
    v5 = &stru_1000C6800;
  }
  else
  {
    sub_100064478((uint64_t)[(UAAdvertisableItem *)self type]);
    v3 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
    v5 = +[NSString stringWithFormat:@"%@:", v3];
  }
  v6 = [(UAAdvertisableItem *)self uuid];
  v7 = [v6 UUIDString];
  v8 = [(UAAdvertisableItem *)self activityType];
  v9 = [(UAAdvertisableItem *)self payloadForIdentifier:UAUserActivityUserInfoPayload];
  v10 = sub_10000F05C(v9, 8);
  v11 = [(UAAdvertisableItem *)self payloads];
  v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ %@ %@ .userInfo=%@ payloads=%ld", v5, v7, v8, v10, [v11 count]);

  if (v4 != (id)1)
  {
  }

  return v12;
}

- (id)description
{
  v19.receiver = self;
  v19.super_class = (Class)UAAdvertisableItem;
  v17 = [(UAAdvertisableItem *)&v19 description];
  v16 = sub_100064478((uint64_t)[(UAAdvertisableItem *)self type]);
  v18 = [(UAAdvertisableItem *)self uuid];
  v3 = [v18 UUIDString];
  id v4 = [(UAAdvertisableItem *)self activityType];
  v5 = [(UAAdvertisableItem *)self payloadForIdentifier:UAUserActivityUserInfoPayload];
  v6 = sub_10000F05C(v5, 32);
  v7 = [(UAAdvertisableItem *)self webpageURL];
  CFStringRef v8 = &stru_1000C6800;
  if (v7) {
    CFStringRef v9 = @" webPageURL=<private>";
  }
  else {
    CFStringRef v9 = &stru_1000C6800;
  }
  v10 = [(UAAdvertisableItem *)self referrerURL];
  if (v10) {
    CFStringRef v11 = @" referrerURL=<private>";
  }
  else {
    CFStringRef v11 = &stru_1000C6800;
  }
  if (![(UAAdvertisableItem *)self eligibleForHandoff]) {
    CFStringRef v8 = @"!eligibleForHandoff";
  }
  unsigned int v12 = [(UAAdvertisableItem *)self eligibleToAdvertise];
  CFStringRef v13 = @"NO";
  if (v12) {
    CFStringRef v13 = @"YES";
  }
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ { type = %@; uuid = %@;  activityType = \"%@\"; userInfo = %@; %@%@ %@ eligible=%@}",
    v17,
    v16,
    v3,
    v4,
    v6,
    v9,
    v11,
    v8,
  v14 = v13);

  return v14;
}

- (id)statusString
{
  id v3 = [(UAAdvertisableItem *)self type];
  if (v3 == (id)1)
  {
    CFStringRef v4 = &stru_1000C6800;
  }
  else
  {
    v31 = sub_100064478((uint64_t)[(UAAdvertisableItem *)self type]);
    CFStringRef v4 = +[NSString stringWithFormat:@"%@:", v31];
  }
  uint64_t v47 = [(UAAdvertisableItem *)self activityType];
  v5 = [(UAAdvertisableItem *)self dynamicActivityType];
  v6 = &stru_1000C6800;
  if (v5)
  {
    v32 = [(UAAdvertisableItem *)self dynamicActivityType];
    v49 = +[NSString stringWithFormat:@":%@", v32];
  }
  else
  {
    v49 = &stru_1000C6800;
  }
  v7 = [(UAAdvertisableItem *)self uuid];
  v50 = [v7 UUIDString];
  if ([(UAAdvertisableItem *)self isDirty]) {
    CFStringRef v8 = @" dirty*";
  }
  else {
    CFStringRef v8 = &stru_1000C6800;
  }
  if ([(UAAdvertisableItem *)self eligibleForHandoff]) {
    CFStringRef v9 = &stru_1000C6800;
  }
  else {
    CFStringRef v9 = @" !handOff";
  }
  CFStringRef v48 = v4;
  v46 = v7;
  unsigned int v45 = [(UAAdvertisableItem *)self alwaysPick];
  CFStringRef v40 = v8;
  CFStringRef v38 = v9;
  if (v45)
  {
    +[NSString stringWithFormat:@" AlwaysPickPriority=%li ", [(UAAdvertisableItem *)self alwaysPickValue]];
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v44 = [(UAAdvertisableItem *)self options];
  v43 = [v44 objectForKeyedSubscript:_UAUserActivityContainsCloudDocsKey];
  unsigned int v10 = [v43 BOOLValue];
  CFStringRef v11 = " cloudDoc";
  if (!v10) {
    CFStringRef v11 = "";
  }
  v35 = v11;
  v42 = [(UAAdvertisableItem *)self options];
  v41 = [v42 objectForKeyedSubscript:_UAUserActivityContainsUnsynchronizedCloudDocsKey];
  unsigned int v12 = [v41 BOOLValue];
  CFStringRef v13 = " unSynchCloudDoc";
  if (!v12) {
    CFStringRef v13 = "";
  }
  v34 = v13;
  v39 = [(UAAdvertisableItem *)self options];
  v37 = [v39 objectForKeyedSubscript:_UAUserActivityContainsFileProviderURLKey];
  if ([v37 BOOLValue]) {
    v14 = " fileProv";
  }
  else {
    v14 = "";
  }
  v36 = [(UAAdvertisableItem *)self payloadForIdentifier:UAUserActivityUserInfoPayload];
  v15 = sub_10000F05C(v36, 24);
  v16 = [(UAAdvertisableItem *)self webpageURL];
  if (v16)
  {
    if ((os_trace_get_mode() & 0x1000000) != 0)
    {
      v30 = [(UAAdvertisableItem *)self webpageURL];
      +[NSString stringWithFormat:@" url=%@", v30];
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v33 = 1;
    }
    else
    {
      int v33 = 0;
      v17 = @"url=<private>";
    }
  }
  else
  {
    int v33 = 0;
    v17 = &stru_1000C6800;
  }
  v18 = [(UAAdvertisableItem *)self referrerURL];
  if (!v18)
  {
    CFStringRef v19 = &stru_1000C6800;
    goto LABEL_31;
  }
  if ((os_trace_get_mode() & 0x1000000) == 0)
  {
    CFStringRef v19 = @"referrer=<private>";
LABEL_31:
    v26 = v14;
    v20 = (void *)v47;
    v21 = (__CFString *)v48;
    v22 = +[NSString stringWithFormat:@"%@%@%@ %@ %@%@%@%s%s%s %@%@%@", v48, v47, v49, v50, v40, v38, v6, v35, v34, v26, v15, v17, v19];
    goto LABEL_33;
  }
  [(UAAdvertisableItem *)self referrerURL];
  v23 = id v29 = v3;
  +[NSString stringWithFormat:@" referrer=%@", v23];
  v24 = v28 = v5;
  v27 = v14;
  v20 = (void *)v47;
  v21 = (__CFString *)v48;
  v22 = +[NSString stringWithFormat:@"%@%@%@ %@ %@%@%@%s%s%s %@%@%@", v48, v47, v49, v50, v40, v38, v6, v35, v34, v27, v15, v17, v24];

  v5 = v28;
  id v3 = v29;
LABEL_33:

  if (v33)
  {
  }
  if (v45) {

  }
  if (v5)
  {
  }
  if (v3 != (id)1)
  {
  }

  return v22;
}

- (BOOL)alwaysPick
{
  return self->_alwaysPick;
}

- (int64_t)alwaysPickValue
{
  return self->_alwaysPickValue;
}

- (BOOL)alwaysEligible
{
  return self->_alwaysEligible;
}

@end