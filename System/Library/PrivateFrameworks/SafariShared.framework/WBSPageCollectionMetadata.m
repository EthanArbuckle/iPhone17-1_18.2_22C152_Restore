@interface WBSPageCollectionMetadata
+ (NSArray)pageCollectionMetadataFormTypes;
- (BOOL)savedPageLooksLikeOriginal;
- (BOOL)writeMetadataJSONToURL:(id)a3 error:(id *)a4;
- (CGSize)viewportSize;
- (NSDictionary)dictionaryRepresentation;
- (NSString)formType;
- (NSString)indexFileName;
- (NSString)pageTitle;
- (NSString)screenCaptureFileName;
- (NSString)userAgent;
- (NSString)zipFileNameCandidate;
- (NSURL)url;
- (WBSPageCollectionMetadata)init;
- (id)_campaignName;
- (id)_languageAndRegion;
- (id)_workerID;
- (unint64_t)collectionMethod;
- (void)setCollectionMethod:(unint64_t)a3;
- (void)setFormType:(id)a3;
- (void)setIndexFileName:(id)a3;
- (void)setPageTitle:(id)a3;
- (void)setSavedPageLooksLikeOriginal:(BOOL)a3;
- (void)setScreenCaptureFileName:(id)a3;
- (void)setUrl:(id)a3;
- (void)setUserAgent:(id)a3;
- (void)setViewportSize:(CGSize)a3;
@end

@implementation WBSPageCollectionMetadata

- (WBSPageCollectionMetadata)init
{
  v20.receiver = self;
  v20.super_class = (Class)WBSPageCollectionMetadata;
  v2 = [(WBSPageCollectionMetadata *)&v20 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] now];
    creationDate = v2->_creationDate;
    v2->_creationDate = (NSDate *)v3;

    uint64_t v5 = mobileGestaltStringForQuery(@"j9Th5smJpdztHwc+i39zIg");
    platform = v2->_platform;
    v2->_platform = (NSString *)v5;

    uint64_t v7 = mobileGestaltStringForQuery(@"BuildVersion");
    osBuild = v2->_osBuild;
    v2->_osBuild = (NSString *)v7;

    v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.WebKit"];
    uint64_t v10 = objc_msgSend(v9, "safari_version");
    webkitVersion = v2->_webkitVersion;
    v2->_webkitVersion = (NSString *)v10;

    v12 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v13 = objc_msgSend(v12, "safari_version");
    safariVersion = v2->_safariVersion;
    v2->_safariVersion = (NSString *)v13;

    v2->_collectionMethod = 0;
    v15 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v16 = [v15 UUIDString];
    assetUUIDString = v2->_assetUUIDString;
    v2->_assetUUIDString = (NSString *)v16;

    v18 = v2;
  }

  return v2;
}

+ (NSArray)pageCollectionMetadataFormTypes
{
  return (NSArray *)&unk_1EFC22118;
}

- (NSString)zipFileNameCandidate
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v3 setDateFormat:@"yyyy-MM-dd"];
  v4 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v3 setLocale:v4];

  uint64_t v5 = [MEMORY[0x1E4F1C9C8] now];
  v6 = [v3 stringFromDate:v5];

  uint64_t v7 = [(WBSPageCollectionMetadata *)self _languageAndRegion];
  v8 = [v7 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

  v9 = [(NSURL *)self->_url host];
  uint64_t v10 = objc_msgSend(v9, "safari_highLevelDomainFromHost");

  v11 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-."];
  v12 = [v11 invertedSet];
  uint64_t v13 = [v10 componentsSeparatedByCharactersInSet:v12];

  v14 = objc_msgSend(v13, "safari_filterObjectsUsingBlock:", &__block_literal_global_55);
  v15 = [v14 componentsJoinedByString:@"-"];

  uint64_t v16 = NSString;
  v17 = [(WBSPageCollectionMetadata *)self _campaignName];
  v18 = [v16 stringWithFormat:@"%@_%@_%@_%@_%@.%@", v6, v8, v17, v15, self->_assetUUIDString, @"zip"];

  return (NSString *)v18;
}

BOOL __49__WBSPageCollectionMetadata_zipFileNameCandidate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 length] != 0;
}

- (id)_languageAndRegion
{
  id v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  v4 = [v3 localeIdentifier];

  if (self->_collectionMethod != 1)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v6 = [v5 objectForKey:@"SaveWebpageWithMetadataIntendedLanguageAndRegion"];

    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      v8 = (void *)v6;
    }
    else {
      v8 = v4;
    }
    if (isKindOfClass)
    {
      v9 = 0;
    }
    else
    {
      v4 = 0;
      v9 = (void *)v6;
    }

    v4 = v8;
  }
  return v4;
}

- (id)_campaignName
{
  if (self->_collectionMethod == 1)
  {
    v2 = @"SafariDebugMenu";
  }
  else
  {
    id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v2 = [v3 objectForKey:@"SaveWebpageWithMetadataCampaignName"];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v2 = @"SafariUnknown";
    }
  }
  return v2;
}

- (id)_workerID
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v2 stringForKey:@"SaveWebpageWithMetadataWorkerID"];

  return v3;
}

