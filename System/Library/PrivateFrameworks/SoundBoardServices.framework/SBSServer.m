@interface SBSServer
+ (BOOL)_isInternalBuild;
+ (id)sharedInstance;
- (BOOL)_hasEntitlement:(id)a3;
- (BOOL)isMediaAlarm:(id)a3;
- (BOOL)isMediaAlarmInternal:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (SBSAirDropServiceImplementer)airdropServiceDelegate;
- (SBSDebugInfoImplementer)debugInfoDelegate;
- (SBSHomePodControlsImplementer)controlsDelegate;
- (SBSPowerMonitorImplementer)powerMonitorDelegate;
- (SBSProfilesImplementer)profilesDelegate;
- (SBSProximityHandoffUIImplementer)proximityHandoffUIDelegate;
- (SBSServer)init;
- (SBSStereoLeaderRoleImplementer)stereoLeaderDelegate;
- (SBSSysdiagnoseImplementer)sysdiagnoseDelegate;
- (SBSSystemImplementer)systemDelegate;
- (SBSVolumeEventMonitorImplementer)volumeEventMonitorDelegate;
- (id)_gatherXPCClientInfo:(id)a3;
- (id)_processNameForPID:(int)a3;
- (void)_findConnectionAndSetClientType:(unint64_t)a3;
- (void)airDropSysdiagnose:(id)a3 airDropID:(id)a4 completionHandler:(id)a5;
- (void)airDropSysdiagnoseInternal:(id)a3 airDropID:(id)a4 completionHandler:(id)a5;
- (void)cancelCurrentSysdiagnose:(id)a3;
- (void)cancelSysdiagnoseInternal:(id)a3;
- (void)clearHomeSWUpdate;
- (void)clearHomeSWUpdateInternal;
- (void)createSysdiagnose:(id)a3;
- (void)createSysdiagnoseInternal:(id)a3;
- (void)disassociateCurrentNetwork;
- (void)disassociateCurrentNetworkInternal;
- (void)disassociateNetworkWithName:(id)a3;
- (void)disassociateNetworkWithNameInternal:(id)a3;
- (void)fetchLatestEvents:(int64_t)a3 completionHandler:(id)a4;
- (void)getAllDebugInfo:(id)a3;
- (void)getAllDebugInfoInternal:(id)a3;
- (void)getAllSyncedAlarmsAndTimers:(id)a3;
- (void)getAllSyncedAlarmsAndTimersInternal:(id)a3;
- (void)getFeatureFlags:(id)a3;
- (void)getFeatureFlagsInternal:(id)a3;
- (void)getInstalledProfilesInternal:(id)a3;
- (void)getLEDInfo:(id)a3;
- (void)getLEDInfoInternal:(id)a3;
- (void)getPowerEstimateForInterval:(float)a3 reply:(id)a4;
- (void)getPowerEstimateForIntervalInternal:(float)a3 reply:(id)a4;
- (void)getSelectDebugInfo:(id)a3 reply:(id)a4;
- (void)getSelectDebugInfoInternal:(id)a3 reply:(id)a4;
- (void)getTuningInfo:(id)a3;
- (void)getTuningInfoInternal:(id)a3;
- (void)getUserDefaults:(id)a3;
- (void)getUserDefaultsInternal:(id)a3;
- (void)getVolume:(id)a3;
- (void)getVolumeInternal:(id)a3;
- (void)handleClientDisconnection:(id)a3;
- (void)handoffCancelInternalWithHandoffType:(unint64_t)a3;
- (void)handoffCompleteInternalWithHandoffType:(unint64_t)a3;
- (void)handoffSetDeviceAsStereoLeader:(BOOL)a3 withOptions:(id)a4;
- (void)handoffStartInternalWithHandoffType:(unint64_t)a3;
- (void)handoffStartWithArtworkColors:(id)a3 handoffType:(unint64_t)a4;
- (void)handoffStartWithArtworkColorsInternal:(id)a3 handoffType:(unint64_t)a4;
- (void)handoffStartWithHandoffType:(unint64_t)a3;
- (void)handoffUpdateIntensityInternal:(float)a3 handoffType:(unint64_t)a4;
- (void)identifyWithOptions:(id)a3;
- (void)identifyWithOptionsInternal:(id)a3;
- (void)injectSWUpdateToHome:(id)a3;
- (void)injectSWUpdateToHomeInternal:(id)a3;
- (void)installProfileDataInternal:(id)a3 completion:(id)a4;
- (void)intercomWithOptions:(id)a3;
- (void)intercomWithOptionsInternal:(id)a3;
- (void)isDeviceStereoFollower:(id)a3;
- (void)isDeviceStereoFollowerInternal:(id)a3;
- (void)obliterate:(id)a3;
- (void)obliterateInternal:(id)a3;
- (void)playTone:(unsigned int)a3;
- (void)playToneInternal:(unsigned int)a3;
- (void)proximityHandoffCancelled;
- (void)proximityHandoffCompleted;
- (void)proximityHandoffInactive;
- (void)proximityHandoffStarted;
- (void)proximityHandoffUpdating;
- (void)reboot:(id)a3;
- (void)rebootInternal:(id)a3;
- (void)removeProfileByIdentifierInternal:(id)a3 completion:(id)a4;
- (void)render:(id)a3;
- (void)renderInternal:(id)a3;
- (void)requestDeferredReboot;
- (void)requestDeferredRebootInternal;
- (void)resetAllUserDefaults;
- (void)resetAllUserDefaultsInternal;
- (void)resetUserDefault:(id)a3;
- (void)resetUserDefaultInternal:(id)a3;
- (void)sendButtonCommand:(id)a3;
- (void)sendButtonCommandInternal:(id)a3;
- (void)sendLEDCommand:(id)a3;
- (void)sendLEDCommandInternal:(id)a3;
- (void)setAirdropServiceDelegate:(id)a3;
- (void)setBootSpinner:(BOOL)a3;
- (void)setBootSpinnerInternal:(BOOL)a3;
- (void)setControlsDelegate:(id)a3;
- (void)setDebugInfoDelegate:(id)a3;
- (void)setDeviceAsStereoLeader:(BOOL)a3 withOptions:(id)a4;
- (void)setDeviceAsStereoLeaderInternal:(BOOL)a3 withOptions:(id)a4;
- (void)setFeatureFlags:(id)a3;
- (void)setFeatureFlagsInternal:(id)a3;
- (void)setHomeUpdateState:(int64_t)a3;
- (void)setHomeUpdateStateInternal:(int64_t)a3;
- (void)setLEDContents:(id)a3;
- (void)setLEDContentsInternal:(id)a3;
- (void)setPowerMonitorDelegate:(id)a3;
- (void)setProfilesDelegate:(id)a3;
- (void)setProximityHandoffUIDelegate:(id)a3;
- (void)setStereoLeaderDelegate:(id)a3;
- (void)setSysdiagnoseDelegate:(id)a3;
- (void)setSystemDelegate:(id)a3;
- (void)setTuningInfoOnBox:(id)a3 at:(id)a4 withValue:(float)a5;
- (void)setTuningInfoOnBoxInternal:(id)a3 at:(id)a4 withValue:(float)a5;
- (void)setTurnOffBrightnessFactor:(BOOL)a3;
- (void)setUserDefaults:(id)a3 withValue:(id)a4;
- (void)setUserDefaultsInternal:(id)a3 withValue:(id)a4;
- (void)setVolume:(float)a3;
- (void)setVolumeEventMonitorDelegate:(id)a3;
- (void)setVolumeInternal:(float)a3;
- (void)setWifiEnabled:(BOOL)a3;
- (void)setWifiEnabledInternal:(BOOL)a3;
- (void)siriSay:(id)a3;
- (void)siriSayInternal:(id)a3;
- (void)stopTone:(unsigned int)a3;
- (void)stopToneInternal:(unsigned int)a3;
- (void)suScanForSoftwareUpdate;
- (void)suScanForSoftwareUpdateInternal;
- (void)sysdiagnoseHasStarted:(BOOL)a3;
- (void)sysdiagnoseHasStartedInternal:(BOOL)a3;
- (void)triggerWiFiCoreCapture:(id)a3;
- (void)triggerWiFiCoreCaptureInternal:(id)a3;
@end

