@interface RadioManagedStation
+ (id)defaultPropertiesToFetch;
- (BOOL)editEnabled;
- (BOOL)hasSkipRules;
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
- (NSArray)seedTracks;
- (NSArray)skipTimestamps;
- (NSData)adData;
- (NSData)artworkURLData;
- (NSDictionary)debugDictionary;
- (NSDictionary)dictionaryRepresentation;
- (NSString)coreSeedName;
- (NSString)name;
- (NSString)shareToken;
- (NSString)skipIdentifier;
- (NSString)stationDescription;
- (NSString)stationHash;
- (NSString)stationStringID;
- (NSURL)artworkURL;
- (NSURL)streamURL;
- (double)skipInterval;
- (id)additionalReferencedTrackDescriptors;
- (id)feedbackDictionaryRepresentation;
- (id)streamCertificateURL;
- (id)streamKeyURL;
- (int)skipFrequency;
- (int)sortOrder;
- (int)subscriberCount;
- (int64_t)adamID;
- (int64_t)persistentID;
- (int64_t)songMixType;
- (int64_t)stationID;
- (unint64_t)impressionThreshold;
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
- (void)setVirtualPlayEnabled:(BOOL)a3;
@end

@implementation RadioManagedStation

+ (id)defaultPropertiesToFetch
{
  return &unk_26CB5DE20;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if ([(RadioManagedStation *)self stationID])
  {
    v4 = objc_msgSend(NSNumber, "numberWithLongLong:", -[RadioManagedStation stationID](self, "stationID"));
    [v3 setObject:v4 forKey:@"station-id"];
  }
  v5 = [(RadioManagedStation *)self stationHash];

  if (v5)
  {
    v6 = [(RadioManagedStation *)self stationHash];
    [v3 setObject:v6 forKey:@"station-hash"];
  }
  v7 = [(RadioManagedStation *)self stationDescription];

  if (v7)
  {
    v8 = [(RadioManagedStation *)self stationDescription];
    [v3 setObject:v8 forKey:@"description"];
  }
  v9 = [(RadioManagedStation *)self name];

  if (v9)
  {
    v10 = [(RadioManagedStation *)self name];
    [v3 setObject:v10 forKey:@"name"];
  }
  if ([(RadioManagedStation *)self adamID])
  {
    v11 = objc_msgSend(NSNumber, "numberWithLongLong:", -[RadioManagedStation adamID](self, "adamID"));
    [v3 setObject:v11 forKey:@"adam-id"];
  }
  if ([(RadioManagedStation *)self songMixType])
  {
    v12 = objc_msgSend(NSNumber, "numberWithInt:", -[RadioManagedStation songMixType](self, "songMixType"));
    [v3 setObject:v12 forKey:@"mix-type"];
  }
  v13 = [(RadioManagedStation *)self seedTracks];

  if (v13)
  {
    v14 = [(RadioManagedStation *)self seedTracks];
    [v3 setObject:v14 forKey:@"seeds"];
  }
  return (NSDictionary *)v3;
}

- (BOOL)virtualPlayEnabled
{
  [(RadioManagedStation *)self willAccessValueForKey:@"virtual_play_enabled"];
  id v3 = [(RadioManagedStation *)self primitiveValueForKey:@"virtual_play_enabled"];
  char v4 = [v3 BOOLValue];

  [(RadioManagedStation *)self didAccessValueForKey:@"virtual_play_enabled"];
  return v4;
}

- (int)subscriberCount
{
  [(RadioManagedStation *)self willAccessValueForKey:@"listeners"];
  id v3 = [(RadioManagedStation *)self primitiveValueForKey:@"listeners"];
  int v4 = [v3 intValue];

  [(RadioManagedStation *)self didAccessValueForKey:@"listeners"];
  return v4;
}

