@interface RadioStation
- (BOOL)editEnabled;
- (BOOL)hasSkipRules;
- (BOOL)isDatabaseBacked;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExplicit;
- (BOOL)isFeatured;
- (BOOL)isGatewayVideoAdEnabled;
- (BOOL)isPremiumPlacement;
- (BOOL)isPreview;
- (BOOL)isPreviewOnly;
- (BOOL)isShared;
- (BOOL)isSharingEnabled;
- (BOOL)isSponsored;
- (BOOL)isSubscribed;
- (BOOL)likesEnabled;
- (BOOL)requiresSubscription;
- (BOOL)skipEnabled;
- (BOOL)virtualPlayEnabled;
- (NSArray)editableFields;
- (NSArray)skipTimestamps;
- (NSArray)trackPlaybackDescriptorQueue;
- (NSData)adData;
- (NSData)artworkURLData;
- (NSDictionary)debugDictionary;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)feedbackDictionaryRepresentation;
- (NSManagedObject)managedObject;
- (NSString)coreSeedName;
- (NSString)name;
- (NSString)shareToken;
- (NSString)skipIdentifier;
- (NSString)stationDescription;
- (NSString)stationHash;
- (NSString)stationStringID;
- (NSURL)artworkURL;
- (NSURL)streamCertificateURL;
- (NSURL)streamKeyURL;
- (NSURL)streamURL;
- (RadioArtworkCollection)artworkCollection;
- (RadioModel)model;
- (RadioStation)initWithModel:(id)a3 managedObject:(id)a4;
- (double)skipInterval;
- (id)artworkURLForSize:(CGSize)a3 expectedSize:(CGSize *)a4;
- (id)seedTracks;
- (int)skipFrequency;
- (int)sortOrder;
- (int)subscriberCount;
- (int64_t)adamID;
- (int64_t)persistentID;
- (int64_t)songMixType;
- (int64_t)stationID;
- (unint64_t)hash;
- (unint64_t)impressionThreshold;
- (void)_radioModelWasDeletedNotification:(id)a3;
- (void)dealloc;
- (void)setAdData:(id)a3;
- (void)setAdamID:(int64_t)a3;
- (void)setArtworkURL:(id)a3;
- (void)setArtworkURLData:(id)a3;
- (void)setCoreSeedName:(id)a3;
- (void)setDebugDictionary:(id)a3;
- (void)setEditEnabled:(BOOL)a3;
- (void)setEditableFields:(id)a3;
- (void)setFeatured:(BOOL)a3;
- (void)setGatewayVideoAdEnabled:(BOOL)a3;
- (void)setHasSkipRules:(BOOL)a3;
- (void)setImpressionThreshold:(unint64_t)a3;
- (void)setIsExplicit:(BOOL)a3;
- (void)setLikesEnabled:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPersistentID:(int64_t)a3;
- (void)setPremiumPlacement:(BOOL)a3;
- (void)setPreviewOnly:(BOOL)a3;
- (void)setRequiresSubscription:(BOOL)a3;
- (void)setSeedTracks:(id)a3;
- (void)setShareToken:(id)a3;
- (void)setShared:(BOOL)a3;
- (void)setSharingEnabled:(BOOL)a3;
- (void)setSkipEnabled:(BOOL)a3;
- (void)setSkipFrequency:(int)a3;
- (void)setSkipIdentifier:(id)a3;
- (void)setSkipInterval:(double)a3;
- (void)setSkipTimestamps:(id)a3;
- (void)setSongMixType:(int64_t)a3;
- (void)setSortOrder:(int)a3;
- (void)setSponsored:(BOOL)a3;
- (void)setStationDescription:(id)a3;
- (void)setStationHash:(id)a3;
- (void)setStationID:(int64_t)a3;
- (void)setStationStringID:(id)a3;
- (void)setStreamCertificateURL:(id)a3;
- (void)setStreamKeyURL:(id)a3;
- (void)setStreamURL:(id)a3;
- (void)setSubscribed:(BOOL)a3;
- (void)setSubscriberCount:(int)a3;
- (void)setTrackPlaybackDescriptorQueue:(id)a3;
- (void)setVirtualPlayEnabled:(BOOL)a3;
@end

@implementation RadioStation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamKeyURL, 0);
  objc_storeStrong((id *)&self->_streamCertificateURL, 0);
  objc_storeStrong((id *)&self->_streamURL, 0);
  objc_storeStrong((id *)&self->_stationStringID, 0);
  objc_storeStrong((id *)&self->_stationHash, 0);
  objc_storeStrong((id *)&self->_stationDescription, 0);
  objc_storeStrong((id *)&self->_skipTimestamps, 0);
  objc_storeStrong((id *)&self->_skipIdentifier, 0);
  objc_storeStrong((id *)&self->_shareToken, 0);
  objc_storeStrong(&self->_seedTracks, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_editableFields, 0);
  objc_storeStrong((id *)&self->_debugDictionary, 0);
  objc_storeStrong((id *)&self->_coreSeedName, 0);
  objc_storeStrong((id *)&self->_artworkURLData, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_adData, 0);
  objc_storeStrong((id *)&self->_trackPlaybackDescriptorQueue, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_managedObject, 0);
}

- (void)setTrackPlaybackDescriptorQueue:(id)a3
{
}

- (NSArray)trackPlaybackDescriptorQueue
{
  return self->_trackPlaybackDescriptorQueue;
}

- (RadioModel)model
{
  return self->_model;
}

- (NSManagedObject)managedObject
{
  return self->_managedObject;
}

- (BOOL)isDatabaseBacked
{
  return self->_databaseBacked;
}

- (BOOL)isPreview
{
  return [(RadioStation *)self stationID] == 0;
}

- (NSDictionary)feedbackDictionaryRepresentation
{
  v3 = [(RadioStation *)self dictionaryRepresentation];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(RadioStation *)self debugDictionary];
  if (v5) {
    [v4 setObject:v5 forKey:@"debug-dict"];
  }
  v6 = (void *)[v4 copy];

  return (NSDictionary *)v6;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if ([(RadioStation *)self stationID])
  {
    v4 = objc_msgSend(NSNumber, "numberWithLongLong:", -[RadioStation stationID](self, "stationID"));
    [v3 setObject:v4 forKey:@"station-id"];
  }
  v5 = [(RadioStation *)self stationHash];

  if (v5)
  {
    v6 = [(RadioStation *)self stationHash];
    [v3 setObject:v6 forKey:@"station-hash"];
  }
  v7 = [(RadioStation *)self stationDescription];

  if (v7)
  {
    v8 = [(RadioStation *)self stationDescription];
    [v3 setObject:v8 forKey:@"description"];
  }
  v9 = [(RadioStation *)self name];

  if (v9)
  {
    v10 = [(RadioStation *)self name];
    [v3 setObject:v10 forKey:@"name"];
  }
  if ([(RadioStation *)self adamID])
  {
    v11 = objc_msgSend(NSNumber, "numberWithLongLong:", -[RadioStation adamID](self, "adamID"));
    [v3 setObject:v11 forKey:@"adam-id"];
  }
  if ([(RadioStation *)self songMixType])
  {
    v12 = objc_msgSend(NSNumber, "numberWithInt:", -[RadioStation songMixType](self, "songMixType"));
    [v3 setObject:v12 forKey:@"mix-type"];
  }
  v13 = [(RadioStation *)self seedTracks];

  if (v13)
  {
    v14 = [(RadioStation *)self seedTracks];
    [v3 setObject:v14 forKey:@"seeds"];
  }
  return (NSDictionary *)v3;
}

- (id)artworkURLForSize:(CGSize)a3 expectedSize:(CGSize *)a4
{
  double height = a3.height;
  double width = a3.width;
  v8 = [(RadioStation *)self artworkCollection];
  v9 = objc_msgSend(v8, "bestArtworkForPointSize:", width, height);
  v10 = v9;
  if (!v9) {
    goto LABEL_5;
  }
  if (a4)
  {
    [v9 pointSize];
    a4->double width = v11;
    a4->double height = v12;
  }
  v13 = [v10 URL];
  if (!v13)
  {
LABEL_5:
    v13 = [(RadioStation *)self artworkURL];
    if ([v13 isFileURL])
    {

      v13 = 0;
    }
  }

  return v13;
}

