@interface FCIssueRecordSource
+ (id)_URLStringForCoverImageKey:(id)a3 inRecord:(id)a4;
- (id)alwaysLocalizedKeys;
- (id)localizableKeys;
- (id)nonLocalizableKeys;
- (id)recordFromCKRecord:(id)a3 base:(id)a4;
- (id)recordIDPrefixes;
- (id)recordType;
- (id)storeFilename;
- (int)pbRecordType;
- (unint64_t)highThresholdDataSizeLimit;
- (unint64_t)lowThresholdDataSizeLimit;
- (unint64_t)storeVersion;
@end

@implementation FCIssueRecordSource

- (id)recordIDPrefixes
{
  return &unk_1EF8D8838;
}

- (id)recordType
{
  return @"Issue";
}

- (unint64_t)storeVersion
{
  return 15;
}

- (id)storeFilename
{
  return @"issue-record-source";
}

- (int)pbRecordType
{
  return 10;
}

- (unint64_t)highThresholdDataSizeLimit
{
  return 20000000;
}

- (id)nonLocalizableKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__FCIssueRecordSource_nonLocalizableKeys__block_invoke;
  block[3] = &unk_1E5B4C018;
  block[4] = self;
  if (qword_1EB5D1028 != -1) {
    dispatch_once(&qword_1EB5D1028, block);
  }
  return (id)_MergedGlobals_141;
}

void __41__FCIssueRecordSource_nonLocalizableKeys__block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__FCIssueRecordSource_nonLocalizableKeys__block_invoke_2;
  v3[3] = &unk_1E5B4BF30;
  v3[4] = *(void *)(a1 + 32);
  uint64_t v1 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v3);
  v2 = (void *)_MergedGlobals_141;
  _MergedGlobals_141 = v1;
}

void __41__FCIssueRecordSource_nonLocalizableKeys__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 addObject:@"allArticleIDs"];
  [v3 addObject:@"allowedStorefrontIDs"];
  [v3 addObject:@"blockedStorefrontIDs"];
  [v3 addObject:@"channelTagID"];
  [v3 addObject:@"coverArticleID"];
  [v3 addObject:@"coverAspectRatio"];
  [v3 addObject:@"coverImage"];
  [v3 addObject:@"coverPrimaryColor"];
  [v3 addObject:@"coverBackgroundColor"];
  [v3 addObject:@"coverTextColor"];
  [v3 addObject:@"coverAccentColor"];
  [v3 addObject:@"description"];
  [v3 addObject:@"edition"];
  [v3 addObject:@"halfLife"];
  [v3 addObject:@"isDraft"];
  [v3 addObject:@"isPaid"];
  [v3 addObject:@"minNewsVersion"];
  [v3 addObject:@"layeredCover"];
  [v3 addObject:@"layeredCoverAspectRatio"];
  [v3 addObject:@"layeredCoverPrimaryColor"];
  [v3 addObject:@"metadataAssetEncrypted"];
  [v3 addObject:@"notificationDescription"];
  [v3 addObject:@"pdfResourceArchive"];
  [v3 addObject:@"publishDate"];
  [v3 addObject:@"title"];
  [v3 addObject:@"topicTagIDs"];
  [v3 addObject:@"type"];
  [v3 addObject:@"sortDate"];
  if ([(id)objc_opt_class() _useTaggedImages])
  {
    v2 = [@"coverImage" stringByAppendingString:@"2"];
    [v3 addObject:v2];
  }
}

- (id)localizableKeys
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)alwaysLocalizedKeys
{
  if (qword_1EB5D1038 != -1) {
    dispatch_once(&qword_1EB5D1038, &__block_literal_global_5);
  }
  v2 = (void *)qword_1EB5D1030;
  return v2;
}

uint64_t __42__FCIssueRecordSource_alwaysLocalizedKeys__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"scores", 0);
  uint64_t v1 = qword_1EB5D1030;
  qword_1EB5D1030 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (unint64_t)lowThresholdDataSizeLimit
{
  return 2000000;
}

