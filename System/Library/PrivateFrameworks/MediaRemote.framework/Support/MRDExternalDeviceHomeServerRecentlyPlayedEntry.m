@interface MRDExternalDeviceHomeServerRecentlyPlayedEntry
- (BOOL)isEqual:(id)a3;
- (BOOL)isPlaying;
- (MRContentItem)contentItem;
- (MRDExternalDeviceHomeServerRecentlyPlayedEntry)initWithDictionaryRepresentation:(id)a3;
- (MRDeviceInfo)deviceInfo;
- (MRPlayerPath)playerPath;
- (NSArray)currentPlaybackSessionTypes;
- (NSArray)supportedPlaybackSessionTypes;
- (NSDate)date;
- (NSDate)lastNotPlayingDate;
- (NSDate)lastPlayingDate;
- (NSDictionary)dictionaryRepresentation;
- (NSString)currentPlaybackSessionIdentifier;
- (id)description;
- (void)setContentItem:(id)a3;
- (void)setCurrentPlaybackSessionIdentifier:(id)a3;
- (void)setCurrentPlaybackSessionTypes:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setDictionaryRepresentation:(id)a3;
- (void)setIsPlaying:(BOOL)a3;
- (void)setLastNotPlayingDate:(id)a3;
- (void)setLastPlayingDate:(id)a3;
- (void)setPlayerPath:(id)a3;
- (void)setSupportedPlaybackSessionTypes:(id)a3;
@end

@implementation MRDExternalDeviceHomeServerRecentlyPlayedEntry

