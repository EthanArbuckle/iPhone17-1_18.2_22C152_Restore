@interface ICLinkLinkAVPlaybackCoordinatorMedium
- (AVPlayerPlaybackCoordinator)playbackCoordinator;
- (BOOL)isCoordinatorSuspended;
- (ICLinkLinkAVPlaybackCoordinatorMedium)initWithPlaybackCoordinator:(id)a3 liveLink:(id)a4;
- (id)localParticipantUUIDForPlaybackCoordinator:(id)a3;
- (void)_playbackCoordinatorDidIssueCommandToPlaybackObjectNotification:(id)a3;
- (void)clearCoordinationMediumDelegate;
- (void)handleNewParticipantStateDictionary:(id)a3;
- (void)handleNewTransportControlStateDictionary:(id)a3;
- (void)playbackCoordinator:(id)a3 broadcastLocalParticipantStateDictionary:(id)a4;
- (void)playbackCoordinator:(id)a3 broadcastTransportControlStateDictionary:(id)a4 forItemWithIdentifier:(id)a5;
- (void)playbackCoordinator:(id)a3 reloadTransportControlStateForItemWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)removeParticipant:(id)a3;
@end

@implementation ICLinkLinkAVPlaybackCoordinatorMedium

- (void).cxx_destruct
{
}

- (AVPlayerPlaybackCoordinator)playbackCoordinator
{
  return self->_playbackCoordinator;
}

- (void)playbackCoordinator:(id)a3 reloadTransportControlStateForItemWithIdentifier:(id)a4 completionHandler:(id)a5
{
}

- (void)playbackCoordinator:(id)a3 broadcastTransportControlStateDictionary:(id)a4 forItemWithIdentifier:(id)a5
{
}

- (void)playbackCoordinator:(id)a3 broadcastLocalParticipantStateDictionary:(id)a4
{
}

- (id)localParticipantUUIDForPlaybackCoordinator:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = [(ICLiveLinkPlaybackCoordinatorMedium *)self localParticipantUUID];
  v5 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218242;
    v8 = self;
    __int16 v9 = 2114;
    v10 = v4;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "MLLM %p: localParticipantUUIDForPlaybackCoordinator localParticipantUUID=%{public}@", (uint8_t *)&v7, 0x16u);
  }

  return v4;
}

- (void)clearCoordinationMediumDelegate
{
}

- (void)removeParticipant:(id)a3
{
}

- (void)handleNewTransportControlStateDictionary:(id)a3
{
}

- (void)handleNewParticipantStateDictionary:(id)a3
{
}

- (void)_playbackCoordinatorDidIssueCommandToPlaybackObjectNotification:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v4 = [a3 userInfo];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F15FC0]];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F15FB8]];
    if (([v6 isEqualToString:*MEMORY[0x1E4F15FE0]] & 1) != 0
      || [v6 isEqualToString:*MEMORY[0x1E4F15FE8]])
    {
      int v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F15FC8]];
      [v7 doubleValue];
      double v9 = v8;
      v10 = [ICLiveLinkPlaybackEvent alloc];
      if (v9 > 0.0) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = 2;
      }
      v12 = [(ICLiveLinkPlaybackEvent *)v10 initWithKind:v11];

      if (!v12) {
        goto LABEL_15;
      }
    }
    else
    {
      if (![v6 isEqualToString:*MEMORY[0x1E4F15FF0]]) {
        goto LABEL_15;
      }
      v12 = [[ICLiveLinkPlaybackEvent alloc] initWithKind:3];
      if (!v12) {
        goto LABEL_15;
      }
    }
    v13 = [(ICLiveLinkPlaybackCoordinatorMedium *)self liveLink];
    v14 = [v13 participantForParticipantUUID:v5];
    v15 = +[ICLiveLinkEvent eventWithPlaybackEvent:v12 participant:v14];

    v16 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v17 = 134218498;
      v18 = self;
      __int16 v19 = 2114;
      v20 = v15;
      __int16 v21 = 2114;
      v22 = v4;
      _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_INFO, "MLLM %p: _playbackCoordinatorDidIssueCommandToPlaybackObjectNotification [produced event] event=%{public}@ userInfo=%{public}@", (uint8_t *)&v17, 0x20u);
    }

    [v13 receivedEvent:v15];
  }
  else
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v17 = 134218242;
      v18 = self;
      __int16 v19 = 2114;
      v20 = v4;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_INFO, "MLLM %p: _playbackCoordinatorDidIssueCommandToPlaybackObjectNotification [ignoring local event] userInfo=%{public}@", (uint8_t *)&v17, 0x16u);
    }
  }
LABEL_15:
}

- (BOOL)isCoordinatorSuspended
{
  v2 = [(AVPlayerPlaybackCoordinator *)self->_playbackCoordinator suspensionReasons];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (ICLinkLinkAVPlaybackCoordinatorMedium)initWithPlaybackCoordinator:(id)a3 liveLink:(id)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICLinkLinkAVPlaybackCoordinatorMedium;
  double v8 = [(ICLiveLinkPlaybackCoordinatorMedium *)&v12 initWithLiveLink:a4];
  double v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_playbackCoordinator, a3);
    [(AVPlayerPlaybackCoordinator *)v9->_playbackCoordinator setCoordinationMediumDelegate:v9];
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v9 selector:sel__playbackCoordinatorDidIssueCommandToPlaybackObjectNotification_ name:*MEMORY[0x1E4F15FD0] object:v7];

    [(ICLiveLinkPlaybackCoordinatorMedium *)v9 synchronizePlaybackStateForReason:@"InitialSync"];
  }

  return v9;
}

@end