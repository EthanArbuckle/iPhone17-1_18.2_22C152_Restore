@interface SBSRemoteDeviceReceiver
- (RPCompanionLinkClient)client;
- (SBSImplementerInternal)delegate;
- (SBSRemoteDeviceReceiver)initWithDelegate:(id)a3;
- (void)_deregisterClearHomeSWUpdate;
- (void)_deregisterDisassociateCurrentNetwork;
- (void)_deregisterDisassociateNetworkWithName;
- (void)_deregisterEverything;
- (void)_deregisterGetAllDebugInfo;
- (void)_deregisterGetFeatureFlags;
- (void)_deregisterGetInstalledProfiles;
- (void)_deregisterGetLEDInfo;
- (void)_deregisterGetPowerEstimateForInterval;
- (void)_deregisterGetSelectDebugInfo;
- (void)_deregisterGetTuningInfo;
- (void)_deregisterGetUserDefaults;
- (void)_deregisterGetVolume;
- (void)_deregisterHandoffCancel;
- (void)_deregisterHandoffComplete;
- (void)_deregisterHandoffStart;
- (void)_deregisterHandoffStartWithArtworkColors;
- (void)_deregisterHandoffUpdateIntensity;
- (void)_deregisterIdentifyWithOptions;
- (void)_deregisterInjectSWUpdateToHome;
- (void)_deregisterInstallProfileData;
- (void)_deregisterIntercomWithOptions;
- (void)_deregisterIsDeviceStereoFollower;
- (void)_deregisterObliterate;
- (void)_deregisterPlayTone;
- (void)_deregisterReboot;
- (void)_deregisterRemoveProfileByIdentifier;
- (void)_deregisterRender;
- (void)_deregisterRequestDeferredReboot;
- (void)_deregisterRequestForFetchingAlarmsAndTimers;
- (void)_deregisterResetAllUserDefaults;
- (void)_deregisterResetUserDefault;
- (void)_deregisterSUScanForSoftwareUpdate;
- (void)_deregisterSendButtonCommand;
- (void)_deregisterSendLEDCommand;
- (void)_deregisterSetBootSpinner;
- (void)_deregisterSetDeviceAsStereoLeader;
- (void)_deregisterSetFeatureFlags;
- (void)_deregisterSetHomeUpdateState;
- (void)_deregisterSetLEDContents;
- (void)_deregisterSetTuningInfoOnBox;
- (void)_deregisterSetUserDefaults;
- (void)_deregisterSetVolume;
- (void)_deregisterSetWifiEnabled;
- (void)_deregisterSiriSay;
- (void)_deregisterStopTone;
- (void)_deregisterSysdiagnoseHasStarted;
- (void)_deregisterTriggerWiFiCoreCapture;
- (void)_registerClearHomeSWUpdate;
- (void)_registerDisassociateCurrentNetwork;
- (void)_registerDisassociateNetworkWithName;
- (void)_registerEverything;
- (void)_registerGetAllDebugInfo;
- (void)_registerGetFeatureFlags;
- (void)_registerGetInstalledProfiles;
- (void)_registerGetLEDInfo;
- (void)_registerGetPowerEstimateForInterval;
- (void)_registerGetSelectDebugInfo;
- (void)_registerGetTuningInfo;
- (void)_registerGetUserDefaults;
- (void)_registerGetVolume;
- (void)_registerHandoffCancel;
- (void)_registerHandoffComplete;
- (void)_registerHandoffStart;
- (void)_registerHandoffStartWithArtworkColors;
- (void)_registerHandoffUpdateIntensity;
- (void)_registerIdentifyWithOptions;
- (void)_registerInjectSWUpdateToHome;
- (void)_registerInstallProfileData;
- (void)_registerIntercomWithOptions;
- (void)_registerIsDeviceStereoFollower;
- (void)_registerObliterate;
- (void)_registerPlayTone;
- (void)_registerReboot;
- (void)_registerRemoveProfileByIdentifier;
- (void)_registerRender;
- (void)_registerRequestDeferredReboot;
- (void)_registerRequestForFetchingAlarmsAndTimers;
- (void)_registerResetAllUserDefaults;
- (void)_registerResetUserDefault;
- (void)_registerSUScanForSoftwareUpdate;
- (void)_registerSendButtonCommand;
- (void)_registerSendLEDCommand;
- (void)_registerSetBootSpinner;
- (void)_registerSetDeviceAsStereoLeader;
- (void)_registerSetFeatureFlags;
- (void)_registerSetHomeUpdateState;
- (void)_registerSetLEDContents;
- (void)_registerSetTuningInfoOnBox;
- (void)_registerSetUserDefaults;
- (void)_registerSetVolume;
- (void)_registerSetWifiEnabled;
- (void)_registerSiriSay;
- (void)_registerStopTone;
- (void)_registerSysdiagnoseHasStarted;
- (void)_registerTriggerWiFiCoreCapture;
- (void)dealloc;
- (void)setClient:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SBSRemoteDeviceReceiver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setClient:(id)a3
{
}

- (RPCompanionLinkClient)client
{
  return (RPCompanionLinkClient *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDelegate:(id)a3
{
}

- (SBSImplementerInternal)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSImplementerInternal *)WeakRetained;
}

- (void)_deregisterHandoffComplete
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.kSBSProximityHandoffUICompleteKey"];
}

- (void)_registerHandoffComplete
{
  objc_initWeak(&location, self);
  v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__SBSRemoteDeviceReceiver__registerHandoffComplete__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.kSBSProximityHandoffUICompleteKey" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __51__SBSRemoteDeviceReceiver__registerHandoffComplete__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v11 = a4;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = [v6 objectForKeyedSubscript:@"handoffType"];

  uint64_t v9 = [v8 unsignedIntegerValue];
  v10 = [WeakRetained delegate];
  [v10 handoffCompleteInternalWithHandoffType:v9];

  if (v11) {
    (*((void (**)(id, void, void, void))v11 + 2))(v11, MEMORY[0x263EFFA78], 0, 0);
  }
}

- (void)_deregisterHandoffCancel
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.kSBSProximityHandoffUICancelKey"];
}

- (void)_registerHandoffCancel
{
  objc_initWeak(&location, self);
  v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__SBSRemoteDeviceReceiver__registerHandoffCancel__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.kSBSProximityHandoffUICancelKey" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __49__SBSRemoteDeviceReceiver__registerHandoffCancel__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v11 = a4;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = [v6 objectForKeyedSubscript:@"handoffType"];

  uint64_t v9 = [v8 unsignedIntegerValue];
  v10 = [WeakRetained delegate];
  [v10 handoffCancelInternalWithHandoffType:v9];

  if (v11) {
    (*((void (**)(id, void, void, void))v11 + 2))(v11, MEMORY[0x263EFFA78], 0, 0);
  }
}

- (void)_deregisterHandoffUpdateIntensity
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.kSBSProximityHandoffUIUpdateIntensityKey"];
}