- (MRDExternalDeviceHomeServerRecentlyPlayedEntry)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MRDExternalDeviceHomeServerRecentlyPlayedEntry;
  v5 = [(MRDExternalDeviceHomeServerRecentlyPlayedEntry *)&v25 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isPlaying"];
    v5->_isPlaying = [v6 BOOLValue];

    uint64_t v7 = [v4 objectForKeyedSubscript:@"lastPlayingDate"];
    lastPlayingDate = v5->_lastPlayingDate;
    v5->_lastPlayingDate = (NSDate *)v7;

    uint64_t v9 = [v4 objectForKeyedSubscript:@"lastNotPlayingDate"];
    lastNotPlayingDate = v5->_lastNotPlayingDate;
    v5->_lastNotPlayingDate = (NSDate *)v9;

    uint64_t v11 = [v4 objectForKeyedSubscript:@"currentPlaybackSessionTypes"];
    currentPlaybackSessionTypes = v5->_currentPlaybackSessionTypes;
    v5->_currentPlaybackSessionTypes = (NSArray *)v11;

    uint64_t v13 = [v4 objectForKeyedSubscript:@"supportedPlaybackSessionTypes"];
    supportedPlaybackSessionTypes = v5->_supportedPlaybackSessionTypes;
    v5->_supportedPlaybackSessionTypes = (NSArray *)v13;

    uint64_t v15 = [v4 objectForKeyedSubscript:@"currentPlaybackSessionIdentifier"];
    currentPlaybackSessionIdentifier = v5->_currentPlaybackSessionIdentifier;
    v5->_currentPlaybackSessionIdentifier = (NSString *)v15;

    uint64_t v17 = [v4 objectForKeyedSubscript:kMRNowPlayingPlayerPathUserInfoKey];
    playerPath = v5->_playerPath;
    v5->_playerPath = (MRPlayerPath *)v17;

    uint64_t v19 = [v4 objectForKeyedSubscript:kMRPairedDeviceUserInfoKey];
    deviceInfo = v5->_deviceInfo;
    v5->_deviceInfo = (MRDeviceInfo *)v19;

    v21 = [v4 objectForKeyedSubscript:kMRMediaRemoteUpdatedContentItemsUserInfoKey];
    uint64_t v22 = [v21 firstObject];
    contentItem = v5->_contentItem;
    v5->_contentItem = (MRContentItem *)v22;
  }
  return v5;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  if (self->_isPlaying) {
    CFStringRef v4 = @"PLAYING";
  }
  else {
    CFStringRef v4 = @"NOT PLAYING";
  }
  v5 = [(MRDExternalDeviceHomeServerRecentlyPlayedEntry *)self date];
  long long v11 = *(_OWORD *)&self->_currentPlaybackSessionTypes;
  currentPlaybackSessionIdentifier = self->_currentPlaybackSessionIdentifier;
  uint64_t v7 = [(MRDeviceInfo *)self->_deviceInfo deviceUID];
  v8 = [(MRDeviceInfo *)self->_deviceInfo name];
  id v9 = [v3 initWithFormat:@"%@-%@-%@-%@-%@-%@(%@)-%@-%@", v4, v5, v11, currentPlaybackSessionIdentifier, v7, v8, self->_playerPath, self->_contentItem];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  int isPlaying = self->_isPlaying;
  if (isPlaying != [v6 isPlaying])
  {
    unsigned __int8 v16 = 0;
    goto LABEL_26;
  }
  BOOL v8 = self->_isPlaying;
  if (!self->_isPlaying)
  {
    id v3 = [(MRDExternalDeviceHomeServerRecentlyPlayedEntry *)self date];
    CFStringRef v4 = [v6 date];
    if (![v3 isEqualToDate:v4])
    {
      unsigned __int8 v16 = 0;
      goto LABEL_25;
    }
  }
  id v9 = [(MRDeviceInfo *)self->_deviceInfo deviceUID];
  v10 = [v6 deviceInfo];
  long long v11 = [v10 deviceUID];
  if (![v9 isEqualToString:v11])
  {

    unsigned __int8 v16 = 0;
    if (v8) {
      goto LABEL_26;
    }
LABEL_25:

    goto LABEL_26;
  }
  v27 = v4;
  v12 = [(MRDeviceInfo *)self->_deviceInfo name];
  uint64_t v13 = [v6 deviceInfo];
  v14 = [v13 name];
  if ([v12 isEqualToString:v14])
  {
    objc_super v25 = v3;
    unsigned int v15 = [(MRDeviceInfo *)self->_deviceInfo isAirPlayActive];
    v26 = [v6 deviceInfo];
    if (v15 == [v26 isAirPlayActive])
    {
      v24 = [v6 contentItem];
      if (MRContentItemEqualToItem())
      {
        currentPlaybackSessionTypes = self->_currentPlaybackSessionTypes;
        v23 = [v6 currentPlaybackSessionTypes];
        if (-[NSArray isEqualToArray:](currentPlaybackSessionTypes, "isEqualToArray:"))
        {
          supportedPlaybackSessionTypes = self->_supportedPlaybackSessionTypes;
          uint64_t v22 = [v6 supportedPlaybackSessionTypes];
          if (-[NSArray isEqualToArray:](supportedPlaybackSessionTypes, "isEqualToArray:"))
          {
            currentPlaybackSessionIdentifier = self->_currentPlaybackSessionIdentifier;
            v20 = [v6 currentPlaybackSessionIdentifier];
            unsigned __int8 v16 = [(NSString *)currentPlaybackSessionIdentifier isEqualToString:v20];
          }
          else
          {
            unsigned __int8 v16 = 0;
          }
          id v3 = v25;
        }
        else
        {
          unsigned __int8 v16 = 0;
          id v3 = v25;
        }
      }
      else
      {
        unsigned __int8 v16 = 0;
        id v3 = v25;
      }
    }
    else
    {
      unsigned __int8 v16 = 0;
      id v3 = v25;
    }
  }
  else
  {
    unsigned __int8 v16 = 0;
  }

  CFStringRef v4 = v27;
  if (!v8) {
    goto LABEL_25;
  }
LABEL_26:

  return v16;
}

- (void)setContentItem:(id)a3
{
  id v4 = a3;
  id v7 = objc_alloc_init((Class)MRPlaybackQueueRequest);
  [v7 setIncludeMetadata:1];
  v5 = (MRContentItem *)MRContentItemCreateFromRequest();

  contentItem = self->_contentItem;
  self->_contentItem = v5;
}