- (id)streamKeyURL
{
  [(RadioManagedStation *)self willAccessValueForKey:@"stream_key_url"];
  id v3 = [(RadioManagedStation *)self primitiveValueForKey:@"stream_key_url"];
  [(RadioManagedStation *)self didAccessValueForKey:@"stream_key_url"];
  if (v3)
  {
    int v4 = [NSURL URLWithString:v3];
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)streamCertificateURL
{
  [(RadioManagedStation *)self willAccessValueForKey:@"stream_certificate_url"];
  id v3 = [(RadioManagedStation *)self primitiveValueForKey:@"stream_sertificate_url"];
  [(RadioManagedStation *)self didAccessValueForKey:@"stream_certificate_url"];
  if (v3)
  {
    int v4 = [NSURL URLWithString:v3];
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (NSURL)streamURL
{
  [(RadioManagedStation *)self willAccessValueForKey:@"stream_url"];
  id v3 = [(RadioManagedStation *)self primitiveValueForKey:@"stream_url"];
  [(RadioManagedStation *)self didAccessValueForKey:@"stream_url"];
  if (v3)
  {
    int v4 = [NSURL URLWithString:v3];
  }
  else
  {
    int v4 = 0;
  }

  return (NSURL *)v4;
}

- (NSString)stationStringID
{
  [(RadioManagedStation *)self willAccessValueForKey:@"station_string_id"];
  id v3 = [(RadioManagedStation *)self primitiveValueForKey:@"station_string_id"];
  [(RadioManagedStation *)self didAccessValueForKey:@"station_string_id"];
  return (NSString *)v3;
}

- (int64_t)stationID
{
  [(RadioManagedStation *)self willAccessValueForKey:@"station_id"];
  id v3 = [(RadioManagedStation *)self primitiveValueForKey:@"station_id"];
  int64_t v4 = [v3 longLongValue];

  [(RadioManagedStation *)self didAccessValueForKey:@"station_id"];
  return v4;
}

- (NSString)stationHash
{
  [(RadioManagedStation *)self willAccessValueForKey:@"station_hash"];
  id v3 = [(RadioManagedStation *)self primitiveValueForKey:@"station_hash"];
  [(RadioManagedStation *)self didAccessValueForKey:@"station_hash"];
  return (NSString *)v3;
}

- (NSString)stationDescription
{
  [(RadioManagedStation *)self willAccessValueForKey:@"station_description"];
  id v3 = [(RadioManagedStation *)self primitiveValueForKey:@"station_description"];
  [(RadioManagedStation *)self didAccessValueForKey:@"station_description"];
  return (NSString *)v3;
}

- (int)sortOrder
{
  [(RadioManagedStation *)self willAccessValueForKey:@"sort_order"];
  id v3 = [(RadioManagedStation *)self primitiveValueForKey:@"sort_order"];
  int v4 = [v3 intValue];

  [(RadioManagedStation *)self didAccessValueForKey:@"sort_order"];
  return v4;
}

- (int64_t)songMixType
{
  [(RadioManagedStation *)self willAccessValueForKey:@"song_mix_type"];
  id v3 = [(RadioManagedStation *)self primitiveValueForKey:@"song_mix_type"];
  int64_t v4 = (int)[v3 intValue];

  [(RadioManagedStation *)self didAccessValueForKey:@"song_mix_type"];
  return v4;
}

- (NSArray)skipTimestamps
{
  [(RadioManagedStation *)self willAccessValueForKey:@"skip_timestamps"];
  id v3 = [(RadioManagedStation *)self primitiveValueForKey:@"skip_timestamps"];
  [(RadioManagedStation *)self didAccessValueForKey:@"skip_timestamps"];
  if (v3)
  {
    int64_t v4 = [MEMORY[0x263F08AC0] propertyListWithData:v3 options:0 format:0 error:0];
  }
  else
  {
    int64_t v4 = 0;
  }

  return (NSArray *)v4;
}

- (double)skipInterval
{
  [(RadioManagedStation *)self willAccessValueForKey:@"skip_interval"];
  id v3 = [(RadioManagedStation *)self primitiveValueForKey:@"skip_interval"];
  [v3 doubleValue];
  double v5 = v4;

  [(RadioManagedStation *)self didAccessValueForKey:@"skip_interval"];
  return v5;
}

- (NSString)skipIdentifier
{
  [(RadioManagedStation *)self willAccessValueForKey:@"skip_identifier"];
  id v3 = [(RadioManagedStation *)self primitiveValueForKey:@"skip_identifier"];
  [(RadioManagedStation *)self didAccessValueForKey:@"skip_identifier"];
  return (NSString *)v3;
}

- (int)skipFrequency
{
  [(RadioManagedStation *)self willAccessValueForKey:@"skip_frequency"];
  id v3 = [(RadioManagedStation *)self primitiveValueForKey:@"skip_frequency"];
  int v4 = [v3 intValue];

  [(RadioManagedStation *)self didAccessValueForKey:@"skip_frequency"];
  return v4;
}

- (BOOL)skipEnabled
{
  [(RadioManagedStation *)self willAccessValueForKey:@"skip_enabled"];
  id v3 = [(RadioManagedStation *)self primitiveValueForKey:@"skip_enabled"];
  char v4 = [v3 BOOLValue];

  [(RadioManagedStation *)self didAccessValueForKey:@"skip_enabled"];
  return v4;
}

- (NSString)shareToken
{
  [(RadioManagedStation *)self willAccessValueForKey:@"share_token"];
  id v3 = [(RadioManagedStation *)self primitiveValueForKey:@"share_token"];
  [(RadioManagedStation *)self didAccessValueForKey:@"share_token"];
  return (NSString *)v3;
}

- (void)setVirtualPlayEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RadioManagedStation *)self virtualPlayEnabled] != a3)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"virtual_play_enabled"];
    double v5 = [NSNumber numberWithBool:v3];
    [(RadioManagedStation *)self setPrimitiveValue:v5 forKey:@"virtual_play_enabled"];

    [(RadioManagedStation *)self didChangeValueForKey:@"virtual_play_enabled"];
  }
}

- (void)setSubscriberCount:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(RadioManagedStation *)self subscriberCount] != a3)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"listeners"];
    double v5 = [NSNumber numberWithInt:v3];
    [(RadioManagedStation *)self setPrimitiveValue:v5 forKey:@"listeners"];

    [(RadioManagedStation *)self didChangeValueForKey:@"listeners"];
  }
}

