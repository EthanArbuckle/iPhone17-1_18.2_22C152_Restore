@interface FRReferredArticle
- (FCAssetHandle)flintDocumentAssetHandle;
- (FRReferredArticle)initWithArticleID:(id)a3 sourceChannelID:(id)a4 sectionData:(id)a5 flintDocumentAssetHandle:(id)a6 articleRecordData:(id)a7 sourceChannelRecordData:(id)a8 parentIssueRecordData:(id)a9;
- (FRSectionData)sectionData;
- (NSData)articleRecordData;
- (NSData)parentIssueRecordData;
- (NSData)sourceChannelRecordData;
- (NSString)articleID;
- (NSString)sourceChannelID;
- (id)headlineWithContentContext:(id)a3;
@end

@implementation FRReferredArticle

- (FRReferredArticle)initWithArticleID:(id)a3 sourceChannelID:(id)a4 sectionData:(id)a5 flintDocumentAssetHandle:(id)a6 articleRecordData:(id)a7 sourceChannelRecordData:(id)a8 parentIssueRecordData:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v37 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v38.receiver = self;
  v38.super_class = (Class)FRReferredArticle;
  v21 = [(FRReferredArticle *)&v38 init];
  if (v21)
  {
    v22 = (NSString *)[v15 copy];
    articleID = v21->_articleID;
    v21->_articleID = v22;

    v24 = (NSString *)[v16 copy];
    sourceChannelID = v21->_sourceChannelID;
    v21->_sourceChannelID = v24;

    objc_storeStrong((id *)&v21->_sectionData, a5);
    objc_storeStrong((id *)&v21->_flintDocumentAssetHandle, a6);
    v26 = (NSData *)[v18 copy];
    articleRecordData = v21->_articleRecordData;
    v21->_articleRecordData = v26;

    v28 = (NSData *)[v19 copy];
    sourceChannelRecordData = v21->_sourceChannelRecordData;
    v21->_sourceChannelRecordData = v28;

    v30 = (NSData *)[v20 copy];
    parentIssueRecordData = v21->_parentIssueRecordData;
    v21->_parentIssueRecordData = v30;

    v32 = [v17 filePath];

    if (v32)
    {
      v33 = (void *)FCDefaultLog;
      if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_DEFAULT))
      {
        v34 = v33;
        v35 = [v17 uniqueKey];
        *(_DWORD *)buf = 138543618;
        v40 = v35;
        __int16 v41 = 2114;
        id v42 = v15;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "initializing referredArticle with prefetched JSON %{public}@ to asset manager for article %{public}@", buf, 0x16u);
      }
    }
  }

  return v21;
}

- (id)headlineWithContentContext:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000E842C();
  }
  uint64_t v5 = [(FRReferredArticle *)self articleRecordData];
  if (!v5) {
    goto LABEL_12;
  }
  v6 = (void *)v5;
  v7 = [(FRReferredArticle *)self sourceChannelID];

  if (!v7) {
    goto LABEL_12;
  }
  v8 = [v4 tagController];
  v9 = [(FRReferredArticle *)self sourceChannelID];
  v10 = [v8 slowCachedTagForID:v9];
  id v11 = [v10 asChannel];

  if (v11) {
    goto LABEL_7;
  }
  id v20 = [(FRReferredArticle *)self sourceChannelRecordData];

  if (!v20) {
    goto LABEL_12;
  }
  id v21 = objc_alloc((Class)FCTag);
  v22 = [(FRReferredArticle *)self sourceChannelRecordData];
  id v11 = [v21 initWithData:v22 context:v4];

  if (v11)
  {
LABEL_7:
    id v12 = [(FRReferredArticle *)self parentIssueRecordData];

    if (v12)
    {
      id v13 = objc_alloc((Class)FCIssue);
      v14 = [(FRReferredArticle *)self parentIssueRecordData];
      id v15 = [v4 assetManager];
      id v12 = [v13 initWithData:v14 sourceChannel:v11 assetManager:v15];
    }
    id v16 = objc_alloc((Class)FCArticleHeadline);
    id v17 = [(FRReferredArticle *)self articleRecordData];
    id v18 = [v4 assetManager];
    id v19 = [v16 initWithArticleRecordData:v17 sourceChannel:v11 parentIssue:v12 assetManager:v18];
  }
  else
  {
LABEL_12:
    id v19 = 0;
  }

  return v19;
}

- (NSString)articleID
{
  return self->_articleID;
}

- (FRSectionData)sectionData
{
  return self->_sectionData;
}

- (NSString)sourceChannelID
{
  return self->_sourceChannelID;
}

- (FCAssetHandle)flintDocumentAssetHandle
{
  return self->_flintDocumentAssetHandle;
}

- (NSData)articleRecordData
{
  return self->_articleRecordData;
}

- (NSData)sourceChannelRecordData
{
  return self->_sourceChannelRecordData;
}

- (NSData)parentIssueRecordData
{
  return self->_parentIssueRecordData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentIssueRecordData, 0);
  objc_storeStrong((id *)&self->_sourceChannelRecordData, 0);
  objc_storeStrong((id *)&self->_articleRecordData, 0);
  objc_storeStrong((id *)&self->_flintDocumentAssetHandle, 0);
  objc_storeStrong((id *)&self->_sourceChannelID, 0);
  objc_storeStrong((id *)&self->_sectionData, 0);

  objc_storeStrong((id *)&self->_articleID, 0);
}

@end