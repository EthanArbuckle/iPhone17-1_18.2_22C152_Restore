@interface VUIPlaybackReporterSession
+ (id)transitionReasonForMediaControllerStartReason:(id)a3 autoStart:(id)a4;
+ (id)transitionReasonForMediaControllerStopReason:(id)a3 autoStop:(id)a4;
+ (id)transitionTypeForMediaControllerAutoTransition:(id)a3;
- (BOOL)reportingEnabled;
- (NSString)UUID;
- (TVPPlayback)player;
- (VUIPlaybackReporterSession)initWithPlayer:(id)a3 context:(id)a4;
- (id)consumeMetadataForKey:(id)a3;
- (id)consumeStartReason;
- (id)consumeStartType;
- (id)consumeStopReason;
- (id)consumeStopType;
- (id)context;
- (id)description;
- (id)metadataForKey:(id)a3;
- (void)setContext:(id)a3;
- (void)setMetadata:(id)a3 forKey:(id)a4;
- (void)setPlayer:(id)a3;
- (void)setReportingEnabled:(BOOL)a3;
@end

@implementation VUIPlaybackReporterSession

- (id)consumeStopType
{
  v2 = (void *)*MEMORY[0x1E4F71950];
  v3 = [(VUIPlaybackReporterSession *)self consumeMetadataForKey:@"VUIPlaybackReporterSessionMetadataKeyStopType"];
  v4 = v3;
  if (!v3) {
    v3 = v2;
  }
  id v5 = v3;

  return v5;
}

- (id)consumeStopReason
{
  v2 = (void *)*MEMORY[0x1E4F71928];
  v3 = [(VUIPlaybackReporterSession *)self consumeMetadataForKey:@"VUIPlaybackReporterSessionMetadataKeyStopReason"];
  v4 = v3;
  if (!v3) {
    v3 = v2;
  }
  id v5 = v3;

  return v5;
}

- (id)consumeStartType
{
  v2 = (void *)*MEMORY[0x1E4F71950];
  v3 = [(VUIPlaybackReporterSession *)self consumeMetadataForKey:@"VUIPlaybackReporterSessionMetadataKeyStartType"];
  v4 = v3;
  if (!v3) {
    v3 = v2;
  }
  id v5 = v3;

  return v5;
}

- (id)consumeStartReason
{
  v2 = (void *)*MEMORY[0x1E4F718D0];
  v3 = [(VUIPlaybackReporterSession *)self consumeMetadataForKey:@"VUIPlaybackReporterSessionMetadataKeyStartReason"];
  v4 = v3;
  if (!v3) {
    v3 = v2;
  }
  id v5 = v3;

  return v5;
}

+ (id)transitionTypeForMediaControllerAutoTransition:(id)a3
{
  id v3 = a3;
  id v4 = (id)*MEMORY[0x1E4F71950];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = [v3 BOOLValue];
    v6 = (id *)MEMORY[0x1E4F71940];
    if (!v5) {
      v6 = (id *)MEMORY[0x1E4F71948];
    }
    id v7 = *v6;

    id v4 = v7;
  }

  return v4;
}

+ (id)transitionReasonForMediaControllerStartReason:(id)a3 autoStart:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (id)*MEMORY[0x1E4F718D0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = 0;
    switch([v5 integerValue])
    {
      case 0:
        v8 = @"Unknown";
        break;
      case 1:
        id v9 = (id)*MEMORY[0x1E4F71898];

        v8 = @"BackgroundTrailer";
        goto LABEL_11;
      case 2:
        id v9 = (id)*MEMORY[0x1E4F718A8];

        v8 = @"UpNext";
        goto LABEL_11;
      case 3:
        id v9 = (id)*MEMORY[0x1E4F718A8];

        v8 = @"PostPlay";
        goto LABEL_11;
      case 4:
        id v9 = (id)*MEMORY[0x1E4F718A8];

        v8 = @"ProductPage";
        goto LABEL_11;
      case 8:
        id v9 = (id)*MEMORY[0x1E4F718A8];

        v8 = @"Multiview";
        goto LABEL_11;
      case 9:
        id v9 = (id)*MEMORY[0x1E4F718A0];

        v8 = @"CatchUpToLive";
        goto LABEL_11;
      case 10:
        id v9 = (id)*MEMORY[0x1E4F718B0];

        v8 = @"PlayOther";
LABEL_11:
        id v7 = v9;
        break;
      default:
        break;
    }
    v10 = VUIDefaultLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138413058;
      id v13 = v7;
      __int16 v14 = 2112;
      v15 = v8;
      __int16 v16 = 2112;
      id v17 = v5;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterSession (VPAF) -  Resolved start reason:[%@]. _reason:%@(%@) _autoStart:%@", (uint8_t *)&v12, 0x2Au);
    }
  }
  return v7;
}

