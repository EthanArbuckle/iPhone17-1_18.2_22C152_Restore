@interface SSDownloadMetadata
+ (BOOL)supportsSecureCoding;
+ (id)_addPlaybackTypeToHLSPlaylistURLString:(id)a3;
- (BOOL)artworkIsPrerendered;
- (BOOL)hasHDR;
- (BOOL)hasMessagesExtension;
- (BOOL)is32BitOnly;
- (BOOL)isAutomaticDownload;
- (BOOL)isCompilation;
- (BOOL)isContentRestricted;
- (BOOL)isDeviceBasedVPP;
- (BOOL)isExplicitContent;
- (BOOL)isHLS;
- (BOOL)isHighDefinition;
- (BOOL)isMusicShow;
- (BOOL)isPremium;
- (BOOL)isRedownloadDownload;
- (BOOL)isRental;
- (BOOL)isSample;
- (BOOL)isSharedResource;
- (BOOL)isSoftwareKind;
- (BOOL)isTvTemplate;
- (BOOL)isVideosKind;
- (BOOL)launchProhibited;
- (BOOL)shouldDownloadAutomatically;
- (NSArray)MD5HashStrings;
- (NSArray)sinfs;
- (NSData)appReceiptData;
- (NSData)epubRightsData;
- (NSDate)releaseDate;
- (NSDictionary)dictionary;
- (NSDictionary)primaryAssetDictionary;
- (NSNumber)downloaderAccountIdentifier;
- (NSNumber)numberOfBytesToHash;
- (NSNumber)releaseYear;
- (NSNumber)rentalID;
- (NSNumber)requestPersistentID;
- (NSString)artistName;
- (NSString)copyright;
- (NSString)downloadKey;
- (NSString)fileExtension;
- (NSString)genre;
- (NSString)kind;
- (NSString)longDescription;
- (NSString)pageProgressionDirection;
- (NSString)preferredAssetFlavor;
- (NSString)redownloadActionParameters;
- (NSString)releaseDateString;
- (NSString)shortDescription;
- (NSString)sortArtistName;
- (NSString)sortCollectionName;
- (NSString)sortTitle;
- (NSString)thumbnailNewsstandBindingEdge;
- (NSString)thumbnailNewsstandBindingType;
- (NSString)title;
- (NSString)transactionIdentifier;
- (NSURL)cancelDownloadURL;
- (NSURL)fullSizeImageURL;
- (NSURL)hlsPlaylistURL;
- (NSURL)launchExtrasUrl;
- (NSURL)primaryAssetURL;
- (NSURL)thumbnailImageURL;
- (NSURL)transitMapDataURL;
- (SSDownloadMetadata)init;
- (SSDownloadMetadata)initWithCoder:(id)a3;
- (SSDownloadMetadata)initWithDictionary:(id)a3;
- (SSDownloadMetadata)initWithItem:(id)a3;
- (SSDownloadMetadata)initWithItem:(id)a3 offer:(id)a4;
- (SSDownloadMetadata)initWithKind:(id)a3;
- (SSDownloadMetadata)initWithXPCEncoding:(id)a3;
- (SSItemImageCollection)thumbnailImageCollection;
- (id)_assetDictionary;
- (id)_dateValueForValue:(id)a3;
- (id)_newDateFormatter;
- (id)_newImageCollectionWithURLString:(id)a3;
- (id)_releaseDateValue;
- (id)_stringValueForValue:(id)a3;
- (id)_thumbnailArtworkImage;
- (id)_urlValueForValue:(id)a3;
- (id)_valueForFirstAvailableTopLevelKey:(id)a3;
- (id)applicationIdentifier;
- (id)betaExternalVersionIdentifier;
- (id)bundleIdentifier;
- (id)cloudIdentifier;
- (id)collectionArtistName;
- (id)collectionIndexInCollectionGroup;
- (id)collectionName;
- (id)composerName;
- (id)contentRating;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyWritableMetadata;
- (id)copyXPCEncoding;
- (id)documentTargetIdentifier;
- (id)downloadPermalink;
- (id)downloadPolicy;
- (id)durationInMilliseconds;
- (id)enableExtensions;
- (id)episodeIdentifier;
- (id)episodeSortIdentifier;
- (id)indexInCollection;
- (id)longSeasonDescription;
- (id)messagesArtworkURL;
- (id)movementCount;
- (id)movementName;
- (id)movementNumber;
- (id)networkName;
- (id)newDownloadProperties;
- (id)numberOfCollectionsInCollectionGroup;
- (id)numberOfItemsInCollection;
- (id)podcastEpisodeGUID;
- (id)podcastFeedURL;
- (id)podcastType;
- (id)publicationVersion;
- (id)purchaseDate;
- (id)requiredDeviceCapabilities;
- (id)seasonNumber;
- (id)seriesName;
- (id)showComposer;
- (id)valueForFirstAvailableKey:(id)a3;
- (id)valueForMetadataKey:(id)a3;
- (id)variantIdentifier;
- (id)videoDetailsDictionary;
- (id)viewStoreItemURL;
- (id)workName;
- (int64_t)keyStyle;
- (unint64_t)artistIdentifier;
- (unint64_t)collectionIdentifier;
- (unint64_t)composerIdentifier;
- (unint64_t)genreIdentifier;
- (unint64_t)itemIdentifier;
- (unint64_t)preOrderIdentifier;
- (unint64_t)sagaIdentifier;
- (void)_setValue:(id)a3 forTopLevelKey:(id)a4;
- (void)_setValueCopy:(id)a3 forMetadataKey:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setArtistIdentifier:(unint64_t)a3;
- (void)setArtistName:(id)a3;
- (void)setArtworkIsPrerendered:(BOOL)a3;
- (void)setAutomaticDownload:(BOOL)a3;
- (void)setBetaExternalVersionIdentifier:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCancelDownloadURL:(id)a3;
- (void)setCloudIdentifier:(id)a3;
- (void)setCollectionArtistName:(id)a3;
- (void)setCollectionIdentifier:(unint64_t)a3;
- (void)setCollectionIndexInCollectionGroup:(id)a3;
- (void)setCollectionName:(id)a3;
- (void)setCompilation:(BOOL)a3;
- (void)setComposerIdentifier:(unint64_t)a3;
- (void)setComposerName:(id)a3;
- (void)setContentRating:(id)a3;
- (void)setCopyright:(id)a3;
- (void)setDeviceBasedVPP:(BOOL)a3;
- (void)setDictionary:(id)a3;
- (void)setDocumentTargetIdentifier:(id)a3;
- (void)setDownloadKey:(id)a3;
- (void)setDownloadPermalink:(id)a3;
- (void)setDownloadPolicy:(id)a3;
- (void)setDurationInMilliseconds:(id)a3;
- (void)setEnableExtensions:(id)a3;
- (void)setEpisodeIdentifier:(id)a3;
- (void)setEpisodeSortIdentifier:(id)a3;
- (void)setEpubRightsData:(id)a3;
- (void)setExplicitContent:(BOOL)a3;
- (void)setFileExtension:(id)a3;
- (void)setFullSizeImageURL:(id)a3;
- (void)setGenre:(id)a3;
- (void)setGenreIdentifier:(unint64_t)a3;
- (void)setHasMessagesExtension:(BOOL)a3;
- (void)setHighDefinition:(BOOL)a3;
- (void)setHlsPlaylistURL:(id)a3;
- (void)setIndexInCollection:(id)a3;
- (void)setItemIdentifier:(unint64_t)a3;
- (void)setKeyStyle:(int64_t)a3;
- (void)setKind:(id)a3;
- (void)setLaunchExtrasUrl:(id)a3;
- (void)setLaunchProhibited:(BOOL)a3;
- (void)setLongDescription:(id)a3;
- (void)setLongSeasonDescription:(id)a3;
- (void)setMD5HashStrings:(id)a3 numberOfBytesToHash:(id)a4;
- (void)setMessagesArtworkURL:(id)a3;
- (void)setMusicShow:(BOOL)a3;
- (void)setNetworkName:(id)a3;
- (void)setNumberOfCollectionsInCollectionGroup:(id)a3;
- (void)setNumberOfItemsInCollection:(id)a3;
- (void)setPageProgressionDirection:(id)a3;
- (void)setPodcastEpisodeGUID:(id)a3;
- (void)setPodcastFeedURL:(id)a3;
- (void)setPodcastType:(id)a3;
- (void)setPreOrderIdentifier:(unint64_t)a3;
- (void)setPreferredAssetFlavor:(id)a3;
- (void)setPrimaryAssetURL:(id)a3;
- (void)setPublicationVersion:(id)a3;
- (void)setPurchaseDate:(id)a3;
- (void)setRedownloadActionParameters:(id)a3;
- (void)setRedownloadDownload:(BOOL)a3;
- (void)setReleaseDate:(id)a3;
- (void)setReleaseDateString:(id)a3;
- (void)setReleaseYear:(id)a3;
- (void)setRental:(BOOL)a3;
- (void)setRentalID:(id)a3;
- (void)setRequestPersistentID:(id)a3;
- (void)setRequiredDeviceCapabilities:(id)a3;
- (void)setSagaIdentifier:(unint64_t)a3;
- (void)setSample:(BOOL)a3;
- (void)setSeasonNumber:(id)a3;
- (void)setSeriesName:(id)a3;
- (void)setSharedResource:(BOOL)a3;
- (void)setShortDescription:(id)a3;
- (void)setShouldDownloadAutomatically:(BOOL)a3;
- (void)setSinfs:(id)a3;
- (void)setSortArtistName:(id)a3;
- (void)setSortCollectionName:(id)a3;
- (void)setSortTitle:(id)a3;
- (void)setThumbnailImageURL:(id)a3;
- (void)setThumbnailNewsstandBindingEdge:(id)a3;
- (void)setThumbnailNewsstandBindingType:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTransactionIdentifier:(id)a3;
- (void)setTransitMapDataURL:(id)a3;
- (void)setTvTemplate:(BOOL)a3;
- (void)setValue:(id)a3 forMetadataKey:(id)a4;
- (void)setValuesFromDownload:(id)a3;
- (void)setVariantIdentifier:(id)a3;
- (void)setVideoDetailsDictionary:(id)a3;
- (void)setViewStoreItemURL:(id)a3;
@end

@implementation SSDownloadMetadata

- (SSDownloadMetadata)init
{
  return [(SSDownloadMetadata *)self initWithDictionary:0];
}

- (SSDownloadMetadata)initWithDictionary:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SSDownloadMetadata;
  v4 = [(SSDownloadMetadata *)&v6 init];
  if (v4)
  {
    v4->_dictionary = (NSMutableDictionary *)[a3 mutableCopy];
    v4->_lock = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
  }
  return v4;
}

- (SSDownloadMetadata)initWithItem:(id)a3
{
  uint64_t v5 = [a3 defaultItemOffer];
  return [(SSDownloadMetadata *)self initWithItem:a3 offer:v5];
}

