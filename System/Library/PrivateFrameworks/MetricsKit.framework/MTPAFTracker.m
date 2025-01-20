@interface MTPAFTracker
- (MTPAFActivity)currentActivity;
- (NSArray)playlistBindings;
- (NSArray)videoTrackers;
- (void)forEachVideoTracker:(id)a3;
- (void)playStartedAtMilliseconds:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6;
- (void)playStartedAtSeconds:(double)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6;
- (void)playStartedWithPlaybackRate:(float)a3 atMilliseconds:(unint64_t)a4 type:(id)a5 reason:(id)a6 eventData:(id)a7;
- (void)playStartedWithPlaybackRate:(float)a3 atSeconds:(double)a4 type:(id)a5 reason:(id)a6 eventData:(id)a7;
- (void)playStoppedAtMilliseconds:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6;
- (void)playStoppedAtSeconds:(double)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6;
- (void)seekStartedAtMilliseconds:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6;
- (void)seekStartedAtSeconds:(double)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6;
- (void)seekStoppedAtMilliseconds:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6;
- (void)seekStoppedAtSeconds:(double)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6;
- (void)setCurrentActivity:(id)a3;
- (void)setPlaylistBindings:(id)a3;
- (void)setVideoTrackers:(id)a3;
- (void)startActivity:(int64_t)a3 playbackRate:(float)a4 atMilliseconds:(unint64_t)a5 triggerType:(id)a6 reason:(id)a7 eventData:(id)a8;
- (void)stopActivity:(int64_t)a3 atMilliseconds:(unint64_t)a4 triggerType:(id)a5 reason:(id)a6 eventData:(id)a7;
- (void)synchronizeAtMilliseconds:(unint64_t)a3;
- (void)synchronizeAtSeconds:(double)a3;
- (void)trackPlaylist:(id)a3 using:(id)a4;
- (void)updateEventData:(id)a3;
@end

@implementation MTPAFTracker

- (void)trackPlaylist:(id)a3 using:(id)a4
{
  v21[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 conformsToProtocol:&unk_26C974738])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x263EFF940] raise:@"NotSupported", @"%@ cannot be used to handle video events on a MTMediaPlaylist. Please use MTVPAFKit instead.", objc_opt_class() format];
    }
    id v8 = v7;
    v9 = [v8 trackerWithPlayList:v6];
    v10 = self;
    objc_sync_enter(v10);
    videoTrackers = v10->_videoTrackers;
    if (videoTrackers) {
      [(NSArray *)videoTrackers arrayByAddingObject:v9];
    }
    else {
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObject:v9];
    }
    v18 = v10->_videoTrackers;
    v10->_videoTrackers = (NSArray *)v12;

    objc_sync_exit(v10);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = objc_alloc_init(MTPAFPlaylistKitBinding);
      [(MTPAFPlaylistKitBinding *)v13 setPlaylist:v6];
      [(MTPAFPlaylistKitBinding *)v13 setPafKit:v7];
      v14 = self;
      objc_sync_enter(v14);
      playlistBindings = v14->_playlistBindings;
      if (playlistBindings)
      {
        uint64_t v16 = [(NSArray *)playlistBindings arrayByAddingObject:v13];
        v17 = v14->_playlistBindings;
        v14->_playlistBindings = (NSArray *)v16;
      }
      else
      {
        v21[0] = v13;
        uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
        v20 = v14->_playlistBindings;
        v14->_playlistBindings = (NSArray *)v19;
      }
      objc_sync_exit(v14);
    }
    else
    {
      [MEMORY[0x263EFF940] raise:@"NotSupported", @"Unsupported playlist type: %@.", objc_opt_class() format];
    }
  }
}

- (void)playStartedWithPlaybackRate:(float)a3 atSeconds:(double)a4 type:(id)a5 reason:(id)a6 eventData:(id)a7
{
}

- (void)playStartedWithPlaybackRate:(float)a3 atMilliseconds:(unint64_t)a4 type:(id)a5 reason:(id)a6 eventData:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __81__MTPAFTracker_playStartedWithPlaybackRate_atMilliseconds_type_reason_eventData___block_invoke;
  v19[3] = &unk_264310938;
  float v24 = a3;
  id v20 = v12;
  id v21 = v13;
  id v22 = v14;
  unint64_t v23 = a4;
  id v15 = v14;
  id v16 = v13;
  id v17 = v12;
  [(MTPAFTracker *)self forEachVideoTracker:v19];
  *(float *)&double v18 = a3;
  [(MTPAFTracker *)self startActivity:0 playbackRate:a4 atMilliseconds:v17 triggerType:v16 reason:v15 eventData:v18];
}

