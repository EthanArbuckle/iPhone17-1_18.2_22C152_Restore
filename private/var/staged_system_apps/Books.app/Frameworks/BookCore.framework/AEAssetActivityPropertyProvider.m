@interface AEAssetActivityPropertyProvider
- (AEAssetActivityPropertyProvider)initWithPropertySource:(id)a3;
- (BOOL)contentProtected;
- (BOOL)isOwned;
- (BOOL)isStoreAsset;
- (NSString)activityType;
- (NSString)assetID;
- (NSString)assetTypeString;
- (NSString)author;
- (NSString)bookDescription;
- (NSString)epubID;
- (NSString)genre;
- (NSString)publisherLocation;
- (NSString)publisherName;
- (NSString)publisherYear;
- (NSString)readingDirection;
- (NSString)seriesTitle;
- (NSString)storeID;
- (NSString)title;
- (NSString)version;
- (NSURL)bookURL;
- (NSURL)storeShortURL;
- (NSURL)storeURL;
- (NSURL)storeURLPreferShort;
- (UIImage)assetCover;
- (id)checkOutBookStringWithCharacterLimit:(unint64_t)a3;
- (id)previewAssetCoverFuture;
- (id)previewAssetCoverItemProvider;
- (id)propertySource;
- (id)userPublishing:(id)a3 storeShortURLForStoreId:(id)a4;
- (id)userPublishing:(id)a3 storeURLForStoreId:(id)a4;
- (int64_t)assetType;
- (void)setActivityType:(id)a3;
- (void)setPropertySource:(id)a3;
@end

@implementation AEAssetActivityPropertyProvider

- (AEAssetActivityPropertyProvider)initWithPropertySource:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AEAssetActivityPropertyProvider;
  v5 = [(AEAssetActivityPropertyProvider *)&v9 init];
  if (v5)
  {
    id v6 = [v4 copy];
    id propertySource = v5->_propertySource;
    v5->_id propertySource = v6;
  }
  return v5;
}

- (NSString)assetID
{
  assetID = self->_assetID;
  if (!assetID)
  {
    id v4 = [(AEAssetActivityPropertyProvider *)self propertySource];
    v5 = [(AEAssetActivityPropertyProvider *)self activityType];
    ((void (**)(void, void *, __CFString *))v4)[2](v4, v5, AEAssetActivityItemProviderPropertyAssetId);
    id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_assetID;
    self->_assetID = v6;

    assetID = self->_assetID;
    if (!assetID)
    {
      v8 = [(AEAssetActivityPropertyProvider *)self storeID];
      objc_super v9 = self->_assetID;
      self->_assetID = v8;

      assetID = self->_assetID;
    }
  }

  return assetID;
}

- (NSString)storeID
{
  storeID = self->_storeID;
  if (!storeID)
  {
    id v4 = [(AEAssetActivityPropertyProvider *)self propertySource];
    v5 = [(AEAssetActivityPropertyProvider *)self activityType];
    ((void (**)(void, void *, __CFString *))v4)[2](v4, v5, AEAssetActivityItemProviderPropertyStoreId);
    id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_storeID;
    self->_storeID = v6;

    storeID = self->_storeID;
  }

  return storeID;
}

- (NSString)readingDirection
{
  v3 = [(AEAssetActivityPropertyProvider *)self propertySource];
  id v4 = [(AEAssetActivityPropertyProvider *)self activityType];
  v5 = ((void (**)(void, void *, __CFString *))v3)[2](v3, v4, AEAssetActivityItemProviderPropertyLanguage);

  NSLocaleLanguageDirection v6 = +[NSLocale characterDirectionForLanguage:v5];
  v7 = @"auto";
  if (v6 == NSLocaleLanguageDirectionRightToLeft) {
    v7 = @"rtl";
  }
  v8 = v7;

  return (NSString *)v8;
}

- (NSURL)storeURL
{
  storeURL = self->_storeURL;
  if (!storeURL)
  {
    id v4 = [(AEAssetActivityPropertyProvider *)self propertySource];
    v5 = [(AEAssetActivityPropertyProvider *)self activityType];
    ((void (**)(void, void *, __CFString *))v4)[2](v4, v5, AEAssetActivityItemProviderPropertyStoreUrl);
    NSLocaleLanguageDirection v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v7 = self->_storeURL;
    self->_storeURL = v6;

    storeURL = self->_storeURL;
  }

  return storeURL;
}