- (SSDownloadMetadata)initWithItem:(id)a3 offer:(id)a4
{
  objc_super v6 = [(SSDownloadMetadata *)self initWithDictionary:0];
  if (!v6) {
    return v6;
  }
  uint64_t v7 = [a3 ITunesStoreIdentifier];
  if (v7)
  {
    uint64_t v8 = v7;
    [(SSDownloadMetadata *)v6 setItemIdentifier:SSGetItemIdentifierFromValue(v7)];
    if ([a4 isPreorder])
    {
      uint64_t v9 = [a3 preOrderIdentifier];
      if (!v9) {
        uint64_t v9 = v8;
      }
      [(SSDownloadMetadata *)v6 setPreOrderIdentifier:SSGetItemIdentifierFromValue(v9)];
    }
  }
  -[SSDownloadMetadata setArtistIdentifier:](v6, "setArtistIdentifier:", objc_msgSend((id)objc_msgSend(a3, "artistIdentifier"), "itemIdentifierValue"));
  -[SSDownloadMetadata setBundleIdentifier:](v6, "setBundleIdentifier:", [a3 bundleIdentifier]);
  -[SSDownloadMetadata setCollectionArtistName:](v6, "setCollectionArtistName:", [a3 collectionArtistName]);
  -[SSDownloadMetadata setCollectionIdentifier:](v6, "setCollectionIdentifier:", objc_msgSend((id)objc_msgSend(a3, "collectionIdentifier"), "itemIdentifierValue"));
  -[SSDownloadMetadata setCollectionIndexInCollectionGroup:](v6, "setCollectionIndexInCollectionGroup:", [a3 collectionIndexInCollectionGroup]);
  -[SSDownloadMetadata setCollectionName:](v6, "setCollectionName:", [a3 collectionName]);
  -[SSDownloadMetadata setCompilation:](v6, "setCompilation:", [a3 isCompilation]);
  -[SSDownloadMetadata setComposerName:](v6, "setComposerName:", [a3 composerName]);
  -[SSDownloadMetadata setEpisodeIdentifier:](v6, "setEpisodeIdentifier:", [a3 episodeIdentifier]);
  -[SSDownloadMetadata setEpisodeSortIdentifier:](v6, "setEpisodeSortIdentifier:", [a3 episodeSortIdentifier]);
  -[SSDownloadMetadata setGenre:](v6, "setGenre:", [a3 genreName]);
  -[SSDownloadMetadata setGenreIdentifier:](v6, "setGenreIdentifier:", objc_msgSend((id)objc_msgSend(a3, "genreIdentifier"), "itemIdentifierValue"));
  -[SSDownloadMetadata setIndexInCollection:](v6, "setIndexInCollection:", [a3 indexInCollection]);
  -[SSDownloadMetadata setLongDescription:](v6, "setLongDescription:", [a3 longDescription]);
  -[SSDownloadMetadata setNetworkName:](v6, "setNetworkName:", [a3 networkName]);
  -[SSDownloadMetadata setNumberOfCollectionsInCollectionGroup:](v6, "setNumberOfCollectionsInCollectionGroup:", [a3 numberOfCollectionsInCollectionGroup]);
  -[SSDownloadMetadata setNumberOfItemsInCollection:](v6, "setNumberOfItemsInCollection:", [a3 numberOfItemsInCollection]);
  -[SSDownloadMetadata setPodcastEpisodeGUID:](v6, "setPodcastEpisodeGUID:", [a3 podcastEpisodeGUID]);
  -[SSDownloadMetadata setSeasonNumber:](v6, "setSeasonNumber:", [a3 seasonNumber]);
  -[SSDownloadMetadata setSeriesName:](v6, "setSeriesName:", [a3 seriesName]);
  -[SSDownloadMetadata setShortDescription:](v6, "setShortDescription:", [a3 shortDescription]);
  -[SSDownloadMetadata setSubtitle:](v6, "setSubtitle:", [a3 artistName]);
  -[SSDownloadMetadata setTitle:](v6, "setTitle:", [a3 itemTitle]);
  -[SSDownloadMetadata setVideoDetailsDictionary:](v6, "setVideoDetailsDictionary:", [a3 videoDetails]);
  v10 = SSDownloadKindForItemKind((void *)[a3 itemKind]);
  [(SSDownloadMetadata *)v6 setKind:v10];
  v11 = (void *)[a3 softwareType];
  [(SSDownloadMetadata *)v6 setValue:v11 forMetadataKey:@"software-type"];
  v12 = (void *)[a3 contentRating];
  [(SSDownloadMetadata *)v6 setContentRating:v12];
  -[SSDownloadMetadata setExplicitContent:](v6, "setExplicitContent:", [v12 isExplicitContent]);
  -[SSDownloadMetadata setHighDefinition:](v6, "setHighDefinition:", [a3 isHighDefinition]);
  uint64_t v13 = objc_msgSend((id)objc_msgSend(a4, "playableMedia"), "fullDurationInMilliseconds");
  if ((v13 & 0x8000000000000000) == 0) {
    -[SSDownloadMetadata setDurationInMilliseconds:](v6, "setDurationInMilliseconds:", [NSNumber numberWithInteger:v13]);
  }
  v14 = (void *)[a3 imageCollection];
  v15 = objc_msgSend(v14, "bestImageForSize:", 0.0, 0.0);
  -[SSDownloadMetadata setFullSizeImageURL:](v6, "setFullSizeImageURL:", [v15 URL]);
  if ((SSDownloadKindIsSoftwareKind(v10) & 1) == 0)
  {
    double v17 = 88.0;
LABEL_19:
    uint64_t v18 = objc_msgSend(v14, "bestImageForSize:", v17, v17);
    goto LABEL_20;
  }
  if ([v11 isEqualToString:@"newsstand"]) {
    v16 = (void *)[v14 imagesForKind:@"newsstand-latest-issue-icon.default"];
  }
  else {
    v16 = 0;
  }
  if (![v16 count]) {
    v16 = (void *)[v14 imagesForKind:@"software-icon.default"];
  }
  if (![v16 count])
  {
    double v17 = 57.0;
    goto LABEL_19;
  }
  uint64_t v18 = [v16 lastObject];
LABEL_20:
  v19 = (void *)v18;
  if ([v15 isPrerendered]) {
    uint64_t v20 = 1;
  }
  else {
    uint64_t v20 = [v19 isPrerendered];
  }
  [(SSDownloadMetadata *)v6 setArtworkIsPrerendered:v20];
  if (v19)
  {
    -[SSDownloadMetadata setThumbnailImageURL:](v6, "setThumbnailImageURL:", [v19 URL]);
    -[SSDownloadMetadata setThumbnailNewsstandBindingEdge:](v6, "setThumbnailNewsstandBindingEdge:", [v19 valueForProperty:@"UINewsstandBindingEdge"]);
    v21 = v19;
  }
  else
  {
    -[SSDownloadMetadata setThumbnailImageURL:](v6, "setThumbnailImageURL:", [v15 URL]);
    -[SSDownloadMetadata setThumbnailNewsstandBindingEdge:](v6, "setThumbnailNewsstandBindingEdge:", [v15 valueForProperty:@"UINewsstandBindingEdge"]);
    v21 = v15;
  }
  -[SSDownloadMetadata setThumbnailNewsstandBindingType:](v6, "setThumbnailNewsstandBindingType:", [v21 valueForProperty:@"UINewsstandBindingType"]);
  uint64_t v22 = [a3 releaseDate];
  if (v22)
  {
    uint64_t v23 = v22;
    v24 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9A8], "currentCalendar"), "components:fromDate:", 4, v22);
    if (v24) {
      -[SSDownloadMetadata setReleaseYear:](v6, "setReleaseYear:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v24, "year")));
    }
    [(SSDownloadMetadata *)v6 setReleaseDate:v23];
  }
  if (objc_msgSend((id)objc_msgSend(a3, "itemKind"), "isEqualToString:", @"itunes-u")) {
    [(SSDownloadMetadata *)v6 setPodcastType:@"itunes-u"];
  }
  if (SSDownloadKindIsPodcastKind(v10))
  {
    -[SSDownloadMetadata setPodcastFeedURL:](v6, "setPodcastFeedURL:", [a3 podcastFeedURL]);
    -[SSDownloadMetadata setPrimaryAssetURL:](v6, "setPrimaryAssetURL:", objc_msgSend((id)objc_msgSend(a4, "playableMedia"), "URL"));
  }
  return v6;
}

- (SSDownloadMetadata)initWithKind:(id)a3
{
  v4 = [(SSDownloadMetadata *)self initWithDictionary:0];
  uint64_t v5 = v4;
  if (v4) {
    [(SSDownloadMetadata *)v4 setKind:a3];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSDownloadMetadata;
  [(SSDownloadMetadata *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SSDownloadMetadata.m", 403, @"Only keyed coding is supported");
  }
  [(NSLock *)self->_lock lock];
  [a3 encodeObject:self->_dictionary forKey:@"dict"];
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (SSDownloadMetadata)initWithCoder:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SSDownloadMetadata.m", 410, @"Only keyed coding is supported");
  }
  objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
  uint64_t v13 = -[SSDownloadMetadata initWithDictionary:](self, "initWithDictionary:", [a3 decodeObjectOfClasses:v12 forKey:@"dict"]);
  if ([a3 containsValueForKey:@"kind"])
  {
    -[SSDownloadMetadata setArtworkIsPrerendered:](v13, "setArtworkIsPrerendered:", [a3 decodeBoolForKey:@"prerender"]);
    -[SSDownloadMetadata setBundleIdentifier:](v13, "setBundleIdentifier:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"bid"]);
    -[SSDownloadMetadata setCollectionName:](v13, "setCollectionName:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"playlist"]);
    -[SSDownloadMetadata setKind:](v13, "setKind:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kind"]);
    -[SSDownloadMetadata setDownloadKey:](v13, "setDownloadKey:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"key"]);
    -[SSDownloadMetadata setDurationInMilliseconds:](v13, "setDurationInMilliseconds:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"duration"]);
    -[SSDownloadMetadata setGenre:](v13, "setGenre:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"genre"]);
    -[SSDownloadMetadata setRental:](v13, "setRental:", [a3 decodeBoolForKey:@"rental"]);
    -[SSDownloadMetadata setSinfs:](v13, "setSinfs:", [a3 decodeObjectOfClasses:v12 forKey:@"sinfs"]);
    -[SSDownloadMetadata setThumbnailImageURL:](v13, "setThumbnailImageURL:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"small-image"]);
    -[SSDownloadMetadata setTitle:](v13, "setTitle:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"title"]);
    -[SSDownloadMetadata setTransactionIdentifier:](v13, "setTransactionIdentifier:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"tid"]);
    v14 = (void *)MEMORY[0x1E4F1CAD0];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    uint64_t v15 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v14, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v21, 2)), @"identifier");
    if (v15) {
      [(SSDownloadMetadata *)v13 setItemIdentifier:SSGetItemIdentifierFromValue(v15)];
    }
    v16 = (void *)MEMORY[0x1E4F1CAD0];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    uint64_t v17 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v16, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v20, 2)), @"preorder-id");
    if (v17) {
      [(SSDownloadMetadata *)v13 setPreOrderIdentifier:SSGetItemIdentifierFromValue(v17)];
    }
    uint64_t v18 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"artist"];
    if (!v18) {
      uint64_t v18 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
    }
    [(SSDownloadMetadata *)v13 setSubtitle:v18];
  }
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(NSLock *)self->_lock lock];
  v5[1] = [(NSMutableDictionary *)self->_dictionary mutableCopyWithZone:a3];
  [(NSLock *)self->_lock unlock];
  return v5;
}

- (id)copyXPCEncoding
{
  return SSXPCCreateXPCObjectFromCFObject((__CFString *)self->_dictionary);
}

- (SSDownloadMetadata)initWithXPCEncoding:(id)a3
{
  CFArrayRef v4 = SSXPCCreateCFObjectFromXPCObject((const __CFDictionary *)a3);
  uint64_t v5 = [(SSDownloadMetadata *)self initWithDictionary:v4];

  return v5;
}

