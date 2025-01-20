@interface NTHeadline
+ (BOOL)supportsSecureCoding;
- (BOOL)canBePurchased;
- (BOOL)hasGlobalUserFeedback;
- (BOOL)hasVideo;
- (BOOL)isANF;
- (BOOL)isBundlePaid;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExplicitContent;
- (BOOL)isFromBlockedStorefront;
- (BOOL)isHiddenFromAutoFavorites;
- (BOOL)isPaid;
- (BOOL)needsFeedItemHeadlinesFetch;
- (BOOL)needsPlaceholderThumbnail;
- (BOOL)needsSeenStateTracking;
- (BOOL)supportsSavingForLater;
- (CGRect)thumbnailFocalFrame;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)globalCohorts;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)publisherCohorts;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)globalConversionStats;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)publisherConversionStats;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata)publisherTagMetadata;
- (NSArray)surfacedByArticleListIDs;
- (NSArray)topicIDs;
- (NSArray)topics;
- (NSDate)ageDisplayDate;
- (NSDate)cacheCutoffTimeRelativeDate;
- (NSDate)cacheExpirationDate;
- (NSDate)publishDate;
- (NSString)clusterID;
- (NSString)compactSourceName;
- (NSString)description;
- (NSString)feedID;
- (NSString)identifier;
- (NSString)itemID;
- (NSString)language;
- (NSString)publisherID;
- (NSString)shortExcerpt;
- (NSString)sourceFeedID;
- (NSString)sourceName;
- (NSString)sourceTagID;
- (NSString)storyTypeColorDark;
- (NSString)storyTypeColorLight;
- (NSString)thumbnailIdentifier;
- (NSString)title;
- (NSString)titleCompact;
- (NSString)videoCallToActionTitle;
- (NSURL)NewsURL;
- (NSURL)compactSourceNameImageRemoteURL;
- (NSURL)flintDocumentURL;
- (NSURL)sourceNameImageRemoteURL;
- (NSURL)thumbnailRemoteURL;
- (NSURL)videoCallToActionURL;
- (NTHeadline)init;
- (NTHeadline)initWithCoder:(id)a3;
- (NTHeadline)initWithIdentifier:(id)a3;
- (NTHeadlinePersonalizationMetadata)personalizationMetadata;
- (NTPBFeedItem)feedItemForHeadlineFetch;
- (NTPBHeadlineAdElement)adElement;
- (NTPBHeadlineAnalyticsElement)analyticsElement;
- (NTPBHeadlineBackingElement)backingElement;
- (double)globalUserFeedback;
- (double)sourceNameImageScale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)protoitemWithFetchedFeedItemHeadline:(id)a3 configuration:(id)a4;
- (int64_t)minimumNewsVersion;
- (int64_t)publisherArticleVersion;
- (unint64_t)contentType;
- (unint64_t)feedHalfLifeMilliseconds;
- (unint64_t)halfLife;
- (unint64_t)hash;
- (unint64_t)itemType;
- (unint64_t)order;
- (unint64_t)publishDateMilliseconds;
- (unint64_t)storyType;
- (unint64_t)thumbnailSizePreset;
- (unint64_t)todayItemType;
- (void)encodeWithCoder:(id)a3;
- (void)setAdElement:(id)a3;
- (void)setAgeDisplayDate:(id)a3;
- (void)setAnalyticsElement:(id)a3;
- (void)setBackingElement:(id)a3;
- (void)setCompactSourceName:(id)a3;
- (void)setCompactSourceNameImageRemoteURL:(id)a3;
- (void)setFlintDocumentURL:(id)a3;
- (void)setHiddenFromAutoFavorites:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsBundlePaid:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setNeedsPlaceholderThumbnail:(BOOL)a3;
- (void)setNeedsSeenStateTracking:(BOOL)a3;
- (void)setNewsURL:(id)a3;
- (void)setPersonalizationMetadata:(id)a3;
- (void)setShortExcerpt:(id)a3;
- (void)setSourceName:(id)a3;
- (void)setSourceNameImageRemoteURL:(id)a3;
- (void)setSourceNameImageScale:(double)a3;
- (void)setSourceTagID:(id)a3;
- (void)setStoryType:(id)a3;
- (void)setStoryTypeColorDark:(id)a3;
- (void)setStoryTypeColorLight:(id)a3;
- (void)setSupportsSavingForLater:(BOOL)a3;
- (void)setThumbnailFocalFrame:(CGRect)a3;
- (void)setThumbnailIdentifier:(id)a3;
- (void)setThumbnailRemoteURL:(id)a3;
- (void)setThumbnailSizePreset:(unint64_t)a3;
- (void)setTitle:(id)a3;
- (void)setTitleCompact:(id)a3;
- (void)setTopicIDs:(id)a3;
- (void)setVideoCallToActionTitle:(id)a3;
- (void)setVideoCallToActionURL:(id)a3;
@end

