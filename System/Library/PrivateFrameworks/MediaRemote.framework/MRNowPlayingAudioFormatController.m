@interface MRNowPlayingAudioFormatController
- (BOOL)hasNowPlayingApp;
- (BOOL)isEligibleForSpatialization;
- (BOOL)isMultichannel;
- (FBSDisplayLayoutMonitor)layoutMonitor;
- (MRClient)activeClient;
- (MRNowPlayingAudioFormatApplication)audioFormatApplication;
- (MRNowPlayingAudioFormatContentInfo)audioFormatContentInfo;
- (MRNowPlayingAudioFormatController)init;
- (MRNowPlayingAudioFormatControllerDelegate)delegate;
- (NSArray)contentInfos;
- (NSString)audioFormatDescription;
- (NSString)bestAvailableAudioFormatDescription;
- (NSString)bundleID;
- (NSString)displayName;
- (NSString)foregroundBundleID;
- (OS_dispatch_queue)queue;
- (id)contentInfoForBundleID:(id)a3 contentInfos:(id)a4;
- (id)description;
- (id)displayNameForBundleID:(id)a3;
- (id)faceTimeBundleSet;
- (id)firstContentInfoMatchingSet:(id)a3 contentInfos:(id)a4;
- (id)firstEligibleContentInfoFor:(id)a3;
- (int64_t)bestAvailableAudioFormat;
- (void)dealloc;
- (void)setActiveClient:(id)a3;
- (void)setContentInfos:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setForegroundBundleID:(id)a3;
- (void)setLayoutMonitor:(id)a3;
- (void)setQueue:(id)a3;
- (void)updateActiveClient;
- (void)updateAudioFormatContentInfo;
- (void)updateDeprecatedApplication;
- (void)updateDeprecatedContentInfo;
- (void)updateForegroundBundleID;
- (void)updateSelectedContentInfo;
@end

@implementation MRNowPlayingAudioFormatController

- (MRNowPlayingAudioFormatContentInfo)audioFormatContentInfo
{
  return self->_audioFormatContentInfo;
}

- (MRNowPlayingAudioFormatApplication)audioFormatApplication
{
  return self->_audioFormatApplication;
}

void __41__MRNowPlayingAudioFormatController_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateForegroundBundleID];
}

- (void)updateForegroundBundleID
{
  objc_initWeak(&location, self);
  v3 = [(FBSDisplayLayoutMonitor *)self->_layoutMonitor currentLayout];
  v4 = [v3 elements];

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__MRNowPlayingAudioFormatController_updateForegroundBundleID__block_invoke;
  block[3] = &unk_1E57D5428;
  id v8 = v4;
  id v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(queue, block);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

void __41__MRNowPlayingAudioFormatController_init__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__MRNowPlayingAudioFormatController_init__block_invoke_2;
  block[3] = &unk_1E57D12D0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __65__MRNowPlayingAudioFormatController_updateAudioFormatContentInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = _MRLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v10 = 138543874;
    uint64_t v11 = objc_opt_class();
    __int16 v12 = 2114;
    id v13 = v5;
    __int16 v14 = 2114;
    id v15 = v6;
    _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ audio format content changed: %{public}@ %{public}@", (uint8_t *)&v10, 0x20u);
  }
  id v9 = objc_loadWeakRetained((id *)(a1 + 32));
  [v9 setContentInfos:v5];
}

- (void)setContentInfos:(id)a3
{
  id v5 = a3;
  if (!-[NSArray isEqualToArray:](self->_contentInfos, "isEqualToArray:"))
  {
    objc_storeStrong((id *)&self->_contentInfos, a3);
    [(MRNowPlayingAudioFormatController *)self updateSelectedContentInfo];
  }
}

void __62__MRNowPlayingAudioFormatController_updateSelectedContentInfo__block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    if (objc_opt_respondsToSelector())
    {
      id v2 = *(void **)(a1 + 32);
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      [v2 nowPlayingAudioFormatController:WeakRetained didChangeAudioFormatApplication:*(void *)(a1 + 40)];
    }
    id v4 = objc_loadWeakRetained((id *)(a1 + 56));
    [v4 updateDeprecatedApplication];
  }
  if (*(unsigned char *)(a1 + 65))
  {
    if (objc_opt_respondsToSelector())
    {
      id v5 = *(void **)(a1 + 32);
      id v6 = objc_loadWeakRetained((id *)(a1 + 56));
      [v5 nowPlayingAudioFormatController:v6 didChangeAudioFormatContentInfo:*(void *)(*(void *)(a1 + 48) + 24)];
    }
    id v7 = objc_loadWeakRetained((id *)(a1 + 56));
    [v7 updateDeprecatedContentInfo];
  }
}

