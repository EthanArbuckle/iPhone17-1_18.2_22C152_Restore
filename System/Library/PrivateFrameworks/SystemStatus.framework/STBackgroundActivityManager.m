@interface STBackgroundActivityManager
+ (id)sharedInstance;
- (NSSet)activeBackgroundActivities;
- (NSString)description;
- (STBackgroundActivityManager)initWithDefaults:(id)a3;
- (id)_allValidBackgroundActivitiesInPrecedenceScope:(unint64_t)a3;
- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)resolvedBackgroundActivityFromBackgroundActivities:(id)a3 inPrecedenceScope:(unint64_t)a4;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)validBackgroundActivitiesForBackgroundActivities:(id)a3;
- (id)visualDescriptorForBackgroundActivityWithIdentifier:(id)a3;
- (void)_forceResetBackgroundActivitiesForClients;
- (void)_registerForInternalDefaultsChanges;
- (void)_updateBackgroundActivitiesForClients;
- (void)_updateSupportedBackgroundActivitiesAndVisualDescriptorsFromBundleRecords;
- (void)addActiveBackgroundActivities:(id)a3;
- (void)addBackgroundActivityClient:(id)a3;
- (void)recordBundlesChangedForBundleManager:(id)a3;
- (void)removeActiveBackgroundActivities:(id)a3;
- (void)removeBackgroundActivityClient:(id)a3;
@end

@implementation STBackgroundActivityManager

- (id)resolvedBackgroundActivityFromBackgroundActivities:(id)a3 inPrecedenceScope:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(STBackgroundActivityManager *)self _allValidBackgroundActivitiesInPrecedenceScope:a4];
  v8 = (void *)[v7 mutableCopy];
  [v8 intersectSet:v6];
  if (self->_allowAllBackgroundActivities)
  {
    v9 = [MEMORY[0x1E4F1CA70] orderedSetWithSet:v6];
    v10 = [(STBackgroundActivityManager *)self _allValidBackgroundActivitiesInPrecedenceScope:999];
    [v9 minusOrderedSet:v10];

    if ([v9 count])
    {
      v11 = [v9 firstObject];

      goto LABEL_6;
    }
  }
  v11 = [v8 firstObject];
LABEL_6:

  return v11;
}

- (id)_allValidBackgroundActivitiesInPrecedenceScope:(unint64_t)a3
{
  if (qword_1EB5A3648 != -1) {
    dispatch_once(&qword_1EB5A3648, &__block_literal_global_23);
  }
  v4 = &qword_1EB5A3638;
  if (a3 != 1) {
    v4 = &qword_1EB5A3640;
  }
  v5 = (void *)*v4;

  return v5;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__STBackgroundActivityManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_19 != -1) {
    dispatch_once(&_MergedGlobals_19, block);
  }
  v2 = (void *)qword_1EB5A3628;

  return v2;
}

- (void)addBackgroundActivityClient:(id)a3
{
  subscribedClients = self->_subscribedClients;
  id v5 = a3;
  [(NSHashTable *)subscribedClients addObject:v5];
  id v6 = [(STBackgroundActivityManager *)self activeBackgroundActivities];
  [v5 activeBackgroundActivitiesDidUpdate:v6];
}

- (NSSet)activeBackgroundActivities
{
  v2 = (void *)[(NSMutableSet *)self->_activeBackgroundActivities copy];

  return (NSSet *)v2;
}

void __45__STBackgroundActivityManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  id v4 = +[STSystemStatusDefaults standardDefaults];
  uint64_t v2 = [v1 initWithDefaults:v4];
  v3 = (void *)qword_1EB5A3628;
  qword_1EB5A3628 = v2;
}