@implementation SBSServer

- (void)setVolumeInternal:(float)a3
{
  id v5 = [(SBSServer *)self debugInfoDelegate];
  *(float *)&double v4 = a3;
  [v5 setVolume:v4];
}

- (void)getVolumeInternal:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSServer *)self debugInfoDelegate];
  [v5 getVolume:v4];
}

- (void)installProfileDataInternal:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBSServer *)self profilesDelegate];
  [v8 installProfileData:v7 completion:v6];
}

- (void)removeProfileByIdentifierInternal:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBSServer *)self profilesDelegate];
  [v8 removeProfileByIdentifier:v7 completion:v6];
}

- (void)getInstalledProfilesInternal:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSServer *)self profilesDelegate];
  [v5 getInstalledProfiles:v4];
}

- (void)getPowerEstimateForIntervalInternal:(float)a3 reply:(id)a4
{
  id v6 = a4;
  id v8 = [(SBSServer *)self powerMonitorDelegate];
  *(float *)&double v7 = a3;
  [v8 getPowerEstimateForInterval:v6 reply:v7];
}

- (void)handoffCompleteInternalWithHandoffType:(unint64_t)a3
{
  id v4 = [(SBSServer *)self proximityHandoffUIDelegate];
  [v4 handoffCompleteWithHandoffType:a3];
}

- (void)handoffCancelInternalWithHandoffType:(unint64_t)a3
{
  id v4 = [(SBSServer *)self proximityHandoffUIDelegate];
  [v4 handoffCancelWithHandoffType:a3];
}

- (void)handoffUpdateIntensityInternal:(float)a3 handoffType:(unint64_t)a4
{
  id v7 = [(SBSServer *)self proximityHandoffUIDelegate];
  *(float *)&double v6 = a3;
  [v7 handoffUpdateIntensity:a4 handoffType:v6];
}

- (void)handoffStartWithArtworkColorsInternal:(id)a3 handoffType:(unint64_t)a4
{
  id v6 = a3;
  id v8 = [[SBSColorGroup alloc] initWithData:v6];

  id v7 = [(SBSServer *)self proximityHandoffUIDelegate];
  [v7 handoffStartWithArtworkColors:v8 handoffType:a4];
}

- (void)handoffStartInternalWithHandoffType:(unint64_t)a3
{
  id v4 = [(SBSServer *)self proximityHandoffUIDelegate];
  [v4 handoffStartWithHandoffType:a3];
}

- (void)intercomWithOptionsInternal:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSServer *)self systemDelegate];
  [v5 intercomWithOptions:v4];
}

- (void)identifyWithOptionsInternal:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSServer *)self systemDelegate];
  [v5 identifyWithOptions:v4];
}

- (void)obliterateInternal:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSServer *)self systemDelegate];
  [v5 obliterate:v4];
}

- (void)requestDeferredRebootInternal
{
  id v2 = [(SBSServer *)self systemDelegate];
  [v2 requestDeferredReboot];
}

- (void)rebootInternal:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSServer *)self systemDelegate];
  [v5 reboot:v4];
}

- (void)cancelSysdiagnoseInternal:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSServer *)self sysdiagnoseDelegate];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__SBSServer_Internal__cancelSysdiagnoseInternal___block_invoke;
  v7[3] = &unk_264BA4708;
  id v8 = v4;
  id v6 = v4;
  [v5 cancelCurrentSysdiagnose:v7];
}

uint64_t __49__SBSServer_Internal__cancelSysdiagnoseInternal___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)airDropSysdiagnoseInternal:(id)a3 airDropID:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(SBSServer *)self airdropServiceDelegate];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __78__SBSServer_Internal__airDropSysdiagnoseInternal_airDropID_completionHandler___block_invoke;
  v13[3] = &unk_264BA43F8;
  id v14 = v8;
  id v12 = v8;
  [v11 airDropSysdiagnose:v10 airDropID:v9 completionHandler:v13];
}

uint64_t __78__SBSServer_Internal__airDropSysdiagnoseInternal_airDropID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)createSysdiagnoseInternal:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSServer *)self sysdiagnoseDelegate];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__SBSServer_Internal__createSysdiagnoseInternal___block_invoke;
  v7[3] = &unk_264BA43D0;
  id v8 = v4;
  id v6 = v4;
  [v5 createSysdiagnose:v7];
}

uint64_t __49__SBSServer_Internal__createSysdiagnoseInternal___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sysdiagnoseHasStartedInternal:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBSServer *)self sysdiagnoseDelegate];
  [v4 sysdiagnoseHasStarted:v3];
}

- (void)isDeviceStereoFollowerInternal:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSServer *)self stereoLeaderDelegate];
  [v5 isDeviceStereoFollower:v4];
}

