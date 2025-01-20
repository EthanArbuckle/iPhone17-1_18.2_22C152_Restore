@interface SBSRemoteDeviceSender
- (BOOL)isMediaAlarm:(id)a3;
- (NSString)destinationID;
- (OS_dispatch_queue)rapportQueue;
- (RPCompanionLinkClient)client;
- (SBSRemoteDeviceSender)initWithDevice:(id)a3;
- (void)airDropSysdiagnose:(id)a3 airDropID:(id)a4 completionHandler:(id)a5;
- (void)clearHomeSWUpdate;
- (void)createSysdiagnose:(id)a3;
- (void)disassociateCurrentNetwork;
- (void)disassociateNetworkWithName:(id)a3;
- (void)fetchLatestEvents:(int64_t)a3 completionHandler:(id)a4;
- (void)fetchLatestSignposts:(int64_t)a3 completionHandler:(id)a4;
- (void)getAllDebugInfo:(id)a3;
- (void)getAllSyncedAlarmsAndTimers:(id)a3;
- (void)getFeatureFlags:(id)a3;
- (void)getInstalledProfiles:(id)a3;
- (void)getLEDInfo:(id)a3;
- (void)getPowerEstimateForInterval:(float)a3 reply:(id)a4;
- (void)getSelectDebugInfo:(id)a3 reply:(id)a4;
- (void)getTuningInfo:(id)a3;
- (void)getUserDefaults:(id)a3;
- (void)getVolume:(id)a3;
- (void)handoffCancelWithHandoffType:(unint64_t)a3;
- (void)handoffCompleteWithHandoffType:(unint64_t)a3;
- (void)handoffStartWithArtworkColors:(id)a3 handoffType:(unint64_t)a4;
- (void)handoffStartWithHandoffType:(unint64_t)a3;
- (void)handoffUpdateIntensity:(float)a3 handoffType:(unint64_t)a4;
- (void)identifyWithOptions:(id)a3;
- (void)injectSWUpdateToHome:(id)a3;
- (void)installProfileData:(id)a3 completion:(id)a4;
- (void)intercomWithOptions:(id)a3;
- (void)isDeviceStereoFollower:(id)a3;
- (void)obliterate:(id)a3;
- (void)playTone:(unsigned int)a3;
- (void)reboot:(id)a3;
- (void)removeProfileByIdentifier:(id)a3 completion:(id)a4;
- (void)render:(id)a3;
- (void)requestDeferredReboot;
- (void)resetAllUserDefaults;
- (void)resetUserDefault:(id)a3;
- (void)sendButtonCommand:(id)a3;
- (void)sendLEDCommand:(id)a3;
- (void)setBootSpinner:(BOOL)a3;
- (void)setClient:(id)a3;
- (void)setDestinationID:(id)a3;
- (void)setDeviceAsStereoLeader:(BOOL)a3 withOptions:(id)a4;
- (void)setFeatureFlags:(id)a3;
- (void)setHomeUpdateState:(int64_t)a3;
- (void)setLEDContents:(id)a3;
- (void)setRapportQueue:(id)a3;
- (void)setTuningInfoOnBox:(id)a3 at:(id)a4 withValue:(float)a5;
- (void)setTurnOffBrightnessFactor:(BOOL)a3;
- (void)setUserDefaults:(id)a3 withValue:(id)a4;
- (void)setVolume:(float)a3;
- (void)setWifiEnabled:(BOOL)a3;
- (void)siriSay:(id)a3;
- (void)stopTone:(unsigned int)a3;
- (void)suScanForSoftwareUpdate;
- (void)sysdiagnoseHasStarted:(BOOL)a3;
- (void)triggerWiFiCoreCapture:(id)a3;
@end

@implementation SBSRemoteDeviceSender

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationID, 0);
  objc_storeStrong((id *)&self->_rapportQueue, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

- (void)setDestinationID:(id)a3
{
}

- (NSString)destinationID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRapportQueue:(id)a3
{
}

- (OS_dispatch_queue)rapportQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setClient:(id)a3
{
}

- (RPCompanionLinkClient)client
{
  return (RPCompanionLinkClient *)objc_getProperty(self, a2, 8, 1);
}

- (void)fetchLatestEvents:(int64_t)a3 completionHandler:(id)a4
{
}

- (void)airDropSysdiagnose:(id)a3 airDropID:(id)a4 completionHandler:(id)a5
{
}

- (void)removeProfileByIdentifier:(id)a3 completion:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  v8 = [(SBSRemoteDeviceSender *)self client];
  v14 = @"identifier";
  v15[0] = v7;
  v9 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v10 = [(SBSRemoteDeviceSender *)self destinationID];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__SBSRemoteDeviceSender_removeProfileByIdentifier_completion___block_invoke;
  v12[3] = &unk_264BA4448;
  id v13 = v6;
  id v11 = v6;
  [v8 sendRequestID:@"com.apple.sbs.RemoveProfileByIdentifier" request:v9 destinationID:v10 options:MEMORY[0x263EFFA78] responseHandler:v12];
}

void __62__SBSRemoteDeviceSender_removeProfileByIdentifier_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v8 = a2;
  if (a4)
  {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
  }
  else
  {
    NSLog(&cfstr_CompanionSentC.isa);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [v8 objectForKeyedSubscript:@"error"];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
}