- (id)recordFromCKRecord:(id)a3 base:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F82A78]);
  [v8 setBase:v7];
  v9 = [v6 objectForKey:@"allArticleIDs"];
  v10 = (void *)[v9 mutableCopy];
  [v8 setAllArticleIDs:v10];

  v11 = [v6 objectForKey:@"allowedStorefrontIDs"];
  v12 = (void *)[v11 mutableCopy];
  [v8 setAllowedStorefrontIDs:v12];

  v13 = [v6 objectForKey:@"blockedStorefrontIDs"];
  v14 = (void *)[v13 mutableCopy];
  [v8 setBlockedStorefrontIDs:v14];

  v15 = [v6 objectForKey:@"channelTagID"];
  [v8 setChannelTagID:v15];

  objc_opt_class();
  v16 = [v6 objectForKey:@"coverArticleID"];
  if (v16)
  {
    if (objc_opt_isKindOfClass()) {
      v17 = v16;
    }
    else {
      v17 = 0;
    }
  }
  else
  {
    v17 = 0;
  }
  id v18 = v17;
  [v8 setCoverArticleID:v18];

  objc_opt_class();
  v19 = [v6 objectForKey:@"coverAspectRatio"];
  if (v19)
  {
    if (objc_opt_isKindOfClass()) {
      v20 = v19;
    }
    else {
      v20 = 0;
    }
  }
  else
  {
    v20 = 0;
  }
  id v21 = v20;
  [v21 doubleValue];
  objc_msgSend(v8, "setCoverAspectRatio:");

  v22 = [(id)objc_opt_class() _URLStringForCoverImageKey:@"coverImage" inRecord:v6];
  [v8 setCoverImageURL:v22];

  v23 = [v6 objectForKey:@"coverPrimaryColor"];
  [v8 setCoverPrimaryColor:v23];

  v24 = [v6 objectForKey:@"coverBackgroundColor"];
  [v8 setCoverBackgroundColor:v24];

  v25 = [v6 objectForKey:@"coverTextColor"];
  [v8 setCoverTextColor:v25];

  v26 = [v6 objectForKey:@"coverAccentColor"];
  [v8 setCoverAccentColor:v26];

  v27 = [v6 objectForKey:@"edition"];
  [v8 setEdition:v27];

  v28 = [v6 objectForKey:@"halfLife"];
  objc_msgSend(v8, "setHalfLifeMilliseconds:", objc_msgSend(v28, "unsignedLongLongValue"));

  objc_opt_class();
  v29 = [v6 objectForKey:@"isDraft"];
  if (v29)
  {
    if (objc_opt_isKindOfClass()) {
      v30 = v29;
    }
    else {
      v30 = 0;
    }
  }
  else
  {
    v30 = 0;
  }
  id v31 = v30;
  objc_msgSend(v8, "setIsDraft:", objc_msgSend(v31, "BOOLValue"));

  objc_opt_class();
  v32 = [v6 objectForKey:@"isPaid"];
  if (v32)
  {
    if (objc_opt_isKindOfClass()) {
      v33 = v32;
    }
    else {
      v33 = 0;
    }
  }
  else
  {
    v33 = 0;
  }
  id v34 = v33;
  objc_msgSend(v8, "setIsPaid:", objc_msgSend(v34, "BOOLValue"));

  v35 = [v6 objectForKey:@"description"];
  [v8 setIssueDescription:v35];

  v36 = [v6 objectForKey:@"minNewsVersion"];
  objc_msgSend(v8, "setMinimumNewsVersion:", +[FCRestrictions integerRepresentationOfShortVersionString:](FCRestrictions, "integerRepresentationOfShortVersionString:", v36));

  v37 = [v6 objectForKey:@"layeredCover"];
  [v8 setLayeredCover:v37];

  objc_opt_class();
  v38 = [v6 objectForKey:@"layeredCoverAspectRatio"];
  if (v38)
  {
    if (objc_opt_isKindOfClass()) {
      v39 = v38;
    }
    else {
      v39 = 0;
    }
  }
  else
  {
    v39 = 0;
  }
  id v40 = v39;
  [v40 doubleValue];
  objc_msgSend(v8, "setLayeredCoverAspectRatio:");

  v41 = [v6 objectForKey:@"layeredCoverPrimaryColor"];
  [v8 setLayeredCoverPrimaryColor:v41];

  v42 = [v6 objectForKey:@"notificationDescription"];
  [v8 setNotificationDescription:v42];

  objc_opt_class();
  v43 = [v6 objectForKey:@"pdfResourceArchive"];
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
  id v45 = v44;
  [v8 setPdfResourceArchiveURL:v45];

  v46 = [v6 objectForKey:@"publishDate"];
  v47 = [v46 pbDate];
  [v8 setPublishDate:v47];

  v48 = [v6 objectForKey:@"title"];
  [v8 setTitle:v48];

  v49 = [v6 objectForKey:@"topicTagIDs"];
  [v8 setTopicTagIDs:v49];

  v50 = [v6 objectForKey:@"sortDate"];
  v51 = [v50 pbDate];
  [v8 setSortDate:v51];

  v52 = [v6 objectForKey:@"type"];
  if ([v52 isEqualToString:@"flint"])
  {
    uint64_t v53 = 1;
  }
  else
  {
    if (![v52 isEqualToString:@"pdf"]) {
      goto LABEL_36;
    }
    uint64_t v53 = 2;
  }
  [v8 setType:v53];