- (void)setDeviceAsStereoLeaderInternal:(BOOL)a3 withOptions:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(SBSServer *)self stereoLeaderDelegate];
  [v7 setDeviceAsStereoLeader:v4 withOptions:v6];
}

- (void)suScanForSoftwareUpdateInternal
{
  id v2 = [(SBSServer *)self debugInfoDelegate];
  [v2 suScanForSoftwareUpdate];
}

- (void)siriSayInternal:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSServer *)self debugInfoDelegate];
  [v5 siriSay:v4];
}

- (void)renderInternal:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSServer *)self debugInfoDelegate];
  [v5 render:v4];
}

- (void)setLEDContentsInternal:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSServer *)self debugInfoDelegate];
  [v5 setLEDContents:v4];
}

- (void)setFeatureFlagsInternal:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSServer *)self debugInfoDelegate];
  [v5 setFeatureFlags:v4];
}

- (void)getFeatureFlagsInternal:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(SBSServer *)self debugInfoDelegate];
    [v5 getFeatureFlags:v4];
  }
}

- (void)disassociateNetworkWithNameInternal:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSServer *)self debugInfoDelegate];
  [v5 disassociateNetworkWithName:v4];
}

- (void)disassociateCurrentNetworkInternal
{
  id v2 = [(SBSServer *)self debugInfoDelegate];
  [v2 disassociateCurrentNetwork];
}

- (void)setWifiEnabledInternal:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBSServer *)self debugInfoDelegate];
  [v4 setWifiEnabled:v3];
}

- (void)setBootSpinnerInternal:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBSServer *)self debugInfoDelegate];
  [v4 setBootSpinner:v3];
}

- (void)clearHomeSWUpdateInternal
{
  id v2 = [(SBSServer *)self debugInfoDelegate];
  [v2 clearHomeSWUpdate];
}

- (void)setHomeUpdateStateInternal:(int64_t)a3
{
  id v4 = [(SBSServer *)self debugInfoDelegate];
  [v4 setHomeUpdateState:a3];
}

- (void)injectSWUpdateToHomeInternal:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSServer *)self debugInfoDelegate];
  [v5 injectSWUpdateToHome:v4];
}

- (void)sendButtonCommandInternal:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSServer *)self debugInfoDelegate];
  [v5 sendButtonCommand:v4];
}

- (void)triggerWiFiCoreCaptureInternal:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSServer *)self debugInfoDelegate];
  [v5 triggerWiFiCoreCapture:v4];
}

- (void)sendLEDCommandInternal:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSServer *)self debugInfoDelegate];
  [v5 sendLEDCommand:v4];
}

- (void)resetUserDefaultInternal:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSServer *)self debugInfoDelegate];
  [v5 resetUserDefault:v4];
}

- (void)resetAllUserDefaultsInternal
{
  id v2 = [(SBSServer *)self debugInfoDelegate];
  [v2 resetAllUserDefaults];
}

- (void)setUserDefaultsInternal:(id)a3 withValue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBSServer *)self debugInfoDelegate];
  [v8 setUserDefaults:v7 withValue:v6];
}

- (void)getUserDefaultsInternal:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(SBSServer *)self debugInfoDelegate];
    [v5 getUserDefaults:v4];
  }
}

- (void)stopToneInternal:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(SBSServer *)self debugInfoDelegate];
  [v4 stopTone:v3];
}

- (void)playToneInternal:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(SBSServer *)self debugInfoDelegate];
  [v4 playTone:v3];
}

- (void)setTuningInfoOnBoxInternal:(id)a3 at:(id)a4 withValue:(float)a5
{
  id v8 = a4;
  id v9 = a3;
  id v11 = [(SBSServer *)self debugInfoDelegate];
  *(float *)&double v10 = a5;
  [v11 setTuningInfoOnBox:v9 at:v8 withValue:v10];
}

- (void)getTuningInfoInternal:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(SBSServer *)self debugInfoDelegate];
    [v5 getTuningInfo:v4];
  }
}

- (BOOL)isMediaAlarmInternal:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBSServer *)self controlsDelegate];
  if (v5
    && (id v6 = (void *)v5,
        [(SBSServer *)self controlsDelegate],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    id v9 = [(SBSServer *)self controlsDelegate];
    char v10 = [v9 isMediaAlarm:v4];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void)getAllSyncedAlarmsAndTimersInternal:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(SBSServer *)self controlsDelegate];
    [v5 getAllSyncedAlarmsAndTimers:v4];
  }
}

- (void)getLEDInfoInternal:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(SBSServer *)self debugInfoDelegate];
    [v5 getLEDInfo:v4];
  }
}

- (void)getSelectDebugInfoInternal:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBSServer *)self debugInfoDelegate];
  [v8 getSelectDebugInfo:v7 reply:v6];
}

- (void)getAllDebugInfoInternal:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(SBSServer *)self debugInfoDelegate];
    [v5 getAllDebugInfo:v4];
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_proximityHandoffUIDelegate);
  objc_destroyWeak((id *)&self->_volumeEventMonitorDelegate);
  objc_destroyWeak((id *)&self->_profilesDelegate);
  objc_destroyWeak((id *)&self->_powerMonitorDelegate);
  objc_destroyWeak((id *)&self->_controlsDelegate);
  objc_destroyWeak((id *)&self->_airdropServiceDelegate);
  objc_destroyWeak((id *)&self->_sysdiagnoseDelegate);
  objc_destroyWeak((id *)&self->_systemDelegate);
  objc_destroyWeak((id *)&self->_debugInfoDelegate);
  objc_destroyWeak((id *)&self->_stereoLeaderDelegate);
  objc_storeStrong((id *)&self->_receiver, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_serverListener, 0);
}

- (void)setProximityHandoffUIDelegate:(id)a3
{
}

- (SBSProximityHandoffUIImplementer)proximityHandoffUIDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proximityHandoffUIDelegate);
  return (SBSProximityHandoffUIImplementer *)WeakRetained;
}

- (void)setVolumeEventMonitorDelegate:(id)a3
{
}

- (SBSVolumeEventMonitorImplementer)volumeEventMonitorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_volumeEventMonitorDelegate);
  return (SBSVolumeEventMonitorImplementer *)WeakRetained;
}

- (void)setProfilesDelegate:(id)a3
{
}

- (SBSProfilesImplementer)profilesDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profilesDelegate);
  return (SBSProfilesImplementer *)WeakRetained;
}

- (void)setPowerMonitorDelegate:(id)a3
{
}

- (SBSPowerMonitorImplementer)powerMonitorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_powerMonitorDelegate);
  return (SBSPowerMonitorImplementer *)WeakRetained;
}

