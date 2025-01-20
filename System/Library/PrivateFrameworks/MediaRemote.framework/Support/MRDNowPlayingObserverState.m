@interface MRDNowPlayingObserverState
- (MRClient)clientProperties;
- (MRDNowPlayingObserverState)initWithPlayerPath:(id)a3;
- (MRNowPlayingState)state;
- (MRPlaybackQueue)playbackQueue;
- (MRPlayer)playerProperties;
- (MRPlayerPath)playerPath;
- (NSArray)contentItems;
- (NSArray)contentItemsArtwork;
- (NSArray)supportedCommands;
- (NSDate)playbackStateTimestamp;
- (NSNumber)playbackState;
- (id)_coealesceItems:(id)a3;
- (id)description;
- (unint64_t)playbackQueueCapabilities;
- (void)setClientProperties:(id)a3;
- (void)setContentItems:(id)a3;
- (void)setContentItemsArtwork:(id)a3;
- (void)setPlaybackQueue:(id)a3;
- (void)setPlaybackQueueCapabilities:(unint64_t)a3;
- (void)setPlaybackState:(id)a3;
- (void)setPlaybackStateTimestamp:(id)a3;
- (void)setPlayerProperties:(id)a3;
- (void)setSupportedCommands:(id)a3;
@end

@implementation MRDNowPlayingObserverState

- (MRDNowPlayingObserverState)initWithPlayerPath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRDNowPlayingObserverState;
  v6 = [(MRDNowPlayingObserverState *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_playerPath, a3);
  }

  return v7;
}

- (id)description
{
  id v3 = [objc_alloc((Class)NSMutableString) initWithFormat:@"<%@:%p {\n", objc_opt_class(), self];
  supportedCommands = self->_supportedCommands;
  if (supportedCommands) {
    objc_msgSend(v3, "appendFormat:", @"  supportedCommands = %lu\n", -[NSArray count](supportedCommands, "count"));
  }
  if (self->_playbackQueue)
  {
    id v5 = MRCreateIndentedDebugDescriptionFromObject();
    [v3 appendFormat:@" playbackQueue = %@\n", v5];
  }
  if (self->_playbackQueueCapabilities)
  {
    v6 = (void *)MRPlaybackQueueCapabilitiesCopyDescription();
    [v3 appendFormat:@" playbackQueueCapabilities = %@\n", v6];
  }
  if (self->_contentItems)
  {
    v7 = MRCreateIndentedDebugDescriptionFromArray();
    [v3 appendFormat:@"  contentItems = %@\n", v7];
  }
  if (self->_contentItemsArtwork)
  {
    v8 = MRCreateIndentedDebugDescriptionFromArray();
    [v3 appendFormat:@"  contentItemArtworks = %@\n", v8];
  }
  playbackState = self->_playbackState;
  if (playbackState)
  {
    [(NSNumber *)playbackState intValue];
    v10 = (void *)MRMediaRemoteCopyPlaybackStateDescription();
    [v3 appendFormat:@"  playbackState = %@\n", v10];
  }
  playbackStateTimestamp = self->_playbackStateTimestamp;
  if (playbackStateTimestamp)
  {
    [(NSDate *)self->_playbackStateTimestamp timeIntervalSinceNow];
    [v3 appendFormat:@"  playbackStateTimestamp = %@ (%lf seconds ago)\n", playbackStateTimestamp, v12];
  }
  if (self->_playerProperties)
  {
    v13 = MRCreateIndentedDebugDescriptionFromObject();
    [v3 appendFormat:@"    playerProperties = %@\n", v13];
  }
  [v3 appendFormat:@"}>"];

  return v3;
}