- (void)_registerHandoffUpdateIntensity
{
  objc_initWeak(&location, self);
  v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__SBSRemoteDeviceReceiver__registerHandoffUpdateIntensity__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.kSBSProximityHandoffUIUpdateIntensityKey" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __58__SBSRemoteDeviceReceiver__registerHandoffUpdateIntensity__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v15 = a4;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = [v6 objectForKeyedSubscript:@"handoffType"];
  uint64_t v9 = [v8 unsignedIntegerValue];

  v10 = [v6 objectForKeyedSubscript:@"intensity"];

  [v10 floatValue];
  int v12 = v11;

  v13 = [WeakRetained delegate];
  LODWORD(v14) = v12;
  [v13 handoffUpdateIntensityInternal:v9 handoffType:v14];

  if (v15) {
    (*((void (**)(id, void, void, void))v15 + 2))(v15, MEMORY[0x263EFFA78], 0, 0);
  }
}

- (void)_deregisterHandoffStartWithArtworkColors
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.kSBSProximityHandoffUIStartWithArtworkColorsKey"];
}

- (void)_registerHandoffStartWithArtworkColors
{
  objc_initWeak(&location, self);
  v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __65__SBSRemoteDeviceReceiver__registerHandoffStartWithArtworkColors__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.kSBSProximityHandoffUIStartWithArtworkColorsKey" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __65__SBSRemoteDeviceReceiver__registerHandoffStartWithArtworkColors__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v12 = a4;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = [v6 objectForKeyedSubscript:@"artworkColors"];
  uint64_t v9 = [v6 objectForKeyedSubscript:@"handoffType"];

  uint64_t v10 = [v9 unsignedIntegerValue];
  int v11 = [WeakRetained delegate];
  [v11 handoffStartWithArtworkColorsInternal:v8 handoffType:v10];

  if (v12) {
    (*((void (**)(id, void, void, void))v12 + 2))(v12, MEMORY[0x263EFFA78], 0, 0);
  }
}

- (void)_deregisterHandoffStart
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.kSBSProximityHandoffUIStartKey"];
}

- (void)_registerHandoffStart
{
  objc_initWeak(&location, self);
  v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__SBSRemoteDeviceReceiver__registerHandoffStart__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.kSBSProximityHandoffUIStartKey" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __48__SBSRemoteDeviceReceiver__registerHandoffStart__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v11 = a4;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = [v6 objectForKeyedSubscript:@"handoffType"];

  uint64_t v9 = [v8 unsignedIntegerValue];
  uint64_t v10 = [WeakRetained delegate];
  [v10 handoffStartInternalWithHandoffType:v9];

  if (v11) {
    (*((void (**)(id, void, void, void))v11 + 2))(v11, MEMORY[0x263EFFA78], 0, 0);
  }
}

- (void)_deregisterRemoveProfileByIdentifier
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.RemoveProfileByIdentifier"];
}

- (void)_registerRemoveProfileByIdentifier
{
  objc_initWeak(&location, self);
  v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __61__SBSRemoteDeviceReceiver__registerRemoveProfileByIdentifier__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.RemoveProfileByIdentifier" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __61__SBSRemoteDeviceReceiver__registerRemoveProfileByIdentifier__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v9 = [WeakRetained delegate];
  uint64_t v10 = [v7 objectForKeyedSubscript:@"identifier"];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__SBSRemoteDeviceReceiver__registerRemoveProfileByIdentifier__block_invoke_2;
  v12[3] = &unk_264BA4708;
  id v13 = v6;
  id v11 = v6;
  [v9 removeProfileByIdentifierInternal:v10 completion:v12];
}

void __61__SBSRemoteDeviceReceiver__registerRemoveProfileByIdentifier__block_invoke_2(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    if (v3)
    {
      id v7 = @"error";
      v8[0] = v3;
      id v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
      (*(void (**)(uint64_t, void *, void, void))(v5 + 16))(v5, v6, 0, 0);
    }
    else
    {
      (*(void (**)(uint64_t, void, void, void))(v5 + 16))(v5, 0, 0, 0);
    }
  }
}

- (void)_deregisterInstallProfileData
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.InstallProfileData"];
}

- (void)_registerInstallProfileData
{
  objc_initWeak(&location, self);
  id v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__SBSRemoteDeviceReceiver__registerInstallProfileData__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.InstallProfileData" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __54__SBSRemoteDeviceReceiver__registerInstallProfileData__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v9 = [WeakRetained delegate];
  uint64_t v10 = [v7 objectForKeyedSubscript:@"profileData"];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __54__SBSRemoteDeviceReceiver__registerInstallProfileData__block_invoke_2;
  v12[3] = &unk_264BA4708;
  id v13 = v6;
  id v11 = v6;
  [v9 installProfileDataInternal:v10 completion:v12];
}

void __54__SBSRemoteDeviceReceiver__registerInstallProfileData__block_invoke_2(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    if (v3)
    {
      id v7 = @"error";
      v8[0] = v3;
      id v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
      (*(void (**)(uint64_t, void *, void, void))(v5 + 16))(v5, v6, 0, 0);
    }
    else
    {
      (*(void (**)(uint64_t, void, void, void))(v5 + 16))(v5, 0, 0, 0);
    }
  }
}

- (void)_deregisterGetInstalledProfiles
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.GetInstalledProfiles"];
}

- (void)_registerGetInstalledProfiles
{
  objc_initWeak(&location, self);
  id v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__SBSRemoteDeviceReceiver__registerGetInstalledProfiles__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.GetInstalledProfiles" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __56__SBSRemoteDeviceReceiver__registerGetInstalledProfiles__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = [WeakRetained delegate];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__SBSRemoteDeviceReceiver__registerGetInstalledProfiles__block_invoke_2;
  v9[3] = &unk_264BA45D8;
  id v10 = v5;
  id v8 = v5;
  [v7 getInstalledProfilesInternal:v9];
}

void __56__SBSRemoteDeviceReceiver__registerGetInstalledProfiles__block_invoke_2(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    if (v3)
    {
      id v7 = @"reply";
      v8[0] = v3;
      id v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
      (*(void (**)(uint64_t, void *, void, void))(v5 + 16))(v5, v6, 0, 0);
    }
    else
    {
      (*(void (**)(uint64_t, void, void, void))(v5 + 16))(v5, 0, 0, 0);
    }
  }
}

- (void)_deregisterGetPowerEstimateForInterval
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.GetPowerEstimateForInterval"];
}

- (void)_registerGetPowerEstimateForInterval
{
  objc_initWeak(&location, self);
  id v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __63__SBSRemoteDeviceReceiver__registerGetPowerEstimateForInterval__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.GetPowerEstimateForInterval" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __63__SBSRemoteDeviceReceiver__registerGetPowerEstimateForInterval__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v9 = [WeakRetained delegate];
  id v10 = [v7 objectForKeyedSubscript:@"interval"];

  [v10 floatValue];
  int v12 = v11;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __63__SBSRemoteDeviceReceiver__registerGetPowerEstimateForInterval__block_invoke_2;
  v15[3] = &unk_264BA46D0;
  id v16 = v6;
  id v13 = v6;
  LODWORD(v14) = v12;
  [v9 getPowerEstimateForIntervalInternal:v15 reply:v14];
}