- (STBackgroundActivityManager)initWithDefaults:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)STBackgroundActivityManager;
  id v6 = [(STBackgroundActivityManager *)&v14 init];
  if (v6)
  {
    v7 = [[STBundleManager alloc] initWithBundleRecordClass:objc_opt_class()];
    bundleManager = v6->_bundleManager;
    v6->_bundleManager = v7;

    uint64_t v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    subscribedClients = v6->_subscribedClients;
    v6->_subscribedClients = (NSHashTable *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA80] set];
    activeBackgroundActivities = v6->_activeBackgroundActivities;
    v6->_activeBackgroundActivities = (NSMutableSet *)v11;

    objc_storeStrong((id *)&v6->_systemStatusDefaults, a3);
    [(STBackgroundActivityManager *)v6 _registerForInternalDefaultsChanges];
    [(STBundleManager *)v6->_bundleManager addObserver:v6];
    [(STBackgroundActivityManager *)v6 _updateSupportedBackgroundActivitiesAndVisualDescriptorsFromBundleRecords];
  }

  return v6;
}

- (void)addActiveBackgroundActivities:(id)a3
{
  [(NSMutableSet *)self->_activeBackgroundActivities unionSet:a3];

  [(STBackgroundActivityManager *)self _updateBackgroundActivitiesForClients];
}

- (void)removeActiveBackgroundActivities:(id)a3
{
  [(NSMutableSet *)self->_activeBackgroundActivities minusSet:a3];

  [(STBackgroundActivityManager *)self _updateBackgroundActivitiesForClients];
}

- (void)_updateBackgroundActivitiesForClients
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [(STBackgroundActivityManager *)self activeBackgroundActivities];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_subscribedClients;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "activeBackgroundActivitiesDidUpdate:", v3, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_forceResetBackgroundActivitiesForClients
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [(STBackgroundActivityManager *)self activeBackgroundActivities];
  id v4 = [MEMORY[0x1E4F1CAD0] set];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_subscribedClients;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_msgSend(v10, "activeBackgroundActivitiesDidUpdate:", v4, (void)v11);
        [v10 activeBackgroundActivitiesDidUpdate:v3];
      }
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)removeBackgroundActivityClient:(id)a3
{
}