- (id)applicationIdentifier
{
  unint64_t v3 = [(SSDownloadMetadata *)self itemIdentifier];
  if (v3) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"%lld", v3);
  }
  id result = [(SSDownloadMetadata *)self bundleIdentifier];
  if (!result) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"%lld", v3);
  }
  return result;
}

- (unint64_t)artistIdentifier
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"artistId", @"artist-id", 0];
  return SSGetItemIdentifierFromValue(v2);
}

- (NSString)artistName
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"artistName", @"artist-name", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (BOOL)artworkIsPrerendered
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"softwareIconNeedsShine", 0];
  if (objc_opt_respondsToSelector()) {
    return [v2 BOOLValue] ^ 1;
  }
  else {
    return 0;
  }
}

- (id)betaExternalVersionIdentifier
{
  id v2 = [(SSDownloadMetadata *)self valueForMetadataKey:@"betaExternalVersionIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (id)bundleIdentifier
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"softwareVersionBundleId", @"bundle-id", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (id)cloudIdentifier
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"cloud-id", @"sagaId", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (id)collectionArtistName
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"playlistArtistName", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (unint64_t)collectionIdentifier
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"playlistId", @"collection-id", 0];
  return SSGetItemIdentifierFromValue(v2);
}

- (id)collectionIndexInCollectionGroup
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"discNumber", @"disc-number", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (id)collectionName
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"playlistName", @"collection-name", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (unint64_t)composerIdentifier
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"composerId", @"composer-id", 0];
  return SSGetItemIdentifierFromValue(v2);
}

- (id)composerName
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"composerName", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (id)contentRating
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"rating", 0];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  CFArrayRef v4 = 0;
  if (isKindOfClass) {
    CFArrayRef v4 = [[SSItemContentRating alloc] initWithDictionary:v2];
  }
  return v4;
}

- (id)documentTargetIdentifier
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"document-target-app", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (id)downloadPermalink
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"download-permalink", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (id)durationInMilliseconds
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"duration", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (id)enableExtensions
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"enableExtensions", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (id)episodeIdentifier
{
  id v3 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"episode-number", 0];
  return [(SSDownloadMetadata *)self _stringValueForValue:v3];
}

- (id)episodeSortIdentifier
{
  id v3 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"episode-sort-id", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v3;
  }
  return [(SSDownloadMetadata *)self indexInCollection];
}

- (NSURL)fullSizeImageURL
{
  id v3 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"artworkURL", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFArrayRef v4 = (void *)MEMORY[0x1E4F1CB10];
    return (NSURL *)[v4 URLWithString:v3];
  }
  else
  {
    id result = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"artwork-urls", 0];
    if (result)
    {
      objc_super v6 = [[SSItemImageCollection alloc] initWithImageCollection:result];
      uint64_t v7 = (NSURL *)(id)objc_msgSend(-[SSItemImageCollection bestImageForSize:](v6, "bestImageForSize:", 0.0, 0.0), "URL");

      return v7;
    }
  }
  return result;
}

- (NSString)genre
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"genre", @"genreName", @"genre-name", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (unint64_t)genreIdentifier
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"genreId", @"genre-id", 0];
  return SSGetItemIdentifierFromValue(v2);
}

- (BOOL)hasMessagesExtension
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"hasMessagesExtension", 0];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v2 BOOLValue];
}

- (NSURL)hlsPlaylistURL
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"hls-playlist-url", 0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v3 = (void *)MEMORY[0x1E4F1CB10];
  return (NSURL *)[v3 URLWithString:v2];
}

- (id)indexInCollection
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"trackNumber", @"track-number", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (BOOL)is32BitOnly
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"is32BitOnly", 0];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v2 BOOLValue];
}

- (BOOL)isCompilation
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"compilation", 0];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v2 BOOLValue];
}

- (BOOL)isDeviceBasedVPP
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"isDeviceBased", 0];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v2 BOOLValue];
}

- (BOOL)isExplicitContent
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"explicit", 0];
  return (objc_opt_respondsToSelector() & 1) != 0 && [v2 integerValue] == 1;
}

- (BOOL)hasHDR
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"has-hdr", 0];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v2 BOOLValue];
}

- (BOOL)isHighDefinition
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"high-definition", 0];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v2 BOOLValue];
}

- (BOOL)isHLS
{
  id v3 = [(SSDownloadMetadata *)self hlsPlaylistURL];
  if (SSDownloadKindIsVideosAppKind([(SSDownloadMetadata *)self kind])) {
    return v3 != 0;
  }
  BOOL v5 = [(SSDownloadMetadata *)self isPremium];
  BOOL v6 = [(SSDownloadMetadata *)self hasHDR];
  BOOL v7 = v6 & SSDeviceSupportsHDRDownload() | v5;
  return v3 && v7;
}

- (BOOL)isPremium
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"PR", 0];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v2 BOOLValue];
}

- (BOOL)isRental
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"isRental", 0];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v2 BOOLValue];
}

- (BOOL)isSample
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"isSample", 0];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v2 BOOLValue];
}

- (BOOL)isSharedResource
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"isSharedResource", 0];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v2 BOOLValue];
}

- (BOOL)isTvTemplate
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"isTvTemplateApp", 0];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v2 BOOLValue];
}

- (unint64_t)itemIdentifier
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"itemId", @"songId", @"item-id", 0];
  return SSGetItemIdentifierFromValue(v2);
}

- (NSString)kind
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"kind", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (NSURL)launchExtrasUrl
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"launch-extras-url", 0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v3 = (void *)MEMORY[0x1E4F1CB10];
  return (NSURL *)[v3 URLWithString:v2];
}

- (BOOL)launchProhibited
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"launchProhibited", 0];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v2 BOOLValue];
}

- (NSString)longDescription
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"longDescription", @"long-description", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (id)messagesArtworkURL
{
  id v3 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"messagesIconUrl", 0];
  return [(SSDownloadMetadata *)self _urlValueForValue:v3];
}

- (id)networkName
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"network-name", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (id)numberOfCollectionsInCollectionGroup
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"discCount", @"disc-count", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (id)numberOfItemsInCollection
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"trackCount", @"track-count", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (id)podcastEpisodeGUID
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"episode-guid", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (id)podcastFeedURL
{
  id v3 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"podcast-feed-url", 0];
  return [(SSDownloadMetadata *)self _urlValueForValue:v3];
}

- (id)podcastType
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"podcast-type", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (NSDictionary)primaryAssetDictionary
{
  [(NSLock *)self->_lock lock];
  id v3 = objc_msgSend(-[SSDownloadMetadata _assetDictionary](self, "_assetDictionary"), "copy");
  [(NSLock *)self->_lock unlock];
  return (NSDictionary *)v3;
}

- (id)purchaseDate
{
  id v3 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"purchaseDate", 0];
  return [(SSDownloadMetadata *)self _dateValueForValue:v3];
}

- (NSDate)releaseDate
{
  id v3 = [(SSDownloadMetadata *)self _releaseDateValue];
  return (NSDate *)[(SSDownloadMetadata *)self _dateValueForValue:v3];
}

- (NSNumber)releaseYear
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"year", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (NSNumber)rentalID
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"rental-id", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (unint64_t)sagaIdentifier
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"cloud-id", @"sagaId", 0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return [v2 unsignedLongLongValue];
}

- (id)seasonNumber
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"season-number", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (id)seriesName
{
  id v3 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"show-name", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v3;
  }
  return [(SSDownloadMetadata *)self collectionName];
}

- (id)longSeasonDescription
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"longSeasonDescription", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (id)downloadPolicy
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"downloadPolicy", 0];
  objc_opt_class();
  id v3 = 0;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v19 = 0;
    id v3 = (void *)[MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:&v19];
    if (v19)
    {
      id v4 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v4) {
        id v4 = +[SSLogConfig sharedConfig];
      }
      int v5 = [v4 shouldLog];
      if ([v4 shouldLogToDisk]) {
        int v6 = v5 | 2;
      }
      else {
        int v6 = v5;
      }
      if (!os_log_type_enabled((os_log_t)[v4 OSLogObject], OS_LOG_TYPE_ERROR)) {
        v6 &= 2u;
      }
      if (v6)
      {
        uint64_t v7 = objc_opt_class();
        int v20 = 138543618;
        uint64_t v21 = v7;
        __int16 v22 = 2114;
        uint64_t v23 = v19;
        LODWORD(v18) = 22;
        uint64_t v8 = _os_log_send_and_compose_impl();
        if (v8)
        {
          uint64_t v9 = (void *)v8;
          uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v20, v18);
          free(v9);
          SSFileLog(v4, @"%@", v11, v12, v13, v14, v15, v16, v10);
        }
      }
    }
  }
  return v3;
}

- (void)setArtistIdentifier:(unint64_t)a3
{
  uint64_t v4 = [NSNumber numberWithItemIdentifier:a3];
  if ([(SSDownloadMetadata *)self keyStyle] == 1) {
    int v5 = @"artist-id";
  }
  else {
    int v5 = @"artistId";
  }
  [(SSDownloadMetadata *)self setValue:v4 forMetadataKey:v5];
}

- (void)setArtistName:(id)a3
{
  if ([(SSDownloadMetadata *)self keyStyle] == 1) {
    int v5 = @"artist-name";
  }
  else {
    int v5 = @"artistName";
  }
  [(SSDownloadMetadata *)self _setValueCopy:a3 forMetadataKey:v5];
}

- (void)setArtworkIsPrerendered:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:!a3];
  [(SSDownloadMetadata *)self setValue:v4 forMetadataKey:@"softwareIconNeedsShine"];
}

- (void)setBetaExternalVersionIdentifier:(id)a3
{
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void)setCloudIdentifier:(id)a3
{
}

- (void)setCollectionArtistName:(id)a3
{
}

- (void)setCollectionIdentifier:(unint64_t)a3
{
  uint64_t v4 = [NSNumber numberWithItemIdentifier:a3];
  if ([(SSDownloadMetadata *)self keyStyle] == 1) {
    int v5 = @"collection-id";
  }
  else {
    int v5 = @"playlistId";
  }
  [(SSDownloadMetadata *)self setValue:v4 forMetadataKey:v5];
}

- (void)setCollectionIndexInCollectionGroup:(id)a3
{
  if ([(SSDownloadMetadata *)self keyStyle] == 1) {
    int v5 = @"disc-number";
  }
  else {
    int v5 = @"discNumber";
  }
  [(SSDownloadMetadata *)self setValue:a3 forMetadataKey:v5];
}

- (void)setCollectionName:(id)a3
{
  if ([(SSDownloadMetadata *)self keyStyle] == 1) {
    int v5 = @"collection-name";
  }
  else {
    int v5 = @"playlistName";
  }
  [(SSDownloadMetadata *)self setValue:a3 forMetadataKey:v5];
}

- (void)setCompilation:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];
  [(SSDownloadMetadata *)self setValue:v4 forMetadataKey:@"compilation"];
}

- (void)setDeviceBasedVPP:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];
  [(SSDownloadMetadata *)self setValue:v4 forMetadataKey:@"isDeviceBased"];
}

- (void)setComposerIdentifier:(unint64_t)a3
{
  uint64_t v4 = [NSNumber numberWithItemIdentifier:a3];
  if ([(SSDownloadMetadata *)self keyStyle] == 1) {
    int v5 = @"composer-id";
  }
  else {
    int v5 = @"composerId";
  }
  [(SSDownloadMetadata *)self setValue:v4 forMetadataKey:v5];
}

