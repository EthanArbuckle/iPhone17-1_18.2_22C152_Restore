@interface MRNowPlayingPlayerResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)deviceHasPlayedRecently;
- (BOOL)playerHasPlayedRecently;
- (MRClient)clientProperties;
- (MRDestination)destination;
- (MRNowPlayingPlayerResponse)initWithCoder:(id)a3;
- (MRPlaybackQueue)playbackQueue;
- (MRPlayerPath)playerPath;
- (NSArray)proxiableSupportedCommands;
- (NSArray)supportedCommands;
- (NSDate)deviceLastPlayingDate;
- (NSDate)playerLastPlayingDate;
- (NSDictionary)debugDictionaryRepresentation;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)shortDictionaryRepresentation;
- (float)playbackRate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (int)repeatMode;
- (int)shuffleMode;
- (unsigned)playbackState;
- (void)encodeWithCoder:(id)a3;
- (void)setClientProperties:(id)a3;
- (void)setDestination:(id)a3;
- (void)setDeviceLastPlayingDate:(id)a3;
- (void)setPlaybackQueue:(id)a3;
- (void)setPlaybackState:(unsigned int)a3;
- (void)setPlayerLastPlayingDate:(id)a3;
- (void)setPlayerPath:(id)a3;
- (void)setSupportedCommands:(id)a3;
@end

@implementation MRNowPlayingPlayerResponse

- (NSArray)proxiableSupportedCommands
{
  v2 = [(MRNowPlayingPlayerResponse *)self supportedCommands];
  v3 = objc_msgSend(v2, "mr_filter:", &__block_literal_global_90);

  return (NSArray *)v3;
}

- (BOOL)deviceHasPlayedRecently
{
  v2 = [(MRNowPlayingPlayerResponse *)self deviceLastPlayingDate];
  [v2 timeIntervalSinceNow];
  double v4 = -v3;
  v5 = +[MRUserSettings currentSettings];
  [v5 mediaRecentlyPlayedInterval];
  BOOL v7 = v6 > v4;

  return v7;
}

- (BOOL)playerHasPlayedRecently
{
  v2 = [(MRNowPlayingPlayerResponse *)self playerLastPlayingDate];
  [v2 timeIntervalSinceNow];
  double v4 = -v3;
  v5 = +[MRUserSettings currentSettings];
  [v5 mediaRecentlyPlayedInterval];
  BOOL v7 = v6 > v4;

  return v7;
}