- (void)setPlaybackQueue:(id)a3
{
  id v4 = a3;
  v25 = self;
  id v5 = [(NSArray *)self->_contentItems mutableCopy];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v6 = [v4 contentItems];
  id v7 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v5 containsObject:v11])
        {
          uint64_t v12 = +[MRUserSettings currentSettings];
          unsigned int v13 = [v12 verboseNowPlayingStateObserver];

          if (v13)
          {
            v14 = _MRLogForCategory();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              playerPath = v25->_playerPath;
              *(_DWORD *)buf = 138412546;
              id v31 = v11;
              __int16 v32 = 2112;
              v33 = playerPath;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[MRDNowPlayingStateObserver] Removing item %@ item from contentItems because playbackQueue contains item for %@", buf, 0x16u);
            }
          }
          [v5 removeObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v8);
  }

  playbackQueue = v25->_playbackQueue;
  v17 = +[MRUserSettings currentSettings];
  unsigned int v18 = [v17 verboseNowPlayingStateObserver];

  if (playbackQueue)
  {
    if (v18)
    {
      v19 = _MRLogForCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = v25->_playerPath;
        *(_DWORD *)buf = 138412546;
        id v31 = v4;
        __int16 v32 = 2112;
        v33 = v20;
        v21 = "[MRDNowPlayingStateObserver] Updating playbackQueue %@for %@";
LABEL_21:
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v21, buf, 0x16u);
        goto LABEL_22;
      }
      goto LABEL_22;
    }
  }
  else if (v18)
  {
    v19 = _MRLogForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v25->_playerPath;
      *(_DWORD *)buf = 138412546;
      id v31 = v4;
      __int16 v32 = 2112;
      v33 = v22;
      v21 = "[MRDNowPlayingStateObserver] Setting playbackQueue %@ for %@";
      goto LABEL_21;
    }
LABEL_22:
  }
  v23 = (MRPlaybackQueue *)[v4 copy];
  v24 = v25->_playbackQueue;
  v25->_playbackQueue = v23;
}

- (void)setContentItems:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v56 objects:v66 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v57;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v57 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        playbackQueue = self->_playbackQueue;
        v11 = [v9 identifier];
        uint64_t v12 = [(MRPlaybackQueue *)playbackQueue contentItemForIdentifier:v11];

        if (v12)
        {
          unsigned int v13 = +[MRUserSettings currentSettings];
          unsigned int v14 = [v13 verboseNowPlayingStateObserver];

          if (v14)
          {
            v15 = _MRLogForCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              playerPath = self->_playerPath;
              *(_DWORD *)buf = 138412546;
              id v63 = v9;
              __int16 v64 = 2112;
              v65 = playerPath;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[MRDNowPlayingStateObserver] Merging item %@ into playbackQueue for %@", buf, 0x16u);
            }
          }
          [v12 mergeFrom:v9];
        }
        else
        {
          [v4 addObject:v9];
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v56 objects:v66 count:16];
    }
    while (v6);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v42 = [v4 copy];
  id v45 = [v42 countByEnumeratingWithState:&v52 objects:v61 count:16];
  if (v45)
  {
    uint64_t v44 = *(void *)v53;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v53 != v44) {
          objc_enumerationMutation(v42);
        }
        uint64_t v46 = v17;
        unsigned int v18 = *(void **)(*((void *)&v52 + 1) + 8 * v17);
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        v19 = self->_contentItems;
        id v20 = [(NSArray *)v19 countByEnumeratingWithState:&v48 objects:v60 count:16];
        if (v20)
        {
          id v21 = v20;
          uint64_t v22 = *(void *)v49;
          do
          {
            for (j = 0; j != v21; j = (char *)j + 1)
            {
              if (*(void *)v49 != v22) {
                objc_enumerationMutation(v19);
              }
              v24 = *(void **)(*((void *)&v48 + 1) + 8 * (void)j);
              v25 = [v18 identifier];
              long long v26 = [v24 identifier];
              unsigned int v27 = [v25 isEqual:v26];

              if (v27)
              {
                long long v28 = +[MRUserSettings currentSettings];
                unsigned int v29 = [v28 verboseNowPlayingStateObserver];

                if (v29)
                {
                  v30 = _MRLogForCategory();
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                  {
                    id v31 = self->_playerPath;
                    *(_DWORD *)buf = 138412546;
                    id v63 = v18;
                    __int16 v64 = 2112;
                    v65 = v31;
                    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[MRDNowPlayingStateObserver] Merging item %@ into contentItems for %@", buf, 0x16u);
                  }
                }
                [v24 mergeFrom:v18];
                [v4 removeObject:v18];
              }
            }
            id v21 = [(NSArray *)v19 countByEnumeratingWithState:&v48 objects:v60 count:16];
          }
          while (v21);
        }

        uint64_t v17 = v46 + 1;
      }
      while ((id)(v46 + 1) != v45);
      id v45 = [v42 countByEnumeratingWithState:&v52 objects:v61 count:16];
    }
    while (v45);
  }

  NSUInteger v32 = [(NSArray *)self->_contentItems count];
  v33 = +[MRUserSettings currentSettings];
  unsigned int v34 = [v33 verboseNowPlayingStateObserver];

  if (v32)
  {
    if (!v34) {
      goto LABEL_44;
    }
    v35 = _MRLogForCategory();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_43;
    }
    v36 = self->_playerPath;
    *(_DWORD *)buf = 138412546;
    id v63 = v4;
    __int16 v64 = 2112;
    v65 = v36;
    v37 = "[MRDNowPlayingStateObserver] Adding contentItems %@ for %@";
    goto LABEL_42;
  }
  if (!v34) {
    goto LABEL_44;
  }
  v35 = _MRLogForCategory();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    v38 = self->_playerPath;
    *(_DWORD *)buf = 138412546;
    id v63 = v4;
    __int16 v64 = 2112;
    v65 = v38;
    v37 = "[MRDNowPlayingStateObserver] Setting contentItems %@ for %@";