- (void)installProfileData:(id)a3 completion:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBSRemoteDeviceSender *)self client];
  v14 = @"profileData";
  v15[0] = v7;
  v9 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v10 = [(SBSRemoteDeviceSender *)self destinationID];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __55__SBSRemoteDeviceSender_installProfileData_completion___block_invoke;
  v12[3] = &unk_264BA4448;
  id v13 = v6;
  id v11 = v6;
  [v8 sendRequestID:@"com.apple.sbs.InstallProfileData" request:v9 destinationID:v10 options:MEMORY[0x263EFFA78] responseHandler:v12];
}

void __55__SBSRemoteDeviceSender_installProfileData_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v8 = a2;
  if (a4)
  {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
  }
  else
  {
    NSLog(&cfstr_CompanionSentC.isa);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [v8 objectForKeyedSubscript:@"error"];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
}

- (void)getInstalledProfiles:(id)a3
{
  id v4 = a3;
  v5 = [(SBSRemoteDeviceSender *)self client];
  uint64_t v6 = [(SBSRemoteDeviceSender *)self destinationID];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__SBSRemoteDeviceSender_getInstalledProfiles___block_invoke;
  v8[3] = &unk_264BA4448;
  id v9 = v4;
  id v7 = v4;
  [v5 sendRequestID:@"com.apple.sbs.GetInstalledProfiles" request:MEMORY[0x263EFFA78] destinationID:v6 options:MEMORY[0x263EFFA78] responseHandler:v8];
}

void __46__SBSRemoteDeviceSender_getInstalledProfiles___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v8 = a2;
  if (a4)
  {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
  }
  else
  {
    NSLog(&cfstr_CompanionSentC.isa);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [v8 objectForKeyedSubscript:@"reply"];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
}

- (void)getPowerEstimateForInterval:(float)a3 reply:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(SBSRemoteDeviceSender *)self client];
  v15 = @"interval";
  *(float *)&double v8 = a3;
  id v9 = [NSNumber numberWithFloat:v8];
  v16[0] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
  id v11 = [(SBSRemoteDeviceSender *)self destinationID];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__SBSRemoteDeviceSender_getPowerEstimateForInterval_reply___block_invoke;
  v13[3] = &unk_264BA4448;
  id v14 = v6;
  id v12 = v6;
  [v7 sendRequestID:@"com.apple.sbs.GetPowerEstimateForInterval" request:v10 destinationID:v11 options:MEMORY[0x263EFFA78] responseHandler:v13];
}

void __59__SBSRemoteDeviceSender_getPowerEstimateForInterval_reply___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v12 = a2;
  if (a4)
  {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
    (*(void (**)(double, double))(*(void *)(a1 + 32) + 16))(0.0, 0.0);
  }
  else
  {
    NSLog(&cfstr_CompanionSentC.isa);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [v12 objectForKeyedSubscript:@"joulesEstimate"];
    [v7 floatValue];
    float v9 = v8;
    v10 = [v12 objectForKeyedSubscript:@"period"];
    [v10 floatValue];
    (*(void (**)(uint64_t, float, float))(v6 + 16))(v6, v9, v11);
  }
}

- (BOOL)isMediaAlarm:(id)a3
{
  return 0;
}

- (void)getAllSyncedAlarmsAndTimers:(id)a3
{
  id v4 = a3;
  v5 = [(SBSRemoteDeviceSender *)self client];
  uint64_t v6 = [(SBSRemoteDeviceSender *)self destinationID];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__SBSRemoteDeviceSender_getAllSyncedAlarmsAndTimers___block_invoke;
  v8[3] = &unk_264BA4448;
  id v9 = v4;
  id v7 = v4;
  [v5 sendRequestID:@"com.apple.sbs.SystemRequestFetchAlarmsAndTimers" request:MEMORY[0x263EFFA78] destinationID:v6 options:MEMORY[0x263EFFA78] responseHandler:v8];
}

void __53__SBSRemoteDeviceSender_getAllSyncedAlarmsAndTimers___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v8 = a2;
  if (a4)
  {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
  }
  else
  {
    NSLog(&cfstr_CompanionSentC.isa);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [v8 objectForKeyedSubscript:@"reply"];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
}

- (void)setTurnOffBrightnessFactor:(BOOL)a3
{
}

- (void)intercomWithOptions:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(SBSRemoteDeviceSender *)self client];
  id v8 = @"options";
  v9[0] = v4;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  id v7 = [(SBSRemoteDeviceSender *)self destinationID];
  [v5 sendRequestID:@"com.apple.sbs.Intercom" request:v6 destinationID:v7 options:MEMORY[0x263EFFA78] responseHandler:&__block_literal_global_159];
}

void __45__SBSRemoteDeviceSender_intercomWithOptions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
  }
  else {
    NSLog(&cfstr_CompanionSentC.isa);
  }
}

- (void)identifyWithOptions:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(SBSRemoteDeviceSender *)self client];
  id v8 = @"options";
  v9[0] = v4;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  id v7 = [(SBSRemoteDeviceSender *)self destinationID];
  [v5 sendRequestID:@"com.apple.sbs.Identify" request:v6 destinationID:v7 options:MEMORY[0x263EFFA78] responseHandler:&__block_literal_global_157];
}

void __45__SBSRemoteDeviceSender_identifyWithOptions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
  }
  else {
    NSLog(&cfstr_CompanionSentC.isa);
  }
}

