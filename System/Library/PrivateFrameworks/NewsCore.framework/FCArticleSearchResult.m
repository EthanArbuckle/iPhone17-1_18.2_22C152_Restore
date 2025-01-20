@interface FCArticleSearchResult
- (FCArticleSearchResult)initWithParsecSearchResult:(id)a3 cloudContext:(id)a4;
- (FCHeadlineProviding)deflatedHeadline;
- (FCHeadlineProviding)inflatedHeadline;
- (NSString)articleID;
- (SFSearchResult)searchResult;
- (void)setInflatedHeadline:(id)a3;
- (void)setSearchResult:(id)a3;
@end

@implementation FCArticleSearchResult

- (FCArticleSearchResult)initWithParsecSearchResult:(id)a3 cloudContext:(id)a4
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v115.receiver = self;
  v115.super_class = (Class)FCArticleSearchResult;
  v9 = [(FCArticleSearchResult *)&v115 init];
  if (!v9)
  {
    v36 = 0;
    goto LABEL_67;
  }
  v105 = v9;
  v106 = v8;
  objc_storeStrong((id *)&v9->_searchResult, a3);
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  v107 = v7;
  v10 = [v7 card];
  v11 = [v10 cardSections];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v111 objects:v116 count:16];
  if (!v12)
  {
    BOOL v108 = 0;
    v109 = 0;
    v110 = 0;
    v14 = 0;
    double v16 = 0.0;
    double v17 = 0.0;
    goto LABEL_28;
  }
  uint64_t v13 = v12;
  BOOL v108 = 0;
  v109 = 0;
  v110 = 0;
  v14 = 0;
  uint64_t v15 = *(void *)v112;
  double v16 = 0.0;
  double v17 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v112 != v15) {
        objc_enumerationMutation(v11);
      }
      v19 = *(void **)(*((void *)&v111 + 1) + 8 * i);
      objc_opt_class();
      if (!v19 || (objc_opt_isKindOfClass() & 1) == 0)
      {
        id v20 = 0;
        goto LABEL_23;
      }
      id v20 = v19;
      v21 = [v20 key];
      int v22 = [v21 isEqualToString:@"channel_id"];

      if (v22)
      {
        [v20 value];
        v14 = v23 = v14;
      }
      else
      {
        v24 = [v20 key];
        int v25 = [v24 isEqualToString:@"channel_name"];

        if (v25)
        {
          [v20 value];
          v110 = v23 = v110;
        }
        else
        {
          v26 = [v20 key];
          int v27 = [v26 isEqualToString:@"channel_logo"];

          if (v27)
          {
            [v20 image];
            v109 = v23 = v109;
          }
          else
          {
            v28 = [v20 key];
            int v29 = [v28 isEqualToString:@"is_paid"];

            if (v29)
            {
              v23 = [v20 value];
              BOOL v108 = [v23 integerValue] == 1;
            }
            else
            {
              v30 = [v20 key];
              int v31 = [v30 isEqualToString:@"banner_image_scale"];

              if (v31)
              {
                v23 = [v20 value];
                [v23 floatValue];
                double v17 = v32;
              }
              else
              {
                v33 = [v20 key];
                int v34 = [v33 isEqualToString:@"banner_image_offset"];

                if (!v34) {
                  goto LABEL_23;
                }
                v23 = [v20 value];
                [v23 floatValue];
                double v16 = v35;
              }
            }
          }
        }
      }

LABEL_23:
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v111 objects:v116 count:16];
  }
  while (v13);