- (void)setComposerName:(id)a3
{
}

- (void)setContentRating:(id)a3
{
  uint64_t v4 = [a3 contentRatingDictionary];
  [(SSDownloadMetadata *)self setValue:v4 forMetadataKey:@"rating"];
}

- (void)setDocumentTargetIdentifier:(id)a3
{
}

- (void)setDurationInMilliseconds:(id)a3
{
}

- (void)setEnableExtensions:(id)a3
{
}

- (void)setEpisodeIdentifier:(id)a3
{
}

- (void)setEpisodeSortIdentifier:(id)a3
{
}

- (void)setExplicitContent:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithInteger:a3];
  [(SSDownloadMetadata *)self setValue:v4 forMetadataKey:@"explicit"];
}

- (void)setFullSizeImageURL:(id)a3
{
  uint64_t v4 = [a3 absoluteString];
  [(SSDownloadMetadata *)self setValue:v4 forMetadataKey:@"artworkURL"];
}

- (void)setGenre:(id)a3
{
}

- (void)setGenreIdentifier:(unint64_t)a3
{
  uint64_t v4 = [NSNumber numberWithItemIdentifier:a3];
  if ([(SSDownloadMetadata *)self keyStyle] == 1) {
    int v5 = @"genre-id";
  }
  else {
    int v5 = @"genreId";
  }
  [(SSDownloadMetadata *)self setValue:v4 forMetadataKey:v5];
}

- (void)setHasMessagesExtension:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];
  [(SSDownloadMetadata *)self setValue:v4 forMetadataKey:@"hasMessagesExtension"];
}

- (void)setHighDefinition:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];
  [(SSDownloadMetadata *)self setValue:v4 forMetadataKey:@"high-definition"];
}

- (void)setHlsPlaylistURL:(id)a3
{
  uint64_t v4 = [a3 absoluteString];
  [(SSDownloadMetadata *)self setValue:v4 forMetadataKey:@"hls-playlist-url"];
}

- (void)setIndexInCollection:(id)a3
{
  if ([(SSDownloadMetadata *)self keyStyle] == 1) {
    int v5 = @"track-number";
  }
  else {
    int v5 = @"trackNumber";
  }
  [(SSDownloadMetadata *)self setValue:a3 forMetadataKey:v5];
}

- (void)setItemIdentifier:(unint64_t)a3
{
  uint64_t v4 = [NSNumber numberWithItemIdentifier:a3];
  if ([(SSDownloadMetadata *)self keyStyle] == 1) {
    int v5 = @"item-id";
  }
  else {
    int v5 = @"itemId";
  }
  [(SSDownloadMetadata *)self setValue:v4 forMetadataKey:v5];
}

- (void)setKind:(id)a3
{
}

- (void)setLaunchExtrasUrl:(id)a3
{
  uint64_t v4 = [a3 absoluteString];
  [(SSDownloadMetadata *)self setValue:v4 forMetadataKey:@"launch-extras-url"];
}

- (void)setLaunchProhibited:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];
  [(SSDownloadMetadata *)self setValue:v4 forMetadataKey:@"launchProhibited"];
}

- (void)setLongDescription:(id)a3
{
  if ([(SSDownloadMetadata *)self keyStyle] == 1) {
    int v5 = @"long-description";
  }
  else {
    int v5 = @"longDescription";
  }
  [(SSDownloadMetadata *)self _setValueCopy:a3 forMetadataKey:v5];
}

- (void)setMessagesArtworkURL:(id)a3
{
  uint64_t v4 = [a3 absoluteString];
  [(SSDownloadMetadata *)self setValue:v4 forMetadataKey:@"messagesIconUrl"];
}

- (void)setNetworkName:(id)a3
{
}

- (void)setNumberOfCollectionsInCollectionGroup:(id)a3
{
  if ([(SSDownloadMetadata *)self keyStyle] == 1) {
    int v5 = @"disc-count";
  }
  else {
    int v5 = @"discCount";
  }
  [(SSDownloadMetadata *)self setValue:a3 forMetadataKey:v5];
}

- (void)setNumberOfItemsInCollection:(id)a3
{
  if ([(SSDownloadMetadata *)self keyStyle] == 1) {
    int v5 = @"track-count";
  }
  else {
    int v5 = @"trackCount";
  }
  [(SSDownloadMetadata *)self setValue:a3 forMetadataKey:v5];
}

- (void)setPodcastEpisodeGUID:(id)a3
{
}

- (void)setPodcastFeedURL:(id)a3
{
  uint64_t v4 = [a3 absoluteString];
  [(SSDownloadMetadata *)self setValue:v4 forMetadataKey:@"podcast-feed-url"];
}

- (void)setPodcastType:(id)a3
{
}

- (void)setPurchaseDate:(id)a3
{
}

- (void)setReleaseDate:(id)a3
{
  if ([(SSDownloadMetadata *)self keyStyle] == 1) {
    int v5 = @"release-date";
  }
  else {
    int v5 = @"releaseDate";
  }
  [(SSDownloadMetadata *)self setValue:a3 forMetadataKey:v5];
}

- (void)setReleaseYear:(id)a3
{
}

- (void)setRental:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];
  [(SSDownloadMetadata *)self setValue:v4 forMetadataKey:@"isRental"];
}

- (void)setRentalID:(id)a3
{
}

- (void)setSagaIdentifier:(unint64_t)a3
{
  uint64_t v4 = [NSNumber numberWithItemIdentifier:a3];
  [(SSDownloadMetadata *)self setValue:v4 forMetadataKey:@"cloud-id"];
}

- (void)setSample:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];
  [(SSDownloadMetadata *)self setValue:v4 forMetadataKey:@"isSample"];
}

- (void)setMusicShow:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];
  [(SSDownloadMetadata *)self setValue:v4 forMetadataKey:@"is-apple-music-show"];
}

- (void)setSeasonNumber:(id)a3
{
}

- (void)setSharedResource:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];
  [(SSDownloadMetadata *)self _setValueCopy:v4 forMetadataKey:@"isSharedResource"];
}

- (void)setSeriesName:(id)a3
{
}

- (void)setLongSeasonDescription:(id)a3
{
}

- (void)setShortDescription:(id)a3
{
}

- (void)setSortArtistName:(id)a3
{
}

- (void)setSortCollectionName:(id)a3
{
}

- (void)setSortTitle:(id)a3
{
}

- (void)setThumbnailNewsstandBindingEdge:(id)a3
{
}

- (void)setThumbnailNewsstandBindingType:(id)a3
{
}

- (void)setThumbnailImageURL:(id)a3
{
  uint64_t v4 = [a3 absoluteString];
  [(SSDownloadMetadata *)self setValue:v4 forMetadataKey:@"thumbnail-url"];
}

- (void)setTitle:(id)a3
{
  [(SSDownloadMetadata *)self setValue:a3 forMetadataKey:@"title"];
  [(SSDownloadMetadata *)self setValue:a3 forMetadataKey:@"unmodified-title"];
}

- (void)setTransactionIdentifier:(id)a3
{
}

- (void)setTvTemplate:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];
  [(SSDownloadMetadata *)self setValue:v4 forMetadataKey:@"isTvTemplateApp"];
}

- (void)setVariantIdentifier:(id)a3
{
}

- (void)setVideoDetailsDictionary:(id)a3
{
}

- (void)setViewStoreItemURL:(id)a3
{
  uint64_t v4 = [a3 absoluteString];
  [(SSDownloadMetadata *)self setValue:v4 forMetadataKey:@"url"];
}

- (void)setDownloadPolicy:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v19 = 0;
    uint64_t v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v19];
    if (v4)
    {
      [(SSDownloadMetadata *)self setValue:v4 forMetadataKey:@"downloadPolicy"];
    }
    else
    {
      id v5 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v5) {
        id v5 = +[SSLogConfig sharedConfig];
      }
      int v6 = [v5 shouldLog];
      if ([v5 shouldLogToDisk]) {
        int v7 = v6 | 2;
      }
      else {
        int v7 = v6;
      }
      if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_ERROR)) {
        v7 &= 2u;
      }
      if (v7)
      {
        uint64_t v8 = objc_opt_class();
        int v20 = 138543618;
        uint64_t v21 = v8;
        __int16 v22 = 2114;
        uint64_t v23 = v19;
        LODWORD(v18) = 22;
        uint64_t v9 = _os_log_send_and_compose_impl();
        if (v9)
        {
          uint64_t v10 = (void *)v9;
          uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v20, v18);
          free(v10);
          SSFileLog(v5, @"%@", v12, v13, v14, v15, v16, v17, v11);
        }
      }
    }
  }
}

- (NSString)shortDescription
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"description", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (NSString)sortArtistName
{
  id v3 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"sort-artist", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v3;
  }
  return [(SSDownloadMetadata *)self subtitle];
}

- (NSString)sortCollectionName
{
  id v3 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"sort-album", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v3;
  }
  return (NSString *)[(SSDownloadMetadata *)self collectionName];
}

- (NSString)sortTitle
{
  id v3 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"sort-name", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v3;
  }
  return [(SSDownloadMetadata *)self title];
}

- (SSItemImageCollection)thumbnailImageCollection
{
  id v3 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"thumbnail-url", 0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (uint64_t v4 = [(SSDownloadMetadata *)self _newImageCollectionWithURLString:v3]) == 0)
  {
    id v5 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"artwork-urls", 0];
    if (!v5
      || (uint64_t v4 = [[SSItemImageCollection alloc] initWithImageCollection:v5]) == 0)
    {
      id v6 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"softwareIcon57x57URL", @"icon-url", 0];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      uint64_t v4 = 0;
      if (isKindOfClass) {
        uint64_t v4 = [(SSDownloadMetadata *)self _newImageCollectionWithURLString:v6];
      }
    }
  }
  return v4;
}

- (NSString)thumbnailNewsstandBindingEdge
{
  id v3 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"thumbnail-newsstand-binding-edge", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v3;
  }
  id v5 = [(SSDownloadMetadata *)self _thumbnailArtworkImage];
  return (NSString *)[v5 valueForProperty:@"UINewsstandBindingEdge"];
}

- (NSString)thumbnailNewsstandBindingType
{
  id v3 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"thumbnail-newsstand-binding-type", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v3;
  }
  id v5 = [(SSDownloadMetadata *)self _thumbnailArtworkImage];
  return (NSString *)[v5 valueForProperty:@"UINewsstandBindingType"];
}

- (NSURL)thumbnailImageURL
{
  id v2 = [(SSDownloadMetadata *)self _thumbnailArtworkImage];
  return (NSURL *)[v2 URL];
}

- (NSString)title
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"unmodified-title", @"title", @"itemName", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (NSString)transactionIdentifier
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"download-id", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (id)variantIdentifier
{
  id v2 = [(SSDownloadMetadata *)self valueForMetadataKey:@"variantId"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (id)videoDetailsDictionary
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"videoDetails", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (id)viewStoreItemURL
{
  id v3 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"url", 0];
  return [(SSDownloadMetadata *)self _urlValueForValue:v3];
}

- (id)showComposer
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"show-composer", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (BOOL)isMusicShow
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"is-apple-music-show", 0];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v2 BOOLValue];
}

- (id)workName
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"work", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (id)movementName
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"movement", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (id)movementNumber
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"movement-number", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (id)movementCount
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"movement-count", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (NSData)appReceiptData
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"app-receipt", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (NSURL)cancelDownloadURL
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"cancel-download-url", 0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v3 = (void *)MEMORY[0x1E4F1CB10];
  return (NSURL *)[v3 URLWithString:v2];
}