@implementation NTHeadline

- (NTHeadline)initWithCoder:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTHeadline initWithCoder:]();
  }
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v6 = [(NTHeadline *)self initWithIdentifier:v5];
  if (v6)
  {
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v6->_title;
    v6->_title = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"titleCompact"];
    titleCompact = v6->_titleCompact;
    v6->_titleCompact = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shortExcerpt"];
    shortExcerpt = v6->_shortExcerpt;
    v6->_shortExcerpt = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ageDisplayDate"];
    ageDisplayDate = v6->_ageDisplayDate;
    v6->_ageDisplayDate = (NSDate *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceName"];
    sourceName = v6->_sourceName;
    v6->_sourceName = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"compactSourceName"];
    compactSourceName = v6->_compactSourceName;
    v6->_compactSourceName = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceIdentifier"];
    sourceTagID = v6->_sourceTagID;
    v6->_sourceTagID = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"language"];
    language = v6->_language;
    v6->_language = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceNameImageRemoteURL"];
    sourceNameImageRemoteURL = v6->_sourceNameImageRemoteURL;
    v6->_sourceNameImageRemoteURL = (NSURL *)v23;

    [v4 decodeDoubleForKey:@"sourceNameImageScale"];
    v6->_sourceNameImageScale = v25;
    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"compactSourceNameImageRemoteURL"];
    compactSourceNameImageRemoteURL = v6->_compactSourceNameImageRemoteURL;
    v6->_compactSourceNameImageRemoteURL = (NSURL *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"thumbnailRemoteURL"];
    thumbnailRemoteURL = v6->_thumbnailRemoteURL;
    v6->_thumbnailRemoteURL = (NSURL *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"thumbnailIdentifier"];
    thumbnailIdentifier = v6->_thumbnailIdentifier;
    v6->_thumbnailIdentifier = (NSString *)v30;

    v6->_thumbnailSizePreset = [v4 decodeIntegerForKey:@"thumbnailSizePreset"];
    v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"thumbnailFocalFrame"];
    objc_msgSend(v32, "nf_CGRectValue");
    v6->_thumbnailFocalFrame.origin.x = v33;
    v6->_thumbnailFocalFrame.origin.y = v34;
    v6->_thumbnailFocalFrame.size.width = v35;
    v6->_thumbnailFocalFrame.size.height = v36;

    v6->_needsPlaceholderThumbnail = [v4 decodeBoolForKey:@"needsPlaceholderThumbnail"];
    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NewsURL"];
    NewsURL = v6->_NewsURL;
    v6->_NewsURL = (NSURL *)v37;

    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storyType"];
    storyType = v6->_storyType;
    v6->_storyType = (NSString *)v39;

    uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storyTypeColorLight"];
    storyTypeColorLight = v6->_storyTypeColorLight;
    v6->_storyTypeColorLight = (NSString *)v41;

    uint64_t v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storyTypeColorDark"];
    storyTypeColorDark = v6->_storyTypeColorDark;
    v6->_storyTypeColorDark = (NSString *)v43;

    v45 = (void *)MEMORY[0x263EFFA08];
    uint64_t v46 = objc_opt_class();
    v47 = objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
    uint64_t v48 = [v4 decodeObjectOfClasses:v47 forKey:@"topicIDs"];
    topicIDs = v6->_topicIDs;
    v6->_topicIDs = (NSArray *)v48;

    uint64_t v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"analyticsElement"];
    analyticsElement = v6->_analyticsElement;
    v6->_analyticsElement = (NTPBHeadlineAnalyticsElement *)v50;

    uint64_t v52 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"adElement"];
    adElement = v6->_adElement;
    v6->_adElement = (NTPBHeadlineAdElement *)v52;

    uint64_t v54 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"personalizationMetadata"];
    personalizationMetadata = v6->_personalizationMetadata;
    v6->_personalizationMetadata = (NTHeadlinePersonalizationMetadata *)v54;

    uint64_t v56 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backingElement"];
    backingElement = v6->_backingElement;
    v6->_backingElement = (NTPBHeadlineBackingElement *)v56;

    v6->_supportsSavingForLater = [v4 decodeBoolForKey:@"supportsSavingForLater"];
    v6->_hiddenFromAutoFavorites = [v4 decodeBoolForKey:@"hiddenFromAutoFavorites"];
    uint64_t v58 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"flintDocumentURL"];
    flintDocumentURL = v6->_flintDocumentURL;
    v6->_flintDocumentURL = (NSURL *)v58;

    v6->_isBundlePaid = [v4 decodeBoolForKey:@"bundlePaid"];
  }

  return v6;
}