- (void)obliterate:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(SBSRemoteDeviceSender *)self client];
  id v8 = @"options";
  v9[0] = v4;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  id v7 = [(SBSRemoteDeviceSender *)self destinationID];
  [v5 sendRequestID:@"com.apple.sbs.Obliterate" request:v6 destinationID:v7 options:MEMORY[0x263EFFA78] responseHandler:&__block_literal_global_155];
}

void __36__SBSRemoteDeviceSender_obliterate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
  }
  else {
    NSLog(&cfstr_CompanionSentC.isa);
  }
}

- (void)requestDeferredReboot
{
  id v4 = [(SBSRemoteDeviceSender *)self client];
  v3 = [(SBSRemoteDeviceSender *)self destinationID];
  [v4 sendRequestID:@"com.apple.sbs.SystemRequestDeferredReboot" request:MEMORY[0x263EFFA78] destinationID:v3 options:MEMORY[0x263EFFA78] responseHandler:&__block_literal_global_153];
}

void __46__SBSRemoteDeviceSender_requestDeferredReboot__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
  }
  else {
    NSLog(&cfstr_CompanionSentC.isa);
  }
}

- (void)reboot:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(SBSRemoteDeviceSender *)self client];
  id v8 = @"options";
  v9[0] = v4;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  id v7 = [(SBSRemoteDeviceSender *)self destinationID];
  [v5 sendRequestID:@"com.apple.sbs.SystemReboot" request:v6 destinationID:v7 options:MEMORY[0x263EFFA78] responseHandler:&__block_literal_global_151];
}

void __32__SBSRemoteDeviceSender_reboot___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
  }
  else {
    NSLog(&cfstr_CompanionSentC.isa);
  }
}

- (void)createSysdiagnose:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  (*((void (**)(id, id, void))a3 + 2))(v4, v5, 0);
}

- (void)sysdiagnoseHasStarted:(BOOL)a3
{
  BOOL v3 = a3;
  v10[1] = *MEMORY[0x263EF8340];
  id v5 = [(SBSRemoteDeviceSender *)self client];
  id v9 = @"started";
  uint64_t v6 = [NSNumber numberWithBool:v3];
  v10[0] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v8 = [(SBSRemoteDeviceSender *)self destinationID];
  [v5 sendRequestID:@"com.apple.sbs.SysdiagnoseSysdiagnoseHasStarted" request:v7 destinationID:v8 options:MEMORY[0x263EFFA78] responseHandler:&__block_literal_global_145];
}

void __47__SBSRemoteDeviceSender_sysdiagnoseHasStarted___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
  }
  else {
    NSLog(&cfstr_CompanionSentC.isa);
  }
}

- (void)isDeviceStereoFollower:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSRemoteDeviceSender *)self client];
  uint64_t v6 = [(SBSRemoteDeviceSender *)self destinationID];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__SBSRemoteDeviceSender_isDeviceStereoFollower___block_invoke;
  v8[3] = &unk_264BA4448;
  id v9 = v4;
  id v7 = v4;
  [v5 sendRequestID:@"com.apple.sbs.StereoLeaderRoleIsDeviceStereoFollower" request:MEMORY[0x263EFFA78] destinationID:v6 options:MEMORY[0x263EFFA78] responseHandler:v8];
}

void __48__SBSRemoteDeviceSender_isDeviceStereoFollower___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  uint64_t v6 = [a2 objectForKey:@"reply"];
  if (v7 || !v6)
  {
    NSLog(&cfstr_FailedToReceiv.isa, v7);
    (*(void (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0);
  }
  else
  {
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v6 BOOLValue]);
  }
}

- (void)setDeviceAsStereoLeader:(BOOL)a3 withOptions:(id)a4
{
  BOOL v4 = a3;
  v12[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(SBSRemoteDeviceSender *)self client];
  v11[0] = @"enabled";
  id v8 = [NSNumber numberWithBool:v4];
  v11[1] = @"withOptions";
  v12[0] = v8;
  v12[1] = v6;
  id v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

  v10 = [(SBSRemoteDeviceSender *)self destinationID];
  [v7 sendRequestID:@"com.apple.sbs.StereoLeaderRoleSetDeviceAsStereoLeader" request:v9 destinationID:v10 options:MEMORY[0x263EFFA78] responseHandler:&__block_literal_global_137];
}

void __61__SBSRemoteDeviceSender_setDeviceAsStereoLeader_withOptions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
  }
  else {
    NSLog(&cfstr_CompanionSentC.isa);
  }
}

- (void)handoffCompleteWithHandoffType:(unint64_t)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v8 = @"handoffType";
  BOOL v4 = [NSNumber numberWithUnsignedInteger:a3];
  v9[0] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  id v6 = [(SBSRemoteDeviceSender *)self client];
  id v7 = [(SBSRemoteDeviceSender *)self destinationID];
  [v6 sendRequestID:@"com.apple.sbs.kSBSProximityHandoffUICompleteKey" request:v5 destinationID:v7 options:MEMORY[0x263EFFA78] responseHandler:&__block_literal_global_123];
}

void __56__SBSRemoteDeviceSender_handoffCompleteWithHandoffType___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    NSLog(&cfstr_ErrorSendingKs_0.isa, a4);
  }
  else {
    NSLog(&cfstr_Ksbsproximityh_0.isa);
  }
}