- (NSString)copyright
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"copyright", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (id)copyWritableMetadata
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [(NSLock *)self->_lock lock];
  uint64_t v3 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", @"metadata"), "mutableCopy");
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    for (uint64_t i = 0; i != 4; ++i)
    {
      id v6 = off_1E5BA7F10[i];
      uint64_t v7 = [(NSMutableDictionary *)self->_dictionary objectForKey:v6];
      if (v7) {
        [v4 setObject:v7 forKey:v6];
      }
    }
    id v8 = (id)objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", @"asset-info"), "mutableCopy");
    if (!v8) {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    id v9 = (id)[v8 allKeys];
    if (![v9 count]) {
      id v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"file-size", @"flavor", 0);
    }
    id v10 = [(SSDownloadMetadata *)self _assetDictionary];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * j);
          uint64_t v16 = [v10 objectForKey:v15];
          if (v16) {
            [v8 setObject:v16 forKey:v15];
          }
        }
        uint64_t v12 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }
    [v4 setObject:v8 forKey:@"asset-info"];
  }
  else
  {
    uint64_t v4 = (void *)[(NSMutableDictionary *)self->_dictionary mutableCopy];
  }
  [(NSLock *)self->_lock unlock];
  return v4;
}

- (NSDictionary)dictionary
{
  id v2 = self->_dictionary;
  return (NSDictionary *)v2;
}

- (NSNumber)downloaderAccountIdentifier
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"com.apple.iTunesStore.downloadInfo", 0];
  objc_opt_class();
  uint64_t v3 = 0;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = (void *)[v2 objectForKey:@"accountInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v3 = (NSNumber *)[v4 objectForKey:@"DownloaderID"];
    }
    else {
      uint64_t v3 = 0;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v3;
  }
  else {
    return 0;
  }
}

- (NSString)downloadKey
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"downloadKey", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (NSData)epubRightsData
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"epr", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (NSString)fileExtension
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"fileExtension", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (int64_t)keyStyle
{
  [(NSLock *)self->_lock lock];
  int64_t keyStyle = self->_keyStyle;
  [(NSLock *)self->_lock unlock];
  return keyStyle;
}

- (BOOL)isAutomaticDownload
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"is-auto-download", 0];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v2 BOOLValue];
}

- (BOOL)isContentRestricted
{
  id v3 = [(SSDownloadMetadata *)self contentRating];
  if (v3)
  {
    LOBYTE(v4) = [v3 isRestricted];
  }
  else
  {
    int v4 = [(SSDownloadMetadata *)self isExplicitContent];
    if (v4)
    {
      id v5 = [(SSDownloadMetadata *)self kind];
      if (SSDownloadKindIsEBookKind(v5, v6))
      {
        LOBYTE(v4) = SSRestrictionsShouldRestrictEroticBooks();
      }
      else
      {
        LOBYTE(v4) = SSRestrictionsShouldRestrictExplicitContent();
      }
    }
  }
  return v4;
}

- (BOOL)isRedownloadDownload
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"is-redownload", 0];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v2 BOOLValue];
}

- (BOOL)isSoftwareKind
{
  id v2 = [(SSDownloadMetadata *)self kind];
  return SSDownloadKindIsSoftwareKind(v2);
}

- (BOOL)isVideosKind
{
  id v2 = [(SSDownloadMetadata *)self kind];
  return SSDownloadKindIsVideosAppKind(v2);
}

- (NSArray)MD5HashStrings
{
  id v3 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"chunks", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 objectForKey:@"chunks"];
  }
  else
  {
    id v5 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"md5", 0];
    objc_opt_class();
    id v6 = 0;
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObject:v5];
  }
  id v6 = (NSArray *)v4;
LABEL_6:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v6;
  }
  else {
    return 0;
  }
}

- (id)newDownloadProperties
{
  uint64_t v169 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = 0;
  v40 = sel_artistName;
  v41 = @"d";
  uint64_t v42 = 0;
  v43 = sel_betaExternalVersionIdentifier;
  v44 = @"27";
  uint64_t v45 = 0;
  v46 = sel_bundleIdentifier;
  v47 = @"c";
  uint64_t v48 = 0;
  v49 = sel_cloudIdentifier;
  v50 = @"Y";
  uint64_t v51 = 0;
  v52 = sel_collectionArtistName;
  v53 = @"e";
  uint64_t v54 = 0;
  v55 = sel_downloadPermalink;
  v56 = @"p0";
  uint64_t v57 = 0;
  v58 = sel_numberOfCollectionsInCollectionGroup;
  v59 = @"o";
  uint64_t v60 = 0;
  v61 = sel_numberOfItemsInCollection;
  v62 = @"p";
  uint64_t v63 = 0;
  v64 = sel_collectionName;
  v65 = @"f";
  uint64_t v66 = 0;
  v67 = sel_composerName;
  v68 = @"g";
  uint64_t v69 = 0;
  v70 = sel_documentTargetIdentifier;
  v71 = @"E";
  uint64_t v72 = 0;
  v73 = sel_downloadKey;
  v74 = @"F";
  uint64_t v75 = 0;
  v76 = sel_durationInMilliseconds;
  v77 = @"h";
  uint64_t v78 = 0;
  v79 = sel_enableExtensions;
  v80 = @"EE";
  uint64_t v81 = 0;
  v82 = sel_episodeIdentifier;
  v83 = @"u";
  uint64_t v84 = 0;
  v85 = sel_episodeSortIdentifier;
  v86 = @"v";
  uint64_t v87 = 0;
  v88 = sel_genre;
  v89 = @"i";
  uint64_t v90 = 0;
  v91 = sel_indexInCollection;
  v92 = @"j";
  uint64_t v93 = 0;
  v94 = sel_collectionIndexInCollectionGroup;
  v95 = @"k";
  uint64_t v96 = 0;
  v97 = sel_kind;
  v98 = @"1";
  uint64_t v99 = 0;
  v100 = sel_longDescription;
  v101 = @"n";
  uint64_t v102 = 0;
  v103 = sel_longSeasonDescription;
  v104 = @"w";
  uint64_t v105 = 0;
  v106 = sel_messagesArtworkURL;
  v107 = @"MA";
  v108 = __StringValueForURL;
  v109 = sel_pageProgressionDirection;
  v110 = @"13";
  uint64_t v111 = 0;
  v112 = sel_podcastEpisodeGUID;
  v113 = @"A";
  uint64_t v114 = 0;
  v115 = sel_podcastFeedURL;
  v116 = @"B";
  v117 = __StringValueForURL;
  v118 = sel_podcastType;
  v119 = @"C";
  uint64_t v120 = 0;
  v121 = sel_releaseDate;
  v122 = @"q";
  v124 = sel_releaseYear;
  v125 = @"r";
  v127 = sel_seasonNumber;
  v128 = @"y";
  v130 = sel_seriesName;
  v131 = @"z";
  v133 = sel_shortDescription;
  v134 = @"s";
  v136 = sel_purchaseDate;
  v137 = @"8";
  v123 = __AbsoluteTimeForDate;
  uint64_t v126 = 0;
  uint64_t v129 = 0;
  uint64_t v132 = 0;
  uint64_t v135 = 0;
  v138 = __AbsoluteTimeForDate;
  v139 = sel_publicationVersion;
  v140 = @"p2";
  uint64_t v141 = 0;
  v142 = sel_transactionIdentifier;
  v143 = @"9";
  uint64_t v144 = 0;
  v145 = sel_title;
  v146 = @"2";
  uint64_t v147 = 0;
  v148 = sel_cancelDownloadURL;
  v149 = @"P";
  v150 = __StringValueForURL;
  v151 = sel_thumbnailImageURL;
  v152 = @"G";
  v153 = __StringValueForURL;
  v154 = sel_redownloadActionParameters;
  v155 = @"04";
  uint64_t v156 = 0;
  v157 = sel_thumbnailNewsstandBindingEdge;
  v158 = @"05";
  uint64_t v159 = 0;
  v160 = sel_thumbnailNewsstandBindingType;
  v161 = @"06";
  uint64_t v162 = 0;
  v163 = sel_viewStoreItemURL;
  v164 = @"11";
  v165 = __StringValueForURL;
  v166 = sel_variantIdentifier;
  v167 = @"26";
  uint64_t v168 = 0;
  do
  {
    uint64_t v5 = [(SSDownloadMetadata *)self performSelector:(&v40)[v4]];
    uint64_t v6 = v5;
    uint64_t v7 = *(uint64_t (**)(uint64_t))((char *)&v42 + v4 * 8);
    if (v7) {
      uint64_t v6 = v7(v5);
    }
    if (v6) {
      [v3 setObject:v6 forKey:(&v40)[v4 + 1]];
    }
    v4 += 3;
  }
  while (v4 != 129);
  uint64_t v8 = 0;
  long long v20 = @"artwork-template-name";
  long long v21 = @"L";
  __int16 v22 = @"bundleVersion";
  uint64_t v23 = @"20";
  uint64_t v24 = @"cancelIfDuplicate";
  v25 = @"10";
  v26 = @"is-in-queue";
  v27 = @"03";
  v28 = @"is-purchased-redownload";
  v29 = @"21";
  v30 = @"storeCohort";
  v31 = @"22";
  v32 = @"softwareVersionExternalIdentifier";
  v33 = @"R";
  v34 = @"software-type";
  v35 = @"N";
  v36 = @"s";
  v37 = @"T";
  v38 = @"xid";
  v39 = @"X";
  do
  {
    id v9 = -[SSDownloadMetadata valueForMetadataKey:](self, "valueForMetadataKey:", *(__CFString **)((char *)&v20 + v8), v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35,
           v36,
           v37,
           v38,
           v39,
           v40,
           v41,
           v42,
           v43,
           v44,
           v45,
           v46,
           v47,
           v48,
           v49,
           v50,
           v51,
           v52,
           v53,
           v54,
           v55,
           v56,
           v57,
           v58,
           v59,
           v60,
           v61,
           v62,
           v63,
           v64,
           v65,
           v66,
           v67,
           v68,
           v69,
           v70,
           v71,
           v72,
           v73,
           v74,
           v75,
           v76,
           v77,
           v78,
           v79);
    if (v9) {
      [v3 setObject:v9 forKey:*(__CFString **)((char *)&v20 + v8 + 8)];
    }
    v8 += 16;
  }
  while (v8 != 160);
  id v10 = [(SSDownloadMetadata *)self valueForMetadataKey:@"is-auto-download"];
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v10 BOOLValue]) {
    [v3 setObject:&unk_1EF9A9798 forKey:@"D"];
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", -[SSDownloadMetadata artworkIsPrerendered](self, "artworkIsPrerendered")), @"b");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", -[SSDownloadMetadata hasMessagesExtension](self, "hasMessagesExtension")), @"HM");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", -[SSDownloadMetadata isCompilation](self, "isCompilation")), @"l");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", -[SSDownloadMetadata isDeviceBasedVPP](self, "isDeviceBasedVPP")), @"vp");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", -[SSDownloadMetadata isExplicitContent](self, "isExplicitContent")), @"12");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", -[SSDownloadMetadata isHighDefinition](self, "isHighDefinition")), @"15");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", -[SSDownloadMetadata isRental](self, "isRental")), @"m");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", -[SSDownloadMetadata isSample](self, "isSample")), @"t");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", -[SSDownloadMetadata isSharedResource](self, "isSharedResource")), @"sr");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", -[SSDownloadMetadata isTvTemplate](self, "isTvTemplate")), @"tt");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", -[SSDownloadMetadata launchProhibited](self, "launchProhibited")), @"LP");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", -[SSDownloadMetadata isMusicShow](self, "isMusicShow")), @"ms");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", -[SSDownloadMetadata isHLS](self, "isHLS")), @"hi");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", -[SSDownloadMetadata isPremium](self, "isPremium")), @"PR");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", -[SSDownloadMetadata hasHDR](self, "hasHDR")), @"HR");
  id v11 = [(SSDownloadMetadata *)self valueForMetadataKey:@"has-4k"];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v11, "BOOLValue")), @"FK");
  }
  id v12 = [(SSDownloadMetadata *)self valueForMetadataKey:@"has-dolby-vision"];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "BOOLValue")), @"DV");
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithItemIdentifier:", -[SSDownloadMetadata artistIdentifier](self, "artistIdentifier")), @"3");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithItemIdentifier:", -[SSDownloadMetadata collectionIdentifier](self, "collectionIdentifier")), @"4");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithItemIdentifier:", -[SSDownloadMetadata composerIdentifier](self, "composerIdentifier")), @"5");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithItemIdentifier:", -[SSDownloadMetadata genreIdentifier](self, "genreIdentifier")), @"6");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithItemIdentifier:", -[SSDownloadMetadata itemIdentifier](self, "itemIdentifier")), @"7");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithItemIdentifier:", -[SSDownloadMetadata preOrderIdentifier](self, "preOrderIdentifier")), @"H");
  if ([(SSDownloadMetadata *)self rentalID]) {
    objc_msgSend(v3, "setObject:forKey:", -[SSDownloadMetadata rentalID](self, "rentalID"), @"ri");
  }
  if ([(SSDownloadMetadata *)self hlsPlaylistURL]) {
    objc_msgSend(v3, "setObject:forKey:", -[SSDownloadMetadata hlsPlaylistURL](self, "hlsPlaylistURL"), @"hl");
  }
  id v13 = [(SSDownloadMetadata *)self valueForMetadataKey:@"com.apple.iTunesStore.downloadInfo"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v18 = 0;
LABEL_28:
    uint64_t v17 = 0;
    goto LABEL_29;
  }
  uint64_t v14 = [v13 objectForKey:@"accountInfo"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v18 = [v13 objectForKey:@"preferredAssetFlavor"];
    goto LABEL_28;
  }
  uint64_t v15 = objc_alloc_init(SSAccount);
  [(SSAccount *)v15 setLockdownDictionary:v14];
  uint64_t v16 = [(SSAccount *)v15 uniqueIdentifier];
  uint64_t v17 = [(SSAccount *)v15 accountName];

  uint64_t v18 = [v13 objectForKey:@"preferredAssetFlavor"];
  if (v16) {
    [v3 setObject:v16 forKey:@"U"];
  }