- (NSURL)storeShortURL
{
  storeShortURL = self->_storeShortURL;
  if (!storeShortURL)
  {
    id v4 = [(AEAssetActivityPropertyProvider *)self propertySource];
    v5 = [(AEAssetActivityPropertyProvider *)self activityType];
    ((void (**)(void, void *, __CFString *))v4)[2](v4, v5, AEAssetActivityItemProviderPropertyStoreShortUrl);
    NSLocaleLanguageDirection v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v7 = self->_storeShortURL;
    self->_storeShortURL = v6;

    storeShortURL = self->_storeShortURL;
  }

  return storeShortURL;
}

- (NSURL)storeURLPreferShort
{
  v3 = [(AEAssetActivityPropertyProvider *)self storeShortURL];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(AEAssetActivityPropertyProvider *)self storeURL];
  }
  NSLocaleLanguageDirection v6 = v5;

  return (NSURL *)v6;
}

- (NSURL)bookURL
{
  v3 = [(AEAssetActivityPropertyProvider *)self propertySource];
  id v4 = [(AEAssetActivityPropertyProvider *)self activityType];
  id v5 = ((void (**)(void, void *, __CFString *))v3)[2](v3, v4, AEAssetActivityItemProviderPropertyBookPath);

  if (v5)
  {
    NSLocaleLanguageDirection v6 = +[NSURL fileURLWithPath:v5];
  }
  else
  {
    NSLocaleLanguageDirection v6 = 0;
  }

  return (NSURL *)v6;
}

- (NSString)epubID
{
  epubID = self->_epubID;
  if (!epubID)
  {
    id v4 = [(AEAssetActivityPropertyProvider *)self propertySource];
    id v5 = [(AEAssetActivityPropertyProvider *)self activityType];
    ((void (**)(void, void *, __CFString *))v4)[2](v4, v5, AEAssetActivityItemProviderPropertyEpubId);
    NSLocaleLanguageDirection v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_epubID;
    self->_epubID = v6;

    epubID = self->_epubID;
  }

  return epubID;
}

- (UIImage)assetCover
{
  assetCover = self->_assetCover;
  if (!assetCover)
  {
    id v4 = [(AEAssetActivityPropertyProvider *)self propertySource];
    id v5 = [(AEAssetActivityPropertyProvider *)self activityType];
    ((void (**)(void, void *, __CFString *))v4)[2](v4, v5, AEAssetActivityItemProviderPropertyAssetCover);
    NSLocaleLanguageDirection v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v7 = self->_assetCover;
    self->_assetCover = v6;

    assetCover = self->_assetCover;
  }

  return assetCover;
}

- (NSString)title
{
  v3 = [(AEAssetActivityPropertyProvider *)self propertySource];
  id v4 = [(AEAssetActivityPropertyProvider *)self activityType];
  id v5 = ((void (**)(void, void *, __CFString *))v3)[2](v3, v4, AEAssetActivityItemProviderPropertyTitle);

  return (NSString *)v5;
}

- (NSString)author
{
  v3 = [(AEAssetActivityPropertyProvider *)self propertySource];
  id v4 = [(AEAssetActivityPropertyProvider *)self activityType];
  id v5 = ((void (**)(void, void *, __CFString *))v3)[2](v3, v4, AEAssetActivityItemProviderPropertyAuthor);

  return (NSString *)v5;
}

- (NSString)publisherLocation
{
  v3 = [(AEAssetActivityPropertyProvider *)self propertySource];
  id v4 = [(AEAssetActivityPropertyProvider *)self activityType];
  id v5 = ((void (**)(void, void *, __CFString *))v3)[2](v3, v4, AEAssetActivityItemProviderPropertyPublisherLocation);

  return (NSString *)v5;
}

- (NSString)publisherName
{
  v3 = [(AEAssetActivityPropertyProvider *)self propertySource];
  id v4 = [(AEAssetActivityPropertyProvider *)self activityType];
  id v5 = ((void (**)(void, void *, __CFString *))v3)[2](v3, v4, AEAssetActivityItemProviderPropertyPublisherName);

  return (NSString *)v5;
}