- (void)handoffCancelWithHandoffType:(unint64_t)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v8 = @"handoffType";
  BOOL v4 = [NSNumber numberWithUnsignedInteger:a3];
  v9[0] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  id v6 = [(SBSRemoteDeviceSender *)self client];
  id v7 = [(SBSRemoteDeviceSender *)self destinationID];
  [v6 sendRequestID:@"com.apple.sbs.kSBSProximityHandoffUICancelKey" request:v5 destinationID:v7 options:MEMORY[0x263EFFA78] responseHandler:&__block_literal_global_115];
}

void __54__SBSRemoteDeviceSender_handoffCancelWithHandoffType___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    NSLog(&cfstr_ErrorSendingKs.isa, a4);
  }
  else {
    NSLog(&cfstr_Ksbsproximityh.isa);
  }
}

- (void)handoffUpdateIntensity:(float)a3 handoffType:(unint64_t)a4
{
  v13[2] = *MEMORY[0x263EF8340];
  v12[0] = @"handoffType";
  id v6 = [NSNumber numberWithUnsignedInteger:a4];
  v12[1] = @"intensity";
  v13[0] = v6;
  *(float *)&double v7 = a3;
  id v8 = [NSNumber numberWithFloat:v7];
  v13[1] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

  v10 = [(SBSRemoteDeviceSender *)self client];
  float v11 = [(SBSRemoteDeviceSender *)self destinationID];
  [v10 sendRequestID:@"com.apple.sbs.kSBSProximityHandoffUIUpdateIntensityKey" request:v9 destinationID:v11 options:MEMORY[0x263EFFA78] responseHandler:&__block_literal_global_107];
}

void __60__SBSRemoteDeviceSender_handoffUpdateIntensity_handoffType___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    NSLog(&cfstr_ErrorSendingPr_1.isa, a4);
  }
  else {
    NSLog(&cfstr_Proximityhando_2.isa);
  }
}

- (void)handoffStartWithArtworkColors:(id)a3 handoffType:(unint64_t)a4
{
  v19[2] = *MEMORY[0x263EF8340];
  uint64_t v6 = [a3 data];
  double v7 = (void *)v6;
  if (v6)
  {
    v18[0] = @"artworkColors";
    v18[1] = @"handoffType";
    v19[0] = v6;
    id v8 = [NSNumber numberWithUnsignedInteger:a4];
    v19[1] = v8;
    id v9 = NSDictionary;
    v10 = (void **)v19;
    float v11 = (__CFString **)v18;
    uint64_t v12 = 2;
  }
  else
  {
    v16 = @"handoffType";
    id v8 = [NSNumber numberWithUnsignedInteger:a4];
    v17 = v8;
    id v9 = NSDictionary;
    v10 = &v17;
    float v11 = &v16;
    uint64_t v12 = 1;
  }
  id v13 = [v9 dictionaryWithObjects:v10 forKeys:v11 count:v12];

  id v14 = [(SBSRemoteDeviceSender *)self client];
  v15 = [(SBSRemoteDeviceSender *)self destinationID];
  [v14 sendRequestID:@"com.apple.sbs.kSBSProximityHandoffUIStartWithArtworkColorsKey" request:v13 destinationID:v15 options:MEMORY[0x263EFFA78] responseHandler:&__block_literal_global_99];
}

void __67__SBSRemoteDeviceSender_handoffStartWithArtworkColors_handoffType___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    NSLog(&cfstr_ErrorSendingPr_0.isa, a4);
  }
  else {
    NSLog(&cfstr_Proximityhando_1.isa);
  }
}

- (void)handoffStartWithHandoffType:(unint64_t)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v8 = @"handoffType";
  BOOL v4 = [NSNumber numberWithUnsignedInteger:a3];
  v9[0] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  uint64_t v6 = [(SBSRemoteDeviceSender *)self client];
  double v7 = [(SBSRemoteDeviceSender *)self destinationID];
  [v6 sendRequestID:@"com.apple.sbs.kSBSProximityHandoffUIStartKey" request:v5 destinationID:v7 options:MEMORY[0x263EFFA78] responseHandler:&__block_literal_global_91];
}

void __53__SBSRemoteDeviceSender_handoffStartWithHandoffType___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    NSLog(&cfstr_ErrorSendingPr.isa, a4);
  }
  else {
    NSLog(&cfstr_Proximityhando_0.isa);
  }
}

- (void)fetchLatestSignposts:(int64_t)a3 completionHandler:(id)a4
{
}

- (void)render:(id)a3
{
  id v4 = a3;
  id v6 = [(SBSRemoteDeviceSender *)self client];
  id v5 = [(SBSRemoteDeviceSender *)self destinationID];
  [v6 sendRequestID:@"com.apple.sbs.DebugInfoRender" request:v4 destinationID:v5 options:MEMORY[0x263EFFA78] responseHandler:&__block_literal_global_86];
}

void __32__SBSRemoteDeviceSender_render___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
  }
  else {
    NSLog(&cfstr_CompanionSentC.isa);
  }
}

- (void)setVolume:(float)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v5 = [(SBSRemoteDeviceSender *)self client];
  v10 = @"volume";
  *(float *)&double v6 = a3;
  double v7 = [NSNumber numberWithFloat:v6];
  v11[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v9 = [(SBSRemoteDeviceSender *)self destinationID];
  [v5 sendRequestID:@"com.apple.sbs.DebugInfoSetVolume" request:v8 destinationID:v9 options:MEMORY[0x263EFFA78] responseHandler:&__block_literal_global_84];
}