- (NTHeadline)initWithIdentifier:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTHeadline initWithIdentifier:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)NTHeadline;
  v5 = [(NTHeadline *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;
  }
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_flintDocumentURL, 0);
  objc_storeStrong((id *)&self->_videoCallToActionURL, 0);
  objc_storeStrong((id *)&self->_videoCallToActionTitle, 0);
  objc_storeStrong((id *)&self->_backingElement, 0);
  objc_storeStrong((id *)&self->_personalizationMetadata, 0);
  objc_storeStrong((id *)&self->_adElement, 0);
  objc_storeStrong((id *)&self->_analyticsElement, 0);
  objc_storeStrong((id *)&self->_topicIDs, 0);
  objc_storeStrong((id *)&self->_storyTypeColorDark, 0);
  objc_storeStrong((id *)&self->_storyTypeColorLight, 0);
  objc_storeStrong((id *)&self->_storyType, 0);
  objc_storeStrong((id *)&self->_NewsURL, 0);
  objc_storeStrong((id *)&self->_thumbnailIdentifier, 0);
  objc_storeStrong((id *)&self->_thumbnailRemoteURL, 0);
  objc_storeStrong((id *)&self->_compactSourceNameImageRemoteURL, 0);
  objc_storeStrong((id *)&self->_sourceNameImageRemoteURL, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_sourceTagID, 0);
  objc_storeStrong((id *)&self->_compactSourceName, 0);
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_ageDisplayDate, 0);
  objc_storeStrong((id *)&self->_shortExcerpt, 0);
  objc_storeStrong((id *)&self->_titleCompact, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)storyType
{
  return (unint64_t)self->_storyType;
}

- (NSURL)sourceNameImageRemoteURL
{
  return self->_sourceNameImageRemoteURL;
}