LABEL_42:
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, v37, buf, 0x16u);
  }
LABEL_43:

LABEL_44:
  contentItems = self->_contentItems;
  if (contentItems)
  {
    v40 = [(NSArray *)contentItems arrayByAddingObjectsFromArray:v4];
  }
  else
  {
    v40 = (NSArray *)v4;
  }
  v41 = self->_contentItems;
  self->_contentItems = v40;
}

- (void)setContentItemsArtwork:(id)a3
{
  id v4 = a3;
  contentItemsArtwork = self->_contentItemsArtwork;
  id v6 = +[MRUserSettings currentSettings];
  unsigned int v7 = [v6 verboseNowPlayingStateObserver];

  if (contentItemsArtwork)
  {
    if (v7)
    {
      id v8 = _MRLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        playerPath = self->_playerPath;
        int v16 = 138412546;
        id v17 = v4;
        __int16 v18 = 2112;
        v19 = playerPath;
        v10 = "[MRDNowPlayingStateObserver] Adding items %@ into contentItemArtworkUpdates for %@";
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v16, 0x16u);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if (v7)
  {
    id v8 = _MRLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->_playerPath;
      int v16 = 138412546;
      id v17 = v4;
      __int16 v18 = 2112;
      v19 = v11;
      v10 = "[MRDNowPlayingStateObserver] Setting items %@ into contentItemArtworkUpdates for %@";
      goto LABEL_8;
    }
LABEL_9:
  }
  id v12 = [objc_alloc((Class)NSSet) initWithArray:self->_contentItemsArtwork];
  unsigned int v13 = [v12 setByAddingObjectsFromArray:v4];
  unsigned int v14 = [v13 allObjects];
  v15 = self->_contentItemsArtwork;
  self->_contentItemsArtwork = v14;
}

- (void)setSupportedCommands:(id)a3
{
  id v4 = (NSArray *)a3;
  supportedCommands = self->_supportedCommands;
  id v6 = +[MRUserSettings currentSettings];
  unsigned int v7 = [v6 verboseNowPlayingStateObserver];

  if (supportedCommands)
  {
    if (v7)
    {
      id v8 = _MRLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        playerPath = self->_playerPath;
        int v13 = 138412546;
        unsigned int v14 = v4;
        __int16 v15 = 2112;
        int v16 = playerPath;
        v10 = "[MRDNowPlayingStateObserver] Updating supportedCommands %@ for %@";
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, 0x16u);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if (v7)
  {
    id v8 = _MRLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->_playerPath;
      int v13 = 138412546;
      unsigned int v14 = v4;
      __int16 v15 = 2112;
      int v16 = v11;
      v10 = "[MRDNowPlayingStateObserver] Setting supportedCommands %@ for %@";
      goto LABEL_8;
    }
LABEL_9:
  }
  id v12 = self->_supportedCommands;
  self->_supportedCommands = v4;
}