- (RadioArtworkCollection)artworkCollection
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = [(RadioStation *)self artworkURLData];
  if ([v3 length])
  {
    v4 = [MEMORY[0x263F08AC0] propertyListWithData:v3 options:0 format:0 error:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [[RadioArtworkCollection alloc] initWithArtworkVariants:v4];

      if (v5) {
        goto LABEL_13;
      }
    }
    else
    {
    }
  }
  v6 = [(RadioStation *)self artworkURL];
  if (v6)
  {
    v7 = -[RadioArtwork initWithArtworkURL:pixelSize:]([RadioArtwork alloc], "initWithArtworkURL:pixelSize:", v6, 0.0, 0.0);
    if (v7)
    {
      v8 = [RadioArtworkCollection alloc];
      v11[0] = v7;
      v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
      v5 = [(RadioArtworkCollection *)v8 initWithArtworks:v9];
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

LABEL_13:
  return v5;
}

- (void)setVirtualPlayEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RadioStation *)self isDatabaseBacked])
  {
    id v8 = [(RadioStation *)self managedObject];
    uint64_t v5 = [v8 managedObjectContext];
    if (v5)
    {
      v6 = (void *)v5;
      char v7 = [v8 isDeleted];

      if ((v7 & 1) == 0) {
        [v8 setVirtualPlayEnabled:v3];
      }
    }
  }
  else
  {
    self->_virtualPlayEnabled = v3;
  }
}

- (BOOL)virtualPlayEnabled
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    BOOL v3 = [(RadioStation *)self managedObject];
    uint64_t v11 = 0;
    CGFloat v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    v4 = [v3 managedObjectContext];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __34__RadioStation_virtualPlayEnabled__block_invoke;
    v8[3] = &unk_2643AA670;
    id v5 = v3;
    id v9 = v5;
    v10 = &v11;
    [v4 performBlockAndWait:v8];

    int virtualPlayEnabled = *((unsigned __int8 *)v12 + 24);
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    int virtualPlayEnabled = self->_virtualPlayEnabled;
  }
  return virtualPlayEnabled != 0;
}

uint64_t __34__RadioStation_virtualPlayEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) virtualPlayEnabled];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (void)setSubscriberCount:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(RadioStation *)self isDatabaseBacked])
  {
    id v8 = [(RadioStation *)self managedObject];
    uint64_t v5 = [v8 managedObjectContext];
    if (v5)
    {
      v6 = (void *)v5;
      char v7 = [v8 isDeleted];

      if ((v7 & 1) == 0) {
        [v8 setSubscriberCount:v3];
      }
    }
  }
  else
  {
    self->_subscriberCount = v3;
  }
}

- (int)subscriberCount
{
  if (![(RadioStation *)self isDatabaseBacked]) {
    return self->_subscriberCount;
  }
  uint64_t v3 = [(RadioStation *)self managedObject];
  uint64_t v11 = 0;
  CGFloat v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  v4 = [v3 managedObjectContext];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __31__RadioStation_subscriberCount__block_invoke;
  v8[3] = &unk_2643AA670;
  id v5 = v3;
  id v9 = v5;
  v10 = &v11;
  [v4 performBlockAndWait:v8];

  int v6 = *((_DWORD *)v12 + 6);
  _Block_object_dispose(&v11, 8);

  return v6;
}

uint64_t __31__RadioStation_subscriberCount__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) subscriberCount];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (void)setStreamKeyURL:(id)a3
{
  id v9 = a3;
  if ([(RadioStation *)self isDatabaseBacked])
  {
    streamKeyURL = [(RadioStation *)self managedObject];
    uint64_t v5 = [streamKeyURL managedObjectContext];
    if (v5)
    {
      int v6 = (void *)v5;
      char v7 = [streamKeyURL isDeleted];

      if ((v7 & 1) == 0) {
        [streamKeyURL setStreamKeyURL:v9];
      }
    }
  }
  else
  {
    id v8 = (NSURL *)v9;
    streamKeyURL = self->_streamKeyURL;
    self->_streamKeyURL = v8;
  }
}

- (NSURL)streamKeyURL
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    uint64_t v3 = [(RadioStation *)self managedObject];
    uint64_t v11 = 0;
    CGFloat v12 = &v11;
    uint64_t v13 = 0x3032000000;
    int v14 = __Block_byref_object_copy_;
    v15 = __Block_byref_object_dispose_;
    id v16 = 0;
    v4 = [v3 managedObjectContext];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __28__RadioStation_streamKeyURL__block_invoke;
    v8[3] = &unk_2643AA670;
    id v5 = v3;
    id v9 = v5;
    v10 = &v11;
    [v4 performBlockAndWait:v8];

    int v6 = (NSURL *)(id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    int v6 = self->_streamKeyURL;
  }
  return v6;
}

uint64_t __28__RadioStation_streamKeyURL__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) streamKeyURL];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (void)setStreamCertificateURL:(id)a3
{
  id v9 = a3;
  if ([(RadioStation *)self isDatabaseBacked])
  {
    streamCertificateURL = [(RadioStation *)self managedObject];
    uint64_t v5 = [streamCertificateURL managedObjectContext];
    if (v5)
    {
      int v6 = (void *)v5;
      char v7 = [streamCertificateURL isDeleted];

      if ((v7 & 1) == 0) {
        [streamCertificateURL setStreamCertificateURL:v9];
      }
    }
  }
  else
  {
    id v8 = (NSURL *)v9;
    streamCertificateURL = self->_streamCertificateURL;
    self->_streamCertificateURL = v8;
  }
}

- (NSURL)streamCertificateURL
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    uint64_t v3 = [(RadioStation *)self managedObject];
    uint64_t v11 = 0;
    CGFloat v12 = &v11;
    uint64_t v13 = 0x3032000000;
    int v14 = __Block_byref_object_copy_;
    v15 = __Block_byref_object_dispose_;
    id v16 = 0;
    v4 = [v3 managedObjectContext];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __36__RadioStation_streamCertificateURL__block_invoke;
    v8[3] = &unk_2643AA670;
    id v5 = v3;
    id v9 = v5;
    v10 = &v11;
    [v4 performBlockAndWait:v8];

    int v6 = (NSURL *)(id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    int v6 = self->_streamCertificateURL;
  }
  return v6;
}

uint64_t __36__RadioStation_streamCertificateURL__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) streamCertificateURL];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (void)setStreamURL:(id)a3
{
  id v9 = a3;
  if ([(RadioStation *)self isDatabaseBacked])
  {
    streamURL = [(RadioStation *)self managedObject];
    uint64_t v5 = [streamURL managedObjectContext];
    if (v5)
    {
      int v6 = (void *)v5;
      char v7 = [streamURL isDeleted];

      if ((v7 & 1) == 0) {
        [streamURL setStreamURL:v9];
      }
    }
  }
  else
  {
    id v8 = (NSURL *)v9;
    streamURL = self->_streamURL;
    self->_streamURL = v8;
  }
}

- (NSURL)streamURL
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    uint64_t v3 = [(RadioStation *)self managedObject];
    uint64_t v11 = 0;
    CGFloat v12 = &v11;
    uint64_t v13 = 0x3032000000;
    int v14 = __Block_byref_object_copy_;
    v15 = __Block_byref_object_dispose_;
    id v16 = 0;
    v4 = [v3 managedObjectContext];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __25__RadioStation_streamURL__block_invoke;
    v8[3] = &unk_2643AA670;
    id v5 = v3;
    id v9 = v5;
    v10 = &v11;
    [v4 performBlockAndWait:v8];

    int v6 = (NSURL *)(id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    int v6 = self->_streamURL;
  }
  return v6;
}

uint64_t __25__RadioStation_streamURL__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) streamURL];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (void)setStationID:(int64_t)a3
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    id v8 = [(RadioStation *)self managedObject];
    uint64_t v5 = [v8 managedObjectContext];
    if (v5)
    {
      int v6 = (void *)v5;
      char v7 = [v8 isDeleted];

      if ((v7 & 1) == 0) {
        [v8 setStationID:a3];
      }
    }
  }
  else
  {
    self->_stationID = a3;
  }
}