- (NSDate)playerLastPlayingDate
{
  if (MRMediaRemotePlaybackStateIsAdvancing([(MRNowPlayingPlayerResponse *)self playbackState]))
  {
    double v3 = [MEMORY[0x1E4F1C9C8] date];
  }
  else
  {
    playerLastPlayingDate = self->_playerLastPlayingDate;
    if (playerLastPlayingDate)
    {
      double v3 = playerLastPlayingDate;
    }
    else
    {
      double v3 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
  }

  return v3;
}

- (NSDate)deviceLastPlayingDate
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  double v3 = [MEMORY[0x1E4F29128] UUID];
  double v4 = [v3 UUIDString];

  v5 = [MEMORY[0x1E4F1C9C8] date];
  double v6 = [MRPlayerPath alloc];
  BOOL v7 = [(MRNowPlayingPlayerResponse *)self playerPath];
  v8 = [v7 origin];
  v9 = [(MRPlayerPath *)v6 initWithOrigin:v8 client:0 player:0];

  v10 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"[MRNowPlayingPlayerResponse deviceLastPlayingDate]", v4];
  v11 = [(MRNowPlayingPlayerResponse *)self playerPath];

  if (v11)
  {
    v12 = [(MRNowPlayingPlayerResponse *)self playerPath];
    [(__CFString *)v10 appendFormat:@" for %@", v12];
  }
  v13 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v49 = v10;
    _os_log_impl(&dword_194F3C000, v13, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v14 = (void *)MRGetSharedService();
  id v47 = 0;
  v15 = MRMediaRemoteServiceGetLastPlayingDateForPlayerSync(v14, v9, &v47);
  id v16 = v47;
  v17 = NSString;
  v18 = NSNumber;
  [v15 timeIntervalSinceNow];
  v20 = [v18 numberWithDouble:-v19];
  v21 = [v17 stringWithFormat:@"deviceLastPlayingDate = %@. Time since playing = %@ seconds.", v15, v20];

  v22 = [(MRNowPlayingPlayerResponse *)self playerPath];

  v23 = _MRLogForCategory(0xAuLL);
  v24 = v23;
  if (!v16 && v21)
  {
    BOOL v25 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (v22)
    {
      if (v25)
      {
        v26 = [(MRNowPlayingPlayerResponse *)self playerPath];
        v27 = [MEMORY[0x1E4F1C9C8] date];
        [v27 timeIntervalSinceDate:v5];
        *(_DWORD *)buf = 138544386;
        v49 = @"[MRNowPlayingPlayerResponse deviceLastPlayingDate]";
        __int16 v50 = 2114;
        v51 = v4;
        __int16 v52 = 2112;
        id v53 = v21;
        __int16 v54 = 2114;
        v55 = v26;
        __int16 v56 = 2048;
        uint64_t v57 = v28;
        v29 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v30 = v24;
        uint32_t v31 = 52;
LABEL_17:
        _os_log_impl(&dword_194F3C000, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);

LABEL_25:
        goto LABEL_26;
      }
      goto LABEL_26;
    }
    if (!v25) {
      goto LABEL_26;
    }
    v26 = [MEMORY[0x1E4F1C9C8] date];
    [v26 timeIntervalSinceDate:v5];
    *(_DWORD *)buf = 138544130;
    v49 = @"[MRNowPlayingPlayerResponse deviceLastPlayingDate]";
    __int16 v50 = 2114;
    v51 = v4;
    __int16 v52 = 2112;
    id v53 = v21;
    __int16 v54 = 2048;
    v55 = v38;
    v39 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    v40 = v24;
    uint32_t v41 = 42;
LABEL_24:
    _os_log_impl(&dword_194F3C000, v40, OS_LOG_TYPE_DEFAULT, v39, buf, v41);
    goto LABEL_25;
  }
  if (v16)
  {
    BOOL v32 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (v22)
    {
      if (v32)
      {
        v33 = [(MRNowPlayingPlayerResponse *)self playerPath];
        v34 = [MEMORY[0x1E4F1C9C8] date];
        [v34 timeIntervalSinceDate:v5];
        *(_DWORD *)buf = 138544386;
        v49 = @"[MRNowPlayingPlayerResponse deviceLastPlayingDate]";
        __int16 v50 = 2114;
        v51 = v4;
        __int16 v52 = 2114;
        id v53 = v16;
        __int16 v54 = 2114;
        v55 = v33;
        __int16 v56 = 2048;
        uint64_t v57 = v35;
        _os_log_error_impl(&dword_194F3C000, v24, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);

LABEL_31:
      }
    }
    else if (v32)
    {
      v33 = [MEMORY[0x1E4F1C9C8] date];
      [v33 timeIntervalSinceDate:v5];
      *(_DWORD *)buf = 138544130;
      v49 = @"[MRNowPlayingPlayerResponse deviceLastPlayingDate]";
      __int16 v50 = 2114;
      v51 = v4;
      __int16 v52 = 2114;
      id v53 = v16;
      __int16 v54 = 2048;
      v55 = v46;
      _os_log_error_impl(&dword_194F3C000, v24, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", buf, 0x2Au);
      goto LABEL_31;
    }

    id v42 = [MEMORY[0x1E4F1C9C8] distantPast];
    goto LABEL_27;
  }
  BOOL v36 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
  if (!v22)
  {
    if (!v36) {
      goto LABEL_26;
    }
    v26 = [MEMORY[0x1E4F1C9C8] date];
    [v26 timeIntervalSinceDate:v5];
    *(_DWORD *)buf = 138543874;
    v49 = @"[MRNowPlayingPlayerResponse deviceLastPlayingDate]";
    __int16 v50 = 2114;
    v51 = v4;
    __int16 v52 = 2048;
    id v53 = v43;
    v39 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    v40 = v24;
    uint32_t v41 = 32;
    goto LABEL_24;
  }
  if (v36)
  {
    v26 = [(MRNowPlayingPlayerResponse *)self playerPath];
    v27 = [MEMORY[0x1E4F1C9C8] date];
    [v27 timeIntervalSinceDate:v5];
    *(_DWORD *)buf = 138544130;
    v49 = @"[MRNowPlayingPlayerResponse deviceLastPlayingDate]";
    __int16 v50 = 2114;
    v51 = v4;
    __int16 v52 = 2114;
    id v53 = v26;
    __int16 v54 = 2048;
    v55 = v37;
    v29 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    v30 = v24;
    uint32_t v31 = 42;
    goto LABEL_17;
  }
LABEL_26:

  id v42 = v15;
LABEL_27:
  v44 = v42;

  return (NSDate *)v44;
}

BOOL __56__MRNowPlayingPlayerResponse_proxiableSupportedCommands__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 options];
  double v3 = [v2 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoDoNotProxy"];
  BOOL v4 = v3 == 0;

  return v4;
}