uint64_t __81__MTPAFTracker_playStartedWithPlaybackRate_atMilliseconds_type_reason_eventData___block_invoke(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 64);
  return [a2 playStartedWithPlaybackRate:*(void *)(a1 + 56) overallPosition:*(void *)(a1 + 32) type:*(void *)(a1 + 40) reason:*(void *)(a1 + 48) eventData:a3];
}

- (void)playStartedAtSeconds:(double)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
  double v9 = a3 * 1000.0;
  unint64_t v10 = (unint64_t)v9;
  LODWORD(v9) = 1.0;
  [(MTPAFTracker *)self playStartedWithPlaybackRate:v10 atMilliseconds:a4 type:a5 reason:a6 eventData:v9];
}

- (void)playStartedAtMilliseconds:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
  LODWORD(v6) = 1.0;
  [(MTPAFTracker *)self playStartedWithPlaybackRate:a3 atMilliseconds:a4 type:a5 reason:a6 eventData:v6];
}

- (void)playStoppedAtSeconds:(double)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
}

- (void)playStoppedAtMilliseconds:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  double v18 = __64__MTPAFTracker_playStoppedAtMilliseconds_type_reason_eventData___block_invoke;
  uint64_t v19 = &unk_264310960;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  unint64_t v23 = a3;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  [(MTPAFTracker *)self forEachVideoTracker:&v16];
  -[MTPAFTracker stopActivity:atMilliseconds:triggerType:reason:eventData:](self, "stopActivity:atMilliseconds:triggerType:reason:eventData:", 0, a3, v15, v14, v13, v16, v17, v18, v19);
}

uint64_t __64__MTPAFTracker_playStoppedAtMilliseconds_type_reason_eventData___block_invoke(void *a1, void *a2)
{
  return [a2 playStoppedAtOverallPosition:a1[7] type:a1[4] reason:a1[5] eventData:a1[6]];
}

- (void)seekStartedAtSeconds:(double)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
}

- (void)seekStartedAtMilliseconds:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __64__MTPAFTracker_seekStartedAtMilliseconds_type_reason_eventData___block_invoke;
  id v20 = &unk_264310960;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  unint64_t v24 = a3;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  [(MTPAFTracker *)self forEachVideoTracker:&v17];
  LODWORD(v16) = 1.0;
  -[MTPAFTracker startActivity:playbackRate:atMilliseconds:triggerType:reason:eventData:](self, "startActivity:playbackRate:atMilliseconds:triggerType:reason:eventData:", 1, a3, v15, v14, v13, v16, v17, v18, v19, v20);
}

uint64_t __64__MTPAFTracker_seekStartedAtMilliseconds_type_reason_eventData___block_invoke(void *a1, void *a2)
{
  return [a2 seekStartedAtOverallPosition:a1[7] type:a1[4] reason:a1[5] eventData:a1[6]];
}

- (void)seekStoppedAtSeconds:(double)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
}

- (void)seekStoppedAtMilliseconds:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __64__MTPAFTracker_seekStoppedAtMilliseconds_type_reason_eventData___block_invoke;
  uint64_t v19 = &unk_264310960;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  unint64_t v23 = a3;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  [(MTPAFTracker *)self forEachVideoTracker:&v16];
  -[MTPAFTracker stopActivity:atMilliseconds:triggerType:reason:eventData:](self, "stopActivity:atMilliseconds:triggerType:reason:eventData:", 1, a3, v15, v14, v13, v16, v17, v18, v19);
}

uint64_t __64__MTPAFTracker_seekStoppedAtMilliseconds_type_reason_eventData___block_invoke(void *a1, void *a2)
{
  return [a2 seekStoppedAtOverallPosition:a1[7] type:a1[4] reason:a1[5] eventData:a1[6]];
}

- (void)synchronizeAtSeconds:(double)a3
{
}

- (void)synchronizeAtMilliseconds:(unint64_t)a3
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__MTPAFTracker_synchronizeAtMilliseconds___block_invoke;
  v6[3] = &__block_descriptor_40_e32_v16__0__MTMediaActivityTracker_8l;
  v6[4] = a3;
  [(MTPAFTracker *)self forEachVideoTracker:v6];
  v5 = [(MTPAFTracker *)self currentActivity];
  [v5 synchronizeAtMilliseconds:a3];
}