- (int64_t)stationID
{
  if (![(RadioStation *)self isDatabaseBacked]) {
    return self->_stationID;
  }
  uint64_t v3 = [(RadioStation *)self managedObject];
  uint64_t v11 = 0;
  CGFloat v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v4 = [v3 managedObjectContext];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __25__RadioStation_stationID__block_invoke;
  v8[3] = &unk_2643AA670;
  id v5 = v3;
  id v9 = v5;
  v10 = &v11;
  [v4 performBlockAndWait:v8];

  int64_t v6 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v6;
}

uint64_t __25__RadioStation_stationID__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) stationID];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (void)setStationStringID:(id)a3
{
  v4 = (NSString *)a3;
  if ([(RadioStation *)self isDatabaseBacked])
  {
    id v5 = [(RadioStation *)self managedObject];
    int64_t v6 = [v5 managedObjectContext];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __35__RadioStation_setStationStringID___block_invoke;
    v10[3] = &unk_2643AA1C0;
    id v11 = v5;
    CGFloat v12 = v4;
    id v7 = v5;
    [v6 performBlockAndWait:v10];
  }
  else if (self->_stationStringID != v4)
  {
    id v8 = (NSString *)[(NSString *)v4 copy];
    stationStringID = self->_stationStringID;
    self->_stationStringID = v8;
  }
}

uint64_t __35__RadioStation_setStationStringID___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 setStationStringID:v4];
  }
  return result;
}

- (NSString)stationStringID
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    uint64_t v3 = [(RadioStation *)self managedObject];
    uint64_t v11 = 0;
    CGFloat v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = __Block_byref_object_copy_;
    v15 = __Block_byref_object_dispose_;
    id v16 = 0;
    uint64_t v4 = [v3 managedObjectContext];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __31__RadioStation_stationStringID__block_invoke;
    v8[3] = &unk_2643AA670;
    id v5 = v3;
    id v9 = v5;
    v10 = &v11;
    [v4 performBlockAndWait:v8];

    int64_t v6 = (NSString *)(id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    int64_t v6 = self->_stationStringID;
  }
  return v6;
}

uint64_t __31__RadioStation_stationStringID__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) stationStringID];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (void)setStationHash:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  if ([(RadioStation *)self isDatabaseBacked])
  {
    id v5 = [(RadioStation *)self managedObject];
    int64_t v6 = [v5 managedObjectContext];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __31__RadioStation_setStationHash___block_invoke;
    v10[3] = &unk_2643AA1C0;
    id v11 = v5;
    CGFloat v12 = v4;
    id v7 = v5;
    [v6 performBlockAndWait:v10];
  }
  else if (self->_stationHash != v4)
  {
    id v8 = (NSString *)[(NSString *)v4 copy];
    stationHash = self->_stationHash;
    self->_stationHash = v8;
  }
}

uint64_t __31__RadioStation_setStationHash___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 setStationHash:v4];
  }
  return result;
}

- (NSString)stationHash
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    uint64_t v3 = [(RadioStation *)self managedObject];
    uint64_t v11 = 0;
    CGFloat v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = __Block_byref_object_copy_;
    v15 = __Block_byref_object_dispose_;
    id v16 = 0;
    uint64_t v4 = [v3 managedObjectContext];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __27__RadioStation_stationHash__block_invoke;
    v8[3] = &unk_2643AA670;
    id v5 = v3;
    id v9 = v5;
    v10 = &v11;
    [v4 performBlockAndWait:v8];

    int64_t v6 = (NSString *)(id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    int64_t v6 = self->_stationHash;
  }
  return v6;
}

uint64_t __27__RadioStation_stationHash__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) stationHash];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (void)setStationDescription:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  if ([(RadioStation *)self isDatabaseBacked])
  {
    id v5 = [(RadioStation *)self managedObject];
    int64_t v6 = [v5 managedObjectContext];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __38__RadioStation_setStationDescription___block_invoke;
    v10[3] = &unk_2643AA1C0;
    id v11 = v5;
    CGFloat v12 = v4;
    id v7 = v5;
    [v6 performBlockAndWait:v10];
  }
  else if (self->_stationDescription != v4)
  {
    id v8 = (NSString *)[(NSString *)v4 copy];
    stationDescription = self->_stationDescription;
    self->_stationDescription = v8;
  }
}

uint64_t __38__RadioStation_setStationDescription___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 setStationDescription:v4];
  }
  return result;
}

- (NSString)stationDescription
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    uint64_t v3 = [(RadioStation *)self managedObject];
    uint64_t v11 = 0;
    CGFloat v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = __Block_byref_object_copy_;
    v15 = __Block_byref_object_dispose_;
    id v16 = 0;
    uint64_t v4 = [v3 managedObjectContext];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __34__RadioStation_stationDescription__block_invoke;
    v8[3] = &unk_2643AA670;
    id v5 = v3;
    id v9 = v5;
    v10 = &v11;
    [v4 performBlockAndWait:v8];

    int64_t v6 = (NSString *)(id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    int64_t v6 = self->_stationDescription;
  }
  return v6;
}

uint64_t __34__RadioStation_stationDescription__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) stationDescription];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (void)setSortOrder:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(RadioStation *)self isDatabaseBacked])
  {
    id v8 = [(RadioStation *)self managedObject];
    uint64_t v5 = [v8 managedObjectContext];
    if (v5)
    {
      int64_t v6 = (void *)v5;
      char v7 = [v8 isDeleted];

      if ((v7 & 1) == 0) {
        [v8 setSortOrder:v3];
      }
    }
  }
  else
  {
    self->_sortOrder = v3;
  }
}

- (int)sortOrder
{
  if (![(RadioStation *)self isDatabaseBacked]) {
    return self->_sortOrder;
  }
  uint64_t v3 = [(RadioStation *)self managedObject];
  uint64_t v11 = 0;
  CGFloat v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  uint64_t v4 = [v3 managedObjectContext];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __25__RadioStation_sortOrder__block_invoke;
  v8[3] = &unk_2643AA670;
  id v5 = v3;
  id v9 = v5;
  v10 = &v11;
  [v4 performBlockAndWait:v8];

  int v6 = *((_DWORD *)v12 + 6);
  _Block_object_dispose(&v11, 8);

  return v6;
}

uint64_t __25__RadioStation_sortOrder__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) sortOrder];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (void)setSongMixType:(int64_t)a3
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    id v8 = [(RadioStation *)self managedObject];
    uint64_t v5 = [v8 managedObjectContext];
    if (v5)
    {
      int v6 = (void *)v5;
      char v7 = [v8 isDeleted];

      if ((v7 & 1) == 0) {
        [v8 setSongMixType:a3];
      }
    }
  }
  else
  {
    self->_songMixType = a3;
  }
}

- (int64_t)songMixType
{
  if (![(RadioStation *)self isDatabaseBacked]) {
    return self->_songMixType;
  }
  uint64_t v3 = [(RadioStation *)self managedObject];
  uint64_t v11 = 0;
  CGFloat v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  uint64_t v4 = [v3 managedObjectContext];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __27__RadioStation_songMixType__block_invoke;
  v8[3] = &unk_2643AA670;
  id v5 = v3;
  id v9 = v5;
  v10 = &v11;
  [v4 performBlockAndWait:v8];

  int64_t v6 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v6;
}

uint64_t __27__RadioStation_songMixType__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) songMixType];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (void)setSkipTimestamps:(id)a3
{
  uint64_t v4 = (NSArray *)a3;
  if ([(RadioStation *)self isDatabaseBacked])
  {
    id v5 = [(RadioStation *)self managedObject];
    int64_t v6 = [v5 managedObjectContext];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __34__RadioStation_setSkipTimestamps___block_invoke;
    v10[3] = &unk_2643AA1C0;
    id v11 = v5;
    CGFloat v12 = v4;
    id v7 = v5;
    [v6 performBlockAndWait:v10];
  }
  else if (self->_skipTimestamps != v4)
  {
    id v8 = (NSArray *)[(NSArray *)v4 copy];
    skipTimestamps = self->_skipTimestamps;
    self->_skipTimestamps = v8;
  }
}