- (void)setPlayerProperties:(id)a3
{
  id v4 = (MRPlayer *)a3;
  playerProperties = self->_playerProperties;
  id v6 = +[MRUserSettings currentSettings];
  unsigned int v7 = [v6 verboseNowPlayingStateObserver];

  if (playerProperties)
  {
    if (v7)
    {
      id v8 = _MRLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        playerPath = self->_playerPath;
        int v13 = 138412546;
        unsigned int v14 = v4;
        __int16 v15 = 2112;
        int v16 = playerPath;
        v10 = "[MRDNowPlayingStateObserver] Updating playerProperties %@ for %@";
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, 0x16u);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if (v7)
  {
    id v8 = _MRLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->_playerPath;
      int v13 = 138412546;
      unsigned int v14 = v4;
      __int16 v15 = 2112;
      int v16 = v11;
      v10 = "[MRDNowPlayingStateObserver] Setting playerProperties %@ for %@";
      goto LABEL_8;
    }
LABEL_9:
  }
  id v12 = self->_playerProperties;
  self->_playerProperties = v4;
}

- (void)setPlaybackState:(id)a3
{
  id v4 = (NSNumber *)a3;
  playbackState = self->_playbackState;
  id v6 = +[MRUserSettings currentSettings];
  unsigned int v7 = [v6 verboseNowPlayingStateObserver];

  if (playbackState)
  {
    if (v7)
    {
      id v8 = _MRLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        [(NSNumber *)v4 intValue];
        uint64_t v9 = (void *)MRMediaRemoteCopyPlaybackStateDescription();
        playerPath = self->_playerPath;
        int v14 = 138412546;
        __int16 v15 = v9;
        __int16 v16 = 2112;
        id v17 = playerPath;
        v11 = "[MRDNowPlayingStateObserver] Updating playbackState %@ for %@";
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, 0x16u);

        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if (v7)
  {
    id v8 = _MRLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      [(NSNumber *)v4 intValue];
      uint64_t v9 = (void *)MRMediaRemoteCopyPlaybackStateDescription();
      id v12 = self->_playerPath;
      int v14 = 138412546;
      __int16 v15 = v9;
      __int16 v16 = 2112;
      id v17 = v12;
      v11 = "[MRDNowPlayingStateObserver] Setting playbackState %@ for %@";
      goto LABEL_8;
    }
LABEL_9:
  }
  int v13 = self->_playbackState;
  self->_playbackState = v4;
}

- (void)setPlaybackQueueCapabilities:(unint64_t)a3
{
  unint64_t playbackQueueCapabilities = self->_playbackQueueCapabilities;
  id v6 = +[MRUserSettings currentSettings];
  unsigned int v7 = [v6 verboseNowPlayingStateObserver];

  if (playbackQueueCapabilities)
  {
    if (v7)
    {
      id v8 = _MRLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = (void *)MRPlaybackQueueCapabilitiesCopyDescription();
        playerPath = self->_playerPath;
        int v13 = 138412546;
        int v14 = v9;
        __int16 v15 = 2112;
        __int16 v16 = playerPath;
        v11 = "[MRDNowPlayingStateObserver] Updating playbackState %@ for %@";
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v13, 0x16u);

        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if (v7)
  {
    id v8 = _MRLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = (void *)MRPlaybackQueueCapabilitiesCopyDescription();
      id v12 = self->_playerPath;
      int v13 = 138412546;
      int v14 = v9;
      __int16 v15 = 2112;
      __int16 v16 = v12;
      v11 = "[MRDNowPlayingStateObserver] Setting playbackState %@ for %@";
      goto LABEL_8;
    }
LABEL_9:
  }
  self->_unint64_t playbackQueueCapabilities = a3;
}

