@interface INStorageSummaryResponse
- (ICQCloudStorageSummary)cloudStorageSummary;
- (INStorageSummaryResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (id)_parseSpecifierInfo:(id)a3;
- (id)_parseSubscriptionInfo:(id)a3;
- (id)_parseTip:(id)a3;
- (id)_parseTipAction:(id)a3;
- (id)_parseTipActionLink:(id)a3;
- (id)_parseTipCriteria:(id)a3;
- (id)_parseTipIcon:(id)a3;
- (id)_parseTips:(id)a3;
- (id)_parseUsageByMedia:(id)a3;
- (id)_parseiCloudPlusFeature:(id)a3;
- (void)_parseResponseDict;
@end

@implementation INStorageSummaryResponse

- (INStorageSummaryResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)INStorageSummaryResponse;
  v4 = [(INStorageSummaryResponse *)&v9 initWithHTTPResponse:a3 data:a4 bodyIsPlist:0];
  v5 = v4;
  if (v4)
  {
    v6 = (id *)&v4->AAResponse_opaque[OBJC_IVAR___AAResponse__httpResponse];
    if ([*v6 statusCode] == (id)200)
    {
      [(INStorageSummaryResponse *)v5 _parseResponseDict];
    }
    else
    {
      v7 = _INLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100027C4C(v6, v7);
      }
    }
  }
  return v5;
}

- (void)_parseResponseDict
{
  v3 = (ICQCloudStorageSummary *)objc_alloc_init((Class)ICQCloudStorageSummary);
  cloudStorageSummary = self->_cloudStorageSummary;
  self->_cloudStorageSummary = v3;

  uint64_t v5 = OBJC_IVAR___AAResponse__responseDictionary;
  id v41 = [*(id *)&self->AAResponse_opaque[OBJC_IVAR___AAResponse__responseDictionary] objectForKeyedSubscript:@"displayLabel"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(ICQCloudStorageSummary *)self->_cloudStorageSummary setDisplayLabel:v41];
  }
  v6 = [*(id *)&self->AAResponse_opaque[v5] objectForKeyedSubscript:@"manageStorageInfo"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v6 objectForKeyedSubscript:@"manageStorageURL"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = +[NSURL URLWithString:v7];
      [(ICQCloudStorageSummary *)self->_cloudStorageSummary setManageStorageURL:v8];
    }
    objc_super v9 = [v6 objectForKeyedSubscript:@"manageStorageLabel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(ICQCloudStorageSummary *)self->_cloudStorageSummary setManageStorageTitle:v9];
    }
    v10 = [v6 objectForKeyedSubscript:@"manageStorageAction"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = v6;
      v12 = [v10 objectForKeyedSubscript:@"title"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(ICQCloudStorageSummary *)self->_cloudStorageSummary setManageStorageActionButtonText:v12];
      }

      v6 = v11;
    }
  }
  v13 = [*(id *)&self->AAResponse_opaque[v5] objectForKeyedSubscript:@"usageByMedia"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = [(INStorageSummaryResponse *)self _parseUsageByMedia:v13];
    [(ICQCloudStorageSummary *)self->_cloudStorageSummary setMediaStorage:v14];
  }
  uint64_t v15 = [*(id *)&self->AAResponse_opaque[v5] objectForKeyedSubscript:@"totalStorage"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(ICQCloudStorageSummary *)self->_cloudStorageSummary setTotalStorage:v15];
  }
  uint64_t v16 = [*(id *)&self->AAResponse_opaque[v5] objectForKeyedSubscript:@"usedStorage"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(ICQCloudStorageSummary *)self->_cloudStorageSummary setUsedStorage:v16];
  }
  uint64_t v17 = [*(id *)&self->AAResponse_opaque[v5] objectForKeyedSubscript:@"freeStorage"];
  objc_opt_class();
  v40 = (void *)v17;
  if (objc_opt_isKindOfClass()) {
    [(ICQCloudStorageSummary *)self->_cloudStorageSummary setFreeStorage:v17];
  }
  v38 = (void *)v16;
  uint64_t v18 = [*(id *)&self->AAResponse_opaque[v5] objectForKeyedSubscript:@"commerceStorageQuota"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(ICQCloudStorageSummary *)self->_cloudStorageSummary setCommerceStorage:v18];
  }
  v37 = (void *)v18;
  v39 = (void *)v15;
  v19 = [*(id *)&self->AAResponse_opaque[v5] objectForKeyedSubscript:@"subscriptionInfo"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v20 = [(INStorageSummaryResponse *)self _parseSubscriptionInfo:v19];
    [(ICQCloudStorageSummary *)self->_cloudStorageSummary setSubscriptionInfo:v20];
  }
  v21 = [*(id *)&self->AAResponse_opaque[v5] objectForKeyedSubscript:@"tips"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v22 = [(INStorageSummaryResponse *)self _parseTips:v21];
    [(ICQCloudStorageSummary *)self->_cloudStorageSummary setTips:v22];
  }
  v23 = [*(id *)&self->AAResponse_opaque[v5] objectForKeyedSubscript:@"manageStoragePage"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v24 = [objc_alloc((Class)ICQManageStoragePageInfo) initFromDictionary:v23];
    [(ICQCloudStorageSummary *)self->_cloudStorageSummary setManageStoragePage:v24];
  }
  v25 = [*(id *)&self->AAResponse_opaque[v5] objectForKeyedSubscript:@"iCloudDetailsPageInfo"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v35 = v13;
    v26 = v6;
    id v27 = objc_alloc_init((Class)ICQiCloudDetailsPageInfo);
    v28 = [v25 objectForKeyedSubscript:@"actionURL"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v30 = [v25 objectForKeyedSubscript:@"actionURL"];
      v31 = +[NSURL URLWithString:v30];
    }
    else
    {
      v32 = [v25 objectForKeyedSubscript:@"actionURL"];
      objc_opt_class();
      char v33 = objc_opt_isKindOfClass();

      if (v33)
      {
        v31 = [v25 objectForKeyedSubscript:@"actionURL"];
      }
      else
      {
        v31 = 0;
      }
    }
    objc_msgSend(v27, "setActionURL:", v31, v35);
    v34 = [v25 objectForKeyedSubscript:@"actionType"];
    [v27 setActionType:v34];

    [(ICQCloudStorageSummary *)self->_cloudStorageSummary setICloudDetailsPageInfo:v27];
    v6 = v26;
    v13 = v36;
  }
}