- (void)setControlsDelegate:(id)a3
{
}

- (SBSHomePodControlsImplementer)controlsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controlsDelegate);
  return (SBSHomePodControlsImplementer *)WeakRetained;
}

- (void)setAirdropServiceDelegate:(id)a3
{
}

- (SBSAirDropServiceImplementer)airdropServiceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_airdropServiceDelegate);
  return (SBSAirDropServiceImplementer *)WeakRetained;
}

- (void)setSysdiagnoseDelegate:(id)a3
{
}

- (SBSSysdiagnoseImplementer)sysdiagnoseDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sysdiagnoseDelegate);
  return (SBSSysdiagnoseImplementer *)WeakRetained;
}

- (void)setSystemDelegate:(id)a3
{
}

- (SBSSystemImplementer)systemDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemDelegate);
  return (SBSSystemImplementer *)WeakRetained;
}

- (void)setDebugInfoDelegate:(id)a3
{
}

- (SBSDebugInfoImplementer)debugInfoDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_debugInfoDelegate);
  return (SBSDebugInfoImplementer *)WeakRetained;
}

- (void)setStereoLeaderDelegate:(id)a3
{
}

- (SBSStereoLeaderRoleImplementer)stereoLeaderDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stereoLeaderDelegate);
  return (SBSStereoLeaderRoleImplementer *)WeakRetained;
}

- (id)_gatherXPCClientInfo:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F08D68] currentConnection];
  uint64_t v6 = [v5 processIdentifier];
  id v7 = [(SBSServer *)self _processNameForPID:v6];
  if (v4)
  {
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v4];
  }
  else
  {
    uint64_t v8 = objc_opt_new();
  }
  id v9 = (void *)v8;
  char v10 = [NSNumber numberWithInt:v6];
  [v9 setObject:v10 forKey:@"pid"];

  [v9 setObject:v7 forKey:@"process-name"];
  id v11 = (void *)[v9 copy];

  return v11;
}

- (id)_processNameForPID:(int)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  memset(v9, 0, 512);
  size_t v5 = 648;
  *(void *)uint64_t v6 = 0xE00000001;
  int v7 = 1;
  int v8 = a3;
  if (sysctl(v6, 4u, v9, &v5, 0, 0) < 0)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [NSString stringWithUTF8String:(char *)&v9[15] + 3];
  }
  return v3;
}

- (BOOL)_hasEntitlement:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F08D68];
  id v4 = a3;
  size_t v5 = [v3 currentConnection];
  uint64_t v6 = [v5 valueForEntitlement:v4];

  LOBYTE(v4) = [MEMORY[0x263EFFA88] isEqual:v6];
  return (char)v4;
}

- (void)_findConnectionAndSetClientType:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  size_t v5 = [MEMORY[0x263F08D68] currentConnection];
  uint64_t v6 = self->_clients;
  objc_sync_enter(v6);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v7 = self->_clients;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "connection", (void)v14);
        BOOL v13 = v12 == v5;

        if (v13) {
          [v11 setClientType:a3];
        }
      }
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  objc_sync_exit(v6);
}

- (void)getPowerEstimateForInterval:(float)a3 reply:(id)a4
{
  id v6 = a4;
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.soundboard.system"])
  {
    *(float *)&double v7 = a3;
    [(SBSServer *)self getPowerEstimateForIntervalInternal:v6 reply:v7];
  }
  else
  {
    uint64_t v8 = _SBSLoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_error_impl(&dword_230B2C000, v8, OS_LOG_TYPE_ERROR, "Missing required entitlement for identify", v9, 2u);
    }
  }
}

- (void)proximityHandoffUpdating
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = self->_clients;
  objc_sync_enter(v3);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_clients;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "clientType", (void)v11) == 5)
        {
          uint64_t v9 = [v8 connection];
          uint64_t v10 = [v9 remoteObjectProxy];
          [v10 handoffUpdating];

          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v3);
}

- (void)proximityHandoffStarted
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = self->_clients;
  objc_sync_enter(v3);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_clients;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "clientType", (void)v11) == 5)
        {
          uint64_t v9 = [v8 connection];
          uint64_t v10 = [v9 remoteObjectProxy];
          [v10 handoffStarted];

          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v3);
}

- (void)proximityHandoffInactive
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = self->_clients;
  objc_sync_enter(v3);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_clients;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "clientType", (void)v11) == 5)
        {
          uint64_t v9 = [v8 connection];
          uint64_t v10 = [v9 remoteObjectProxy];
          [v10 handoffInactive];

          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v3);
}

- (void)proximityHandoffCompleted
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = self->_clients;
  objc_sync_enter(v3);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_clients;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "clientType", (void)v11) == 5)
        {
          uint64_t v9 = [v8 connection];
          uint64_t v10 = [v9 remoteObjectProxy];
          [v10 handoffCompleted];

          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v3);
}

- (void)proximityHandoffCancelled
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = self->_clients;
  objc_sync_enter(v3);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_clients;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "clientType", (void)v11) == 5)
        {
          uint64_t v9 = [v8 connection];
          uint64_t v10 = [v9 remoteObjectProxy];
          [v10 handoffCancelled];

          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v3);
}

- (void)handoffSetDeviceAsStereoLeader:(BOOL)a3 withOptions:(id)a4
{
  BOOL v4 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a4;
  double v7 = [(SBSServer *)self _gatherXPCClientInfo:v6];
  uint64_t v8 = _SBSLoggingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [NSNumber numberWithBool:v4];
    int v10 = 138412546;
    long long v11 = v9;
    __int16 v12 = 2112;
    long long v13 = v7;
    _os_log_impl(&dword_230B2C000, v8, OS_LOG_TYPE_DEFAULT, "handoffSetDeviceAsStereoLeader = [%@] options received from external process info - %@", (uint8_t *)&v10, 0x16u);
  }
  [(SBSServer *)self setDeviceAsStereoLeaderInternal:v4 withOptions:v6];
}

- (void)handoffStartWithArtworkColors:(id)a3 handoffType:(unint64_t)a4
{
  id v6 = a3;
  [(SBSServer *)self _findConnectionAndSetClientType:5];
  id v7 = [v6 data];

  [(SBSServer *)self handoffStartWithArtworkColorsInternal:v7 handoffType:a4];
}

- (void)handoffStartWithHandoffType:(unint64_t)a3
{
  [(SBSServer *)self _findConnectionAndSetClientType:5];
  [(SBSServer *)self handoffStartInternalWithHandoffType:a3];
}