void __63__SBSRemoteDeviceReceiver__registerGetPowerEstimateForInterval__block_invoke_2(uint64_t a1, double a2, float a3)
{
  v10[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    v9[0] = @"joulesEstimate";
    id v5 = objc_msgSend(NSNumber, "numberWithFloat:");
    v9[1] = @"period";
    v10[0] = v5;
    *(float *)&double v6 = a3;
    id v7 = [NSNumber numberWithFloat:v6];
    v10[1] = v7;
    id v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
    (*(void (**)(uint64_t, void *, void, void))(v3 + 16))(v3, v8, 0, 0);
  }
}

- (void)_deregisterRequestForFetchingAlarmsAndTimers
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.SystemRequestFetchAlarmsAndTimers"];
}

- (void)_registerRequestForFetchingAlarmsAndTimers
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __69__SBSRemoteDeviceReceiver__registerRequestForFetchingAlarmsAndTimers__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.SystemRequestFetchAlarmsAndTimers" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __69__SBSRemoteDeviceReceiver__registerRequestForFetchingAlarmsAndTimers__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = [WeakRetained delegate];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __69__SBSRemoteDeviceReceiver__registerRequestForFetchingAlarmsAndTimers__block_invoke_2;
  v9[3] = &unk_264BA44D8;
  id v10 = v5;
  id v8 = v5;
  [v7 getAllSyncedAlarmsAndTimersInternal:v9];
}

void __69__SBSRemoteDeviceReceiver__registerRequestForFetchingAlarmsAndTimers__block_invoke_2(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    double v6 = @"reply";
    v7[0] = a2;
    uint64_t v3 = NSDictionary;
    id v4 = a2;
    id v5 = [v3 dictionaryWithObjects:v7 forKeys:&v6 count:1];
    (*(void (**)(uint64_t, void *, void, void))(v2 + 16))(v2, v5, 0, 0);
  }
}

- (void)_deregisterIntercomWithOptions
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.Intercom"];
}

- (void)_registerIntercomWithOptions
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__SBSRemoteDeviceReceiver__registerIntercomWithOptions__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.Intercom" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __55__SBSRemoteDeviceReceiver__registerIntercomWithOptions__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a4;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [WeakRetained delegate];
  uint64_t v9 = [v6 objectForKeyedSubscript:@"options"];

  [v8 intercomWithOptionsInternal:v9];
  if (v10) {
    (*((void (**)(id, void, void, void))v10 + 2))(v10, MEMORY[0x263EFFA78], 0, 0);
  }
}

- (void)_deregisterIdentifyWithOptions
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.Identify"];
}

- (void)_registerIdentifyWithOptions
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__SBSRemoteDeviceReceiver__registerIdentifyWithOptions__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.Identify" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __55__SBSRemoteDeviceReceiver__registerIdentifyWithOptions__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a4;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [WeakRetained delegate];
  uint64_t v9 = [v6 objectForKeyedSubscript:@"options"];

  [v8 identifyWithOptionsInternal:v9];
  if (v10) {
    (*((void (**)(id, void, void, void))v10 + 2))(v10, MEMORY[0x263EFFA78], 0, 0);
  }
}

- (void)_deregisterObliterate
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.Obliterate"];
}

- (void)_registerObliterate
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__SBSRemoteDeviceReceiver__registerObliterate__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.Obliterate" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __46__SBSRemoteDeviceReceiver__registerObliterate__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a4;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [WeakRetained delegate];
  uint64_t v9 = [v6 objectForKeyedSubscript:@"options"];

  [v8 obliterateInternal:v9];
  if (v10) {
    (*((void (**)(id, void, void, void))v10 + 2))(v10, MEMORY[0x263EFFA78], 0, 0);
  }
}

- (void)_deregisterRequestDeferredReboot
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.SystemRequestDeferredReboot"];
}

- (void)_registerRequestDeferredReboot
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__SBSRemoteDeviceReceiver__registerRequestDeferredReboot__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.SystemRequestDeferredReboot" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __57__SBSRemoteDeviceReceiver__registerRequestDeferredReboot__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = [WeakRetained delegate];
  [v6 requestDeferredRebootInternal];

  if (v7) {
    (*((void (**)(id, void, void, void))v7 + 2))(v7, MEMORY[0x263EFFA78], 0, 0);
  }
}

- (void)_deregisterReboot
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.SystemReboot"];
}

- (void)_registerReboot
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__SBSRemoteDeviceReceiver__registerReboot__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.SystemReboot" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __42__SBSRemoteDeviceReceiver__registerReboot__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a4;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [WeakRetained delegate];
  uint64_t v9 = [v6 objectForKeyedSubscript:@"options"];

  [v8 rebootInternal:v9];
  if (v10) {
    (*((void (**)(id, void, void, void))v10 + 2))(v10, MEMORY[0x263EFFA78], 0, 0);
  }
}

- (void)_deregisterSysdiagnoseHasStarted
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.SysdiagnoseSysdiagnoseHasStarted"];
}

- (void)_registerSysdiagnoseHasStarted
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__SBSRemoteDeviceReceiver__registerSysdiagnoseHasStarted__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.SysdiagnoseSysdiagnoseHasStarted" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __57__SBSRemoteDeviceReceiver__registerSysdiagnoseHasStarted__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a4;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [WeakRetained delegate];
  uint64_t v9 = [v6 objectForKeyedSubscript:@"started"];

  objc_msgSend(v8, "sysdiagnoseHasStartedInternal:", objc_msgSend(v9, "BOOLValue"));
  if (v10) {
    (*((void (**)(id, void, void, void))v10 + 2))(v10, MEMORY[0x263EFFA78], 0, 0);
  }
}

- (void)_deregisterIsDeviceStereoFollower
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.StereoLeaderRoleIsDeviceStereoFollower"];
}

- (void)_registerIsDeviceStereoFollower
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__SBSRemoteDeviceReceiver__registerIsDeviceStereoFollower__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.StereoLeaderRoleIsDeviceStereoFollower" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __58__SBSRemoteDeviceReceiver__registerIsDeviceStereoFollower__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = [WeakRetained delegate];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __58__SBSRemoteDeviceReceiver__registerIsDeviceStereoFollower__block_invoke_2;
  v9[3] = &unk_264BA4668;
  id v10 = v5;
  id v8 = v5;
  [v7 isDeviceStereoFollowerInternal:v9];
}

void __58__SBSRemoteDeviceReceiver__registerIsDeviceStereoFollower__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v5 = @"reply";
    uint64_t v3 = [NSNumber numberWithBool:a2];
    v6[0] = v3;
    id v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
    (*(void (**)(uint64_t, void *, void, void))(v2 + 16))(v2, v4, 0, 0);
  }
}