void __78__STBackgroundActivityManager__allValidBackgroundActivitiesInPrecedenceScope___block_invoke()
{
  v9[31] = *MEMORY[0x1E4F143B8];
  v9[0] = @"com.apple.systemstatus.background-activity.SatelliteSOS";
  v9[1] = @"com.apple.systemstatus.background-activity.SatelliteSOSDisconnected";
  v9[2] = @"com.apple.systemstatus.background-activity.Sysdiagnose";
  v9[3] = @"com.apple.systemstatus.background-activity.ScreenReplayRecording";
  v9[4] = @"com.apple.systemstatus.background-activity.VideoConferenceRinging";
  v9[5] = @"com.apple.systemstatus.background-activity.CallRinging";
  v9[6] = @"com.apple.systemstatus.background-activity.InVideoConference";
  v9[7] = @"com.apple.systemstatus.background-activity.InCall";
  v9[8] = @"com.apple.systemstatus.background-activity.CallRecording";
  v9[9] = @"com.apple.systemstatus.background-activity.VideoConferenceHandoff";
  v9[10] = @"com.apple.systemstatus.background-activity.CallHandoff";
  v9[11] = @"com.apple.systemstatus.background-activity.CallScreening";
  v9[12] = @"com.apple.systemstatus.background-activity.ActivePushToTalkCall";
  v9[13] = @"com.apple.systemstatus.background-activity.DeveloperTools";
  v9[14] = @"com.apple.systemstatus.background-activity.AirPrint";
  v9[15] = @"com.apple.systemstatus.background-activity.Tethering";
  v9[16] = @"com.apple.systemstatus.background-activity.SharePlay";
  v9[17] = @"com.apple.systemstatus.background-activity.SharePlayScreenSharing";
  v9[18] = @"com.apple.systemstatus.background-activity.ScreenSharing";
  v9[19] = @"com.apple.systemstatus.background-activity.VideoOut";
  v9[20] = @"com.apple.systemstatus.background-activity.SharePlayInactive";
  v9[21] = @"com.apple.systemstatus.background-activity.CellularSOS";
  v9[22] = @"com.apple.systemstatus.background-activity.WebRTCCapture";
  v9[23] = @"com.apple.systemstatus.background-activity.WebRTCAudioCapture";
  v9[24] = @"com.apple.systemstatus.background-activity.FullScreenWebRTCCapture";
  v9[25] = @"com.apple.systemstatus.background-activity.FullScreenWebRTCAudioCapture";
  v9[26] = @"com.apple.systemstatus.background-activity.Recording";
  v9[27] = @"com.apple.systemstatus.background-activity.BackgroundLocation";
  v9[28] = @"com.apple.systemstatus.background-activity.NearbyInteractions";
  v9[29] = @"com.apple.systemstatus.background-activity.Playgrounds";
  v9[30] = @"com.apple.systemstatus.background-activity.IdlePushToTalkCall";
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:31];
  v8[0] = @"com.apple.systemstatus.background-activity.SatelliteSOS";
  v8[1] = @"com.apple.systemstatus.background-activity.SatelliteSOSDisconnected";
  v8[2] = @"com.apple.systemstatus.background-activity.Diagnostics";
  v8[3] = @"com.apple.systemstatus.background-activity.Sysdiagnose";
  v8[4] = @"com.apple.systemstatus.background-activity.ScreenSharingServer";
  v8[5] = @"com.apple.systemstatus.background-activity.ScreenReplayRecording";
  v8[6] = @"com.apple.systemstatus.background-activity.VideoConferenceRinging";
  v8[7] = @"com.apple.systemstatus.background-activity.CallRinging";
  v8[8] = @"com.apple.systemstatus.background-activity.continuitycapture.streaming-video";
  v8[9] = @"com.apple.systemstatus.background-activity.continuitycapture.streaming-audio";
  v8[10] = @"com.apple.systemstatus.background-activity.continuitycapture.streaming-none";
  v8[11] = @"com.apple.systemstatus.background-activity.InVideoConference";
  v8[12] = @"com.apple.systemstatus.background-activity.InCall";
  v8[13] = @"com.apple.systemstatus.background-activity.CallRecording";
  v8[14] = @"com.apple.systemstatus.background-activity.ActivePushToTalkCall";
  v8[15] = @"com.apple.systemstatus.background-activity.CallHandoff";
  v8[16] = @"com.apple.systemstatus.background-activity.VideoConferenceHandoff";
  v8[17] = @"com.apple.systemstatus.background-activity.CallScreening";
  v8[18] = @"com.apple.systemstatus.background-activity.Navigation";
  v8[19] = @"com.apple.systemstatus.background-activity.Navigation";
  v8[20] = @"com.apple.systemstatus.background-activity.CellularSOS";
  v8[21] = @"com.apple.systemstatus.background-activity.DeveloperTools";
  v8[22] = @"com.apple.systemstatus.background-activity.AirPrint";
  v8[23] = @"com.apple.systemstatus.background-activity.WebRTCCapture";
  v8[24] = @"com.apple.systemstatus.background-activity.WebRTCAudioCapture";
  v8[25] = @"com.apple.systemstatus.background-activity.FullScreenWebRTCCapture";
  v8[26] = @"com.apple.systemstatus.background-activity.FullScreenWebRTCAudioCapture";
  v8[27] = @"com.apple.systemstatus.background-activity.Recording";
  v8[28] = @"com.apple.systemstatus.background-activity.HearingAidRecording";
  v8[29] = @"com.apple.systemstatus.background-activity.LoggingCapture";
  v8[30] = @"com.apple.systemstatus.background-activity.Tethering";
  v8[31] = @"com.apple.systemstatus.background-activity.SharePlay";
  v8[32] = @"com.apple.systemstatus.background-activity.SharePlayScreenSharing";
  v8[33] = @"com.apple.systemstatus.background-activity.SharePlayInactive";
  v8[34] = @"com.apple.systemstatus.background-activity.ScreenSharing";
  v8[35] = @"com.apple.systemstatus.background-activity.VideoOut";
  v8[36] = @"com.apple.systemstatus.background-activity.CarPlay";
  v8[37] = @"com.apple.mediaremoted.background-activity.routed-audio-pulse";
  v8[38] = @"com.apple.mediaremoted.background-activity.routed-video";
  v8[39] = @"com.apple.mediaremoted.background-activity.routed-video-pulse";
  v8[40] = @"com.apple.mediaremoted.background-activity.routed-audio";
  v8[41] = @"com.apple.systemstatus.background-activity.AutoAirPlayReady";
  v8[42] = @"com.apple.systemstatus.background-activity.AutoAirPlayPlaying";
  v8[43] = @"com.apple.systemstatus.background-activity.AssistantEyesFree";
  v8[44] = @"com.apple.systemstatus.background-activity.InWorkout";
  v8[45] = @"com.apple.systemstatus.background-activity.BackgroundLocation";
  v8[46] = @"com.apple.systemstatus.background-activity.NearbyInteractions";
  v8[47] = @"com.apple.systemstatus.background-activity.Playgrounds";
  v8[48] = @"com.apple.systemstatus.background-activity.IdlePushToTalkCall";
  v8[49] = @"com.apple.activityprogress.backgroundui";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:50];
  uint64_t v1 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v7];
  uint64_t v2 = (void *)qword_1EB5A3638;
  qword_1EB5A3638 = v1;

  uint64_t v3 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v0];
  id v4 = (void *)qword_1EB5A3640;
  qword_1EB5A3640 = v3;

  uint64_t v5 = [(id)qword_1EB5A3640 copy];
  uint64_t v6 = (void *)qword_1EB5A3630;
  qword_1EB5A3630 = v5;
}