- (void)fetchLatestEvents:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.debuginfo.soundboard"])
  {
    id v7 = [(SBSServer *)self volumeEventMonitorDelegate];
    [v7 fetchLatestEvents:a3 completionHandler:v6];
  }
  else
  {
    uint64_t v8 = _SBSLoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      int v10 = "-[SBSServer fetchLatestEvents:completionHandler:]";
      _os_log_error_impl(&dword_230B2C000, v8, OS_LOG_TYPE_ERROR, "Trying to call %s without entitlement", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)render:(id)a3
{
  id v4 = a3;
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.debuginfo.soundboard"])
  {
    [(SBSServer *)self renderInternal:v4];
  }
  else
  {
    uint64_t v5 = _SBSLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_230B2C000, v5, OS_LOG_TYPE_ERROR, "Trying to call render without entitlement", v6, 2u);
    }
  }
}

- (void)setTurnOffBrightnessFactor:(BOOL)a3
{
  uint64_t v3 = _SBSLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v4 = 0;
    _os_log_error_impl(&dword_230B2C000, v3, OS_LOG_TYPE_ERROR, "setTurnOffBrightnessFactor not supported.", v4, 2u);
  }
}

- (void)intercomWithOptions:(id)a3
{
  id v4 = a3;
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.soundboard.system"])
  {
    uint64_t v5 = [(SBSServer *)self _gatherXPCClientInfo:v4];
    [(SBSServer *)self intercomWithOptionsInternal:v5];
  }
  else
  {
    id v6 = _SBSLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_error_impl(&dword_230B2C000, v6, OS_LOG_TYPE_ERROR, "Missing required entitlement for intercom", v7, 2u);
    }
  }
}

- (void)identifyWithOptions:(id)a3
{
  id v4 = a3;
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.soundboard.system"])
  {
    uint64_t v5 = [(SBSServer *)self _gatherXPCClientInfo:v4];
    [(SBSServer *)self identifyWithOptionsInternal:v5];
  }
  else
  {
    id v6 = _SBSLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_error_impl(&dword_230B2C000, v6, OS_LOG_TYPE_ERROR, "Missing required entitlement for identify", v7, 2u);
    }
  }
}

- (void)obliterate:(id)a3
{
  id v4 = a3;
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.soundboard.system"])
  {
    uint64_t v5 = [(SBSServer *)self _gatherXPCClientInfo:v4];
    [(SBSServer *)self obliterateInternal:v5];
  }
  else
  {
    id v6 = _SBSLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_error_impl(&dword_230B2C000, v6, OS_LOG_TYPE_ERROR, "Missing required entitlement for obliterate", v7, 2u);
    }
  }
}

- (void)requestDeferredReboot
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v3 = [(SBSServer *)self _hasEntitlement:@"com.apple.soundboard.system"];
  id v4 = _SBSLoggingFacility();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(SBSServer *)self _gatherXPCClientInfo:0];
      int v7 = 136315394;
      uint64_t v8 = "-[SBSServer requestDeferredReboot]";
      __int16 v9 = 2112;
      int v10 = v6;
      _os_log_impl(&dword_230B2C000, v5, OS_LOG_TYPE_DEFAULT, "In %s Client Info..%@", (uint8_t *)&v7, 0x16u);
    }
    [(SBSServer *)self requestDeferredRebootInternal];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v7) = 0;
      _os_log_error_impl(&dword_230B2C000, v5, OS_LOG_TYPE_ERROR, "Missing required entitlement for requestDeferredReboot", (uint8_t *)&v7, 2u);
    }
  }
}

- (void)reboot:(id)a3
{
  id v4 = a3;
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.soundboard.system"])
  {
    uint64_t v5 = [(SBSServer *)self _gatherXPCClientInfo:v4];
    [(SBSServer *)self rebootInternal:v5];
  }
  else
  {
    id v6 = _SBSLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v7 = 0;
      _os_log_error_impl(&dword_230B2C000, v6, OS_LOG_TYPE_ERROR, "Missing required entitlement for reboot", v7, 2u);
    }
  }
}

- (void)airDropSysdiagnose:(id)a3 airDropID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.soundboard.sysdiagnose"])
  {
    [(SBSServer *)self _findConnectionAndSetClientType:2];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __60__SBSServer_airDropSysdiagnose_airDropID_completionHandler___block_invoke;
    v13[3] = &unk_264BA43F8;
    id v14 = v10;
    [(SBSServer *)self airDropSysdiagnoseInternal:v8 airDropID:v9 completionHandler:v13];
    uint64_t v11 = v14;
  }
  else
  {
    __int16 v12 = _SBSLoggingFacility();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_230B2C000, v12, OS_LOG_TYPE_ERROR, "Missing Entitlement for starting sysdiagnose", buf, 2u);
    }

    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.soundboardservices" code:1001 userInfo:0];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v11);
  }
}

uint64_t __60__SBSServer_airDropSysdiagnose_airDropID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cancelCurrentSysdiagnose:(id)a3
{
  id v4 = a3;
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.soundboard.sysdiagnose"])
  {
    [(SBSServer *)self _findConnectionAndSetClientType:2];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __38__SBSServer_cancelCurrentSysdiagnose___block_invoke;
    v7[3] = &unk_264BA4708;
    id v8 = v4;
    [(SBSServer *)self cancelSysdiagnoseInternal:v7];
    uint64_t v5 = v8;
  }
  else
  {
    id v6 = _SBSLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_230B2C000, v6, OS_LOG_TYPE_ERROR, "Missing Entitlement for cancelling sysdiagnose", buf, 2u);
    }

    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.soundboardservices" code:1001 userInfo:0];
    (*((void (**)(id, void *))v4 + 2))(v4, v5);
  }
}

uint64_t __38__SBSServer_cancelCurrentSysdiagnose___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)createSysdiagnose:(id)a3
{
  id v4 = a3;
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.soundboard.sysdiagnose"])
  {
    [(SBSServer *)self _findConnectionAndSetClientType:2];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __31__SBSServer_createSysdiagnose___block_invoke;
    v7[3] = &unk_264BA43D0;
    id v8 = v4;
    [(SBSServer *)self createSysdiagnoseInternal:v7];
    uint64_t v5 = v8;
  }
  else
  {
    id v6 = _SBSLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_230B2C000, v6, OS_LOG_TYPE_ERROR, "Missing Entitlement for starting sysdiagnose", buf, 2u);
    }

    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.soundboardservices" code:1001 userInfo:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v5);
  }
}