- (void)setSubscribed:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RadioManagedStation *)self isSubscribed] != a3)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"is_subscribed"];
    double v5 = [NSNumber numberWithBool:v3];
    [(RadioManagedStation *)self setPrimitiveValue:v5 forKey:@"is_subscribed"];

    [(RadioManagedStation *)self didChangeValueForKey:@"is_subscribed"];
  }
}

- (void)setStreamKeyURL:(id)a3
{
  id v5 = [a3 absoluteString];
  [(RadioManagedStation *)self willAccessValueForKey:@"stream_key_url"];
  id v4 = [(RadioManagedStation *)self primitiveValueForKey:@"stream_key_url"];
  [(RadioManagedStation *)self didAccessValueForKey:@"stream_key_url"];
  if (v4 != v5 && ([v4 isEqualToString:v5] & 1) == 0)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"stream_key_url"];
    [(RadioManagedStation *)self setPrimitiveValue:v5 forKey:@"stream_key_url"];
    [(RadioManagedStation *)self didChangeValueForKey:@"stream_key_url"];
  }
}

- (void)setStreamCertificateURL:(id)a3
{
  id v5 = [a3 absoluteString];
  [(RadioManagedStation *)self willAccessValueForKey:@"stream_certificate_url"];
  id v4 = [(RadioManagedStation *)self primitiveValueForKey:@"stream_sertificate_url"];
  [(RadioManagedStation *)self didAccessValueForKey:@"stream_certificate_url"];
  if (v4 != v5 && ([v4 isEqualToString:v5] & 1) == 0)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"stream_certificate_url"];
    [(RadioManagedStation *)self setPrimitiveValue:v5 forKey:@"stream_certificate_url"];
    [(RadioManagedStation *)self didChangeValueForKey:@"stream_certificate_url"];
  }
}

- (void)setStreamURL:(id)a3
{
  id v5 = [a3 absoluteString];
  [(RadioManagedStation *)self willAccessValueForKey:@"stream_url"];
  id v4 = [(RadioManagedStation *)self primitiveValueForKey:@"stream_url"];
  [(RadioManagedStation *)self didAccessValueForKey:@"stream_url"];
  if (v4 != v5 && ([v4 isEqualToString:v5] & 1) == 0)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"stream_url"];
    [(RadioManagedStation *)self setPrimitiveValue:v5 forKey:@"stream_url"];
    [(RadioManagedStation *)self didChangeValueForKey:@"stream_url"];
  }
}

- (void)setStationStringID:(id)a3
{
  id v5 = a3;
  id v4 = [(RadioManagedStation *)self stationStringID];
  if (v4 != v5 && ([v4 isEqualToString:v5] & 1) == 0)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"station_string_id"];
    [(RadioManagedStation *)self setPrimitiveValue:v5 forKey:@"station_string_id"];
    [(RadioManagedStation *)self didChangeValueForKey:@"station_string_id"];
  }
}

- (void)setStationHash:(id)a3
{
  id v5 = a3;
  id v4 = [(RadioManagedStation *)self stationHash];
  if (v4 != v5 && ([v4 isEqualToString:v5] & 1) == 0)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"station_hash"];
    [(RadioManagedStation *)self setPrimitiveValue:v5 forKey:@"station_hash"];
    [(RadioManagedStation *)self didChangeValueForKey:@"station_hash"];
  }
}

- (void)setStationID:(int64_t)a3
{
  if ([(RadioManagedStation *)self stationID] != a3)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"station_id"];
    id v5 = [NSNumber numberWithLongLong:a3];
    [(RadioManagedStation *)self setPrimitiveValue:v5 forKey:@"station_id"];

    [(RadioManagedStation *)self didChangeValueForKey:@"station_id"];
  }
}

- (void)setStationDescription:(id)a3
{
  id v5 = a3;
  id v4 = [(RadioManagedStation *)self stationDescription];
  if (v4 != v5 && ([v4 isEqualToString:v5] & 1) == 0)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"station_description"];
    [(RadioManagedStation *)self setPrimitiveValue:v5 forKey:@"station_description"];
    [(RadioManagedStation *)self didChangeValueForKey:@"station_description"];
  }
}

- (void)setSponsored:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RadioManagedStation *)self isSponsored] != a3)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"is_sponsored"];
    id v5 = [NSNumber numberWithBool:v3];
    [(RadioManagedStation *)self setPrimitiveValue:v5 forKey:@"is_sponsored"];

    [(RadioManagedStation *)self didChangeValueForKey:@"is_sponsored"];
  }
}

- (void)setSortOrder:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(RadioManagedStation *)self sortOrder] != a3)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"sort_order"];
    id v5 = [NSNumber numberWithInt:v3];
    [(RadioManagedStation *)self setPrimitiveValue:v5 forKey:@"sort_order"];

    [(RadioManagedStation *)self didChangeValueForKey:@"sort_order"];
  }
}

- (void)setSongMixType:(int64_t)a3
{
  if ([(RadioManagedStation *)self songMixType] != a3)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"song_mix_type"];
    id v5 = [NSNumber numberWithInt:a3];
    [(RadioManagedStation *)self setPrimitiveValue:v5 forKey:@"song_mix_type"];

    [(RadioManagedStation *)self didChangeValueForKey:@"song_mix_type"];
  }
}