void __35__SBSRemoteDeviceSender_setVolume___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
  }
  else {
    NSLog(&cfstr_CompanionSentC.isa);
  }
}

- (void)getVolume:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSRemoteDeviceSender *)self client];
  double v6 = [(SBSRemoteDeviceSender *)self destinationID];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __35__SBSRemoteDeviceSender_getVolume___block_invoke;
  v8[3] = &unk_264BA4448;
  id v9 = v4;
  id v7 = v4;
  [v5 sendRequestID:@"com.apple.sbs.DebugInfoGetVolume" request:MEMORY[0x263EFFA78] destinationID:v6 options:MEMORY[0x263EFFA78] responseHandler:v8];
}

void __35__SBSRemoteDeviceSender_getVolume___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v8 = a2;
  if (a4)
  {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
    (*(void (**)(double))(*(void *)(a1 + 32) + 16))(0.0);
  }
  else
  {
    NSLog(&cfstr_CompanionSentC.isa);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [v8 objectForKeyedSubscript:@"reply"];
    [v7 floatValue];
    (*(void (**)(uint64_t))(v6 + 16))(v6);
  }
}

- (void)suScanForSoftwareUpdate
{
  id v4 = [(SBSRemoteDeviceSender *)self client];
  BOOL v3 = [(SBSRemoteDeviceSender *)self destinationID];
  [v4 sendRequestID:@"com.apple.sbs.DebugInfoSUScanForSoftwareUpdate" request:MEMORY[0x263EFFA78] destinationID:v3 options:MEMORY[0x263EFFA78] responseHandler:&__block_literal_global_79];
}

void __48__SBSRemoteDeviceSender_suScanForSoftwareUpdate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
  }
  else {
    NSLog(&cfstr_CompanionSentC.isa);
  }
}

- (void)siriSay:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SBSRemoteDeviceSender *)self client];
  id v8 = @"phrase";
  v9[0] = v4;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  id v7 = [(SBSRemoteDeviceSender *)self destinationID];
  [v5 sendRequestID:@"com.apple.sbs.DebugInfoSiriSay" request:v6 destinationID:v7 options:MEMORY[0x263EFFA78] responseHandler:&__block_literal_global_77];
}

void __33__SBSRemoteDeviceSender_siriSay___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
  }
  else {
    NSLog(&cfstr_CompanionSentC.isa);
  }
}

- (void)setLEDContents:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SBSRemoteDeviceSender *)self client];
  id v8 = @"LEDContents";
  v9[0] = v4;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  id v7 = [(SBSRemoteDeviceSender *)self destinationID];
  [v5 sendRequestID:@"com.apple.sbs.DebugInfoSetLEDContents" request:v6 destinationID:v7 options:MEMORY[0x263EFFA78] responseHandler:&__block_literal_global_72];
}

void __40__SBSRemoteDeviceSender_setLEDContents___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
  }
  else {
    NSLog(&cfstr_CompanionSentC.isa);
  }
}

- (void)setFeatureFlags:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SBSRemoteDeviceSender *)self client];
  id v8 = @"featureFlags";
  v9[0] = v4;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  id v7 = [(SBSRemoteDeviceSender *)self destinationID];
  [v5 sendRequestID:@"com.apple.sbs.DebugInfoSetFeatureFlags" request:v6 destinationID:v7 options:MEMORY[0x263EFFA78] responseHandler:&__block_literal_global_67];
}

void __41__SBSRemoteDeviceSender_setFeatureFlags___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
  }
  else {
    NSLog(&cfstr_CompanionSentC.isa);
  }
}

- (void)getFeatureFlags:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSRemoteDeviceSender *)self client];
  uint64_t v6 = [(SBSRemoteDeviceSender *)self destinationID];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__SBSRemoteDeviceSender_getFeatureFlags___block_invoke;
  v8[3] = &unk_264BA4448;
  id v9 = v4;
  id v7 = v4;
  [v5 sendRequestID:@"com.apple.sbs.DebugInfoGetFeatureFlags" request:MEMORY[0x263EFFA78] destinationID:v6 options:MEMORY[0x263EFFA78] responseHandler:v8];
}

void __41__SBSRemoteDeviceSender_getFeatureFlags___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v8 = a2;
  if (a4)
  {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    NSLog(&cfstr_CompanionSentC.isa);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [v8 objectForKeyedSubscript:@"reply"];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
}

- (void)disassociateNetworkWithName:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SBSRemoteDeviceSender *)self client];
  id v8 = @"defaultKey";
  v9[0] = v4;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  id v7 = [(SBSRemoteDeviceSender *)self destinationID];
  [v5 sendRequestID:@"com.apple.sbs.DebugInfoDisassociateNetworkWithName" request:v6 destinationID:v7 options:MEMORY[0x263EFFA78] responseHandler:&__block_literal_global_62];
}

void __53__SBSRemoteDeviceSender_disassociateNetworkWithName___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
  }
  else {
    NSLog(&cfstr_CompanionSentC.isa);
  }
}

- (void)disassociateCurrentNetwork
{
  id v4 = [(SBSRemoteDeviceSender *)self client];
  BOOL v3 = [(SBSRemoteDeviceSender *)self destinationID];
  [v4 sendRequestID:@"com.apple.sbs.DebugInfoDisassociateCurrentNetwork" request:MEMORY[0x263EFFA78] destinationID:v3 options:MEMORY[0x263EFFA78] responseHandler:&__block_literal_global_60];
}