- (void)_deregisterSetDeviceAsStereoLeader
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.StereoLeaderRoleSetDeviceAsStereoLeader"];
}

- (void)_registerSetDeviceAsStereoLeader
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__SBSRemoteDeviceReceiver__registerSetDeviceAsStereoLeader__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.StereoLeaderRoleSetDeviceAsStereoLeader" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __59__SBSRemoteDeviceReceiver__registerSetDeviceAsStereoLeader__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v12 = a4;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [WeakRetained delegate];
  uint64_t v9 = [v6 objectForKeyedSubscript:@"enabled"];
  uint64_t v10 = [v9 BOOLValue];
  int v11 = [v6 objectForKeyedSubscript:@"withOptions"];

  [v8 setDeviceAsStereoLeaderInternal:v10 withOptions:v11];
  if (v12) {
    (*((void (**)(id, void, void, void))v12 + 2))(v12, MEMORY[0x263EFFA78], 0, 0);
  }
}

- (void)_deregisterSetVolume
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.DebugInfoSetVolume"];
}

- (void)_registerSetVolume
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__SBSRemoteDeviceReceiver__registerSetVolume__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.DebugInfoSetVolume" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __45__SBSRemoteDeviceReceiver__registerSetVolume__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a4;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [WeakRetained delegate];
  uint64_t v9 = [v6 objectForKeyedSubscript:@"volume"];

  [v9 floatValue];
  objc_msgSend(v8, "setVolumeInternal:");

  if (v10) {
    (*((void (**)(id, void, void, void))v10 + 2))(v10, MEMORY[0x263EFFA78], 0, 0);
  }
}

- (void)_deregisterGetVolume
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.DebugInfoGetVolume"];
}

- (void)_registerGetVolume
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__SBSRemoteDeviceReceiver__registerGetVolume__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.DebugInfoGetVolume" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __45__SBSRemoteDeviceReceiver__registerGetVolume__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = [WeakRetained delegate];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __45__SBSRemoteDeviceReceiver__registerGetVolume__block_invoke_2;
  v9[3] = &unk_264BA4628;
  id v10 = v5;
  id v8 = v5;
  [v7 getVolumeInternal:v9];
}

void __45__SBSRemoteDeviceReceiver__registerGetVolume__block_invoke_2(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v4 = @"reply";
    id v2 = objc_msgSend(NSNumber, "numberWithFloat:");
    v5[0] = v2;
    uint64_t v3 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
    (*(void (**)(uint64_t, void *, void, void))(v1 + 16))(v1, v3, 0, 0);
  }
}

- (void)_deregisterSUScanForSoftwareUpdate
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.DebugInfoSUScanForSoftwareUpdate"];
}

- (void)_registerSUScanForSoftwareUpdate
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__SBSRemoteDeviceReceiver__registerSUScanForSoftwareUpdate__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.DebugInfoSUScanForSoftwareUpdate" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __59__SBSRemoteDeviceReceiver__registerSUScanForSoftwareUpdate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = [WeakRetained delegate];
  [v6 suScanForSoftwareUpdateInternal];

  if (v7) {
    (*((void (**)(id, void, void, void))v7 + 2))(v7, MEMORY[0x263EFFA78], 0, 0);
  }
}

- (void)_deregisterSiriSay
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.DebugInfoSiriSay"];
}

- (void)_registerSiriSay
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__SBSRemoteDeviceReceiver__registerSiriSay__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.DebugInfoSiriSay" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __43__SBSRemoteDeviceReceiver__registerSiriSay__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a4;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [WeakRetained delegate];
  uint64_t v9 = [v6 objectForKeyedSubscript:@"phrase"];

  [v8 siriSayInternal:v9];
  if (v10) {
    (*((void (**)(id, void, void, void))v10 + 2))(v10, MEMORY[0x263EFFA78], 0, 0);
  }
}

- (void)_deregisterSetLEDContents
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.DebugInfoSetLEDContents"];
}

- (void)_registerSetLEDContents
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__SBSRemoteDeviceReceiver__registerSetLEDContents__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.DebugInfoSetLEDContents" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __50__SBSRemoteDeviceReceiver__registerSetLEDContents__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a4;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [WeakRetained delegate];
  uint64_t v9 = [v6 objectForKeyedSubscript:@"LEDContents"];

  [v8 setLEDContentsInternal:v9];
  if (v10) {
    (*((void (**)(id, void, void, void))v10 + 2))(v10, MEMORY[0x263EFFA78], 0, 0);
  }
}

- (void)_deregisterSetFeatureFlags
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.DebugInfoSetFeatureFlags"];
}

- (void)_registerSetFeatureFlags
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__SBSRemoteDeviceReceiver__registerSetFeatureFlags__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.DebugInfoSetFeatureFlags" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __51__SBSRemoteDeviceReceiver__registerSetFeatureFlags__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a4;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [WeakRetained delegate];
  uint64_t v9 = [v6 objectForKeyedSubscript:@"featureFlags"];

  [v8 setFeatureFlagsInternal:v9];
  if (v10) {
    (*((void (**)(id, void, void, void))v10 + 2))(v10, MEMORY[0x263EFFA78], 0, 0);
  }
}

- (void)_deregisterGetFeatureFlags
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.DebugInfoGetFeatureFlags"];
}

- (void)_registerGetFeatureFlags
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__SBSRemoteDeviceReceiver__registerGetFeatureFlags__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.DebugInfoGetFeatureFlags" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __51__SBSRemoteDeviceReceiver__registerGetFeatureFlags__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = [WeakRetained delegate];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __51__SBSRemoteDeviceReceiver__registerGetFeatureFlags__block_invoke_2;
  v9[3] = &unk_264BA45D8;
  id v10 = v5;
  id v8 = v5;
  [v7 getFeatureFlagsInternal:v9];
}

void __51__SBSRemoteDeviceReceiver__registerGetFeatureFlags__block_invoke_2(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v6 = @"reply";
    v7[0] = a2;
    uint64_t v3 = NSDictionary;
    id v4 = a2;
    id v5 = [v3 dictionaryWithObjects:v7 forKeys:&v6 count:1];
    (*(void (**)(uint64_t, void *, void, void))(v2 + 16))(v2, v5, 0, 0);
  }
}

- (void)_deregisterDisassociateNetworkWithName
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.DebugInfoDisassociateNetworkWithName"];
}

- (void)_registerDisassociateNetworkWithName
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __63__SBSRemoteDeviceReceiver__registerDisassociateNetworkWithName__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.DebugInfoDisassociateNetworkWithName" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __63__SBSRemoteDeviceReceiver__registerDisassociateNetworkWithName__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v11 = a4;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [WeakRetained delegate];
  uint64_t v9 = [v6 objectForKeyedSubscript:@"defaultKey"];

  id v10 = [v9 stringValue];
  [v8 disassociateNetworkWithNameInternal:v10];

  if (v11) {
    (*((void (**)(id, void, void, void))v11 + 2))(v11, MEMORY[0x263EFFA78], 0, 0);
  }
}