- (NSString)publisherYear
{
  v3 = [(AEAssetActivityPropertyProvider *)self propertySource];
  id v4 = [(AEAssetActivityPropertyProvider *)self activityType];
  id v5 = ((void (**)(void, void *, __CFString *))v3)[2](v3, v4, AEAssetActivityItemProviderPropertyPublisherYear);

  return (NSString *)v5;
}

- (NSString)genre
{
  v3 = [(AEAssetActivityPropertyProvider *)self propertySource];
  id v4 = [(AEAssetActivityPropertyProvider *)self activityType];
  id v5 = ((void (**)(void, void *, __CFString *))v3)[2](v3, v4, AEAssetActivityItemProviderPropertyGenre);

  return (NSString *)v5;
}

- (BOOL)contentProtected
{
  v3 = [(AEAssetActivityPropertyProvider *)self propertySource];
  id v4 = [(AEAssetActivityPropertyProvider *)self activityType];
  id v5 = ((void (**)(void, void *, __CFString *))v3)[2](v3, v4, AEAssetActivityItemProviderPropertyIsContentProtected);
  unsigned __int8 v6 = [v5 BOOLValue];

  return v6;
}

- (NSString)assetTypeString
{
  v3 = [(AEAssetActivityPropertyProvider *)self propertySource];
  id v4 = [(AEAssetActivityPropertyProvider *)self activityType];
  id v5 = ((void (**)(void, void *, __CFString *))v3)[2](v3, v4, AEAssetActivityItemProviderPropertyAssetType);

  unsigned __int8 v6 = [v5 lastPathComponent];

  return (NSString *)v6;
}

- (int64_t)assetType
{
  v2 = [(AEAssetActivityPropertyProvider *)self assetTypeString];
  int64_t v3 = BCAssetContentTypeFromAssetTypeString(v2);

  return v3;
}

- (BOOL)isOwned
{
  objc_opt_class();
  int64_t v3 = [(AEAssetActivityPropertyProvider *)self propertySource];
  id v4 = [(AEAssetActivityPropertyProvider *)self activityType];
  id v5 = ((void (**)(void, void *, __CFString *))v3)[2](v3, v4, AEAssetActivityItemProviderPropertyIsOwned);
  unsigned __int8 v6 = BUDynamicCast();

  LOBYTE(v4) = [v6 BOOLValue];
  return (char)v4;
}

- (BOOL)isStoreAsset
{
  v2 = [(AEAssetActivityPropertyProvider *)self storeID];
  BOOL v3 = [v2 longLongValue] != 0;

  return v3;
}

- (NSString)bookDescription
{
  BOOL v3 = [(AEAssetActivityPropertyProvider *)self propertySource];
  id v4 = [(AEAssetActivityPropertyProvider *)self activityType];
  id v5 = ((void (**)(void, void *, __CFString *))v3)[2](v3, v4, AEAssetActivityItemProviderPropertyBookDescription);

  return (NSString *)v5;
}

- (NSString)seriesTitle
{
  BOOL v3 = [(AEAssetActivityPropertyProvider *)self propertySource];
  id v4 = [(AEAssetActivityPropertyProvider *)self activityType];
  id v5 = ((void (**)(void, void *, __CFString *))v3)[2](v3, v4, AEAssetActivityItemProviderPropertySeriesTitle);

  return (NSString *)v5;
}

- (NSString)version
{
  BOOL v3 = [(AEAssetActivityPropertyProvider *)self propertySource];
  id v4 = [(AEAssetActivityPropertyProvider *)self activityType];
  id v5 = ((void (**)(void, void *, __CFString *))v3)[2](v3, v4, AEAssetActivityItemProviderPropertyVersion);

  return (NSString *)v5;
}