- (void)updateDeprecatedContentInfo
{
  id v4 = [(MRNowPlayingAudioFormatController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v3 = [(MRNowPlayingAudioFormatController *)self audioFormatDescription];
    [v4 nowPlayingAudioFormatController:self didChangeAudioFormatDescription:v3];
  }
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v4, "nowPlayingAudioFormatController:didChangeMultichannel:", self, -[MRNowPlayingAudioFormatController isMultichannel](self, "isMultichannel"));
  }
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v4, "nowPlayingAudioFormatController:didChangeBestAvailableAudioFormat:", self, -[MRNowPlayingAudioFormatController bestAvailableAudioFormat](self, "bestAvailableAudioFormat"));
  }
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v4, "nowPlayingAudioFormatController:didChangeIsEligibleForSpatialization:", self, -[MRNowPlayingAudioFormatController isEligibleForSpatialization](self, "isEligibleForSpatialization"));
  }
}

- (void)updateDeprecatedApplication
{
  id v5 = [(MRNowPlayingAudioFormatController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v3 = [(MRNowPlayingAudioFormatController *)self bundleID];
    id v4 = [(MRNowPlayingAudioFormatController *)self displayName];
    [v5 nowPlayingAudioFormatController:self didChangeBundleID:v3 displayName:v4];
  }
}

void __61__MRNowPlayingAudioFormatController_updateForegroundBundleID__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    char v5 = 0;
    id v6 = 0;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v2);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v9, "isUIApplicationElement", (void)v15)) {
          BOOL v10 = v6 == 0;
        }
        else {
          BOOL v10 = 0;
        }
        if (v10)
        {
          id v6 = [v9 bundleIdentifier];
        }
        uint64_t v11 = [v9 identifier];
        char v12 = [v11 isEqualToString:@"com.apple.pineboard.now-playing"];

        v5 |= v12;
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);

    if (v5) {
      id v13 = 0;
    }
    else {
      id v13 = v6;
    }
  }
  else
  {

    id v6 = 0;
    id v13 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setForegroundBundleID:v13];
}

- (void)setForegroundBundleID:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([(NSString *)self->_foregroundBundleID isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_foregroundBundleID, a3);
    id v6 = _MRLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543618;
      uint64_t v8 = objc_opt_class();
      __int16 v9 = 2114;
      id v10 = v5;
      _os_log_impl(&dword_194F3C000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ foreground bundle id changed: %{public}@", (uint8_t *)&v7, 0x16u);
    }

    [(MRNowPlayingAudioFormatController *)self updateSelectedContentInfo];
  }
}