- (void)_deregisterDisassociateCurrentNetwork
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.DebugInfoDisassociateCurrentNetwork"];
}

- (void)_registerDisassociateCurrentNetwork
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __62__SBSRemoteDeviceReceiver__registerDisassociateCurrentNetwork__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.DebugInfoDisassociateCurrentNetwork" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __62__SBSRemoteDeviceReceiver__registerDisassociateCurrentNetwork__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = [WeakRetained delegate];
  [v6 disassociateCurrentNetworkInternal];

  if (v7) {
    (*((void (**)(id, void, void, void))v7 + 2))(v7, MEMORY[0x263EFFA78], 0, 0);
  }
}

- (void)_deregisterSetWifiEnabled
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.DebugInfoSetWifiEnabled"];
}

- (void)_registerSetWifiEnabled
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__SBSRemoteDeviceReceiver__registerSetWifiEnabled__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.DebugInfoSetWifiEnabled" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __50__SBSRemoteDeviceReceiver__registerSetWifiEnabled__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a4;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [WeakRetained delegate];
  uint64_t v9 = [v6 objectForKeyedSubscript:@"defaultKey"];

  objc_msgSend(v8, "setWifiEnabledInternal:", objc_msgSend(v9, "BOOLValue"));
  if (v10) {
    (*((void (**)(id, void, void, void))v10 + 2))(v10, MEMORY[0x263EFFA78], 0, 0);
  }
}

- (void)_deregisterSetBootSpinner
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.DebugInfoSetBootSpinner"];
}

- (void)_registerSetBootSpinner
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__SBSRemoteDeviceReceiver__registerSetBootSpinner__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.DebugInfoSetBootSpinner" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __50__SBSRemoteDeviceReceiver__registerSetBootSpinner__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a4;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [WeakRetained delegate];
  uint64_t v9 = [v6 objectForKeyedSubscript:@"defaultKey"];

  objc_msgSend(v8, "setBootSpinnerInternal:", objc_msgSend(v9, "BOOLValue"));
  if (v10) {
    (*((void (**)(id, void, void, void))v10 + 2))(v10, MEMORY[0x263EFFA78], 0, 0);
  }
}

- (void)_deregisterClearHomeSWUpdate
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.DebugInfoSetHomeUpdateState"];
}

- (void)_registerClearHomeSWUpdate
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__SBSRemoteDeviceReceiver__registerClearHomeSWUpdate__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.DebugInfoSetHomeUpdateState" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __53__SBSRemoteDeviceReceiver__registerClearHomeSWUpdate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = [WeakRetained delegate];
  [v6 clearHomeSWUpdateInternal];

  if (v7) {
    (*((void (**)(id, void, void, void))v7 + 2))(v7, MEMORY[0x263EFFA78], 0, 0);
  }
}

- (void)_deregisterSetHomeUpdateState
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.DebugInfoSetHomeUpdateState"];
}

- (void)_registerSetHomeUpdateState
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__SBSRemoteDeviceReceiver__registerSetHomeUpdateState__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.DebugInfoSetHomeUpdateState" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __54__SBSRemoteDeviceReceiver__registerSetHomeUpdateState__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a4;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [WeakRetained delegate];
  uint64_t v9 = [v6 objectForKeyedSubscript:@"state"];

  objc_msgSend(v8, "setHomeUpdateStateInternal:", objc_msgSend(v9, "integerValue"));
  if (v10) {
    (*((void (**)(id, void, void, void))v10 + 2))(v10, MEMORY[0x263EFFA78], 0, 0);
  }
}

- (void)_deregisterInjectSWUpdateToHome
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.DebugInfoInjectSWUpdateToHome"];
}

- (void)_registerInjectSWUpdateToHome
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__SBSRemoteDeviceReceiver__registerInjectSWUpdateToHome__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.DebugInfoInjectSWUpdateToHome" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __56__SBSRemoteDeviceReceiver__registerInjectSWUpdateToHome__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a4;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [WeakRetained delegate];
  uint64_t v9 = [v6 objectForKeyedSubscript:@"defaultKey"];

  [v8 injectSWUpdateToHomeInternal:v9];
  if (v10) {
    (*((void (**)(id, void, void, void))v10 + 2))(v10, MEMORY[0x263EFFA78], 0, 0);
  }
}

- (void)_deregisterSendButtonCommand
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.DebugInfoSendButtonCommand"];
}

- (void)_registerSendButtonCommand
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__SBSRemoteDeviceReceiver__registerSendButtonCommand__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.DebugInfoSendButtonCommand" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __53__SBSRemoteDeviceReceiver__registerSendButtonCommand__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a4;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [WeakRetained delegate];
  uint64_t v9 = [v6 objectForKeyedSubscript:@"defaultKey"];

  [v8 sendButtonCommandInternal:v9];
  if (v10) {
    (*((void (**)(id, void, void, void))v10 + 2))(v10, MEMORY[0x263EFFA78], 0, 0);
  }
}

- (void)_deregisterTriggerWiFiCoreCapture
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.TriggerWiFiCoreCapture"];
}

- (void)_registerTriggerWiFiCoreCapture
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__SBSRemoteDeviceReceiver__registerTriggerWiFiCoreCapture__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.TriggerWiFiCoreCapture" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __58__SBSRemoteDeviceReceiver__registerTriggerWiFiCoreCapture__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a4;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [WeakRetained delegate];
  uint64_t v9 = [v6 objectForKeyedSubscript:@"defaultKey"];

  [v8 triggerWiFiCoreCaptureInternal:v9];
  if (v10) {
    (*((void (**)(id, void, void, void))v10 + 2))(v10, MEMORY[0x263EFFA78], 0, 0);
  }
}

- (void)_deregisterRender
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.DebugInfoRender"];
}

- (void)_registerRender
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__SBSRemoteDeviceReceiver__registerRender__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.DebugInfoRender" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __42__SBSRemoteDeviceReceiver__registerRender__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a4;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [WeakRetained delegate];
  [v8 renderInternal:v6];

  if (v9) {
    (*((void (**)(id, void, void, void))v9 + 2))(v9, MEMORY[0x263EFFA78], 0, 0);
  }
}

- (void)_deregisterSendLEDCommand
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.DebugInfoSendLEDCommand"];
}

- (void)_registerSendLEDCommand
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__SBSRemoteDeviceReceiver__registerSendLEDCommand__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.DebugInfoSendLEDCommand" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __50__SBSRemoteDeviceReceiver__registerSendLEDCommand__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a4;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [WeakRetained delegate];
  id v9 = [v6 objectForKeyedSubscript:@"defaultKey"];

  [v8 sendLEDCommandInternal:v9];
  if (v10) {
    (*((void (**)(id, void, void, void))v10 + 2))(v10, MEMORY[0x263EFFA78], 0, 0);
  }
}