uint64_t __31__SBSServer_createSysdiagnose___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sysdiagnoseHasStarted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.soundboard.sysdiagnose"])
  {
    [(SBSServer *)self _findConnectionAndSetClientType:2];
    [(SBSServer *)self sysdiagnoseHasStartedInternal:v3];
  }
  else
  {
    uint64_t v5 = _SBSLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_230B2C000, v5, OS_LOG_TYPE_ERROR, "Missing Entitlement for sysdiagnose", v6, 2u);
    }
  }
}

- (void)isDeviceStereoFollower:(id)a3
{
  id v4 = a3;
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.stereoleader.soundboard"])
  {
    [(SBSServer *)self _findConnectionAndSetClientType:1];
    [(SBSServer *)self isDeviceStereoFollowerInternal:v4];
  }
  else
  {
    uint64_t v5 = _SBSLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_230B2C000, v5, OS_LOG_TYPE_ERROR, "Trying to call isDeviceStereoFollower without entitlement", v6, 2u);
    }
  }
}

- (void)setDeviceAsStereoLeader:(BOOL)a3 withOptions:(id)a4
{
  BOOL v4 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.stereoleader.soundboard"])
  {
    [(SBSServer *)self _findConnectionAndSetClientType:1];
    int v7 = [(SBSServer *)self _gatherXPCClientInfo:v6];
    id v8 = _SBSLoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl(&dword_230B2C000, v8, OS_LOG_TYPE_DEFAULT, "Received setDeviceAsStereoLeader process info - %@", (uint8_t *)&v9, 0xCu);
    }

    [(SBSServer *)self setDeviceAsStereoLeaderInternal:v4 withOptions:v7];
  }
  else
  {
    int v7 = _SBSLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_error_impl(&dword_230B2C000, v7, OS_LOG_TYPE_ERROR, "Trying to call setDeviceAsStereoLeader without entitlement", (uint8_t *)&v9, 2u);
    }
  }
}

- (void)setVolume:(float)a3
{
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.debuginfo.soundboard"])
  {
    *(float *)&double v5 = a3;
    [(SBSServer *)self setVolumeInternal:v5];
  }
  else
  {
    id v6 = _SBSLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v7 = 0;
      _os_log_error_impl(&dword_230B2C000, v6, OS_LOG_TYPE_ERROR, "Trying to call setLEDContents without entitlement", v7, 2u);
    }
  }
}

- (void)getVolume:(id)a3
{
  id v4 = a3;
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.debuginfo.soundboard"])
  {
    [(SBSServer *)self getVolumeInternal:v4];
  }
  else
  {
    double v5 = _SBSLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_230B2C000, v5, OS_LOG_TYPE_ERROR, "Trying to call setLEDContents without entitlement", v6, 2u);
    }
  }
}

- (void)siriSay:(id)a3
{
  id v4 = a3;
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.debuginfo.soundboard"])
  {
    [(SBSServer *)self siriSayInternal:v4];
  }
  else
  {
    double v5 = _SBSLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_230B2C000, v5, OS_LOG_TYPE_ERROR, "Trying to call siriSay without entitlement", v6, 2u);
    }
  }
}

- (void)setLEDContents:(id)a3
{
  id v4 = a3;
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.debuginfo.soundboard"])
  {
    [(SBSServer *)self setLEDContentsInternal:v4];
  }
  else
  {
    double v5 = _SBSLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_230B2C000, v5, OS_LOG_TYPE_ERROR, "Trying to call setLEDContents without entitlement", v6, 2u);
    }
  }
}

- (void)setFeatureFlags:(id)a3
{
  id v4 = a3;
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.debuginfo.soundboard"])
  {
    [(SBSServer *)self setFeatureFlagsInternal:v4];
  }
  else
  {
    double v5 = _SBSLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_230B2C000, v5, OS_LOG_TYPE_ERROR, "Trying to call setFeatureFlags without entitlement", v6, 2u);
    }
  }
}

- (void)getFeatureFlags:(id)a3
{
  id v4 = a3;
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.debuginfo.soundboard"])
  {
    [(SBSServer *)self getFeatureFlagsInternal:v4];
  }
  else
  {
    double v5 = _SBSLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_230B2C000, v5, OS_LOG_TYPE_ERROR, "Trying to call getFeatureFlags without entitlement", v6, 2u);
    }
  }
}

- (void)disassociateNetworkWithName:(id)a3
{
  id v4 = a3;
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.debuginfo.soundboard"])
  {
    [(SBSServer *)self disassociateNetworkWithNameInternal:v4];
  }
  else
  {
    double v5 = _SBSLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_230B2C000, v5, OS_LOG_TYPE_ERROR, "Trying to call sendButton without entitlement", v6, 2u);
    }
  }
}

- (void)disassociateCurrentNetwork
{
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.debuginfo.soundboard"])
  {
    [(SBSServer *)self disassociateCurrentNetworkInternal];
  }
  else
  {
    BOOL v3 = _SBSLoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v4 = 0;
      _os_log_error_impl(&dword_230B2C000, v3, OS_LOG_TYPE_ERROR, "Trying to call sendButton without entitlement", v4, 2u);
    }
  }
}

- (void)setWifiEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.debuginfo.soundboard"])
  {
    [(SBSServer *)self setWifiEnabledInternal:v3];
  }
  else
  {
    double v5 = _SBSLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_230B2C000, v5, OS_LOG_TYPE_ERROR, "Trying to call sendButton without entitlement", v6, 2u);
    }
  }
}

- (void)setBootSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.debuginfo.soundboard"])
  {
    [(SBSServer *)self setBootSpinnerInternal:v3];
  }
  else
  {
    double v5 = _SBSLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_230B2C000, v5, OS_LOG_TYPE_ERROR, "Trying to call sendButton without entitlement", v6, 2u);
    }
  }
}

- (void)clearHomeSWUpdate
{
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.debuginfo.soundboard"])
  {
    [(SBSServer *)self clearHomeSWUpdateInternal];
  }
  else
  {
    BOOL v3 = _SBSLoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v4 = 0;
      _os_log_error_impl(&dword_230B2C000, v3, OS_LOG_TYPE_ERROR, "Trying to call sendButton without entitlement", v4, 2u);
    }
  }
}

- (void)setHomeUpdateState:(int64_t)a3
{
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.debuginfo.soundboard"])
  {
    [(SBSServer *)self setHomeUpdateStateInternal:a3];
  }
  else
  {
    double v5 = _SBSLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_230B2C000, v5, OS_LOG_TYPE_ERROR, "Trying to call sendButton without entitlement", v6, 2u);
    }
  }
}

