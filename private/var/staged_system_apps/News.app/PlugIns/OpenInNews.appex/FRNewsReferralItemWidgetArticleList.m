@interface FRNewsReferralItemWidgetArticleList
+ (Class)encodableElementClass;
- (FRNewsReferralItemWidgetArticleList)init;
- (FRNewsReferralItemWidgetArticleList)initWithEncodableElement:(id)a3 assetHandlesByRemoteURL:(id)a4;
- (FRNewsReferralItemWidgetArticleList)initWithJSONArray:(id)a3 flintDocumentURLAssetHandlesByRemoteURL:(id)a4;
- (FRNewsReferralItemWidgetArticleListEncodableElement)myEncodableElement;
- (NSArray)JSONArray;
- (NSArray)assetHandles;
- (NSDictionary)flintDocumentURLAssetHandlesByRemoteURL;
- (id)referredArticlesWithAssetManager:(id)a3;
@end

@implementation FRNewsReferralItemWidgetArticleList

- (FRNewsReferralItemWidgetArticleList)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRNewsReferralItemWidgetArticleList init]";
    __int16 v7 = 2080;
    v8 = "FRNewsReferralItemWidgetArticleList.m";
    __int16 v9 = 1024;
    int v10 = 38;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FRNewsReferralItemWidgetArticleList init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (FRNewsReferralItemWidgetArticleList)initWithJSONArray:(id)a3 flintDocumentURLAssetHandlesByRemoteURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000046B4();
    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000045F0();
  }
LABEL_6:
  v8 = [[FRNewsReferralItemWidgetArticleListEncodableElement alloc] initWithJSONArray:v6];
  __int16 v9 = [(FRNewsReferralItemWidgetArticleList *)self initWithEncodableElement:v8 assetHandlesByRemoteURL:v7];

  return v9;
}

- (NSArray)JSONArray
{
  id v2 = [(FRNewsReferralItemWidgetArticleList *)self myEncodableElement];
  v3 = [v2 JSONArray];

  return (NSArray *)v3;
}

- (id)referredArticlesWithAssetManager:(id)a3
{
  id v20 = a3;
  if (!v20 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100004778();
  }
  id v30 = (id)objc_opt_new();
  v21 = self;
  [(FRNewsReferralItemWidgetArticleList *)self JSONArray];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  v32 = (char *)[obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v41;
    uint64_t v29 = FCWidgetArticleListArticleID;
    uint64_t v28 = FCWidgetArticleListSourceChannelID;
    uint64_t v27 = FCWidgetArticleListSectionName;
    uint64_t v26 = FCWidgetArticleListFlintDocumentURL;
    uint64_t v25 = FCWidgetArticleListArticleRecordData;
    uint64_t v24 = FCWidgetArticleListSourceChannelRecordData;
    uint64_t v23 = FCWidgetArticleListParentIssueRecordData;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(void *)v41 != v31) {
          objc_enumerationMutation(obj);
        }
        objc_opt_class();
        v5 = FCDynamicCast();
        id v6 = v5;
        if (v5)
        {
          v39 = [v5 objectForKey:v29];
          v35 = [v6 objectForKey:v28];
          uint64_t v7 = [v6 objectForKey:v27];
          v34 = [[FRSectionData alloc] initWithName:v7];
          uint64_t v8 = [v6 objectForKey:v26];
          v37 = (void *)v8;
          v38 = (void *)v7;
          if (v8)
          {
            __int16 v9 = +[NSURL URLWithString:v8];
            if (v9)
            {
              int v10 = [(FRNewsReferralItemWidgetArticleList *)v21 flintDocumentURLAssetHandlesByRemoteURL];
              uint64_t v11 = [v10 objectForKeyedSubscript:v9];

              id v12 = (void *)v11;
LABEL_15:
              uint64_t v13 = [v6 objectForKeyedSubscript:v25];
              if (v13) {
                id v33 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v13 options:0];
              }
              else {
                id v33 = 0;
              }
              v14 = [v6 objectForKeyedSubscript:v24];
              v36 = (void *)v13;
              if (v14) {
                id v15 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v14 options:0];
              }
              else {
                id v15 = 0;
              }
              v16 = [v6 objectForKeyedSubscript:v23];
              if (v16) {
                id v17 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v16 options:0];
              }
              else {
                id v17 = 0;
              }
              v18 = [[FRReferredArticle alloc] initWithArticleID:v39 sourceChannelID:v35 sectionData:v34 flintDocumentAssetHandle:v12 articleRecordData:v33 sourceChannelRecordData:v15 parentIssueRecordData:v17];
              [v30 addObject:v18];

              goto LABEL_25;
            }
          }
          else
          {
            __int16 v9 = 0;
          }
          id v12 = 0;
          goto LABEL_15;
        }
LABEL_25:
      }
      v32 = (char *)[obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v32);
  }

  return v30;
}

- (FRNewsReferralItemWidgetArticleList)initWithEncodableElement:(id)a3 assetHandlesByRemoteURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100004900();
    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000483C();
  }
LABEL_6:
  v14.receiver = self;
  v14.super_class = (Class)FRNewsReferralItemWidgetArticleList;
  uint64_t v8 = [(FRNewsReferralItemWidgetArticleList *)&v14 init];
  if (v8)
  {
    __int16 v9 = (FRNewsReferralItemWidgetArticleListEncodableElement *)[v6 copy];
    myEncodableElement = v8->_myEncodableElement;
    v8->_myEncodableElement = v9;

    uint64_t v11 = (NSDictionary *)[v7 copy];
    flintDocumentURLAssetHandlesByRemoteURL = v8->_flintDocumentURLAssetHandlesByRemoteURL;
    v8->_flintDocumentURLAssetHandlesByRemoteURL = v11;
  }
  return v8;
}

+ (Class)encodableElementClass
{
  return (Class)objc_opt_class();
}

- (NSArray)assetHandles
{
  id v2 = [(FRNewsReferralItemWidgetArticleList *)self flintDocumentURLAssetHandlesByRemoteURL];
  v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (NSDictionary)flintDocumentURLAssetHandlesByRemoteURL
{
  return self->_flintDocumentURLAssetHandlesByRemoteURL;
}

- (FRNewsReferralItemWidgetArticleListEncodableElement)myEncodableElement
{
  return self->_myEncodableElement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_myEncodableElement, 0);

  objc_storeStrong((id *)&self->_flintDocumentURLAssetHandlesByRemoteURL, 0);
}

@end