- (int)shuffleMode
{
  v2 = [(MRNowPlayingPlayerResponse *)self supportedCommands];
  double v3 = objc_msgSend(v2, "msv_firstWhere:", &__block_literal_global_27_2);

  BOOL v4 = [v3 options];
  v5 = [v4 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoShuffleMode"];
  int v6 = [v5 intValue];

  return v6;
}

BOOL __41__MRNowPlayingPlayerResponse_shuffleMode__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 command] == 26 || objc_msgSend(v2, "command") == 6;

  return v3;
}

- (int)repeatMode
{
  id v2 = [(MRNowPlayingPlayerResponse *)self supportedCommands];
  BOOL v3 = objc_msgSend(v2, "msv_firstWhere:", &__block_literal_global_29_2);

  BOOL v4 = [v3 options];
  v5 = [v4 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoRepeatMode"];
  int v6 = [v5 intValue];

  return v6;
}

BOOL __40__MRNowPlayingPlayerResponse_repeatMode__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 command] == 25 || objc_msgSend(v2, "command") == 7;

  return v3;
}

- (float)playbackRate
{
  id v2 = [(MRNowPlayingPlayerResponse *)self playbackQueue];
  BOOL v3 = [v2 contentItems];
  BOOL v4 = [v3 firstObject];
  v5 = [v4 metadata];
  [v5 playbackRate];
  float v7 = v6;

  return v7;
}

- (MRPlayerPath)playerPath
{
  id v2 = [(MRNowPlayingPlayerResponse *)self destination];
  BOOL v3 = [v2 playerPath];

  return (MRPlayerPath *)v3;
}

- (void)setPlayerPath:(id)a3
{
  id v4 = a3;
  v5 = [[MRDestination alloc] initWithPlayerPath:v4];

  [(MRNowPlayingPlayerResponse *)self setDestination:v5];
}