void __51__SBSRemoteDeviceSender_disassociateCurrentNetwork__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
  }
  else {
    NSLog(&cfstr_CompanionSentC.isa);
  }
}

- (void)setWifiEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v10[1] = *MEMORY[0x263EF8340];
  id v5 = [(SBSRemoteDeviceSender *)self client];
  id v9 = @"defaultKey";
  uint64_t v6 = [NSNumber numberWithBool:v3];
  v10[0] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v8 = [(SBSRemoteDeviceSender *)self destinationID];
  [v5 sendRequestID:@"com.apple.sbs.DebugInfoSetWifiEnabled" request:v7 destinationID:v8 options:MEMORY[0x263EFFA78] responseHandler:&__block_literal_global_58];
}

void __40__SBSRemoteDeviceSender_setWifiEnabled___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
  }
  else {
    NSLog(&cfstr_CompanionSentC.isa);
  }
}

- (void)setBootSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  v10[1] = *MEMORY[0x263EF8340];
  id v5 = [(SBSRemoteDeviceSender *)self client];
  id v9 = @"defaultKey";
  uint64_t v6 = [NSNumber numberWithBool:v3];
  v10[0] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v8 = [(SBSRemoteDeviceSender *)self destinationID];
  [v5 sendRequestID:@"com.apple.sbs.DebugInfoSetBootSpinner" request:v7 destinationID:v8 options:MEMORY[0x263EFFA78] responseHandler:&__block_literal_global_56];
}

void __40__SBSRemoteDeviceSender_setBootSpinner___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
  }
  else {
    NSLog(&cfstr_CompanionSentC.isa);
  }
}

- (void)clearHomeSWUpdate
{
  id v4 = [(SBSRemoteDeviceSender *)self client];
  BOOL v3 = [(SBSRemoteDeviceSender *)self destinationID];
  [v4 sendRequestID:@"com.apple.sbs.DebugInfoSetHomeUpdateState" request:MEMORY[0x263EFFA78] destinationID:v3 options:MEMORY[0x263EFFA78] responseHandler:&__block_literal_global_54];
}

void __42__SBSRemoteDeviceSender_clearHomeSWUpdate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
  }
  else {
    NSLog(&cfstr_CompanionSentC.isa);
  }
}

- (void)setHomeUpdateState:(int64_t)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v5 = [(SBSRemoteDeviceSender *)self client];
  id v9 = @"state";
  uint64_t v6 = [NSNumber numberWithInteger:a3];
  v10[0] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v8 = [(SBSRemoteDeviceSender *)self destinationID];
  [v5 sendRequestID:@"com.apple.sbs.DebugInfoSetHomeUpdateState" request:v7 destinationID:v8 options:MEMORY[0x263EFFA78] responseHandler:&__block_literal_global_52];
}

void __44__SBSRemoteDeviceSender_setHomeUpdateState___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
  }
  else {
    NSLog(&cfstr_CompanionSentC.isa);
  }
}

- (void)injectSWUpdateToHome:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SBSRemoteDeviceSender *)self client];
  id v8 = @"defaultKey";
  v9[0] = v4;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  id v7 = [(SBSRemoteDeviceSender *)self destinationID];
  [v5 sendRequestID:@"com.apple.sbs.DebugInfoInjectSWUpdateToHome" request:v6 destinationID:v7 options:MEMORY[0x263EFFA78] responseHandler:&__block_literal_global_47];
}

void __46__SBSRemoteDeviceSender_injectSWUpdateToHome___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
  }
  else {
    NSLog(&cfstr_CompanionSentC.isa);
  }
}

- (void)sendButtonCommand:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SBSRemoteDeviceSender *)self client];
  id v8 = @"defaultKey";
  v9[0] = v4;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  id v7 = [(SBSRemoteDeviceSender *)self destinationID];
  [v5 sendRequestID:@"com.apple.sbs.DebugInfoSendButtonCommand" request:v6 destinationID:v7 options:MEMORY[0x263EFFA78] responseHandler:&__block_literal_global_45];
}

void __43__SBSRemoteDeviceSender_sendButtonCommand___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
  }
  else {
    NSLog(&cfstr_CompanionSentC.isa);
  }
}

- (void)triggerWiFiCoreCapture:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SBSRemoteDeviceSender *)self client];
  id v8 = @"defaultKey";
  v9[0] = v4;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  id v7 = [(SBSRemoteDeviceSender *)self destinationID];
  [v5 sendRequestID:@"com.apple.sbs.TriggerWiFiCoreCapture" request:v6 destinationID:v7 options:MEMORY[0x263EFFA78] responseHandler:&__block_literal_global_43];
}

void __48__SBSRemoteDeviceSender_triggerWiFiCoreCapture___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
  }
  else {
    NSLog(&cfstr_CompanionSentC.isa);
  }
}

- (void)sendLEDCommand:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SBSRemoteDeviceSender *)self client];
  id v8 = @"defaultKey";
  v9[0] = v4;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  id v7 = [(SBSRemoteDeviceSender *)self destinationID];
  [v5 sendRequestID:@"com.apple.sbs.DebugInfoSendLEDCommand" request:v6 destinationID:v7 options:MEMORY[0x263EFFA78] responseHandler:&__block_literal_global_41];
}