uint64_t __34__RadioStation_setSkipTimestamps___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 setSkipTimestamps:v4];
  }
  return result;
}

- (NSArray)skipTimestamps
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    uint64_t v3 = [(RadioStation *)self managedObject];
    uint64_t v11 = 0;
    CGFloat v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = __Block_byref_object_copy_;
    v15 = __Block_byref_object_dispose_;
    id v16 = 0;
    uint64_t v4 = [v3 managedObjectContext];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __30__RadioStation_skipTimestamps__block_invoke;
    v8[3] = &unk_2643AA670;
    id v5 = v3;
    id v9 = v5;
    v10 = &v11;
    [v4 performBlockAndWait:v8];

    int64_t v6 = (NSArray *)(id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    int64_t v6 = self->_skipTimestamps;
  }
  return v6;
}

uint64_t __30__RadioStation_skipTimestamps__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) skipTimestamps];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (void)setSkipInterval:(double)a3
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    id v8 = [(RadioStation *)self managedObject];
    uint64_t v5 = [v8 managedObjectContext];
    if (v5)
    {
      int64_t v6 = (void *)v5;
      char v7 = [v8 isDeleted];

      if ((v7 & 1) == 0) {
        [v8 setSkipInterval:a3];
      }
    }
  }
  else
  {
    self->_skipInterval = a3;
  }
}

- (double)skipInterval
{
  if (![(RadioStation *)self isDatabaseBacked]) {
    return self->_skipInterval;
  }
  uint64_t v3 = [(RadioStation *)self managedObject];
  uint64_t v11 = 0;
  CGFloat v12 = (double *)&v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  uint64_t v4 = [v3 managedObjectContext];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __28__RadioStation_skipInterval__block_invoke;
  v8[3] = &unk_2643AA670;
  id v5 = v3;
  id v9 = v5;
  v10 = &v11;
  [v4 performBlockAndWait:v8];

  double v6 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v6;
}

uint64_t __28__RadioStation_skipInterval__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) skipInterval];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  }
  return result;
}

- (void)setSkipIdentifier:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  if ([(RadioStation *)self isDatabaseBacked])
  {
    id v5 = [(RadioStation *)self managedObject];
    double v6 = [v5 managedObjectContext];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __34__RadioStation_setSkipIdentifier___block_invoke;
    v10[3] = &unk_2643AA1C0;
    id v11 = v5;
    CGFloat v12 = v4;
    id v7 = v5;
    [v6 performBlockAndWait:v10];
  }
  else if (self->_skipIdentifier != v4)
  {
    id v8 = (NSString *)[(NSString *)v4 copy];
    skipIdentifier = self->_skipIdentifier;
    self->_skipIdentifier = v8;
  }
}

uint64_t __34__RadioStation_setSkipIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 setSkipIdentifier:v4];
  }
  return result;
}

- (NSString)skipIdentifier
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    uint64_t v3 = [(RadioStation *)self managedObject];
    uint64_t v11 = 0;
    CGFloat v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = __Block_byref_object_copy_;
    v15 = __Block_byref_object_dispose_;
    id v16 = 0;
    uint64_t v4 = [v3 managedObjectContext];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __30__RadioStation_skipIdentifier__block_invoke;
    v8[3] = &unk_2643AA670;
    id v5 = v3;
    id v9 = v5;
    v10 = &v11;
    [v4 performBlockAndWait:v8];

    double v6 = (NSString *)(id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    double v6 = self->_skipIdentifier;
  }
  return v6;
}

uint64_t __30__RadioStation_skipIdentifier__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) skipIdentifier];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (void)setSkipFrequency:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(RadioStation *)self isDatabaseBacked])
  {
    id v8 = [(RadioStation *)self managedObject];
    uint64_t v5 = [v8 managedObjectContext];
    if (v5)
    {
      double v6 = (void *)v5;
      char v7 = [v8 isDeleted];

      if ((v7 & 1) == 0) {
        [v8 setSkipFrequency:v3];
      }
    }
  }
  else
  {
    self->_skipFrequency = v3;
  }
}

- (int)skipFrequency
{
  if (![(RadioStation *)self isDatabaseBacked]) {
    return self->_skipFrequency;
  }
  uint64_t v3 = [(RadioStation *)self managedObject];
  uint64_t v11 = 0;
  CGFloat v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  uint64_t v4 = [v3 managedObjectContext];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __29__RadioStation_skipFrequency__block_invoke;
  v8[3] = &unk_2643AA670;
  id v5 = v3;
  id v9 = v5;
  v10 = &v11;
  [v4 performBlockAndWait:v8];

  int v6 = *((_DWORD *)v12 + 6);
  _Block_object_dispose(&v11, 8);

  return v6;
}

uint64_t __29__RadioStation_skipFrequency__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) skipFrequency];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (void)setSkipEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RadioStation *)self isDatabaseBacked])
  {
    id v8 = [(RadioStation *)self managedObject];
    uint64_t v5 = [v8 managedObjectContext];
    if (v5)
    {
      int v6 = (void *)v5;
      char v7 = [v8 isDeleted];

      if ((v7 & 1) == 0) {
        [v8 setSkipEnabled:v3];
      }
    }
  }
  else
  {
    self->_skipEnabled = v3;
  }
}

- (BOOL)skipEnabled
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    BOOL v3 = [(RadioStation *)self managedObject];
    uint64_t v11 = 0;
    CGFloat v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    uint64_t v4 = [v3 managedObjectContext];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __27__RadioStation_skipEnabled__block_invoke;
    v8[3] = &unk_2643AA670;
    id v5 = v3;
    id v9 = v5;
    v10 = &v11;
    [v4 performBlockAndWait:v8];

    int skipEnabled = *((unsigned __int8 *)v12 + 24);
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    int skipEnabled = self->_skipEnabled;
  }
  return skipEnabled != 0;
}

uint64_t __27__RadioStation_skipEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) skipEnabled];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (void)setShareToken:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  if ([(RadioStation *)self isDatabaseBacked])
  {
    id v5 = [(RadioStation *)self managedObject];
    int v6 = [v5 managedObjectContext];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __30__RadioStation_setShareToken___block_invoke;
    v10[3] = &unk_2643AA1C0;
    id v11 = v5;
    CGFloat v12 = v4;
    id v7 = v5;
    [v6 performBlockAndWait:v10];
  }
  else if (self->_shareToken != v4)
  {
    id v8 = (NSString *)[(NSString *)v4 copy];
    shareToken = self->_shareToken;
    self->_shareToken = v8;
  }
}

uint64_t __30__RadioStation_setShareToken___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    BOOL v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 setShareToken:v4];
  }
  return result;
}

- (NSString)shareToken
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    BOOL v3 = [(RadioStation *)self managedObject];
    uint64_t v11 = 0;
    CGFloat v12 = &v11;
    uint64_t v13 = 0x3032000000;
    char v14 = __Block_byref_object_copy_;
    v15 = __Block_byref_object_dispose_;
    id v16 = 0;
    uint64_t v4 = [v3 managedObjectContext];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __26__RadioStation_shareToken__block_invoke;
    v8[3] = &unk_2643AA670;
    id v5 = v3;
    id v9 = v5;
    v10 = &v11;
    [v4 performBlockAndWait:v8];

    int v6 = (NSString *)(id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    int v6 = self->_shareToken;
  }
  return v6;
}

uint64_t __26__RadioStation_shareToken__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) shareToken];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (void)setSeedTracks:(id)a3
{
  id v9 = a3;
  if ([(RadioStation *)self isDatabaseBacked])
  {
    seedTracks = [(RadioStation *)self managedObject];
    uint64_t v5 = [seedTracks managedObjectContext];
    if (v5)
    {
      int v6 = (void *)v5;
      char v7 = [seedTracks isDeleted];

      if ((v7 & 1) == 0) {
        [seedTracks setSeedTracks:v9];
      }
    }
  }
  else
  {
    id v8 = v9;
    seedTracks = self->_seedTracks;
    self->_seedTracks = v8;
  }
}