- (NSDictionary)shortDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(MRNowPlayingPlayerResponse *)self playerPath];
  [v3 setObject:v4 forKeyedSubscript:@"playerPath"];

  v5 = [(MRNowPlayingPlayerResponse *)self playbackQueue];
  int v6 = [v5 hasLocation];

  if (v6)
  {
    float v7 = [(MRNowPlayingPlayerResponse *)self playbackQueue];
    v8 = [v7 contentItemWithOffset:0];

    if (v8)
    {
      v9 = MRContentItemCopyMinimalReadableDescription(v8);
      [v3 setObject:v9 forKeyedSubscript:@"nowPlayingItemIdentifier"];

      v10 = NSNumber;
      [(MRNowPlayingPlayerResponse *)self playbackRate];
      v11 = objc_msgSend(v10, "numberWithFloat:");
      [v3 setObject:v11 forKeyedSubscript:@"playbackRate"];

      v12 = [v8 metadata];
      v13 = [v12 title];
      [v3 setObject:v13 forKeyedSubscript:@"title"];
    }
  }
  v14 = [(MRNowPlayingPlayerResponse *)self supportedCommands];

  if (v14)
  {
    v15 = NSNumber;
    id v16 = [(MRNowPlayingPlayerResponse *)self supportedCommands];
    v17 = objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
    [v3 setObject:v17 forKeyedSubscript:@"supportedCommandsCount"];
  }
  if ([(MRNowPlayingPlayerResponse *)self playbackState])
  {
    v18 = MRMediaRemoteCopyPlaybackStateDescription([(MRNowPlayingPlayerResponse *)self playbackState]);
    [v3 setObject:v18 forKeyedSubscript:@"playbackState"];
  }

  return (NSDictionary *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = [(MRNowPlayingPlayerResponse *)self shortDictionaryRepresentation];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(MRNowPlayingPlayerResponse *)self playbackQueue];
  int v6 = [v5 queueIdentifier];
  [v4 setObject:v6 forKeyedSubscript:@"queueIdentifier"];

  float v7 = [(MRNowPlayingPlayerResponse *)self playbackQueue];
  v8 = [v7 properties];
  [v4 setObject:v8 forKeyedSubscript:@"queueProperties"];

  v9 = [(MRNowPlayingPlayerResponse *)self playbackQueue];
  v10 = [v9 auxiliaryNowPlayingInfo];
  [v4 setObject:v10 forKeyedSubscript:@"auxiliaryNowPlayingInfo"];

  v11 = [(MRNowPlayingPlayerResponse *)self playbackQueue];
  LODWORD(v10) = [v11 hasLocation];

  if (v10)
  {
    v12 = [(MRNowPlayingPlayerResponse *)self playbackQueue];
    v13 = [v12 contentItemWithOffset:0];

    if (v13)
    {
      v14 = [v13 metadata];
      int v15 = [v14 hasElapsedTime];

      if (v15)
      {
        id v16 = NSNumber;
        v17 = [v13 metadata];
        [v17 calculatedPlaybackPosition];
        v18 = objc_msgSend(v16, "numberWithDouble:");
        [v4 setObject:v18 forKeyedSubscript:@"calculateElapsedTime"];
      }
      double v19 = [v13 metadata];
      int v20 = [v19 hasDuration];

      if (v20)
      {
        v21 = NSNumber;
        v22 = [v13 metadata];
        [v22 duration];
        v23 = objc_msgSend(v21, "numberWithDouble:");
        [v4 setObject:v23 forKeyedSubscript:@"duration"];
      }
    }
  }
  v24 = [(MRNowPlayingPlayerResponse *)self supportedCommands];

  if (v24)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    BOOL v25 = [(MRNowPlayingPlayerResponse *)self supportedCommands];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v40;
      uint64_t v29 = MEMORY[0x1E4F1CC38];
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v40 != v28) {
            objc_enumerationMutation(v25);
          }
          uint32_t v31 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          if ([v31 command] == 133 && objc_msgSend(v31, "isEnabled"))
          {
            [v4 setObject:v29 forKeyedSubscript:@"migrationEnabled"];
            BOOL v32 = [v31 options];
            [v4 setObject:v32 forKeyedSubscript:@"migrationTypes"];
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v27);
    }
  }
  if (self->_playerLastPlayingDate)
  {
    v33 = [(MRNowPlayingPlayerResponse *)self playerLastPlayingDate];
    [v4 setObject:v33 forKeyedSubscript:@"playerLastPlayingDate"];
  }
  if ([(MRNowPlayingPlayerResponse *)self playbackState])
  {
    v34 = MRMediaRemoteCopyPlaybackStateDescription([(MRNowPlayingPlayerResponse *)self playbackState]);
    [v4 setObject:v34 forKeyedSubscript:@"playbackState"];
  }
  uint64_t v35 = [(MRNowPlayingPlayerResponse *)self clientProperties];
  [v4 setObject:v35 forKeyedSubscript:@"clientProperties"];

  if ([(MRNowPlayingPlayerResponse *)self repeatMode] >= 1)
  {
    BOOL v36 = (__CFString *)MRMediaRemoteCopyRepeatModeDescription([(MRNowPlayingPlayerResponse *)self repeatMode]);
    [v4 setObject:v36 forKeyedSubscript:@"repeatMode"];
  }
  if ([(MRNowPlayingPlayerResponse *)self shuffleMode] >= 1)
  {
    v37 = (__CFString *)MRMediaRemoteCopyShuffleModeDescription([(MRNowPlayingPlayerResponse *)self shuffleMode]);
    [v4 setObject:v37 forKeyedSubscript:@"shuffleMode"];
  }

  return (NSDictionary *)v4;
}

- (NSDictionary)debugDictionaryRepresentation
{
  id v3 = [(MRNowPlayingPlayerResponse *)self dictionaryRepresentation];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(MRNowPlayingPlayerResponse *)self playbackQueue];
  [v4 setObject:v5 forKeyedSubscript:@"playbackQueue"];

  int v6 = [(MRNowPlayingPlayerResponse *)self supportedCommands];
  [v4 setObject:v6 forKeyedSubscript:@"supportedCommands"];

  return (NSDictionary *)v4;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v5 = [(MRNowPlayingPlayerResponse *)self shortDictionaryRepresentation];
  int v6 = (void *)[v3 initWithFormat:@"<%@: %p> %@", v4, self, v5];

  return v6;
}