uint64_t __42__MTPAFTracker_synchronizeAtMilliseconds___block_invoke(uint64_t a1, void *a2)
{
  return [a2 synchronizeAtOverallPosition:*(void *)(a1 + 32)];
}

- (void)updateEventData:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __32__MTPAFTracker_updateEventData___block_invoke;
  v16[3] = &unk_2643109A8;
  id v5 = v4;
  id v17 = v5;
  [(MTPAFTracker *)self forEachVideoTracker:v16];
  double v6 = self;
  objc_sync_enter(v6);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = [(MTPAFTracker *)v6 playlistBindings];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = [*(id *)(*((void *)&v12 + 1) + 8 * v10) playlist];
        [v11 updateEventData:v5];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v8);
  }

  objc_sync_exit(v6);
}

uint64_t __32__MTPAFTracker_updateEventData___block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateEventData:*(void *)(a1 + 32)];
}

- (void)forEachVideoTracker:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void))a3;
  id v5 = self;
  objc_sync_enter(v5);
  double v6 = [(MTPAFTracker *)v5 videoTrackers];
  objc_sync_exit(v5);

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)startActivity:(int64_t)a3 playbackRate:(float)a4 atMilliseconds:(unint64_t)a5 triggerType:(id)a6 reason:(id)a7 eventData:(id)a8
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v35 = a6;
  id v36 = a7;
  id v14 = a8;
  long long v15 = [(MTPAFTracker *)self currentActivity];

  if (v15) {
    id v22 = MTConfigurationError(110, @"MTPAFTracker inconsistent state: did you forget to call stopped?", v16, v17, v18, v19, v20, v21, (uint64_t)v35);
  }
  unint64_t v23 = [MTPAFActivity alloc];
  *(float *)&double v24 = a4;
  v25 = [(MTPAFActivity *)v23 initWithType:a3 playbackRate:a5 atMilliseconds:v35 triggerType:v36 reason:v14 eventData:v24];
  if (v25)
  {
    v26 = self;
    objc_sync_enter(v26);
    v27 = [(MTPAFTracker *)v26 playlistBindings];
    objc_sync_exit(v26);

    if (v27)
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v28 = v27;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v29)
      {
        uint64_t v30 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v38 != v30) {
              objc_enumerationMutation(v28);
            }
            v32 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            v33 = objc_msgSend(v32, "playlist", v35);
            v34 = [v32 pafKit];
            [(MTPAFActivity *)v25 addItemsFromPlaylist:v33 pafKit:v34];
          }
          uint64_t v29 = [v28 countByEnumeratingWithState:&v37 objects:v41 count:16];
        }
        while (v29);
      }
    }
    -[MTPAFTracker setCurrentActivity:](v26, "setCurrentActivity:", v25, v35);
  }
}

- (void)stopActivity:(int64_t)a3 atMilliseconds:(unint64_t)a4 triggerType:(id)a5 reason:(id)a6 eventData:(id)a7
{
  id v24 = a5;
  id v12 = a6;
  id v13 = a7;
  id v14 = [(MTPAFTracker *)self currentActivity];
  long long v15 = v14;
  if (v14)
  {
    if ([v14 activityType] == a3)
    {
      [v15 stoppedAtMilliseconds:a4 triggerType:v24 reason:v12 eventData:v13];
      [(MTPAFTracker *)self setCurrentActivity:0];
    }
    else
    {
      id v22 = MTConfigurationError(110, @"MTPAFTracker inconsistent state: did you forget to call started?", v16, v17, v18, v19, v20, v21, v23);
    }
  }
}

- (NSArray)videoTrackers
{
  return self->_videoTrackers;
}

- (void)setVideoTrackers:(id)a3
{
}

- (NSArray)playlistBindings
{
  return self->_playlistBindings;
}

- (void)setPlaylistBindings:(id)a3
{
}

- (MTPAFActivity)currentActivity
{
  return self->_currentActivity;
}

- (void)setCurrentActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentActivity, 0);
  objc_storeStrong((id *)&self->_playlistBindings, 0);

  objc_storeStrong((id *)&self->_videoTrackers, 0);
}

@end