- (void)setShortExcerpt:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[NTHeadline allocWithZone:a3];
  v5 = [(NTHeadline *)self identifier];
  uint64_t v6 = [(NTHeadline *)v4 initWithIdentifier:v5];

  uint64_t v7 = [(NTHeadline *)self title];
  [(NTHeadline *)v6 setTitle:v7];

  v8 = [(NTHeadline *)self titleCompact];
  [(NTHeadline *)v6 setTitleCompact:v8];

  objc_super v9 = [(NTHeadline *)self shortExcerpt];
  [(NTHeadline *)v6 setShortExcerpt:v9];

  v10 = [(NTHeadline *)self ageDisplayDate];
  [(NTHeadline *)v6 setAgeDisplayDate:v10];

  uint64_t v11 = [(NTHeadline *)self sourceName];
  [(NTHeadline *)v6 setSourceName:v11];

  v12 = [(NTHeadline *)self compactSourceName];
  [(NTHeadline *)v6 setCompactSourceName:v12];

  uint64_t v13 = [(NTHeadline *)self sourceTagID];
  [(NTHeadline *)v6 setSourceTagID:v13];

  v14 = [(NTHeadline *)self language];
  [(NTHeadline *)v6 setLanguage:v14];

  uint64_t v15 = [(NTHeadline *)self sourceNameImageRemoteURL];
  [(NTHeadline *)v6 setSourceNameImageRemoteURL:v15];

  [(NTHeadline *)self sourceNameImageScale];
  -[NTHeadline setSourceNameImageScale:](v6, "setSourceNameImageScale:");
  v16 = [(NTHeadline *)self compactSourceNameImageRemoteURL];
  [(NTHeadline *)v6 setCompactSourceNameImageRemoteURL:v16];

  uint64_t v17 = [(NTHeadline *)self thumbnailRemoteURL];
  [(NTHeadline *)v6 setThumbnailRemoteURL:v17];

  v18 = [(NTHeadline *)self thumbnailIdentifier];
  [(NTHeadline *)v6 setThumbnailIdentifier:v18];

  [(NTHeadline *)v6 setThumbnailSizePreset:[(NTHeadline *)self thumbnailSizePreset]];
  [(NTHeadline *)self thumbnailFocalFrame];
  -[NTHeadline setThumbnailFocalFrame:](v6, "setThumbnailFocalFrame:");
  uint64_t v19 = [(NTHeadline *)self NewsURL];
  [(NTHeadline *)v6 setNewsURL:v19];

  v20 = [(NTHeadline *)self storyType];
  [(NTHeadline *)v6 setStoryType:v20];

  uint64_t v21 = [(NTHeadline *)self storyTypeColorLight];
  [(NTHeadline *)v6 setStoryTypeColorLight:v21];

  v22 = [(NTHeadline *)self storyTypeColorDark];
  [(NTHeadline *)v6 setStoryTypeColorDark:v22];

  uint64_t v23 = [(NTHeadline(Placeholder) *)self topicIDs];
  [(NTHeadline *)v6 setTopicIDs:v23];

  v24 = [(NTHeadline *)self shortExcerpt];
  [(NTHeadline *)v6 setShortExcerpt:v24];

  double v25 = [(NTHeadline *)self analyticsElement];
  [(NTHeadline *)v6 setAnalyticsElement:v25];

  uint64_t v26 = [(NTHeadline *)self adElement];
  [(NTHeadline *)v6 setAdElement:v26];

  [(NTHeadline *)v6 setSupportsSavingForLater:[(NTHeadline *)self supportsSavingForLater]];
  [(NTHeadline *)v6 setHiddenFromAutoFavorites:[(NTHeadline(Placeholder) *)self isHiddenFromAutoFavorites]];
  v27 = [(NTHeadline *)self personalizationMetadata];
  [(NTHeadline *)v6 setPersonalizationMetadata:v27];

  uint64_t v28 = [(NTHeadline *)self backingElement];
  [(NTHeadline *)v6 setBackingElement:v28];

  v29 = [(NTHeadline *)self flintDocumentURL];
  [(NTHeadline *)v6 setFlintDocumentURL:v29];

  [(NTHeadline *)v6 setIsBundlePaid:[(NTHeadline *)self isBundlePaid]];
  return v6;
}

- (NSString)shortExcerpt
{
  return self->_shortExcerpt;
}