- (void)setSkipTimestamps:(id)a3
{
  id v9 = a3;
  [(RadioManagedStation *)self willAccessValueForKey:@"skip_timestamps"];
  id v4 = [(RadioManagedStation *)self primitiveValueForKey:@"skip_timestamps"];
  [(RadioManagedStation *)self didAccessValueForKey:@"skip_timestamps"];
  if (v9)
  {
    uint64_t v5 = [MEMORY[0x263F08AC0] dataWithPropertyList:v9 format:200 options:0 error:0];
    v6 = (void *)v5;
    if (v4 && v5 && v4 != (void *)v5)
    {
      char v7 = [v4 isEqualToData:v5];
      v8 = v6;
      if (v7) {
        goto LABEL_11;
      }
    }
    else
    {
      v8 = v4;
      if (v4 == (void *)v5) {
        goto LABEL_11;
      }
    }
LABEL_10:
    [(RadioManagedStation *)self willChangeValueForKey:@"skip_timestamps"];
    [(RadioManagedStation *)self setPrimitiveValue:v6 forKey:@"skip_timestamps"];
    [(RadioManagedStation *)self didChangeValueForKey:@"skip_timestamps"];
    v8 = v6;
    goto LABEL_11;
  }
  v6 = 0;
  v8 = 0;
  if (v4) {
    goto LABEL_10;
  }
LABEL_11:
}

- (void)setSkipInterval:(double)a3
{
  [(RadioManagedStation *)self skipInterval];
  if (vabdd_f64(v5, a3) > 2.22044605e-16)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"skip_interval"];
    v6 = [NSNumber numberWithDouble:a3];
    [(RadioManagedStation *)self setPrimitiveValue:v6 forKey:@"skip_interval"];

    [(RadioManagedStation *)self didChangeValueForKey:@"skip_interval"];
  }
}

- (void)setSkipIdentifier:(id)a3
{
  id v5 = a3;
  id v4 = [(RadioManagedStation *)self skipIdentifier];
  if (v4 != v5 && ([v4 isEqualToString:v5] & 1) == 0)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"skip_identifier"];
    [(RadioManagedStation *)self setPrimitiveValue:v5 forKey:@"skip_identifier"];
    [(RadioManagedStation *)self didChangeValueForKey:@"skip_identifier"];
  }
}

- (void)setSkipFrequency:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(RadioManagedStation *)self skipFrequency] != a3)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"skip_frequency"];
    id v5 = [NSNumber numberWithInt:v3];
    [(RadioManagedStation *)self setPrimitiveValue:v5 forKey:@"skip_frequency"];

    [(RadioManagedStation *)self didChangeValueForKey:@"skip_frequency"];
  }
}

- (void)setSkipEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RadioManagedStation *)self skipEnabled] != a3)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"skip_enabled"];
    id v5 = [NSNumber numberWithBool:v3];
    [(RadioManagedStation *)self setPrimitiveValue:v5 forKey:@"skip_enabled"];

    [(RadioManagedStation *)self didChangeValueForKey:@"skip_enabled"];
  }
}

- (void)setShareToken:(id)a3
{
  id v5 = a3;
  id v4 = [(RadioManagedStation *)self shareToken];
  if (v4 != v5 && ([v4 isEqualToString:v5] & 1) == 0)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"share_token"];
    [(RadioManagedStation *)self setPrimitiveValue:v5 forKey:@"share_token"];
    [(RadioManagedStation *)self didChangeValueForKey:@"share_token"];
  }
}

- (void)setSharingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RadioManagedStation *)self isSharingEnabled] != a3)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"sharing_enabled"];
    id v5 = [NSNumber numberWithBool:v3];
    [(RadioManagedStation *)self setPrimitiveValue:v5 forKey:@"sharing_enabled"];

    [(RadioManagedStation *)self didChangeValueForKey:@"sharing_enabled"];
  }
}

- (void)setShared:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RadioManagedStation *)self isShared] != a3)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"is_shared"];
    id v5 = [NSNumber numberWithBool:v3];
    [(RadioManagedStation *)self setPrimitiveValue:v5 forKey:@"is_shared"];

    [(RadioManagedStation *)self didChangeValueForKey:@"is_shared"];
  }
}

- (void)setSeedTracks:(id)a3
{
  id v7 = [MEMORY[0x263F08AC0] dataWithPropertyList:a3 format:200 options:0 error:0];
  if (![v7 length])
  {

    id v7 = 0;
  }
  [(RadioManagedStation *)self willAccessValueForKey:@"seed_tracks"];
  id v4 = [(RadioManagedStation *)self primitiveValueForKey:@"seed_tracks"];
  [(RadioManagedStation *)self didAccessValueForKey:@"seed_tracks"];
  if ([v4 length])
  {
    if (v4 && v7 && v4 != v7)
    {
      char v5 = [v4 isEqualToData:v7];
      v6 = v4;
      if (v5) {
        goto LABEL_13;
      }
    }
    else
    {
      v6 = v7;
      if (v4 == v7) {
        goto LABEL_13;
      }
    }
LABEL_12:
    [(RadioManagedStation *)self willChangeValueForKey:@"seed_tracks"];
    [(RadioManagedStation *)self setPrimitiveValue:v7 forKey:@"seed_tracks"];
    [(RadioManagedStation *)self didChangeValueForKey:@"seed_tracks"];
    v6 = v4;
    goto LABEL_13;
  }

  id v4 = 0;
  v6 = 0;
  if (v7) {
    goto LABEL_12;
  }
LABEL_13:
}