LABEL_36:
  if ([v8 type] == 2)
  {
    objc_opt_class();
    v54 = [v6 objectForKey:@"metadataAssetEncrypted"];
    if (v54)
    {
      if (objc_opt_isKindOfClass()) {
        v55 = v54;
      }
      else {
        v55 = 0;
      }
    }
    else
    {
      v55 = 0;
    }
    id v57 = v55;

    if (v57) {
      [v8 setMetadataURL:v57];
    }
  }
  else
  {
    v56 = [v7 identifier];
    id v57 = +[FCRecordFieldURLProtocol URLForRecordID:v56 fieldName:@"metadataAsset"];

    v58 = [v57 absoluteString];
    [v8 setMetadataURL:v58];
  }
  v59 = [(FCRecordSource *)self localizedKeysByOriginalKey];
  v60 = [v59 objectForKeyedSubscript:@"scores"];
  v61 = [v6 objectForKey:v60];
  v62 = v61;
  if (v61)
  {
    id v63 = v61;
  }
  else
  {
    id v63 = [v6 objectForKey:@"scores"];
  }
  v64 = v63;

  v65 = (void *)[objc_alloc(MEMORY[0x1E4F82930]) initWithData:v64];
  [v8 setScores:v65];

  return v8;
}

+ (id)_URLStringForCoverImageKey:(id)a3 inRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 _useTaggedImages])
  {
    id v8 = [v6 stringByAppendingString:@"2"];
    objc_opt_class();
    v9 = [v7 objectForKeyedSubscript:v8];
    if (v9 && (objc_opt_isKindOfClass() & 1) != 0)
    {
      id v10 = v9;
      id v11 = v10;
    }
    else
    {
      objc_opt_class();
      v13 = [v7 objectForKeyedSubscript:v6];
      if (v13)
      {
        if (objc_opt_isKindOfClass()) {
          v14 = v13;
        }
        else {
          v14 = 0;
        }
      }
      else
      {
        v14 = 0;
      }
      id v11 = v14;

      id v10 = 0;
    }
  }
  else
  {
    objc_opt_class();
    id v8 = [v7 objectForKeyedSubscript:v6];
    if (v8)
    {
      if (objc_opt_isKindOfClass()) {
        v12 = v8;
      }
      else {
        v12 = 0;
      }
    }
    else
    {
      v12 = 0;
    }
    id v11 = v12;
  }

  return v11;
}

@end