LABEL_29:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    uint64_t v17 = [(SSDownloadMetadata *)self valueForMetadataKey:@"appleId"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 setObject:v17 forKey:@"Z"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 setObject:v18 forKey:@"09"];
  }
  return v3;
}

- (NSNumber)numberOfBytesToHash
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"chunks", 0];
  objc_opt_class();
  id v3 = 0;
  if (objc_opt_isKindOfClass()) {
    id v3 = (NSNumber *)[v2 objectForKey:@"chunkSize"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v3;
  }
  else {
    return 0;
  }
}

- (NSString)pageProgressionDirection
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"page-progression-direction", @"pageProgressionDirection", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (NSString)preferredAssetFlavor
{
  id v2 = [(SSDownloadMetadata *)self valueForMetadataKey:@"com.apple.iTunesStore.downloadInfo"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v3 = (void *)[v2 objectForKey:@"preferredAssetFlavor"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = (void *)[v3 copy];
  return (NSString *)v4;
}

- (id)publicationVersion
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"publication-version", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (unint64_t)preOrderIdentifier
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"preorder-id", 0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return [v2 itemIdentifierValue];
}

- (NSURL)primaryAssetURL
{
  id v2 = [(SSDownloadMetadata *)self _valueForFirstAvailableTopLevelKey:@"URL", @"url", 0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v3 = (void *)MEMORY[0x1E4F1CB10];
  return (NSURL *)[v3 URLWithString:v2];
}

- (NSString)redownloadActionParameters
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"buy-params-256", @"buyParams", @"action-params", @"redownload-params", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (NSString)releaseDateString
{
  id v3 = [(SSDownloadMetadata *)self _releaseDateValue];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [(SSDownloadMetadata *)self _newDateFormatter];
    id v3 = (NSString *)[v4 stringFromDate:v3];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v3;
  }
  else {
    return 0;
  }
}

- (NSNumber)requestPersistentID
{
  id v2 = [(SSDownloadMetadata *)self valueForMetadataKey:@"com.apple.iTunesStore.downloadInfo"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v3 = (void *)[v2 objectForKey:@"requestPersistentID"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v4 = (void *)[v3 copy];
  return (NSNumber *)v4;
}

- (id)requiredDeviceCapabilities
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"UIRequiredDeviceCapabilities", 0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
  }
  return v2;
}

- (void)setAutomaticDownload:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];
  [(SSDownloadMetadata *)self setValue:v4 forMetadataKey:@"is-auto-download"];
}

- (void)setCancelDownloadURL:(id)a3
{
  uint64_t v4 = [a3 absoluteString];
  [(SSDownloadMetadata *)self setValue:v4 forMetadataKey:@"cancel-download-url"];
}

- (void)setCopyright:(id)a3
{
}