- (void)setRequiresSubscription:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RadioManagedStation *)self requiresSubscription] != a3)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"requires_subscription"];
    char v5 = [NSNumber numberWithBool:v3];
    [(RadioManagedStation *)self setPrimitiveValue:v5 forKey:@"requires_subscription"];

    [(RadioManagedStation *)self didChangeValueForKey:@"requires_subscription"];
  }
}

- (void)setPreviewOnly:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RadioManagedStation *)self isPreviewOnly] != a3)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"is_preview_only"];
    char v5 = [NSNumber numberWithBool:v3];
    [(RadioManagedStation *)self setPrimitiveValue:v5 forKey:@"is_preview_only"];

    [(RadioManagedStation *)self didChangeValueForKey:@"is_preview_only"];
  }
}

- (void)setPremiumPlacement:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RadioManagedStation *)self isPremiumPlacement] != a3)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"is_premium_placement"];
    char v5 = [NSNumber numberWithBool:v3];
    [(RadioManagedStation *)self setPrimitiveValue:v5 forKey:@"is_premium_placement"];

    [(RadioManagedStation *)self didChangeValueForKey:@"is_premium_placement"];
  }
}

- (void)setPersistentID:(int64_t)a3
{
  if ([(RadioManagedStation *)self persistentID] != a3)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"persistent_id"];
    char v5 = [NSNumber numberWithLongLong:a3];
    [(RadioManagedStation *)self setPrimitiveValue:v5 forKey:@"persistent_id"];

    [(RadioManagedStation *)self didChangeValueForKey:@"persistent_id"];
  }
}

- (void)setName:(id)a3
{
  id v5 = a3;
  id v4 = [(RadioManagedStation *)self name];
  if (v4 != v5 && ([v4 isEqualToString:v5] & 1) == 0)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"name"];
    [(RadioManagedStation *)self setPrimitiveValue:v5 forKey:@"name"];
    [(RadioManagedStation *)self didChangeValueForKey:@"name"];
  }
}

- (void)setLikesEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RadioManagedStation *)self likesEnabled] != a3)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"likes_enabled"];
    id v5 = [NSNumber numberWithBool:v3];
    [(RadioManagedStation *)self setPrimitiveValue:v5 forKey:@"likes_enabled"];

    [(RadioManagedStation *)self didChangeValueForKey:@"likes_enabled"];
  }
}

- (void)setIsExplicit:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RadioManagedStation *)self isExplicit] != a3)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"is_explicit"];
    id v5 = [NSNumber numberWithBool:v3];
    [(RadioManagedStation *)self setPrimitiveValue:v5 forKey:@"is_explicit"];

    [(RadioManagedStation *)self didChangeValueForKey:@"is_explicit"];
  }
}

- (void)setImpressionThreshold:(unint64_t)a3
{
  if ([(RadioManagedStation *)self impressionThreshold] != a3)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"impression_threshold"];
    id v5 = [NSNumber numberWithUnsignedInteger:a3];
    [(RadioManagedStation *)self setPrimitiveValue:v5 forKey:@"impression_threshold"];

    [(RadioManagedStation *)self didChangeValueForKey:@"impression_threshold"];
  }
}

- (void)setHasSkipRules:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RadioManagedStation *)self hasSkipRules] != a3)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"has_skip_rules"];
    id v5 = [NSNumber numberWithBool:v3];
    [(RadioManagedStation *)self setPrimitiveValue:v5 forKey:@"has_skip_rules"];

    [(RadioManagedStation *)self didChangeValueForKey:@"has_skip_rules"];
  }
}

- (void)setGatewayVideoAdEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RadioManagedStation *)self isGatewayVideoAdEnabled] != a3)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"is_gateway_video_ad_enabled"];
    id v5 = [NSNumber numberWithBool:v3];
    [(RadioManagedStation *)self setPrimitiveValue:v5 forKey:@"is_gateway_video_ad_enabled"];

    [(RadioManagedStation *)self didChangeValueForKey:@"is_gateway_video_ad_enabled"];
  }
}

- (void)setFeatured:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RadioManagedStation *)self isFeatured] != a3)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"is_featured"];
    id v5 = [NSNumber numberWithBool:v3];
    [(RadioManagedStation *)self setPrimitiveValue:v5 forKey:@"is_featured"];

    [(RadioManagedStation *)self didChangeValueForKey:@"is_featured"];
  }
}

- (void)setEditableFields:(id)a3
{
  id v5 = [a3 componentsJoinedByString:@","];
  [(RadioManagedStation *)self willAccessValueForKey:@"editable_fields"];
  id v4 = [(RadioManagedStation *)self primitiveValueForKey:@"editable_fields"];
  [(RadioManagedStation *)self didAccessValueForKey:@"editable_fields"];
  if (v4 != v5 && ([v4 isEqualToString:v5] & 1) == 0)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"editable_fields"];
    [(RadioManagedStation *)self setPrimitiveValue:v5 forKey:@"editable_fields"];
    [(RadioManagedStation *)self didChangeValueForKey:@"editable_fields"];
  }
}