LABEL_28:

  id v7 = v107;
  v37 = [v107 punchout];
  v38 = [v37 urls];
  v39 = objc_msgSend(v38, "fc_firstObjectPassingTest:", &__block_literal_global_131);

  uint64_t v40 = objc_msgSend(v39, "fc_NewsArticleID");
  v36 = v105;
  articleID = v105->_articleID;
  v105->_articleID = (NSString *)v40;

  if (v105->_articleID)
  {
    objc_opt_class();
    id v8 = v106;
    v42 = [v106 tagController];
    v43 = [v42 slowCachedTagForID:v14];
    if (v43)
    {
      if (objc_opt_isKindOfClass()) {
        v44 = v43;
      }
      else {
        v44 = 0;
      }
    }
    else
    {
      v44 = 0;
    }
    v46 = v44;

    if (!v46)
    {
      v46 = [[FCTag alloc] initWithTagType:2 identifier:v14 name:v110];
      if (v109)
      {
        v47 = [v106 assetManager];
        v48 = [v106 internalContentContext];
        [v48 contentDatabase];
        v50 = v49 = v46;
        v51 = [v47 assetHandleForRecordID:v14 field:2 lifetimeHint:0 contentDatabase:v50];

        v46 = v49;
        if (v51)
        {
          [(FCTag *)v49 setNameImageAssetHandle:v51];
          [v109 size];
          -[FCTag setNameImageSize:](v49, "setNameImageSize:");
          [(FCTag *)v49 setBannerImageScale:v17];
          [(FCTag *)v49 setBannerImageBaselineOffsetPercentage:v16];
        }
      }
    }
    BOOL v52 = v108;
    if (v108 && ![(FCTag *)v46 isPurchaseSetup])
    {
      int v45 = 0;
    }
    else
    {
      v103 = v39;
      v53 = objc_alloc_init(FCHeadline);
      [(FCHeadline *)v53 setIdentifier:v105->_articleID];
      [(FCHeadline *)v53 setArticleID:v105->_articleID];
      v54 = [v107 title];
      v55 = [v54 text];
      [(FCHeadline *)v53 setTitle:v55];

      [(FCHeadline *)v53 setSourceChannel:v46];
      v104 = v46;
      v56 = [(FCTag *)v46 name];
      [(FCHeadline *)v53 setSourceName:v56];

      v57 = (void *)MEMORY[0x1E4F1C9C8];
      v58 = [v107 publishDate];
      [v58 doubleValue];
      v59 = objc_msgSend(v57, "dateWithTimeIntervalSince1970:");
      [(FCHeadline *)v53 setPublishDate:v59];

      [(FCHeadline *)v53 setPaid:v108];
      [(FCHeadline *)v53 setRole:1];
      [(FCHeadline *)v53 setTopicIDs:MEMORY[0x1E4F1CBF0]];
      id v60 = [v106 paidAccessChecker];
      v61 = v53;
      BOOL v62 = [(FCHeadline *)v61 isPaid];
      int v63 = [(FCHeadline *)v61 isBundlePaid];
      v102 = [(FCHeadline *)v61 sourceChannel];
      v64 = [v102 identifier];
      id v65 = v60;
      id v66 = v64;
      v67 = [v65 bundleSubscriptionProvider];
      v68 = [v65 purchaseProvider];
      id v69 = v67;
      id v70 = v68;
      id v71 = v66;
      if (v62 || v63)
      {
        char v72 = !v62;
        if (!v70) {
          char v72 = 1;
        }
        if ((v72 & 1) == 0)
        {
          v73 = [v70 purchasedTagIDs];
          char v74 = [v73 containsObject:v71];

          if (v74)
          {
            int v63 = 0;
            goto LABEL_49;
          }
        }
        char v76 = v63 ^ 1;
        if (!v69) {
          char v76 = 1;
        }
        v75 = v104;
        if (v76) {
          goto LABEL_56;
        }
        id v77 = v69;
        id v78 = v71;
        if (!v78) {
          goto LABEL_55;
        }
        [v77 bundleSubscription];
        uint64_t v79 = v101 = v77;
        v99 = objc_getAssociatedObject((id)v79, (const void *)(v79 + 1));
        uint64_t v80 = [v99 unsignedIntegerValue];
        id v81 = v78;
        char v82 = v80;
        v83 = objc_getAssociatedObject((id)v79, (const void *)~v80);
        char v84 = [v83 unsignedIntegerValue];
        char v85 = v82 + 1;
        id v78 = v81;
        LOBYTE(v81) = (v84 + 1) ^ v85;

        v75 = v104;
        id v77 = v101;
        if ((v81 & 1) == 0)
        {
LABEL_55:

          BOOL v52 = v108;
          goto LABEL_56;
        }
        v97 = [v101 bundleSubscription];
        v98 = [v97 bundleChannelIDs];
        char v100 = [v98 containsObject:v78];

        v75 = v104;
        BOOL v52 = v108;
        if ((v100 & 1) == 0) {
LABEL_56:
        }
          int v63 = 1;
        else {
          int v63 = 0;
        }
      }
      else
      {
LABEL_49:
        v75 = v104;
      }

      [(FCHeadline *)v61 setShowSubscriptionRequiredText:v52 & v63];
      id v7 = v107;
      v86 = [v107 thumbnail];

      v36 = v105;
      id v8 = v106;
      if (v86)
      {
        v87 = [v106 assetManager];
        v88 = v105->_articleID;
        v89 = [v106 internalContentContext];
        v90 = [v89 contentDatabase];
        v91 = [v87 assetHandleForRecordID:v88 field:0 lifetimeHint:0 contentDatabase:v90];

        if (v91)
        {
          v92 = [v107 thumbnail];
          [v92 size];
          v93 = +[FCHeadlineThumbnail headlineThumbnailWithAssetHandle:thumbnailSize:](FCHeadlineThumbnail, "headlineThumbnailWithAssetHandle:thumbnailSize:", v91);
          [(FCHeadline *)v61 setThumbnail:v93];

          [(FCHeadline *)v61 setHasThumbnail:1];
          -[FCHeadline setThumbnailFocalFrame:](v61, "setThumbnailFocalFrame:", 0.0, 0.0, 1.0, 1.0);
        }

        v75 = v104;
      }
      deflatedHeadline = v105->_deflatedHeadline;
      v105->_deflatedHeadline = (FCHeadlineProviding *)v61;

      int v45 = 1;
      if (v105->_articleID)
      {
        v39 = v103;
        goto LABEL_66;
      }
      v46 = (FCTag *)v105;
      v36 = 0;
      v39 = v103;
    }
  }
  else
  {
    int v45 = 1;
    v46 = (FCTag *)v105;
    v36 = 0;
    id v8 = v106;
  }

LABEL_66:
  if (v45)
  {
LABEL_67:
    v36 = v36;
    v95 = v36;
  }
  else
  {
    v95 = 0;
  }

  return v95;
}

uint64_t __65__FCArticleSearchResult_initWithParsecSearchResult_cloudContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fc_isNewsArticleURL");
}

- (NSString)articleID
{
  return self->_articleID;
}

- (FCHeadlineProviding)deflatedHeadline
{
  return self->_deflatedHeadline;
}

- (FCHeadlineProviding)inflatedHeadline
{
  return self->_inflatedHeadline;
}

- (void)setInflatedHeadline:(id)a3
{
}

- (SFSearchResult)searchResult
{
  return self->_searchResult;
}

- (void)setSearchResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_inflatedHeadline, 0);
  objc_storeStrong((id *)&self->_deflatedHeadline, 0);
  objc_storeStrong((id *)&self->_articleID, 0);
}

@end