- (id)checkOutBookStringWithCharacterLimit:(unint64_t)a3
{
  int64_t v5 = [(AEAssetActivityPropertyProvider *)self assetType];
  unsigned int v6 = [(AEAssetActivityPropertyProvider *)self isStoreAsset];
  v7 = IMCommonCoreBundle();
  v8 = v7;
  CFStringRef v9 = @"Check out this book on Apple Books:";
  if (v5 == 6) {
    CFStringRef v9 = @"Check out this audiobook on Apple Books:";
  }
  CFStringRef v10 = @"Check out this audiobook:";
  if (v5 != 6) {
    CFStringRef v10 = @"Check out this book:";
  }
  if (v6) {
    CFStringRef v11 = v9;
  }
  else {
    CFStringRef v11 = v10;
  }
  v12 = [v7 localizedStringForKey:v11 value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];

  v13 = IMCommonCoreBundle();
  v14 = [v13 localizedStringForKey:@"\\U201C%@\\U201D by %@" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];
  v15 = [(AEAssetActivityPropertyProvider *)self title];
  v16 = [(AEAssetActivityPropertyProvider *)self author];
  v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v15, v16);

  v18 = +[NSString stringWithFormat:@"%@ %@", v12, v17];
  if ((unint64_t)[v18 length] > a3)
  {
    v19 = [(AEAssetActivityPropertyProvider *)self title];
    uint64_t v20 = +[NSString stringWithFormat:@"%@ %@", v12, v19];

    v18 = (void *)v20;
  }
  if ((unint64_t)[v18 length] > a3)
  {
    uint64_t v21 = [(AEAssetActivityPropertyProvider *)self title];

    v18 = (void *)v21;
  }
  if ((unint64_t)[v18 length] > a3)
  {
    v22 = [(AEAssetActivityPropertyProvider *)self title];
    v23 = IMCommonCoreBundle();
    v24 = [v23 localizedStringForKey:@"\\U2026" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];
    uint64_t v25 = [v22 stringByTruncatingToLength:a3 options:3 truncationString:v24];

    v18 = (void *)v25;
  }

  return v18;
}

- (id)previewAssetCoverItemProvider
{
  id v3 = [(AEAssetActivityPropertyProvider *)self previewAssetCoverFuture];

  if (v3)
  {
    id v3 = objc_alloc_init((Class)NSItemProvider);
    id v4 = [UTTypePNG identifier];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_82D88;
    v6[3] = &unk_2C7128;
    v6[4] = self;
    [v3 registerItemForTypeIdentifier:v4 loadHandler:v6];
  }

  return v3;
}

- (id)previewAssetCoverFuture
{
  previewAssetCoverFuture = self->_previewAssetCoverFuture;
  if (!previewAssetCoverFuture)
  {
    id v4 = [(AEAssetActivityPropertyProvider *)self propertySource];
    int64_t v5 = [(AEAssetActivityPropertyProvider *)self activityType];
    ((void (**)(void, void *, __CFString *))v4)[2](v4, v5, AEAssetActivityItemProviderPropertyPreviewAssetCoverFuture);
    unsigned int v6 = (BCFutureValue *)objc_claimAutoreleasedReturnValue();
    v7 = self->_previewAssetCoverFuture;
    self->_previewAssetCoverFuture = v6;

    previewAssetCoverFuture = self->_previewAssetCoverFuture;
  }

  return previewAssetCoverFuture;
}

- (id)userPublishing:(id)a3 storeURLForStoreId:(id)a4
{
  int64_t v5 = [(AEAssetActivityPropertyProvider *)self propertySource];
  unsigned int v6 = [(AEAssetActivityPropertyProvider *)self activityType];
  v7 = ((void (**)(void, void *, __CFString *))v5)[2](v5, v6, AEAssetActivityItemProviderPropertyStoreUrl);

  return v7;
}

- (id)userPublishing:(id)a3 storeShortURLForStoreId:(id)a4
{
  int64_t v5 = [(AEAssetActivityPropertyProvider *)self propertySource];
  unsigned int v6 = [(AEAssetActivityPropertyProvider *)self activityType];
  v7 = ((void (**)(void, void *, __CFString *))v5)[2](v5, v6, AEAssetActivityItemProviderPropertyStoreShortUrl);

  return v7;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(id)a3
{
}

- (id)propertySource
{
  return self->_propertySource;
}

- (void)setPropertySource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_propertySource, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_previewAssetCoverFuture, 0);
  objc_storeStrong((id *)&self->_assetCover, 0);
  objc_storeStrong((id *)&self->_epubID, 0);
  objc_storeStrong((id *)&self->_storeShortURL, 0);
  objc_storeStrong((id *)&self->_storeURL, 0);
  objc_storeStrong((id *)&self->_storeID, 0);

  objc_storeStrong((id *)&self->_assetID, 0);
}

@end