- (id)seedTracks
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    BOOL v3 = [(RadioStation *)self managedObject];
    uint64_t v11 = 0;
    CGFloat v12 = &v11;
    uint64_t v13 = 0x3032000000;
    char v14 = __Block_byref_object_copy_;
    v15 = __Block_byref_object_dispose_;
    id v16 = 0;
    uint64_t v4 = [v3 managedObjectContext];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __26__RadioStation_seedTracks__block_invoke;
    v8[3] = &unk_2643AA670;
    id v5 = v3;
    id v9 = v5;
    v10 = &v11;
    [v4 performBlockAndWait:v8];

    id v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = self->_seedTracks;
  }
  return v6;
}

uint64_t __26__RadioStation_seedTracks__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) seedTracks];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (void)setPreviewOnly:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RadioStation *)self isDatabaseBacked])
  {
    id v8 = [(RadioStation *)self managedObject];
    uint64_t v5 = [v8 managedObjectContext];
    if (v5)
    {
      id v6 = (void *)v5;
      char v7 = [v8 isDeleted];

      if ((v7 & 1) == 0) {
        [v8 setPreviewOnly:v3];
      }
    }
  }
  else
  {
    self->_previewOnly = v3;
  }
}

- (BOOL)isPreviewOnly
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    BOOL v3 = [(RadioStation *)self managedObject];
    uint64_t v11 = 0;
    CGFloat v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    uint64_t v4 = [v3 managedObjectContext];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __29__RadioStation_isPreviewOnly__block_invoke;
    v8[3] = &unk_2643AA670;
    id v5 = v3;
    id v9 = v5;
    v10 = &v11;
    [v4 performBlockAndWait:v8];

    int previewOnly = *((unsigned __int8 *)v12 + 24);
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    int previewOnly = self->_previewOnly;
  }
  return previewOnly != 0;
}

uint64_t __29__RadioStation_isPreviewOnly__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) isPreviewOnly];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (void)setPersistentID:(int64_t)a3
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    id v8 = [(RadioStation *)self managedObject];
    uint64_t v5 = [v8 managedObjectContext];
    if (v5)
    {
      id v6 = (void *)v5;
      char v7 = [v8 isDeleted];

      if ((v7 & 1) == 0) {
        [v8 setPersistentID:a3];
      }
    }
  }
  else
  {
    self->_persistentID = a3;
  }
}

- (int64_t)persistentID
{
  if (![(RadioStation *)self isDatabaseBacked]) {
    return self->_persistentID;
  }
  BOOL v3 = [(RadioStation *)self managedObject];
  uint64_t v11 = 0;
  CGFloat v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  uint64_t v4 = [v3 managedObjectContext];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __28__RadioStation_persistentID__block_invoke;
  v8[3] = &unk_2643AA670;
  id v5 = v3;
  id v9 = v5;
  v10 = &v11;
  [v4 performBlockAndWait:v8];

  int64_t v6 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v6;
}

uint64_t __28__RadioStation_persistentID__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) persistentID];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (void)setName:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  if ([(RadioStation *)self isDatabaseBacked])
  {
    id v5 = [(RadioStation *)self managedObject];
    int64_t v6 = [v5 managedObjectContext];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __24__RadioStation_setName___block_invoke;
    v10[3] = &unk_2643AA1C0;
    id v11 = v5;
    CGFloat v12 = v4;
    id v7 = v5;
    [v6 performBlockAndWait:v10];
  }
  else if (self->_name != v4)
  {
    id v8 = (NSString *)[(NSString *)v4 copy];
    name = self->_name;
    self->_name = v8;
  }
}

uint64_t __24__RadioStation_setName___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    BOOL v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 setName:v4];
  }
  return result;
}

- (NSString)name
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    BOOL v3 = [(RadioStation *)self managedObject];
    uint64_t v11 = 0;
    CGFloat v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = __Block_byref_object_copy_;
    v15 = __Block_byref_object_dispose_;
    id v16 = 0;
    uint64_t v4 = [v3 managedObjectContext];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __20__RadioStation_name__block_invoke;
    v8[3] = &unk_2643AA670;
    id v5 = v3;
    id v9 = v5;
    v10 = &v11;
    [v4 performBlockAndWait:v8];

    int64_t v6 = (NSString *)(id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    int64_t v6 = self->_name;
  }
  return v6;
}

uint64_t __20__RadioStation_name__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) name];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (void)setRequiresSubscription:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RadioStation *)self isDatabaseBacked])
  {
    id v8 = [(RadioStation *)self managedObject];
    uint64_t v5 = [v8 managedObjectContext];
    if (v5)
    {
      int64_t v6 = (void *)v5;
      char v7 = [v8 isDeleted];

      if ((v7 & 1) == 0) {
        [v8 setRequiresSubscription:v3];
      }
    }
  }
  else
  {
    self->_requiresSubscription = v3;
  }
}

- (BOOL)requiresSubscription
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    BOOL v3 = [(RadioStation *)self managedObject];
    uint64_t v11 = 0;
    CGFloat v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    uint64_t v4 = [v3 managedObjectContext];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __36__RadioStation_requiresSubscription__block_invoke;
    v8[3] = &unk_2643AA670;
    id v5 = v3;
    id v9 = v5;
    v10 = &v11;
    [v4 performBlockAndWait:v8];

    int requiresSubscription = *((unsigned __int8 *)v12 + 24);
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    int requiresSubscription = self->_requiresSubscription;
  }
  return requiresSubscription != 0;
}

uint64_t __36__RadioStation_requiresSubscription__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) requiresSubscription];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (void)setLikesEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RadioStation *)self isDatabaseBacked])
  {
    id v8 = [(RadioStation *)self managedObject];
    uint64_t v5 = [v8 managedObjectContext];
    if (v5)
    {
      int64_t v6 = (void *)v5;
      char v7 = [v8 isDeleted];

      if ((v7 & 1) == 0) {
        [v8 setLikesEnabled:v3];
      }
    }
  }
  else
  {
    self->_likesEnabled = v3;
  }
}

- (BOOL)likesEnabled
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    BOOL v3 = [(RadioStation *)self managedObject];
    uint64_t v11 = 0;
    CGFloat v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    uint64_t v4 = [v3 managedObjectContext];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __28__RadioStation_likesEnabled__block_invoke;
    v8[3] = &unk_2643AA670;
    id v5 = v3;
    id v9 = v5;
    v10 = &v11;
    [v4 performBlockAndWait:v8];

    int likesEnabled = *((unsigned __int8 *)v12 + 24);
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    int likesEnabled = self->_likesEnabled;
  }
  return likesEnabled != 0;
}

uint64_t __28__RadioStation_likesEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) likesEnabled];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (void)setHasSkipRules:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RadioStation *)self isDatabaseBacked])
  {
    id v8 = [(RadioStation *)self managedObject];
    uint64_t v5 = [v8 managedObjectContext];
    if (v5)
    {
      int64_t v6 = (void *)v5;
      char v7 = [v8 isDeleted];

      if ((v7 & 1) == 0) {
        [v8 setHasSkipRules:v3];
      }
    }
  }
  else
  {
    self->_hasSkipRules = v3;
  }
}

- (BOOL)hasSkipRules
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    BOOL v3 = [(RadioStation *)self managedObject];
    uint64_t v11 = 0;
    CGFloat v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    uint64_t v4 = [v3 managedObjectContext];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __28__RadioStation_hasSkipRules__block_invoke;
    v8[3] = &unk_2643AA670;
    id v5 = v3;
    id v9 = v5;
    v10 = &v11;
    [v4 performBlockAndWait:v8];

    int hasSkipRules = *((unsigned __int8 *)v12 + 24);
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    int hasSkipRules = self->_hasSkipRules;
  }
  return hasSkipRules != 0;
}

uint64_t __28__RadioStation_hasSkipRules__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) hasSkipRules];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (void)setSubscribed:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RadioStation *)self isDatabaseBacked])
  {
    id v8 = [(RadioStation *)self managedObject];
    uint64_t v5 = [v8 managedObjectContext];
    if (v5)
    {
      int64_t v6 = (void *)v5;
      char v7 = [v8 isDeleted];

      if ((v7 & 1) == 0) {
        [v8 setSubscribed:v3];
      }
    }
  }
  else
  {
    self->_subscribed = v3;
  }
}