+ (id)transitionReasonForMediaControllerStopReason:(id)a3 autoStop:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (id)*MEMORY[0x1E4F718D0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    switch([v5 integerValue])
    {
      case 0:
        v8 = @"Unknown";
        break;
      case 1:
        id v9 = (id)*MEMORY[0x1E4F71908];

        v8 = @"AnotherPlaybackStarted";
        goto LABEL_10;
      case 2:
        id v9 = (id)*MEMORY[0x1E4F718F8];

        v8 = @"PostPlayBinge";
        goto LABEL_10;
      case 3:
        id v9 = (id)*MEMORY[0x1E4F718E0];

        v8 = @"PostPlayNonBinge";
        goto LABEL_10;
      case 4:
        id v9 = (id)*MEMORY[0x1E4F718F0];

        v8 = @"TimedOutWhilePaused";
        goto LABEL_10;
      case 5:
        id v9 = (id)*MEMORY[0x1E4F718F8];

        v8 = @"CatchUpToLive";
LABEL_10:
        id v7 = v9;
        break;
      default:
        v8 = 0;
        break;
    }
    v10 = VUIDefaultLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138413058;
      id v13 = v7;
      __int16 v14 = 2112;
      v15 = v8;
      __int16 v16 = 2112;
      id v17 = v5;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterSession (VPAF) -  Resolved stop reason:[%@] _reason:%@(%@) _autoStop:%@", (uint8_t *)&v12, 0x2Au);
    }
  }
  return v7;
}

- (VUIPlaybackReporterSession)initWithPlayer:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 currentMediaItem];

  if (v8)
  {
    v18.receiver = self;
    v18.super_class = (Class)VUIPlaybackReporterSession;
    id v9 = [(VUIPlaybackReporterSession *)&v18 init];
    if (v9)
    {
      v10 = [MEMORY[0x1E4F29128] UUID];
      v11 = [v10 UUIDString];
      uint64_t v12 = [v11 substringToIndex:7];
      UUID = v9->_UUID;
      v9->_UUID = (NSString *)v12;

      objc_storeWeak((id *)&v9->_player, v6);
      objc_storeStrong(&v9->_context, a4);
      __int16 v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      metadata = v9->_metadata;
      v9->_metadata = v14;

      v9->_metadataLock._os_unfair_lock_opaque = 0;
    }
    self = v9;
    __int16 v16 = self;
  }
  else
  {
    __int16 v16 = 0;
  }

  return v16;
}

- (id)description
{
  id v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)VUIPlaybackReporterSession;
  id v4 = [(VUIPlaybackReporterSession *)&v9 description];
  id v5 = [(VUIPlaybackReporterSession *)self player];
  [(VUIPlaybackReporterSession *)self reportingEnabled];
  id v6 = VUIBoolLogString();
  id v7 = [v3 stringWithFormat:@"%@ %@ Enabled:%@", v4, v5, v6];

  return v7;
}

- (id)metadataForKey:(id)a3
{
  p_metadataLock = &self->_metadataLock;
  id v5 = a3;
  os_unfair_lock_lock(p_metadataLock);
  id v6 = [(NSMutableDictionary *)self->_metadata objectForKey:v5];

  os_unfair_lock_unlock(p_metadataLock);
  return v6;
}

- (void)setMetadata:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v6)
  {
    os_unfair_lock_lock(&self->_metadataLock);
    metadata = self->_metadata;
    if (v8) {
      [(NSMutableDictionary *)metadata setObject:v8 forKey:v6];
    }
    else {
      [(NSMutableDictionary *)metadata removeObjectForKey:v6];
    }
    os_unfair_lock_unlock(&self->_metadataLock);
  }
}

- (id)consumeMetadataForKey:(id)a3
{
  p_metadataLock = &self->_metadataLock;
  id v5 = a3;
  os_unfair_lock_lock(p_metadataLock);
  id v6 = [(NSMutableDictionary *)self->_metadata objectForKey:v5];
  [(NSMutableDictionary *)self->_metadata removeObjectForKey:v5];

  os_unfair_lock_unlock(p_metadataLock);
  return v6;
}

- (TVPPlayback)player
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_player);
  return (TVPPlayback *)WeakRetained;
}

- (void)setPlayer:(id)a3
{
}

- (NSString)UUID
{
  return self->_UUID;
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (BOOL)reportingEnabled
{
  return self->_reportingEnabled;
}

- (void)setReportingEnabled:(BOOL)a3
{
  self->_reportingEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_destroyWeak((id *)&self->_player);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end