- (NSDate)ageDisplayDate
{
  return self->_ageDisplayDate;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = FCDynamicCast();

  if (v5)
  {
    uint64_t v6 = [(NTHeadline *)self identifier];
    uint64_t v7 = [v5 identifier];
    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(NTHeadline *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)sourceName
{
  return self->_sourceName;
}

- (NSString)titleCompact
{
  return self->_titleCompact;
}

- (NSString)sourceTagID
{
  return self->_sourceTagID;
}

- (void)setSourceName:(id)a3
{
}

- (BOOL)supportsSavingForLater
{
  return self->_supportsSavingForLater;
}

- (BOOL)isBundlePaid
{
  return self->_isBundlePaid;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)itemType
{
  return 0;
}

- (void)setNeedsPlaceholderThumbnail:(BOOL)a3
{
  self->_needsPlaceholderThumbnail = a3;
}

- (BOOL)needsPlaceholderThumbnail
{
  return self->_needsPlaceholderThumbnail;
}

- (NSDate)cacheCutoffTimeRelativeDate
{
  return (NSDate *)[MEMORY[0x263EFF910] date];
}

- (NSDate)cacheExpirationDate
{
  return (NSDate *)[MEMORY[0x263EFF910] distantFuture];
}

- (NSString)clusterID
{
  return 0;
}

- (NTPBFeedItem)feedItemForHeadlineFetch
{
  return 0;
}

- (BOOL)needsFeedItemHeadlinesFetch
{
  return 0;
}

- (unint64_t)todayItemType
{
  return 0;
}

- (id)protoitemWithFetchedFeedItemHeadline:(id)a3 configuration:(id)a4
{
  return 0;
}

- (NSString)feedID
{
  return 0;
}

- (unint64_t)contentType
{
  return 2;
}

- (unint64_t)order
{
  return 0;
}

- (unint64_t)publishDateMilliseconds
{
  return 0;
}

- (unint64_t)feedHalfLifeMilliseconds
{
  return 0;
}

- (double)globalUserFeedback
{
  return 0.0;
}

- (BOOL)isFromBlockedStorefront
{
  return 0;
}

- (BOOL)isExplicitContent
{
  return 0;
}

- (int64_t)minimumNewsVersion
{
  return 0;
}

- (int64_t)publisherArticleVersion
{
  return 0;
}

- (BOOL)canBePurchased
{
  return 1;
}

- (NSString)sourceFeedID
{
  return 0;
}

- (NSString)itemID
{
  return 0;
}

- (NSDate)publishDate
{
  return 0;
}

- (unint64_t)halfLife
{
  return 0;
}

- (NSString)publisherID
{
  return 0;
}

- (BOOL)hasGlobalUserFeedback
{
  return 0;
}

- (BOOL)isANF
{
  return 1;
}

- (BOOL)isPaid
{
  return 0;
}

- (BOOL)hasVideo
{
  return 0;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)globalCohorts
{
  return 0;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)publisherCohorts
{
  return 0;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)globalConversionStats
{
  return 0;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)publisherConversionStats
{
  return 0;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata)publisherTagMetadata
{
  return 0;
}

- (NSArray)topics
{
  return 0;
}

- (NSArray)surfacedByArticleListIDs
{
  return (NSArray *)MEMORY[0x263EFFA68];
}

- (NTHeadline)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    char v8 = "-[NTHeadline init]";
    __int16 v9 = 2080;
    v10 = "NTHeadline.m";
    __int16 v11 = 1024;
    int v12 = 26;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  unint64_t v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTHeadline init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NSString)description
{
  unint64_t v3 = [MEMORY[0x263F59420] descriptionWithObject:self];
  uint64_t v4 = [(NTHeadline *)self title];
  [v3 addField:@"title" value:v4];

  v5 = [(NTHeadline *)self identifier];
  [v3 addField:@"identifier" object:v5];

  id v6 = [(NTHeadline *)self shortExcerpt];
  [v3 addField:@"shortExcerpt" object:v6];

  uint64_t v7 = [(NTHeadline *)self sourceTagID];
  [v3 addField:@"sourceTagID" object:v7];

  char v8 = [(NTHeadline *)self sourceName];
  [v3 addField:@"sourceName" object:v8];

  __int16 v9 = [(NTHeadline *)self sourceNameImageRemoteURL];
  [v3 addField:@"sourceNameImageRemoteURL" object:v9];

  v10 = [(NTHeadline *)self thumbnailRemoteURL];
  [v3 addField:@"thumbnailRemoteURL" object:v10];

  __int16 v11 = [v3 descriptionString];

  return (NSString *)v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTHeadline encodeWithCoder:]();
  }
  v5 = [(NTHeadline *)self title];
  [v4 encodeObject:v5 forKey:@"title"];

  id v6 = [(NTHeadline *)self titleCompact];
  [v4 encodeObject:v6 forKey:@"titleCompact"];

  uint64_t v7 = [(NTHeadline *)self shortExcerpt];
  [v4 encodeObject:v7 forKey:@"shortExcerpt"];

  char v8 = [(NTHeadline *)self identifier];
  [v4 encodeObject:v8 forKey:@"identifier"];

  __int16 v9 = [(NTHeadline *)self ageDisplayDate];
  [v4 encodeObject:v9 forKey:@"ageDisplayDate"];

  v10 = [(NTHeadline *)self sourceName];
  [v4 encodeObject:v10 forKey:@"sourceName"];

  __int16 v11 = [(NTHeadline *)self compactSourceName];
  [v4 encodeObject:v11 forKey:@"compactSourceName"];

  int v12 = [(NTHeadline *)self sourceTagID];
  [v4 encodeObject:v12 forKey:@"sourceIdentifier"];

  __int16 v13 = [(NTHeadline *)self language];
  [v4 encodeObject:v13 forKey:@"language"];

  v14 = [(NTHeadline *)self sourceNameImageRemoteURL];
  if (v14) {
    [v4 encodeObject:v14 forKey:@"sourceNameImageRemoteURL"];
  }
  [(NTHeadline *)self sourceNameImageScale];
  objc_msgSend(v4, "encodeDouble:forKey:", @"sourceNameImageScale");
  uint64_t v15 = [(NTHeadline *)self compactSourceNameImageRemoteURL];
  if (v15) {
    [v4 encodeObject:v15 forKey:@"compactSourceNameImageRemoteURL"];
  }
  v16 = [(NTHeadline *)self thumbnailRemoteURL];
  if (v16) {
    [v4 encodeObject:v16 forKey:@"thumbnailRemoteURL"];
  }
  uint64_t v17 = [(NTHeadline *)self thumbnailIdentifier];
  if (v17) {
    [v4 encodeObject:v17 forKey:@"thumbnailIdentifier"];
  }
  objc_msgSend(v4, "encodeInteger:forKey:", -[NTHeadline thumbnailSizePreset](self, "thumbnailSizePreset"), @"thumbnailSizePreset");
  v18 = (void *)MEMORY[0x263F08D40];
  [(NTHeadline *)self thumbnailFocalFrame];
  uint64_t v19 = objc_msgSend(v18, "nf_valueWithCGRect:");
  [v4 encodeObject:v19 forKey:@"thumbnailFocalFrame"];

  objc_msgSend(v4, "encodeBool:forKey:", -[NTHeadline needsPlaceholderThumbnail](self, "needsPlaceholderThumbnail"), @"needsPlaceholderThumbnail");
  v20 = [(NTHeadline *)self NewsURL];
  [v4 encodeObject:v20 forKey:@"NewsURL"];

  uint64_t v21 = [(NTHeadline *)self storyType];
  [v4 encodeObject:v21 forKey:@"storyType"];

  v22 = [(NTHeadline *)self storyTypeColorLight];
  [v4 encodeObject:v22 forKey:@"storyTypeColorLight"];

  uint64_t v23 = [(NTHeadline *)self storyTypeColorDark];
  [v4 encodeObject:v23 forKey:@"storyTypeColorDark"];

  v24 = [(NTHeadline(Placeholder) *)self topicIDs];
  if (v24) {
    [v4 encodeObject:v24 forKey:@"topicIDs"];
  }
  double v25 = [(NTHeadline *)self analyticsElement];
  [v4 encodeObject:v25 forKey:@"analyticsElement"];

  uint64_t v26 = [(NTHeadline *)self personalizationMetadata];
  [v4 encodeObject:v26 forKey:@"personalizationMetadata"];

  v27 = [(NTHeadline *)self adElement];
  [v4 encodeObject:v27 forKey:@"adElement"];

  uint64_t v28 = [(NTHeadline *)self backingElement];
  [v4 encodeObject:v28 forKey:@"backingElement"];

  objc_msgSend(v4, "encodeBool:forKey:", -[NTHeadline supportsSavingForLater](self, "supportsSavingForLater"), @"supportsSavingForLater");
  objc_msgSend(v4, "encodeBool:forKey:", -[NTHeadline(Placeholder) isHiddenFromAutoFavorites](self, "isHiddenFromAutoFavorites"), @"hiddenFromAutoFavorites");
  v29 = [(NTHeadline *)self flintDocumentURL];
  [v4 encodeObject:v29 forKey:@"flintDocumentURL"];

  objc_msgSend(v4, "encodeBool:forKey:", -[NTHeadline isBundlePaid](self, "isBundlePaid"), @"bundlePaid");
}