- (id)validBackgroundActivitiesForBackgroundActivities:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA80] setWithSet:v4];
  uint64_t v6 = [(STBackgroundActivityManager *)self _allValidBackgroundActivitiesInPrecedenceScope:999];
  uint64_t v7 = [v6 set];
  [v5 intersectSet:v7];

  if (self->_allowAllBackgroundActivities) {
    [v5 unionSet:v4];
  }

  return v5;
}

- (id)visualDescriptorForBackgroundActivityWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSDictionary *)self->_visualDescriptors objectForKeyedSubscript:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = +[STBackgroundActivityVisualDescriptor visualDescriptorForBackgroundActivityWithIdentifier:v4];
  }
  uint64_t v8 = v7;

  return v8;
}

- (void)_registerForInternalDefaultsChanges
{
  if (!self->_internalDefaultsObserver)
  {
    self->_allowAllBackgroundActivities = [(STSystemStatusDefaults *)self->_systemStatusDefaults shouldEnableUnknownBackgroundActivities];
    objc_initWeak(&location, self);
    systemStatusDefaults = self->_systemStatusDefaults;
    uint64_t v4 = MEMORY[0x1E4F14428];
    id v5 = MEMORY[0x1E4F14428];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __66__STBackgroundActivityManager__registerForInternalDefaultsChanges__block_invoke;
    v8[3] = &unk_1E6B630F8;
    objc_copyWeak(&v9, &location);
    uint64_t v6 = [(BSAbstractDefaultDomain *)systemStatusDefaults observeDefault:@"shouldEnableUnknownBackgroundActivities" onQueue:v4 withBlock:v8];
    internalDefaultsObserver = self->_internalDefaultsObserver;
    self->_internalDefaultsObserver = v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

uint64_t __66__STBackgroundActivityManager__registerForInternalDefaultsChanges__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    WeakRetained = (id *)MEMORY[0x1E0164160]("-[STBackgroundActivityManager _registerForInternalDefaultsChanges]_block_invoke");
    if (WeakRetained) {
      WeakRetained = (id *)[v4[5] shouldEnableUnknownBackgroundActivities];
    }
    uint64_t v2 = v4;
    if (*((unsigned __int8 *)v4 + 56) != WeakRetained)
    {
      *((unsigned char *)v4 + 56) = (_BYTE)WeakRetained;
      WeakRetained = (id *)[v4 _forceResetBackgroundActivitiesForClients];
      uint64_t v2 = v4;
    }
  }

  return MEMORY[0x1F41817F8](WeakRetained, v2);
}

- (void)recordBundlesChangedForBundleManager:(id)a3
{
  uint64_t v4 = (STBundleManager *)a3;
  objc_initWeak(&location, self);
  if (self->_bundleManager == v4)
  {
    objc_copyWeak(&v5, &location);
    BSDispatchMain();
    objc_destroyWeak(&v5);
  }
  objc_destroyWeak(&location);
}