- (id)_parseTips:(id)a3
{
  id v4 = a3;
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_100009704;
  v14 = &unk_100040F68;
  uint64_t v15 = self;
  id v5 = (id)objc_opt_new();
  id v16 = v5;
  [v4 enumerateObjectsUsingBlock:&v11];
  id v6 = objc_msgSend(v4, "count", v11, v12, v13, v14, v15);
  if (v6 > [v5 count])
  {
    v7 = _INLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100027CEC(v4, v5);
    }
  }
  v8 = v16;
  id v9 = v5;

  return v9;
}

- (id)_parseTip:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)ICQInlineTip);
  id v6 = [v4 objectForKeyedSubscript:@"id"];
  [v5 setId:v6];

  v7 = [v4 objectForKeyedSubscript:@"anchor"];
  [v5 setAnchor:v7];

  v8 = [v4 objectForKeyedSubscript:@"arrowConfiguration"];
  [v5 setArrowConfiguration:v8];

  id v9 = [v4 objectForKeyedSubscript:@"title"];
  [v5 setTitle:v9];

  v10 = [v4 objectForKeyedSubscript:@"subTitle"];
  [v5 setSubTitle:v10];

  v11 = [v4 objectForKeyedSubscript:@"button"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v24 = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472;
    v26 = sub_100009B58;
    id v27 = &unk_100040F68;
    id v12 = (id)objc_opt_new();
    id v28 = v12;
    v29 = self;
    [v11 enumerateObjectsUsingBlock:&v24];
    id v13 = objc_msgSend(v11, "count", v24, v25, v26, v27);
    if (v13 > [v12 count])
    {
      v14 = _INLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100027E0C(v11, v12);
      }
    }
    [v5 setActions:v12];
  }
  uint64_t v15 = [v4 objectForKeyedSubscript:@"criteria"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = [(INStorageSummaryResponse *)self _parseTipCriteria:v15];
    [v5 setCriteria:v16];
  }
  uint64_t v17 = [v4 objectForKeyedSubscript:@"icon"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v18 = [(INStorageSummaryResponse *)self _parseTipIcon:v17];
    [v5 setIcon:v18];
  }
  v19 = [v4 objectForKeyedSubscript:@"dismissURL"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v20 = +[NSURL URLWithString:v19];
    [v5 setDismissURL:v20];
  }
  v21 = [v4 objectForKeyedSubscript:@"displayURL"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v22 = +[NSURL URLWithString:v21];
    [v5 setDisplayURL:v22];
  }
  return v5;
}