- (void)injectSWUpdateToHome:(id)a3
{
  id v4 = a3;
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.debuginfo.soundboard"])
  {
    [(SBSServer *)self injectSWUpdateToHomeInternal:v4];
  }
  else
  {
    double v5 = _SBSLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_230B2C000, v5, OS_LOG_TYPE_ERROR, "Trying to call sendButton without entitlement", v6, 2u);
    }
  }
}

- (void)suScanForSoftwareUpdate
{
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.debuginfo.soundboard"])
  {
    [(SBSServer *)self suScanForSoftwareUpdateInternal];
  }
  else
  {
    BOOL v3 = _SBSLoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v4 = 0;
      _os_log_error_impl(&dword_230B2C000, v3, OS_LOG_TYPE_ERROR, "Trying to call sendButton without entitlement", v4, 2u);
    }
  }
}

- (void)sendButtonCommand:(id)a3
{
  id v4 = a3;
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.debuginfo.soundboard"])
  {
    [(SBSServer *)self sendButtonCommandInternal:v4];
  }
  else
  {
    double v5 = _SBSLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_230B2C000, v5, OS_LOG_TYPE_ERROR, "Trying to call sendButton without entitlement", v6, 2u);
    }
  }
}

- (void)triggerWiFiCoreCapture:(id)a3
{
  id v4 = a3;
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.debuginfo.soundboard"])
  {
    [(SBSServer *)self triggerWiFiCoreCaptureInternal:v4];
  }
  else
  {
    double v5 = _SBSLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_230B2C000, v5, OS_LOG_TYPE_ERROR, "Trying to call triggerWiFiCoreCapture without entitlement", v6, 2u);
    }
  }
}

- (void)sendLEDCommand:(id)a3
{
  id v4 = a3;
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.debuginfo.soundboard"])
  {
    [(SBSServer *)self sendLEDCommandInternal:v4];
  }
  else
  {
    double v5 = _SBSLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_230B2C000, v5, OS_LOG_TYPE_ERROR, "Trying to call sendLED without entitlement", v6, 2u);
    }
  }
}

- (void)resetUserDefault:(id)a3
{
  id v4 = a3;
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.debuginfo.soundboard"])
  {
    [(SBSServer *)self resetUserDefaultInternal:v4];
  }
  else
  {
    double v5 = _SBSLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_230B2C000, v5, OS_LOG_TYPE_ERROR, "Trying to call resetUserDefault without entitlement", v6, 2u);
    }
  }
}

- (void)resetAllUserDefaults
{
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.debuginfo.soundboard"])
  {
    [(SBSServer *)self resetAllUserDefaultsInternal];
  }
  else
  {
    BOOL v3 = _SBSLoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v4 = 0;
      _os_log_error_impl(&dword_230B2C000, v3, OS_LOG_TYPE_ERROR, "Trying to call resetAllUserDefaults without entitlement", v4, 2u);
    }
  }
}

- (void)setUserDefaults:(id)a3 withValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.debuginfo.soundboard"])
  {
    [(SBSServer *)self setUserDefaultsInternal:v6 withValue:v7];
  }
  else
  {
    id v8 = _SBSLoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v9 = 0;
      _os_log_error_impl(&dword_230B2C000, v8, OS_LOG_TYPE_ERROR, "Trying to call setUserDefaults without entitlement", v9, 2u);
    }
  }
}

- (void)getUserDefaults:(id)a3
{
  id v4 = a3;
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.debuginfo.soundboard"])
  {
    [(SBSServer *)self getUserDefaultsInternal:v4];
  }
  else
  {
    double v5 = _SBSLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_230B2C000, v5, OS_LOG_TYPE_ERROR, "Trying to call getUserDefaults without entitlement", v6, 2u);
    }
  }
}

- (void)stopTone:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.debuginfo.soundboard"])
  {
    [(SBSServer *)self stopToneInternal:v3];
  }
  else
  {
    double v5 = _SBSLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = @"com.apple.debuginfo.soundboard";
      _os_log_error_impl(&dword_230B2C000, v5, OS_LOG_TYPE_ERROR, "Trying to call stopTone without entitlement %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)playTone:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.debuginfo.soundboard"])
  {
    [(SBSServer *)self playToneInternal:v3];
  }
  else
  {
    double v5 = _SBSLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = @"com.apple.debuginfo.soundboard";
      _os_log_error_impl(&dword_230B2C000, v5, OS_LOG_TYPE_ERROR, "Trying to call playTone without entitlement %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)setTuningInfoOnBox:(id)a3 at:(id)a4 withValue:(float)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.debuginfo.soundboard"])
  {
    *(float *)&double v10 = a5;
    [(SBSServer *)self setTuningInfoOnBoxInternal:v8 at:v9 withValue:v10];
  }
  else
  {
    uint64_t v11 = _SBSLoggingFacility();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int16 v12 = 0;
      _os_log_error_impl(&dword_230B2C000, v11, OS_LOG_TYPE_ERROR, "Trying to call setTuningInfoOnBox without entitlement", v12, 2u);
    }
  }
}

- (void)getTuningInfo:(id)a3
{
  id v4 = a3;
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.debuginfo.soundboard"])
  {
    [(SBSServer *)self getTuningInfoInternal:v4];
  }
  else
  {
    double v5 = _SBSLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v6 = 0;
      _os_log_error_impl(&dword_230B2C000, v5, OS_LOG_TYPE_ERROR, "Trying to call getTuningInfo without entitlement", v6, 2u);
    }
  }
}

- (BOOL)isMediaAlarm:(id)a3
{
  if (![(SBSServer *)self _hasEntitlement:@"com.apple.soundboard.homepodcontrols"])
  {
    uint64_t v3 = _SBSLoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v5 = 0;
      _os_log_error_impl(&dword_230B2C000, v3, OS_LOG_TYPE_ERROR, "Trying to call isMediaAlarm without entitlement", v5, 2u);
    }
  }
  return 0;
}

- (void)getAllSyncedAlarmsAndTimers:(id)a3
{
  id v4 = a3;
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.soundboard.homepodcontrols"])
  {
    [(SBSServer *)self getAllSyncedAlarmsAndTimersInternal:v4];
  }
  else
  {
    double v5 = _SBSLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v6 = 0;
      _os_log_error_impl(&dword_230B2C000, v5, OS_LOG_TYPE_ERROR, "Trying to call getAllSyncedAlarmsAndTimers without entitlement", v6, 2u);
    }
  }
}