- (void)setDictionary:(id)a3
{
  [(NSLock *)self->_lock lock];
  dictionary = self->_dictionary;
  if (dictionary != a3)
  {

    self->_dictionary = (NSMutableDictionary *)[a3 mutableCopy];
  }
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (void)setDownloadKey:(id)a3
{
}

- (void)setDownloadPermalink:(id)a3
{
}

- (void)setEpubRightsData:(id)a3
{
}

- (void)setFileExtension:(id)a3
{
}

- (void)setKeyStyle:(int64_t)a3
{
  [(NSLock *)self->_lock lock];
  self->_int64_t keyStyle = a3;
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (void)setMD5HashStrings:(id)a3 numberOfBytesToHash:(id)a4
{
  if (![a3 count])
  {
    [(SSDownloadMetadata *)self setValue:0 forMetadataKey:@"chunks"];
    uint64_t v8 = self;
    uint64_t v7 = 0;
    goto LABEL_5;
  }
  if ([a3 count] == 1)
  {
    [(SSDownloadMetadata *)self setValue:0 forMetadataKey:@"chunks"];
    uint64_t v7 = [a3 objectAtIndex:0];
    uint64_t v8 = self;
LABEL_5:
    [(SSDownloadMetadata *)v8 setValue:v7 forMetadataKey:@"md5"];
    return;
  }
  id v9 = (id)objc_msgSend(-[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", @"chunks", 0), "mutableCopy");
  if (!v9) {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v10 = v9;
  [v9 setObject:a3 forKey:@"chunks"];
  [v10 setObject:a4 forKey:@"chunkSize"];
  [(SSDownloadMetadata *)self setValue:v10 forMetadataKey:@"chunks"];
  [(SSDownloadMetadata *)self setValue:0 forMetadataKey:@"md5"];
}

- (void)setPageProgressionDirection:(id)a3
{
}

- (void)setPublicationVersion:(id)a3
{
}

- (void)setPreferredAssetFlavor:(id)a3
{
  id v5 = [(SSDownloadMetadata *)self valueForMetadataKey:@"com.apple.iTunesStore.downloadInfo"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = (void *)[v5 mutableCopy];
  }
  else {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
  }
  id v7 = v6;
  if (a3) {
    [v6 setObject:a3 forKey:@"preferredAssetFlavor"];
  }
  else {
    [v6 removeObjectForKey:@"preferredAssetFlavor"];
  }
  [(SSDownloadMetadata *)self setValue:v7 forMetadataKey:@"com.apple.iTunesStore.downloadInfo"];
}

- (void)setPreOrderIdentifier:(unint64_t)a3
{
  uint64_t v4 = [NSNumber numberWithItemIdentifier:a3];
  [(SSDownloadMetadata *)self setValue:v4 forMetadataKey:@"preorder-id"];
}

- (void)setPrimaryAssetURL:(id)a3
{
  uint64_t v4 = [a3 absoluteString];
  [(SSDownloadMetadata *)self _setValue:v4 forTopLevelKey:@"URL"];
}

- (void)setRedownloadActionParameters:(id)a3
{
}

- (void)setRedownloadDownload:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];
  [(SSDownloadMetadata *)self setValue:v4 forMetadataKey:@"is-redownload"];
}

- (void)setReleaseDateString:(id)a3
{
  if ([(SSDownloadMetadata *)self keyStyle] == 1) {
    id v5 = @"release-date";
  }
  else {
    id v5 = @"releaseDate";
  }
  [(SSDownloadMetadata *)self setValue:a3 forMetadataKey:v5];
}

- (void)setRequestPersistentID:(id)a3
{
  id v5 = [(SSDownloadMetadata *)self valueForMetadataKey:@"com.apple.iTunesStore.downloadInfo"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = (void *)[v5 mutableCopy];
  }
  else {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
  }
  id v7 = v6;
  if (a3) {
    [v6 setObject:a3 forKey:@"requestPersistentID"];
  }
  else {
    [v6 removeObjectForKey:@"requestPersistentID"];
  }
  [(SSDownloadMetadata *)self setValue:v7 forMetadataKey:@"com.apple.iTunesStore.downloadInfo"];
}

- (void)setRequiredDeviceCapabilities:(id)a3
{
}

- (void)setShouldDownloadAutomatically:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];
  [(SSDownloadMetadata *)self setValue:v4 forMetadataKey:@"auto-download"];
}

- (void)setSinfs:(id)a3
{
}

- (void)setTransitMapDataURL:(id)a3
{
  uint64_t v4 = [a3 absoluteString];
  [(SSDownloadMetadata *)self _setValue:v4 forTopLevelKey:@"transitGeoFileURL"];
}

- (void)setValue:(id)a3 forMetadataKey:(id)a4
{
  [(NSLock *)self->_lock lock];
  dictionary = self->_dictionary;
  if (!dictionary)
  {
    dictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    self->_dictionary = dictionary;
  }
  uint64_t v8 = [(NSMutableDictionary *)dictionary objectForKey:@"metadata"];
  if (v8)
  {
    id v9 = (NSMutableDictionary *)v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (objc_msgSend((id)-[NSMutableDictionary classForCoder](v9, "classForCoder"), "isEqual:", objc_opt_class()) & 1) == 0)
    {
      id v9 = (NSMutableDictionary *)[(NSMutableDictionary *)v9 mutableCopy];
      [(NSMutableDictionary *)self->_dictionary setObject:v9 forKey:@"metadata"];
    }
  }
  else
  {
    id v9 = self->_dictionary;
  }
  if (a3)
  {
    [(NSMutableDictionary *)v9 setObject:a3 forKey:a4];
  }
  else
  {
    [(NSMutableDictionary *)v9 removeObjectForKey:a4];
    [(NSMutableDictionary *)self->_dictionary removeObjectForKey:a4];
  }
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (void)setValuesFromDownload:(id)a3
{
  v42[85] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (uint64_t (**)(void))v42;
  v41[76] = sel_setArtistName_;
  v42[0] = 0;
  v42[1] = sel_setBetaExternalVersionIdentifier_;
  v42[2] = 0;
  v42[3] = sel_setBundleIdentifier_;
  v42[4] = 0;
  v42[5] = sel_setDownloadPermalink_;
  v42[6] = 0;
  v42[7] = sel_setCancelDownloadURL_;
  v42[8] = __URLValueForString;
  v42[9] = sel_setCloudIdentifier_;
  v42[10] = 0;
  v42[11] = sel_setCollectionArtistName_;
  v42[12] = 0;
  v42[13] = sel_setCollectionIndexInCollectionGroup_;
  v42[14] = 0;
  v42[15] = sel_setCollectionName_;
  v42[16] = 0;
  v42[17] = sel_setComposerName_;
  v42[18] = 0;
  v42[19] = sel_setDocumentTargetIdentifier_;
  v42[20] = 0;
  v42[21] = sel_setDownloadKey_;
  v42[22] = 0;
  v42[23] = sel_setDurationInMilliseconds_;
  v42[24] = 0;
  v42[25] = sel_setEnableExtensions_;
  v42[26] = 0;
  v42[27] = sel_setEpisodeIdentifier_;
  v42[28] = 0;
  v42[29] = sel_setEpisodeSortIdentifier_;
  v42[30] = 0;
  v42[31] = sel_setGenre_;
  v42[32] = 0;
  v42[33] = sel_setIndexInCollection_;
  v42[34] = 0;
  v42[35] = sel_setKind_;
  v42[36] = 0;
  v42[37] = sel_setLongDescription_;
  v42[38] = 0;
  v42[39] = sel_setLongSeasonDescription_;
  v42[40] = 0;
  v42[41] = sel_setMessagesArtworkURL_;
  v42[42] = __URLValueForString;
  v42[43] = sel_setNumberOfCollectionsInCollectionGroup_;
  v42[44] = 0;
  v42[45] = sel_setNumberOfItemsInCollection_;
  v42[46] = 0;
  v42[47] = sel_setPageProgressionDirection_;
  v42[48] = 0;
  v42[49] = sel_setPodcastEpisodeGUID_;
  v42[50] = 0;
  v42[51] = sel_setPodcastFeedURL_;
  v42[52] = __URLValueForString;
  v42[53] = sel_setPodcastType_;
  v42[54] = 0;
  v42[55] = sel_setPurchaseDate_;
  v42[56] = __DateValueForAbsoluteTime;
  v42[57] = sel_setReleaseDate_;
  v42[58] = __DateValueForAbsoluteTime;
  v42[59] = sel_setReleaseYear_;
  v42[60] = 0;
  v42[61] = sel_setSeasonNumber_;
  v42[62] = 0;
  v42[63] = sel_setSeriesName_;
  v42[64] = 0;
  v42[65] = sel_setShortDescription_;
  v42[66] = 0;
  v42[67] = sel_setThumbnailImageURL_;
  v42[68] = __URLValueForString;
  v42[69] = sel_setTitle_;
  v42[70] = 0;
  v42[71] = sel_setTransactionIdentifier_;
  v42[72] = 0;
  v42[73] = sel_setPublicationVersion_;
  v42[74] = 0;
  v42[75] = sel_setRedownloadActionParameters_;
  v42[76] = 0;
  v42[77] = sel_setThumbnailNewsstandBindingEdge_;
  v42[78] = 0;
  v42[79] = sel_setThumbnailNewsstandBindingType_;
  v42[80] = 0;
  v42[81] = sel_setViewStoreItemURL_;
  v42[82] = __URLValueForString;
  v42[83] = sel_setVariantIdentifier_;
  v42[84] = 0;
  v41[0] = @"d";
  v41[1] = @"27";
  v41[2] = @"c";
  v41[3] = @"p0";
  v41[4] = @"P";
  v41[5] = @"Y";
  v41[6] = @"e";
  v41[7] = @"k";
  v41[8] = @"f";
  v41[9] = @"g";
  v41[10] = @"E";
  v41[11] = @"F";
  v41[12] = @"h";
  v41[13] = @"EE";
  v41[14] = @"u";
  v41[15] = @"v";
  v41[16] = @"i";
  v41[17] = @"j";
  v41[18] = @"1";
  v41[19] = @"n";
  v41[20] = @"w";
  v41[21] = @"MA";
  v41[22] = @"o";
  v41[23] = @"p";
  v41[24] = @"13";
  v41[25] = @"A";
  v41[26] = @"B";
  v41[27] = @"C";
  v41[28] = @"8";
  v41[29] = @"q";
  v41[30] = @"r";
  v41[31] = @"y";
  v41[32] = @"z";
  v41[33] = @"s";
  v41[34] = @"G";
  v41[35] = @"2";
  v41[36] = @"9";
  v41[37] = @"p2";
  v41[38] = @"04";
  v41[39] = @"05";
  v41[40] = @"06";
  v41[41] = @"11";
  v41[42] = @"26";
  v41[43] = @"3";
  v41[44] = @"4";
  v41[45] = @"5";
  v41[46] = @"6";
  v41[47] = @"7";
  v41[48] = @"H";
  v41[49] = @"b";
  v41[50] = @"D";
  v41[51] = @"HM";
  v41[52] = @"l";
  v41[53] = @"vp";
  v41[54] = @"12";
  v41[55] = @"m";
  v41[56] = @"t";
  v41[57] = @"sr";
  v41[58] = @"tt";
  v41[59] = @"LP";
  v41[60] = @"N";
  v41[61] = @"R";
  v41[62] = @"T";
  v41[63] = @"X";
  v41[64] = @"L";
  v41[65] = @"03";
  v41[66] = @"22";
  v41[67] = @"09";
  v41[68] = @"15";
  v41[69] = @"10";
  v41[70] = @"ri";
  v41[71] = @"hl";
  v41[72] = @"PR";
  v41[73] = @"has-hdr";
  v41[74] = @"has-dolby-vision";
  v41[75] = @"has-4k";
  [a3 getValues:v7 forProperties:v41 count:76];
  for (uint64_t i = 0; i != 344; i += 8)
  {
    uint64_t v6 = *(void *)&v7[i];
    if (v6)
    {
      if (*v4)
      {
        uint64_t v6 = (*v4)(*(void *)&v7[i]);
        *(void *)&v7[i] = v6;
      }
      [(SSDownloadMetadata *)self performSelector:*(v4 - 1) withObject:v6];
    }
    v4 += 2;
  }
  [(SSDownloadMetadata *)self setArtistIdentifier:SSGetItemIdentifierFromValue(v8)];
  [(SSDownloadMetadata *)self setCollectionIdentifier:SSGetItemIdentifierFromValue(v9)];
  [(SSDownloadMetadata *)self setComposerIdentifier:SSGetItemIdentifierFromValue(v10)];
  [(SSDownloadMetadata *)self setGenreIdentifier:SSGetItemIdentifierFromValue(v11)];
  [(SSDownloadMetadata *)self setItemIdentifier:SSGetItemIdentifierFromValue(v12)];
  [(SSDownloadMetadata *)self setPreOrderIdentifier:SSGetItemIdentifierFromValue(v13)];
  -[SSDownloadMetadata setArtworkIsPrerendered:](self, "setArtworkIsPrerendered:", [v14 BOOLValue]);
  -[SSDownloadMetadata setAutomaticDownload:](self, "setAutomaticDownload:", [v15 BOOLValue]);
  -[SSDownloadMetadata setHasMessagesExtension:](self, "setHasMessagesExtension:", [v16 BOOLValue]);
  -[SSDownloadMetadata setCompilation:](self, "setCompilation:", [v17 BOOLValue]);
  -[SSDownloadMetadata setDeviceBasedVPP:](self, "setDeviceBasedVPP:", [v18 BOOLValue]);
  -[SSDownloadMetadata setExplicitContent:](self, "setExplicitContent:", [v19 BOOLValue]);
  -[SSDownloadMetadata setRental:](self, "setRental:", [v20 BOOLValue]);
  -[SSDownloadMetadata setSample:](self, "setSample:", [v21 BOOLValue]);
  -[SSDownloadMetadata setSharedResource:](self, "setSharedResource:", [v22 BOOLValue]);
  -[SSDownloadMetadata setTvTemplate:](self, "setTvTemplate:", [v23 BOOLValue]);
  -[SSDownloadMetadata setLaunchProhibited:](self, "setLaunchProhibited:", [v24 BOOLValue]);
  [(SSDownloadMetadata *)self setValue:v25 forMetadataKey:@"software-type"];
  [(SSDownloadMetadata *)self setValue:v26 forMetadataKey:@"softwareVersionExternalIdentifier"];
  [(SSDownloadMetadata *)self setValue:v27 forMetadataKey:@"s"];
  [(SSDownloadMetadata *)self setValue:v28 forMetadataKey:@"xid"];
  [(SSDownloadMetadata *)self setValue:v29 forMetadataKey:@"artwork-template-name"];
  [(SSDownloadMetadata *)self setValue:v30 forMetadataKey:@"is-in-queue"];
  [(SSDownloadMetadata *)self setValue:v31 forMetadataKey:@"storeCohort"];
  [(SSDownloadMetadata *)self setPreferredAssetFlavor:v32];
  -[SSDownloadMetadata setHighDefinition:](self, "setHighDefinition:", [v33 BOOLValue]);
  [(SSDownloadMetadata *)self setValue:v34 forMetadataKey:@"cancelIfDuplicate"];
  [(SSDownloadMetadata *)self setValue:v35 forMetadataKey:@"ri"];
  [(SSDownloadMetadata *)self setValue:v36 forMetadataKey:@"hl"];
  [(SSDownloadMetadata *)self setValue:v37 forMetadataKey:@"PR"];
  [(SSDownloadMetadata *)self setValue:v38 forMetadataKey:@"HR"];
  [(SSDownloadMetadata *)self setValue:v39 forMetadataKey:@"DV"];
  [(SSDownloadMetadata *)self setValue:v40 forMetadataKey:@"FK"];
}

- (BOOL)shouldDownloadAutomatically
{
  id v2 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"auto-download", 0];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v2 BOOLValue];
}

- (NSArray)sinfs
{
  id v3 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"sinfs", 0];
  if (SSDownloadKindIsSoftwareKind([(SSDownloadMetadata *)self kind]))
  {
    [(NSLock *)self->_lock lock];
    uint64_t v4 = (void *)[(NSMutableDictionary *)self->_dictionary objectForKey:@"thinned-app"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v3 = (NSArray *)[v4 valueForKey:@"sinfs"];
    }
    [(NSLock *)self->_lock unlock];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v3;
  }
  else {
    return 0;
  }
}