- (void)_deregisterResetUserDefault
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.DebugInfoResetUserDefault"];
}

- (void)_registerResetUserDefault
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__SBSRemoteDeviceReceiver__registerResetUserDefault__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.DebugInfoResetUserDefault" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __52__SBSRemoteDeviceReceiver__registerResetUserDefault__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a4;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [WeakRetained delegate];
  id v9 = [v6 objectForKeyedSubscript:@"defaultKey"];

  [v8 resetUserDefaultInternal:v9];
  if (v10) {
    (*((void (**)(id, void, void, void))v10 + 2))(v10, MEMORY[0x263EFFA78], 0, 0);
  }
}

- (void)_deregisterResetAllUserDefaults
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.DebugInfoResetAllUserDefaults"];
}

- (void)_registerResetAllUserDefaults
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__SBSRemoteDeviceReceiver__registerResetAllUserDefaults__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.DebugInfoResetAllUserDefaults" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __56__SBSRemoteDeviceReceiver__registerResetAllUserDefaults__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = [WeakRetained delegate];
  [v6 resetAllUserDefaultsInternal];

  if (v7) {
    (*((void (**)(id, void, void, void))v7 + 2))(v7, MEMORY[0x263EFFA78], 0, 0);
  }
}

- (void)_deregisterSetUserDefaults
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.DebugInfoSetUserDefaults"];
}

- (void)_registerSetUserDefaults
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__SBSRemoteDeviceReceiver__registerSetUserDefaults__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.DebugInfoSetUserDefaults" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __51__SBSRemoteDeviceReceiver__registerSetUserDefaults__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v11 = a4;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [WeakRetained delegate];
  id v9 = [v6 objectForKeyedSubscript:@"defaultKey"];
  id v10 = [v6 objectForKeyedSubscript:@"withValue"];

  [v8 setUserDefaultsInternal:v9 withValue:v10];
  if (v11) {
    (*((void (**)(id, void, void, void))v11 + 2))(v11, MEMORY[0x263EFFA78], 0, 0);
  }
}

- (void)_deregisterGetUserDefaults
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.DebugInfoGetUserDefaults"];
}

- (void)_registerGetUserDefaults
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__SBSRemoteDeviceReceiver__registerGetUserDefaults__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.DebugInfoGetUserDefaults" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __51__SBSRemoteDeviceReceiver__registerGetUserDefaults__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = [WeakRetained delegate];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __51__SBSRemoteDeviceReceiver__registerGetUserDefaults__block_invoke_2;
  v9[3] = &unk_264BA44D8;
  id v10 = v5;
  id v8 = v5;
  [v7 getUserDefaultsInternal:v9];
}

void __51__SBSRemoteDeviceReceiver__registerGetUserDefaults__block_invoke_2(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v6 = @"reply";
    v7[0] = a2;
    uint64_t v3 = NSDictionary;
    id v4 = a2;
    id v5 = [v3 dictionaryWithObjects:v7 forKeys:&v6 count:1];
    (*(void (**)(uint64_t, void *, void, void))(v2 + 16))(v2, v5, 0, 0);
  }
}

- (void)_deregisterStopTone
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.DebugInfoStopTone"];
}

- (void)_registerStopTone
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__SBSRemoteDeviceReceiver__registerStopTone__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.DebugInfoStopTone" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __44__SBSRemoteDeviceReceiver__registerStopTone__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a4;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [WeakRetained delegate];
  id v9 = [v6 objectForKeyedSubscript:@"tone"];

  objc_msgSend(v8, "stopToneInternal:", objc_msgSend(v9, "integerValue"));
  if (v10) {
    (*((void (**)(id, void, void, void))v10 + 2))(v10, MEMORY[0x263EFFA78], 0, 0);
  }
}

- (void)_deregisterPlayTone
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.DebugInfoPlayTone"];
}

- (void)_registerPlayTone
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__SBSRemoteDeviceReceiver__registerPlayTone__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.DebugInfoPlayTone" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __44__SBSRemoteDeviceReceiver__registerPlayTone__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a4;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [WeakRetained delegate];
  id v9 = [v6 objectForKeyedSubscript:@"tone"];

  objc_msgSend(v8, "playToneInternal:", objc_msgSend(v9, "integerValue"));
  if (v10) {
    (*((void (**)(id, void, void, void))v10 + 2))(v10, MEMORY[0x263EFFA78], 0, 0);
  }
}

- (void)_deregisterSetTuningInfoOnBox
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.DebugInfoSetTuningInfoOnBox"];
}

- (void)_registerSetTuningInfoOnBox
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__SBSRemoteDeviceReceiver__registerSetTuningInfoOnBox__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.DebugInfoSetTuningInfoOnBox" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __54__SBSRemoteDeviceReceiver__registerSetTuningInfoOnBox__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v12 = a4;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [WeakRetained delegate];
  id v9 = [v6 objectForKeyedSubscript:@"box"];
  id v10 = [v6 objectForKeyedSubscript:@"at"];
  id v11 = [v6 objectForKeyedSubscript:@"withValue"];

  [v11 floatValue];
  objc_msgSend(v8, "setTuningInfoOnBoxInternal:at:withValue:", v9, v10);

  if (v12) {
    (*((void (**)(id, void, void, void))v12 + 2))(v12, MEMORY[0x263EFFA78], 0, 0);
  }
}

- (void)_deregisterGetTuningInfo
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.DebugInfoGetTuningInfo"];
}

- (void)_registerGetTuningInfo
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__SBSRemoteDeviceReceiver__registerGetTuningInfo__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.DebugInfoGetTuningInfo" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __49__SBSRemoteDeviceReceiver__registerGetTuningInfo__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = [WeakRetained delegate];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __49__SBSRemoteDeviceReceiver__registerGetTuningInfo__block_invoke_2;
  v9[3] = &unk_264BA44D8;
  id v10 = v5;
  id v8 = v5;
  [v7 getTuningInfoInternal:v9];
}

void __49__SBSRemoteDeviceReceiver__registerGetTuningInfo__block_invoke_2(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v6 = @"reply";
    v7[0] = a2;
    uint64_t v3 = NSDictionary;
    id v4 = a2;
    id v5 = [v3 dictionaryWithObjects:v7 forKeys:&v6 count:1];
    (*(void (**)(uint64_t, void *, void, void))(v2 + 16))(v2, v5, 0, 0);
  }
}

- (void)_deregisterGetLEDInfo
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.DebugInfoGetLEDInfo"];
}

- (void)_registerGetLEDInfo
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__SBSRemoteDeviceReceiver__registerGetLEDInfo__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.DebugInfoGetLEDInfo" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __46__SBSRemoteDeviceReceiver__registerGetLEDInfo__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = [WeakRetained delegate];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __46__SBSRemoteDeviceReceiver__registerGetLEDInfo__block_invoke_2;
  v9[3] = &unk_264BA44D8;
  id v10 = v5;
  id v8 = v5;
  [v7 getLEDInfoInternal:v9];
}