- (void)setEditEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RadioManagedStation *)self editEnabled] != a3)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"edit_enabled"];
    id v5 = [NSNumber numberWithBool:v3];
    [(RadioManagedStation *)self setPrimitiveValue:v5 forKey:@"edit_enabled"];

    [(RadioManagedStation *)self didChangeValueForKey:@"edit_enabled"];
  }
}

- (void)setDebugDictionary:(id)a3
{
  id v7 = [MEMORY[0x263F08AC0] dataWithPropertyList:a3 format:200 options:0 error:0];
  if (![v7 length])
  {

    id v7 = 0;
  }
  [(RadioManagedStation *)self willAccessValueForKey:@"debug_dictionary"];
  id v4 = [(RadioManagedStation *)self primitiveValueForKey:@"debug_dictionary"];
  [(RadioManagedStation *)self didAccessValueForKey:@"debug_dictionary"];
  if ([v4 length])
  {
    if (v4 && v7 && v4 != v7)
    {
      char v5 = [v4 isEqualToData:v7];
      v6 = v4;
      if (v5) {
        goto LABEL_13;
      }
    }
    else
    {
      v6 = v7;
      if (v4 == v7) {
        goto LABEL_13;
      }
    }
LABEL_12:
    [(RadioManagedStation *)self willChangeValueForKey:@"debug_dictionary"];
    [(RadioManagedStation *)self setPrimitiveValue:v7 forKey:@"debug_dictionary"];
    [(RadioManagedStation *)self didChangeValueForKey:@"debug_dictionary"];
    v6 = v4;
    goto LABEL_13;
  }

  id v4 = 0;
  v6 = 0;
  if (v7) {
    goto LABEL_12;
  }
LABEL_13:
}

- (void)setCoreSeedName:(id)a3
{
  id v5 = a3;
  id v4 = [(RadioManagedStation *)self coreSeedName];
  if (v4 != v5 && ([v4 isEqualToString:v5] & 1) == 0)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"core_seed_name"];
    [(RadioManagedStation *)self setPrimitiveValue:v5 forKey:@"core_seed_name"];
    [(RadioManagedStation *)self didChangeValueForKey:@"core_seed_name"];
  }
}

- (void)setArtworkURLData:(id)a3
{
  id v5 = a3;
  id v4 = [(RadioManagedStation *)self artworkURLData];
  if (v4 != v5 && ([v4 isEqualToData:v5] & 1) == 0)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"artwork_url_data"];
    [(RadioManagedStation *)self setPrimitiveValue:v5 forKey:@"artwork_url_data"];
    [(RadioManagedStation *)self didChangeValueForKey:@"artwork_url_data"];
  }
}

- (void)setArtworkURL:(id)a3
{
  id v7 = a3;
  id v4 = [v7 absoluteString];
  [(RadioManagedStation *)self willAccessValueForKey:@"artwork_url"];
  id v5 = [(RadioManagedStation *)self primitiveValueForKey:@"artwork_url"];
  [(RadioManagedStation *)self didAccessValueForKey:@"artwork_url"];
  if (v5 != v4 && ([v5 isEqualToString:v4] & 1) == 0)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"artwork_url"];
    v6 = [v7 absoluteString];
    [(RadioManagedStation *)self setPrimitiveValue:v6 forKey:@"artwork_url"];

    [(RadioManagedStation *)self didChangeValueForKey:@"artwork_url"];
  }
}

- (void)setAdData:(id)a3
{
  id v5 = a3;
  id v4 = [(RadioManagedStation *)self adData];
  if (v4 != v5 && ([v4 isEqualToData:v5] & 1) == 0)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"ad_data"];
    [(RadioManagedStation *)self setPrimitiveValue:v5 forKey:@"ad_data"];
    [(RadioManagedStation *)self didChangeValueForKey:@"ad_data"];
  }
}

- (void)setAdamID:(int64_t)a3
{
  if ([(RadioManagedStation *)self adamID] != a3)
  {
    [(RadioManagedStation *)self willChangeValueForKey:@"adam_id"];
    id v5 = [NSNumber numberWithLongLong:a3];
    [(RadioManagedStation *)self setPrimitiveValue:v5 forKey:@"adam_id"];

    [(RadioManagedStation *)self didChangeValueForKey:@"adam_id"];
  }
}

- (NSArray)seedTracks
{
  [(RadioManagedStation *)self willAccessValueForKey:@"seed_tracks"];
  BOOL v3 = [(RadioManagedStation *)self primitiveValueForKey:@"seed_tracks"];
  [(RadioManagedStation *)self didAccessValueForKey:@"seed_tracks"];
  if ([v3 length])
  {
    id v4 = [MEMORY[0x263F08AC0] propertyListWithData:v3 options:0 format:0 error:0];
  }
  else
  {
    id v4 = 0;
  }

  return (NSArray *)v4;
}