- (NSURL)transitMapDataURL
{
  id v2 = [(SSDownloadMetadata *)self _valueForFirstAvailableTopLevelKey:@"transitGeoFileURL", 0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v3 = (void *)MEMORY[0x1E4F1CB10];
  return (NSURL *)[v3 URLWithString:v2];
}

- (id)valueForFirstAvailableKey:(id)a3
{
  [(NSLock *)self->_lock lock];
  id v5 = [(SSDownloadMetadata *)self _assetDictionary];
  uint64_t v6 = (void *)[(NSMutableDictionary *)self->_dictionary objectForKey:@"metadata"];
  if (!v6) {
    uint64_t v6 = (void *)[v5 objectForKey:@"metadata"];
  }
  uint64_t v12 = (id *)&v13;
  if (a3)
  {
    do
    {
      id v7 = (void *)[v5 objectForKey:a3];
      if (!v7)
      {
        id v7 = (void *)[v6 objectForKey:a3];
        if (!v7) {
          id v7 = (void *)[(NSMutableDictionary *)self->_dictionary objectForKey:a3];
        }
      }
      id v8 = v7;
      uint64_t v9 = v12++;
      a3 = *v9;
      if (*v9) {
        BOOL v10 = v7 == 0;
      }
      else {
        BOOL v10 = 0;
      }
    }
    while (v10);
  }
  else
  {
    id v7 = 0;
  }
  [(NSLock *)self->_lock unlock];
  return v7;
}

- (id)valueForMetadataKey:(id)a3
{
  return -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", a3, 0);
}

- (id)_assetDictionary
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[(NSMutableDictionary *)self->_dictionary objectForKey:@"metadata"];
  uint64_t v4 = (void *)[v3 objectForKey:@"kind"];
  id v5 = (void *)[(NSMutableDictionary *)self->_dictionary objectForKey:@"assets"];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      id v5 = 0;
    }
  }
  if (!v4)
  {
    uint64_t v4 = (void *)[(NSMutableDictionary *)self->_dictionary objectForKey:@"kind"];
    if (!v4)
    {
      uint64_t v6 = (void *)[v5 firstObject];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (id v7 = (void *)[v6 objectForKey:@"metadata"],
            objc_opt_class(),
            (objc_opt_isKindOfClass() & 1) != 0))
      {
        uint64_t v4 = (void *)[v7 objectForKey:@"kind"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          uint64_t v4 = 0;
        }
      }
      else
      {
        uint64_t v4 = 0;
      }
    }
  }
  id v8 = (id)[(NSMutableDictionary *)self->_dictionary objectForKey:@"thinned-app"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (SSDownloadKindIsSoftwareKind(v4) & 1) == 0)
  {
    uint64_t v9 = [(NSMutableDictionary *)self->_dictionary objectForKey:@"hls-playlist-url"];
    BOOL v10 = (void *)[(NSMutableDictionary *)self->_dictionary objectForKey:@"has-hdr"];
    int v11 = SSDeviceSupportsHDRDownload();
    uint64_t v12 = (void *)[(NSMutableDictionary *)self->_dictionary objectForKey:@"is-premium"];
    if (v11 && ([v10 BOOLValue] & 1) != 0) {
      int v13 = 1;
    }
    else {
      int v13 = [v12 BOOLValue];
    }
    if (SSDownloadKindIsVideosAppKind(v4))
    {
      uint64_t v9 = [(id)objc_opt_class() _addPlaybackTypeToHLSPlaylistURLString:v9];
      int v13 = 1;
    }
    if (![v5 count])
    {
      uint64_t v19 = [(NSMutableDictionary *)self->_dictionary objectForKey:@"asset-info"];
      id v8 = 0;
LABEL_57:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & v13) == 1 && SSDownloadKindIsVideoKind(v4))
      {
        uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
        [v32 setObject:v9 forKey:@"URL"];
        [v32 setObject:MEMORY[0x1E4F1CC38] forKey:@"is-hls"];
        [v32 setObject:@"movpkg" forKey:@"fileExtension"];
        if (v8 || (id v8 = (id)v19) != 0)
        {
          uint64_t v33 = [v8 objectForKey:@"file-size"];
          if (v33)
          {
            uint64_t v40 = @"file-size";
            uint64_t v41 = v33;
            objc_msgSend(v32, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1), @"asset-info");
          }
        }
        id v8 = (id)[v32 copy];
      }
      return v8;
    }
    int v35 = v13;
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v15 = (void *)[v3 objectForKey:@"com.apple.iTunesStore.downloadInfo"];
    if (!v15) {
      id v15 = (void *)[(NSMutableDictionary *)self->_dictionary objectForKey:@"com.apple.iTunesStore.downloadInfo"];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = (void *)[v15 objectForKey:@"preferredAssetFlavor"];
      if ([v16 length]) {
        [v14 addObject:v16];
      }
    }
    if (SSDownloadKindIsVideoKind(v4))
    {
      id v18 = +[SSDevice currentDevice];
      if ([v18 supportsDeviceCapability:2]) {
        [v14 addObject:@"1080p"];
      }
      if ([v18 supportsDeviceCapability:1])
      {
        [v14 addObject:@"hdmv"];
        [v14 addObject:@"720p"];
      }
      [v14 addObject:@"480p"];
      [v14 addObject:@"SDMV"];
      [v14 addObject:@"SD"];
    }
    else if (SSDownloadKindIsEBookKind(v4, v17))
    {
      GSMainScreenScaleFactor();
      if (v20 == 1.0) {
        objc_msgSend(v14, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"lrpluspub", @"lrpub", 0));
      }
      objc_msgSend(v14, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"pluspub", @"pub", 0));
    }
    if ([v14 count])
    {
      uint64_t v21 = [v5 count];
      if (v21 >= 1)
      {
        uint64_t v22 = v21;
        uint64_t v23 = 0;
        id v8 = 0;
        uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
        do
        {
          uint64_t v25 = (void *)[v5 objectAtIndex:v23];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v26 = [v25 objectForKey:@"flavor"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v27 = [v14 indexOfObject:v26];
              if (v27 < v24)
              {
                id v8 = v25;
                uint64_t v24 = v27;
              }
            }
          }
          ++v23;
        }
        while (v22 != v23);
        goto LABEL_56;
      }
    }
    else
    {
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      uint64_t v28 = [v5 countByEnumeratingWithState:&v36 objects:v42 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v37;
LABEL_48:
        uint64_t v31 = 0;
        while (1)
        {
          if (*(void *)v37 != v30) {
            objc_enumerationMutation(v5);
          }
          id v8 = *(id *)(*((void *)&v36 + 1) + 8 * v31);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            goto LABEL_56;
          }
          if (v29 == ++v31)
          {
            uint64_t v29 = [v5 countByEnumeratingWithState:&v36 objects:v42 count:16];
            id v8 = 0;
            if (v29) {
              goto LABEL_48;
            }
            goto LABEL_56;
          }
        }
      }
    }
    id v8 = 0;
LABEL_56:

    uint64_t v19 = 0;
    int v13 = v35;
    goto LABEL_57;
  }
  return v8;
}

- (id)_dateValueForValue:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(SSDownloadMetadata *)self _newDateFormatter];
    a3 = (id)[v5 dateFromString:a3];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return a3;
  }
  else {
    return 0;
  }
}

- (id)_newImageCollectionWithURLString:(id)a3
{
  id result = (id)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:a3];
  if (result)
  {
    id v5 = result;
    uint64_t v6 = objc_alloc_init(SSItemArtworkImage);
    [(SSItemArtworkImage *)v6 setURL:v5];
    int v7 = objc_msgSend(-[SSDownloadMetadata valueForMetadataKey:](self, "valueForMetadataKey:", @"software-type"), "isEqualToString:", @"newsstand");
    id v8 = SSItemArtworkKindNewsstandIcon;
    if (!v7) {
      id v8 = SSItemArtworkKindDownloadQueueThumbnail;
    }
    [(SSItemArtworkImage *)v6 setImageKind:*v8];
    id v9 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"thumbnail-newsstand-binding-edge", 0];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SSItemArtworkImage *)v6 setValue:v9 forProperty:@"UINewsstandBindingEdge"];
    }
    id v10 = [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"thumbnail-newsstand-binding-type", 0];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SSItemArtworkImage *)v6 setValue:v10 forProperty:@"UINewsstandBindingType"];
    }
    int v11 = [SSItemImageCollection alloc];
    uint64_t v12 = -[SSItemImageCollection initWithItemImages:](v11, "initWithItemImages:", [MEMORY[0x1E4F1C978] arrayWithObject:v6]);

    return v12;
  }
  return result;
}

- (id)_newDateFormatter
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v2 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
  [v2 setLenient:1];
  objc_msgSend(v2, "setTimeZone:", objc_msgSend(MEMORY[0x1E4F1CAF0], "timeZoneForSecondsFromGMT:", 0));
  return v2;
}

- (id)_releaseDateValue
{
  return [(SSDownloadMetadata *)self valueForFirstAvailableKey:@"releaseDate", @"release-date", 0];
}

- (void)_setValue:(id)a3 forTopLevelKey:(id)a4
{
  [(NSLock *)self->_lock lock];
  dictionary = self->_dictionary;
  if (dictionary)
  {
    if (a3)
    {
LABEL_3:
      [(NSMutableDictionary *)dictionary setObject:a3 forKey:a4];
      goto LABEL_6;
    }
  }
  else
  {
    dictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    self->_dictionary = dictionary;
    if (a3) {
      goto LABEL_3;
    }
  }
  [(NSMutableDictionary *)dictionary removeObjectForKey:a4];
LABEL_6:
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (void)_setValueCopy:(id)a3 forMetadataKey:(id)a4
{
  id v6 = (id)[a3 copy];
  [(SSDownloadMetadata *)self setValue:v6 forMetadataKey:a4];
}

- (id)_stringValueForValue:(id)a3
{
  if (objc_opt_isKindOfClass()) {
    a3 = (id)[a3 stringValue];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return a3;
  }
  else {
    return 0;
  }
}

- (id)_thumbnailArtworkImage
{
  id v3 = [(SSDownloadMetadata *)self thumbnailImageCollection];
  if (!objc_msgSend(-[SSDownloadMetadata valueForMetadataKey:](self, "valueForMetadataKey:", @"software-type"), "isEqualToString:", @"newsstand")|| (id v4 = -[SSItemImageCollection imagesForKind:](v3, "imagesForKind:", @"newsstand-latest-issue-icon.default")) == 0)
  {
    id v4 = [(SSItemImageCollection *)v3 imagesForKind:@"download-queue-item.default"];
  }
  id result = (id)[v4 count];
  if (result)
  {
    return (id)[v4 lastObject];
  }
  return result;
}

- (id)_urlValueForValue:(id)a3
{
  if (objc_opt_isKindOfClass()) {
    a3 = (id)[MEMORY[0x1E4F1CB10] URLWithString:a3];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return a3;
  }
  else {
    return 0;
  }
}

- (id)_valueForFirstAvailableTopLevelKey:(id)a3
{
  [(NSLock *)self->_lock lock];
  id v5 = [(SSDownloadMetadata *)self _assetDictionary];
  uint64_t v12 = (id *)&v13;
  if (a3)
  {
    id v6 = v5;
    do
    {
      int v7 = (void *)[v6 objectForKey:a3];
      if (!v7) {
        int v7 = (void *)[(NSMutableDictionary *)self->_dictionary objectForKey:a3];
      }
      id v8 = v7;
      id v9 = v12++;
      a3 = *v9;
      if (*v9) {
        BOOL v10 = v7 == 0;
      }
      else {
        BOOL v10 = 0;
      }
    }
    while (v10);
  }
  else
  {
    int v7 = 0;
  }
  [(NSLock *)self->_lock unlock];
  return v7;
}

+ (id)_addPlaybackTypeToHLSPlaylistURLString:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    id v4 = (id)[objc_alloc(MEMORY[0x1E4F29088]) initWithString:a3];
    id v5 = (id)objc_msgSend((id)objc_msgSend(v4, "percentEncodedQueryItems"), "mutableCopy");
    if (!v5) {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    id v6 = (id)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"playback-type" value:@"download"];
    if (v6) {
      [v5 addObject:v6];
    }
    [v4 setPercentEncodedQueryItems:v5];
    int v7 = objc_msgSend((id)objc_msgSend(v4, "URL"), "absoluteString");
    if (v7) {
      return v7;
    }
  }
  return v3;
}

@end