void __46__SBSRemoteDeviceReceiver__registerGetLEDInfo__block_invoke_2(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v6 = @"reply";
    v7[0] = a2;
    uint64_t v3 = NSDictionary;
    id v4 = a2;
    id v5 = [v3 dictionaryWithObjects:v7 forKeys:&v6 count:1];
    (*(void (**)(uint64_t, void *, void, void))(v2 + 16))(v2, v5, 0, 0);
  }
}

- (void)_deregisterGetSelectDebugInfo
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.DebugInfoGetSelectDebugInfo"];
}

- (void)_registerGetSelectDebugInfo
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__SBSRemoteDeviceReceiver__registerGetSelectDebugInfo__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.DebugInfoGetSelectDebugInfo" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __54__SBSRemoteDeviceReceiver__registerGetSelectDebugInfo__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = [WeakRetained delegate];
  id v10 = [v7 objectForKeyedSubscript:@"keys"];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __54__SBSRemoteDeviceReceiver__registerGetSelectDebugInfo__block_invoke_2;
  v12[3] = &unk_264BA44D8;
  id v13 = v6;
  id v11 = v6;
  [v9 getSelectDebugInfoInternal:v10 reply:v12];
}

void __54__SBSRemoteDeviceReceiver__registerGetSelectDebugInfo__block_invoke_2(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v6 = @"reply";
    v7[0] = a2;
    uint64_t v3 = NSDictionary;
    id v4 = a2;
    id v5 = [v3 dictionaryWithObjects:v7 forKeys:&v6 count:1];
    (*(void (**)(uint64_t, void *, void, void))(v2 + 16))(v2, v5, 0, 0);
  }
}

- (void)_deregisterGetAllDebugInfo
{
  id v2 = [(SBSRemoteDeviceReceiver *)self client];
  [v2 deregisterRequestID:@"com.apple.sbs.DebugInfoGetAllDebugInfo"];
}

- (void)_registerGetAllDebugInfo
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SBSRemoteDeviceReceiver *)self client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__SBSRemoteDeviceReceiver__registerGetAllDebugInfo__block_invoke;
  v4[3] = &unk_264BA4500;
  objc_copyWeak(&v5, &location);
  [v3 registerRequestID:@"com.apple.sbs.DebugInfoGetAllDebugInfo" options:0 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __51__SBSRemoteDeviceReceiver__registerGetAllDebugInfo__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = [WeakRetained delegate];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __51__SBSRemoteDeviceReceiver__registerGetAllDebugInfo__block_invoke_2;
  v9[3] = &unk_264BA44D8;
  id v10 = v5;
  id v8 = v5;
  [v7 getAllDebugInfoInternal:v9];
}

void __51__SBSRemoteDeviceReceiver__registerGetAllDebugInfo__block_invoke_2(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v6 = @"reply";
    v7[0] = a2;
    uint64_t v3 = NSDictionary;
    id v4 = a2;
    id v5 = [v3 dictionaryWithObjects:v7 forKeys:&v6 count:1];
    (*(void (**)(uint64_t, void *, void, void))(v2 + 16))(v2, v5, 0, 0);
  }
}

- (void)_deregisterEverything
{
  [(SBSRemoteDeviceReceiver *)self _deregisterGetAllDebugInfo];
  [(SBSRemoteDeviceReceiver *)self _deregisterGetSelectDebugInfo];
  [(SBSRemoteDeviceReceiver *)self _deregisterGetLEDInfo];
  [(SBSRemoteDeviceReceiver *)self _deregisterGetTuningInfo];
  [(SBSRemoteDeviceReceiver *)self _deregisterSetTuningInfoOnBox];
  [(SBSRemoteDeviceReceiver *)self _deregisterPlayTone];
  [(SBSRemoteDeviceReceiver *)self _deregisterStopTone];
  [(SBSRemoteDeviceReceiver *)self _deregisterGetUserDefaults];
  [(SBSRemoteDeviceReceiver *)self _deregisterSetUserDefaults];
  [(SBSRemoteDeviceReceiver *)self _deregisterResetAllUserDefaults];
  [(SBSRemoteDeviceReceiver *)self _deregisterResetUserDefault];
  [(SBSRemoteDeviceReceiver *)self _deregisterSendLEDCommand];
  [(SBSRemoteDeviceReceiver *)self _deregisterRender];
  [(SBSRemoteDeviceReceiver *)self _deregisterTriggerWiFiCoreCapture];
  [(SBSRemoteDeviceReceiver *)self _deregisterSendButtonCommand];
  [(SBSRemoteDeviceReceiver *)self _deregisterInjectSWUpdateToHome];
  [(SBSRemoteDeviceReceiver *)self _deregisterSetHomeUpdateState];
  [(SBSRemoteDeviceReceiver *)self _deregisterClearHomeSWUpdate];
  [(SBSRemoteDeviceReceiver *)self _deregisterSetBootSpinner];
  [(SBSRemoteDeviceReceiver *)self _deregisterSetWifiEnabled];
  [(SBSRemoteDeviceReceiver *)self _deregisterDisassociateCurrentNetwork];
  [(SBSRemoteDeviceReceiver *)self _deregisterDisassociateNetworkWithName];
  [(SBSRemoteDeviceReceiver *)self _deregisterGetFeatureFlags];
  [(SBSRemoteDeviceReceiver *)self _deregisterSetFeatureFlags];
  [(SBSRemoteDeviceReceiver *)self _deregisterSetLEDContents];
  [(SBSRemoteDeviceReceiver *)self _deregisterSiriSay];
  [(SBSRemoteDeviceReceiver *)self _deregisterSUScanForSoftwareUpdate];
  [(SBSRemoteDeviceReceiver *)self _deregisterGetVolume];
  [(SBSRemoteDeviceReceiver *)self _deregisterSetVolume];
  [(SBSRemoteDeviceReceiver *)self _deregisterSetDeviceAsStereoLeader];
  [(SBSRemoteDeviceReceiver *)self _deregisterIsDeviceStereoFollower];
  [(SBSRemoteDeviceReceiver *)self _deregisterSysdiagnoseHasStarted];
  [(SBSRemoteDeviceReceiver *)self _deregisterReboot];
  [(SBSRemoteDeviceReceiver *)self _deregisterRequestDeferredReboot];
  [(SBSRemoteDeviceReceiver *)self _deregisterObliterate];
  [(SBSRemoteDeviceReceiver *)self _deregisterIdentifyWithOptions];
  [(SBSRemoteDeviceReceiver *)self _deregisterIntercomWithOptions];
  [(SBSRemoteDeviceReceiver *)self _deregisterRequestForFetchingAlarmsAndTimers];
  [(SBSRemoteDeviceReceiver *)self _deregisterGetPowerEstimateForInterval];
  [(SBSRemoteDeviceReceiver *)self _deregisterGetInstalledProfiles];
  [(SBSRemoteDeviceReceiver *)self _deregisterInstallProfileData];
  [(SBSRemoteDeviceReceiver *)self _deregisterRemoveProfileByIdentifier];
  [(SBSRemoteDeviceReceiver *)self _deregisterHandoffStart];
  [(SBSRemoteDeviceReceiver *)self _deregisterHandoffStartWithArtworkColors];
  [(SBSRemoteDeviceReceiver *)self _deregisterHandoffUpdateIntensity];
  [(SBSRemoteDeviceReceiver *)self _deregisterHandoffCancel];
  [(SBSRemoteDeviceReceiver *)self _deregisterHandoffComplete];
}