- (NSDate)date
{
  uint64_t v2 = 16;
  if (!self->_isPlaying) {
    uint64_t v2 = 24;
  }
  return (NSDate *)*(id *)((char *)&self->super.isa + v2);
}

- (NSDictionary)dictionaryRepresentation
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = +[NSNumber numberWithBool:self->_isPlaying];
  [v3 setObject:v4 forKeyedSubscript:@"isPlaying"];

  [v3 setObject:self->_lastPlayingDate forKeyedSubscript:@"lastPlayingDate"];
  [v3 setObject:self->_lastNotPlayingDate forKeyedSubscript:@"lastNotPlayingDate"];
  v5 = [(MRDeviceInfo *)self->_deviceInfo deviceUID];
  [v3 setObject:v5 forKeyedSubscript:@"deviceUID"];

  [v3 setObject:self->_currentPlaybackSessionTypes forKeyedSubscript:@"currentPlaybackSessionTypes"];
  [v3 setObject:self->_supportedPlaybackSessionTypes forKeyedSubscript:@"supportedPlaybackSessionTypes"];
  [v3 setObject:self->_currentPlaybackSessionIdentifier forKeyedSubscript:@"currentPlaybackSessionIdentifier"];
  [v3 setObject:self->_playerPath forKeyedSubscript:kMRNowPlayingPlayerPathUserInfoKey];
  id v6 = [(MRPlayerPath *)self->_playerPath description];
  [v3 setObject:v6 forKeyedSubscript:@"playerPathDescription"];

  [v3 setObject:self->_deviceInfo forKeyedSubscript:kMRPairedDeviceUserInfoKey];
  if (self->_contentItem)
  {
    contentItem = self->_contentItem;
    id v7 = +[NSArray arrayWithObjects:&contentItem count:1];
    [v3 setObject:v7 forKeyedSubscript:kMRMediaRemoteUpdatedContentItemsUserInfoKey];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:kMRMediaRemoteUpdatedContentItemsUserInfoKey];
  }
  BOOL v8 = (void *)MRContentItemCopyMinimalReadableDescription();
  [v3 setObject:v8 forKeyedSubscript:@"contentItemDescription"];

  return (NSDictionary *)v3;
}

- (BOOL)isPlaying
{
  return self->_isPlaying;
}

- (void)setIsPlaying:(BOOL)a3
{
  self->_int isPlaying = a3;
}

- (NSDate)lastPlayingDate
{
  return self->_lastPlayingDate;
}

- (void)setLastPlayingDate:(id)a3
{
}

- (NSDate)lastNotPlayingDate
{
  return self->_lastNotPlayingDate;
}

- (void)setLastNotPlayingDate:(id)a3
{
}

- (MRDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setDeviceInfo:(id)a3
{
}

- (NSArray)currentPlaybackSessionTypes
{
  return self->_currentPlaybackSessionTypes;
}

- (void)setCurrentPlaybackSessionTypes:(id)a3
{
}

- (NSArray)supportedPlaybackSessionTypes
{
  return self->_supportedPlaybackSessionTypes;
}

- (void)setSupportedPlaybackSessionTypes:(id)a3
{
}

- (NSString)currentPlaybackSessionIdentifier
{
  return self->_currentPlaybackSessionIdentifier;
}

- (void)setCurrentPlaybackSessionIdentifier:(id)a3
{
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
}

- (MRContentItem)contentItem
{
  return self->_contentItem;
}

- (void)setDictionaryRepresentation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryRepresentation, 0);
  objc_storeStrong((id *)&self->_contentItem, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_currentPlaybackSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_supportedPlaybackSessionTypes, 0);
  objc_storeStrong((id *)&self->_currentPlaybackSessionTypes, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_lastNotPlayingDate, 0);

  objc_storeStrong((id *)&self->_lastPlayingDate, 0);
}

@end