- (void)setTitleCompact:(id)a3
{
}

- (void)setAgeDisplayDate:(id)a3
{
}

- (NSString)compactSourceName
{
  return self->_compactSourceName;
}

- (void)setCompactSourceName:(id)a3
{
}

- (void)setSourceTagID:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (void)setSourceNameImageRemoteURL:(id)a3
{
}

- (double)sourceNameImageScale
{
  return self->_sourceNameImageScale;
}

- (void)setSourceNameImageScale:(double)a3
{
  self->_sourceNameImageScale = a3;
}

- (NSURL)compactSourceNameImageRemoteURL
{
  return self->_compactSourceNameImageRemoteURL;
}

- (void)setCompactSourceNameImageRemoteURL:(id)a3
{
}

- (NSURL)thumbnailRemoteURL
{
  return self->_thumbnailRemoteURL;
}

- (void)setThumbnailRemoteURL:(id)a3
{
}

- (NSString)thumbnailIdentifier
{
  return self->_thumbnailIdentifier;
}

- (void)setThumbnailIdentifier:(id)a3
{
}

- (unint64_t)thumbnailSizePreset
{
  return self->_thumbnailSizePreset;
}

- (void)setThumbnailSizePreset:(unint64_t)a3
{
  self->_thumbnailSizePreset = a3;
}

