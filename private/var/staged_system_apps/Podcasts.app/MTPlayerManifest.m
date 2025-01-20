@interface MTPlayerManifest
- (BOOL)networkUPPEnabled;
- (BOOL)userActivityContainsPlayhead;
- (MTPlayerManifest)init;
- (NSString)manifestIdentifier;
- (id)activity;
- (id)activitySpotlightIdentifier;
- (id)metricsAdditionalData;
- (id)metricsContentIdentifier;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)playReason;
- (void)enumerateObjectsUsingBlock:(id)a3;
- (void)setManifestIdentifier:(id)a3;
- (void)setNetworkUPPEnabled:(BOOL)a3;
- (void)setPlayReason:(unint64_t)a3;
@end

@implementation MTPlayerManifest

- (MTPlayerManifest)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTPlayerManifest;
  v2 = [(MTPlayerManifest *)&v6 init];
  if (v2)
  {
    v3 = +[NSUUID UUID];
    v4 = [v3 UUIDString];
    [(MTPlayerManifest *)v2 setManifestIdentifier:v4];
  }
  return v2;
}

- (id)activity
{
  v9.receiver = self;
  v9.super_class = (Class)MTPlayerManifest;
  v3 = [(MTPlayerManifest *)&v9 activity];
  [v3 setEligibleForHandoff:1];
  v4 = [(MTPlayerManifest *)self currentItem];
  v5 = [v4 episodeShareUrl];
  [v3 setWebpageURL:v5];

  objc_super v6 = [(MTPlayerManifest *)self activitySpotlightIdentifier];
  if (v6)
  {
    id v7 = [objc_alloc((Class)CSSearchableItemAttributeSet) initWithItemContentType:kUTTypeAudiovisualContent];
    [v7 setRelatedUniqueIdentifier:v6];
    [v3 setContentAttributeSet:v7];
  }

  return v3;
}

- (id)activitySpotlightIdentifier
{
  v3 = [(MTPlayerManifest *)self currentItem];

  if (v3)
  {
    v4 = [(MTPlayerManifest *)self currentItem];
    v5 = +[MTCoreSpotlightUtil uniqueIdentifierForPodcastInPlayerItem:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)userActivityContainsPlayhead
{
  return 0;
}

- (void)setNetworkUPPEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = _MTLogCategoryPlayback();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"Disabled";
    if (v3) {
      CFStringRef v6 = @"Enabled";
    }
    int v7 = 138412546;
    CFStringRef v8 = v6;
    __int16 v9 = 2112;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Network UPP %@ for manifest %@", (uint8_t *)&v7, 0x16u);
  }

  self->_networkUPPEnabled = v3;
}

- (id)objectAtIndex:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTPlayerManifest;
  BOOL v3 = [(MTPlayerManifest *)&v5 objectAtIndex:a3];

  return v3;
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, void *, unsigned char *))a3;
  if (v4 && [(MTPlayerManifest *)self count])
  {
    unint64_t v5 = 0;
    do
    {
      CFStringRef v6 = [(MTPlayerManifest *)self objectAtIndex:v5];
      unsigned __int8 v8 = 0;
      v4[2](v4, v6, &v8);
      int v7 = v8;

      if (v7) {
        break;
      }
      ++v5;
    }
    while ((unint64_t)[(MTPlayerManifest *)self count] > v5);
  }
}

- (id)metricsContentIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)metricsAdditionalData
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = +[NSNumber numberWithUnsignedInteger:[(MTPlayerManifest *)self count]];
  [v3 setObject:v4 forKeyedSubscript:@"count"];

  unint64_t v5 = [(MTPlayerManifest *)self title];

  if (v5)
  {
    CFStringRef v6 = [(MTPlayerManifest *)self title];
    [v3 setObject:v6 forKeyedSubscript:@"title"];
  }
  int v7 = [(MTPlayerManifest *)self manifestIdentifier];
  [v3 setObject:v7 forKeyedSubscript:@"manifest_id"];

  unsigned __int8 v8 = +[MTStoreReportingController reportingStringForPlayReason:[(MTPlayerManifest *)self playReason]];
  [v3 setObject:v8 forKeyedSubscript:@"manifest_source"];

  return v3;
}

- (unint64_t)playReason
{
  return self->_playReason;
}

- (void)setPlayReason:(unint64_t)a3
{
  self->_playReason = a3;
}

- (BOOL)networkUPPEnabled
{
  return self->_networkUPPEnabled;
}

- (NSString)manifestIdentifier
{
  return self->_manifestIdentifier;
}

- (void)setManifestIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end