- (BOOL)requiresSubscription
{
  [(RadioManagedStation *)self willAccessValueForKey:@"requires_subscription"];
  BOOL v3 = [(RadioManagedStation *)self primitiveValueForKey:@"requires_subscription"];
  char v4 = [v3 BOOLValue];

  [(RadioManagedStation *)self didAccessValueForKey:@"requires_subscription"];
  return v4;
}

- (int64_t)persistentID
{
  [(RadioManagedStation *)self willAccessValueForKey:@"persistent_id"];
  BOOL v3 = [(RadioManagedStation *)self primitiveValueForKey:@"persistent_id"];
  int64_t v4 = [v3 longLongValue];

  [(RadioManagedStation *)self didAccessValueForKey:@"persistent_id"];
  return v4;
}

- (NSString)name
{
  [(RadioManagedStation *)self willAccessValueForKey:@"name"];
  BOOL v3 = [(RadioManagedStation *)self primitiveValueForKey:@"name"];
  [(RadioManagedStation *)self didAccessValueForKey:@"name"];
  return (NSString *)v3;
}

- (BOOL)likesEnabled
{
  [(RadioManagedStation *)self willAccessValueForKey:@"likes_enabled"];
  BOOL v3 = [(RadioManagedStation *)self primitiveValueForKey:@"likes_enabled"];
  char v4 = [v3 BOOLValue];

  [(RadioManagedStation *)self didAccessValueForKey:@"likes_enabled"];
  return v4;
}

- (BOOL)isSubscribed
{
  [(RadioManagedStation *)self willAccessValueForKey:@"is_subscribed"];
  BOOL v3 = [(RadioManagedStation *)self primitiveValueForKey:@"is_subscribed"];
  char v4 = [v3 BOOLValue];

  [(RadioManagedStation *)self didAccessValueForKey:@"is_subscribed"];
  return v4;
}

- (BOOL)isSponsored
{
  [(RadioManagedStation *)self willAccessValueForKey:@"is_sponsored"];
  BOOL v3 = [(RadioManagedStation *)self primitiveValueForKey:@"is_sponsored"];
  char v4 = [v3 BOOLValue];

  [(RadioManagedStation *)self didAccessValueForKey:@"is_sponsored"];
  return v4;
}

- (BOOL)isSharingEnabled
{
  [(RadioManagedStation *)self willAccessValueForKey:@"sharing_enabled"];
  BOOL v3 = [(RadioManagedStation *)self primitiveValueForKey:@"sharing_enabled"];
  char v4 = [v3 BOOLValue];

  [(RadioManagedStation *)self didAccessValueForKey:@"sharing_enabled"];
  return v4;
}

- (BOOL)isShared
{
  [(RadioManagedStation *)self willAccessValueForKey:@"is_shared"];
  BOOL v3 = [(RadioManagedStation *)self primitiveValueForKey:@"is_shared"];
  char v4 = [v3 BOOLValue];

  [(RadioManagedStation *)self didAccessValueForKey:@"is_shared"];
  return v4;
}

- (BOOL)isPreviewOnly
{
  [(RadioManagedStation *)self willAccessValueForKey:@"is_preview_only"];
  BOOL v3 = [(RadioManagedStation *)self primitiveValueForKey:@"is_preview_only"];
  char v4 = [v3 BOOLValue];

  [(RadioManagedStation *)self didAccessValueForKey:@"is_preview_only"];
  return v4;
}

- (BOOL)isPreview
{
  if ([(RadioManagedStation *)self stationID] || [(RadioManagedStation *)self isFeatured]) {
    return 0;
  }
  else {
    return ![(RadioManagedStation *)self isSponsored];
  }
}

- (BOOL)isPremiumPlacement
{
  [(RadioManagedStation *)self willAccessValueForKey:@"is_premium_placement"];
  BOOL v3 = [(RadioManagedStation *)self primitiveValueForKey:@"is_premium_placement"];
  char v4 = [v3 BOOLValue];

  [(RadioManagedStation *)self didAccessValueForKey:@"is_premium_placement"];
  return v4;
}

- (BOOL)isGatewayVideoAdEnabled
{
  [(RadioManagedStation *)self willAccessValueForKey:@"is_gateway_video_ad_enabled"];
  BOOL v3 = [(RadioManagedStation *)self primitiveValueForKey:@"is_gateway_video_ad_enabled"];
  char v4 = [v3 BOOLValue];

  [(RadioManagedStation *)self didAccessValueForKey:@"is_gateway_video_ad_enabled"];
  return v4;
}

- (BOOL)isFeatured
{
  [(RadioManagedStation *)self willAccessValueForKey:@"is_featured"];
  BOOL v3 = [(RadioManagedStation *)self primitiveValueForKey:@"is_featured"];
  char v4 = [v3 BOOLValue];

  [(RadioManagedStation *)self didAccessValueForKey:@"is_featured"];
  return v4;
}

- (BOOL)isExplicit
{
  [(RadioManagedStation *)self willAccessValueForKey:@"is_explicit"];
  BOOL v3 = [(RadioManagedStation *)self primitiveValueForKey:@"is_explicit"];
  char v4 = [v3 BOOLValue];

  [(RadioManagedStation *)self didAccessValueForKey:@"is_explicit"];
  return v4;
}