- (BOOL)isSubscribed
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    BOOL v3 = [(RadioStation *)self managedObject];
    uint64_t v11 = 0;
    CGFloat v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    uint64_t v4 = [v3 managedObjectContext];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __28__RadioStation_isSubscribed__block_invoke;
    v8[3] = &unk_2643AA670;
    id v5 = v3;
    id v9 = v5;
    v10 = &v11;
    [v4 performBlockAndWait:v8];

    int subscribed = *((unsigned __int8 *)v12 + 24);
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    int subscribed = self->_subscribed;
  }
  return subscribed != 0;
}

uint64_t __28__RadioStation_isSubscribed__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) isSubscribed];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (void)setSponsored:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RadioStation *)self isDatabaseBacked])
  {
    id v8 = [(RadioStation *)self managedObject];
    uint64_t v5 = [v8 managedObjectContext];
    if (v5)
    {
      int64_t v6 = (void *)v5;
      char v7 = [v8 isDeleted];

      if ((v7 & 1) == 0) {
        [v8 setSponsored:v3];
      }
    }
  }
  else
  {
    self->_sponsored = v3;
  }
}

- (BOOL)isSponsored
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    BOOL v3 = [(RadioStation *)self managedObject];
    uint64_t v11 = 0;
    CGFloat v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    uint64_t v4 = [v3 managedObjectContext];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __27__RadioStation_isSponsored__block_invoke;
    v8[3] = &unk_2643AA670;
    id v5 = v3;
    id v9 = v5;
    v10 = &v11;
    [v4 performBlockAndWait:v8];

    int sponsored = *((unsigned __int8 *)v12 + 24);
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    int sponsored = self->_sponsored;
  }
  return sponsored != 0;
}

uint64_t __27__RadioStation_isSponsored__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) isSponsored];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (void)setSharingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RadioStation *)self isDatabaseBacked])
  {
    id v8 = [(RadioStation *)self managedObject];
    uint64_t v5 = [v8 managedObjectContext];
    if (v5)
    {
      int64_t v6 = (void *)v5;
      char v7 = [v8 isDeleted];

      if ((v7 & 1) == 0) {
        [v8 setSharingEnabled:v3];
      }
    }
  }
  else
  {
    self->_sharingEnabled = v3;
  }
}

- (BOOL)isSharingEnabled
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    BOOL v3 = [(RadioStation *)self managedObject];
    uint64_t v11 = 0;
    CGFloat v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    uint64_t v4 = [v3 managedObjectContext];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __32__RadioStation_isSharingEnabled__block_invoke;
    v8[3] = &unk_2643AA670;
    id v5 = v3;
    id v9 = v5;
    v10 = &v11;
    [v4 performBlockAndWait:v8];

    int sharingEnabled = *((unsigned __int8 *)v12 + 24);
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    int sharingEnabled = self->_sharingEnabled;
  }
  return sharingEnabled != 0;
}

uint64_t __32__RadioStation_isSharingEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) isSharingEnabled];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (void)setShared:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RadioStation *)self isDatabaseBacked])
  {
    id v8 = [(RadioStation *)self managedObject];
    uint64_t v5 = [v8 managedObjectContext];
    if (v5)
    {
      int64_t v6 = (void *)v5;
      char v7 = [v8 isDeleted];

      if ((v7 & 1) == 0) {
        [v8 setShared:v3];
      }
    }
  }
  else
  {
    self->_shared = v3;
  }
}

- (BOOL)isShared
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    BOOL v3 = [(RadioStation *)self managedObject];
    uint64_t v11 = 0;
    CGFloat v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    uint64_t v4 = [v3 managedObjectContext];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __24__RadioStation_isShared__block_invoke;
    v8[3] = &unk_2643AA670;
    id v5 = v3;
    id v9 = v5;
    v10 = &v11;
    [v4 performBlockAndWait:v8];

    int shared = *((unsigned __int8 *)v12 + 24);
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    int shared = self->_shared;
  }
  return shared != 0;
}

uint64_t __24__RadioStation_isShared__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) isShared];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (void)setPremiumPlacement:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RadioStation *)self isDatabaseBacked])
  {
    id v8 = [(RadioStation *)self managedObject];
    uint64_t v5 = [v8 managedObjectContext];
    if (v5)
    {
      int64_t v6 = (void *)v5;
      char v7 = [v8 isDeleted];

      if ((v7 & 1) == 0) {
        [v8 setPremiumPlacement:v3];
      }
    }
  }
  else
  {
    self->_premiumPlacement = v3;
  }
}

- (BOOL)isPremiumPlacement
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    BOOL v3 = [(RadioStation *)self managedObject];
    uint64_t v11 = 0;
    CGFloat v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    uint64_t v4 = [v3 managedObjectContext];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __34__RadioStation_isPremiumPlacement__block_invoke;
    v8[3] = &unk_2643AA670;
    id v5 = v3;
    id v9 = v5;
    v10 = &v11;
    [v4 performBlockAndWait:v8];

    int premiumPlacement = *((unsigned __int8 *)v12 + 24);
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    int premiumPlacement = self->_premiumPlacement;
  }
  return premiumPlacement != 0;
}

uint64_t __34__RadioStation_isPremiumPlacement__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) isPremiumPlacement];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (void)setGatewayVideoAdEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RadioStation *)self isDatabaseBacked])
  {
    id v8 = [(RadioStation *)self managedObject];
    uint64_t v5 = [v8 managedObjectContext];
    if (v5)
    {
      int64_t v6 = (void *)v5;
      char v7 = [v8 isDeleted];

      if ((v7 & 1) == 0) {
        [v8 setGatewayVideoAdEnabled:v3];
      }
    }
  }
  else
  {
    self->_gatewayVideoAdEnabled = v3;
  }
}

- (BOOL)isGatewayVideoAdEnabled
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    BOOL v3 = [(RadioStation *)self managedObject];
    uint64_t v11 = 0;
    CGFloat v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    uint64_t v4 = [v3 managedObjectContext];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __39__RadioStation_isGatewayVideoAdEnabled__block_invoke;
    v8[3] = &unk_2643AA670;
    id v5 = v3;
    id v9 = v5;
    v10 = &v11;
    [v4 performBlockAndWait:v8];

    int gatewayVideoAdEnabled = *((unsigned __int8 *)v12 + 24);
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    int gatewayVideoAdEnabled = self->_gatewayVideoAdEnabled;
  }
  return gatewayVideoAdEnabled != 0;
}

uint64_t __39__RadioStation_isGatewayVideoAdEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) isGatewayVideoAdEnabled];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (void)setFeatured:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RadioStation *)self isDatabaseBacked])
  {
    id v8 = [(RadioStation *)self managedObject];
    uint64_t v5 = [v8 managedObjectContext];
    if (v5)
    {
      int64_t v6 = (void *)v5;
      char v7 = [v8 isDeleted];

      if ((v7 & 1) == 0) {
        [v8 setFeatured:v3];
      }
    }
  }
  else
  {
    self->_featured = v3;
  }
}

- (BOOL)isFeatured
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    BOOL v3 = [(RadioStation *)self managedObject];
    uint64_t v11 = 0;
    CGFloat v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    uint64_t v4 = [v3 managedObjectContext];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __26__RadioStation_isFeatured__block_invoke;
    v8[3] = &unk_2643AA670;
    id v5 = v3;
    id v9 = v5;
    v10 = &v11;
    [v4 performBlockAndWait:v8];

    int featured = *((unsigned __int8 *)v12 + 24);
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    int featured = self->_featured;
  }
  return featured != 0;
}

uint64_t __26__RadioStation_isFeatured__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) isFeatured];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (void)setIsExplicit:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RadioStation *)self isDatabaseBacked])
  {
    id v8 = [(RadioStation *)self managedObject];
    uint64_t v5 = [v8 managedObjectContext];
    if (v5)
    {
      int64_t v6 = (void *)v5;
      char v7 = [v8 isDeleted];

      if ((v7 & 1) == 0) {
        [v8 setIsExplicit:v3];
      }
    }
  }
  else
  {
    self->_isExplicit = v3;
  }
}