- (void)_registerEverything
{
  [(SBSRemoteDeviceReceiver *)self _registerGetAllDebugInfo];
  [(SBSRemoteDeviceReceiver *)self _registerGetSelectDebugInfo];
  [(SBSRemoteDeviceReceiver *)self _registerGetLEDInfo];
  [(SBSRemoteDeviceReceiver *)self _registerGetTuningInfo];
  [(SBSRemoteDeviceReceiver *)self _registerSetTuningInfoOnBox];
  [(SBSRemoteDeviceReceiver *)self _registerPlayTone];
  [(SBSRemoteDeviceReceiver *)self _registerStopTone];
  [(SBSRemoteDeviceReceiver *)self _registerGetUserDefaults];
  [(SBSRemoteDeviceReceiver *)self _registerSetUserDefaults];
  [(SBSRemoteDeviceReceiver *)self _registerResetAllUserDefaults];
  [(SBSRemoteDeviceReceiver *)self _registerResetUserDefault];
  [(SBSRemoteDeviceReceiver *)self _registerSendLEDCommand];
  [(SBSRemoteDeviceReceiver *)self _registerRender];
  [(SBSRemoteDeviceReceiver *)self _registerTriggerWiFiCoreCapture];
  [(SBSRemoteDeviceReceiver *)self _registerSendButtonCommand];
  [(SBSRemoteDeviceReceiver *)self _registerInjectSWUpdateToHome];
  [(SBSRemoteDeviceReceiver *)self _registerSetHomeUpdateState];
  [(SBSRemoteDeviceReceiver *)self _registerClearHomeSWUpdate];
  [(SBSRemoteDeviceReceiver *)self _registerSetBootSpinner];
  [(SBSRemoteDeviceReceiver *)self _registerSetWifiEnabled];
  [(SBSRemoteDeviceReceiver *)self _registerDisassociateCurrentNetwork];
  [(SBSRemoteDeviceReceiver *)self _registerDisassociateNetworkWithName];
  [(SBSRemoteDeviceReceiver *)self _registerGetFeatureFlags];
  [(SBSRemoteDeviceReceiver *)self _registerSetFeatureFlags];
  [(SBSRemoteDeviceReceiver *)self _registerSetLEDContents];
  [(SBSRemoteDeviceReceiver *)self _registerSiriSay];
  [(SBSRemoteDeviceReceiver *)self _registerSUScanForSoftwareUpdate];
  [(SBSRemoteDeviceReceiver *)self _registerGetVolume];
  [(SBSRemoteDeviceReceiver *)self _registerSetVolume];
  [(SBSRemoteDeviceReceiver *)self _registerSetDeviceAsStereoLeader];
  [(SBSRemoteDeviceReceiver *)self _registerIsDeviceStereoFollower];
  [(SBSRemoteDeviceReceiver *)self _registerSysdiagnoseHasStarted];
  [(SBSRemoteDeviceReceiver *)self _registerReboot];
  [(SBSRemoteDeviceReceiver *)self _registerRequestDeferredReboot];
  [(SBSRemoteDeviceReceiver *)self _registerObliterate];
  [(SBSRemoteDeviceReceiver *)self _registerIdentifyWithOptions];
  [(SBSRemoteDeviceReceiver *)self _registerIntercomWithOptions];
  [(SBSRemoteDeviceReceiver *)self _registerRequestForFetchingAlarmsAndTimers];
  [(SBSRemoteDeviceReceiver *)self _registerGetPowerEstimateForInterval];
  [(SBSRemoteDeviceReceiver *)self _registerGetInstalledProfiles];
  [(SBSRemoteDeviceReceiver *)self _registerInstallProfileData];
  [(SBSRemoteDeviceReceiver *)self _registerRemoveProfileByIdentifier];
  [(SBSRemoteDeviceReceiver *)self _registerHandoffStart];
  [(SBSRemoteDeviceReceiver *)self _registerHandoffStartWithArtworkColors];
  [(SBSRemoteDeviceReceiver *)self _registerHandoffUpdateIntensity];
  [(SBSRemoteDeviceReceiver *)self _registerHandoffCancel];
  [(SBSRemoteDeviceReceiver *)self _registerHandoffComplete];
}

- (void)dealloc
{
  [(SBSRemoteDeviceReceiver *)self _deregisterEverything];
  v3.receiver = self;
  v3.super_class = (Class)SBSRemoteDeviceReceiver;
  [(SBSRemoteDeviceReceiver *)&v3 dealloc];
}

- (SBSRemoteDeviceReceiver)initWithDelegate:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBSRemoteDeviceReceiver;
  id v5 = [(SBSRemoteDeviceReceiver *)&v13 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    id v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.soundboardservices.RapportMessageReceivingQueue", v7);
    id v9 = (RPCompanionLinkClient *)objc_alloc_init(MEMORY[0x263F62B70]);
    client = v6->_client;
    v6->_client = v9;

    [(RPCompanionLinkClient *)v6->_client setDispatchQueue:v8];
    [(RPCompanionLinkClient *)v6->_client setControlFlags:8196];
    id v11 = _SBSLoggingFacility();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v15 = "-[SBSRemoteDeviceReceiver initWithDelegate:]";
      _os_log_impl(&dword_230B2C000, v11, OS_LOG_TYPE_DEFAULT, "%s: companion link client start", buf, 0xCu);
    }

    kdebug_trace();
    [(RPCompanionLinkClient *)v6->_client activateWithCompletion:&__block_literal_global_1169];
    [(SBSRemoteDeviceReceiver *)v6 _registerEverything];
  }
  return v6;
}

void __44__SBSRemoteDeviceReceiver_initWithDelegate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = a2;
  kdebug_trace();
  objc_super v3 = _SBSLoggingFacility();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      id v6 = "-[SBSRemoteDeviceReceiver initWithDelegate:]_block_invoke";
      __int16 v7 = 2112;
      id v8 = v2;
      _os_log_error_impl(&dword_230B2C000, v4, OS_LOG_TYPE_ERROR, "%s: Error activating companion link client '%@'", (uint8_t *)&v5, 0x16u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[SBSRemoteDeviceReceiver initWithDelegate:]_block_invoke";
    _os_log_impl(&dword_230B2C000, v4, OS_LOG_TYPE_DEFAULT, "%s: companion link client activated succcessfully", (uint8_t *)&v5, 0xCu);
  }
}

@end