- (void)updateSelectedContentInfo
{
  v63[2] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  contentInfos = self->_contentInfos;
  uint64_t v4 = (void *)MEMORY[0x1E4F29008];
  id v5 = NSStringFromSelector(sel_isEligibleForSpatialization);
  id v6 = [v4 sortDescriptorWithKey:v5 ascending:1];
  v63[0] = v6;
  int v7 = (void *)MEMORY[0x1E4F29008];
  uint64_t v8 = NSStringFromSelector(sel_channelCount);
  __int16 v9 = [v7 sortDescriptorWithKey:v8 ascending:1];
  v63[1] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:2];
  uint64_t v11 = [(NSArray *)contentInfos sortedArrayUsingDescriptors:v10];

  char v12 = self->_activeClient;
  id v13 = self->_foregroundBundleID;
  __int16 v14 = [(MRNowPlayingAudioFormatController *)self faceTimeBundleSet];
  LODWORD(v8) = [v14 containsObject:v13];

  if (!v8
    || ([(MRNowPlayingAudioFormatController *)self faceTimeBundleSet],
        long long v15 = objc_claimAutoreleasedReturnValue(),
        [(MRNowPlayingAudioFormatController *)self firstContentInfoMatchingSet:v15 contentInfos:v11], long long v16 = (MRNowPlayingAudioFormatContentInfo *)objc_claimAutoreleasedReturnValue(), v15, !v16))
  {
    long long v16 = [(MRNowPlayingAudioFormatController *)self contentInfoForBundleID:v13 contentInfos:v11];
    if (!v16)
    {
      long long v17 = [(MRClient *)v12 bundleIdentifier];
      long long v16 = [(MRNowPlayingAudioFormatController *)self contentInfoForBundleID:v17 contentInfos:v11];

      if (!v16)
      {
        long long v16 = [(MRNowPlayingAudioFormatController *)self firstEligibleContentInfoFor:v11];
        if (!v16)
        {
          long long v18 = [(MRNowPlayingAudioFormatController *)self faceTimeBundleSet];
          long long v16 = [(MRNowPlayingAudioFormatController *)self firstContentInfoMatchingSet:v18 contentInfos:v11];
        }
      }
    }
  }
  v19 = [(MRClient *)v12 bundleIdentifier];
  uint64_t v20 = [(MRNowPlayingAudioFormatContentInfo *)v16 bundleID];
  int v21 = [v19 isEqualToString:v20];

  if (v21)
  {
    v22 = [(MRClient *)v12 representedBundleID];
    v23 = v22;
    if (v22)
    {
      v24 = v22;
    }
    else
    {
      v24 = [(MRNowPlayingAudioFormatContentInfo *)v16 bundleID];
    }
    v25 = v24;

    uint64_t v28 = [(MRClient *)v12 displayName];
  }
  else
  {
    v25 = [(MRNowPlayingAudioFormatContentInfo *)v16 bundleID];
    v26 = [(MRNowPlayingAudioFormatController *)self faceTimeBundleSet];
    int v27 = [v26 containsObject:v25];

    if (v27)
    {

      v25 = @"com.apple.facetime";
      [(MRNowPlayingAudioFormatContentInfo *)v16 setBundleID:@"com.apple.facetime"];
    }
    uint64_t v28 = [(MRNowPlayingAudioFormatController *)self displayNameForBundleID:v25];
  }
  v29 = (void *)v28;
  v51 = (void *)v11;
  if (-[__CFString length](v25, "length") && [v29 length]) {
    v30 = [[MRNowPlayingAudioFormatApplication alloc] initWithBundleID:v25 displayName:v29];
  }
  else {
    v30 = 0;
  }
  v31 = self->_audioFormatApplication;
  audioFormatApplication = v30;
  BOOL v33 = v31 != v30;
  v50 = v12;
  if (v31 != v30)
  {
    v34 = v31;
    BOOL v35 = [(MRNowPlayingAudioFormatApplication *)v31 isEqual:v30];

    if (v35)
    {
      v36 = v13;
      BOOL v33 = 0;
      goto LABEL_26;
    }
    v37 = _MRLogForCategory(0);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v60 = objc_opt_class();
      __int16 v61 = 2114;
      v62 = v30;
      _os_log_impl(&dword_194F3C000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ updating audio format application: %{public}@", buf, 0x16u);
    }

    v38 = v30;
    audioFormatApplication = self->_audioFormatApplication;
    self->_audioFormatApplication = v38;
  }
  v36 = v13;

LABEL_26:
  v39 = self->_audioFormatContentInfo;
  audioFormatContentInfo = v16;
  BOOL v41 = v39 != v16;
  if (v39 == v16)
  {
LABEL_32:

    goto LABEL_33;
  }
  v42 = v39;
  BOOL v43 = [(MRNowPlayingAudioFormatContentInfo *)v39 isEqual:v16];

  if (!v43)
  {
    v44 = _MRLogForCategory(0);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v45 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v60 = v45;
      __int16 v61 = 2114;
      v62 = (MRNowPlayingAudioFormatApplication *)v16;
      _os_log_impl(&dword_194F3C000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@ updating audio format content info: %{public}@", buf, 0x16u);
    }

    v46 = v16;
    audioFormatContentInfo = self->_audioFormatContentInfo;
    self->_audioFormatContentInfo = v46;
    goto LABEL_32;
  }
  BOOL v41 = 0;