- (BOOL)isExplicit
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    BOOL v3 = [(RadioStation *)self managedObject];
    uint64_t v11 = 0;
    CGFloat v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    uint64_t v4 = [v3 managedObjectContext];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __26__RadioStation_isExplicit__block_invoke;
    v8[3] = &unk_2643AA670;
    id v5 = v3;
    id v9 = v5;
    v10 = &v11;
    [v4 performBlockAndWait:v8];

    int isExplicit = *((unsigned __int8 *)v12 + 24);
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    int isExplicit = self->_isExplicit;
  }
  return isExplicit != 0;
}

uint64_t __26__RadioStation_isExplicit__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) isExplicit];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (void)setImpressionThreshold:(unint64_t)a3
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    id v8 = [(RadioStation *)self managedObject];
    uint64_t v5 = [v8 managedObjectContext];
    if (v5)
    {
      int64_t v6 = (void *)v5;
      char v7 = [v8 isDeleted];

      if ((v7 & 1) == 0) {
        [v8 setImpressionThreshold:a3];
      }
    }
  }
  else
  {
    self->_impressionThreshold = a3;
  }
}

- (unint64_t)impressionThreshold
{
  if (![(RadioStation *)self isDatabaseBacked]) {
    return self->_impressionThreshold;
  }
  BOOL v3 = [(RadioStation *)self managedObject];
  uint64_t v11 = 0;
  CGFloat v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  uint64_t v4 = [v3 managedObjectContext];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __35__RadioStation_impressionThreshold__block_invoke;
  v8[3] = &unk_2643AA670;
  id v5 = v3;
  id v9 = v5;
  v10 = &v11;
  [v4 performBlockAndWait:v8];

  unint64_t v6 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v6;
}

uint64_t __35__RadioStation_impressionThreshold__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) impressionThreshold];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (void)setEditEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RadioStation *)self isDatabaseBacked])
  {
    id v8 = [(RadioStation *)self managedObject];
    uint64_t v5 = [v8 managedObjectContext];
    if (v5)
    {
      unint64_t v6 = (void *)v5;
      char v7 = [v8 isDeleted];

      if ((v7 & 1) == 0) {
        [v8 setEditEnabled:v3];
      }
    }
  }
  else
  {
    self->_editEnabled = v3;
  }
}

- (BOOL)editEnabled
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    BOOL v3 = [(RadioStation *)self managedObject];
    uint64_t v11 = 0;
    CGFloat v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    uint64_t v4 = [v3 managedObjectContext];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __27__RadioStation_editEnabled__block_invoke;
    v8[3] = &unk_2643AA670;
    id v5 = v3;
    id v9 = v5;
    v10 = &v11;
    [v4 performBlockAndWait:v8];

    int editEnabled = *((unsigned __int8 *)v12 + 24);
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    int editEnabled = self->_editEnabled;
  }
  return editEnabled != 0;
}

uint64_t __27__RadioStation_editEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) editEnabled];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (void)setEditableFields:(id)a3
{
  uint64_t v4 = (NSArray *)a3;
  if ([(RadioStation *)self isDatabaseBacked])
  {
    id v5 = [(RadioStation *)self managedObject];
    unint64_t v6 = [v5 managedObjectContext];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __34__RadioStation_setEditableFields___block_invoke;
    v10[3] = &unk_2643AA1C0;
    id v11 = v5;
    CGFloat v12 = v4;
    id v7 = v5;
    [v6 performBlockAndWait:v10];
  }
  else if (self->_editableFields != v4)
  {
    id v8 = (NSArray *)[(NSArray *)v4 copy];
    editableFields = self->_editableFields;
    self->_editableFields = v8;
  }
}

uint64_t __34__RadioStation_setEditableFields___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    BOOL v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 setEditableFields:v4];
  }
  return result;
}

- (NSArray)editableFields
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    BOOL v3 = [(RadioStation *)self managedObject];
    uint64_t v11 = 0;
    CGFloat v12 = &v11;
    uint64_t v13 = 0x3032000000;
    char v14 = __Block_byref_object_copy_;
    v15 = __Block_byref_object_dispose_;
    id v16 = 0;
    uint64_t v4 = [v3 managedObjectContext];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __30__RadioStation_editableFields__block_invoke;
    v8[3] = &unk_2643AA670;
    id v5 = v3;
    id v9 = v5;
    v10 = &v11;
    [v4 performBlockAndWait:v8];

    unint64_t v6 = (NSArray *)(id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    unint64_t v6 = self->_editableFields;
  }
  return v6;
}

uint64_t __30__RadioStation_editableFields__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) editableFields];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (void)setDebugDictionary:(id)a3
{
  uint64_t v4 = (NSDictionary *)a3;
  if ([(RadioStation *)self isDatabaseBacked])
  {
    id v5 = [(RadioStation *)self managedObject];
    unint64_t v6 = [v5 managedObjectContext];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __35__RadioStation_setDebugDictionary___block_invoke;
    v10[3] = &unk_2643AA1C0;
    id v11 = v5;
    CGFloat v12 = v4;
    id v7 = v5;
    [v6 performBlockAndWait:v10];
  }
  else if (self->_debugDictionary != v4)
  {
    id v8 = (NSDictionary *)[(NSDictionary *)v4 copy];
    debugDictionary = self->_debugDictionary;
    self->_debugDictionary = v8;
  }
}

uint64_t __35__RadioStation_setDebugDictionary___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    BOOL v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 setDebugDictionary:v4];
  }
  return result;
}

- (NSDictionary)debugDictionary
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    BOOL v3 = [(RadioStation *)self managedObject];
    uint64_t v11 = 0;
    CGFloat v12 = &v11;
    uint64_t v13 = 0x3032000000;
    char v14 = __Block_byref_object_copy_;
    v15 = __Block_byref_object_dispose_;
    id v16 = 0;
    uint64_t v4 = [v3 managedObjectContext];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __31__RadioStation_debugDictionary__block_invoke;
    v8[3] = &unk_2643AA670;
    id v5 = v3;
    id v9 = v5;
    v10 = &v11;
    [v4 performBlockAndWait:v8];

    unint64_t v6 = (NSDictionary *)(id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    unint64_t v6 = self->_debugDictionary;
  }
  return v6;
}

uint64_t __31__RadioStation_debugDictionary__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) debugDictionary];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (void)setCoreSeedName:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  if ([(RadioStation *)self isDatabaseBacked])
  {
    id v5 = [(RadioStation *)self managedObject];
    unint64_t v6 = [v5 managedObjectContext];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __32__RadioStation_setCoreSeedName___block_invoke;
    v10[3] = &unk_2643AA1C0;
    id v11 = v5;
    CGFloat v12 = v4;
    id v7 = v5;
    [v6 performBlockAndWait:v10];
  }
  else if (self->_coreSeedName != v4)
  {
    id v8 = (NSString *)[(NSString *)v4 copy];
    coreSeedName = self->_coreSeedName;
    self->_coreSeedName = v8;
  }
}

uint64_t __32__RadioStation_setCoreSeedName___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    BOOL v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 setCoreSeedName:v4];
  }
  return result;
}

- (NSString)coreSeedName
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    BOOL v3 = [(RadioStation *)self managedObject];
    uint64_t v11 = 0;
    CGFloat v12 = &v11;
    uint64_t v13 = 0x3032000000;
    char v14 = __Block_byref_object_copy_;
    v15 = __Block_byref_object_dispose_;
    id v16 = 0;
    uint64_t v4 = [v3 managedObjectContext];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __28__RadioStation_coreSeedName__block_invoke;
    v8[3] = &unk_2643AA670;
    id v5 = v3;
    id v9 = v5;
    v10 = &v11;
    [v4 performBlockAndWait:v8];

    unint64_t v6 = (NSString *)(id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    unint64_t v6 = self->_coreSeedName;
  }
  return v6;
}