- (void)getLEDInfo:(id)a3
{
  id v4 = a3;
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.debuginfo.soundboard"])
  {
    [(SBSServer *)self getLEDInfoInternal:v4];
  }
  else
  {
    double v5 = _SBSLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v6 = 0;
      _os_log_error_impl(&dword_230B2C000, v5, OS_LOG_TYPE_ERROR, "Trying to call getLEDInfo without entitlement", v6, 2u);
    }
  }
}

- (void)getSelectDebugInfo:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.debuginfo.soundboard"])
  {
    [(SBSServer *)self getSelectDebugInfoInternal:v6 reply:v7];
  }
  else
  {
    id v8 = _SBSLoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v9 = 0;
      _os_log_error_impl(&dword_230B2C000, v8, OS_LOG_TYPE_ERROR, "Trying to call getSelectDebugInfo without entitlement", v9, 2u);
    }

    v7[2](v7, MEMORY[0x263EFFA78]);
  }
}

- (void)getAllDebugInfo:(id)a3
{
  id v4 = a3;
  if ([(SBSServer *)self _hasEntitlement:@"com.apple.debuginfo.soundboard"])
  {
    [(SBSServer *)self getAllDebugInfoInternal:v4];
  }
  else
  {
    double v5 = _SBSLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_230B2C000, v5, OS_LOG_TYPE_ERROR, "Trying to call getAllDebugInfo without entitlement", v6, 2u);
    }
  }
}

- (void)handleClientDisconnection:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = _SBSLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v4;
    _os_log_impl(&dword_230B2C000, v5, OS_LOG_TYPE_DEFAULT, "Client with connection %@ is disconnecting.", buf, 0xCu);
  }

  id v6 = self->_clients;
  objc_sync_enter(v6);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = self->_clients;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_msgSend(v11, "connection", (void)v19);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        BOOL v13 = v12 == v4;

        if (v13)
        {
          if ([v11 clientType] == 5)
          {
            long long v15 = [(SBSServer *)self proximityHandoffUIDelegate];
            BOOL v16 = v15 == 0;

            if (!v16)
            {
              long long v17 = [(SBSServer *)self proximityHandoffUIDelegate];
              [v17 handoffCancelWithHandoffType:0];
            }
          }
          id v14 = v11;
          goto LABEL_16;
        }
      }
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_16:

  v18 = _SBSLoggingFacility();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v14;
    _os_log_impl(&dword_230B2C000, v18, OS_LOG_TYPE_DEFAULT, "Client object found: %@", buf, 0xCu);
  }

  if (v14) {
    [(NSMutableArray *)self->_clients removeObject:v14];
  }
  objc_sync_exit(v6);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_alloc_init(SBSClient);
  [(SBSClient *)v8 setConnection:v7];
  [(SBSClient *)v8 setClientType:0];
  uint64_t v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E564238];
  double v10 = [(SBSClient *)v8 connection];
  [v10 setExportedInterface:v9];

  uint64_t v11 = [(SBSClient *)v8 connection];
  [v11 setExportedObject:self];

  id v12 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E566250];
  BOOL v13 = [(SBSClient *)v8 connection];
  [v13 setRemoteObjectInterface:v12];

  id v14 = [(SBSClient *)v8 connection];
  long long v15 = [v14 exportedInterface];
  BOOL v16 = [v15 classesForSelector:sel_getAllSyncedAlarmsAndTimers_ argumentIndex:0 ofReply:1];

  long long v17 = (void *)MEMORY[0x263EFFA08];
  uint64_t v18 = objc_opt_class();
  long long v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
  long long v20 = [v16 setByAddingObjectsFromSet:v19];

  long long v21 = [(SBSClient *)v8 connection];
  long long v22 = [v21 exportedInterface];
  [v22 setClasses:v20 forSelector:sel_getAllSyncedAlarmsAndTimers_ argumentIndex:0 ofReply:1];

  objc_initWeak(&location, self);
  v23 = [(SBSClient *)v8 connection];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __48__SBSServer_listener_shouldAcceptNewConnection___block_invoke;
  v33[3] = &unk_264BA43A0;
  objc_copyWeak(&v35, &location);
  id v24 = v7;
  id v34 = v24;
  [v23 setInterruptionHandler:v33];

  id v25 = [(SBSClient *)v8 connection];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __48__SBSServer_listener_shouldAcceptNewConnection___block_invoke_2;
  v30[3] = &unk_264BA43A0;
  objc_copyWeak(&v32, &location);
  id v26 = v24;
  id v31 = v26;
  [v25 setInvalidationHandler:v30];

  v27 = self->_clients;
  objc_sync_enter(v27);
  [(NSMutableArray *)self->_clients addObject:v8];
  objc_sync_exit(v27);

  v28 = [(SBSClient *)v8 connection];
  [v28 resume];

  objc_destroyWeak(&v32);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

  return 1;
}

void __48__SBSServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleClientDisconnection:*(void *)(a1 + 32)];
}

void __48__SBSServer_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleClientDisconnection:*(void *)(a1 + 32)];
}

- (SBSServer)init
{
  v12.receiver = self;
  v12.super_class = (Class)SBSServer;
  id v2 = [(SBSServer *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.soundboardservices.server"];
    serverListener = v2->_serverListener;
    v2->_serverListener = (NSXPCListener *)v3;

    [(NSXPCListener *)v2->_serverListener setDelegate:v2];
    double v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    clients = v2->_clients;
    v2->_clients = v5;

    id v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    delegates = v2->_delegates;
    v2->_delegates = v7;

    [(NSXPCListener *)v2->_serverListener resume];
    if (+[SBSServer _isInternalBuild])
    {
      uint64_t v9 = [[SBSRemoteDeviceReceiver alloc] initWithDelegate:v2];
      receiver = v2->_receiver;
      v2->_receiver = v9;
    }
  }
  return v2;
}

+ (BOOL)_isInternalBuild
{
  if (_isInternalBuild_onceToken != -1) {
    dispatch_once(&_isInternalBuild_onceToken, &__block_literal_global);
  }
  return _isInternalBuild_isInternal;
}

uint64_t __29__SBSServer__isInternalBuild__block_invoke()
{
  uint64_t result = os_variant_allows_internal_security_policies();
  _isInternalBuild_isInternal = result;
  return result;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__SBSServer_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  id v2 = (void *)sSharedInstance;
  return v2;
}

uint64_t __27__SBSServer_sharedInstance__block_invoke(uint64_t a1)
{
  sSharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

@end