- (NSDictionary)dictionaryRepresentation
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v41[0] = @"date";
  id v3 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  v4 = [v3 stringFromDate:self->_creationDate];
  platform = self->_platform;
  v42[0] = v4;
  v42[1] = platform;
  v41[1] = @"platform";
  v41[2] = @"osBuild";
  long long v43 = *(_OWORD *)&self->_osBuild;
  v41[3] = @"webkitVersion";
  v41[4] = @"safariVersion";
  safariVersion = self->_safariVersion;
  v41[5] = @"languageAndRegion";
  uint64_t v6 = [(WBSPageCollectionMetadata *)self _languageAndRegion];
  v45 = v6;
  v41[6] = @"collectionMethod";
  unint64_t collectionMethod = self->_collectionMethod;
  v8 = @"SafariUnknown";
  if (collectionMethod == 1) {
    v8 = @"SafariDebugMenu";
  }
  if (collectionMethod == 2) {
    v9 = @"SafariManual";
  }
  else {
    v9 = v8;
  }
  uint64_t v10 = v9;
  assetUUIDString = self->_assetUUIDString;
  v46 = v10;
  v47 = assetUUIDString;
  v41[7] = @"assetUUID";
  v41[8] = @"campaignName";
  v12 = [(WBSPageCollectionMetadata *)self _campaignName];
  v48 = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:9];
  v14 = (void *)[v13 mutableCopy];

  v15 = [(NSURL *)self->_url absoluteString];
  BOOL v16 = v15 == 0;

  if (!v16)
  {
    v17 = [(NSURL *)self->_url absoluteString];
    [v14 setObject:v17 forKeyedSubscript:@"url"];
  }
  indexFileName = self->_indexFileName;
  if (indexFileName) {
    [v14 setObject:indexFileName forKeyedSubscript:@"indexFile"];
  }
  pageTitle = self->_pageTitle;
  if (pageTitle) {
    [v14 setObject:pageTitle forKeyedSubscript:@"pageTitle"];
  }
  userAgent = self->_userAgent;
  if (userAgent) {
    [v14 setObject:userAgent forKeyedSubscript:@"userAgent"];
  }
  screenCaptureFileName = self->_screenCaptureFileName;
  if (screenCaptureFileName) {
    [v14 setObject:screenCaptureFileName forKeyedSubscript:@"screenCapture"];
  }
  v22 = [(WBSPageCollectionMetadata *)self _workerID];
  BOOL v23 = v22 == 0;

  if (!v23)
  {
    v39 = @"workerID";
    v24 = [(WBSPageCollectionMetadata *)self _workerID];
    v40 = v24;
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    [v14 setObject:v25 forKeyedSubscript:@"diagnostics"];
  }
  if (self->_formType)
  {
    v26 = [v14 objectForKeyedSubscript:@"diagnostics"];
    formType = self->_formType;
    v37[0] = @"formType";
    v37[1] = @"savedPageLooksLikeOriginal";
    v38[0] = formType;
    v28 = [NSNumber numberWithBool:self->_savedPageLooksLikeOriginal];
    v38[1] = v28;
    v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
    v30 = objc_msgSend(v26, "safari_dictionaryByMergingWithDictionary:", v29);
    [v14 setObject:v30 forKeyedSubscript:@"diagnostics"];
  }
  if (self->_viewportSize.width != *MEMORY[0x1E4F1DB30]
    || self->_viewportSize.height != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v35[0] = @"x";
    v31 = objc_msgSend(NSNumber, "numberWithDouble:");
    v35[1] = @"y";
    v36[0] = v31;
    v32 = [NSNumber numberWithDouble:self->_viewportSize.height];
    v36[1] = v32;
    v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
    [v14 setObject:v33 forKeyedSubscript:@"viewportSize"];
  }
  return (NSDictionary *)v14;
}

- (BOOL)writeMetadataJSONToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(WBSPageCollectionMetadata *)self dictionaryRepresentation];
  id v8 = [NSString alloc];
  v9 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v7 options:9 error:a4];
  uint64_t v10 = (void *)[v8 initWithData:v9 encoding:4];

  if (a4 && *a4) {
    char v11 = 0;
  }
  else {
    char v11 = [v10 writeToURL:v6 atomically:0 encoding:4 error:a4];
  }

  return v11;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)pageTitle
{
  return self->_pageTitle;
}

- (void)setPageTitle:(id)a3
{
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
}

- (CGSize)viewportSize
{
  double width = self->_viewportSize.width;
  double height = self->_viewportSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setViewportSize:(CGSize)a3
{
  self->_viewportSize = a3;
}

- (NSString)indexFileName
{
  return self->_indexFileName;
}

- (void)setIndexFileName:(id)a3
{
}

- (NSString)screenCaptureFileName
{
  return self->_screenCaptureFileName;
}

- (void)setScreenCaptureFileName:(id)a3
{
}

- (NSString)formType
{
  return self->_formType;
}

- (void)setFormType:(id)a3
{
}

- (BOOL)savedPageLooksLikeOriginal
{
  return self->_savedPageLooksLikeOriginal;
}

- (void)setSavedPageLooksLikeOriginal:(BOOL)a3
{
  self->_savedPageLooksLikeOriginal = a3;
}

- (unint64_t)collectionMethod
{
  return self->_collectionMethod;
}

- (void)setCollectionMethod:(unint64_t)a3
{
  self->_unint64_t collectionMethod = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formType, 0);
  objc_storeStrong((id *)&self->_screenCaptureFileName, 0);
  objc_storeStrong((id *)&self->_indexFileName, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_pageTitle, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_assetUUIDString, 0);
  objc_storeStrong((id *)&self->_safariVersion, 0);
  objc_storeStrong((id *)&self->_webkitVersion, 0);
  objc_storeStrong((id *)&self->_osBuild, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end