- (id)_parseTipAction:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)ICQInlineTipAction);
  id v6 = [v4 objectForKeyedSubscript:@"text"];
  [v5 setButtonTitle:v6];

  v7 = [v4 objectForKeyedSubscript:@"action"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v9 = [v4 objectForKeyedSubscript:@"action"];
    [v5 setActionName:v9];
  }
  v10 = [v4 objectForKeyedSubscript:@"url"];
  objc_opt_class();
  char v11 = objc_opt_isKindOfClass();

  if (v11)
  {
    id v12 = [v4 objectForKeyedSubscript:@"url"];
    id v13 = +[NSURL URLWithString:v12];
    [v5 setActionURL:v13];
  }
  v14 = [(INStorageSummaryResponse *)self _parseTipActionLink:v4];
  [v5 setLink:v14];

  uint64_t v15 = [v5 actionName];
  if (v15)
  {
  }
  else
  {
    id v16 = [v5 actionURL];

    if (!v16)
    {
      uint64_t v17 = _INLogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100027F2C(v5);
      }
    }
  }

  return v5;
}

- (id)_parseTipActionLink:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"actionParameters"];
  id v5 = [v3 objectForKeyedSubscript:@"text"];
  id v6 = [v3 objectForKeyedSubscript:@"action"];
  v7 = [v3 objectForKeyedSubscript:@"url"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v4 objectForKeyedSubscript:@"purchaseAttribution"];
      v10 = [v4 objectForKeyedSubscript:@"route"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v8 setObject:v9 forKeyedSubscript:@"purchaseAttribution"];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v8 setObject:v10 forKeyedSubscript:@"route"];
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v8 setObject:v7 forKeyedSubscript:@"openURL"];
    }
    id v11 = [objc_alloc((Class)ICQLink) initWithText:v5 action:_ICQActionForString() parameters:v8];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)_parseTipCriteria:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)ICQTipCriteria);
  id v5 = [v3 objectForKeyedSubscript:@"minimumDeviceStorageInBytes"];
  [v4 setMinimumRange:v5];

  id v6 = [v3 objectForKeyedSubscript:@"maximumDeviceStorageInBytes"];
  [v4 setMaximumRange:v6];

  v7 = [v3 objectForKeyedSubscript:@"url"];
  id v8 = +[NSURL URLWithString:v7];
  [v4 setCriteriaURL:v8];

  id v9 = [v3 objectForKeyedSubscript:@"excludeApps"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000A1A4;
    v13[3] = &unk_100040F90;
    id v14 = objc_alloc_init((Class)NSMutableArray);
    id v10 = v14;
    [v9 enumerateObjectsUsingBlock:v13];
    id v11 = [v10 copy];
    [v4 setExcludeApps:v11];
  }
  return v4;
}

- (id)_parseTipIcon:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"type"];
  if ([v4 isEqualToString:@"IMAGE"])
  {
    id v5 = objc_alloc_init((Class)ICQTipIconURL);
    [v5 setType:v4];
    id v6 = [v3 objectForKeyedSubscript:@"urls"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [objc_alloc((Class)ICQImageURL) initFromDictionary:v6];
      [v5 setImageURL:v7];
    }
    goto LABEL_6;
  }
  if ([v4 isEqualToString:@"SF_SYMBOL"])
  {
    id v5 = objc_alloc_init((Class)ICQTipIconSymbol);
    [v5 setType:v4];
    id v8 = [v3 objectForKeyedSubscript:@"path"];
    [v5 setPath:v8];

    id v9 = [v3 objectForKeyedSubscript:@"color"];
    [v5 setSystemColorName:v9];

    id v6 = [v3 objectForKeyedSubscript:@"id"];
    [v5 setId:v6];
LABEL_6:

    goto LABEL_10;
  }
  id v10 = _INLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_100027FB0();
  }

  id v5 = 0;
LABEL_10:

  return v5;
}