- (MRNowPlayingState)state
{
  if (self->_supportedCommands
    || self->_playbackQueue
    || self->_playbackQueueCapabilities
    || self->_playbackState
    || self->_playbackStateTimestamp)
  {
    id v3 = objc_alloc((Class)MRNowPlayingState);
    id v4 = [(MRDNowPlayingObserverState *)self playerPath];
    id v5 = [v3 initWithPlayerPath:v4];

    id v6 = [(MRDNowPlayingObserverState *)self supportedCommands];
    [v5 setSupportedCommands:v6];

    unsigned int v7 = [(MRDNowPlayingObserverState *)self playbackQueue];
    [v5 setPlaybackQueue:v7];

    objc_msgSend(v5, "setPlaybackQueueCapabilities:", -[MRDNowPlayingObserverState playbackQueueCapabilities](self, "playbackQueueCapabilities"));
    id v8 = [(MRDNowPlayingObserverState *)self playbackState];

    if (v8)
    {
      uint64_t v9 = [(MRDNowPlayingObserverState *)self playbackState];
      objc_msgSend(v5, "setPlaybackState:", objc_msgSend(v9, "intValue"));
    }
    v10 = [(MRDNowPlayingObserverState *)self playbackStateTimestamp];

    if (v10)
    {
      v11 = [(MRDNowPlayingObserverState *)self playbackStateTimestamp];
      [v11 timeIntervalSinceReferenceDate];
      objc_msgSend(v5, "setPlaybackStateTimestamp:");
    }
  }
  else
  {
    id v5 = 0;
  }

  return (MRNowPlayingState *)v5;
}

- (id)_coealesceItems:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableSet);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v3;
  id v19 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v27;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = v5;
        id v6 = *(void **)(*((void *)&v26 + 1) + 8 * v5);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v7 = obj;
        id v8 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v23;
          do
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(void *)v23 != v10) {
                objc_enumerationMutation(v7);
              }
              id v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
              if (v6 != v12)
              {
                int v13 = [v6 identifier];
                int v14 = [v12 identifier];
                unsigned int v15 = [v13 isEqualToString:v14];

                if (v15) {
                  [v6 mergeFrom:v12];
                }
              }
              objc_msgSend(v4, "addObject:", v6, v18);
            }
            id v9 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v9);
        }

        uint64_t v5 = v21 + 1;
      }
      while ((id)(v21 + 1) != v19);
      id v19 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v19);
  }

  __int16 v16 = [v4 allObjects];

  return v16;
}

- (NSArray)supportedCommands
{
  return self->_supportedCommands;
}

- (MRPlaybackQueue)playbackQueue
{
  return self->_playbackQueue;
}

- (unint64_t)playbackQueueCapabilities
{
  return self->_playbackQueueCapabilities;
}

- (NSArray)contentItems
{
  return self->_contentItems;
}

- (NSArray)contentItemsArtwork
{
  return self->_contentItemsArtwork;
}

- (NSNumber)playbackState
{
  return self->_playbackState;
}

- (NSDate)playbackStateTimestamp
{
  return self->_playbackStateTimestamp;
}

- (void)setPlaybackStateTimestamp:(id)a3
{
}

- (MRClient)clientProperties
{
  return self->_clientProperties;
}

- (void)setClientProperties:(id)a3
{
}

- (MRPlayer)playerProperties
{
  return self->_playerProperties;
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_playerProperties, 0);
  objc_storeStrong((id *)&self->_clientProperties, 0);
  objc_storeStrong((id *)&self->_playbackStateTimestamp, 0);
  objc_storeStrong((id *)&self->_playbackState, 0);
  objc_storeStrong((id *)&self->_contentItemsArtwork, 0);
  objc_storeStrong((id *)&self->_contentItems, 0);
  objc_storeStrong((id *)&self->_playbackQueue, 0);

  objc_storeStrong((id *)&self->_supportedCommands, 0);
}

@end