- (unint64_t)impressionThreshold
{
  [(RadioManagedStation *)self willAccessValueForKey:@"impression_threshold"];
  BOOL v3 = [(RadioManagedStation *)self primitiveValueForKey:@"impression_threshold"];
  unint64_t v4 = [v3 unsignedIntegerValue];

  [(RadioManagedStation *)self didAccessValueForKey:@"impression_threshold"];
  return v4;
}

- (BOOL)hasSkipRules
{
  [(RadioManagedStation *)self willAccessValueForKey:@"has_skip_rules"];
  BOOL v3 = [(RadioManagedStation *)self primitiveValueForKey:@"has_skip_rules"];
  char v4 = [v3 BOOLValue];

  [(RadioManagedStation *)self didAccessValueForKey:@"has_skip_rules"];
  return v4;
}

- (id)feedbackDictionaryRepresentation
{
  BOOL v3 = [(RadioManagedStation *)self dictionaryRepresentation];
  char v4 = (void *)[v3 mutableCopy];

  id v5 = [(RadioManagedStation *)self debugDictionary];
  if (v5) {
    [v4 setObject:v5 forKey:@"debug-dict"];
  }
  v6 = (void *)[v4 copy];

  return v6;
}

- (BOOL)editEnabled
{
  [(RadioManagedStation *)self willAccessValueForKey:@"edit_enabled"];
  BOOL v3 = [(RadioManagedStation *)self primitiveValueForKey:@"edit_enabled"];
  char v4 = [v3 BOOLValue];

  [(RadioManagedStation *)self didAccessValueForKey:@"edit_enabled"];
  return v4;
}

- (NSArray)editableFields
{
  [(RadioManagedStation *)self willAccessValueForKey:@"editable_fields"];
  BOOL v3 = [(RadioManagedStation *)self primitiveValueForKey:@"editable_fields"];
  char v4 = [v3 componentsSeparatedByString:@","];

  [(RadioManagedStation *)self didAccessValueForKey:@"editable_fields"];
  return (NSArray *)v4;
}

- (NSDictionary)debugDictionary
{
  [(RadioManagedStation *)self willAccessValueForKey:@"debug_dictionary"];
  BOOL v3 = [(RadioManagedStation *)self primitiveValueForKey:@"debug_dictionary"];
  [(RadioManagedStation *)self didAccessValueForKey:@"debug_dictionary"];
  if ([v3 length])
  {
    char v4 = [MEMORY[0x263F08AC0] propertyListWithData:v3 options:0 format:0 error:0];
  }
  else
  {
    char v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (NSString)coreSeedName
{
  [(RadioManagedStation *)self willAccessValueForKey:@"core_seed_name"];
  BOOL v3 = [(RadioManagedStation *)self primitiveValueForKey:@"core_seed_name"];
  [(RadioManagedStation *)self didAccessValueForKey:@"core_seed_name"];
  return (NSString *)v3;
}

- (NSData)artworkURLData
{
  [(RadioManagedStation *)self willAccessValueForKey:@"artwork_url_data"];
  BOOL v3 = [(RadioManagedStation *)self primitiveValueForKey:@"artwork_url_data"];
  [(RadioManagedStation *)self didAccessValueForKey:@"artwork_url_data"];
  return (NSData *)v3;
}

- (NSURL)artworkURL
{
  [(RadioManagedStation *)self willAccessValueForKey:@"artwork_url"];
  BOOL v3 = [(RadioManagedStation *)self primitiveValueForKey:@"artwork_url"];
  [(RadioManagedStation *)self didAccessValueForKey:@"artwork_url"];
  if (v3)
  {
    char v4 = [NSURL URLWithString:v3];
    id v5 = v4;
    if (v4)
    {
      v6 = [v4 scheme];

      if (!v6)
      {
        uint64_t v7 = [NSURL fileURLWithPath:v3 isDirectory:0];

        id v5 = (void *)v7;
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return (NSURL *)v5;
}

- (id)additionalReferencedTrackDescriptors
{
  [(RadioManagedStation *)self willAccessValueForKey:@"additional_referenced_track_descriptors_data"];
  BOOL v3 = [(RadioManagedStation *)self primitiveValueForKey:@"additional_referenced_track_descriptors_data"];
  [(RadioManagedStation *)self didAccessValueForKey:@"additional_referenced_track_descriptors_data"];
  return v3;
}

- (NSData)adData
{
  [(RadioManagedStation *)self willAccessValueForKey:@"ad_data"];
  BOOL v3 = [(RadioManagedStation *)self primitiveValueForKey:@"ad_data"];
  [(RadioManagedStation *)self didAccessValueForKey:@"ad_data"];
  return (NSData *)v3;
}

- (int64_t)adamID
{
  [(RadioManagedStation *)self willAccessValueForKey:@"adam_id"];
  BOOL v3 = [(RadioManagedStation *)self primitiveValueForKey:@"adam_id"];
  int64_t v4 = [v3 longLongValue];

  [(RadioManagedStation *)self didAccessValueForKey:@"adam_id"];
  return v4;
}

@end