- (id)_parseSubscriptionInfo:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)ICQSubscriptionInfo);
  id v6 = [v4 objectForKeyedSubscript:@"isiCloudPlusSubscriber"];
  id v7 = [v6 BOOLValue];

  [v5 setICloudPlusSubscriber:v7];
  id v8 = [v4 objectForKeyedSubscript:@"specifiers"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    id v14 = sub_10000A538;
    uint64_t v15 = &unk_100040F68;
    id v16 = objc_alloc_init((Class)NSMutableArray);
    uint64_t v17 = self;
    id v9 = v16;
    [v8 enumerateObjectsUsingBlock:&v12];
    id v10 = objc_msgSend(v9, "copy", v12, v13, v14, v15);
    [v5 setSpecifiersInfo:v10];
  }
  return v5;
}

- (id)_parseSpecifierInfo:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v5 isEqualToString:@"ICLOUD_PLUS_CELL"])
    {
      id v6 = objc_alloc_init((Class)ICQiCloudPlusSpecifierInfo);
      id v7 = [v4 objectForKeyedSubscript:@"featureList"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_10000AA84;
        v30[3] = &unk_100040F68;
        id v31 = objc_alloc_init((Class)NSMutableArray);
        v32 = self;
        id v8 = v31;
        [v7 enumerateObjectsUsingBlock:v30];
        id v9 = [v8 copy];
        [v6 setFeatureList:v9];
      }
    }
    else
    {
      id v6 = objc_alloc_init((Class)ICQSpecifierInfo);
      [v6 setType:v5];
      id v10 = [v4 objectForKeyedSubscript:@"iconURLs"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = [objc_alloc((Class)ICQImageURL) initFromDictionary:v10];
        [v6 setIconURL:v11];
      }
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"actionURL"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = +[NSURL URLWithString:v12];
      if (v13) {
        [v6 setActionURL:v13];
      }
    }
    objc_msgSend(v6, "setType:", v5, v12);
    id v14 = [v4 objectForKeyedSubscript:@"identifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v6 setIdentifier:v14];
    }
    uint64_t v15 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v6 setTitle:v15];
    }
    id v16 = [v4 objectForKeyedSubscript:@"subTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v6 setSubTitle:v16];
    }
    uint64_t v17 = [v4 objectForKeyedSubscript:@"actionType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v18 = [v6 actionURL];

      id v19 = objc_alloc((Class)ICQLink);
      v20 = v19;
      if (v18)
      {
        v21 = [v6 actionURL];
        id v22 = [v20 initWithActionString:v17 url:v21];
      }
      else
      {
        id v22 = [v19 initWithActionString:v17];
      }
      [v6 setIcqLink:v22];
    }
    v23 = objc_opt_new();
    id v24 = [v4 objectForKeyedSubscript:@"actions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10000AB08;
      v28[3] = &unk_100040FB8;
      id v29 = v23;
      [v24 enumerateObjectsUsingBlock:v28];
    }
    uint64_t v25 = _INLogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      sub_100028024(v23, v25);
    }

    [v6 setActions:v23];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_parseiCloudPlusFeature:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)ICQiCloudPlusFeature);
  id v5 = [v3 objectForKeyedSubscript:@"label"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setLabel:v5];
  }
  id v6 = [v3 objectForKeyedSubscript:@"subLabel"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setSublabel:v6];
  }
  id v7 = [v3 objectForKeyedSubscript:@"iconURLs"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [objc_alloc((Class)ICQImageURL) initFromDictionary:v7];
    [v4 setIconURL:v8];
  }
  return v4;
}

- (id)_parseUsageByMedia:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v10 = objc_opt_new();
        id v11 = [v9 objectForKeyedSubscript:@"mediaType"];
        [v10 setMediaType:v11];

        uint64_t v12 = [v9 objectForKeyedSubscript:@"displayLabel"];
        [v10 setDisplayLabel:v12];

        uint64_t v13 = [v9 objectForKeyedSubscript:@"storageUsed"];
        [v10 setStorageUsed:v13];

        id v14 = [v9 objectForKeyedSubscript:@"displayColor"];
        [v10 setDisplayColor:v14];

        uint64_t v15 = [v9 objectForKeyedSubscript:@"displayColorDark"];
        [v10 setDisplayColorDark:v15];

        [v4 addObject:v10];
      }
      id v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }
  id v16 = [v4 copy];

  return v16;
}

- (ICQCloudStorageSummary)cloudStorageSummary
{
  return self->_cloudStorageSummary;
}

- (void).cxx_destruct
{
}

@end