uint64_t __28__RadioStation_coreSeedName__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) coreSeedName];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (void)setArtworkURLData:(id)a3
{
  uint64_t v4 = (NSData *)a3;
  if ([(RadioStation *)self isDatabaseBacked])
  {
    id v5 = [(RadioStation *)self managedObject];
    unint64_t v6 = [v5 managedObjectContext];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __34__RadioStation_setArtworkURLData___block_invoke;
    v10[3] = &unk_2643AA1C0;
    id v11 = v5;
    CGFloat v12 = v4;
    id v7 = v5;
    [v6 performBlockAndWait:v10];
  }
  else if (self->_artworkURLData != v4)
  {
    id v8 = (NSData *)[(NSData *)v4 copy];
    artworkURLData = self->_artworkURLData;
    self->_artworkURLData = v8;
  }
}

uint64_t __34__RadioStation_setArtworkURLData___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    BOOL v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 setArtworkURLData:v4];
  }
  return result;
}

- (NSData)artworkURLData
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    BOOL v3 = [(RadioStation *)self managedObject];
    uint64_t v11 = 0;
    CGFloat v12 = &v11;
    uint64_t v13 = 0x3032000000;
    char v14 = __Block_byref_object_copy_;
    v15 = __Block_byref_object_dispose_;
    id v16 = 0;
    uint64_t v4 = [v3 managedObjectContext];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __30__RadioStation_artworkURLData__block_invoke;
    v8[3] = &unk_2643AA670;
    id v5 = v3;
    id v9 = v5;
    v10 = &v11;
    [v4 performBlockAndWait:v8];

    unint64_t v6 = (NSData *)(id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    unint64_t v6 = self->_artworkURLData;
  }
  return v6;
}

uint64_t __30__RadioStation_artworkURLData__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) artworkURLData];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (void)setArtworkURL:(id)a3
{
  id v9 = a3;
  if ([(RadioStation *)self isDatabaseBacked])
  {
    artworkURL = [(RadioStation *)self managedObject];
    uint64_t v5 = [artworkURL managedObjectContext];
    if (v5)
    {
      unint64_t v6 = (void *)v5;
      char v7 = [artworkURL isDeleted];

      if ((v7 & 1) == 0) {
        [artworkURL setArtworkURL:v9];
      }
    }
  }
  else
  {
    id v8 = (NSURL *)v9;
    artworkURL = self->_artworkURL;
    self->_artworkURL = v8;
  }
}

- (NSURL)artworkURL
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    BOOL v3 = [(RadioStation *)self managedObject];
    uint64_t v11 = 0;
    CGFloat v12 = &v11;
    uint64_t v13 = 0x3032000000;
    char v14 = __Block_byref_object_copy_;
    v15 = __Block_byref_object_dispose_;
    id v16 = 0;
    uint64_t v4 = [v3 managedObjectContext];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __26__RadioStation_artworkURL__block_invoke;
    v8[3] = &unk_2643AA670;
    id v5 = v3;
    id v9 = v5;
    v10 = &v11;
    [v4 performBlockAndWait:v8];

    unint64_t v6 = (NSURL *)(id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    unint64_t v6 = self->_artworkURL;
  }
  return v6;
}

uint64_t __26__RadioStation_artworkURL__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) artworkURL];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (void)setAdData:(id)a3
{
  uint64_t v4 = (NSData *)a3;
  if ([(RadioStation *)self isDatabaseBacked])
  {
    id v5 = [(RadioStation *)self managedObject];
    unint64_t v6 = [v5 managedObjectContext];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __26__RadioStation_setAdData___block_invoke;
    v10[3] = &unk_2643AA1C0;
    id v11 = v5;
    CGFloat v12 = v4;
    id v7 = v5;
    [v6 performBlockAndWait:v10];
  }
  else if (self->_adData != v4)
  {
    id v8 = (NSData *)[(NSData *)v4 copy];
    adData = self->_adData;
    self->_adData = v8;
  }
}

uint64_t __26__RadioStation_setAdData___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    BOOL v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 setAdData:v4];
  }
  return result;
}

- (NSData)adData
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    BOOL v3 = [(RadioStation *)self managedObject];
    uint64_t v11 = 0;
    CGFloat v12 = &v11;
    uint64_t v13 = 0x3032000000;
    char v14 = __Block_byref_object_copy_;
    v15 = __Block_byref_object_dispose_;
    id v16 = 0;
    uint64_t v4 = [v3 managedObjectContext];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __22__RadioStation_adData__block_invoke;
    v8[3] = &unk_2643AA670;
    id v5 = v3;
    id v9 = v5;
    v10 = &v11;
    [v4 performBlockAndWait:v8];

    unint64_t v6 = (NSData *)(id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    unint64_t v6 = self->_adData;
  }
  return v6;
}

uint64_t __22__RadioStation_adData__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) adData];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (void)setAdamID:(int64_t)a3
{
  if ([(RadioStation *)self isDatabaseBacked])
  {
    id v8 = [(RadioStation *)self managedObject];
    uint64_t v5 = [v8 managedObjectContext];
    if (v5)
    {
      unint64_t v6 = (void *)v5;
      char v7 = [v8 isDeleted];

      if ((v7 & 1) == 0) {
        [v8 setAdamID:a3];
      }
    }
  }
  else
  {
    self->_adamID = a3;
  }
}

- (int64_t)adamID
{
  if (![(RadioStation *)self isDatabaseBacked]) {
    return self->_adamID;
  }
  BOOL v3 = [(RadioStation *)self managedObject];
  uint64_t v11 = 0;
  CGFloat v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  uint64_t v4 = [v3 managedObjectContext];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __22__RadioStation_adamID__block_invoke;
  v8[3] = &unk_2643AA670;
  id v5 = v3;
  id v9 = v5;
  v10 = &v11;
  [v4 performBlockAndWait:v8];

  int64_t v6 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v6;
}

uint64_t __22__RadioStation_adamID__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) adamID];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (void)_radioModelWasDeletedNotification:(id)a3
{
  self->_managedObject = 0;
  MEMORY[0x270F9A758]();
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (RadioStation *)a3;
  if (v4 == self)
  {
    char v8 = 1;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  if (!self->_databaseBacked)
  {
    id v9 = [(RadioStation *)self stationHash];
    v10 = [(RadioStation *)v4 stationHash];
    if ([v9 isEqualToString:v10])
    {

LABEL_8:
      int64_t v11 = [(RadioStation *)self stationID];
      char v8 = v11 == [(RadioStation *)v4 stationID];
      goto LABEL_13;
    }
    CGFloat v12 = [(RadioStation *)self stationHash];
    if (v12)
    {
    }
    else
    {
      uint64_t v13 = [(RadioStation *)v4 stationHash];

      if (!v13) {
        goto LABEL_8;
      }
    }
LABEL_12:
    char v8 = 0;
    goto LABEL_13;
  }
  id v5 = [(NSManagedObject *)self->_managedObject objectID];
  int64_t v6 = [(RadioStation *)v4 managedObject];
  char v7 = [v6 objectID];
  char v8 = [v5 isEqual:v7];

LABEL_13:
  return v8;
}

- (unint64_t)hash
{
  if (self->_databaseBacked)
  {
    BOOL v3 = [(NSManagedObject *)self->_managedObject objectID];
    unint64_t v4 = [v3 hash];
  }
  else
  {
    BOOL v3 = [(RadioStation *)self stationHash];
    uint64_t v5 = [v3 hash];
    unint64_t v4 = [(RadioStation *)self stationID] ^ v5;
  }

  return v4;
}

- (void)dealloc
{
  if (self->_databaseBacked)
  {
    BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self name:@"RadioModelWasDeletedNotification" object:self->_model];
  }
  v4.receiver = self;
  v4.super_class = (Class)RadioStation;
  [(RadioStation *)&v4 dealloc];
}

- (RadioStation)initWithModel:(id)a3 managedObject:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RadioStation;
  id v9 = [(RadioStation *)&v13 init];
  v10 = v9;
  if (v9)
  {
    v9->_databaseBacked = 1;
    objc_storeStrong((id *)&v9->_managedObject, a4);
    objc_storeStrong((id *)&v10->_model, a3);
    int64_t v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v10 selector:sel__radioModelWasDeletedNotification_ name:@"RadioModelWasDeletedNotification" object:v10->_model];
  }
  return v10;
}

@end