- (id)debugDescription
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v5 = [(MRNowPlayingPlayerResponse *)self debugDictionaryRepresentation];
  int v6 = (void *)[v3 initWithFormat:@"<%@: %p> %@", v4, self, v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  int v6 = [(MRNowPlayingPlayerResponse *)self destination];
  float v7 = (void *)[v6 copyWithZone:a3];
  [v5 setDestination:v7];

  v8 = [(MRNowPlayingPlayerResponse *)self supportedCommands];
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setSupportedCommands:v9];

  objc_msgSend(v5, "setPlaybackState:", -[MRNowPlayingPlayerResponse playbackState](self, "playbackState"));
  v10 = [(MRNowPlayingPlayerResponse *)self playbackQueue];
  v11 = (void *)[v10 copyWithZone:a3];
  [v5 setPlaybackQueue:v11];

  v12 = [(MRNowPlayingPlayerResponse *)self playerLastPlayingDate];
  v13 = (void *)[v12 copyWithZone:a3];
  [v5 setPlayerLastPlayingDate:v13];

  v14 = [(MRNowPlayingPlayerResponse *)self clientProperties];
  int v15 = (void *)[v14 copyWithZone:a3];
  [v5 setClientProperties:v15];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  playbackQueue = self->_playbackQueue;
  id v6 = a3;
  [v6 encodeObject:playbackQueue forKey:@"playbackQueue"];
  [v6 encodeObject:self->_destination forKey:@"destination"];
  [v6 encodeInt:self->_playbackState forKey:@"playbackState"];
  [v6 encodeObject:self->_playerLastPlayingDate forKey:@"playerLastPlayingDate"];
  v5 = +[MRCommandInfo dataFromCommandInfos:self->_supportedCommands];
  [v6 encodeObject:v5 forKey:@"supportedCommandsData"];

  [v6 encodeObject:self->_clientProperties forKey:@"clientProperties"];
}

- (MRNowPlayingPlayerResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MRNowPlayingPlayerResponse;
  v5 = [(MRNowPlayingPlayerResponse *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"playbackQueue"];
    playbackQueue = v5->_playbackQueue;
    v5->_playbackQueue = (MRPlaybackQueue *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"destination"];
    destination = v5->_destination;
    v5->_destination = (MRDestination *)v8;

    v5->_playbackState = [v4 decodeIntForKey:@"playbackState"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"playerLastPlayingDate"];
    playerLastPlayingDate = v5->_playerLastPlayingDate;
    v5->_playerLastPlayingDate = (NSDate *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"supportedCommandsData"];
    uint64_t v13 = +[MRCommandInfo commandInfosFromData:v12];
    supportedCommands = v5->_supportedCommands;
    v5->_supportedCommands = (NSArray *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientProperties"];
    clientProperties = v5->_clientProperties;
    v5->_clientProperties = (MRClient *)v15;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MRDestination)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (NSArray)supportedCommands
{
  return self->_supportedCommands;
}

- (void)setSupportedCommands:(id)a3
{
}

- (MRPlaybackQueue)playbackQueue
{
  return self->_playbackQueue;
}

- (void)setPlaybackQueue:(id)a3
{
}

- (unsigned)playbackState
{
  return self->_playbackState;
}

- (void)setPlaybackState:(unsigned int)a3
{
  self->_playbackState = a3;
}

- (MRClient)clientProperties
{
  return self->_clientProperties;
}

- (void)setClientProperties:(id)a3
{
}

- (void)setDeviceLastPlayingDate:(id)a3
{
}

- (void)setPlayerLastPlayingDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerLastPlayingDate, 0);
  objc_storeStrong((id *)&self->_deviceLastPlayingDate, 0);
  objc_storeStrong((id *)&self->_clientProperties, 0);
  objc_storeStrong((id *)&self->_playbackQueue, 0);
  objc_storeStrong((id *)&self->_supportedCommands, 0);

  objc_storeStrong((id *)&self->_destination, 0);
}

@end