LABEL_33:
  v47 = [(MRNowPlayingAudioFormatController *)self delegate];
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__MRNowPlayingAudioFormatController_updateSelectedContentInfo__block_invoke;
  block[3] = &unk_1E57D5450;
  BOOL v57 = v33;
  id v53 = v47;
  id v48 = v47;
  objc_copyWeak(&v56, (id *)buf);
  BOOL v58 = v41;
  v54 = v30;
  v55 = self;
  v49 = v30;
  dispatch_sync(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v56);
  objc_destroyWeak((id *)buf);
}

- (id)faceTimeBundleSet
{
  if (faceTimeBundleSet_onceToken != -1) {
    dispatch_once(&faceTimeBundleSet_onceToken, &__block_literal_global_58);
  }
  id v2 = (void *)faceTimeBundleSet___set;

  return v2;
}

- (id)contentInfoForBundleID:(id)a3 contentInfos:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = v6;
  if (v5)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v6;
    id v9 = (id)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v8);
          }
          char v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v13 = objc_msgSend(v12, "bundleID", (void)v16);
          char v14 = [v13 isEqualToString:v5];

          if (v14)
          {
            id v9 = v12;
            goto LABEL_12;
          }
        }
        id v9 = (id)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (MRNowPlayingAudioFormatControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRNowPlayingAudioFormatControllerDelegate *)WeakRetained;
}