void __40__SBSRemoteDeviceSender_sendLEDCommand___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
  }
  else {
    NSLog(&cfstr_CompanionSentC.isa);
  }
}

- (void)resetUserDefault:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SBSRemoteDeviceSender *)self client];
  id v8 = @"defaultKey";
  v9[0] = v4;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  id v7 = [(SBSRemoteDeviceSender *)self destinationID];
  [v5 sendRequestID:@"com.apple.sbs.DebugInfoResetUserDefault" request:v6 destinationID:v7 options:MEMORY[0x263EFFA78] responseHandler:&__block_literal_global_39];
}

void __42__SBSRemoteDeviceSender_resetUserDefault___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
  }
  else {
    NSLog(&cfstr_CompanionSentC.isa);
  }
}

- (void)resetAllUserDefaults
{
  id v4 = [(SBSRemoteDeviceSender *)self client];
  BOOL v3 = [(SBSRemoteDeviceSender *)self destinationID];
  [v4 sendRequestID:@"com.apple.sbs.DebugInfoResetAllUserDefaults" request:MEMORY[0x263EFFA78] destinationID:v3 options:MEMORY[0x263EFFA78] responseHandler:&__block_literal_global_37];
}

void __45__SBSRemoteDeviceSender_resetAllUserDefaults__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
  }
  else {
    NSLog(&cfstr_CompanionSentC.isa);
  }
}

- (void)setUserDefaults:(id)a3 withValue:(id)a4
{
  void v12[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBSRemoteDeviceSender *)self client];
  v11[0] = @"defaultKey";
  v11[1] = @"withValue";
  v12[0] = v7;
  v12[1] = v6;
  id v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

  v10 = [(SBSRemoteDeviceSender *)self destinationID];
  [v8 sendRequestID:@"com.apple.sbs.DebugInfoSetUserDefaults" request:v9 destinationID:v10 options:MEMORY[0x263EFFA78] responseHandler:&__block_literal_global_35];
}

void __51__SBSRemoteDeviceSender_setUserDefaults_withValue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
  }
  else {
    NSLog(&cfstr_CompanionSentC.isa);
  }
}

- (void)getUserDefaults:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSRemoteDeviceSender *)self client];
  id v6 = [(SBSRemoteDeviceSender *)self destinationID];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__SBSRemoteDeviceSender_getUserDefaults___block_invoke;
  v8[3] = &unk_264BA4448;
  id v9 = v4;
  id v7 = v4;
  [v5 sendRequestID:@"com.apple.sbs.DebugInfoGetUserDefaults" request:MEMORY[0x263EFFA78] destinationID:v6 options:MEMORY[0x263EFFA78] responseHandler:v8];
}

void __41__SBSRemoteDeviceSender_getUserDefaults___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v8 = a2;
  if (a4)
  {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    NSLog(&cfstr_CompanionSentC.isa);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [v8 objectForKeyedSubscript:@"reply"];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
}

- (void)stopTone:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v10[1] = *MEMORY[0x263EF8340];
  id v5 = [(SBSRemoteDeviceSender *)self client];
  id v9 = @"tone";
  uint64_t v6 = [NSNumber numberWithUnsignedInt:v3];
  v10[0] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v8 = [(SBSRemoteDeviceSender *)self destinationID];
  [v5 sendRequestID:@"com.apple.sbs.DebugInfoStopTone" request:v7 destinationID:v8 options:MEMORY[0x263EFFA78] responseHandler:&__block_literal_global_30];
}

void __34__SBSRemoteDeviceSender_stopTone___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
  }
  else {
    NSLog(&cfstr_CompanionSentC.isa);
  }
}

- (void)playTone:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v10[1] = *MEMORY[0x263EF8340];
  id v5 = [(SBSRemoteDeviceSender *)self client];
  id v9 = @"tone";
  uint64_t v6 = [NSNumber numberWithUnsignedInt:v3];
  v10[0] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v8 = [(SBSRemoteDeviceSender *)self destinationID];
  [v5 sendRequestID:@"com.apple.sbs.DebugInfoPlayTone" request:v7 destinationID:v8 options:MEMORY[0x263EFFA78] responseHandler:&__block_literal_global_28];
}

void __34__SBSRemoteDeviceSender_playTone___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
  }
  else {
    NSLog(&cfstr_CompanionSentC.isa);
  }
}

- (void)setTuningInfoOnBox:(id)a3 at:(id)a4 withValue:(float)a5
{
  v16[3] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a3;
  v10 = [(SBSRemoteDeviceSender *)self client];
  v15[0] = @"box";
  v15[1] = @"at";
  v16[0] = v9;
  v16[1] = v8;
  void v15[2] = @"withValue";
  *(float *)&double v11 = a5;
  uint64_t v12 = [NSNumber numberWithFloat:v11];
  void v16[2] = v12;
  id v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];

  id v14 = [(SBSRemoteDeviceSender *)self destinationID];
  [v10 sendRequestID:@"com.apple.sbs.DebugInfoSetTuningInfoOnBox" request:v13 destinationID:v14 options:MEMORY[0x263EFFA78] responseHandler:&__block_literal_global_863];
}

void __57__SBSRemoteDeviceSender_setTuningInfoOnBox_at_withValue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
  }
  else {
    NSLog(&cfstr_CompanionSentC.isa);
  }
}