- (CGRect)thumbnailFocalFrame
{
  double x = self->_thumbnailFocalFrame.origin.x;
  double y = self->_thumbnailFocalFrame.origin.y;
  double width = self->_thumbnailFocalFrame.size.width;
  double height = self->_thumbnailFocalFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setThumbnailFocalFrame:(CGRect)a3
{
  self->_thumbnailFocalFrame = a3;
}

- (NSURL)NewsURL
{
  return self->_NewsURL;
}

- (void)setNewsURL:(id)a3
{
}

- (void)setStoryType:(id)a3
{
}

- (NSString)storyTypeColorLight
{
  return self->_storyTypeColorLight;
}

- (void)setStoryTypeColorLight:(id)a3
{
}

- (NSString)storyTypeColorDark
{
  return self->_storyTypeColorDark;
}

- (void)setStoryTypeColorDark:(id)a3
{
}

- (NSArray)topicIDs
{
  return self->_topicIDs;
}

- (void)setTopicIDs:(id)a3
{
}

- (BOOL)needsSeenStateTracking
{
  return self->_needsSeenStateTracking;
}

- (void)setNeedsSeenStateTracking:(BOOL)a3
{
  self->_needsSeenStateTracking = a3;
}

- (void)setSupportsSavingForLater:(BOOL)a3
{
  self->_supportsSavingForLater = a3;
}

- (BOOL)isHiddenFromAutoFavorites
{
  return self->_hiddenFromAutoFavorites;
}

- (void)setHiddenFromAutoFavorites:(BOOL)a3
{
  self->_hiddenFromAutoFavorites = a3;
}

- (NTPBHeadlineAnalyticsElement)analyticsElement
{
  return self->_analyticsElement;
}

- (void)setAnalyticsElement:(id)a3
{
}

- (NTPBHeadlineAdElement)adElement
{
  return self->_adElement;
}

- (void)setAdElement:(id)a3
{
}

- (NTHeadlinePersonalizationMetadata)personalizationMetadata
{
  return self->_personalizationMetadata;
}

- (void)setPersonalizationMetadata:(id)a3
{
}

- (NTPBHeadlineBackingElement)backingElement
{
  return self->_backingElement;
}

- (void)setBackingElement:(id)a3
{
}

- (NSString)videoCallToActionTitle
{
  return self->_videoCallToActionTitle;
}

- (void)setVideoCallToActionTitle:(id)a3
{
}

- (NSURL)videoCallToActionURL
{
  return self->_videoCallToActionURL;
}

- (void)setVideoCallToActionURL:(id)a3
{
}

- (NSURL)flintDocumentURL
{
  return self->_flintDocumentURL;
}

- (void)setFlintDocumentURL:(id)a3
{
}

- (void)setIsBundlePaid:(BOOL)a3
{
  self->_isBundlePaid = a3;
}

- (void)setIdentifier:(id)a3
{
}

- (void)initWithIdentifier:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"identifier != nil", v6, 2u);
}

- (void)encodeWithCoder:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"aCoder", v6, 2u);
}

- (void)initWithCoder:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"aDecoder", v6, 2u);
}

@end