- (id)displayNameForBundleID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v10 = 0;
    id v5 = [MEMORY[0x1E4F223C8] bundleRecordWithApplicationIdentifier:v4 error:&v10];
    id v6 = v10;
    if (v6)
    {
      int v7 = _MRLogForCategory(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        [(MRNowPlayingAudioFormatController *)(uint64_t)self displayNameForBundleID:v7];
      }
    }
    id v8 = [v5 localizedName];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)firstContentInfoMatchingSet:(id)a3 contentInfos:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v6;
    id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          char v12 = objc_msgSend(v11, "bundleID", (void)v15);
          char v13 = [v5 containsObject:v12];

          if (v13)
          {
            id v8 = v11;
            goto LABEL_12;
          }
        }
        id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)firstEligibleContentInfoFor:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a3;
  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "isEligibleForSpatialization", (void)v9))
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)updateAudioFormatContentInfo
{
  objc_initWeak(&location, self);
  id v3 = (void *)MRGetSharedService();
  id v4 = +[MROrigin localOrigin];
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__MRNowPlayingAudioFormatController_updateAudioFormatContentInfo__block_invoke;
  v6[3] = &unk_1E57D4420;
  objc_copyWeak(&v7, &location);
  MRMediaRemoteServiceGetAudioFormatContentInfoForOrigin(v3, v4, queue, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (MRNowPlayingAudioFormatController)init
{
  v19.receiver = self;
  v19.super_class = (Class)MRNowPlayingAudioFormatController;
  id v2 = [(MRNowPlayingAudioFormatController *)&v19 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.mediaremote.MRNowPlayingAudioFormatController", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v2 selector:sel_contentInfoDidChange_ name:@"kMRMediaRemoteAudioFormatContentInfoDidChange" object:0];

    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v2 selector:sel_activeClientDidChange_ name:@"kMRMediaRemoteActivePlayerPathsDidChange" object:0];

    objc_initWeak(&location, v2);
    long long v9 = [(objc_class *)getFBSDisplayLayoutMonitorConfigurationClass() configurationForDefaultMainDisplayMonitor];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    long long v15 = __41__MRNowPlayingAudioFormatController_init__block_invoke;
    long long v16 = &unk_1E57D53D8;
    objc_copyWeak(&v17, &location);
    [v9 setTransitionHandler:&v13];
    uint64_t v10 = -[objc_class monitorWithConfiguration:](getFBSDisplayLayoutMonitorClass(), "monitorWithConfiguration:", v9, v13, v14, v15, v16);
    layoutMonitor = v2->_layoutMonitor;
    v2->_layoutMonitor = (FBSDisplayLayoutMonitor *)v10;

    [(MRNowPlayingAudioFormatController *)v2 updateActiveClient];
    [(MRNowPlayingAudioFormatController *)v2 updateAudioFormatContentInfo];
    [(MRNowPlayingAudioFormatController *)v2 updateForegroundBundleID];
    objc_destroyWeak(&v17);

    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  [(FBSDisplayLayoutMonitor *)self->_layoutMonitor invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MRNowPlayingAudioFormatController;
  [(MRNowPlayingAudioFormatController *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p | application: %@ | content info: %@>", objc_opt_class(), self, self->_audioFormatApplication, self->_audioFormatContentInfo];
}

- (void)setActiveClient:(id)a3
{
  id v5 = a3;
  if (!-[MRClient isEqual:](self->_activeClient, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_activeClient, a3);
    [(MRNowPlayingAudioFormatController *)self updateSelectedContentInfo];
  }
}

- (void)updateActiveClient
{
  objc_initWeak(&location, self);
  objc_super v3 = +[MROrigin localOrigin];
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__MRNowPlayingAudioFormatController_updateActiveClient__block_invoke;
  v5[3] = &unk_1E57D5400;
  objc_copyWeak(&v6, &location);
  MRMediaRemoteGetNowPlayingClientForOrigin((uint64_t)v3, queue, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __55__MRNowPlayingAudioFormatController_updateActiveClient__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = _MRLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v9 = 138543874;
    uint64_t v10 = objc_opt_class();
    __int16 v11 = 2114;
    id v12 = v5;
    __int16 v13 = 2114;
    uint64_t v14 = a3;
    _os_log_impl(&dword_194F3C000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ active client changed: %{public}@ %{public}@", (uint8_t *)&v9, 0x20u);
  }
  id v8 = objc_loadWeakRetained((id *)(a1 + 32));
  [v8 setActiveClient:v5];
}

uint64_t __54__MRNowPlayingAudioFormatController_faceTimeBundleSet__block_invoke()
{
  faceTimeBundleSet___set = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EE66F360];

  return MEMORY[0x1F41817F8]();
}

- (NSString)bundleID
{
  id v2 = [(MRNowPlayingAudioFormatApplication *)self->_audioFormatApplication bundleID];
  objc_super v3 = v2;
  if (!v2) {
    id v2 = &stru_1EE60E7D8;
  }
  id v4 = v2;

  return v4;
}

- (NSString)displayName
{
  id v2 = [(MRNowPlayingAudioFormatApplication *)self->_audioFormatApplication displayName];
  objc_super v3 = v2;
  if (!v2) {
    id v2 = &stru_1EE60E7D8;
  }
  id v4 = v2;

  return v4;
}

- (BOOL)hasNowPlayingApp
{
  return self->_audioFormatApplication != 0;
}

- (BOOL)isMultichannel
{
  return [(MRNowPlayingAudioFormatContentInfo *)self->_audioFormatContentInfo isMultichannel];
}

- (NSString)audioFormatDescription
{
  return [(MRNowPlayingAudioFormatContentInfo *)self->_audioFormatContentInfo audioFormatDescription];
}

- (NSString)bestAvailableAudioFormatDescription
{
  return [(MRNowPlayingAudioFormatContentInfo *)self->_audioFormatContentInfo bestAvailableAudioFormatDescription];
}

- (BOOL)isEligibleForSpatialization
{
  return [(MRNowPlayingAudioFormatContentInfo *)self->_audioFormatContentInfo isEligibleForSpatialization];
}

- (int64_t)bestAvailableAudioFormat
{
  return [(MRNowPlayingAudioFormatContentInfo *)self->_audioFormatContentInfo bestAvailableAudioFormat];
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)contentInfos
{
  return self->_contentInfos;
}

- (MRClient)activeClient
{
  return self->_activeClient;
}

- (FBSDisplayLayoutMonitor)layoutMonitor
{
  return self->_layoutMonitor;
}

- (void)setLayoutMonitor:(id)a3
{
}

- (NSString)foregroundBundleID
{
  return self->_foregroundBundleID;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_foregroundBundleID, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong((id *)&self->_activeClient, 0);
  objc_storeStrong((id *)&self->_contentInfos, 0);
  objc_storeStrong((id *)&self->_audioFormatContentInfo, 0);
  objc_storeStrong((id *)&self->_audioFormatApplication, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)displayNameForBundleID:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = 138543618;
  uint64_t v6 = objc_opt_class();
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_194F3C000, a3, OS_LOG_TYPE_ERROR, "%{public}@ error retreiving application record: %{public}@", (uint8_t *)&v5, 0x16u);
}

@end