- (void)getTuningInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSRemoteDeviceSender *)self client];
  uint64_t v6 = [(SBSRemoteDeviceSender *)self destinationID];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __39__SBSRemoteDeviceSender_getTuningInfo___block_invoke;
  v8[3] = &unk_264BA4448;
  id v9 = v4;
  id v7 = v4;
  [v5 sendRequestID:@"com.apple.sbs.DebugInfoGetTuningInfo" request:MEMORY[0x263EFFA78] destinationID:v6 options:MEMORY[0x263EFFA78] responseHandler:v8];
}

void __39__SBSRemoteDeviceSender_getTuningInfo___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v8 = a2;
  if (a4)
  {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    NSLog(&cfstr_CompanionSentC.isa);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [v8 objectForKeyedSubscript:@"reply"];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
}

- (void)getLEDInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSRemoteDeviceSender *)self client];
  uint64_t v6 = [(SBSRemoteDeviceSender *)self destinationID];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __36__SBSRemoteDeviceSender_getLEDInfo___block_invoke;
  v8[3] = &unk_264BA4448;
  id v9 = v4;
  id v7 = v4;
  [v5 sendRequestID:@"com.apple.sbs.DebugInfoGetLEDInfo" request:MEMORY[0x263EFFA78] destinationID:v6 options:MEMORY[0x263EFFA78] responseHandler:v8];
}

void __36__SBSRemoteDeviceSender_getLEDInfo___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v8 = a2;
  if (a4)
  {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    NSLog(&cfstr_CompanionSentC.isa);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [v8 objectForKeyedSubscript:@"reply"];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
}

- (void)getSelectDebugInfo:(id)a3 reply:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v14 = @"keys";
    v15[0] = v6;
    id v8 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  }
  else
  {
    id v8 = (void *)MEMORY[0x263EFFA78];
  }
  id v9 = [(SBSRemoteDeviceSender *)self client];
  v10 = [(SBSRemoteDeviceSender *)self destinationID];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __50__SBSRemoteDeviceSender_getSelectDebugInfo_reply___block_invoke;
  void v12[3] = &unk_264BA4448;
  id v13 = v7;
  id v11 = v7;
  [v9 sendRequestID:@"com.apple.sbs.DebugInfoGetSelectDebugInfo" request:v8 destinationID:v10 options:MEMORY[0x263EFFA78] responseHandler:v12];
}

void __50__SBSRemoteDeviceSender_getSelectDebugInfo_reply___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v8 = a2;
  if (a4)
  {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    NSLog(&cfstr_CompanionSentC.isa);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [v8 objectForKeyedSubscript:@"reply"];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
}

- (void)getAllDebugInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSRemoteDeviceSender *)self client];
  uint64_t v6 = [(SBSRemoteDeviceSender *)self destinationID];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__SBSRemoteDeviceSender_getAllDebugInfo___block_invoke;
  v8[3] = &unk_264BA4448;
  id v9 = v4;
  id v7 = v4;
  [v5 sendRequestID:@"com.apple.sbs.DebugInfoGetAllDebugInfo" request:MEMORY[0x263EFFA78] destinationID:v6 options:MEMORY[0x263EFFA78] responseHandler:v8];
}

void __41__SBSRemoteDeviceSender_getAllDebugInfo___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v8 = a2;
  if (a4)
  {
    NSLog(&cfstr_ErrorSendingRe.isa, a4);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    NSLog(&cfstr_CompanionSentC.isa);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [v8 objectForKeyedSubscript:@"reply"];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
}

- (SBSRemoteDeviceSender)initWithDevice:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SBSRemoteDeviceSender;
  uint64_t v6 = [(SBSRemoteDeviceSender *)&v20 init];
  if (v6)
  {
    id v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    objc_storeStrong((id *)&v6->_destinationID, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.soundboardservices.RapportMessageHandlingQueue", v7);
    rapportQueue = v6->_rapportQueue;
    v6->_rapportQueue = (OS_dispatch_queue *)v8;

    v10 = (RPCompanionLinkClient *)objc_alloc_init(MEMORY[0x263F62B70]);
    client = v6->_client;
    v6->_client = v10;

    uint64_t v12 = [(SBSRemoteDeviceSender *)v6 rapportQueue];
    [(RPCompanionLinkClient *)v6->_client setDispatchQueue:v12];

    [(RPCompanionLinkClient *)v6->_client setControlFlags:8196];
    id v13 = dispatch_group_create();
    dispatch_group_enter(v13);
    id v14 = v6->_client;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    void v18[2] = __40__SBSRemoteDeviceSender_initWithDevice___block_invoke;
    v18[3] = &unk_264BA4420;
    v19 = v13;
    v15 = v13;
    [(RPCompanionLinkClient *)v14 activateWithCompletion:v18];
    dispatch_time_t v16 = dispatch_time(0, 10000000000);
    dispatch_group_wait(v15, v16);
  }
  return v6;
}

void __40__SBSRemoteDeviceSender_initWithDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _SBSLoggingFacility();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_error_impl(&dword_230B2C000, v5, OS_LOG_TYPE_ERROR, "Error activating companion link client '%@'", (uint8_t *)&v6, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_230B2C000, v5, OS_LOG_TYPE_DEFAULT, "companion link client activated succcessfully", (uint8_t *)&v6, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

@end