void __68__STBackgroundActivityManager_recordBundlesChangedForBundleManager___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateSupportedBackgroundActivitiesAndVisualDescriptorsFromBundleRecords];
}

- (void)_updateSupportedBackgroundActivitiesAndVisualDescriptorsFromBundleRecords
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = [(STBundleManager *)self->_bundleManager recordIdentifiers];
  id v5 = STSystemStatusLogBundleLoading();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v36 = v4;
    _os_log_impl(&dword_1D9514000, v5, OS_LOG_TYPE_DEFAULT, "Bundle manager reports background activity bundle identifiers changed: %{public}@", buf, 0xCu);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v32;
    uint64_t v22 = *(void *)v32;
    v23 = self;
    do
    {
      uint64_t v9 = 0;
      uint64_t v24 = v7;
      do
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(obj);
        }
        long long v10 = *(void **)(*((void *)&v31 + 1) + 8 * v9);
        long long v11 = [(STBundleManager *)self->_bundleManager bundleRecordForRecordIdentifier:v10];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v26 = v9;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v12 = [v11 backgroundActivityIdentifiers];
          uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v39 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v28;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v28 != v15) {
                  objc_enumerationMutation(v12);
                }
                v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
                v18 = [v11 visualDescriptorForBackgroundActivityWithIdentifier:v17];
                if (v18)
                {
                  [(NSDictionary *)v3 setValue:v18 forKey:v17];
                  v19 = STSystemStatusLogBundleLoading();
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138543618;
                    v36 = v17;
                    __int16 v37 = 2114;
                    v38 = v18;
                    _os_log_debug_impl(&dword_1D9514000, v19, OS_LOG_TYPE_DEBUG, "Background activity identifier %{public}@ associated with visual descriptor %{public}@", buf, 0x16u);
                  }
                }
                else
                {
                  v19 = STSystemStatusLogBundleLoading();
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138477827;
                    v36 = v17;
                    _os_log_error_impl(&dword_1D9514000, v19, OS_LOG_TYPE_ERROR, "No valid visual descriptor for background activity '%{private}@'", buf, 0xCu);
                  }
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v39 count:16];
            }
            while (v14);
            uint64_t v8 = v22;
            self = v23;
            uint64_t v7 = v24;
          }
          uint64_t v9 = v26;
        }
        else
        {
          long long v12 = STSystemStatusLogBundleLoading();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138477827;
            v36 = v10;
            _os_log_error_impl(&dword_1D9514000, v12, OS_LOG_TYPE_ERROR, "Bundle %{private}@ is of unexpected type, expected 'BackgroundActivities'", buf, 0xCu);
          }
        }

        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v7);
  }

  char v20 = BSEqualObjects();
  visualDescriptors = self->_visualDescriptors;
  self->_visualDescriptors = v3;

  if ((v20 & 1) == 0) {
    [(STBackgroundActivityManager *)self _forceResetBackgroundActivitiesForClients];
  }
}

- (NSString)description
{
  return (NSString *)[(STBackgroundActivityManager *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  uint64_t v2 = [(STBackgroundActivityManager *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(STBackgroundActivityManager *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(STBackgroundActivityManager *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:1];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return [(STBackgroundActivityManager *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:0];
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(STBackgroundActivityManager *)self succinctDescriptionBuilder];
  [v7 setUseDebugDescription:v4];
  [v7 setActiveMultilinePrefix:v6];

  uint64_t v8 = [(NSMutableSet *)self->_activeBackgroundActivities allObjects];
  [v7 appendArraySection:v8 withName:@"activeBackgroundActivities" skipIfEmpty:0];

  [v7 appendDictionarySection:self->_visualDescriptors withName:@"registeredVisualDescriptors" skipIfEmpty:0];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalDefaultsObserver, 0);
  objc_storeStrong((id *)&self->_systemStatusDefaults, 0);
  objc_storeStrong((id *)&self->_activeBackgroundActivities, 0);
  objc_storeStrong((id *)&self->_subscribedClients, 0);
  objc_storeStrong((id *)&self->_visualDescriptors, 0);

  objc_storeStrong((id *)&self->_bundleManager, 0);
}

@end