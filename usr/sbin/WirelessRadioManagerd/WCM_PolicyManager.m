@interface WCM_PolicyManager
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)singleton;
- (BOOL)audioBuiltInReceiver;
- (BOOL)callActiveState;
- (BOOL)clamshellState;
- (BOOL)coexSupported;
- (BOOL)deviceIsMacBookAir;
- (BOOL)fetchWRMdebugPlistForceRTG;
- (BOOL)findMyPencilScanActive;
- (BOOL)forceRealTimeAWDL;
- (BOOL)gpsRadioActive;
- (BOOL)hpCellNeed2SetBTAFH;
- (BOOL)iRATSupported;
- (BOOL)isCellularOnGPSIMDBand;
- (BOOL)isCellularOnIMD3CellBand;
- (BOOL)isCellularOnWiFi3FoBand;
- (BOOL)isInHpSession;
- (BOOL)isWiFiChannel:(int)a3 inChannelMap:(id)a4;
- (BOOL)pencilCoexActive;
- (BOOL)prevNR41RFEnabled;
- (BOOL)prevNR7xRFEnabled;
- (BOOL)processDynamicAntennaBlocking;
- (BOOL)wcmCellularCCSetToBB;
- (BOOL)wcmCellularCoexBand;
- (BOOL)wcmCellularWCI2Mode_Ext_Enable;
- (BOOL)wcmGen9rFemLpmMode2g;
- (BOOL)wcmGen9rFemLpmMode5g;
- (NSArray)legacyWiFiBlocklistChannelsFor3FoWiFi;
- (NSArray)wifiChannelsToBlocklist;
- (NSArray)wifiChannelsToDisableOCL;
- (NSArray)wifiChannelsToEnableWCI2;
- (NSData)btDiversityChannelMapForC0B0;
- (NSData)btDiversityChannelMapForC0B1;
- (NSData)btDiversityChannelMapForC1B0;
- (NSData)btDiversityChannelMapForC1B1;
- (NSData)btDiversityChannelMapOnGpsRadioActiveForC0B0;
- (NSData)btDiversityChannelMapOnGpsRadioActiveForC0B1;
- (NSData)btDiversityChannelMapOnGpsRadioActiveForC1B0;
- (NSData)btDiversityChannelMapOnGpsRadioActiveForC1B1;
- (NSData)btPreferred5GChannelMap;
- (NSData)btPreferredChannelMap;
- (NSData)btPreferredChannelMapHPCellularActive;
- (NSData)btPreferredChannelMapOnGpsRadioActive;
- (NSDictionary)HFBTAntBlkEnableBands;
- (NSMutableArray)gpsBandInfoList;
- (NSMutableArray)wifi2G5GChannelsToEnableType7MSG;
- (NSMutableArray)wifi2GHzChannelsToEnableType7MSGCombined;
- (NSMutableArray)wifi2GHzLTEB7IMD3ChannelsEnableType7;
- (NSMutableArray)wifi5GHzChannelsToEnableType7MSG;
- (NSMutableArray)wifi5GHzChannelsToEnableType7MSGCombined;
- (NSMutableArray)wifiAntselPolicyStatsArray;
- (NSMutableArray)wifiChannelsToDisableOCL2G5G;
- (NSMutableArray)wifiChannelsToDisableOCLEnh;
- (NSMutableArray)wifiChannelsToEnableLTEMBType7;
- (NSMutableArray)wifiChannelsToEnableWCI2Gand5G;
- (NSMutableArray)wifiChannelsToEnableWCI2V2;
- (NSMutableArray)wifiChannelsToEnableWCI2WiFiEnh;
- (NSMutableArray)wifiEnhChannelsToEnableType7MSG;
- (NSMutableDictionary)prevULFrequencyUpdate;
- (NSNumber)btAgcCoexModeEnable;
- (NSNumber)wifiAgcCoexModeLevel;
- (NSNumber)wifiRxPriThreshold;
- (NSObject)lockObjectWifiAntselPolicyStats;
- (NSSet)activeCoexFeatures;
- (WCM_AirplayController)airplayController;
- (WCM_BSPMonitor)bspMonitor;
- (WCM_BTController)btController;
- (WCM_CellularController)cellularController;
- (WCM_CellularRc1PolicyManager)cellularRc1PolicyManager;
- (WCM_CoexMonitor)coexMonitor;
- (WCM_ExternalAccessory)extAccessory;
- (WCM_FTController)ftController;
- (WCM_HPCellularStateMonitor)hpCellularMonitor;
- (WCM_IOKitWrapper)iokitWrapper;
- (WCM_MavAntennaPolicy)mavAntPolicy;
- (WCM_P2PAWDLController)p2pAwdlController;
- (WCM_P2PNANController)p2pNanController;
- (WCM_PlatformManager)platformManager;
- (WCM_PolicyManager)init;
- (WCM_R1Controller)rcu1Controller;
- (WCM_RCU2Controller)rcu2Controller;
- (WCM_SacManager)sacManager;
- (WCM_WiFiController)wifiController;
- (char)dataLqmState;
- (double)previousStartTime;
- (id)getControllerOfId:(int)a3;
- (id)getLTErFemFrequencyRanges:(BOOL)a3;
- (id)getNRrFemFrequencyRanges:(BOOL)a3;
- (id)legacyWiFiChannelsToAvoidFor3FoWiFi;
- (id)legacyWiFiChannelsToAvoidForIMD2GPS;
- (id)legacyWiFiChannelsToAvoidForIMD3Cell;
- (int)btPreferredRole;
- (int)cellularCoexBand;
- (int)coexProfile2GTDDReason;
- (int)parseCenterFreqtoUNIIBand:(unsigned int)a3;
- (int)watchCellularAntPref;
- (unint64_t)BLEActiveScanPwrLmtAssrInt;
- (unint64_t)btAntBlockDuration;
- (unint64_t)cellularWCI2CoexPolicyBitmap;
- (unint64_t)wcmCellularWCI2Mode_CC2;
- (unint64_t)wcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap;
- (unint64_t)wcmCellular_CC1_Tech;
- (unint64_t)wcmCellular_CC2_Tech;
- (unsigned)CTRrcState;
- (unsigned)callType;
- (unsigned)cameraState;
- (unsigned)dynamicAntBlkingBand;
- (unsigned)dynamicCellAntBlkEnableIdx1;
- (unsigned)dynamicCellAntBlkEnableIdx2;
- (unsigned)getBtBlockedAntennaForPencilCoexByPlatform;
- (unsigned)getWifiAntennaBitmapForPencilCoexByPlatform;
- (unsigned)pencilState;
- (unsigned)sacWifiFrequency;
- (unsigned)type7CellAntBlkIdx;
- (unsigned)type7WiFiEnhCellAntBlkIdx;
- (void)audioRouteChanged;
- (void)combineWifiChannelList:(id)a3 withChannelList:(id)a4;
- (void)configureAllWCI2:(BOOL)a3;
- (void)configureBTAntennaSelection;
- (void)configureForLTECDRXWiFiTimeSharing;
- (void)configureWiFiChannelMap;
- (void)configureWifiAntennaSelectionForCoex;
- (void)dealloc;
- (void)evaluateGen9rFemConfig;
- (void)evaluateULCARestrictions;
- (void)getUpdatedWifiAntennaSelectionEnhConfigsWithbmWifiEnhAntTx000:(unsigned __int16 *)a3 bmWiFiEnhAntTx001:(unsigned __int16 *)a4 bmWiFiEnhAntTx010:(unsigned __int16 *)a5 bmWiFiEnhAntTx011:(unsigned __int16 *)a6 bmWiFiEnhAntTx100:(unsigned __int16 *)a7 bmWiFiEnhAntTx101:(unsigned __int16 *)a8 bmWiFiEnhAntTx110:(unsigned __int16 *)a9 bmWiFiEnhAntTx111:(unsigned __int16 *)a10 bmWiFiBand:(unsigned __int16 *)a11;
- (void)handle5GHzHostAPStateEvent:(BOOL)a3;
- (void)handleBTCoexConnectedDevicesEvent_numA2DP:(unint64_t)a3 numLLA:(unint64_t)a4 numHID:(unint64_t)a5 numSCO:(unint64_t)a6 numeSCO:(unint64_t)a7 numLE:(unint64_t)a8 numLEA:(unint64_t)a9;
- (void)handleBTCoexStatsEvent_tddCnt:(unsigned int)a3 hybridCnt:(unsigned int)a4 btDurMs:(unsigned int)a5 totDurMs:(unsigned int)a6 parallelCnt:(unsigned int)a7 btDurAirMs:(unsigned int)a8 wlrssiCoex:(char)a9 btrssiCoex:(char)a10;
- (void)handleBTCoexWiFiStateEvent:(int)a3 wifiChannel:(unsigned int)a4;
- (void)handleBTConnectionChange;
- (void)handleBTLeConn;
- (void)handleBTLeDiscoveryScanStateChange;
- (void)handleBTPowerStateChange;
- (void)handleBTScanConfigChange;
- (void)handleCCConnectionUpdate;
- (void)handleCallLQMStateChange;
- (void)handleCallLQMStateChangeType7:(BOOL)a3;
- (void)handleCallLQMStateChangeType7WiFiEnh:(BOOL)a3;
- (void)handleCameraStateIndication;
- (void)handleCellularNetworkUpdate;
- (void)handleControllerAvailability:(unint64_t)a3;
- (void)handleErrorReport:(int)a3;
- (void)handleFTCall;
- (void)handleHPCellularSessionEnd;
- (void)handleHPCellularSessionStart;
- (void)handleHPCellularStateUpdate:(BOOL)a3;
- (void)handleLow5GRate:(BOOL)a3;
- (void)handleMavCameraStateIndication;
- (void)handleMedtronicConnection;
- (void)handlePencilStateIndication;
- (void)handleRCU2ContentionChange;
- (void)handleSessionNotification:(unint64_t)a3;
- (void)handleWiFiAWDLChange;
- (void)handleWiFiBTAirplayChange;
- (void)handleWiFiBTCatsChange:(BOOL)a3;
- (void)handleWiFiBTCoexChange;
- (void)handleWiFiBTULOFDMAChange;
- (void)handleWiFiConfigChange;
- (void)handleWiFiNANChange;
- (void)handleWiFiPowerStateChange;
- (void)handleWiFiRCU1Change;
- (void)handleWiFiRCU1PowerOff;
- (void)handleWiFiRCU2Change;
- (void)handleWiFiRCU2PowerOff;
- (void)initControllerPolicy:(int)a3;
- (void)queryHPCellularInitialState;
- (void)sendNRFrequencyBandUpdateForMic:(double)a3 dlHighFreq:(double)a4 ulLowFreq:(double)a5 ulHighFreq:(double)a6;
- (void)sendRCU2UpdateMessage;
- (void)sendULFrequencyUpdates:(int64_t)a3 ulCenterFreq:(double)a4 ulBandwidth:(double)a5;
- (void)sendWirelessBtLoad:(unsigned int)a3;
- (void)setActiveCoexFeatures:(id)a3;
- (void)setAirplayController:(id)a3;
- (void)setAudioBuiltInReceiver:(BOOL)a3;
- (void)setBLEActiveScanPwrLmtAssrInt:(unint64_t)a3;
- (void)setBspMonitor:(id)a3;
- (void)setBtAgcCoexModeEnable:(id)a3;
- (void)setBtController:(id)a3;
- (void)setBtDiversityChannelMapForC0B0:(id)a3;
- (void)setBtDiversityChannelMapForC0B1:(id)a3;
- (void)setBtDiversityChannelMapForC1B0:(id)a3;
- (void)setBtDiversityChannelMapForC1B1:(id)a3;
- (void)setBtDiversityChannelMapOnGpsRadioActiveForC0B0:(id)a3;
- (void)setBtDiversityChannelMapOnGpsRadioActiveForC0B1:(id)a3;
- (void)setBtDiversityChannelMapOnGpsRadioActiveForC1B0:(id)a3;
- (void)setBtDiversityChannelMapOnGpsRadioActiveForC1B1:(id)a3;
- (void)setBtPreferred5GChannelMap:(id)a3;
- (void)setBtPreferredChannelMap:(id)a3;
- (void)setBtPreferredChannelMapHPCellularActive:(id)a3;
- (void)setBtPreferredChannelMapOnGpsRadioActive:(id)a3;
- (void)setBtPreferredRole:(int)a3;
- (void)setCTRrcState:(unsigned __int8)a3;
- (void)setCallActiveState:(BOOL)a3;
- (void)setCameraState:(unsigned int)a3;
- (void)setCellularController:(id)a3;
- (void)setCellularWCI2CoexPolicyBitmap:(unint64_t)a3;
- (void)setClamshellState:(BOOL)a3;
- (void)setCoexMonitor:(id)a3;
- (void)setCoexSupported:(BOOL)a3;
- (void)setDataLqmState:(char)a3;
- (void)setDynamicAntBlkingBand:(unsigned __int16)a3;
- (void)setDynamicCellAntBlkEnableIdx1:(unsigned __int8)a3;
- (void)setDynamicCellAntBlkEnableIdx2:(unsigned __int8)a3;
- (void)setExtAccessory:(id)a3;
- (void)setForceRealTimeAWDL:(BOOL)a3;
- (void)setFtController:(id)a3;
- (void)setGpsBandInfoList:(id)a3;
- (void)setGpsRadioActive:(BOOL)a3;
- (void)setHFBTAntBlkEnableBands:(id)a3;
- (void)setHpCellNeed2SetBTAFH:(BOOL)a3;
- (void)setHpCellularMonitor:(id)a3;
- (void)setIRATSupported:(BOOL)a3;
- (void)setIokitWrapper:(id)a3;
- (void)setIsInHpSession:(BOOL)a3;
- (void)setLegacyWiFiBlocklistChannelsFor3FoWiFi:(id)a3;
- (void)setLockObjectWifiAntselPolicyStats:(id)a3;
- (void)setP2pAwdlController:(id)a3;
- (void)setP2pNanController:(id)a3;
- (void)setPencilState:(unsigned int)a3;
- (void)setPlatformManager:(id)a3;
- (void)setPrevNR41RFEnabled:(BOOL)a3;
- (void)setPrevNR7xRFEnabled:(BOOL)a3;
- (void)setPrevULFrequencyUpdate:(id)a3;
- (void)setPreviousStartTime:(double)a3;
- (void)setRcu1Controller:(id)a3;
- (void)setRcu2Controller:(id)a3;
- (void)setSacWifiFrequency:(unsigned int)a3;
- (void)setType7CellAntBlkIdx:(unsigned __int16)a3;
- (void)setType7WiFiEnhCellAntBlkIdx:(unsigned __int16)a3;
- (void)setWatchCellularAntPref:(int)a3;
- (void)setWcmCellularCCSetToBB:(BOOL)a3;
- (void)setWcmCellularCoexBand:(BOOL)a3;
- (void)setWcmCellularWCI2Mode_CC2:(unint64_t)a3;
- (void)setWcmCellularWCI2Mode_Ext_Enable:(BOOL)a3;
- (void)setWcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap:(unint64_t)a3;
- (void)setWcmCellular_CC1_Tech:(unint64_t)a3;
- (void)setWcmCellular_CC2_Tech:(unint64_t)a3;
- (void)setWcmGen9rFemLpmMode2g:(BOOL)a3;
- (void)setWcmGen9rFemLpmMode5g:(BOOL)a3;
- (void)setWifi2G5GChannelsToEnableType7MSG:(id)a3;
- (void)setWifi2GHzChannelsToEnableType7MSGCombined:(id)a3;
- (void)setWifi2GHzLTEB7IMD3ChannelsEnableType7:(id)a3;
- (void)setWifi5GHzChannelsToEnableType7MSG:(id)a3;
- (void)setWifi5GHzChannelsToEnableType7MSGCombined:(id)a3;
- (void)setWifiAgcCoexModeLevel:(id)a3;
- (void)setWifiAntselPolicyStatsArray:(id)a3;
- (void)setWifiChannelsToBlocklist:(id)a3;
- (void)setWifiChannelsToDisableOCL2G5G:(id)a3;
- (void)setWifiChannelsToDisableOCL:(id)a3;
- (void)setWifiChannelsToDisableOCLEnh:(id)a3;
- (void)setWifiChannelsToEnableLTEMBType7:(id)a3;
- (void)setWifiChannelsToEnableWCI2:(id)a3;
- (void)setWifiChannelsToEnableWCI2Gand5G:(id)a3;
- (void)setWifiChannelsToEnableWCI2V2:(id)a3;
- (void)setWifiChannelsToEnableWCI2WiFiEnh:(id)a3;
- (void)setWifiController:(id)a3;
- (void)setWifiEnhChannelsToEnableType7MSG:(id)a3;
- (void)setWifiRxPriThreshold:(id)a3;
- (void)startHomeKitTimer;
- (void)stopHomeKitTimer;
- (void)submitWiFiBTCoexMetrics:(unsigned __int16)a3;
- (void)submitWifiAntselPolicyStats;
- (void)updateAntselPolicyStatsArray:(id)a3;
- (void)updateBTAirplayCriticalState:(BOOL)a3;
- (void)updateBTCatsState:(unsigned __int8)a3 bitmap:(unint64_t)a4 band:(int)a5 desiredBtDc:(int)a6;
- (void)updateBTRCU2TimingArray;
- (void)updateCTSacDriver:(int)a3 frequencyToAdd:(id)a4 frequencyToAddBw:(id)a5 frequencytoRemove:(unsigned int)a6 client:(unsigned __int8)a7;
- (void)updateCTSacDriverRemoveAllFrequenciesFromClient:(unsigned __int8)a3;
- (void)updateCTSacDriverRemoveAllFromWifiClient;
- (void)updateCTSacDriverWifiInfo;
- (void)updateCallStateActive:(BOOL)a3;
- (void)updateCellTxPowerLimit;
- (void)updateClamshellState:(BOOL)a3;
- (void)updateCoexMonitorState:(int)a3;
- (void)updateControllerSession:(id)a3 ofId:(int)a4;
- (void)updateControllerState:(unint64_t)a3;
- (void)updateGPSBandsInfo:(id)a3 CLUpdate:(BOOL)a4;
- (void)updateGPSRadioActiveState:(BOOL)a3;
- (void)updateGpsbandsInfoForBB;
- (void)updateGpsbandsInfoForBBv2;
- (void)updateHPCellularMetric;
- (void)updateLqmState:(int)a3 deviceRRCState:(unsigned __int8)a4 subscriptionSlot:(int64_t)a5;
- (void)updateOnOperatorBundleChanged;
- (void)updatePencilCoexActivationCondition;
- (void)updateWiFiAirplayCriticalState:(BOOL)a3;
- (void)updateWiFiBTConnectionReport;
- (void)updateWiFiCatsState:(unsigned int)a3;
- (void)updateWiFiChannelForConditionalMitigation;
- (void)updateWiFiCoexState;
- (void)updateWiFiRCU1ModeChange;
- (void)updateWiFiRCU1Status;
- (void)updateWiFiRCU1ULOFDMAStatus;
- (void)updateWiFiRCU2CoexMode;
- (void)updateWiFiRCU2CoexParams;
- (void)updateWiFiRCU2PMProtectionMode;
- (void)updateWiFiRCU2TimingArray;
- (void)updateWiFiRCU2ULOFDMAStatus;
- (void)updateWifiAntennaSelectionV1V2Configs;
- (void)updateWifiOCLChannelList;
- (void)wRMCACoexSubmit_AntSelPolicyStates:(unsigned int)a3 IssueType:(unsigned int)a4 IsCoexBand:(BOOL)a5 HasAntConstraint:(BOOL)a6;
- (void)wRMCACoexSubmit_ULCACoexStates:(BOOL)a3 ULCAPrimaryCarrierULFreq:(unsigned int)a4 ULCAPrimaryCarrierDLFreq:(unsigned int)a5 ULCAPrimaryCarrierULBW:(unsigned int)a6 ULCAPrimaryCarrierDLBW:(unsigned int)a7 ULCACriticalCarrierULFreq:(unsigned int)a8 ULCACriticalCarrierDLFreq:(unsigned int)a9 ULCACriticalCarrierULBW:(unsigned int)a10 ULCACriticalCarrierDLBW:(unsigned int)a11;
@end

@implementation WCM_PolicyManager

- (void)handleLow5GRate:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"WiFiFigaroCoex"))
  {
    +[WCM_Logging logLevel:2, @"PolicyManager: handleLow5GRate %d", v3 message];
    if (v3)
    {
      +[WCM_Logging logLevel:2 message:@"PolicyManager: WiFi 5G rates dropped, moved any AoS to 2G"];
      uint64_t v5 = 1;
      if ([(WCM_BTController *)[(WCM_PolicyManager *)self btController] getAny5GHzBTDevicesConnected])
      {
        byte_10027D300 = 1;
      }
    }
    else
    {
      if ([(WCM_BTController *)[(WCM_PolicyManager *)self btController] getAnyAoSLinkActive])
      {
        if ([(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiState] > 2)
        {
          if ([(WCM_BTController *)[(WCM_PolicyManager *)self btController] getAny5GHzBTDevicesConnected]|| byte_10027D300 != 1)
          {
            +[WCM_Logging logLevel:3 message:@"PolicyManager: rates are high and no prior issue with this AoS session - allow 5GHz TDD"];
            uint64_t v5 = 0;
          }
          else
          {
            +[WCM_Logging logLevel:3 message:@"PolicyManager: WiFi 5G rates recovered, keep AoS in 2G"];
            uint64_t v5 = 1;
          }
          goto LABEL_10;
        }
        CFStringRef v6 = @"PolicyManager: WiFi 5G is not connected, allow AoS in 5GHz";
      }
      else
      {
        CFStringRef v6 = @"PolicyManager: WiFi 5G rates recovered and no AoS link, allow AoS 5GHz";
      }
      +[WCM_Logging logLevel:2 message:v6];
      uint64_t v5 = 0;
      byte_10027D300 = 0;
    }
LABEL_10:
    if (byte_10027D2FF != v5)
    {
      [(WCM_BTController *)[(WCM_PolicyManager *)self btController] updateLowWiFi5GRates:v5];
      byte_10027D2FF = v5;
    }
  }
}

- (void)queryHPCellularInitialState
{
  +[WCM_Logging logLevel:4 message:@"HPCellular: queryHPCellularInitialState getting called."];
  BOOL v3 = [(WCM_PolicyManager *)self hpCellularMonitor];
  if (v3)
  {
    v4 = v3;
    +[WCM_Logging logLevel:4 message:@"HPCellular: Accessing WCM_HPCellularStateMonitor intance self.hpCellularMonitor in WCM_PolicyManager.m is successful."];
    if ([(WCM_HPCellularStateMonitor *)v4 start]) {
      +[WCM_Logging logLevel:4, @"HPCellular: Initial queryHPCellularInitialState is success. HPCellular status printed", 1 message];
    }
  }
}

- (void)handleHPCellularStateUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(WCM_PolicyManager *)self isInHpSession] || !v3)
  {
    if ([(WCM_PolicyManager *)self isInHpSession] && !v3) {
      [(WCM_PolicyManager *)self handleHPCellularSessionEnd];
    }
  }
  else
  {
    [(WCM_PolicyManager *)self handleHPCellularSessionStart];
  }
  [(WCM_PolicyManager *)self setIsInHpSession:v3];
  if ([(WCM_PolicyManager *)self hpCellNeed2SetBTAFH] == v3)
  {
    +[WCM_Logging logLevel:4, @"HPCellular: Duplicated indications: self.hpCellNeed2SetBTAFH=%d is equal to hpCellularStateActive=%d. Skip sending indication to BT host.", [(WCM_PolicyManager *)self hpCellNeed2SetBTAFH], v3 message];
  }
  else if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"hpcellularstatemonitorsupport"])
  {
    [(WCM_PolicyManager *)self setHpCellNeed2SetBTAFH:v3];
    if ([(WCM_PolicyManager *)self gpsRadioActive]) {
      CFStringRef v6 = [(WCM_PolicyManager *)self btPreferredChannelMapOnGpsRadioActive];
    }
    else {
      CFStringRef v6 = [(WCM_PolicyManager *)self btPreferredChannelMap];
    }
    v7 = v6;
    +[WCM_Logging logLevel:4, @"HPCellular (handleHPCellularStateUpdate): Bool flag self.hpCellNeed2SetBTAFH = (%d), Fixed AFH self.btPreferredChannelMapHPCellularActive = (%@).", [(WCM_PolicyManager *)self hpCellNeed2SetBTAFH], [(WCM_PolicyManager *)self btPreferredChannelMapHPCellularActive] message];
    if ([(WCM_PolicyManager *)self hpCellNeed2SetBTAFH]) {
      v7 = [(WCM_PolicyManager *)self btPreferredChannelMapHPCellularActive];
    }
    [(WCM_BTController *)[(WCM_PolicyManager *)self btController] updatePreferredAFHMap:v7];
    +[WCM_Logging logLevel:4, @"HPCellular: Sending indication to BT host with HPCellular session status as %d.", v3 message];
    [(WCM_BTController *)[(WCM_PolicyManager *)self btController] updateHPCellularSessionStatus:[(WCM_PolicyManager *)self hpCellNeed2SetBTAFH]];
  }
  else
  {
    +[WCM_Logging logLevel:0, @"HPCellular: handleHPCellularStateUpdate gets called but HPCellularStateMonitorSupport feature flag is missing for this device. Not expected.", v8, v9 message];
  }
}

- (BOOL)isInHpSession
{
  return self->_isInHpSession;
}

- (void)configureWiFiChannelMap
{
  BOOL v3 = [(WCM_PolicyManager *)self platformManager];
  v4 = [(WCM_PolicyManager *)self wifiController];
  unsigned int v5 = [(WCM_PolicyManager *)self cellularCoexBand];
  switch(v5)
  {
    case 0u:
    case 1u:
    case 3u:
    case 4u:
      if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"DisablePhyRateBasedRxPriReq"])
      {
        goto LABEL_3;
      }
      v7 = [(WCM_PlatformManager *)v3 wcmWiFiPriThresholdLow];
      goto LABEL_5;
    case 2u:
      if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"DisablePhyRateBasedRxPriReq"])
      {
        goto LABEL_3;
      }
      v7 = [(WCM_PlatformManager *)v3 wcmWiFiPriThresholdHigh];
LABEL_5:
      CFStringRef v6 = v7;
      break;
    default:
LABEL_3:
      CFStringRef v6 = (NSNumber *)&off_10023CCA8;
      break;
  }
  [(WCM_PolicyManager *)self setWifiRxPriThreshold:v6];
  [(WCM_WiFiController *)v4 updateChannelsToBlocklist:[(WCM_PolicyManager *)self wifiChannelsToBlocklist]];
  if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiOCLSupport"])
  {
    if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiEnhCoexSupport"])
    {
      [(WCM_WiFiController *)v4 updateChannelsToDisableOCLWiFiEnh:[(WCM_PolicyManager *)self wifiChannelsToDisableOCL2G5G] WiFiEnhChannels:[(WCM_PolicyManager *)self wifiChannelsToDisableOCLEnh]];
    }
    else
    {
      [(WCM_WiFiController *)v4 updateChannelsToDisableOCL:[(WCM_PolicyManager *)self wifiChannelsToDisableOCL]];
    }
  }
  if (v5 == 7)
  {
    [(WCM_WiFiController *)v4 updateChannelsToEnableWCI2:&off_10024E4B8];
  }
  else if ([(WCM_PolicyManager *)self cellularWCI2CoexPolicyBitmap])
  {
    if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiWCI2BitmapV2Enabled"])
    {
      if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiEnhCoexSupport"])
      {
        [(WCM_WiFiController *)v4 updateChannelsToEnableWCI2WiFiEnh:[(WCM_PolicyManager *)self wifiChannelsToEnableWCI2Gand5G] WiFiEnhChannels:[(WCM_PolicyManager *)self wifiChannelsToEnableWCI2WiFiEnh]];
      }
      else
      {
        [(WCM_WiFiController *)v4 updateChannelsToEnableWCI2V2:[(WCM_PolicyManager *)self wifiChannelsToEnableWCI2V2]];
      }
    }
    else
    {
      [(WCM_WiFiController *)v4 updateChannelsToEnableWCI2:[(WCM_PolicyManager *)self wifiChannelsToEnableWCI2]];
    }
    if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFi5GHzType7NR79AntBlocking"]|| [(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiType7LTEMBAntBlocking"])
    {
      if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"Type72GWiFiSupport"])
      {
        long long v16 = 0u;
        long long v17 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        uint64_t v8 = [(WCM_PolicyManager *)self wifi2GHzLTEB7IMD3ChannelsEnableType7];
        id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v15;
          do
          {
            v12 = 0;
            do
            {
              if (*(void *)v15 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v12);
              if ((-[NSMutableArray containsObject:](-[WCM_PolicyManager wifi2GHzChannelsToEnableType7MSGCombined](self, "wifi2GHzChannelsToEnableType7MSGCombined"), "containsObject:", v13) & 1) == 0&& [&off_10024E4D0 containsObject:v13])
              {
                [(NSMutableArray *)[(WCM_PolicyManager *)self wifi2GHzChannelsToEnableType7MSGCombined] addObject:v13];
              }
              v12 = (char *)v12 + 1;
            }
            while (v10 != v12);
            id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
          }
          while (v10);
        }
      }
      if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiEnhCoexSupport"])
      {
        [(WCM_PolicyManager *)self handleCallLQMStateChangeType7WiFiEnh:1];
      }
      else
      {
        [(WCM_PolicyManager *)self handleCallLQMStateChangeType7:1];
      }
    }
  }
  if ([(WCM_PolicyManager *)self cellularWCI2CoexPolicyBitmap]) {
    [(WCM_WiFiController *)v4 updateRxPriorityThreshold:[(WCM_PolicyManager *)self wifiRxPriThreshold]];
  }
}

- (void)configureAllWCI2:(BOOL)a3
{
  BOOL v3 = a3;
  +[WCM_Logging logLevel:4, @"configureAllWCI2 gets called with input (BOOL)enable =%d", a3 message];
  unsigned int v5 = [(WCM_PolicyManager *)self wifiController];
  CFStringRef v6 = [(WCM_PolicyManager *)self btController];
  if (v3)
  {
    if ([(WCM_WiFiController *)v5 powerState])
    {
      if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"KeepBTAwake"])
      {
        [(WCM_BTController *)v6 updateAwakeMode:1];
      }
      if ([(WCM_PolicyManager *)self cellularWCI2CoexPolicyBitmap])
      {
        if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiWCI2BitmapV2Enabled"])
        {
          if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiEnhCoexSupport"])
          {
            [(WCM_WiFiController *)v5 updateChannelsToEnableWCI2WiFiEnh:[(WCM_PolicyManager *)self wifiChannelsToEnableWCI2Gand5G] WiFiEnhChannels:[(WCM_PolicyManager *)self wifiChannelsToEnableWCI2WiFiEnh]];
          }
          else
          {
            [(WCM_WiFiController *)v5 updateChannelsToEnableWCI2V2:[(WCM_PolicyManager *)self wifiChannelsToEnableWCI2V2]];
          }
        }
        else
        {
          [(WCM_WiFiController *)v5 updateChannelsToEnableWCI2:[(WCM_PolicyManager *)self wifiChannelsToEnableWCI2]];
        }
      }
      [(WCM_CellularController *)[(WCM_PolicyManager *)self cellularController] updateWCI2CoexPolicy:[(WCM_PolicyManager *)self cellularWCI2CoexPolicyBitmap]];
      if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFi5GHzType7NR79AntBlocking"]|| [(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiType7LTEMBAntBlocking"])
      {
        if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"Type72GWiFiSupport"])
        {
          long long v15 = 0u;
          long long v16 = 0u;
          long long v13 = 0u;
          long long v14 = 0u;
          v7 = [(WCM_PolicyManager *)self wifi2GHzLTEB7IMD3ChannelsEnableType7];
          id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v8)
          {
            id v9 = v8;
            uint64_t v10 = *(void *)v14;
            do
            {
              for (i = 0; i != v9; i = (char *)i + 1)
              {
                if (*(void *)v14 != v10) {
                  objc_enumerationMutation(v7);
                }
                uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * i);
                if ((-[NSMutableArray containsObject:](-[WCM_PolicyManager wifi2GHzChannelsToEnableType7MSGCombined](self, "wifi2GHzChannelsToEnableType7MSGCombined"), "containsObject:", v12) & 1) == 0&& [&off_10024E488 containsObject:v12])
                {
                  [(NSMutableArray *)[(WCM_PolicyManager *)self wifi2GHzChannelsToEnableType7MSGCombined] addObject:v12];
                }
              }
              id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
            }
            while (v9);
          }
        }
        if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiEnhCoexSupport"])
        {
          [(WCM_PolicyManager *)self handleCallLQMStateChangeType7WiFiEnh:1];
        }
        else
        {
          [(WCM_PolicyManager *)self handleCallLQMStateChangeType7:1];
        }
      }
    }
    if ([(WCM_BTController *)v6 getBTState])
    {
      if ([(WCM_PolicyManager *)self cellularWCI2CoexPolicyBitmap]) {
        [(WCM_BTController *)v6 updateWCI2Mode:1];
      }
      [(WCM_CellularController *)[(WCM_PolicyManager *)self cellularController] updateWCI2CoexPolicy:[(WCM_PolicyManager *)self cellularWCI2CoexPolicyBitmap]];
    }
  }
  else
  {
    +[WCM_Logging logLevel:4 message:@"updateWCI2CoexPolicy gets called by configureAllWCI2 with input 0 due to (BOOL)enable is False as input to configureAllWCI2"];
    [(WCM_CellularController *)[(WCM_PolicyManager *)self cellularController] updateWCI2CoexPolicy:0];
    [(WCM_BTController *)v6 powerState];
    [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] updateChannelsToEnableWCI2:&off_10024E4A0];
    if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"KeepBTAwake"])
    {
      [(WCM_BTController *)v6 updateAwakeMode:0];
    }
    +[WCM_Logging logLevel:4 message:@"AggdRemoval_ Since Aggd related keys ave been disabled on the server side, we will stop submitting metrics to Aggd. (configureAllWCI2)"];
  }
}

- (BOOL)processDynamicAntennaBlocking
{
  if ((objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"BB22_N79_DYNAMIC_ANTENNA_BLOCKING") & 1) == 0)
  {
    +[WCM_Logging logLevel:0 message:@"ERROR: This should never happen. processDynamicAntennaBlocking"];
    objc_exception_throw(NSInternalInconsistencyException);
  }
  +[WCM_Logging logLevel:4 message:@"YYDebug_ processDynamicAntennaBlocking"];
  BOOL v3 = [(WCM_PolicyManager *)self wifiController];
  v4 = [(WCM_PolicyManager *)self cellularController];
  unsigned int v5 = [(WCM_CellularController *)v4 getActiveULCAConfig];
  CFStringRef v6 = [(WCM_PolicyManager *)self platformManager];
  if (!v4) {
    goto LABEL_12;
  }
  [(WCM_CellularController *)v4 getActiveULCAConfig];
  if (!v5)
  {
    +[WCM_Logging logLevel:0 message:@"YYDebug_ processDynamicAntennaBlocking activeULCAConfig->cellConfigNR79 is NULL"];
LABEL_12:
    BOOL v19 = 0;
    goto LABEL_13;
  }
  uint64_t var8 = v5->var7.var8;
  double var2 = v5->var7.var2;
  double v10 = v5->var7.var3 * 0.5;
  double v11 = var2 - v10;
  double v12 = var2 + v10;
  double var0 = v5->var7.var0;
  double v14 = v5->var7.var1 * 0.5;
  double v15 = var0 - v14;
  double v16 = var0 + v14;
  id v17 = (id)[(WCM_WiFiController *)v3 wifiChannel];
  +[WCM_Logging logLevel:4, @"YYDebug_ processDynamicAntennaBlocking gets wifiChannel = %d, channelBandwidthMHz = %d, channelCenterFreqMHz = %d.", v17, [(WCM_WiFiController *)v3 channelBandwidthMHz], [(WCM_WiFiController *)v3 channelCenterFreqMHz] message];
  +[WCM_Logging logLevel:4, @"YYDebug_ processDynamicAntennaBlocking gets ccNR79 info dlLowFreq = %lf, dlHighFreq = %lf, ulLowFreq = %lf, ulHighFreq = %lf, nr79Found = %d.", *(void *)&v11, *(void *)&v12, *(void *)&v15, *(void *)&v16, v5->var7.var9 message];
  unsigned __int16 v24 = 0;
  __int16 v23 = 0;
  [(WCM_WiFiCellCoexIssueBandTable *)[(WCM_PlatformManager *)v6 wcmWiFiCellCoexIssueTable] getCellDynamicAntBlockingIndex:var8 cellDlLowFreq:v17 cellDlHighFreq:&v24 cellUlLowFreq:(char *)&v23 + 1 cellUlHighFreq:&v23 wifiChannel:v11 pissueBandMatchAntIdx:v12 cellAntBlkEnableIdx1:v15 cellAntBlkEnableIdx2:v16];
  unsigned int v18 = [(WCM_PolicyManager *)self dynamicAntBlkingBand];
  BOOL v19 = v18 != v24;
  if (v18 != v24) {
    -[WCM_PolicyManager setDynamicAntBlkingBand:](self, "setDynamicAntBlkingBand:");
  }
  unsigned int v20 = [(WCM_PolicyManager *)self dynamicCellAntBlkEnableIdx1];
  if (v20 != HIBYTE(v23))
  {
    -[WCM_PolicyManager setDynamicCellAntBlkEnableIdx1:](self, "setDynamicCellAntBlkEnableIdx1:");
    BOOL v19 = 1;
  }
  unsigned int v21 = [(WCM_PolicyManager *)self dynamicCellAntBlkEnableIdx2];
  if (v21 != v23)
  {
    -[WCM_PolicyManager setDynamicCellAntBlkEnableIdx2:](self, "setDynamicCellAntBlkEnableIdx2:");
    BOOL v19 = 1;
    unsigned int v21 = v23;
  }
  +[WCM_Logging logLevel:4, @"YYDebug_ processDynamicAntennaBlocking dynamicAntBlkingBand = %d, ant1 = %d, ant2 = %d", v24, HIBYTE(v23), v21 message];
LABEL_13:
  return v19;
}

- (void)updateWiFiCoexState
{
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"WiFiBtULOFDMA"))
  {
    +[WCM_Logging logLevel:4 message:@"In handleWiFiConfigChange call handleWiFiBTULOFDMAChange"];
    [(WCM_PolicyManager *)self handleWiFiBTULOFDMAChange];
  }
  if ((objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"WiFiBtProfile") & 1) != 0|| objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"WiFiBt5GProfile"))
  {
    +[WCM_Logging logLevel:2 message:@"In updateWiFiCoexState call handleWiFiBTCoexChange"];
    [(WCM_PolicyManager *)self handleWiFiBTCoexChange];
  }
  BOOL v3 = [(WCM_PolicyManager *)self wifiController];

  [(WCM_WiFiController *)v3 handleWiFiResetFlag];
}

- (void)configureForLTECDRXWiFiTimeSharing
{
  if (![(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"LTECDRXWiFiTimeSharing"])return; {
  if ([(WCM_PolicyManager *)self cellularCoexBand] == 2)
  }
  {
    +[WCM_Logging logLevel:4 message:@"Cellular/WiFi TimeSharing:  triggered by WRM_B40B_COEX"];
    [(WCM_PolicyManager *)self setCellularWCI2CoexPolicyBitmap:[(WCM_PolicyManager *)self cellularWCI2CoexPolicyBitmap] | 0x1030];
    unsigned int v3 = [(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"LTEWiFiTimeSharingBand40bCh13"];
    v4 = &off_10024E500;
    unsigned int v5 = &off_10024E4E8;
  }
  else
  {
    if ([(WCM_PolicyManager *)self cellularCoexBand] != 3
      && [(WCM_PolicyManager *)self cellularCoexBand] != 4
      || ![(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"LTEWiFiTimeSharingBand41"]&& ![(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"LTEWiFiTimeSharingBand41Ch1113"])
    {
      [(WCM_PolicyManager *)self setCellularWCI2CoexPolicyBitmap:[(WCM_PolicyManager *)self cellularWCI2CoexPolicyBitmap] & ((unsigned __int16)[(NSNumber *)[(WCM_PlatformManager *)[(WCM_PolicyManager *)self platformManager] wcmCellularWCI2ModePolicy] unsignedLongValue] | 0xFFFFFFFFFFFFEFCFLL)];
      int v7 = 0;
      CFStringRef v6 = &off_10024E548;
      goto LABEL_14;
    }
    +[WCM_Logging logLevel:4 message:@"Cellular/WiFi TimeSharing:  triggered by WRM_B41A1+A2_Coex"];
    [(WCM_PolicyManager *)self setCellularWCI2CoexPolicyBitmap:[(WCM_PolicyManager *)self cellularWCI2CoexPolicyBitmap] | 0x1030];
    unsigned int v3 = [(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"LTEWiFiTimeSharingBand41Ch1113"];
    v4 = &off_10024E530;
    unsigned int v5 = &off_10024E518;
  }
  if (v3) {
    CFStringRef v6 = v5;
  }
  else {
    CFStringRef v6 = v4;
  }
  [(WCM_PolicyManager *)self cellularCoexBand];
  int v7 = 1;
LABEL_14:
  if ([(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] powerState])
  {
    +[WCM_Logging logLevel:4, @"Cellular/WiFi TimeSharing:  Configure WiFi channel for TimeSharing: %@", v6 message];
    [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] updateChannelsForTimeSharingMode:v6];
  }
  if (!v7)
  {
    unint64_t v8 = 0;
    unint64_t v10 = 0;
LABEL_25:
    if (![(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"UseWCMAriDriver"]&& ((v7 ^ 1) & 1) == 0&& [(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"Bb20PolicyConversion"])
    {
      double v11 = [(WCM_PolicyManager *)self cellularController];
      [(WCM_CellularController *)v11 configureCellularTimeShareConfigReqParamsWithCenterFreq:v8 bandwidth:v10];
    }
    return;
  }
  if ([(WCM_PolicyManager *)self cellularCoexBand] == 2)
  {
    unint64_t v8 = [(WCM_PlatformManager *)[(WCM_PolicyManager *)self platformManager] getBand40BUlCenterFreq];
    unint64_t v9 = [(WCM_PlatformManager *)[(WCM_PolicyManager *)self platformManager] getBand40BUlBw];
LABEL_24:
    unint64_t v10 = v9;
    +[WCM_Logging logLevel:4, @"Cellular/WiFi TimeSharing: Enabled for freq %llu and bw %llu", v8, v9 message];
    goto LABEL_25;
  }
  if ([(WCM_PolicyManager *)self cellularCoexBand] == 3)
  {
    unint64_t v8 = [(WCM_PlatformManager *)[(WCM_PolicyManager *)self platformManager] getBand41A1UlCenterFreq];
    unint64_t v9 = [(WCM_PlatformManager *)[(WCM_PolicyManager *)self platformManager] getBand41A1UlBw];
    goto LABEL_24;
  }
  if ([(WCM_PolicyManager *)self cellularCoexBand] == 4)
  {
    unint64_t v8 = [(WCM_PlatformManager *)[(WCM_PolicyManager *)self platformManager] getBand41A2UlCenterFreq];
    unint64_t v9 = [(WCM_PlatformManager *)[(WCM_PolicyManager *)self platformManager] getBand41A2UlBw];
    goto LABEL_24;
  }

  +[WCM_Logging logLevel:0 message:@"We should never reach here. No matching coex band to enable time sharing"];
}

- (void)updateAntselPolicyStatsArray:(id)a3
{
  obj = [(WCM_PolicyManager *)self lockObjectWifiAntselPolicyStats];
  objc_sync_enter(obj);
  double v15 = self;
  unsigned int v5 = +[NSArray arrayWithArray:[(WCM_PolicyManager *)self wifiAntselPolicyStatsArray]];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        unint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        unsigned int v10 = [[objc_msgSend(v9, "objectForKeyedSubscript:", @"IsCoexBand", obj) boolValue];
        if (v10 == objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"IsCoexBand"), "BOOLValue"))
        {
          unsigned int v11 = [[v9 objectForKeyedSubscript:@"HasAntConstraint"] boolValue];
          if (v11 == objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"HasAntConstraint"), "BOOLValue")&& objc_msgSend(objc_msgSend(v9, "objectForKeyedSubscript:", @"IssueBand"), "isEqualToString:", objc_msgSend(a3, "objectForKeyedSubscript:", @"IssueBand"))&& objc_msgSend(objc_msgSend(v9, "objectForKeyedSubscript:", @"IssueType"), "isEqualToString:", objc_msgSend(a3, "objectForKeyedSubscript:", @"IssueType")))
          {
            double v12 = [(char *)[v9 objectForKeyedSubscript:@"count"] integerValue];
            long long v13 = +[NSMutableDictionary dictionaryWithDictionary:v9];
            [(NSMutableDictionary *)v13 setObject:+[NSNumber numberWithInteger:v12 + 1] forKeyedSubscript:@"count"];
            [(NSMutableArray *)[(WCM_PolicyManager *)v15 wifiAntselPolicyStatsArray] removeObject:v9];
            [(NSMutableArray *)[(WCM_PolicyManager *)v15 wifiAntselPolicyStatsArray] addObject:v13];
            goto LABEL_14;
          }
        }
      }
      id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  [(NSMutableArray *)[(WCM_PolicyManager *)v15 wifiAntselPolicyStatsArray] addObject:a3];
LABEL_14:
  objc_sync_exit(obj);
}

- (NSMutableArray)wifiAntselPolicyStatsArray
{
  return self->_wifiAntselPolicyStatsArray;
}

- (void)handleWiFiBTULOFDMAChange
{
  if ((objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"WiFiBtULOFDMA") & 1) == 0&& !objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"WiFiBtULOFDMADesense"))
  {
    return;
  }
  +[WCM_Logging logLevel:2 message:@"Handle WiFi BT UL_OFDMA Coex change"];
  if (![(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] powerState])
  {
    byte_10027D2D4 = 0;
    return;
  }
  unsigned int v3 = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiState];
  BOOL v4 = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] didWiFiDeviceReset];
  if (v3 >= 4)
  {
    unsigned int v5 = "INVALID_STATE!!!";
    if (v3 == 4) {
      unsigned int v5 = "ASSOCIATED_6G";
    }
  }
  else
  {
    unsigned int v5 = off_100211678[v3];
  }
  +[WCM_Logging logLevel:2, @"WiFiState(%s)", v5 message];
  +[WCM_Logging logLevel:2, @"WiFiReset(%d)", v4 message];
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"WiFiBtULOFDMADesense"))
  {
    if (v3 == 2)
    {
      if (![(WCM_BTController *)[(WCM_PolicyManager *)self btController] getAny2GHzBTDevicesConnected]|| ![(WCM_BTController *)[(WCM_PolicyManager *)self btController] isBtAntennaDesensed])
      {
        goto LABEL_20;
      }
LABEL_19:
      uint64_t v6 = 1;
      goto LABEL_21;
    }
LABEL_17:
    if (v3 - 3 > 1
      || ![(WCM_BTController *)[(WCM_PolicyManager *)self btController] getAny5GHzBTDevicesConnected])
    {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (v3 != 2) {
    goto LABEL_17;
  }
  if ([(WCM_BTController *)[(WCM_PolicyManager *)self btController] getAny2GHzBTDevicesConnected])
  {
    goto LABEL_19;
  }
LABEL_20:
  uint64_t v6 = 0;
LABEL_21:
  int v7 = byte_10027D2D4 != v6 || v4;
  if (v7 == 1)
  {
    +[WCM_Logging logLevel:2, @"WiFi/BT UL OFDMA disable state change prev (%d) current (%d) wifiReset (%d)", byte_10027D2D4, v6, v4 message];
    byte_10027D2D4 = v6;
    unint64_t v8 = [(WCM_PolicyManager *)self wifiController];
    [(WCM_WiFiController *)v8 updateWiFiBTULOFDMAstate:v6];
  }
}

- (void)handleFTCall
{
  uint64_t v3 = [(WCM_PolicyManager *)self cellularCoexBand];
  BOOL v4 = [(WCM_PolicyManager *)self cellularController];
  +[WCM_Logging logLevel:3, @"Facetime update coexBand(%d)", v3 message];
  unsigned int v5 = "FT off";
  if ([(WCM_PolicyManager *)self ftController]
    && [(WCM_FTController *)[(WCM_PolicyManager *)self ftController] getFTState])
  {
    unsigned int v5 = "FT on";
  }
  if ([(WCM_PolicyManager *)self btController])
  {
    unsigned int v6 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] getBTState];
    unsigned int v7 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] audioType];
  }
  else
  {
    unsigned int v6 = 0;
    unsigned int v7 = 0;
  }
  unint64_t v8 = [(WCM_PolicyManager *)self wifiController];
  if (v8) {
    LODWORD(v8) = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiState];
  }
  unint64_t v9 = "BT on, not HFP";
  if (v7 == 3) {
    unint64_t v9 = "BT on, HFP";
  }
  if (!v6) {
    unint64_t v9 = "BT off";
  }
  unsigned int v10 = "WiFi on, associated";
  if (v8 == 1) {
    unsigned int v10 = "WiFi on, not associated";
  }
  if (!v8) {
    unsigned int v10 = "WiFi off";
  }
  +[WCM_Logging logLevel:5, @"Current radio states are %s, %s, %s", v9, v10, v5 message];
  [(WCM_PolicyManager *)self updateCoexMonitorState:v3];
  if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"CoexBBUnifiedSensorInfoSupport"])
  {
    if ([(WCM_PolicyManager *)self btController])
    {
      if ([(WCM_BTController *)[(WCM_PolicyManager *)self btController] getNum2GHzAclA2DPDevices])
      {
        uint64_t v11 = 2;
        uint64_t v12 = 4;
      }
      else
      {
        if ([(WCM_BTController *)[(WCM_PolicyManager *)self btController] numeSCODevice])
        {
          uint64_t v12 = 2;
        }
        else
        {
          if ([(WCM_BTController *)[(WCM_PolicyManager *)self btController] numSCODevice])
          {
            uint64_t v11 = 2;
            uint64_t v12 = 1;
            goto LABEL_27;
          }
          if ([(WCM_BTController *)[(WCM_PolicyManager *)self btController] numLEADevice]) {
            uint64_t v12 = 5;
          }
          else {
            uint64_t v12 = 0;
          }
        }
        uint64_t v11 = 2;
      }
    }
    else
    {
      uint64_t v12 = 0;
      uint64_t v11 = 0;
    }
LABEL_27:
    [(WCM_CellularController *)v4 sendBBCoexSensorMessage:2 band:v11 usecase:v12];
  }
  if ([(WCM_PolicyManager *)self isInHpSession])
  {
    [(WCM_PolicyManager *)self updateHPCellularMetric];
  }
}

- (void)handleCallLQMStateChangeType7WiFiEnh:(BOOL)a3
{
  id v3 = (id)a3;
  if (![(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"BB25ASuppot"])
  {
    unsigned int v5 = +[NSMutableArray arrayWithArray:[(WCM_PolicyManager *)self wifi2GHzChannelsToEnableType7MSGCombined]];
    [(NSMutableArray *)v5 addObjectsFromArray:[(WCM_PolicyManager *)self wifi5GHzChannelsToEnableType7MSGCombined]];
    unsigned int v6 = +[NSMutableArray arrayWithArray:[(WCM_PolicyManager *)self wifiEnhChannelsToEnableType7MSG]];
    unsigned int v7 = +[NSMutableArray arrayWithArray:&off_10024E458];
    unint64_t v8 = +[NSMutableArray arrayWithArray:&off_10024E470];
    BOOL v9 = [(WCM_PolicyManager *)self callActiveState];
    uint64_t v10 = [(WCM_PolicyManager *)self dataLqmState];
    if (v3)
    {
      id v3 = [(NSMutableArray *)v5 isEqualToArray:v7];
      id v11 = [(NSMutableArray *)v6 isEqualToArray:v8];
    }
    else
    {
      id v11 = 0;
    }
    +[WCM_Logging logLevel:4, @"WiFiType7_WiFiEnh: handleCallLQMStateChangeType7Enh: callActiveState=%d, lqmCurrent=%d, skipIOVARAssert_2G5G=%d, skipIOVARAssert_Enh=%d, skipIOVARAssert_Enh=%d", v9, (int)v10, v3, v11 message];
    if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFi5GHzType7NR79AntBlocking"]|| [(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiType7LTEMBAntBlocking"]|| [(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"Type72GWiFiSupport"])
    {
      if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiEnhCoexSupport"])
      {
        int v12 = (int)v10 < 50 || v9;
        if (v12 == 1)
        {
          if ((v3 & v11 & 1) == 0) {
            [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] updateChannelsToEnableType7MSGWiFiEnh:v7 WiFiEnhChannels:v8];
          }
          CFStringRef v13 = @"WiFiType7_WiFiEnh Combined WiFi bitmap for Type7 MSG: callActiveState=%d, lqmCurrent = %d compared to lqmThreshold = %d. Thus using NoProtection instead of Snapshot version: wifi2G5GChannelType7Snapshot=%@, wifiEnhChannelType7Snapshot=%@, wifi2G5GChannelType7NoProtection=%@, wifiEnhChannelType7NoProtection=%@, skipIOVARAssert_2G5G=%d, skipIOVARAssert_Enh=%d";
        }
        else
        {
          if ((v3 & v11 & 1) == 0) {
            [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] updateChannelsToEnableType7MSGWiFiEnh:v5 WiFiEnhChannels:v6];
          }
          CFStringRef v13 = @"Combined WiFi bitmap for Type7 MSG (extended from LTEMB Only):: callActiveState=%d, lqmCurrent = %d compared to lqmThreshold = %d. Thus using Snapshot version instead of NoProtection version: wifi2G5GChannelType7Snapshot=%@, wifiEnhChannelType7Snapshot=%@, wifi2G5GChannelType7NoProtection=%@, wifiEnhChannelType7NoProtection=%@, skipIOVARAssert_2G5G=%d, skipIOVARAssert_Enh=%d";
        }
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, v13, v9, v10, 50, v5, v6, v7, v8, v3, v11);
      }
    }
  }
}

- (void)updateBTCatsState:(unsigned __int8)a3 bitmap:(unint64_t)a4 band:(int)a5 desiredBtDc:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v9 = a3;
  if ([(WCM_PolicyManager *)self btController])
  {
    id v11 = [(WCM_PolicyManager *)self btController];
    [(WCM_BTController *)v11 updateWiFiCatsState:v9 bitmap:a4 band:v7 desiredBtDc:v6];
  }
  else
  {
    +[WCM_Logging logLevel:2 message:@"BT Controller is not alloc'd"];
  }
}

- (void)handleWiFiConfigChange
{
  id v3 = [(WCM_PolicyManager *)self wifiController];
  BOOL v4 = [(WCM_PolicyManager *)self cellularController];
  unsigned int v5 = [(WCM_WiFiController *)v3 wifiState];
  id v6 = (id)[(WCM_WiFiController *)v3 wifiChannel];
  +[WCM_Logging logLevel:4 message:@" YYDebug_ Handling WIFI Network Config change"];
  if (![(WCM_PlatformManager *)[(WCM_PolicyManager *)self platformManager] wcmWiFiCellCoexIssueTable])
  {
    unint64_t v8 = v5 == 2
      && v6 >= 0xB
      && [(WCM_CellularController *)v4 isInCoexBand7LowerEdge]
       ? [(WCM_PlatformManager *)[(WCM_PolicyManager *)self platformManager] wcmCellularWCI2ModeLTEMaxTxPowerLow]: [(WCM_PlatformManager *)[(WCM_PolicyManager *)self platformManager] wcmCellularWCI2ModeLTEMaxTxPowerHigh];
    [(WCM_CellularController *)v4 updateControllerTxPower:[(NSNumber *)v8 intValue]];
    if (v5 == 2
      && v6
      && [(WCM_PolicyManager *)self isWiFiChannel:v6 inChannelMap:[(WCM_PolicyManager *)self legacyWiFiBlocklistChannelsFor3FoWiFi]])
    {
      [(WCM_PolicyManager *)self setWifiRxPriThreshold:[(WCM_PlatformManager *)[(WCM_PolicyManager *)self platformManager] wcmWiFiPriThresholdMed]];
      +[WCM_Logging logLevel:4, @"WiFi associated on 3Fo Impacted channel %d", v6 message];
    }
  }
  [(WCM_PolicyManager *)self configureWiFiChannelMap];
  if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"PencilCoexSupport"])
  {
    [(WCM_PolicyManager *)self handleWiFiBTCoexChange];
  }
  [(WCM_PolicyManager *)self configureWifiAntennaSelectionForCoex];
  [(WCM_PolicyManager *)self updateCellTxPowerLimit];
  [(WCM_WiFiController *)v3 updateMWSFrameConfig:v4];
  if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"CellularNeedWiFiStatus"])
  {
    if ([(WCM_PolicyManager *)self audioBuiltInReceiver]) {
      unsigned int v7 = [(WCM_WiFiController *)v3 headTxPowerCapdBm];
    }
    else {
      unsigned int v7 = [(WCM_WiFiController *)v3 bodyTxPowerCapdBm];
    }
    [(WCM_CellularController *)v4 updateWiFiStatusCenterFreq:[(WCM_WiFiController *)v3 channelCenterFreqMHz] bandwidth:[(WCM_WiFiController *)v3 channelBandwidthMHz] txPower:v7];
  }
  [(WCM_PolicyManager *)self updateCoexMonitorState:[(WCM_PolicyManager *)self cellularCoexBand]];
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"BB22_N79_DYNAMIC_ANTENNA_BLOCKING"))
  {
    +[WCM_Logging logLevel:4 message:@" YYDebug_ DynamicBlockingEnh enabled"];
    if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"BB22_N79_DYNAMIC_ANTENNA_BLOCKING"])
    {
      +[WCM_Logging logLevel:4 message:@"YYDebug_ BB22_N79_DYNAMIC_ANTENNA_BLOCKING is active"];
      if ([(WCM_PolicyManager *)self processDynamicAntennaBlocking])
      {
        +[WCM_Logging logLevel:4, @"YYDebug_ reconfigure antenna blocking to idx 1 %d and idx 2 %d", self->_dynamicCellAntBlkEnableIdx1, self->_dynamicCellAntBlkEnableIdx2 message];
        [(WCM_MavAntennaPolicy *)[(WCM_PolicyManager *)self mavAntPolicy] reconfigureClientAntBlockingParamsWithCellAntBlkEnableIdx1:self->_dynamicCellAntBlkEnableIdx1 cellAntBlkEnableIdx2:self->_dynamicCellAntBlkEnableIdx2];
      }
    }
  }
  [(WCM_PolicyManager *)self updateWiFiCoexState];
  if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"CTSacDriverNeedWiFiFreq"])
  {
    [(WCM_PolicyManager *)self updateCTSacDriverWifiInfo];
  }
  if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"CoexBBUnifiedSensorInfoSupport"])
  {
    [(WCM_CellularController *)[(WCM_PolicyManager *)self cellularController] sendBBCoexSensorMessage:1 band:v5 usecase:0];
  }
  if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"SacPolicySupport"]&& ![(WCM_SacManager *)self->_sacManager isTestMode])
  {
    uint64_t v9 = [(WCM_SacManager *)self->_sacManager getQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002468C;
    block[3] = &unk_10020DAB0;
    block[4] = self;
    block[5] = v3;
    dispatch_async(v9, block);
  }
  if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WifiGen9rFemConfig"])
  {
    [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] updateGen9rFemConfiguration];
  }
}

- (void)evaluateULCARestrictions
{
  id v3 = [(WCM_PolicyManager *)self platformManager];
  BOOL v4 = [(WCM_PolicyManager *)self cellularController];
  unsigned int v55 = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiChannel];
  unsigned int v53 = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] channelCenterFreqMHz];
  unsigned int v52 = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] channelBandwidthMHz];
  if (v4)
  {
    unsigned int v5 = [(WCM_CellularController *)v4 getActiveULCAConfig];
    if (v5)
    {
      id v6 = v5;
      [(WCM_CellularController *)v4 bandInfoType];
      *(void *)&v6->int var3 = 0;
      v6->unint64_t var5 = 0;
      v6->var9 = 0;
      if (v6->var1)
      {
        unint64_t v7 = 0;
        id v54 = 0;
        p_unint64_t var5 = &v6->var0[0].var5;
        uint64_t v9 = 99;
        while (1)
        {
          double v10 = *((double *)p_var5 - 3);
          double v11 = *((double *)p_var5 - 2);
          double v12 = *((double *)p_var5 - 5);
          double v13 = *((double *)p_var5 - 4);
          double v14 = v10 - v11 * 0.5;
          double v15 = v10 + v11 * 0.5;
          double v16 = v12 - v13 * 0.5;
          double v17 = v12 + v13 * 0.5;
          __int16 v56 = 0;
          +[WCM_Logging logLevel:2, @"YYDebug_ evaluateULCARestrictions Carrier %d, UL (%f, %f)", v7, *(void *)&v16, *(void *)&v17 message];
          *((unsigned char *)p_var5 + 28) = 0;
          uint64_t v18 = *((unsigned int *)p_var5 + 6);
          +[WCM_Logging logLevel:4, @"DLDebug_ CC2UnitTest cellBandInfoType: In function evaluateULCARestrictions, ulcaConfig->scell_config[%d].cellBandInfoType = %d", v7, v18 message];
          unsigned int v19 = [(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiEnhCoexSupport"];
          unsigned int v20 = [(WCM_PlatformManager *)v3 wcmWiFiCellCoexIssueTable];
          BOOL v21 = [(WCM_PolicyManager *)self gpsRadioActive];
          if (v19) {
            id v22 = [(WCM_WiFiCellCoexIssueBandTable *)v20 findWiFiAntennaOrCellTxPowerConstraintWiFiEnhCoexIssueByCellBandInfoType:v18 cellDlLowFreq:v55 cellDlHighFreq:v53 cellUlLowFreq:v52 cellUlHighFreq:v21 wifiChannel:(char *)&v56 + 1 wifiCenterFreq:v14 wifiBandwidth:v15 gpsRadioActive:v16 wifiAntennaConstraint:v17 cellTxPowerConstraint:&v56];
          }
          else {
            id v22 = [(WCM_WiFiCellCoexIssueBandTable *)v20 findWiFiAntennaOrCellTxPowerConstraintCoexIssueByCellBandInfoType:v18 cellDlLowFreq:v55 cellDlHighFreq:v21 cellUlLowFreq:(char *)&v56 + 1 cellUlHighFreq:&v56 wifiChannel:v14 gpsRadioActive:v15 wifiAntennaConstraint:v16 cellTxPowerConstraint:v17];
          }
          id *p_var5 = v22;
          if (v22)
          {
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, @"evaluateULCARestrictions - ULCA Priority %d", [v22 ulcaPriority]);
            if (!v6->var10)
            {
              v6->int var2 = v7;
              v6->var10 = 1;
              goto LABEL_14;
            }
            unsigned int v23 = [*p_var5 ulcaPriority];
            if (v23 < [v54 ulcaPriority])
            {
              v6->int var2 = v7;
LABEL_14:
              id v54 = *p_var5;
            }
          }
          else
          {
            +[WCM_Logging logLevel:3 message:@"evaluateULCARestrictions - ULCA NO Coex issue"];
          }
          if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiWCI2BitmapV2Enabled"])
          {
            id v24 = [(WCM_WiFiCellCoexIssueBandTable *)[(WCM_PlatformManager *)v3 wcmWiFiCellCoexIssueTable] findWiFiVictimCoexIssueByCellBandInfoType:v18 cellDlLowFreq:v14 cellDlHighFreq:v15 cellUlLowFreq:v16 cellUlHighFreq:v17];
            p_var5[1] = v24;
            if (v24)
            {
              +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, @"DLDebug_ CC2UnitTest: for ulcaConfig->scell_config[%d], currentPri_CCWiFi (%d) > ulcaConfig->scell_config[%d].coexIssueCCWiFi.ulcaPriorityCCWiFi (%d)", v7, v9, v7, [v24 ulcaPriorityCCWiFi]);
              unsigned int v25 = [p_var5[1] ulcaPriorityCCWiFi];
              id v24 = p_var5[1];
              if (v25)
              {
                unsigned int v26 = [v24 ulcaPriorityCCWiFi];
                id v24 = p_var5[1];
                if (v9 > v26)
                {
                  uint64_t v9 = (uint64_t)[v24 ulcaPriorityCCWiFi];
                  v6->int var3 = v7;
                  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, @"DLDebug_ CC2UnitTest: if condition (currentPri_CCWiFi > ulcaConfig->scell_config[%d].coexIssueCCWiFi.ulcaPriorityCCWiFi) is true. After assignment, currentPri_CCWiFi = (%d) and ulcaConfig->scell_config[i].coexIssueCCWiFi.ulcaPriorityCCWiFi=(%d)", v7, v9, [p_var5[1] ulcaPriorityCCWiFi]);
                  id v24 = p_var5[1];
                }
              }
            }
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, @"DLDebug_ CC2UnitTest: Upon finishing single iteration (%d), ulcaConfig->scell_config[%d].coexIssueCCWiFi.ulcaPriorityCCWiFi=%d and currentPri_CCWiFi=(%d)", v7, v7, [v24 ulcaPriorityCCWiFi], v9);
          }
          if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFi5GHzType7NR79AntBlocking"])
          {
            unsigned int v27 = [(WCM_WiFiCellCoexIssueBandTable *)[(WCM_PlatformManager *)v3 wcmWiFiCellCoexIssueTable] isNR79FoundForCellUlLowFreq:v16 cellUlHighFreq:v17];
            *((unsigned char *)p_var5 + 28) = v27;
            +[WCM_Logging logLevel:4, @"DLDebug_ CC2UnitTest: ulcaConfig->scell_config[%d].nr79Found=%d", v7, v27 message];
            unint64_t var4 = v6->var4;
            if (*((unsigned char *)p_var5 + 28) && v17 > v6->var0[(int)var4].var0 + v6->var0[(int)var4].var1 * 0.5)
            {
              v6->unint64_t var4 = v7;
              unint64_t var4 = v7;
            }
            +[WCM_Logging logLevel:4, @"DLDebug_ CC2UnitTest: for ulcaConfig->scell_config[%d], ulcaConfig->criticalCarrieridxNR79=%d", v7, var4 message];
          }
          if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"Type72GWiFiSupport"])
          {
            unsigned int v29 = [(WCM_WiFiCellCoexIssueBandTable *)[(WCM_PlatformManager *)v3 wcmWiFiCellCoexIssueTable] isLTEB7FoundForCellDlLowFreq:v14 cellDlHighFreq:v15 cellUlLowFreq:v16 cellUlHighFreq:v17];
            *((unsigned char *)p_var5 + 29) = v29;
            +[WCM_Logging logLevel:4, @"TYPE7_2GWIFI_SUPPORT_ : ulcaConfig->scell_config[%d].lteB7Found=%d", v7, v29 message];
            unint64_t var5 = v6->var5;
            if (*((unsigned char *)p_var5 + 29) && v11 > v6->var0[(int)var5].var3 && v6->var0[(int)var5].var10)
            {
              v6->unint64_t var5 = v7;
              unint64_t var5 = v7;
            }
            +[WCM_Logging logLevel:4, @"TYPE7_2GWIFI_SUPPORT_ for ulcaConfig->scell_config[%d], ulcaConfig->criticalCarrieridxLTEB7=%d", v7, var5 message];
          }
          ++v7;
          p_var5 += 9;
          if (v7 >= v6->var1)
          {
            int var3 = v6->var3;
            int v32 = v6->var4;
            int v33 = v6->var5;
            goto LABEL_35;
          }
        }
      }
      int v33 = 0;
      int v32 = 0;
      int var3 = 0;
      uint64_t v9 = 99;
LABEL_35:
      v34 = &v6->var0[var3];
      long long v35 = *(_OWORD *)&v34->var2;
      *(void *)&v6->var6.uint64_t var8 = *(void *)&v34->var8;
      *(_OWORD *)&v6->var6.var6 = *(_OWORD *)&v34->var6;
      *(_OWORD *)&v6->var6.double var0 = *(_OWORD *)&v34->var0;
      long long v36 = *(_OWORD *)&v34->var4;
      *(_OWORD *)&v6->var6.int var2 = v35;
      *(_OWORD *)&v6->var6.unint64_t var4 = v36;
      v37 = &v6->var0[v32];
      *(_OWORD *)&v6->var7.double var0 = *(_OWORD *)&v37->var0;
      long long v38 = *(_OWORD *)&v37->var6;
      uint64_t v39 = *(void *)&v37->var8;
      long long v40 = *(_OWORD *)&v37->var2;
      *(_OWORD *)&v6->var7.unint64_t var4 = *(_OWORD *)&v37->var4;
      *(_OWORD *)&v6->var7.int var2 = v40;
      *(void *)&v6->var7.uint64_t var8 = v39;
      *(_OWORD *)&v6->var7.var6 = v38;
      v41 = &v6->var0[v33];
      *(_OWORD *)&v6->var8.double var0 = *(_OWORD *)&v41->var0;
      long long v42 = *(_OWORD *)&v41->var2;
      long long v43 = *(_OWORD *)&v41->var4;
      long long v44 = *(_OWORD *)&v41->var6;
      *(void *)&v6->var8.uint64_t var8 = *(void *)&v41->var8;
      *(_OWORD *)&v6->var8.unint64_t var4 = v43;
      *(_OWORD *)&v6->var8.var6 = v44;
      *(_OWORD *)&v6->var8.int var2 = v42;
      int var2 = v6->var2;
      if (var2 == -1) {
        +[WCM_Logging logLevel:3, @"evaluateULCARestrictions -ULCA NO Coex issue to report", v47, v49 message];
      }
      else {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, @"evaluateULCARestrictions - ULCA Priority - Selected coex Priority = %d and Critical Carrier Index = %d", [v6->var0[var2].var5 ulcaPriority], v6->var2);
      }
      if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiWCI2BitmapV2Enabled"])
      {
        int v46 = v6->var3;
        if (v46 == -1) {
          +[WCM_Logging logLevel:3, @"WCI2V2 - ULCA NO Coex issue to report", v48, v50, v51 message];
        }
        else {
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, @"WCI2V2 - CC_WiFi priority is %d (self test value (currentPri_CCWiFi): %d) and CC_WiFi Index = %d", [v6->var0[v46].var6 ulcaPriorityCCWiFi], v9, v6->var3);
        }
      }
    }
  }
}

- (void)handleWiFiBTCatsChange:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiState];
  uint64_t v6 = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] catsAppPriority];
  unint64_t v7 = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] catsAppBitmap];
  if (v3)
  {
    +[WCM_Logging logLevel:2 message:@"handleWiFiBTCatsChange WiFi is turning off"];
    uint64_t v6 = 0;
    uint64_t v8 = 0;
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v8 = v7;
  }
  +[WCM_Logging logLevel:2, @"handleWiFiBTCatsChange catsState(%d -> %d) bitmap(0x%x -> 0x%x) wifiState(%d -> %d)", byte_10027D2E0, v6, qword_10027D2E8, v8, dword_10027D2DC, v5 message];
  if (byte_10027D2E0 != v6 || qword_10027D2E8 != v8 || dword_10027D2DC != v5)
  {
    if ((v5 - 1) > 3) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = dword_1001EB0C0[(int)v5 - 1];
    }
    if (v6 == 2) {
      uint64_t v10 = 3;
    }
    else {
      uint64_t v10 = 0;
    }
    +[WCM_Logging logLevel:2 message:@"handleWiFiBTCatsChange updating cats state to BT"];
    [(WCM_PolicyManager *)self updateBTCatsState:v6 bitmap:v8 band:v9 desiredBtDc:v10];
    dword_10027D2DC = v5;
    byte_10027D2E0 = v6;
    qword_10027D2E8 = v8;
  }
}

- (void)setWcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap:(unint64_t)a3
{
  self->_wcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap = a3;
}

- (void)setWcmCellularWCI2Mode_Ext_Enable:(BOOL)a3
{
  self->_wcmCellularWCI2Mode_Ext_Enable = a3;
}

- (void)setWcmCellularCCSetToBB:(BOOL)a3
{
  self->_wcmCellularCCSetToBB = a3;
}

- (unint64_t)wcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap
{
  return self->_wcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap;
}

- (unint64_t)wcmCellularWCI2Mode_CC2
{
  return self->_wcmCellularWCI2Mode_CC2;
}

- (void)updateWiFiRCU1Status
{
  if (![(WCM_PolicyManager *)self rcu1Controller]) {
    return;
  }
  if (![(WCM_PolicyManager *)self wifiController])
  {
    BOOL v3 = 0;
LABEL_9:
    uint64_t v5 = 0;
    goto LABEL_11;
  }
  BOOL v3 = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] powerState];
  unsigned int v4 = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiState];
  if (v4 == 4 || v4 == 3)
  {
    uint64_t v5 = 2;
    goto LABEL_11;
  }
  if (v4 != 2) {
    goto LABEL_9;
  }
  uint64_t v5 = 1;
LABEL_11:
  if ([(WCM_PolicyManager *)self btController])
  {
    BOOL v6 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] powerState];
    BOOL v7 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] getAny5GHzBTDevicesConnected];
  }
  else
  {
    BOOL v6 = 0;
    BOOL v7 = 0;
  }
  uint64_t v8 = [(WCM_PolicyManager *)self rcu1Controller];

  [(WCM_R1Controller *)v8 sendRCU1Message:v3 wifiBand:v5 btPowerState:v6 btBand:v7 isForce:0];
}

- (void)evaluateGen9rFemConfig
{
  v2 = [(WCM_PolicyManager *)self cellularController];
  if (v2)
  {
    BOOL v3 = v2;
    unsigned int v4 = [(WCM_CellularController *)v2 getActiveULCAConfig];
    if (v4)
    {
      uint64_t v5 = v4;
      [(WCM_CellularController *)v3 bandInfoType];
      if (v5->var1)
      {
        uint64_t v6 = 0;
        char v69 = 1;
        char v70 = 1;
        v71 = v5;
        while (1)
        {
          BOOL v7 = &v5->var0[v6];
          double var1 = v7->var1;
          double var2 = v7->var2;
          double v10 = v7->var0 - var1 * 0.5;
          double v11 = v7->var0 + var1 * 0.5;
          double v12 = v7->var3 * 0.5;
          double v13 = var2 - v12;
          double v14 = var2 + v12;
          unsigned int var8 = v7->var8;
          +[WCM_Logging logLevel:4, @"evaluateGen9rFemConfig, cellBandInfoType = %d ulCFreq %f ulBw %f", var8, *(void *)&v7->var0, *(void *)&var1 message];
          if (var8 == 64) {
            break;
          }
          if (var8 == 1)
          {
            id v16 = [(WCM_PolicyManager *)self getLTErFemFrequencyRanges:1];
            long long v85 = 0u;
            long long v86 = 0u;
            long long v87 = 0u;
            long long v88 = 0u;
            id v17 = [v16 countByEnumeratingWithState:&v85 objects:v92 count:16];
            if (v17)
            {
              id v18 = v17;
              uint64_t v19 = *(void *)v86;
              while (2)
              {
                for (i = 0; i != v18; i = (char *)i + 1)
                {
                  if (*(void *)v86 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  BOOL v21 = *(void **)(*((void *)&v85 + 1) + 8 * i);
                  [objc_msgSend(v21, "objectForKey:", @"frequency_lower") floatValue];
                  double v23 = v22;
                  [objc_msgSend(v21, "objectForKey:", @"frequency_upper") floatValue];
                  +[WCM_Logging logLevel:4, @"evaluateGen9rFemConfig wifi 2g %f %f %f %f", *(void *)&v10, *(void *)&v11, *(void *)&v23, v24 message];
                  [objc_msgSend(v21, "objectForKey:", @"frequency_lower") floatValue];
                  if (v10 < v25
                    || (objc_msgSend(objc_msgSend(v21, "objectForKey:", @"frequency_upper"), "floatValue"),
                        v10 > v26))
                  {
                    [objc_msgSend(v21, "objectForKey:", @"frequency_lower") floatValue];
                    if (v11 < v27) {
                      continue;
                    }
                    [objc_msgSend(v21, "objectForKey:", @"frequency_upper") floatValue];
                    if (v11 > v28) {
                      continue;
                    }
                  }
                  char v69 = 0;
                  goto LABEL_32;
                }
                id v18 = [v16 countByEnumeratingWithState:&v85 objects:v92 count:16];
                if (v18) {
                  continue;
                }
                break;
              }
            }
LABEL_32:

            id v42 = [(WCM_PolicyManager *)self getLTErFemFrequencyRanges:0];
            long long v81 = 0u;
            long long v82 = 0u;
            long long v83 = 0u;
            long long v84 = 0u;
            id v43 = [v42 countByEnumeratingWithState:&v81 objects:v91 count:16];
            if (v43)
            {
              id v44 = v43;
              uint64_t v45 = *(void *)v82;
LABEL_34:
              uint64_t v46 = 0;
              while (1)
              {
                if (*(void *)v82 != v45) {
                  objc_enumerationMutation(v42);
                }
                uint64_t v47 = *(void **)(*((void *)&v81 + 1) + 8 * v46);
                [objc_msgSend(v47, "objectForKey:", @"frequency_lower") floatValue];
                double v49 = v48;
                [objc_msgSend(v47, "objectForKey:", @"frequency_upper") floatValue];
                +[WCM_Logging logLevel:4, @"evaluateGen9rFemConfig wifi 5g %f %f %f %f", *(void *)&v13, *(void *)&v14, *(void *)&v49, v50 message];
                [objc_msgSend(v47, "objectForKey:", @"frequency_lower") floatValue];
                if (v13 >= v51)
                {
                  [objc_msgSend(v47, "objectForKey:", @"frequency_upper") floatValue];
                  if (v13 <= v52) {
                    goto LABEL_57;
                  }
                }
                [objc_msgSend(v47, "objectForKey:", @"frequency_lower") floatValue];
                if (v14 >= v53)
                {
                  [objc_msgSend(v47, "objectForKey:", @"frequency_upper") floatValue];
                  if (v14 <= v54) {
                    goto LABEL_57;
                  }
                }
                if (v44 == (id)++v46)
                {
                  id v44 = [v42 countByEnumeratingWithState:&v81 objects:v91 count:16];
                  if (v44) {
                    goto LABEL_34;
                  }
                  goto LABEL_58;
                }
              }
            }
            goto LABEL_58;
          }
LABEL_59:
          if (++v6 >= (unint64_t)v5->var1) {
            goto LABEL_63;
          }
        }
        id v29 = [(WCM_PolicyManager *)self getNRrFemFrequencyRanges:1];
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        id v30 = [v29 countByEnumeratingWithState:&v77 objects:v90 count:16];
        if (v30)
        {
          id v31 = v30;
          uint64_t v32 = *(void *)v78;
          while (2)
          {
            for (j = 0; j != v31; j = (char *)j + 1)
            {
              if (*(void *)v78 != v32) {
                objc_enumerationMutation(v29);
              }
              v34 = *(void **)(*((void *)&v77 + 1) + 8 * (void)j);
              [objc_msgSend(v34, "objectForKey:", @"frequency_lower") floatValue];
              double v36 = v35;
              [objc_msgSend(v34, "objectForKey:", @"frequency_upper") floatValue];
              +[WCM_Logging logLevel:4, @"evaluateGen9rFemConfig wifi 2g %f %f %f %f", *(void *)&v10, *(void *)&v11, *(void *)&v36, v37 message];
              [objc_msgSend(v34, "objectForKey:", @"frequency_lower") floatValue];
              if (v10 < v38
                || (objc_msgSend(objc_msgSend(v34, "objectForKey:", @"frequency_upper"), "floatValue"), v10 > v39))
              {
                [objc_msgSend(v34, "objectForKey:", @"frequency_lower") floatValue];
                if (v11 < v40) {
                  continue;
                }
                [objc_msgSend(v34, "objectForKey:", @"frequency_upper") floatValue];
                if (v11 > v41) {
                  continue;
                }
              }
              char v69 = 0;
              goto LABEL_45;
            }
            id v31 = [v29 countByEnumeratingWithState:&v77 objects:v90 count:16];
            if (v31) {
              continue;
            }
            break;
          }
        }
LABEL_45:

        id v42 = [(WCM_PolicyManager *)self getNRrFemFrequencyRanges:0];
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        id v55 = [v42 countByEnumeratingWithState:&v73 objects:v89 count:16];
        if (v55)
        {
          id v56 = v55;
          uint64_t v57 = *(void *)v74;
LABEL_47:
          uint64_t v58 = 0;
          while (1)
          {
            if (*(void *)v74 != v57) {
              objc_enumerationMutation(v42);
            }
            v59 = *(void **)(*((void *)&v73 + 1) + 8 * v58);
            [objc_msgSend(v59, "objectForKey:", @"frequency_lower") floatValue];
            double v61 = v60;
            [objc_msgSend(v59, "objectForKey:", @"frequency_upper") floatValue];
            +[WCM_Logging logLevel:4, @"evaluateGen9rFemConfig wifi 5g %f %f %f %f", *(void *)&v13, *(void *)&v14, *(void *)&v61, v62 message];
            [objc_msgSend(v59, "objectForKey:", @"frequency_lower") floatValue];
            if (v13 >= v63)
            {
              [objc_msgSend(v59, "objectForKey:", @"frequency_upper") floatValue];
              if (v13 <= v64) {
                break;
              }
            }
            [objc_msgSend(v59, "objectForKey:", @"frequency_lower") floatValue];
            if (v14 >= v65)
            {
              [objc_msgSend(v59, "objectForKey:", @"frequency_upper") floatValue];
              if (v14 <= v66) {
                break;
              }
            }
            if (v56 == (id)++v58)
            {
              id v56 = [v42 countByEnumeratingWithState:&v73 objects:v89 count:16];
              if (v56) {
                goto LABEL_47;
              }
              goto LABEL_58;
            }
          }
LABEL_57:
          char v70 = 0;
        }
LABEL_58:

        uint64_t v5 = v71;
        goto LABEL_59;
      }
      char v69 = 1;
      char v70 = 1;
LABEL_63:
      uint64_t v67 = v69 & 1;
      uint64_t v68 = v70 & 1;
    }
    else
    {
      uint64_t v67 = 1;
      uint64_t v68 = 1;
    }
    [(WCM_PolicyManager *)self setWcmGen9rFemLpmMode2g:v67];
    [(WCM_PolicyManager *)self setWcmGen9rFemLpmMode5g:v68];
    +[WCM_Logging logLevel:2, @"evaluateGen9rFemConfig 2g Flag %d, 5g Flag %d", [(WCM_PolicyManager *)self wcmGen9rFemLpmMode2g], [(WCM_PolicyManager *)self wcmGen9rFemLpmMode5g] message];
  }
}

- (id)getLTErFemFrequencyRanges:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v4 = [(WCM_PolicyManager *)self platformManager];
  id v5 = objc_alloc_init((Class)NSMutableArray);
  if (v3)
  {
    id v6 = [(NSDictionary *)[(WCM_PlatformManager *)v4 wcmGen9rFemDefaultMode2gWiFiCellularbands] objectForKey:@"LTE"];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v7 = [v6 countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v29;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v29 != v9) {
            objc_enumerationMutation(v6);
          }
          double v11 = (double *)((char *)&unk_1001E8E10
                         + 32
                         * [*(id *)(*((void *)&v28 + 1) + 8 * i) unsignedIntValue]);
          double v12 = v11[2];
          double v13 = v11[3];
          v35[0] = @"frequency_lower";
          v36[0] = +[NSNumber numberWithDouble:v12];
          v35[1] = @"frequency_upper";
          v36[1] = +[NSNumber numberWithDouble:v13];
          [v5 addObject:[+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, v35, 2)];
        }
        id v8 = [v6 countByEnumeratingWithState:&v28 objects:v37 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v14 = [(NSDictionary *)[(WCM_PlatformManager *)v4 wcmGen9rFemDefaultMode5gWiFiCellularbands] objectForKey:@"LTE"];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v15 = [v14 countByEnumeratingWithState:&v24 objects:v34 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v25;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = (double *)((char *)&unk_1001E8E10
                         + 32
                         * [*(id *)(*((void *)&v24 + 1) + 8 * (void)j) unsignedIntValue]);
          double v20 = v19[2];
          double v21 = v19[3];
          v32[0] = @"frequency_lower";
          float v22 = +[NSNumber numberWithDouble:v20];
          v32[1] = @"frequency_upper";
          v33[0] = v22;
          v33[1] = +[NSNumber numberWithDouble:v21];
          [v5 addObject:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 2)];
        }
        id v16 = [v14 countByEnumeratingWithState:&v24 objects:v34 count:16];
      }
      while (v16);
    }
  }
  return v5;
}

- (void)updateWiFiRCU1ULOFDMAStatus
{
  +[WCM_Logging logLevel:2 message:@"Handle WiFi NR UL_OFDMA Coex change"];
  if ([(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] powerState])
  {
    unsigned int v3 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") activeCoexFeatures] containsObject:@"RCU1R2Support"];
    unsigned int v4 = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiState];
    unsigned int v5 = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] didWiFiDeviceReset];
    if (v4 >= 4)
    {
      id v6 = "INVALID_STATE!!!";
      if (v4 == 4) {
        id v6 = "ASSOCIATED_6G";
      }
    }
    else
    {
      id v6 = off_100211678[v4];
    }
    +[WCM_Logging logLevel:2, @"WiFiState(%s)", v6 message];
    unsigned int v7 = [(WCM_R1Controller *)[(WCM_PolicyManager *)self rcu1Controller] mRCU1PowerOn];
    unsigned int v8 = [(WCM_R1Controller *)[(WCM_PolicyManager *)self rcu1Controller] mRCU1ChannelNum];
    unsigned int v9 = v8 << 16;
    +[WCM_Logging logLevel:2, @"NR State : Power:(%d) ChannelNo:(%d)", v7, (__int16)v8 message];
    if (v9 == 327680) {
      unsigned int v10 = v7;
    }
    else {
      unsigned int v10 = 0;
    }
    if (v4 != 3) {
      unsigned int v10 = 0;
    }
    if (v4 - 3 < 2) {
      unsigned int v11 = v7;
    }
    else {
      unsigned int v11 = 0;
    }
    if (v3) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = v10;
    }
    if (byte_10027D2D5 == v12) {
      int v13 = v5;
    }
    else {
      int v13 = 1;
    }
    if (v13 == 1)
    {
      +[WCM_Logging logLevel:2, @"WiFi/RCU1 UL OFDMA disable state change prev (%d) current (%d) wifiReset (%d)", byte_10027D2D5, v12, v5 message];
      byte_10027D2D5 = v12;
      id v14 = [(WCM_PolicyManager *)self wifiController];
      [(WCM_WiFiController *)v14 updateWiFiRCU1ULOFDMAstate:v12];
    }
  }
  else
  {
    byte_10027D2D5 = 0;
  }
}

- (void)updateWiFiRCU1ModeChange
{
  BOOL v3 = [(WCM_R1Controller *)[(WCM_PolicyManager *)self rcu1Controller] mRCU1PowerOn];
  signed __int16 v4 = (unsigned __int16)[(WCM_R1Controller *)[(WCM_PolicyManager *)self rcu1Controller] mRCU1ChannelNum];
  unsigned int v5 = [(WCM_R1Controller *)[(WCM_PolicyManager *)self rcu1Controller] mRCU1NbBandMask];
  BOOL v6 = [(WCM_R1Controller *)[(WCM_PolicyManager *)self rcu1Controller] mRCU15GHzInUse];
  uint64_t v7 = [(WCM_R1Controller *)[(WCM_PolicyManager *)self rcu1Controller] mRCU1CurrentMode];
  if (![(WCM_PolicyManager *)self wifiController])
  {
    uint64_t v12 = 0;
    goto LABEL_17;
  }
  unsigned int v8 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") activeCoexFeatures] containsObject:@"RCU1R2Support"];
  unsigned int v9 = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiState];
  unsigned int v10 = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] didWiFiDeviceReset];
  unsigned int v11 = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] powerState];
  if (v8)
  {
    if (v11 & v3)
    {
      if (v5) {
        signed __int16 v4 = 5;
      }
      uint64_t v12 = 257;
      if (v10) {
        goto LABEL_19;
      }
LABEL_17:
      uint64_t v14 = 0;
      goto LABEL_20;
    }
LABEL_18:
    uint64_t v12 = 0;
    uint64_t v14 = 0;
    if (!v10) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (v9 == 3) {
    unsigned int v13 = v11;
  }
  else {
    unsigned int v13 = 0;
  }
  if (v13 != 1) {
    goto LABEL_18;
  }
  uint64_t v12 = v4 == 5 && v3;
  if ((v10 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_19:
  uint64_t v14 = 1;
  +[WCM_Logging logLevel:2, @"updateWiFiRCU1ModeChange wifiReset (%d)", 1 message];
LABEL_20:
  uint64_t v15 = v14;
  if (v12 != v7)
  {
    +[WCM_Logging logLevel:2, @"updateWiFiRCU1ModeChange mode change old (0x%04x) new (0x%04x)", v7, v12 message];
    [(WCM_R1Controller *)[(WCM_PolicyManager *)self rcu1Controller] setMRCU1CurrentMode:v12];
    uint64_t v15 = 1;
  }
  if (word_10027CD10 != v4)
  {
    +[WCM_Logging logLevel:2, @"updateWiFiRCU1ModeChange chan change old (%d) new (%d)", word_10027CD10, v4 message];
    word_10027CD10 = v4;
    uint64_t v14 = 1;
  }
  if (v3 != word_10027D2D6)
  {
    +[WCM_Logging logLevel:2, @"updateWiFiRCU1ModeChange pwr change old (%d) new (%d)", (unsigned __int16)word_10027D2D6, v3 message];
    word_10027D2D6 = v3;
    if (!v3) {
      signed __int16 v4 = 0;
    }
    uint64_t v14 = 1;
    goto LABEL_30;
  }
  if ((v15 | v14) == 1) {
LABEL_30:
  }
    [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] updateWiFiRCU1ModeChanged:v15 andChannelChanged:v14 andMode:+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v12) andChannel:+[NSNumber numberWithShort:v4]];
  if (word_10027D2D8 != v6)
  {
    if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiFigaroCoex"])
    {
      [(WCM_BTController *)[(WCM_PolicyManager *)self btController] updateUWB5GHzActive:v6];
      word_10027D2D8 = v6;
    }
  }
}

- (void)handleWiFiRCU1Change
{
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"RCU1Support"))
  {
    [(WCM_PolicyManager *)self updateWiFiRCU1ULOFDMAStatus];
    [(WCM_PolicyManager *)self updateWiFiRCU1ModeChange];
    [(WCM_PolicyManager *)self updateWiFiRCU1Status];
    if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"LTELAACoexSupport")&& -[WCM_PolicyManager cellularController](self, "cellularController"))
    {
      [(WCM_CellularController *)[(WCM_PolicyManager *)self cellularController] updateBBRC1Params:[(WCM_R1Controller *)[(WCM_PolicyManager *)self rcu1Controller] mRCU1PowerOn] channel:[(WCM_R1Controller *)[(WCM_PolicyManager *)self rcu1Controller] mRCU1ChannelNum] duration:[(WCM_R1Controller *)[(WCM_PolicyManager *)self rcu1Controller] mRCU1OnDuration] priority:[(WCM_R1Controller *)[(WCM_PolicyManager *)self rcu1Controller] mRCU1UseCaseNum]];
    }
    if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"CoexBBUnifiedSensorInfoSupport"])
    {
      unsigned int v3 = [(WCM_R1Controller *)[(WCM_PolicyManager *)self rcu1Controller] mRCU1PowerOn];
      signed __int16 v4 = [(WCM_PolicyManager *)self cellularController];
      unsigned int v5 = [(WCM_PolicyManager *)self rcu1Controller];
      if (v3) {
        unsigned __int8 v6 = [(WCM_R1Controller *)v5 mRCU1ChannelNum];
      }
      else {
        unsigned __int8 v6 = [(WCM_R1Controller *)v5 mRCU1PowerOn];
      }
      unsigned __int8 v7 = v6;
      uint64_t v8 = [(WCM_R1Controller *)[(WCM_PolicyManager *)self rcu1Controller] mRCU1UseCaseNum];
      [(WCM_CellularController *)v4 sendBBCoexSensorMessage:3 band:v7 usecase:v8];
    }
  }
}

- (WCM_R1Controller)rcu1Controller
{
  return self->_rcu1Controller;
}

- (WCM_CellularController)cellularController
{
  return self->_cellularController;
}

- (void)updateControllerState:(unint64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100024038;
  v3[3] = &unk_10020DB90;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async([+[WCM_Server singleton](WCM_Server, "singleton") getQueue], v3);
}

- (void)configureWifiAntennaSelectionForCoex
{
  +[WCM_Logging logLevel:2, @"YYDebug_ configureWifiAntennaSelectionForCoex: wifi state = %d, ", [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiState] message];
  if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"AntennaSelectionCoex"]|| ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"AntennaSelectionV2Coex"]|| [(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"AntennaSelectionV1_1Coex"])&& ![(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiEnhCoexSupport"])
  {
    [(WCM_PolicyManager *)self updateWifiAntennaSelectionV1V2Configs];
  }
  else if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"AntennaSelectionV2Coex"]&& [(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiEnhCoexSupport"])
  {
    if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"PencilCoexSupport"])
    {
      if (self->_pencilCoexActive)
      {
        unsigned int v3 = [(WCM_PolicyManager *)self getWifiAntennaBitmapForPencilCoexByPlatform];
        uint64_t v4 = v3 | 0x800;
        unsigned int v18 = v3 | 0x1800;
        unsigned int v5 = v3 | 0x2800;
        uint64_t v6 = v3 | 0x3800;
        uint64_t v7 = v3 | 0x4800;
        uint64_t v8 = v3 | 0x5800;
        uint64_t v9 = v3 | 0x6800;
        unsigned int v10 = v3 | 0x7800;
      }
      else
      {
        uint64_t v4 = 0;
        unsigned int v18 = 4096;
        unsigned int v5 = 0x2000;
        uint64_t v6 = 12288;
        uint64_t v7 = 0x4000;
        uint64_t v8 = 20480;
        uint64_t v9 = 24576;
        unsigned int v10 = 28672;
      }
      if ([(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiState])
      {
        if ([(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiState] == 1)
        {
          unsigned int v11 = "ENABLED";
        }
        else if ([(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiState] == 2)
        {
          unsigned int v11 = "ASSOCIATED_2G";
        }
        else if ([(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiState] == 3)
        {
          unsigned int v11 = "ASSOCIATED_5G";
        }
        else
        {
          unsigned int v12 = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiState];
          unsigned int v11 = "INVALID_STATE!!!";
          if (v12 == 4) {
            unsigned int v11 = "ASSOCIATED_6G";
          }
        }
      }
      else
      {
        unsigned int v11 = "DISABLED";
      }
      unsigned int v17 = v5;
      +[WCM_Logging logLevel:1, @"YYDebug_ configureAntennaForCoex: with WiFi State (%s), Pencil coex antenna selection for band 2G, bitmaps 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x", v11, v4, v18, v5, v6, v7, v8, v9, v10 message];
    }
    else
    {
      uint64_t v4 = 0;
      unsigned int v10 = 28672;
      uint64_t v9 = 24576;
      uint64_t v8 = 20480;
      uint64_t v7 = 0x4000;
      uint64_t v6 = 12288;
      unsigned int v17 = 0x2000;
      unsigned int v18 = 4096;
    }
    unsigned __int16 v27 = 0;
    unsigned __int16 v26 = 4096;
    unsigned __int16 v25 = 0x2000;
    unsigned __int16 v24 = 12288;
    unsigned __int16 v23 = 0x4000;
    unsigned __int16 v22 = 20480;
    unsigned __int16 v21 = 24576;
    unsigned __int16 v20 = 28672;
    __int16 v19 = 0;
    [(WCM_PolicyManager *)self getUpdatedWifiAntennaSelectionEnhConfigsWithbmWifiEnhAntTx000:&v27 bmWiFiEnhAntTx001:&v26 bmWiFiEnhAntTx010:&v25 bmWiFiEnhAntTx011:&v24 bmWiFiEnhAntTx100:&v23 bmWiFiEnhAntTx101:&v22 bmWiFiEnhAntTx110:&v21 bmWiFiEnhAntTx111:&v20 bmWiFiBand:&v19];
    if (self->_pencilCoexActive)
    {
      unsigned __int16 v27 = 0;
      unsigned __int16 v26 = 4096;
      unsigned __int16 v25 = 0x2000;
      unsigned __int16 v24 = 12288;
      unsigned __int16 v23 = 0x4000;
      unsigned __int16 v22 = 20480;
      unsigned __int16 v21 = 24576;
      unsigned __int16 v20 = 28672;
      v42[0] = +[NSNumber numberWithUnsignedShort:2];
      v42[1] = +[NSNumber numberWithUnsignedShort:v27];
      v42[2] = +[NSNumber numberWithUnsignedShort:v26];
      v42[3] = +[NSNumber numberWithUnsignedShort:v25];
      v42[4] = +[NSNumber numberWithUnsignedShort:v24];
      v42[5] = +[NSNumber numberWithUnsignedShort:v23];
      v42[6] = +[NSNumber numberWithUnsignedShort:v22];
      v42[7] = +[NSNumber numberWithUnsignedShort:v21];
      v42[8] = +[NSNumber numberWithUnsignedShort:v20];
      [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] updateAntennaSelectionWiFiEnh5G:+[NSArray arrayWithObjects:v42 count:9]];
      v41[0] = +[NSNumber numberWithUnsignedShort:3];
      v41[1] = +[NSNumber numberWithUnsignedShort:v27];
      v41[2] = +[NSNumber numberWithUnsignedShort:v26];
      v41[3] = +[NSNumber numberWithUnsignedShort:v25];
      v41[4] = +[NSNumber numberWithUnsignedShort:v24];
      v41[5] = +[NSNumber numberWithUnsignedShort:v23];
      v41[6] = +[NSNumber numberWithUnsignedShort:v22];
      v41[7] = +[NSNumber numberWithUnsignedShort:v21];
      v41[8] = +[NSNumber numberWithUnsignedShort:v20];
      [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] updateAntennaSelectionWiFiEnh6G:+[NSArray arrayWithObjects:v41 count:9]];
      v40[0] = +[NSNumber numberWithUnsignedShort:1];
      v40[1] = +[NSNumber numberWithUnsignedShort:v4];
      v40[2] = +[NSNumber numberWithUnsignedShort:v18];
      v40[3] = +[NSNumber numberWithUnsignedShort:v17];
      v40[4] = +[NSNumber numberWithUnsignedShort:v6];
      v40[5] = +[NSNumber numberWithUnsignedShort:v7];
      v40[6] = +[NSNumber numberWithUnsignedShort:v8];
      v40[7] = +[NSNumber numberWithUnsignedShort:v9];
      v40[8] = +[NSNumber numberWithUnsignedShort:v10];
      uint64_t v15 = v40;
LABEL_31:
      [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] updateAntennaSelectionWiFiEnh2G:+[NSArray arrayWithObjects:v15 count:9]];
    }
    else if (!v14 & v13)
    {
      +[WCM_Logging logLevel:2 message:@"YYDebug_ Unknown WiFi band for WiFi antenna selection"];
    }
    else
    {
      switch(v19)
      {
        case 0:
          unsigned __int16 v27 = 0;
          unsigned __int16 v26 = 4096;
          unsigned __int16 v25 = 0x2000;
          unsigned __int16 v24 = 12288;
          unsigned __int16 v23 = 0x4000;
          unsigned __int16 v22 = 20480;
          unsigned __int16 v21 = 24576;
          unsigned __int16 v20 = 28672;
          v39[0] = +[NSNumber numberWithUnsignedShort:1];
          v39[1] = +[NSNumber numberWithUnsignedShort:v27];
          v39[2] = +[NSNumber numberWithUnsignedShort:v26];
          v39[3] = +[NSNumber numberWithUnsignedShort:v25];
          v39[4] = +[NSNumber numberWithUnsignedShort:v24];
          v39[5] = +[NSNumber numberWithUnsignedShort:v23];
          v39[6] = +[NSNumber numberWithUnsignedShort:v22];
          v39[7] = +[NSNumber numberWithUnsignedShort:v21];
          v39[8] = +[NSNumber numberWithUnsignedShort:v20];
          [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] updateAntennaSelectionWiFiEnh2G:+[NSArray arrayWithObjects:v39 count:9]];
          v38[0] = +[NSNumber numberWithUnsignedShort:2];
          v38[1] = +[NSNumber numberWithUnsignedShort:v27];
          v38[2] = +[NSNumber numberWithUnsignedShort:v26];
          v38[3] = +[NSNumber numberWithUnsignedShort:v25];
          v38[4] = +[NSNumber numberWithUnsignedShort:v24];
          v38[5] = +[NSNumber numberWithUnsignedShort:v23];
          v38[6] = +[NSNumber numberWithUnsignedShort:v22];
          v38[7] = +[NSNumber numberWithUnsignedShort:v21];
          v38[8] = +[NSNumber numberWithUnsignedShort:v20];
          [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] updateAntennaSelectionWiFiEnh5G:+[NSArray arrayWithObjects:v38 count:9]];
          v37[0] = +[NSNumber numberWithUnsignedShort:3];
          v37[1] = +[NSNumber numberWithUnsignedShort:v27];
          v37[2] = +[NSNumber numberWithUnsignedShort:v26];
          v37[3] = +[NSNumber numberWithUnsignedShort:v25];
          v37[4] = +[NSNumber numberWithUnsignedShort:v24];
          v37[5] = +[NSNumber numberWithUnsignedShort:v23];
          v37[6] = +[NSNumber numberWithUnsignedShort:v22];
          v37[7] = +[NSNumber numberWithUnsignedShort:v21];
          v37[8] = +[NSNumber numberWithUnsignedShort:v20];
          id v16 = v37;
          goto LABEL_38;
        case 1:
          v36[0] = +[NSNumber numberWithUnsignedShort:1];
          v36[1] = +[NSNumber numberWithUnsignedShort:v27];
          void v36[2] = +[NSNumber numberWithUnsignedShort:v26];
          v36[3] = +[NSNumber numberWithUnsignedShort:v25];
          v36[4] = +[NSNumber numberWithUnsignedShort:v24];
          v36[5] = +[NSNumber numberWithUnsignedShort:v23];
          v36[6] = +[NSNumber numberWithUnsignedShort:v22];
          v36[7] = +[NSNumber numberWithUnsignedShort:v21];
          v36[8] = +[NSNumber numberWithUnsignedShort:v20];
          [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] updateAntennaSelectionWiFiEnh2G:+[NSArray arrayWithObjects:v36 count:9]];
          unsigned __int16 v27 = 0;
          unsigned __int16 v26 = 4096;
          unsigned __int16 v25 = 0x2000;
          unsigned __int16 v24 = 12288;
          unsigned __int16 v23 = 0x4000;
          unsigned __int16 v22 = 20480;
          unsigned __int16 v21 = 24576;
          unsigned __int16 v20 = 28672;
          v35[0] = +[NSNumber numberWithUnsignedShort:2];
          v35[1] = +[NSNumber numberWithUnsignedShort:v27];
          void v35[2] = +[NSNumber numberWithUnsignedShort:v26];
          v35[3] = +[NSNumber numberWithUnsignedShort:v25];
          v35[4] = +[NSNumber numberWithUnsignedShort:v24];
          v35[5] = +[NSNumber numberWithUnsignedShort:v23];
          v35[6] = +[NSNumber numberWithUnsignedShort:v22];
          v35[7] = +[NSNumber numberWithUnsignedShort:v21];
          v35[8] = +[NSNumber numberWithUnsignedShort:v20];
          [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] updateAntennaSelectionWiFiEnh2G:+[NSArray arrayWithObjects:v35 count:9]];
          v34[0] = +[NSNumber numberWithUnsignedShort:3];
          v34[1] = +[NSNumber numberWithUnsignedShort:v27];
          v34[2] = +[NSNumber numberWithUnsignedShort:v26];
          v34[3] = +[NSNumber numberWithUnsignedShort:v25];
          v34[4] = +[NSNumber numberWithUnsignedShort:v24];
          v34[5] = +[NSNumber numberWithUnsignedShort:v23];
          v34[6] = +[NSNumber numberWithUnsignedShort:v22];
          v34[7] = +[NSNumber numberWithUnsignedShort:v21];
          v34[8] = +[NSNumber numberWithUnsignedShort:v20];
          uint64_t v15 = v34;
          goto LABEL_31;
        case 2:
          v33[0] = +[NSNumber numberWithUnsignedShort:2];
          v33[1] = +[NSNumber numberWithUnsignedShort:v27];
          void v33[2] = +[NSNumber numberWithUnsignedShort:v26];
          v33[3] = +[NSNumber numberWithUnsignedShort:v25];
          v33[4] = +[NSNumber numberWithUnsignedShort:v24];
          v33[5] = +[NSNumber numberWithUnsignedShort:v23];
          v33[6] = +[NSNumber numberWithUnsignedShort:v22];
          v33[7] = +[NSNumber numberWithUnsignedShort:v21];
          v33[8] = +[NSNumber numberWithUnsignedShort:v20];
          [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] updateAntennaSelectionWiFiEnh5G:+[NSArray arrayWithObjects:v33 count:9]];
          unsigned __int16 v27 = 0;
          unsigned __int16 v26 = 4096;
          unsigned __int16 v25 = 0x2000;
          unsigned __int16 v24 = 12288;
          unsigned __int16 v23 = 0x4000;
          unsigned __int16 v22 = 20480;
          unsigned __int16 v21 = 24576;
          unsigned __int16 v20 = 28672;
          v32[0] = +[NSNumber numberWithUnsignedShort:1];
          v32[1] = +[NSNumber numberWithUnsignedShort:v27];
          void v32[2] = +[NSNumber numberWithUnsignedShort:v26];
          v32[3] = +[NSNumber numberWithUnsignedShort:v25];
          v32[4] = +[NSNumber numberWithUnsignedShort:v24];
          v32[5] = +[NSNumber numberWithUnsignedShort:v23];
          v32[6] = +[NSNumber numberWithUnsignedShort:v22];
          v32[7] = +[NSNumber numberWithUnsignedShort:v21];
          v32[8] = +[NSNumber numberWithUnsignedShort:v20];
          [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] updateAntennaSelectionWiFiEnh2G:+[NSArray arrayWithObjects:v32 count:9]];
          v31[0] = +[NSNumber numberWithUnsignedShort:3];
          v31[1] = +[NSNumber numberWithUnsignedShort:v27];
          v31[2] = +[NSNumber numberWithUnsignedShort:v26];
          v31[3] = +[NSNumber numberWithUnsignedShort:v25];
          v31[4] = +[NSNumber numberWithUnsignedShort:v24];
          v31[5] = +[NSNumber numberWithUnsignedShort:v23];
          v31[6] = +[NSNumber numberWithUnsignedShort:v22];
          v31[7] = +[NSNumber numberWithUnsignedShort:v21];
          v31[8] = +[NSNumber numberWithUnsignedShort:v20];
          id v16 = v31;
LABEL_38:
          [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] updateAntennaSelectionWiFiEnh6G:+[NSArray arrayWithObjects:v16 count:9]];
          break;
        case 3:
          v30[0] = +[NSNumber numberWithUnsignedShort:3];
          v30[1] = +[NSNumber numberWithUnsignedShort:v27];
          v30[2] = +[NSNumber numberWithUnsignedShort:v26];
          v30[3] = +[NSNumber numberWithUnsignedShort:v25];
          v30[4] = +[NSNumber numberWithUnsignedShort:v24];
          v30[5] = +[NSNumber numberWithUnsignedShort:v23];
          v30[6] = +[NSNumber numberWithUnsignedShort:v22];
          v30[7] = +[NSNumber numberWithUnsignedShort:v21];
          v30[8] = +[NSNumber numberWithUnsignedShort:v20];
          [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] updateAntennaSelectionWiFiEnh6G:+[NSArray arrayWithObjects:v30 count:9]];
          unsigned __int16 v27 = 0;
          unsigned __int16 v26 = 4096;
          unsigned __int16 v25 = 0x2000;
          unsigned __int16 v24 = 12288;
          unsigned __int16 v23 = 0x4000;
          unsigned __int16 v22 = 20480;
          unsigned __int16 v21 = 24576;
          unsigned __int16 v20 = 28672;
          v29[0] = +[NSNumber numberWithUnsignedShort:1];
          v29[1] = +[NSNumber numberWithUnsignedShort:v27];
          v29[2] = +[NSNumber numberWithUnsignedShort:v26];
          v29[3] = +[NSNumber numberWithUnsignedShort:v25];
          v29[4] = +[NSNumber numberWithUnsignedShort:v24];
          v29[5] = +[NSNumber numberWithUnsignedShort:v23];
          v29[6] = +[NSNumber numberWithUnsignedShort:v22];
          v29[7] = +[NSNumber numberWithUnsignedShort:v21];
          v29[8] = +[NSNumber numberWithUnsignedShort:v20];
          [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] updateAntennaSelectionWiFiEnh2G:+[NSArray arrayWithObjects:v29 count:9]];
          v28[0] = +[NSNumber numberWithUnsignedShort:2];
          v28[1] = +[NSNumber numberWithUnsignedShort:v27];
          v28[2] = +[NSNumber numberWithUnsignedShort:v26];
          v28[3] = +[NSNumber numberWithUnsignedShort:v25];
          v28[4] = +[NSNumber numberWithUnsignedShort:v24];
          v28[5] = +[NSNumber numberWithUnsignedShort:v23];
          v28[6] = +[NSNumber numberWithUnsignedShort:v22];
          v28[7] = +[NSNumber numberWithUnsignedShort:v21];
          v28[8] = +[NSNumber numberWithUnsignedShort:v20];
          [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] updateAntennaSelectionWiFiEnh5G:+[NSArray arrayWithObjects:v28 count:9]];
          break;
        default:
          return;
      }
    }
  }
  else
  {
    +[WCM_Logging logLevel:2 message:@"YYDebug_ WiFi antenna selection is not supported"];
  }
}

- (void)getUpdatedWifiAntennaSelectionEnhConfigsWithbmWifiEnhAntTx000:(unsigned __int16 *)a3 bmWiFiEnhAntTx001:(unsigned __int16 *)a4 bmWiFiEnhAntTx010:(unsigned __int16 *)a5 bmWiFiEnhAntTx011:(unsigned __int16 *)a6 bmWiFiEnhAntTx100:(unsigned __int16 *)a7 bmWiFiEnhAntTx101:(unsigned __int16 *)a8 bmWiFiEnhAntTx110:(unsigned __int16 *)a9 bmWiFiEnhAntTx111:(unsigned __int16 *)a10 bmWiFiBand:(unsigned __int16 *)a11
{
  unsigned int v17 = [(WCM_PolicyManager *)self platformManager];
  unsigned int v18 = [(WCM_PolicyManager *)self cellularController];
  if ([(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiState] < 2)goto LABEL_48; {
  [(WCM_CellularController *)v18 dlCenterFreq];
  }
  if (v19 == 0.0) {
    goto LABEL_48;
  }
  [(WCM_CellularController *)v18 dlBandwidth];
  if (v20 == 0.0) {
    goto LABEL_48;
  }
  [(WCM_CellularController *)v18 ulCenterFreq];
  if (v21 == 0.0) {
    return;
  }
  [(WCM_CellularController *)v18 ulBandwidth];
  if (v22 == 0.0) {
    return;
  }
  unsigned int v47 = [(WCM_CellularController *)v18 bandInfoType];
  [(WCM_CellularController *)v18 dlCenterFreq];
  double v24 = v23;
  [(WCM_CellularController *)v18 dlBandwidth];
  double v26 = v24 - v25 * 0.5;
  [(WCM_CellularController *)v18 dlCenterFreq];
  double v28 = v27;
  [(WCM_CellularController *)v18 dlBandwidth];
  double v30 = v28 + v29 * 0.5;
  [(WCM_CellularController *)v18 ulCenterFreq];
  double v32 = v31;
  [(WCM_CellularController *)v18 ulBandwidth];
  double v34 = v32 - v33 * 0.5;
  [(WCM_CellularController *)v18 ulCenterFreq];
  double v36 = v35;
  [(WCM_CellularController *)v18 ulBandwidth];
  double v38 = v36 + v37 * 0.5;
  +[WCM_Logging logLevel:2, @"YYDebug_ configure wifi antenna selection with ul freq = (%f, %f) and dl freq = (%f, %f) ", *(void *)&v34, *(void *)&v38, *(void *)&v26, *(void *)&v30 message];
  if (![(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"EnableULCA"])
  {
    [(WCM_CellularController *)v18 getCombinedUplinkFreqRange];
    double v34 = v39;
    double v38 = v39 + v40;
  }
  v49[0] = 0;
  if (![(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiEnhCoexSupport"])
  {
    CFStringRef v43 = @"YYDebug_ updating wifi antenna selection for Enh without WiFiEnhCoexSupport";
LABEL_47:
    +[WCM_Logging logLevel:0 message:v43];
    goto LABEL_48;
  }
  id v41 = [(WCM_WiFiCellCoexIssueBandTable *)[(WCM_PlatformManager *)v17 wcmWiFiCellCoexIssueTable] findWiFiAntennaOrCellTxPowerConstraintWiFiEnhCoexIssueByCellBandInfoType:v47 cellDlLowFreq:[(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiChannel] cellDlHighFreq:[(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] channelCenterFreqMHz] cellUlLowFreq:[(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] channelBandwidthMHz] cellUlHighFreq:[(WCM_PolicyManager *)self gpsRadioActive] wifiChannel:(char *)v49 + 1 wifiCenterFreq:v26 wifiBandwidth:v30 gpsRadioActive:v34 wifiAntennaConstraint:v38 cellTxPowerConstraint:v49];
  if (!v41 || !HIBYTE(v49[0])) {
    goto LABEL_48;
  }
  id v42 = v41;
  if (![(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"AntennaSelectionV2Coex"]|| ![(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiEnhCoexSupport"])
  {
    CFStringRef v43 = @"YYDebug_ unhandled antenna selection case in Enh antenna selection";
    goto LABEL_47;
  }
  if ([v42 wifiUlAntennaBitmapOnCellAntBitmap000])
  {
    +[WCM_Logging logLevel:3 message:@"WiFiEnh_: apply WiFi UL antenna constraint for Cellular Antenna Bitmap 000"];
    *a3 |= (unsigned __int16)((unsigned __int16)[v42 wifiUlAntennaBitmapOnCellAntBitmap000] << 6) | 0x800;
  }
  if ([v42 wifiUlAntennaBitmapOnCellAntBitmap001])
  {
    +[WCM_Logging logLevel:3 message:@"WiFiEnh_: apply WiFi UL antenna constraint for Cellular Antenna bitmap 001"];
    *a4 |= (unsigned __int16)((unsigned __int16)[v42 wifiUlAntennaBitmapOnCellAntBitmap001] << 6) | 0x800;
  }
  if ([v42 wifiUlAntennaBitmapOnCellAntBitmap010])
  {
    +[WCM_Logging logLevel:3 message:@"WiFiEnh_: apply WiFi UL antenna constraint for Cellular Antenna bitmap 010"];
    *a5 |= (unsigned __int16)((unsigned __int16)[v42 wifiUlAntennaBitmapOnCellAntBitmap010] << 6) | 0x800;
  }
  if ([v42 wifiUlAntennaBitmapOnCellAntBitmap011])
  {
    +[WCM_Logging logLevel:3 message:@"WiFiEnh_: apply WiFi UL antenna constraint for Cellular Antenna bitmap 011"];
    *a6 |= (unsigned __int16)((unsigned __int16)[v42 wifiUlAntennaBitmapOnCellAntBitmap011] << 6) | 0x800;
  }
  if ([v42 wifiUlAntennaBitmapOnCellAntBitmap100])
  {
    +[WCM_Logging logLevel:3 message:@"WiFiEnh_: apply WiFi UL antenna constraint for Cellular Antenna bitmap 100"];
    *a7 |= (unsigned __int16)((unsigned __int16)[v42 wifiUlAntennaBitmapOnCellAntBitmap100] << 6) | 0x800;
  }
  if ([v42 wifiUlAntennaBitmapOnCellAntBitmap101])
  {
    +[WCM_Logging logLevel:3 message:@"WiFiEnh_: apply WiFi UL antenna constraint for Cellular Antenna bitmap 101"];
    *a8 |= (unsigned __int16)((unsigned __int16)[v42 wifiUlAntennaBitmapOnCellAntBitmap101] << 6) | 0x800;
  }
  if ([v42 wifiUlAntennaBitmapOnCellAntBitmap110])
  {
    +[WCM_Logging logLevel:3 message:@"WiFiEnh_: apply WiFi UL antenna constraint for Cellular Antenna bitmap 110"];
    *a9 |= (unsigned __int16)((unsigned __int16)[v42 wifiUlAntennaBitmapOnCellAntBitmap110] << 6) | 0x800;
  }
  if ([v42 wifiUlAntennaBitmapOnCellAntBitmap111])
  {
    +[WCM_Logging logLevel:3 message:@"WiFiEnh_: apply WiFi UL antenna constraint for Cellular Antenna bitmap 111"];
    *a10 |= (unsigned __int16)((unsigned __int16)[v42 wifiUlAntennaBitmapOnCellAntBitmap111] << 6) | 0x800;
  }
  if ([v42 wifiDlAntennaBitmapOnCellAntBitmap000])
  {
    +[WCM_Logging logLevel:3 message:@"WiFiEnh_: apply WiFi DL antenna constraint for Cellular Antenna Bitmap 000"];
    *a3 |= (unsigned __int16)[v42 wifiDlAntennaBitmapOnCellAntBitmap000] | 0x20;
  }
  if ([v42 wifiDlAntennaBitmapOnCellAntBitmap001])
  {
    +[WCM_Logging logLevel:3 message:@"WiFiEnh_: apply WiFi DL antenna constraint for Cellular Antenna bitmap 001"];
    *a4 |= (unsigned __int16)[v42 wifiDlAntennaBitmapOnCellAntBitmap001] | 0x20;
  }
  if ([v42 wifiDlAntennaBitmapOnCellAntBitmap010])
  {
    +[WCM_Logging logLevel:3 message:@"WiFiEnh_: apply WiFi DL antenna constraint for Cellular Antenna bitmap 010"];
    *a5 |= (unsigned __int16)[v42 wifiDlAntennaBitmapOnCellAntBitmap010] | 0x20;
  }
  if ([v42 wifiDlAntennaBitmapOnCellAntBitmap011])
  {
    +[WCM_Logging logLevel:3 message:@"WiFiEnh_: apply WiFi DL antenna constraint for Cellular Antenna bitmap 011"];
    *a6 |= (unsigned __int16)[v42 wifiDlAntennaBitmapOnCellAntBitmap011] | 0x20;
  }
  if ([v42 wifiDlAntennaBitmapOnCellAntBitmap100])
  {
    +[WCM_Logging logLevel:3 message:@"WiFiEnh_: apply WiFi DL antenna constraint for Cellular Antenna bitmap 100"];
    *a7 |= (unsigned __int16)[v42 wifiDlAntennaBitmapOnCellAntBitmap100] | 0x20;
  }
  if ([v42 wifiDlAntennaBitmapOnCellAntBitmap101])
  {
    +[WCM_Logging logLevel:3 message:@"WiFiEnh_: apply WiFi DL antenna constraint for Cellular Antenna bitmap 101"];
    *a8 |= (unsigned __int16)[v42 wifiDlAntennaBitmapOnCellAntBitmap101] | 0x20;
  }
  if ([v42 wifiDlAntennaBitmapOnCellAntBitmap110])
  {
    +[WCM_Logging logLevel:3 message:@"WiFiEnh_: apply WiFi DL antenna constraint for Cellular Antenna bitmap 110"];
    *a9 |= (unsigned __int16)[v42 wifiDlAntennaBitmapOnCellAntBitmap110] | 0x20;
  }
  if ([v42 wifiDlAntennaBitmapOnCellAntBitmap111])
  {
    +[WCM_Logging logLevel:3 message:@"WiFiEnh_: apply WiFi DL antenna constraint for Cellular Antenna bitmap 111"];
    *a10 |= (unsigned __int16)[v42 wifiDlAntennaBitmapOnCellAntBitmap111] | 0x20;
  }
LABEL_48:
  *a11 = 0;
  if ([(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiState] == 2)
  {
    unsigned __int16 v44 = 1;
LABEL_54:
    *a11 = v44;
    goto LABEL_55;
  }
  if ([(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiState] == 3)
  {
    unsigned __int16 v44 = 2;
    goto LABEL_54;
  }
  if ([(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiState] == 4)
  {
    unsigned __int16 v44 = 3;
    goto LABEL_54;
  }
LABEL_55:
  if ([(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiState])
  {
    if ([(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiState] == 1)
    {
      uint64_t v45 = "ENABLED";
    }
    else if ([(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiState] == 2)
    {
      uint64_t v45 = "ASSOCIATED_2G";
    }
    else if ([(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiState] == 3)
    {
      uint64_t v45 = "ASSOCIATED_5G";
    }
    else
    {
      unsigned int v46 = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiState];
      uint64_t v45 = "INVALID_STATE!!!";
      if (v46 == 4) {
        uint64_t v45 = "ASSOCIATED_6G";
      }
    }
  }
  else
  {
    uint64_t v45 = "DISABLED";
  }
  +[WCM_Logging logLevel:1, @"WiFiEnh_: with WiFi State (%s), calculated bmWiFiBand %d bitmaps 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x", v45, *a11, *a3, *a4, *a5, *a6, *a7, *a8, *a9, *a10 message];
}

- (void)updateCellTxPowerLimit
{
  unsigned int v3 = [(WCM_PolicyManager *)self platformManager];
  uint64_t v4 = [(WCM_PolicyManager *)self cellularController];
  LODWORD(v5) = [(NSNumber *)[(WCM_PlatformManager *)v3 wcmCellularWCI2ModeLTEMaxTxPowerHigh] intValue];
  if ([(WCM_PlatformManager *)v3 wcmWiFiCellCoexIssueTable])
  {
    id v5 = (id)(int)v5;
    if ([(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiState] < 2|| ([(WCM_CellularController *)v4 dlCenterFreq], v6 == 0.0)|| ([(WCM_CellularController *)v4 dlBandwidth], v7 == 0.0))
    {
LABEL_26:
      [(WCM_CellularController *)v4 updateControllerTxPower:v5];
      return;
    }
    [(WCM_CellularController *)v4 ulCenterFreq];
    if (v8 != 0.0)
    {
      [(WCM_CellularController *)v4 ulBandwidth];
      if (v9 != 0.0)
      {
        id v10 = (id)[(WCM_CellularController *)v4 bandInfoType];
        [(WCM_CellularController *)v4 dlCenterFreq];
        double v37 = v11;
        [(WCM_CellularController *)v4 dlBandwidth];
        double v13 = v12 * 0.5;
        [(WCM_CellularController *)v4 dlCenterFreq];
        double v15 = v14;
        [(WCM_CellularController *)v4 dlBandwidth];
        double v17 = v16 * 0.5;
        [(WCM_CellularController *)v4 ulCenterFreq];
        double v19 = v18;
        [(WCM_CellularController *)v4 ulBandwidth];
        double v21 = v20;
        [(WCM_CellularController *)v4 ulCenterFreq];
        double v23 = v22;
        [(WCM_CellularController *)v4 ulBandwidth];
        double v25 = v24;
        if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"EnableULCA"])
        {
          double v26 = v19 - v21 * 0.5;
          double v27 = v23 + v25 * 0.5;
        }
        else
        {
          [(WCM_CellularController *)v4 getCombinedUplinkFreqRange];
          double v26 = v28;
          double v27 = v28 + v29;
        }
        double v30 = v37 - v13;
        double v31 = v15 + v17;
        __int16 v38 = 0;
        unsigned int v32 = [(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiEnhCoexSupport"];
        double v33 = [(WCM_PlatformManager *)v3 wcmWiFiCellCoexIssueTable];
        uint64_t v34 = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiChannel];
        if (v32) {
          id v35 = [(WCM_WiFiCellCoexIssueBandTable *)v33 findWiFiAntennaOrCellTxPowerConstraintWiFiEnhCoexIssueByCellBandInfoType:v10 cellDlLowFreq:v34 cellDlHighFreq:[(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] channelCenterFreqMHz] cellUlLowFreq:[(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] channelBandwidthMHz] cellUlHighFreq:[(WCM_PolicyManager *)self gpsRadioActive] wifiChannel:(char *)&v38 + 1 wifiCenterFreq:v30 wifiBandwidth:v31 gpsRadioActive:v26 wifiAntennaConstraint:v27 cellTxPowerConstraint:&v38];
        }
        else {
          id v35 = [(WCM_WiFiCellCoexIssueBandTable *)v33 findWiFiAntennaOrCellTxPowerConstraintCoexIssueByCellBandInfoType:v10 cellDlLowFreq:v34 cellDlHighFreq:[(WCM_PolicyManager *)self gpsRadioActive] cellUlLowFreq:(char *)&v38 + 1 cellUlHighFreq:&v38 wifiChannel:v30 gpsRadioActive:v31 wifiAntennaConstraint:v26 cellTxPowerConstraint:v27];
        }
        double v36 = v35;
        if (v35 && (_BYTE)v38)
        {
          if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"CellularPowerLimiting"]&& [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiChannel] == 13&& ![(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiEnhCoexSupport"])
          {
            id v5 = [v36 cellTxPowerLimit];
            +[WCM_Logging logLevel:4, @"on channel 13 apply Cell Tx power limit to %lld dBm", v5 message];
          }
          else if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"CellularPowerLimiting"])
          {
            if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiEnhCoexSupport"])
            {
              id v5 = [v36 cellTxPowerLimit];
              +[WCM_Logging logLevel:4, @"WiFiEnh_: Apply Cell Tx power limit to %lld dBm", v5 message];
            }
          }
          +[WCM_Logging logLevel:3, @"apply Cell Tx power limit to %lld dBm", v5 message];
        }
        goto LABEL_26;
      }
    }
  }
  else
  {
    +[WCM_Logging logLevel:0 message:@"Platform doesn't have wcmWiFiCellCoexIssueTable initialized"];
  }
}

- (void)handleCellularNetworkUpdate
{
  uint64_t v3 = [(WCM_PolicyManager *)self cellularCoexBand];
  uint64_t v4 = [(WCM_PolicyManager *)self cellularController];
  id v5 = [(WCM_PolicyManager *)self platformManager];
  double v6 = [(WCM_PolicyManager *)self wifiController];
  double v7 = [(WCM_CellularController *)v4 getActiveULCAConfig];
  uint64_t v8 = v3 != 7;
  uint64_t v242 = 0;
  uint64_t v241 = 0;
  v184 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", &off_10023CCC0, &off_10023CCD8, &off_10023CCF0, &off_10023CD08, &off_10023CD20, &off_10023CD38, &off_10023CD50, 0);
  unsigned __int8 v240 = 0;
  unsigned __int16 v239 = 0;
  unsigned __int16 v238 = 0;
  if ((v3 - 1) >= 2) {
    uint64_t v9 = 255;
  }
  else {
    uint64_t v9 = 0;
  }
  [(WCM_PolicyManager *)self setBtPreferredRole:v9];
  +[WCM_Logging logLevel:2 message:@"Handling Cellular Network Update"];
  if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"BLEActiveScanPwrLmtEnabled"])
  {
    if ((v3 & 0xFFFFFFFE) == 2) {
      uint64_t v10 = 5;
    }
    else {
      uint64_t v10 = 0;
    }
    unint64_t v11 = [(WCM_PolicyManager *)self BLEActiveScanPwrLmtAssrInt];
    unint64_t v12 = [(WCM_PolicyManager *)self BLEActiveScanPwrLmtAssrInt];
    if (v10 == v11)
    {
      +[WCM_Logging logLevel:4, @"DLDebugBLEIntervalTooOften_ updateBLEActiveScanPwrLmtAssertionInterval is called by handleCellularNetworkUpdate. No Need to update with same value --- new interval (%d), old interval (%d)", v10, v12 message];
    }
    else
    {
      +[WCM_Logging logLevel:4, @"DLDebugBLEIntervalTooOften_ updateBLEActiveScanPwrLmtAssertionInterval is called by handleCellularNetworkUpdate. Updating with new interval (%d), old interval (%d)", v10, v12 message];
      [(WCM_PolicyManager *)self setBLEActiveScanPwrLmtAssrInt:v10];
      [(WCM_BTController *)[(WCM_PolicyManager *)self btController] updateBLEActiveScanPwrLmtAssertionInterval:[(WCM_PolicyManager *)self BLEActiveScanPwrLmtAssrInt]];
    }
    uint64_t v8 = v3 != 7;
  }
  if ([(WCM_PlatformManager *)v5 wcmWiFiCellCoexIssueTable])
  {
    unint64_t v13 = [(WCM_CellularController *)v4 bandInfoType];
    [(WCM_CellularController *)v4 dlCenterFreq];
    double v15 = v14;
    [(WCM_CellularController *)v4 dlBandwidth];
    double v17 = v15 - v16 * 0.5;
    [(WCM_CellularController *)v4 dlCenterFreq];
    double v19 = v18;
    [(WCM_CellularController *)v4 dlBandwidth];
    double v21 = v19 + v20 * 0.5;
    [(WCM_CellularController *)v4 ulCenterFreq];
    double v23 = v22;
    [(WCM_CellularController *)v4 ulBandwidth];
    double v25 = v23 - v24 * 0.5;
    [(WCM_CellularController *)v4 ulCenterFreq];
    double v27 = v26;
    [(WCM_CellularController *)v4 ulBandwidth];
    double v29 = v27 + v28 * 0.5;
    unsigned int v183 = [(WCM_WiFiController *)v6 wifiChannel];
    unsigned int v182 = [(WCM_WiFiController *)v6 channelBandwidthMHz];
    unsigned int v181 = [(WCM_WiFiController *)v6 channelCenterFreqMHz];
    +[WCM_Logging logLevel:4, @"V2BtimapDebug_ handleCellularNetworkUpdate gets called with dlLowFreq = %f, dlHighFreq = %f, ulLowFreq = %f, ulHighFreq = %f.", *(void *)&v17, *(void *)&v21, *(void *)&v25, *(void *)&v29 message];
    [(WCM_PolicyManager *)self sendNRFrequencyBandUpdateForMic:v17 dlHighFreq:v21 ulLowFreq:v25 ulHighFreq:v29];
    [(WCM_CellularController *)v4 ulCenterFreq];
    if (v30 != 0.0)
    {
      [(WCM_CellularController *)v4 ulCenterFreq];
      double v32 = v31;
      [(WCM_CellularController *)v4 ulBandwidth];
      [(WCM_PolicyManager *)self sendULFrequencyUpdates:v13 ulCenterFreq:v32 ulBandwidth:v33];
    }
    if (![(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"EnableULCA"])
    {
      [(WCM_CellularController *)v4 getCombinedUplinkFreqRange];
      double v25 = v34;
      double v29 = v34 + v35;
    }
    unsigned int v185 = v13;
    if (!v7)
    {
LABEL_170:
      unsigned int v123 = [(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"BTSeparateAGCCoexMode"];
      v124 = [(WCM_PlatformManager *)v5 wcmWiFiCellCoexIssueTable];
      if (v123) {
        unsigned int v125 = [(WCM_WiFiCellCoexIssueBandTable *)v124 wifiBtAgcCoexModeEnableCheckBandCombinationV2:v13 cellDlLowFreq:v183 cellDlHighFreq:v181 cellUlLowFreq:v182 cellUlHighFreq:&v242 wifiChannel:&v241 channelCenterFreqMHz:v17 channelBandwidthMHz:v21 coexModeWifiLevel:v25 coexModeBTLevel:v29];
      }
      else {
        unsigned int v125 = [(WCM_WiFiCellCoexIssueBandTable *)v124 wifiBtAgcCoexModeEnableCheckBandCombination:v13 cellDlLowFreq:&v242 cellDlHighFreq:v17 cellUlLowFreq:v21 cellUlHighFreq:v25 coexModeWifiLevel:v29];
      }
      unsigned int v126 = v125;
      if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"CellularWatchFcmBcmAntennaPref"])
      {
        [(WCM_PolicyManager *)self setWatchCellularAntPref:[(WCM_WiFiCellCoexIssueBandTable *)[(WCM_PlatformManager *)v5 wcmWiFiCellCoexIssueTable] watchAntennaPreferenceEnableCheckBandCombination:v13 cellDlLowFreq:v17 cellDlHighFreq:v21 cellUlLowFreq:v25 cellUlHighFreq:v29]];
      }
      if (v126)
      {
        if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"BTSeparateAGCCoexMode"])
        {
          v127 = &off_10023CCA8;
          if (v242 == 3) {
            v127 = &off_10023D038;
          }
          if (v242 == 2) {
            v128 = &off_10023D020;
          }
          else {
            v128 = v127;
          }
          [(WCM_PolicyManager *)self setWifiAgcCoexModeLevel:v128];
          if (v241 == 2)
          {
            v129 = &off_10023D038;
            goto LABEL_192;
          }
          if (v241 == 1)
          {
            v129 = &off_10023D020;
LABEL_192:
            v130 = self;
            goto LABEL_193;
          }
LABEL_191:
          v129 = &off_10023CCA8;
          goto LABEL_192;
        }
        if (v242 == 3)
        {
          [(WCM_PolicyManager *)self setWifiAgcCoexModeLevel:&off_10023D038];
          goto LABEL_191;
        }
        if (v242 == 2)
        {
          [(WCM_PolicyManager *)self setWifiAgcCoexModeLevel:&off_10023D020];
          v130 = self;
          v129 = &off_10023D020;
LABEL_193:
          [(WCM_PolicyManager *)v130 setBtAgcCoexModeEnable:v129];
          goto LABEL_194;
        }
      }
      [(WCM_PolicyManager *)self setBtAgcCoexModeEnable:&off_10023CCA8];
      [(WCM_PolicyManager *)self setWifiAgcCoexModeLevel:&off_10023CCA8];
LABEL_194:
      if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WifiBtAgcCoexMode"]&& [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] powerState])
      {
        +[WCM_Logging logLevel:4, @"1st place self.wifiAgcCoexModeLevel is %d", [(NSNumber *)[(WCM_PolicyManager *)self wifiAgcCoexModeLevel] integerValue] message];
        [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] setWifiAgcCoexMode:[(WCM_PolicyManager *)self wifiAgcCoexModeLevel]];
      }
      if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"CellularWatchFcmBcmAntennaPref"])
      {
        [(WCM_CellularController *)[(WCM_PolicyManager *)self cellularController] updateWatchAntennaPref:v3 watchAntPref:[(WCM_PolicyManager *)self watchCellularAntPref]];
      }
      if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiAWDWCI2CoexBitmap"]&& [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] powerState])
      {
        if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiWCI2BitmapV2Enabled"])
        {
          v131 = v5;
          v132 = v4;
          uint64_t v133 = v8;
          unsigned int v134 = [(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiEnhCoexSupport"];
          v135 = [(WCM_PolicyManager *)self wifiController];
          if (v134) {
            [(WCM_WiFiController *)v135 updateChannelsToEnableWCI2WiFiEnh:[(WCM_PolicyManager *)self wifiChannelsToEnableWCI2Gand5G] WiFiEnhChannels:[(WCM_PolicyManager *)self wifiChannelsToEnableWCI2WiFiEnh]];
          }
          else {
            [(WCM_WiFiController *)v135 updateChannelsToEnableWCI2V2:[(WCM_PolicyManager *)self wifiChannelsToEnableWCI2V2]];
          }
          uint64_t v8 = v133;
          uint64_t v4 = v132;
          id v5 = v131;
        }
        else
        {
          [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] updateChannelsToEnableWCI2:[(WCM_PolicyManager *)self wifiChannelsToEnableWCI2]];
        }
      }
      if ([(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] powerState]
        && ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFi5GHzType7NR79AntBlocking"]|| [(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiType7LTEMBAntBlocking"]))
      {
        uint64_t v197 = v3;
        v190 = v4;
        uint64_t v136 = v8;
        if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"Type72GWiFiSupport"])
        {
          long long v216 = 0u;
          long long v217 = 0u;
          long long v214 = 0u;
          long long v215 = 0u;
          v137 = [(WCM_PolicyManager *)self wifi2GHzLTEB7IMD3ChannelsEnableType7];
          id v138 = [(NSMutableArray *)v137 countByEnumeratingWithState:&v214 objects:v247 count:16];
          if (v138)
          {
            id v139 = v138;
            uint64_t v140 = *(void *)v215;
            do
            {
              for (i = 0; i != v139; i = (char *)i + 1)
              {
                if (*(void *)v215 != v140) {
                  objc_enumerationMutation(v137);
                }
                uint64_t v142 = *(void *)(*((void *)&v214 + 1) + 8 * i);
                if ((-[NSMutableArray containsObject:](-[WCM_PolicyManager wifi2GHzChannelsToEnableType7MSGCombined](self, "wifi2GHzChannelsToEnableType7MSGCombined"), "containsObject:", v142) & 1) == 0&& [&off_10024E3C8 containsObject:v142])
                {
                  [(NSMutableArray *)[(WCM_PolicyManager *)self wifi2GHzChannelsToEnableType7MSGCombined] addObject:v142];
                }
              }
              id v139 = [(NSMutableArray *)v137 countByEnumeratingWithState:&v214 objects:v247 count:16];
            }
            while (v139);
          }
        }
        if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"BB25ASuppot"])
        {
          [(WCM_PolicyManager *)self updateWiFiChannelForConditionalMitigation];
          uint64_t v8 = v136;
          uint64_t v4 = v190;
          uint64_t v3 = v197;
          unint64_t v13 = v185;
        }
        else
        {
          uint64_t v8 = v136;
          uint64_t v3 = v197;
          unint64_t v13 = v185;
          if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiEnhCoexSupport"])
          {
            [(WCM_PolicyManager *)self handleCallLQMStateChangeType7WiFiEnh:1];
          }
          else
          {
            [(WCM_PolicyManager *)self handleCallLQMStateChangeType7:1];
          }
          uint64_t v4 = v190;
        }
      }
      if (![(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"ProtectWiFiRanging"])goto LABEL_237; {
      if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiWCI2BitmapV2Enabled"])
      }
      {
        if (([(NSMutableArray *)[(WCM_PolicyManager *)self wifiChannelsToEnableWCI2V2] containsObject:&off_10023D098] & 1) == 0)
        {
LABEL_230:
          uint64_t v143 = 0;
LABEL_233:
          if ([(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] powerState])
          {
            [(WCM_CellularController *)v4 ulCenterFreq];
            if (v144 != 0.0)
            {
              [(WCM_CellularController *)v4 ulBandwidth];
              if (v145 != 0.0)
              {
                v146 = v5;
                v147 = v4;
                uint64_t v148 = v8;
                v149 = [(WCM_PolicyManager *)self wifiController];
                v150 = [(WCM_PolicyManager *)self cellularController];
                v151 = v149;
                uint64_t v8 = v148;
                uint64_t v4 = v147;
                id v5 = v146;
                [(WCM_WiFiController *)v151 updateCellularFrequencyConfig:v150 withWiFiRangingDesenseFlag:v143];
              }
            }
          }
LABEL_237:
          unsigned int v152 = [(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiOCLSupport"];
          v153 = [(WCM_PolicyManager *)self activeCoexFeatures];
          if (v152)
          {
            unsigned int v154 = [(NSSet *)v153 containsObject:@"WiFiEnhCoexSupport"];
            v155 = [(WCM_PlatformManager *)v5 wcmWiFiCellCoexIssueTable];
            if (v154)
            {
              id v156 = [(WCM_WiFiCellCoexIssueBandTable *)v155 wifiChannelsToDisableOCLWiFiEnhForCellBandInfoType:v13 cellDlLowFreq:v17 cellDlHighFreq:v21 cellUlLowFreq:v25 cellUlHighFreq:v29];
              +[WCM_Logging logLevel:4, @"OCLDisable_WiFiEnh: wifiChannelEnhDict = %@", v156 message];
              -[WCM_PolicyManager setWifiChannelsToDisableOCL2G5G:](self, "setWifiChannelsToDisableOCL2G5G:", [v156 objectForKey:@"wifiChannels2Gand5G"]);
              -[WCM_PolicyManager setWifiChannelsToDisableOCLEnh:](self, "setWifiChannelsToDisableOCLEnh:", [v156 objectForKey:@"wifiChannelsEnh"]);
            }
            else
            {
              [(WCM_PolicyManager *)self setWifiChannelsToDisableOCL:[(WCM_WiFiCellCoexIssueBandTable *)v155 wifiChannelsToDisableOCLForCellBandInfoType:v13 cellDlLowFreq:v17 cellDlHighFreq:v21 cellUlLowFreq:v25 cellUlHighFreq:v29]];
            }
            if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiOCLSupportFix"])
            {
              if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiEnhCoexSupport"])
              {
                v157 = +[NSMutableArray arrayWithArray:[(WCM_PolicyManager *)self wifiChannelsToDisableOCL2G5G]];
                [(NSMutableArray *)v157 removeObjectsInArray:v184];
                [(WCM_PolicyManager *)self setWifiChannelsToDisableOCL2G5G:v157];
                +[WCM_Logging logLevel:5, @"OCLDisable_WiFiEnh: WiFi channels to disble OCL -- fixed version %@", [(WCM_PolicyManager *)self wifiChannelsToDisableOCL2G5G] message];
              }
              else
              {
                v158 = +[NSMutableArray arrayWithArray:[(WCM_PolicyManager *)self wifiChannelsToDisableOCL]];
                [(NSMutableArray *)v158 removeObjectsInArray:v184];
                [(WCM_PolicyManager *)self setWifiChannelsToDisableOCL:v158];
                +[WCM_Logging logLevel:5, @"WiFi channels to disble OCL -- fixed version %@", [(WCM_PolicyManager *)self wifiChannelsToDisableOCL] message];
              }
            }
          }
          else if ([(NSSet *)v153 containsObject:@"WiFiOCLSupportV2"])
          {
            [(WCM_PolicyManager *)self updateWifiOCLChannelList];
          }
          if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"BTDiversityAFHMap"])
          {
            [(WCM_PolicyManager *)self setBtDiversityChannelMapForC0B0:[(WCM_WiFiCellCoexIssueBandTable *)[(WCM_PlatformManager *)v5 wcmWiFiCellCoexIssueTable] btDiversityChannelMapForCellBTAntennaCombination:0 cellBandInfoType:v13 cellDlLowFreq:0 cellDlHighFreq:v17 cellUlLowFreq:v21 cellUlHighFreq:v25 gpsRadioActive:v29]];
            [(WCM_PolicyManager *)self setBtDiversityChannelMapForC0B1:[(WCM_WiFiCellCoexIssueBandTable *)[(WCM_PlatformManager *)v5 wcmWiFiCellCoexIssueTable] btDiversityChannelMapForCellBTAntennaCombination:1 cellBandInfoType:v13 cellDlLowFreq:0 cellDlHighFreq:v17 cellUlLowFreq:v21 cellUlHighFreq:v25 gpsRadioActive:v29]];
            [(WCM_PolicyManager *)self setBtDiversityChannelMapForC1B0:[(WCM_WiFiCellCoexIssueBandTable *)[(WCM_PlatformManager *)v5 wcmWiFiCellCoexIssueTable] btDiversityChannelMapForCellBTAntennaCombination:2 cellBandInfoType:v13 cellDlLowFreq:0 cellDlHighFreq:v17 cellUlLowFreq:v21 cellUlHighFreq:v25 gpsRadioActive:v29]];
            [(WCM_PolicyManager *)self setBtDiversityChannelMapForC1B1:[(WCM_WiFiCellCoexIssueBandTable *)[(WCM_PlatformManager *)v5 wcmWiFiCellCoexIssueTable] btDiversityChannelMapForCellBTAntennaCombination:3 cellBandInfoType:v13 cellDlLowFreq:0 cellDlHighFreq:v17 cellUlLowFreq:v21 cellUlHighFreq:v25 gpsRadioActive:v29]];
            [(WCM_PolicyManager *)self setBtDiversityChannelMapOnGpsRadioActiveForC0B0:[(WCM_WiFiCellCoexIssueBandTable *)[(WCM_PlatformManager *)v5 wcmWiFiCellCoexIssueTable] btDiversityChannelMapForCellBTAntennaCombination:0 cellBandInfoType:v13 cellDlLowFreq:1 cellDlHighFreq:v17 cellUlLowFreq:v21 cellUlHighFreq:v25 gpsRadioActive:v29]];
            [(WCM_PolicyManager *)self setBtDiversityChannelMapOnGpsRadioActiveForC0B1:[(WCM_WiFiCellCoexIssueBandTable *)[(WCM_PlatformManager *)v5 wcmWiFiCellCoexIssueTable] btDiversityChannelMapForCellBTAntennaCombination:1 cellBandInfoType:v13 cellDlLowFreq:1 cellDlHighFreq:v17 cellUlLowFreq:v21 cellUlHighFreq:v25 gpsRadioActive:v29]];
            [(WCM_PolicyManager *)self setBtDiversityChannelMapOnGpsRadioActiveForC1B0:[(WCM_WiFiCellCoexIssueBandTable *)[(WCM_PlatformManager *)v5 wcmWiFiCellCoexIssueTable] btDiversityChannelMapForCellBTAntennaCombination:2 cellBandInfoType:v13 cellDlLowFreq:1 cellDlHighFreq:v17 cellUlLowFreq:v21 cellUlHighFreq:v25 gpsRadioActive:v29]];
            [(WCM_PolicyManager *)self setBtDiversityChannelMapOnGpsRadioActiveForC1B1:[(WCM_WiFiCellCoexIssueBandTable *)[(WCM_PlatformManager *)v5 wcmWiFiCellCoexIssueTable] btDiversityChannelMapForCellBTAntennaCombination:3 cellBandInfoType:v13 cellDlLowFreq:1 cellDlHighFreq:v17 cellUlLowFreq:v21 cellUlHighFreq:v25 gpsRadioActive:v29]];
          }
          else if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"BTUseC0B1AntennaConfig"])
          {
            [(WCM_PolicyManager *)self setBtPreferredChannelMap:[(WCM_WiFiCellCoexIssueBandTable *)[(WCM_PlatformManager *)v5 wcmWiFiCellCoexIssueTable] btPreferredChannelMapForCellBandInfoType:v13 cellDlLowFreq:0 cellDlHighFreq:v17 cellUlLowFreq:v21 cellUlHighFreq:v25 gpsRadioActive:v29]];
            [(WCM_PolicyManager *)self setBtPreferredChannelMapOnGpsRadioActive:[(WCM_WiFiCellCoexIssueBandTable *)[(WCM_PlatformManager *)v5 wcmWiFiCellCoexIssueTable] btPreferredChannelMapForCellBandInfoType:v13 cellDlLowFreq:1 cellDlHighFreq:v17 cellUlLowFreq:v21 cellUlHighFreq:v25 gpsRadioActive:v29]];
            if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"hpcellularstatemonitorsupport"])
            {
              [(WCM_PolicyManager *)self setBtPreferredChannelMapHPCellularActive:[(WCM_PlatformManager *)v5 wcmHPCellularBTAFHMapFixed]];
            }
          }
          else
          {
            if ([(WCM_PlatformManager *)v5 wcmBTMaxNumberOfChannelsToAvoidForCellOOB])
            {
              id v159 = (id)[(NSNumber *)[(WCM_PlatformManager *)v5 wcmBTMaxNumberOfChannelsToAvoidForCellOOB] intValue];
            }
            else
            {
              id v159 = 0;
            }
            [(WCM_PolicyManager *)self setBtPreferredChannelMap:[(WCM_WiFiCellCoexIssueBandTable *)[(WCM_PlatformManager *)v5 wcmWiFiCellCoexIssueTable] btPreferredChannelMapFromLegacyWiFiConfigForCellBandInfoType:v13 cellDlLowFreq:0 cellDlHighFreq:v159 cellUlLowFreq:v17 cellUlHighFreq:v21 gpsRadioActive:v25 maxChannelsToAvoidForCellOOB:v29]];
            [(WCM_PolicyManager *)self setBtPreferredChannelMapOnGpsRadioActive:[(WCM_WiFiCellCoexIssueBandTable *)[(WCM_PlatformManager *)v5 wcmWiFiCellCoexIssueTable] btPreferredChannelMapFromLegacyWiFiConfigForCellBandInfoType:v13 cellDlLowFreq:1 cellDlHighFreq:v159 cellUlLowFreq:v17 cellUlHighFreq:v21 gpsRadioActive:v25 maxChannelsToAvoidForCellOOB:v29]];
          }
          if (_os_feature_enabled_impl()
            && [(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"HFBTCoex"])
          {
            +[WCM_Logging logLevel:3 message:@"HFAFHDebug_ Recaculate channel bitmap"];
            [(WCM_PolicyManager *)self setBtPreferred5GChannelMap:[(WCM_WiFiCellCoexIssueBandTable *)[(WCM_PlatformManager *)v5 wcmWiFiCellCoexIssueTable] HFBTPreferredChannelMapForCellBandInfoType:v13 cellDlLowFreq:self->_gpsRadioActive cellDlHighFreq:v17 cellUlLowFreq:v21 cellUlHighFreq:v25 gpsRadioActive:v29]];
            +[WCM_Logging logLevel:3 message:@"HFBTAntBlkDebug_ update ant blocking configs"];
            [(WCM_PolicyManager *)self setHFBTAntBlkEnableBands:[(WCM_WiFiCellCoexIssueBandTable *)[(WCM_PlatformManager *)v5 wcmWiFiCellCoexIssueTable] HFBTAntBlockingBandsFromWiFiConfigForCellBandInfoType:v13 cellDlLowFreq:v17 cellDlHighFreq:v21 cellUlLowFreq:v25 cellUlHighFreq:v29]];
            +[WCM_Logging logLevel:4, @"HFBTAntBlkDebug_ Updated enabled bands = %@", [(WCM_PolicyManager *)self HFBTAntBlkEnableBands] message];
          }
          goto LABEL_260;
        }
      }
      else if (![(NSArray *)[(WCM_PolicyManager *)self wifiChannelsToEnableWCI2] containsObject:&off_10023D098])
      {
        goto LABEL_230;
      }
      +[WCM_Logging logLevel:3 message:@"Cellular UL frequency desenses WiFi ranging channel #6"];
      uint64_t v143 = 1;
      uint64_t v8 = 1;
      goto LABEL_233;
    }
    if (self->_cellularRc1PolicyManager)
    {
      +[WCM_Logging logLevel:4 message:@"Cellular RC1 policy manager handleCellularNetworkUpdate."];
      [(WCM_CellularRc1PolicyManager *)self->_cellularRc1PolicyManager handleCellularNetworkUpdate];
    }
    else
    {
      +[WCM_Logging logLevel:4 message:@"Cellular RC1 policy manager is NULL"];
    }
    if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"LegacyNonCoexBandBitmapFix"])
    {
      [(WCM_PolicyManager *)self setWcmCellularCoexBand:[(WCM_WiFiCellCoexIssueBandTable *)[(WCM_PlatformManager *)v5 wcmWiFiCellCoexIssueTable] coexBandCheckBandInfoType:v13 cellDlLowFreq:v17 cellDlHighFreq:v21 cellUlLowFreq:v25 cellUlHighFreq:v29]];
      uint64_t v39 = [(WCM_PolicyManager *)self cellularCoexBand];
      if (v39 == 7) {
        uint64_t v40 = v8;
      }
      else {
        uint64_t v40 = 1;
      }
      +[WCM_Logging logLevel:1, @"InCoexBandCheck %d %d %d", [(WCM_PolicyManager *)self wcmCellularCoexBand], v39, v40 message];
      uint64_t v8 = v40;
      uint64_t v3 = v39;
    }
    if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiWCI2BitmapV2Enabled"]|| [(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiType7LTEMBAntBlocking"]|| [(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiFVGHzPDHLS"])
    {
      uint64_t var8 = v7->var6.var8;
      double var2 = v7->var6.var2;
      double v43 = v7->var6.var3 * 0.5;
      double v44 = var2 - v43;
      double v45 = var2 + v43;
      double var0 = v7->var6.var0;
      double v47 = v7->var6.var1 * 0.5;
      double v48 = var0 - v47;
      double v49 = var0 + v47;
      if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiEnhCoexSupport"])
      {
        if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiEnhCoexSupport"])
        {
          id v50 = [(WCM_WiFiCellCoexIssueBandTable *)[(WCM_PlatformManager *)v5 wcmWiFiCellCoexIssueTable] wifiChannelsToEnableWCI2WiFiEnhForCellBandInfoType:var8 cellDlLowFreq:&v240 cellDlHighFreq:v44 cellUlLowFreq:v45 cellUlHighFreq:v48 pissueBandMatch:v49];
          +[WCM_Logging logLevel:4, @"WCI2_WiFiEnh: wifiChannelEnhDict = %@", v50 message];
          -[WCM_PolicyManager setWifiChannelsToEnableWCI2Gand5G:](self, "setWifiChannelsToEnableWCI2Gand5G:", [v50 objectForKey:@"wifiChannels2Gand5G"]);
          -[WCM_PolicyManager setWifiChannelsToEnableWCI2WiFiEnh:](self, "setWifiChannelsToEnableWCI2WiFiEnh:", [v50 objectForKey:@"wifiChannelsEnh"]);
        }
      }
      else
      {
        [(WCM_PolicyManager *)self setWifiChannelsToEnableWCI2V2:[(WCM_WiFiCellCoexIssueBandTable *)[(WCM_PlatformManager *)v5 wcmWiFiCellCoexIssueTable] wifiChannelsToEnableWCI2V2ForCellBandInfoType:var8 cellDlLowFreq:&v240 cellDlHighFreq:v44 cellUlLowFreq:v45 cellUlHighFreq:v48 pissueBandMatch:v49]];
        +[WCM_Logging logLevel:4, @"WCI2_V2: self.wifiChannelsToEnableWCI2V2 = %@", [(WCM_PolicyManager *)self wifiChannelsToEnableWCI2V2] message];
      }
      [(WCM_PolicyManager *)self setWcmCellularCoexBand:v240];
      uint64_t v3 = [(WCM_PolicyManager *)self cellularCoexBand];
      if (v3 == 7) {
        uint64_t v8 = v8;
      }
      else {
        uint64_t v8 = 1;
      }
      +[WCM_Logging logLevel:1, @"InCoexBandCheck %d %d %d", [(WCM_PolicyManager *)self wcmCellularCoexBand], v3, v8 message];
      if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiType7LTEMBAntBlocking"])
      {
        [(WCM_PolicyManager *)self setWifiChannelsToEnableLTEMBType7:[(WCM_WiFiCellCoexIssueBandTable *)[(WCM_PlatformManager *)v5 wcmWiFiCellCoexIssueTable] wifiChannelsToEnableLTEMBType7ForCellBandInfoType:var8 cellDlLowFreq:&v239 cellDlHighFreq:v44 cellUlLowFreq:v45 cellUlHighFreq:v48 pissueBandMatchAntIdx:v49]];
        [(WCM_PolicyManager *)self setType7CellAntBlkIdx:v239];
        +[WCM_Logging logLevel:0, @"LTEMB_Type7 matching band found and issueBandMatchLTEMBType7AntIdx = %d", v239 message];
      }
      else
      {
        [(NSMutableArray *)[(WCM_PolicyManager *)self wifiChannelsToEnableLTEMBType7] addObject:&off_10023CCA8];
      }
      if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiEnhCoexSupport"])
      {
        [(WCM_PolicyManager *)self setWifiEnhChannelsToEnableType7MSG:[(WCM_WiFiCellCoexIssueBandTable *)[(WCM_PlatformManager *)v5 wcmWiFiCellCoexIssueTable] wifiChannelsToEnableType7WiFiEnhForCellBandInfoType:var8 cellDlLowFreq:&v238 cellDlHighFreq:v44 cellUlLowFreq:v45 cellUlHighFreq:v48 pissueBandMatchAntIdx:v49]];
        [(WCM_PolicyManager *)self setType7WiFiEnhCellAntBlkIdx:v238];
        +[WCM_Logging logLevel:0, @"WiFiType7_WiFiEnh matching band found and issueBandMatchWiFiEnhType7AntIdx = %d", v238 message];
      }
      if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiFVGHzPDHLS"])
      {
        uint64_t v187 = v8;
        id v51 = (id)v13;
        id v52 = +[NSMutableArray array];
        id v53 = [(WCM_WiFiCellCoexIssueBandTable *)[(WCM_PlatformManager *)v5 wcmWiFiCellCoexIssueTable] wifiPHSChannelsToBlocklistForCellBandInfoType:v51 cellDlLowFreq:v17 cellDlHighFreq:v21 cellUlLowFreq:v25 cellUlHighFreq:v29];
        uint64_t v195 = v3;
        if ([v53 count])
        {
          unsigned int v180 = var8;
          long long v236 = 0u;
          long long v237 = 0u;
          long long v234 = 0u;
          long long v235 = 0u;
          id v54 = [v53 countByEnumeratingWithState:&v234 objects:v252 count:16];
          if (v54)
          {
            id v55 = v54;
            uint64_t v56 = *(void *)v235;
            do
            {
              for (j = 0; j != v55; j = (char *)j + 1)
              {
                if (*(void *)v235 != v56) {
                  objc_enumerationMutation(v53);
                }
                uint64_t v58 = *(void *)(*((void *)&v234 + 1) + 8 * (void)j);
                if (([v52 containsObject:v58] & 1) == 0) {
                  [v52 addObject:v58];
                }
              }
              id v55 = [v53 countByEnumeratingWithState:&v234 objects:v252 count:16];
            }
            while (v55);
          }
          +[WCM_Logging logLevel:4, @"PDHLSV2: channel blocklist after combining channels for CC1 %@", v52 message];
          uint64_t v3 = v195;
          uint64_t var8 = v180;
        }
        id v59 = [(WCM_WiFiCellCoexIssueBandTable *)[(WCM_PlatformManager *)v5 wcmWiFiCellCoexIssueTable] wifiPHSChannelsToBlocklistV2ForCellBandInfoType:var8 cellDlLowFreq:v44 cellDlHighFreq:v45 cellUlLowFreq:v48 cellUlHighFreq:v49];
        if ([v59 count])
        {
          long long v232 = 0u;
          long long v233 = 0u;
          long long v230 = 0u;
          long long v231 = 0u;
          id v60 = [v59 countByEnumeratingWithState:&v230 objects:v251 count:16];
          if (v60)
          {
            id v61 = v60;
            uint64_t v62 = *(void *)v231;
            do
            {
              for (k = 0; k != v61; k = (char *)k + 1)
              {
                if (*(void *)v231 != v62) {
                  objc_enumerationMutation(v59);
                }
                uint64_t v64 = *(void *)(*((void *)&v230 + 1) + 8 * (void)k);
                if (([v52 containsObject:v64] & 1) == 0) {
                  [v52 addObject:v64];
                }
              }
              id v61 = [v59 countByEnumeratingWithState:&v230 objects:v251 count:16];
            }
            while (v61);
          }
          +[WCM_Logging logLevel:4, @"PDHLSV2: channel blocklist after combining channels for CC2 %@", v52 message];
          uint64_t v3 = v195;
        }
        [(WCM_PolicyManager *)self setWifiChannelsToBlocklist:v52];
        uint64_t v8 = v187;
        goto LABEL_125;
      }
    }
    else
    {
      [(WCM_PolicyManager *)self setWifiChannelsToEnableWCI2:[(WCM_WiFiCellCoexIssueBandTable *)[(WCM_PlatformManager *)v5 wcmWiFiCellCoexIssueTable] wifiChannelsToEnableWCI2ForCellBandInfoType:v13 cellDlLowFreq:v17 cellDlHighFreq:v21 cellUlLowFreq:v25 cellUlHighFreq:v29]];
      [(NSMutableArray *)[(WCM_PolicyManager *)self wifiChannelsToEnableLTEMBType7] addObject:&off_10023CCA8];
    }
    [(WCM_PolicyManager *)self setWifiChannelsToBlocklist:[(WCM_WiFiCellCoexIssueBandTable *)[(WCM_PlatformManager *)v5 wcmWiFiCellCoexIssueTable] wifiPHSChannelsToBlocklistForCellBandInfoType:v13 cellDlLowFreq:v17 cellDlHighFreq:v21 cellUlLowFreq:v25 cellUlHighFreq:v29]];
LABEL_125:
    uint64_t v196 = v3;
    uint64_t v189 = v8;
    if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFi5GHzType7NR79AntBlocking"])
    {
      double v90 = v7->var7.var2;
      double v91 = v7->var7.var3 * 0.5;
      double v92 = v90 - v91;
      double v93 = v90 + v91;
      double v94 = v7->var7.var0;
      double v95 = v7->var7.var1 * 0.5;
      [(WCM_PolicyManager *)self setWifi5GHzChannelsToEnableType7MSG:[(WCM_WiFiCellCoexIssueBandTable *)[(WCM_PlatformManager *)v5 wcmWiFiCellCoexIssueTable] wifi5GHzChannelsToEnableType7MSGForCellBandInfoType:v7->var7.var8 cellDlLowFreq:v92 cellDlHighFreq:v93 cellUlLowFreq:v94 - v95 cellUlHighFreq:v94 + v95]];
    }
    if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFi5GHzType7NR79AntBlocking"]|| [(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiType7LTEMBAntBlocking"])
    {
      if ([(NSMutableArray *)[(WCM_PolicyManager *)self wifiChannelsToEnableLTEMBType7] containsObject:&off_10023CCA8])
      {
        if ([(NSMutableArray *)[(WCM_PolicyManager *)self wifi5GHzChannelsToEnableType7MSG] containsObject:&off_10023CCA8])
        {
          if (![(NSMutableArray *)[(WCM_PolicyManager *)self wifi5GHzChannelsToEnableType7MSGCombined] count])[(NSMutableArray *)[(WCM_PolicyManager *)self wifi5GHzChannelsToEnableType7MSGCombined] addObject:&off_10023CCA8]; {
        }
          }
        else
        {
          [(WCM_PolicyManager *)self setWifi5GHzChannelsToEnableType7MSGCombined:[(WCM_PolicyManager *)self wifi5GHzChannelsToEnableType7MSG]];
          long long v224 = 0u;
          long long v225 = 0u;
          long long v222 = 0u;
          long long v223 = 0u;
          v102 = [(WCM_PolicyManager *)self wifiChannelsToEnableLTEMBType7];
          id v103 = [(NSMutableArray *)v102 countByEnumeratingWithState:&v222 objects:v249 count:16];
          if (v103)
          {
            id v104 = v103;
            uint64_t v105 = *(void *)v223;
            do
            {
              for (m = 0; m != v104; m = (char *)m + 1)
              {
                if (*(void *)v223 != v105) {
                  objc_enumerationMutation(v102);
                }
                uint64_t v107 = *(void *)(*((void *)&v222 + 1) + 8 * (void)m);
                if ((-[NSMutableArray containsObject:](-[WCM_PolicyManager wifi5GHzChannelsToEnableType7MSGCombined](self, "wifi5GHzChannelsToEnableType7MSGCombined"), "containsObject:", v107) & 1) == 0&& [&off_10024E398 containsObject:v107])
                {
                  [(NSMutableArray *)[(WCM_PolicyManager *)self wifi5GHzChannelsToEnableType7MSGCombined] addObject:v107];
                }
              }
              id v104 = [(NSMutableArray *)v102 countByEnumeratingWithState:&v222 objects:v249 count:16];
            }
            while (v104);
          }
        }
      }
      else
      {
        [(WCM_PolicyManager *)self setWifi5GHzChannelsToEnableType7MSGCombined:[(WCM_PolicyManager *)self wifiChannelsToEnableLTEMBType7]];
        long long v228 = 0u;
        long long v229 = 0u;
        long long v226 = 0u;
        long long v227 = 0u;
        v96 = [(WCM_PolicyManager *)self wifi5GHzChannelsToEnableType7MSG];
        id v97 = [(NSMutableArray *)v96 countByEnumeratingWithState:&v226 objects:v250 count:16];
        if (v97)
        {
          id v98 = v97;
          uint64_t v99 = *(void *)v227;
          do
          {
            for (n = 0; n != v98; n = (char *)n + 1)
            {
              if (*(void *)v227 != v99) {
                objc_enumerationMutation(v96);
              }
              uint64_t v101 = *(void *)(*((void *)&v226 + 1) + 8 * (void)n);
              if ((-[NSMutableArray containsObject:](-[WCM_PolicyManager wifi5GHzChannelsToEnableType7MSGCombined](self, "wifi5GHzChannelsToEnableType7MSGCombined"), "containsObject:", v101) & 1) == 0&& [&off_10024E380 containsObject:v101])
              {
                [(NSMutableArray *)[(WCM_PolicyManager *)self wifi5GHzChannelsToEnableType7MSGCombined] addObject:v101];
              }
            }
            id v98 = [(NSMutableArray *)v96 countByEnumeratingWithState:&v226 objects:v250 count:16];
          }
          while (v98);
        }
      }
      if ([(NSMutableArray *)[(WCM_PolicyManager *)self wifiChannelsToEnableLTEMBType7] containsObject:&off_10023CCA8])
      {
        if (![(NSMutableArray *)[(WCM_PolicyManager *)self wifi2GHzChannelsToEnableType7MSGCombined] count])[(NSMutableArray *)[(WCM_PolicyManager *)self wifi2GHzChannelsToEnableType7MSGCombined] addObject:&off_10023CCA8]; {
      }
        }
      else
      {
        long long v220 = 0u;
        long long v221 = 0u;
        long long v218 = 0u;
        long long v219 = 0u;
        v108 = [(WCM_PolicyManager *)self wifiChannelsToEnableLTEMBType7];
        id v109 = [(NSMutableArray *)v108 countByEnumeratingWithState:&v218 objects:v248 count:16];
        if (v109)
        {
          id v110 = v109;
          uint64_t v111 = *(void *)v219;
          do
          {
            for (ii = 0; ii != v110; ii = (char *)ii + 1)
            {
              if (*(void *)v219 != v111) {
                objc_enumerationMutation(v108);
              }
              uint64_t v113 = *(void *)(*((void *)&v218 + 1) + 8 * (void)ii);
              if ((-[NSMutableArray containsObject:](-[WCM_PolicyManager wifi2GHzChannelsToEnableType7MSGCombined](self, "wifi2GHzChannelsToEnableType7MSGCombined"), "containsObject:", v113) & 1) == 0&& [&off_10024E3B0 containsObject:v113])
              {
                [(NSMutableArray *)[(WCM_PolicyManager *)self wifi2GHzChannelsToEnableType7MSGCombined] addObject:v113];
              }
            }
            id v110 = [(NSMutableArray *)v108 countByEnumeratingWithState:&v218 objects:v248 count:16];
          }
          while (v110);
        }
      }
    }
    if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"Type72GWiFiSupport"])
    {
      uint64_t v114 = v7->var8.var8;
      double v115 = v7->var8.var2;
      double v116 = v7->var8.var3 * 0.5;
      double v117 = v115 - v116;
      double v118 = v115 + v116;
      double v119 = v7->var8.var0;
      double v120 = v7->var8.var1 * 0.5;
      double v121 = v119 - v120;
      double v122 = v119 + v120;
      +[WCM_Logging logLevel:4, @"TYPE7_2GWIFI_SUPPORT_: Band7 Cell info: BandType: bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf)", v114, *(void *)&v117, *(void *)&v118, v119 - v120, v119 + v120 message];
      [(WCM_PolicyManager *)self setWifi2GHzLTEB7IMD3ChannelsEnableType7:[(WCM_WiFiCellCoexIssueBandTable *)[(WCM_PlatformManager *)v5 wcmWiFiCellCoexIssueTable] wifi2GHzLTEB7IMD3EnableType7ForCellBandInfoType:v114 cellDlLowFreq:v117 cellDlHighFreq:v118 cellUlLowFreq:v121 cellUlHighFreq:v122]];
      +[WCM_Logging logLevel:4, @"TYPE7_2GWIFI_SUPPORT_: 2.4GHz Channels to enable Type7 MSG due to LTEB7 IMD issue = %@", [(WCM_PolicyManager *)self wifi2GHzLTEB7IMD3ChannelsEnableType7] message];
    }
    uint64_t v8 = v189;
    uint64_t v3 = v196;
    unint64_t v13 = v185;
    goto LABEL_170;
  }
  uint64_t v194 = v3;
  switch((int)v3)
  {
    case 0:
      double v36 = [(WCM_PlatformManager *)v5 wcmWiFiB7BlocklistChannels];
      double v37 = [(WCM_PlatformManager *)v5 wcmWiFiB7WCI2EnabledChannels];
      __int16 v38 = [(WCM_PlatformManager *)v5 wcmBTB7AFHMap];
      goto LABEL_72;
    case 1:
      double v36 = [(WCM_PlatformManager *)v5 wcmWiFiB40ABlocklistChannels];
      double v37 = [(WCM_PlatformManager *)v5 wcmWiFiB40AWCI2EnabledChannels];
      __int16 v38 = [(WCM_PlatformManager *)v5 wcmBTB40AAFHMap];
      goto LABEL_72;
    case 2:
      double v36 = [(WCM_PlatformManager *)v5 wcmWiFiB40BBlocklistChannels];
      double v37 = [(WCM_PlatformManager *)v5 wcmWiFiB40BWCI2EnabledChannels];
      __int16 v38 = [(WCM_PlatformManager *)v5 wcmBTB40BAFHMap];
      goto LABEL_72;
    case 3:
      double v36 = [(WCM_PlatformManager *)v5 wcmWiFiB41A1BlocklistChannels];
      double v37 = [(WCM_PlatformManager *)v5 wcmWiFiB41A1WCI2EnabledChannels];
      __int16 v38 = [(WCM_PlatformManager *)v5 wcmBTB41A1AFHMap];
      goto LABEL_72;
    case 4:
      double v36 = [(WCM_PlatformManager *)v5 wcmWiFiB41A2BlocklistChannels];
      double v37 = [(WCM_PlatformManager *)v5 wcmWiFiB41A2WCI2EnabledChannels];
      __int16 v38 = [(WCM_PlatformManager *)v5 wcmBTB41A2AFHMap];
LABEL_72:
      float v65 = v38;
      break;
    default:
      float v65 = [(WCM_PlatformManager *)v5 wcmBTAFHMapDefault];
      double v36 = (NSArray *)&off_10024E3E0;
      double v37 = (NSArray *)&off_10024E3F8;
      break;
  }
  +[WCM_Logging logLevel:3, @"BT AFH channel bitmap %@", v65 message];
  [(WCM_PolicyManager *)self setBtPreferredChannelMap:v65];
  [(WCM_PolicyManager *)self setBtPreferredChannelMapOnGpsRadioActive:v65];
  uint64_t v188 = v8;
  if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiWCI2BitmapV2Enabled"])
  {
    [(WCM_PolicyManager *)self setWifiChannelsToEnableWCI2V2:+[NSMutableArray arrayWithArray:v37]];
  }
  else
  {
    [(WCM_PolicyManager *)self setWifiChannelsToEnableWCI2:v37];
  }
  id v66 = +[NSMutableArray array];
  id v67 = [(WCM_PolicyManager *)self legacyWiFiChannelsToAvoidForIMD3Cell];
  if ([v67 count])
  {
    long long v212 = 0u;
    long long v213 = 0u;
    long long v210 = 0u;
    long long v211 = 0u;
    id v68 = [v67 countByEnumeratingWithState:&v210 objects:v246 count:16];
    if (v68)
    {
      id v69 = v68;
      uint64_t v70 = *(void *)v211;
      do
      {
        for (jj = 0; jj != v69; jj = (char *)jj + 1)
        {
          if (*(void *)v211 != v70) {
            objc_enumerationMutation(v67);
          }
          uint64_t v72 = *(void *)(*((void *)&v210 + 1) + 8 * (void)jj);
          if (([v66 containsObject:v72] & 1) == 0) {
            [v66 addObject:v72];
          }
        }
        id v69 = [v67 countByEnumeratingWithState:&v210 objects:v246 count:16];
      }
      while (v69);
    }
    +[WCM_Logging logLevel:3, @"blocklist channels after combining channels for IMD3 Cell %@", v66 message];
  }
  id v73 = [(WCM_PolicyManager *)self legacyWiFiChannelsToAvoidFor3FoWiFi];
  if ([v73 count])
  {
    long long v208 = 0u;
    long long v209 = 0u;
    long long v206 = 0u;
    long long v207 = 0u;
    id v74 = [v73 countByEnumeratingWithState:&v206 objects:v245 count:16];
    if (v74)
    {
      id v75 = v74;
      uint64_t v76 = *(void *)v207;
      do
      {
        for (kk = 0; kk != v75; kk = (char *)kk + 1)
        {
          if (*(void *)v207 != v76) {
            objc_enumerationMutation(v73);
          }
          uint64_t v78 = *(void *)(*((void *)&v206 + 1) + 8 * (void)kk);
          if (([v66 containsObject:v78] & 1) == 0) {
            [v66 addObject:v78];
          }
        }
        id v75 = [v73 countByEnumeratingWithState:&v206 objects:v245 count:16];
      }
      while (v75);
    }
    +[WCM_Logging logLevel:4, @"blocklist channels after combining channels for 3Fo WiFi %@", v66 message];
  }
  [(WCM_PolicyManager *)self setLegacyWiFiBlocklistChannelsFor3FoWiFi:v73];
  id v79 = [(WCM_PolicyManager *)self legacyWiFiChannelsToAvoidForIMD2GPS];
  long long v202 = 0u;
  long long v203 = 0u;
  long long v204 = 0u;
  long long v205 = 0u;
  id v80 = [v79 countByEnumeratingWithState:&v202 objects:v244 count:16];
  if (v80)
  {
    id v81 = v80;
    uint64_t v82 = *(void *)v203;
    do
    {
      for (mm = 0; mm != v81; mm = (char *)mm + 1)
      {
        if (*(void *)v203 != v82) {
          objc_enumerationMutation(v79);
        }
        uint64_t v84 = *(void *)(*((void *)&v202 + 1) + 8 * (void)mm);
        if (([v66 containsObject:v84] & 1) == 0) {
          [v66 addObject:v84];
        }
      }
      id v81 = [v79 countByEnumeratingWithState:&v202 objects:v244 count:16];
    }
    while (v81);
  }
  +[WCM_Logging logLevel:4, @"blocklist channels after combining channels for IMD2 GPS %@", v66 message];
  if (![(NSArray *)v36 isEqualToArray:&off_10024E410])
  {
    long long v200 = 0u;
    long long v201 = 0u;
    long long v198 = 0u;
    long long v199 = 0u;
    id v85 = [(NSArray *)v36 countByEnumeratingWithState:&v198 objects:v243 count:16];
    if (v85)
    {
      id v86 = v85;
      uint64_t v87 = *(void *)v199;
      do
      {
        for (nn = 0; nn != v86; nn = (char *)nn + 1)
        {
          if (*(void *)v199 != v87) {
            objc_enumerationMutation(v36);
          }
          uint64_t v89 = *(void *)(*((void *)&v198 + 1) + 8 * (void)nn);
          if (([v66 containsObject:v89] & 1) == 0) {
            [v66 addObject:v89];
          }
        }
        id v86 = [(NSArray *)v36 countByEnumeratingWithState:&v198 objects:v243 count:16];
      }
      while (v86);
    }
    +[WCM_Logging logLevel:4, @"blocklist channels after combined with wifiBlocklistChannelsForOOB: %@", v66 message];
  }
  if (sub_10008C87C(v66))
  {
    [v66 removeObject:&off_10023D110];
    +[WCM_Logging logLevel:4, @"removed channel 11, now blocklist is %@", v66 message];
  }
  [v66 sortUsingComparator:&stru_100211428];
  uint64_t v8 = v188;
  if (![v66 count]) {
    [v66 addObject:&off_10023CCA8];
  }
  +[WCM_Logging logLevel:5, @"WiFi channels to blocklist %@", v66 message];
  [(WCM_PolicyManager *)self setWifiChannelsToBlocklist:v66];
  uint64_t v3 = v194;
LABEL_260:
  if (v3 == 1) {
    v161 = [(WCM_PlatformManager *)v5 wcmCellularWCI2ModeRBThresholdHigh];
  }
  else {
    v161 = [(WCM_PlatformManager *)v5 wcmCellularWCI2ModeRBThresholdLow];
  }
  [(WCM_CellularController *)v4 updateRBThreshold:[(NSNumber *)v161 intValue]];
  [(WCM_PolicyManager *)self configureForLTECDRXWiFiTimeSharing];
  +[WCM_Logging logLevel:4, @"configureAllWCI2 gets called with input (inCoexBand: %d)", v8 message];
  [(WCM_PolicyManager *)self configureAllWCI2:v8];
  if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"PencilCoexSupport"])
  {
    [(WCM_PolicyManager *)self updatePencilCoexActivationCondition];
    [(WCM_PolicyManager *)self handleWiFiBTCoexChange];
    [(WCM_PolicyManager *)self configureWifiAntennaSelectionForCoex];
    [(WCM_PolicyManager *)self configureBTAntennaSelection];
  }
  else
  {
    [(WCM_PolicyManager *)self configureWifiAntennaSelectionForCoex];
  }
  [(WCM_PolicyManager *)self updateCellTxPowerLimit];
  if ([(WCM_BTController *)[(WCM_PolicyManager *)self btController] powerState])
  {
    int v162 = v8;
    unsigned int v163 = [(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"BTDiversityAFHMap"];
    unsigned int v164 = [(WCM_PolicyManager *)self gpsRadioActive];
    if (v163)
    {
      v165 = [(WCM_PolicyManager *)self btController];
      if (v164)
      {
        v166 = [(WCM_PolicyManager *)self btDiversityChannelMapOnGpsRadioActiveForC0B0];
        v167 = [(WCM_PolicyManager *)self btDiversityChannelMapOnGpsRadioActiveForC0B1];
        v168 = [(WCM_PolicyManager *)self btDiversityChannelMapOnGpsRadioActiveForC1B0];
        v169 = [(WCM_PolicyManager *)self btDiversityChannelMapOnGpsRadioActiveForC1B1];
      }
      else
      {
        v166 = [(WCM_PolicyManager *)self btDiversityChannelMapForC0B0];
        v167 = [(WCM_PolicyManager *)self btDiversityChannelMapForC0B1];
        v168 = [(WCM_PolicyManager *)self btDiversityChannelMapForC1B0];
        v169 = [(WCM_PolicyManager *)self btDiversityChannelMapForC1B1];
      }
      [(WCM_BTController *)v165 updateDiversityAFHMapForC0B0:v166 C0B1:v167 C1B0:v168 C1B1:v169];
    }
    else
    {
      if (v164) {
        v170 = [(WCM_PolicyManager *)self btPreferredChannelMapOnGpsRadioActive];
      }
      else {
        v170 = [(WCM_PolicyManager *)self btPreferredChannelMap];
      }
      v171 = v170;
      if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"hpcellularstatemonitorsupport"])
      {
        +[WCM_Logging logLevel:4, @"HPCellular (handleCellularNetworkUpdate): Bool flag self.hpCellNeed2SetBTAFH = (%d), Fixed AFH self.btPreferredChannelMapHPCellularActive = (%@).", [(WCM_PolicyManager *)self hpCellNeed2SetBTAFH], [(WCM_PolicyManager *)self btPreferredChannelMapHPCellularActive] message];
        if ([(WCM_PolicyManager *)self hpCellNeed2SetBTAFH]) {
          v171 = [(WCM_PolicyManager *)self btPreferredChannelMapHPCellularActive];
        }
      }
      [(WCM_BTController *)[(WCM_PolicyManager *)self btController] updatePreferredAFHMap:v171];
    }
    if (_os_feature_enabled_impl()
      && [(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"HFBTCoex"])
    {
      v172 = [(WCM_PolicyManager *)self btPreferred5GChannelMap];
      +[WCM_Logging logLevel:3 message:@"HFAFHDebug_ Update channel bitmap"];
      [(WCM_BTController *)[(WCM_PolicyManager *)self btController] updatePreferredHFBTChannelMap:v172];
    }
    if (_os_feature_enabled_impl()
      && [(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"HFBTCoex"])
    {
      +[WCM_Logging logLevel:4, @"HFBTAntBlkDebug_ Current enabled bands = %@", [(WCM_PolicyManager *)self HFBTAntBlkEnableBands] message];
      unsigned int v173 = [(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"HFBTConditionId"];
      v174 = [(WCM_PolicyManager *)self btController];
      unint64_t v175 = [(WCM_PolicyManager *)self btAntBlockDuration];
      id v176 = [[-[NSDictionary objectForKeyedSubscript:](-[WCM_PolicyManager HFBTAntBlkEnableBands](self, "HFBTAntBlkEnableBands")) objectForKeyedSubscript:@"AntBlkBandUnii1Enabled"] BOOLValue];
      id v177 = [[-[NSDictionary objectForKeyedSubscript:](-[WCM_PolicyManager HFBTAntBlkEnableBands](self, "HFBTAntBlkEnableBands")) objectForKeyedSubscript:@"AntBlkBandUnii3Enabled"] BOOLValue];
      unsigned int contexta = [[-[NSDictionary objectForKeyedSubscript:](-[WCM_PolicyManager HFBTAntBlkEnableBands](self, "HFBTAntBlkEnableBands")) objectForKeyedSubscript:@"AntBlkBandUnii5aEnabled"] BOOLValue];
      unsigned int v191 = [[-[NSDictionary objectForKeyedSubscript:](-[WCM_PolicyManager HFBTAntBlkEnableBands](self, "HFBTAntBlkEnableBands")) objectForKeyedSubscript:@"AntBlkBandUnii5bEnabled"] BOOLValue];
      unsigned int v186 = [[-[NSDictionary objectForKeyedSubscript:](-[WCM_PolicyManager HFBTAntBlkEnableBands](self, "HFBTAntBlkEnableBands")) objectForKeyedSubscript:@"AntBlkBandUnii5cEnabled"] BOOLValue];
      LOBYTE(v179) = [[-[NSDictionary objectForKeyedSubscript:](-[WCM_PolicyManager HFBTAntBlkEnableBands](self, "HFBTAntBlkEnableBands") objectForKeyedSubscript:@"AntBlkBandUnii5dEnabled") BOOLValue];
      if (v173) {
        -[WCM_BTController updateHFBtAntennaRequestWithDuration:unii1Enabled:unii3Enabled:unii5aEnabled:unii5bEnabled:unii5cEnabled:unii5dEnabled:unii1ConditionId:unii3ConditionId:unii5aConditionId:unii5bConditionId:unii5cConditionId:unii5dConditionId:](v174, "updateHFBtAntennaRequestWithDuration:unii1Enabled:unii3Enabled:unii5aEnabled:unii5bEnabled:unii5cEnabled:unii5dEnabled:unii1ConditionId:unii3ConditionId:unii5aConditionId:unii5bConditionId:unii5cConditionId:unii5dConditionId:", v175, v176, v177, contexta, v191, v186, v179, [&off_10023D0C8 unsignedIntValue], [&off_10023D0C8 unsignedIntValue], [&off_10023D0C8 unsignedIntValue], [&off_10023D0C8 unsignedIntValue], [&off_10023D0C8 unsignedIntValue]);
      }
      else {
        [(WCM_BTController *)v174 updateHFBtAntennaRequestWithDuration:v175 unii1Enabled:v176 unii3Enabled:v177 unii5aEnabled:contexta unii5bEnabled:v191 unii5cEnabled:v186 unii5dEnabled:v179];
      }
    }
    if ([(WCM_BTController *)[(WCM_PolicyManager *)self btController] getBTState] == 2) {
      [(WCM_BTController *)[(WCM_PolicyManager *)self btController] updatePreferredRole:[(WCM_PolicyManager *)self btPreferredRole]];
    }
    if ([(WCM_PolicyManager *)self cellularWCI2CoexPolicyBitmap]) {
      int v178 = v162;
    }
    else {
      int v178 = 0;
    }
    if (v178 == 1) {
      [(WCM_BTController *)[(WCM_PolicyManager *)self btController] updateMWSFrameConfig:v4];
    }
    [(WCM_BTController *)[(WCM_PolicyManager *)self btController] updateMWSChannelParameters:v4];
    if ((v162 & 1) == 0) {
      +[WCM_Logging logLevel:4, @"ZeroFreqDebug: For non-coex scenario (including RRC idle), WRM pass actual frequences instead of zeros to BT, inCoexBand= %d", 0 message];
    }
    if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WifiBtAgcCoexMode"])
    {
      +[WCM_Logging logLevel:4, @"CrashDebug_ 1st place self.btAgcCoexModeEnable is %ld", [(NSNumber *)[(WCM_PolicyManager *)self btAgcCoexModeEnable] integerValue] message];
      [(WCM_BTController *)[(WCM_PolicyManager *)self btController] updateCoexRxGainMode:[(WCM_PolicyManager *)self btAgcCoexModeEnable]];
    }
  }
  if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WifiGen9rFemConfig"])
  {
    [(WCM_PolicyManager *)self evaluateGen9rFemConfig];
  }
  if ([(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] powerState]) {
    [(WCM_PolicyManager *)self handleWiFiConfigChange];
  }
  [(WCM_PolicyManager *)self handleFTCall];
  [(WCM_PolicyManager *)self updateCoexMonitorState:v3];
  if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"hpcellularstatemonitorsupport"])
  {
    +[WCM_Logging logLevel:4 message:@"HPCellular: Calling [self queryHPCellularInitialState] from handleCellularNetworkUpdate."];
    [(WCM_PolicyManager *)self queryHPCellularInitialState];
  }
}

- (NSDictionary)HFBTAntBlkEnableBands
{
  return self->_HFBTAntBlkEnableBands;
}

- (BOOL)hpCellNeed2SetBTAFH
{
  return self->_hpCellNeed2SetBTAFH;
}

- (int)cellularCoexBand
{
  uint64_t v3 = [(WCM_PolicyManager *)self cellularController];
  [(WCM_CellularController *)v3 ulCenterFreq];
  double v5 = v4;
  [(WCM_CellularController *)v3 ulBandwidth];
  double v7 = v6;
  [(WCM_CellularController *)v3 dlCenterFreq];
  double v9 = v8;
  [(WCM_CellularController *)v3 dlBandwidth];
  double v11 = v10;
  LODWORD(v3) = [(WCM_CellularController *)v3 tddBand];
  unint64_t v12 = [(WCM_PolicyManager *)self platformManager];
  if (v3)
  {
    if ([(WCM_PlatformManager *)v12 isBand40ACoexActiveForULFreq:v5 ulBW:v7 dlFreq:v9 dlBW:v11])
    {
      return 1;
    }
    if ([(WCM_PlatformManager *)[(WCM_PolicyManager *)self platformManager] isBand40BCoexActiveForULFreq:v5 ulBW:v7 dlFreq:v9 dlBW:v11])
    {
      return 2;
    }
    if ([(WCM_PlatformManager *)[(WCM_PolicyManager *)self platformManager] isBand41A1CoexActiveForULFreq:v5 ulBW:v7 dlFreq:v9 dlBW:v11])
    {
      return 3;
    }
    if ([(WCM_PlatformManager *)[(WCM_PolicyManager *)self platformManager] isBand41A2CoexActiveForULFreq:v5 ulBW:v7 dlFreq:v9 dlBW:v11])
    {
      return 4;
    }
  }
  else if ([(WCM_PlatformManager *)v12 isBand7CoexActiveForULFreq:v5 ulBW:v7 dlFreq:v9 dlBW:v11])
  {
    return 0;
  }
  if (![(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"Bb20PolicyConversion"]&& ![(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"LegacyNonCoexBandBitmapFix"])
  {
    return 7;
  }
  if ([(WCM_PolicyManager *)self wcmCellularCoexBand]) {
    return 6;
  }
  return 7;
}

- (WCM_PlatformManager)platformManager
{
  return self->_platformManager;
}

- (BOOL)wcmCellularCoexBand
{
  return self->_wcmCellularCoexBand;
}

- (NSMutableArray)wifiChannelsToEnableLTEMBType7
{
  return self->_wifiChannelsToEnableLTEMBType7;
}

- (NSMutableArray)wifiChannelsToDisableOCL2G5G
{
  return self->_wifiChannelsToDisableOCL2G5G;
}

- (NSMutableArray)wifi2GHzLTEB7IMD3ChannelsEnableType7
{
  return self->_wifi2GHzLTEB7IMD3ChannelsEnableType7;
}

- (NSMutableArray)wifi2GHzChannelsToEnableType7MSGCombined
{
  return self->_wifi2GHzChannelsToEnableType7MSGCombined;
}

- (void)setWifiChannelsToDisableOCL2G5G:(id)a3
{
}

- (void)setWcmCellularCoexBand:(BOOL)a3
{
  self->_wcmCellularCoexBand = a3;
}

- (unint64_t)BLEActiveScanPwrLmtAssrInt
{
  return self->_BLEActiveScanPwrLmtAssrInt;
}

+ (id)singleton
{
  objc_sync_enter(a1);
  uint64_t v3 = (unsigned char *)qword_10027D280;
  if (!qword_10027D280)
  {
    v14.receiver = a1;
    v14.super_class = (Class)&OBJC_METACLASS___WCM_PolicyManager;
    qword_10027D280 = (uint64_t)[[objc_msgSendSuper2(&v14, "allocWithZone:", 0) init];
    if (objc_msgSend(objc_msgSend((id)qword_10027D280, "platformManager"), "wcmWiFiCellCoexIssueTable"))
    {
      CFArrayRef v4 = (const __CFArray *)CLCopyTechnologiesInUse();
      CFArrayRef v5 = v4;
      if (v4)
      {
        BOOL v6 = sub_10000BD70(v4);
        CFRelease(v5);
        double v7 = "inactive";
        if (v6) {
          double v7 = "active";
        }
      }
      else
      {
        +[WCM_Logging logLevel:3 message:@"activeTechs is null"];
        LOBYTE(v6) = 0;
        double v7 = "inactive";
      }
      +[WCM_Logging logLevel:1, @"GPS is %s initially", v7 message];
      *(unsigned char *)(qword_10027D280 + 11) = v6;
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_100003F20, CLTechStatusChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    if ((objc_msgSend(objc_msgSend((id)qword_10027D280, "activeCoexFeatures"), "containsObject:", @"CTSacDriverNeedGpsFreq") & 1) != 0|| (objc_msgSend(objc_msgSend((id)qword_10027D280, "activeCoexFeatures"), "containsObject:", @"AntennaTuningForGpsBB20") & 1) != 0|| objc_msgSend(objc_msgSend((id)qword_10027D280, "activeCoexFeatures"), "containsObject:", @"SacPolicySupport"))
    {
      double v9 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v9, 0, (CFNotificationCallback)sub_1000CC66C, CLGnssBandsChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      +[WCM_Logging logLevel:5, @"Sac driver: added notification gpsRadioActive %d", *(unsigned __int8 *)(qword_10027D280 + 11) message];
      sub_1000D5318();
    }
    id v10 = [[objc_msgSend((id)qword_10027D280, "activeCoexFeatures") containsObject:@"EnableULCA"];
    [qword_10027D280 setWcmCellularWCI2Mode_Ext_Enable:v10];
    [qword_10027D280 setWcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap:1];
    if (objc_msgSend(objc_msgSend((id)qword_10027D280, "activeCoexFeatures"), "containsObject:", @"Bb20PolicyConversion"))
    {
      [(id)qword_10027D280 setWcmCellularCCSetToBB:0];
      [qword_10027D280 setWcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap:0];
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, @"ULCA Init-0-ULCA critical bitmap %d", objc_msgSend((id)qword_10027D280, "wcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap"));
    if (objc_msgSend(objc_msgSend((id)qword_10027D280, "activeCoexFeatures"), "containsObject:", @"RCU2SupportIntegrated"))
    {
      +[WCM_Logging logLevel:1 message:@"RCU2: Creating the controller"];
      [(id)qword_10027D280 setRcu2Controller:objc_opt_new()];
      [objc_msgSend((id)qword_10027D280, "rcu2Controller") initWithConnection:0 processId:30];
      [objc_msgSend((id)qword_10027D280, "rcu2Controller") updateControllerSession:30 ofId:[objc_msgSend((id)qword_10027D280, "rcu2Controller") rcu2Controller]];
    }
    if (objc_msgSend(objc_msgSend((id)qword_10027D280, "activeCoexFeatures"), "containsObject:", @"UseWCMAriDriver"))
    {
      id v11 = +[WCM_AriCoexCommandDriver singleton];
      if (v11)
      {
        if (objc_msgSend(objc_msgSend((id)qword_10027D280, "activeCoexFeatures"), "containsObject:", @"AriInterfaceVer1"))
        {
          uint64_t v12 = 1;
        }
        else
        {
          if (!objc_msgSend(objc_msgSend((id)qword_10027D280, "activeCoexFeatures"), "containsObject:", @"AriInterfaceVer2"))
          {
LABEL_26:
            [v11 connectBaseband];
            goto LABEL_27;
          }
          uint64_t v12 = 2;
        }
        [v11 createCommandHandlerForAriVersion:v12];
        goto LABEL_26;
      }
      +[WCM_Logging logLevel:0 message:@"Failed to create ARI driver!"];
    }
    else
    {
      +[WCM_Logging logLevel:3 message:@"ARI driver is not created as feature is not enabled"];
    }
LABEL_27:
    [(id)qword_10027D280 startHomeKitTimer];
    uint64_t v3 = (unsigned char *)qword_10027D280;
  }
  v3[28] = 0;
  objc_sync_exit(a1);
  return v3;
}

- (WCM_SacManager)sacManager
{
  return self->_sacManager;
}

- (void)handleWiFiBTCoexChange
{
  unsigned __int8 v43 = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiState];
  *((void *)&v44 + 1) = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] numSCODevice];
  *(void *)&long long v44 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] numeSCODevice];
  unint64_t v3 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] getNum2GHzAclA2DPDevices];
  unint64_t v4 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] numHIDDevice];
  unint64_t v45 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] numLEDevice];
  unint64_t v46 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] numLEADevice];
  unint64_t v5 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] numLLADevice];
  [(WCM_BTController *)[(WCM_PolicyManager *)self btController] isBtAntennaDesensed];
  [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] isSideCarInProgress];
  [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] isEnsembleInProgress];
  [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] isAutoUnlockRangingInProgress];
  uint64_t v6 = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] getPhyMode];
  if ([WCM_PolicyManager singleton].activeCoexFeatures.containsObject(@"RCU2SupportIntegrated"))BOOL v7 = [WCM_CtrXPCClient getRCU2Status][WCM_RCU2Controller threadClient][WCM_PolicyManager rcu2Controller].threadClient.getRCU2Status; {
  else
  }
    BOOL v7 = 0;
  +[WCM_Logging logLevel:4, @"threadActive is %d", v7 message];
  if (self->_forceRealTimeAWDL)
  {
    +[WCM_Logging logLevel:2 message:@"Forcing AWDL RTG Active due to defaults write"];
    [(WCM_BTController *)[(WCM_PolicyManager *)self btController] updateAWDLRTGActive:1];
  }
  +[WCM_Logging logLevel:2, @"Handle WiFi/BT Coex change phyMode11ax: %d", v6 == 6 message];
  self->_coexProfile2GTDDReason = 0;
  +[WCM_Logging logLevel:2, @"Handle WiFi/BT Coex change %d", self->_findMyPencilScanActive message];
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"WiFiBtProfile")&& -[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState"))
  {
    +[WCM_Logging logLevel:2 message:@"Handle WiFi/BT Coex change"];
    if ([(WCM_BTController *)[(WCM_PolicyManager *)self btController] powerState]
      && (v44 != 0 || v3 || v4 || v45))
    {
      if (*((void *)&v44 + 1) || !(v4 | v45) || (void)v44 || v3 || v46)
      {
        if (v44 == 0 || v4 || v45)
        {
          double v8 = [(WCM_PolicyManager *)self wifiController];
          if (v3 != 1 || v4 || v45) {
            uint64_t v9 = 4;
          }
          else {
            uint64_t v9 = 3;
          }
        }
        else
        {
          double v8 = [(WCM_PolicyManager *)self wifiController];
          uint64_t v9 = 2;
        }
      }
      else
      {
        double v8 = [(WCM_PolicyManager *)self wifiController];
        uint64_t v9 = 1;
      }
    }
    else
    {
      double v8 = [(WCM_PolicyManager *)self wifiController];
      uint64_t v9 = 0;
    }
    uint64_t v10 = 0;
    goto LABEL_29;
  }
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"WiFiBt5GProfile")&& -[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState"))
  {
    +[WCM_Logging logLevel:2 message:@"Handle WiFi/BT Coex change"];
    if (![(WCM_BTController *)[(WCM_PolicyManager *)self btController] powerState]) {
      goto LABEL_27;
    }
    if (!self->_pencilCoexActive && !v7 && !self->_findMyPencilScanActive)
    {
      if ([(WCM_BTController *)[(WCM_PolicyManager *)self btController] getAny2GHzBTDevicesConnected])
      {
        if (!(v4 | v45)
          || [(WCM_BTController *)[(WCM_PolicyManager *)self btController] get2GHzSub15msAudioDevicesConnected]|| v3|| v46)
        {
          if (![(WCM_BTController *)[(WCM_PolicyManager *)self btController] get2GHzSub15msAudioDevicesConnected]|| v4|| v45)
          {
            double v8 = [(WCM_PolicyManager *)self wifiController];
            if (v3 != 1 || v4 || v45) {
              uint64_t v9 = 4;
            }
            else {
              uint64_t v9 = 3;
            }
          }
          else
          {
            double v8 = [(WCM_PolicyManager *)self wifiController];
            uint64_t v9 = 2;
          }
        }
        else
        {
          double v8 = [(WCM_PolicyManager *)self wifiController];
          uint64_t v9 = 1;
        }
        goto LABEL_28;
      }
LABEL_27:
      double v8 = [(WCM_PolicyManager *)self wifiController];
      uint64_t v9 = 0;
LABEL_28:
      uint64_t v10 = 6;
LABEL_29:
      [(WCM_WiFiController *)v8 updateWiFiBTCoexActiveProfileFor2G:v9 and5G:v10];
      goto LABEL_30;
    }
    +[WCM_Logging logLevel:2, @"Setting TDD profile for 2.4GHz - pencilCoexActive || _findMyPencilScanActive || threadActive is (%d || %d || %d)", self->_pencilCoexActive, self->_findMyPencilScanActive, v7 message];
    [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] updateWiFiBTCoexActiveProfileFor2G:4 and5G:6];
    if (self->_pencilCoexActive)
    {
      int v37 = 1;
    }
    else if (self->_findMyPencilScanActive)
    {
      int v37 = 3;
    }
    else
    {
      int v37 = 2;
    }
    self->_coexProfile2GTDDReason = v37;
  }
LABEL_30:
  if ([(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] powerState])
  {
    if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"WiFiBTeSCOLimitedAggregation"))
    {
      if ([(WCM_BTController *)[(WCM_PolicyManager *)self btController] get2GHzSub15msNonSCOConnected])
      {
        CFStringRef v11 = @"Sub15msBTAudio link active sending Wifi controller eSCO traffic status";
LABEL_58:
        +[WCM_Logging logLevel:2 message:v11];
        char v16 = 1;
        goto LABEL_59;
      }
      +[WCM_Logging logLevel:2, @"Sub15msBTAudio link not active sending Wifi controller eSCO traffic status", v42 message];
LABEL_53:
      char v16 = 0;
LABEL_59:
      byte_10027D288 = v16;
      goto LABEL_60;
    }
    if (!objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"WiFiBTeSCOLimitedAggregation11ax")|| !objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"WiFiBTLimitedAggregation"))
    {
      if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"WiFiBTeSCOLimitedAggregation11ax"))
      {
        unsigned int v15 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] get2GHzSub15msNonSCOConnected];
        if (v6 == 6 && v15)
        {
          CFStringRef v11 = @"Handle WiFi/BT Coex 11ax AND Sub15msBTAudio active";
          goto LABEL_58;
        }
        unsigned int v38 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] get2GHzSub15msNonSCOConnected];
        uint64_t v39 = "InActive";
        if (v38) {
          uint64_t v39 = "Active";
        }
        +[WCM_Logging logLevel:2, @"Handle WiFi/BT Coex 11ax(%d) OR Sub15msBTAudio(%s) link not active", v6 == 6, v39 message];
      }
      else
      {
        if (![[WCM_PolicyManager singleton] activeCoexFeatures].containsObject:@"WiFiBTLimitedAggregation")goto LABEL_60; {
        if ([(WCM_BTController *)[(WCM_PolicyManager *)self btController] get2GHzSub15msNonSCOConnected]&& v4 >= 2)
        }
        {
          CFStringRef v11 = @"Handle WiFi/BT Coex eSCOplus2HID true";
          goto LABEL_58;
        }
        unsigned int v40 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] get2GHzSub15msNonSCOConnected];
        id v41 = "InActive";
        if (v40) {
          id v41 = "Active";
        }
        +[WCM_Logging logLevel:2, @"Handle WiFi/BT Coex Sub15msBTAudio: %s, numHID: %lu", v41, v4 message];
      }
      if ([(WCM_BTController *)[(WCM_PolicyManager *)self btController] get2GHzSub15msNonSCOConnected])
      {
        goto LABEL_60;
      }
      goto LABEL_53;
    }
    +[WCM_Logging logLevel:2, @"Handle WiFi/BT Coex eSCOplus2HID state %d", byte_10027D289 message];
    if ([(WCM_BTController *)[(WCM_PolicyManager *)self btController] get2GHzSub15msNonSCOConnected]&& v4 >= 2&& (byte_10027D289 & 1) == 0)
    {
      byte_10027D289 = 1;
      unsigned int v12 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] get2GHzSub15msNonSCOConnected];
      unint64_t v13 = "InActive";
      if (v12) {
        unint64_t v13 = "Active";
      }
      +[WCM_Logging logLevel:2, @"Handle WiFi/BT Coex Sub15msBTAudio: %s, numHID: %lu", v13, v4 message];
      byte_10027D288 = 1;
    }
    unsigned int v14 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] get2GHzSub15msNonSCOConnected];
    if (v6 == 6 && v14 && (byte_10027D289 & 1) == 0)
    {
      +[WCM_Logging logLevel:2 message:@"Handle WiFi/BT Coex 11ax AND eSCO link active"];
      byte_10027D288 = 1;
    }
    if (![(WCM_BTController *)[(WCM_PolicyManager *)self btController] get2GHzSub15msNonSCOConnected])
    {
      byte_10027D289 = 0;
      +[WCM_Logging logLevel:2, @"Handle WiFi/BT Coex Sub15msBTAudio: InActive, numHID: %lu", v4 message];
      goto LABEL_53;
    }
  }
LABEL_60:
  uint64_t v17 = byte_10027D288;
  +[WCM_Logging logLevel:2, @"Handle WiFi/BT Coex LA final enable(%d) useCase(%d)", byte_10027D288, byte_10027D288 message];
  double v18 = [(WCM_PolicyManager *)self wifiController];
  [(WCM_WiFiController *)v18 updateWiFiLimitedAggregationActiveStatus:byte_10027D288 andUseCase:v17];
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"WiFiBTA2DPIndication")&& -[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState")&& byte_10027D28A != (v3 != 0))
  {
    +[WCM_Logging logLevel:2, @"Handle WiFi/BT Coex send Wifi controller A2DP status to %d", v3 != 0 message];
    [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] updateWiFiA2DPActiveStatus:v3 != 0];
    byte_10027D28A = v3 != 0;
  }
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"WiFiBTA2DPLLAIndication")&& -[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState")&& byte_10027D28B != (v5 != 0))
  {
    +[WCM_Logging logLevel:2, @"Handle WiFi/BT Coex send Wifi controller LLA status to %d", v5 != 0 message];
    [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] updateWiFiA2DPLLAActiveStatus:v5 != 0];
    byte_10027D28B = v5 != 0;
  }
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"LPSCOffload")&& -[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState"))
  {
    unsigned int v19 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] get2GHzSub15msAudioDevicesConnected];
    if (v3) {
      unsigned int v20 = 1;
    }
    else {
      unsigned int v20 = v19;
    }
    if (v46) {
      uint64_t v21 = 1;
    }
    else {
      uint64_t v21 = v20;
    }
    double v22 = "disable";
    if (!v21) {
      double v22 = "enable";
    }
    +[WCM_Logging logLevel:2, @"Handle WiFi/BT Coex change LPSC Beacon Offload %s, LPSC Scan Offload: %s", v22, v22 message];
    [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] updateLPSCBeaconOffload:v21 andScanOffload:v21];
  }
  BOOL v23 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] get2GHzSub15msNonSCOConnected];
  if (byte_10027D28C != v23)
  {
    BOOL v24 = v23;
    +[WCM_Logging logLevel:2, @"Handle WiFi/BT Coex change sending Wifi controller sub15msNonSCO traffic status to %d", v23 message];
    [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] updateWiFieSCOActiveStatus:v24];
    byte_10027D28C = v24;
  }
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"RCU2Support"))
  {
    +[WCM_Logging logLevel:2 message:@"handleWiFiBTCoexChange updating 3way RC2 grant status for WiFi/BT"];
    [(WCM_PolicyManager *)self updateBTRCU2TimingArray];
    [(WCM_PolicyManager *)self updateWiFiRCU2TimingArray];
  }
  if ([+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton").activeCoexFeatures containsObject:@"RCU1Support"])-[WCM_PolicyManager handleWiFiRCU1Change](self, "handleWiFiRCU1Change"); {
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"WiFiAntennaFallback"))
  }
  {
    int64_t v25 = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] getNumberOfSpatialStreamOnAccessPoint];
    if ([(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] isAWDLInProgress])
    {
      +[WCM_Logging logLevel:3, @"Defer WiFi antenna fallback wifiAWDLInProgress(%d)", 1 message];
      return;
    }
    if ([(WCM_BTController *)[(WCM_PolicyManager *)self btController] powerState]
      && ((v6 & 0xFFFFFFFE) == 2 || v25 == 1))
    {
      +[WCM_Logging logLevel:3, @"phyMode(%d) numNSSOnAP(%d)", v6, v25 message];
      uint64_t v26 = 1;
    }
    else
    {
      uint64_t v26 = 0;
    }
    [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] disableAntennaSharedByBluetooth:v26 andReassociate:0];
  }
  unint64_t v50 = 0;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v47 = 0u;
  if ([(WCM_BTController *)[(WCM_PolicyManager *)self btController] powerState])
  {
    *(void *)&long long v47 = v3;
    *((void *)&v47 + 1) = v5;
    uint64_t v27 = *((void *)&v44 + 1);
    *(void *)&long long v48 = v4;
    *((void *)&v48 + 1) = *((void *)&v44 + 1);
    unint64_t v28 = v46;
    unint64_t v29 = v45;
    uint64_t v30 = v44;
    *(void *)&long long v49 = v44;
    *((void *)&v49 + 1) = v45;
    unint64_t v31 = v4;
    unint64_t v32 = v5;
    unint64_t v33 = v3;
    unint64_t v50 = v46;
  }
  else
  {
    +[WCM_Logging logLevel:2 message:@"updateBTConnectedDevices with btPower=off"];
    unint64_t v28 = 0;
    unint64_t v29 = 0;
    uint64_t v30 = 0;
    uint64_t v27 = 0;
    unint64_t v31 = 0;
    unint64_t v32 = 0;
    unint64_t v33 = 0;
  }
  if (unk_10027D290 != v33
    || xmmword_10027D298 != __PAIR128__(v31, v32)
    || qword_10027D2A8 != v27
    || unk_10027D2B0 != v30
    || xmmword_10027D2B8 != __PAIR128__(v28, v29))
  {
    +[WCM_Logging logLevel:2, @"updateBTConnectedDevices with numA2DP=%lu, numLLA=%lu, numHID=%lu, numSCO=%lu, numeSCO=%lu, numLE=%lu, numLEA=%lu", v3, v5, v4, *((void *)&v44 + 1), (void)v44, v45, v46 message];
    [(WCM_PolicyManager *)self handleBTCoexConnectedDevicesEvent_numA2DP:v3 numLLA:v5 numHID:v4 numSCO:*((void *)&v44 + 1) numeSCO:(void)v44 numLE:v45 numLEA:v46];
    [+[WCM_UCMClientManager WCM_UCMClientManagerSingleton](WCM_UCMClientManager, "WCM_UCMClientManagerSingleton") updateBTConnectedDevices:&v47];
    unk_10027D290 = v47;
    *(long long *)((char *)&xmmword_10027D298 + 8) = v48;
    unk_10027D2B0 = v49;
    *((void *)&xmmword_10027D2B8 + 1) = v50;
  }
  if ([WCM_PolicyManager singleton].activeCoexFeatures.containsObject(@"RCU2SupportIntegrated"))[-[WCM_RCU2Controller threadClient]([WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "threadClient") updateWiFiBand:v43];
  if (_os_feature_enabled_impl())
  }
  {
    if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"WiFiFigaroCoex"))
    {
      int v34 = dword_10027D2C8;
      if (v34 != [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiChannel]|| (int v35 = dword_10027D2CC, v35 != [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] channelBandwidthMHz])|| (v36 = dword_10027D2D0, v36 != [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] channelCenterFreqMHz]))
      {
        [(WCM_BTController *)[(WCM_PolicyManager *)self btController] updateWiFiChannelInfo:[(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiChannel] bandwidth:[(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] channelBandwidthMHz] regBand:[(WCM_PolicyManager *)self parseCenterFreqtoUNIIBand:[(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] channelCenterFreqMHz]]];
        dword_10027D2C8 = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiChannel];
        dword_10027D2CC = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] channelBandwidthMHz];
        dword_10027D2D0 = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] channelCenterFreqMHz];
      }
    }
  }
}

- (WCM_WiFiController)wifiController
{
  return self->_wifiController;
}

- (NSSet)activeCoexFeatures
{
  return self->_activeCoexFeatures;
}

- (WCM_BTController)btController
{
  return self->_btController;
}

- (WCM_RCU2Controller)rcu2Controller
{
  return self->_rcu2Controller;
}

- (void)handleSessionNotification:(unint64_t)a3
{
  if ((uint64_t)a3 > 999)
  {
    if ((uint64_t)a3 > 1900)
    {
      if ((uint64_t)a3 > 2702)
      {
        switch(a3)
        {
          case 0xA8FuLL:
            [(WCM_PolicyManager *)self handleWiFiNANChange];
            break;
          case 0xAF0uLL:
            [(WCM_PolicyManager *)self handleCameraStateIndication];
            break;
          case 0xAF1uLL:
            [(WCM_PolicyManager *)self handlePencilStateIndication];
            break;
        }
      }
      else
      {
        switch(a3)
        {
          case 0x76DuLL:
            [(WCM_PolicyManager *)self handleWiFiBTAirplayChange];
            break;
          case 0x898uLL:
            [(WCM_PolicyManager *)self handleWiFiBTCatsChange:0];
            break;
          case 0xA8EuLL:
            [(WCM_PolicyManager *)self handleWiFiAWDLChange];
            break;
        }
      }
    }
    else if ((uint64_t)a3 > 1299)
    {
      switch(a3)
      {
        case 0x514uLL:
          [(WCM_PolicyManager *)self handleWiFiBTULOFDMAChange];
          break;
        case 0x57CuLL:
          [(WCM_PolicyManager *)self handleWiFiRCU2Change];
          break;
        case 0x708uLL:
          [(WCM_PolicyManager *)self handleCCConnectionUpdate];
          break;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x3E8uLL:
          [(WCM_PolicyManager *)self handleWiFiBTCoexChange];
          break;
        case 0x44CuLL:
          [(WCM_PolicyManager *)self handleWiFiRCU1Change];
          break;
        case 0x4B0uLL:
          [(WCM_PolicyManager *)self handleMedtronicConnection];
          break;
      }
    }
  }
  else if ((uint64_t)a3 > 299)
  {
    if ((uint64_t)a3 > 505)
    {
      switch(a3)
      {
        case 0x1FAuLL:
          [(WCM_PolicyManager *)self handleBTPowerStateChange];
          break;
        case 0x202uLL:
          [(WCM_PolicyManager *)self handleBTScanConfigChange];
          break;
        case 0x206uLL:
          [(WCM_PolicyManager *)self handleBTLeDiscoveryScanStateChange];
          break;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x12CuLL:
          [(WCM_PolicyManager *)self handleCellularNetworkUpdate];
          break;
        case 0x1F4uLL:
          [(WCM_PolicyManager *)self handleBTConnectionChange];
          break;
        case 0x1F5uLL:
LABEL_15:
          [(WCM_PolicyManager *)self handleFTCall];
          break;
      }
    }
  }
  else
  {
    switch(a3)
    {
      case 'd':
        [(WCM_PolicyManager *)self handleWiFiConfigChange];
        break;
      case 'e':
      case 'f':
      case 'j':
      case 'k':
        return;
      case 'g':
        [(WCM_PolicyManager *)self handleWiFiPowerStateChange];
        break;
      case 'h':
        [(WCM_PolicyManager *)self handleRCU2ContentionChange];
        break;
      case 'i':
        [(WCM_PolicyManager *)self handleCallLQMStateChange];
        break;
      case 'l':
        [(WCM_PolicyManager *)self handleBTLeConn];
        break;
      default:
        if (a3 == 200) {
          goto LABEL_15;
        }
        break;
    }
  }
}

- (void)wRMCACoexSubmit_AntSelPolicyStates:(unsigned int)a3 IssueType:(unsigned int)a4 IsCoexBand:(BOOL)a5 HasAntConstraint:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  CFStringRef v11 = sub_100024500(a3);
  +[WCM_Logging logLevel:4, @"AntSelPolicyStates: issueBand %s, issueType %s, isCoexBand %d, hasAntConstraint %d", v11, sub_1000244DC(a4), v7, v6 message];
  v15[0] = @"IsCoexBand";
  v16[0] = +[NSNumber numberWithBool:v7];
  v15[1] = @"HasAntConstraint";
  v16[1] = +[NSNumber numberWithBool:v6];
  v15[2] = @"IssueBand";
  v16[2] = +[NSString stringWithUTF8String:sub_100024500(a3)];
  v15[3] = @"IssueType";
  v15[4] = @"count";
  v16[3] = +[NSString stringWithUTF8String:sub_1000244DC(a4)];
  v16[4] = &off_10023D020;
  [(WCM_PolicyManager *)self updateAntselPolicyStatsArray:+[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:5]];
  +[NSDate timeIntervalSinceReferenceDate];
  double v13 = v12;
  [(WCM_PolicyManager *)self previousStartTime];
  if (v13 - v14 > 300.0)
  {
    [(WCM_PolicyManager *)self submitWifiAntselPolicyStats];
    [(WCM_PolicyManager *)self setPreviousStartTime:v13];
  }
}

- (NSNumber)wifiRxPriThreshold
{
  return self->_wifiRxPriThreshold;
}

- (NSMutableArray)wifiEnhChannelsToEnableType7MSG
{
  return self->_wifiEnhChannelsToEnableType7MSG;
}

- (NSMutableArray)wifiChannelsToEnableWCI2WiFiEnh
{
  return self->_wifiChannelsToEnableWCI2WiFiEnh;
}

- (NSMutableArray)wifiChannelsToEnableWCI2Gand5G
{
  return self->_wifiChannelsToEnableWCI2Gand5G;
}

- (NSMutableArray)wifiChannelsToDisableOCLEnh
{
  return self->_wifiChannelsToDisableOCLEnh;
}

- (NSArray)wifiChannelsToBlocklist
{
  return self->_wifiChannelsToBlocklist;
}

- (NSMutableArray)wifi5GHzChannelsToEnableType7MSG
{
  return self->_wifi5GHzChannelsToEnableType7MSG;
}

- (NSMutableArray)wifi5GHzChannelsToEnableType7MSGCombined
{
  return self->_wifi5GHzChannelsToEnableType7MSGCombined;
}

- (BOOL)wcmGen9rFemLpmMode5g
{
  return self->_wcmGen9rFemLpmMode5g;
}

- (BOOL)wcmGen9rFemLpmMode2g
{
  return self->_wcmGen9rFemLpmMode2g;
}

- (unint64_t)wcmCellular_CC2_Tech
{
  return self->_wcmCellular_CC2_Tech;
}

- (unint64_t)wcmCellular_CC1_Tech
{
  return self->_wcmCellular_CC1_Tech;
}

- (BOOL)wcmCellularCCSetToBB
{
  return self->_wcmCellularCCSetToBB;
}

- (void)wRMCACoexSubmit_ULCACoexStates:(BOOL)a3 ULCAPrimaryCarrierULFreq:(unsigned int)a4 ULCAPrimaryCarrierDLFreq:(unsigned int)a5 ULCAPrimaryCarrierULBW:(unsigned int)a6 ULCAPrimaryCarrierDLBW:(unsigned int)a7 ULCACriticalCarrierULFreq:(unsigned int)a8 ULCACriticalCarrierDLFreq:(unsigned int)a9 ULCACriticalCarrierULBW:(unsigned int)a10 ULCACriticalCarrierDLBW:(unsigned int)a11
{
}

- (void)updateGPSRadioActiveState:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(WCM_PolicyManager *)self gpsRadioActive] != a3)
  {
    unint64_t v5 = "inactive";
    if (v3) {
      unint64_t v5 = "active";
    }
    +[WCM_Logging logLevel:1, @"GPS is %s now", v5 message];
    [(WCM_PolicyManager *)self setGpsRadioActive:v3];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000CD458;
    block[3] = &unk_10020D980;
    block[4] = self;
    dispatch_async([+[WCM_Server singleton](WCM_Server, "singleton") getQueue], block);
  }
}

- (void)updateCoexMonitorState:(int)a3
{
}

- (void)setWifiRxPriThreshold:(id)a3
{
}

- (void)setWifiEnhChannelsToEnableType7MSG:(id)a3
{
}

- (void)setWifiChannelsToEnableWCI2WiFiEnh:(id)a3
{
}

- (void)setWifiChannelsToEnableWCI2Gand5G:(id)a3
{
}

- (void)setWifiChannelsToEnableLTEMBType7:(id)a3
{
}

- (void)setWifiChannelsToDisableOCLEnh:(id)a3
{
}

- (void)setWifiChannelsToBlocklist:(id)a3
{
}

- (void)setWifiAgcCoexModeLevel:(id)a3
{
}

- (void)setWifi5GHzChannelsToEnableType7MSG:(id)a3
{
}

- (void)setWifi2GHzLTEB7IMD3ChannelsEnableType7:(id)a3
{
}

- (void)setWcmGen9rFemLpmMode5g:(BOOL)a3
{
  self->_wcmGen9rFemLpmMode5g = a3;
}

- (void)setWcmGen9rFemLpmMode2g:(BOOL)a3
{
  self->_wcmGen9rFemLpmMode2g = a3;
}

- (void)setWcmCellular_CC2_Tech:(unint64_t)a3
{
  self->_wcmCellular_CC2_Tech = a3;
}

- (void)setWcmCellular_CC1_Tech:(unint64_t)a3
{
  self->_wcmCellular_CC1_Tech = a3;
}

- (void)setWcmCellularWCI2Mode_CC2:(unint64_t)a3
{
  self->_wcmCellularWCI2Mode_CC2 = a3;
}

- (void)setType7WiFiEnhCellAntBlkIdx:(unsigned __int16)a3
{
  self->_type7WiFiEnhCellAntBlkIdx = a3;
}

- (void)setType7CellAntBlkIdx:(unsigned __int16)a3
{
  self->_type7CellAntBlkIdx = a3;
}

- (void)setIsInHpSession:(BOOL)a3
{
  self->_isInHpSession = a3;
}

- (void)setHFBTAntBlkEnableBands:(id)a3
{
}

- (void)setCellularWCI2CoexPolicyBitmap:(unint64_t)a3
{
  self->_cellularWCI2CoexPolicyBitmap = a3;
}

- (void)setBtPreferredRole:(int)a3
{
  self->_btPreferredRole = a3;
}

- (void)setBtPreferredChannelMapOnGpsRadioActive:(id)a3
{
}

- (void)setBtPreferredChannelMapHPCellularActive:(id)a3
{
}

- (void)setBtPreferredChannelMap:(id)a3
{
}

- (void)setBtPreferred5GChannelMap:(id)a3
{
}

- (void)setBtAgcCoexModeEnable:(id)a3
{
}

- (void)sendNRFrequencyBandUpdateForMic:(double)a3 dlHighFreq:(double)a4 ulLowFreq:(double)a5 ulHighFreq:(double)a6
{
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"COEX_MIC_RF_SUPPORT"))
  {
    BOOL v11 = a3 < 3300.0 || a4 > 4200.0;
    BOOL v15 = 1;
    if (v11 && (a5 < 3300.0 || a6 > 4200.0) && (a3 < 4400.0 || a4 > 5000.0) && (a5 < 4400.0 || a6 > 5000.0)) {
      BOOL v15 = 0;
    }
    BOOL v16 = a3 < 2496.0 || a4 > 2690.0;
    BOOL v18 = 1;
    if (v16 && (a5 < 2496.0 || a6 > 2690.0)) {
      BOOL v18 = 0;
    }
    if (v15 != [(WCM_PolicyManager *)self prevNR7xRFEnabled]
      || v18 != [(WCM_PolicyManager *)self prevNR41RFEnabled])
    {
      [+[WCM_UCMClientManager WCM_UCMClientManagerSingleton](WCM_UCMClientManager, "WCM_UCMClientManagerSingleton") sendNRFrequencyUpdateForMic:v18 NR7xenabled:v15];
      [(WCM_PolicyManager *)self setPrevNR7xRFEnabled:v15];
      [(WCM_PolicyManager *)self setPrevNR41RFEnabled:v18];
    }
  }
}

- (double)previousStartTime
{
  return self->_previousStartTime;
}

- (NSObject)lockObjectWifiAntselPolicyStats
{
  return self->_lockObjectWifiAntselPolicyStats;
}

- (WCM_HPCellularStateMonitor)hpCellularMonitor
{
  return self->_hpCellularMonitor;
}

- (BOOL)gpsRadioActive
{
  return self->_gpsRadioActive;
}

- (WCM_FTController)ftController
{
  return self->_ftController;
}

- (unsigned)dynamicCellAntBlkEnableIdx2
{
  return self->_dynamicCellAntBlkEnableIdx2;
}

- (unsigned)dynamicCellAntBlkEnableIdx1
{
  return self->_dynamicCellAntBlkEnableIdx1;
}

- (unsigned)dynamicAntBlkingBand
{
  return self->_dynamicAntBlkingBand;
}

- (char)dataLqmState
{
  return self->_dataLqmState;
}

- (BOOL)coexSupported
{
  return self->_coexSupported;
}

- (unint64_t)cellularWCI2CoexPolicyBitmap
{
  return self->_cellularWCI2CoexPolicyBitmap;
}

- (BOOL)callActiveState
{
  return self->_callActiveState;
}

- (NSData)btPreferredChannelMap
{
  return self->_btPreferredChannelMap;
}

- (NSData)btPreferredChannelMapHPCellularActive
{
  return self->_btPreferredChannelMapHPCellularActive;
}

- (NSData)btPreferred5GChannelMap
{
  return self->_btPreferred5GChannelMap;
}

- (unint64_t)btAntBlockDuration
{
  return self->_btAntBlockDuration;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  id v3 = [a1 singleton:a3];

  return v3;
}

- (WCM_PolicyManager)init
{
  v44.receiver = self;
  v44.super_class = (Class)WCM_PolicyManager;
  v2 = [(WCM_PolicyManager *)&v44 init];
  if (!v2)
  {
LABEL_36:
    [v2 setWifiAntselPolicyStatsArray:objc_alloc_init((Class)NSMutableArray)];
    +[NSDate timeIntervalSinceReferenceDate];
    [v2 setPreviousStartTime:];
    [v2 setLockObjectWifiAntselPolicyStats:objc_alloc_init((Class)NSObject)];
    [v2 setPrevNR7xRFEnabled:0];
    [v2 setPrevNR41RFEnabled:0];
    [v2 setPrevULFrequencyUpdate:objc_alloc_init((Class)NSMutableDictionary)];
    return (WCM_PolicyManager *)v2;
  }
  *((void *)v2 + 9) = objc_alloc_init(WCM_PlatformManager);
  *((void *)v2 + 22) = +[WCM_BSPMonitor create];
  *((void *)v2 + 11) = objc_alloc_init(WCM_HPCellularStateMonitor);
  id v3 = (void *)*((void *)v2 + 9);
  if (v3 && *((void *)v2 + 22))
  {
    v2[9] = [v3 coexSupported];
    v2[10] = [*((id *)v2 + 9) iRATSupported];
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, @"WCM_PolicyManager: platformId %d coexSupported %d iRATSupported %d", [*((id *)v2 + 9) wrmPlatformId], v2[9], v2[10]);
    v2[8] = 0;
    unint64_t v4 = +[NSSet setWithSet:](NSSet, "setWithSet:", [*((id *)v2 + 9) wcmCoexFeatures]);
    *((void *)v2 + 25) = v4;
    if ([(NSSet *)v4 containsObject:@"WCI2Mode"]) {
      id v5 = [[objc_msgSend(*((id *)v2 + 9), "wcmCellularWCI2ModePolicy") unsignedLongValue];
    }
    else {
      id v5 = 0;
    }
    *((void *)v2 + 26) = v5;
    unsigned int v6 = [*((id *)v2 + 25) containsObject:@"BTDiversityAFHMap"];
    id v7 = [*((id *)v2 + 9) wcmBTAFHMapDefault];
    if (v6)
    {
      *((void *)v2 + 32) = v7;
      *((void *)v2 + 33) = [*((id *)v2 + 9) wcmBTAFHMapDefault];
      *((void *)v2 + 34) = [*((id *)v2 + 9) wcmBTAFHMapDefault];
      *((void *)v2 + 35) = [*((id *)v2 + 9) wcmBTAFHMapDefault];
      *((void *)v2 + 36) = [*((id *)v2 + 9) wcmBTAFHMapDefault];
      *((void *)v2 + 37) = [*((id *)v2 + 9) wcmBTAFHMapDefault];
      *((void *)v2 + 38) = [*((id *)v2 + 9) wcmBTAFHMapDefault];
      id v8 = [*((id *)v2 + 9) wcmBTAFHMapDefault];
      uint64_t v9 = 312;
    }
    else
    {
      *((void *)v2 + 27) = v7;
      *((void *)v2 + 28) = [*((id *)v2 + 9) wcmBTAFHMapDefault];
      id v8 = [*((id *)v2 + 9) wcmHPCellularBTAFHMapFixed];
      uint64_t v9 = 232;
    }
    *(void *)&v2[v9] = v8;
    if (_os_feature_enabled_impl()
      && objc_msgSend(objc_msgSend(v2, "activeCoexFeatures"), "containsObject:", @"HFBTCoex"))
    {
      *((void *)v2 + 30) = [*((id *)v2 + 9) wcmHFBTChannelMapDefault];
      *((void *)v2 + 40) = [(int)[objc_msgSend(*((id *)v2 + 9), "wcmBTAntBlockDuration") intValue]];
      *((void *)v2 + 31) = [*((id *)v2 + 9) wcmBTAntBlockEnableBandsDefault];
    }
    if (![*((id *)v2 + 25) containsObject:@"MedtronicSupport"]
      || (id v10 = +[WCM_ExternalAccessory create],
          (*((void *)v2 + 21) = v10) != 0))
    {
      *((_DWORD *)v2 + 10) = [[objc_msgSend(*((id *)v2 + 9), "wcmBTPreferredRole") intValue];
      *((void *)v2 + 41) = &off_10024E218;
      *((void *)v2 + 42) = &off_10024E230;
      BOOL v11 = +[NSMutableArray arrayWithArray:&off_10024E248];
      *((void *)v2 + 43) = v11;
      double v12 = v11;
      double v13 = +[NSMutableArray arrayWithArray:&off_10024E260];
      *((void *)v2 + 44) = v13;
      double v14 = v13;
      BOOL v15 = +[NSMutableArray arrayWithArray:&off_10024E278];
      *((void *)v2 + 45) = v15;
      BOOL v16 = v15;
      uint64_t v17 = +[NSMutableArray arrayWithArray:&off_10024E290];
      *((void *)v2 + 46) = v17;
      BOOL v18 = v17;
      unsigned int v19 = +[NSMutableArray arrayWithArray:&off_10024E2A8];
      *((void *)v2 + 48) = v19;
      unsigned int v20 = v19;
      uint64_t v21 = +[NSMutableArray arrayWithArray:&off_10024E2C0];
      *((void *)v2 + 49) = v21;
      double v22 = v21;
      BOOL v23 = +[NSMutableArray arrayWithArray:&off_10024E2D8];
      *((void *)v2 + 50) = v23;
      BOOL v24 = v23;
      int64_t v25 = +[NSMutableArray arrayWithArray:&off_10024E2F0];
      *((void *)v2 + 47) = v25;
      uint64_t v26 = v25;
      *((void *)v2 + 61) = objc_alloc_init((Class)NSMutableArray);
      *((void *)v2 + 53) = &off_10024E308;
      uint64_t v27 = +[NSMutableArray arrayWithArray:&off_10024E320];
      *((void *)v2 + 54) = v27;
      unint64_t v28 = v27;
      unint64_t v29 = +[NSMutableArray arrayWithArray:&off_10024E338];
      *((void *)v2 + 55) = v29;
      uint64_t v30 = v29;
      unint64_t v31 = +[NSMutableArray arrayWithArray:&off_10024E350];
      *((void *)v2 + 51) = v31;
      unint64_t v32 = v31;
      unint64_t v33 = +[NSMutableArray arrayWithArray:&off_10024E368];
      *((void *)v2 + 52) = v33;
      int v34 = v33;
      *((void *)v2 + 56) = &off_10023CCA8;
      *((void *)v2 + 63) = &off_10023CCA8;
      *((void *)v2 + 64) = &off_10023CCA8;
      *((_WORD *)v2 + 16) = 0;
      *((void *)v2 + 65) = 0;
      *((void *)v2 + 7) = 0;
      *(_WORD *)(v2 + 13) = 25600;
      v2[16] = 0;
      *((_WORD *)v2 + 10) = 0;
      *((void *)v2 + 24) = 0;
      *((_WORD *)v2 + 12) = 0;
      *((_DWORD *)v2 + 11) = 0;
      v2[26] = 0;
      *((_DWORD *)v2 + 13) = 0;
      unsigned int v35 = [*((id *)v2 + 25) containsObject:@"CellularRC1PolicyManager"];
      id v36 = [*((id *)v2 + 9) wrmPlatformId];
      if (v35)
      {
        +[WCM_Logging logLevel:2, @"Initialize WCM_CellularRc1PolicyManager on PlatformId(%d)...", v36 message];
        int v37 = objc_alloc_init(WCM_CellularRc1PolicyManager);
        *((void *)v2 + 8) = v37;
        [(WCM_CellularRc1PolicyManager *)v37 setPlatformManager:*((void *)v2 + 9)];
      }
      else
      {
        +[WCM_Logging logLevel:2, @"WCM_CellularRc1PolicyManager not created on PlatformId(%d)...feature not enabled", v36 message];
        *((void *)v2 + 8) = 0;
      }
      if ([*((id *)v2 + 25) containsObject:@"UseWCMAriDriver"])
      {
        id v38 = +[WCM_AriCoexCommandDriver singleton];
        if (v38)
        {
          uint64_t v39 = v38;
          [v2 updateControllerSession:objc_opt_new() ofId:3];
          [v39 setCellularController:*((void *)v2 + 10)];
        }
      }
      else
      {
        +[WCM_Logging logLevel:2 message:@"USE_WCM_ARI_DRIVER feature not enabled.  _ariDriver=nil"];
      }
      if ([*((id *)v2 + 25) containsObject:@"MavAntPolicyFramework"])
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, @"Initialize WCM_MavAntennaPolicy on PlatformId(%d)...", [*((id *)v2 + 9) wrmPlatformId]);
        unsigned int v40 = objc_alloc_init(WCM_MavAntennaPolicy);
        *((void *)v2 + 24) = v40;
        if (v40)
        {
          +[WCM_Logging logLevel:2 message:@"Created WCM_MavAntennaPolicy instance successfully"];
          [*((id *)v2 + 24) applyMavAntennaPolicyForPlatformId:[*((id *)v2 + 9) wrmPlatformId] sku:[*((id *)v2 + 9) wrmSku]];
        }
        else
        {
          +[WCM_Logging logLevel:0 message:@"Failed to create WCM_MavAntennaPolicy instance"];
        }
      }
      if (([*((id *)v2 + 25) containsObject:@"IOKitCameraStateEvent"] & 1) != 0
        || [*((id *)v2 + 25) containsObject:@"AccessoryStateEvent"])
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, @"Initialize WCM_IOKitWrapper on PlatformId(%d)...", [*((id *)v2 + 9) wrmPlatformId]);
        id v41 = -[WCM_IOKitWrapper initWithPlatformId:]([WCM_IOKitWrapper alloc], "initWithPlatformId:", [*((id *)v2 + 9) wrmPlatformId]);
        *((void *)v2 + 66) = v41;
        [(WCM_IOKitWrapper *)v41 registerIOkitStateEvent];
      }
      else
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, @"WCM_IOKitWrapper not created on PlatformId(%d)...feature not enabled", [*((id *)v2 + 9) wrmPlatformId]);
        *((void *)v2 + 66) = 0;
      }
      *((void *)v2 + 23) = 0;
      if ([*((id *)v2 + 25) containsObject:@"SacPolicySupport"])
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, @"SAC Initialize WCM_SacManager on PlatformId(%d)...", [*((id *)v2 + 9) wrmPlatformId]);
        *((void *)v2 + 23) = -[WCM_SacManager initWithPlatformId:]([WCM_SacManager alloc], "initWithPlatformId:", [*((id *)v2 + 9) wrmPlatformId]);
      }
      else
      {
        +[WCM_Logging logLevel:2 message:@"SAC feature not enabled. _sacManager=nil"];
      }
      unsigned int v42 = [v2 fetchWRMdebugPlistForceRTG];
      v2[29] = v42;
      if (v42) {
        +[WCM_Logging logLevel:2 message:@"Forcing AWDL RTG Active with defaults write"];
      }
      goto LABEL_36;
    }
  }

  return 0;
}

- (void)dealloc
{
  if ([(WCM_PolicyManager *)self sacManager]) {
  if ([(WCM_PolicyManager *)self mavAntPolicy])
  }

  [(WCM_PolicyManager *)self stopHomeKitTimer];
  v3.receiver = self;
  v3.super_class = (Class)WCM_PolicyManager;
  [(WCM_PolicyManager *)&v3 dealloc];
}

- (void)audioRouteChanged
{
  if ([(WCM_PolicyManager *)self audioBuiltInReceiver])
  {
    +[WCM_Logging logLevel:2, @"audioBuiltInReceiver is %s now", "false" message];
    [(WCM_PolicyManager *)self setAudioBuiltInReceiver:0];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000CD1F8;
    block[3] = &unk_10020D980;
    block[4] = self;
    dispatch_async([+[WCM_Server singleton](WCM_Server, "singleton") getQueue], block);
  }
  else
  {
    +[WCM_Logging logLevel:2, @"audioBuiltInReceiver is already %s", "false" message];
  }
}

- (BOOL)fetchWRMdebugPlistForceRTG
{
  CFDictionaryRef v2 = (const __CFDictionary *)CFPreferencesCopyAppValue(@"CoexDebug", @"com.apple.WirelessRadioManager.debug");
  if (v2)
  {
    CFDictionaryRef v3 = v2;
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(v3))
    {
      value = 0;
      if (CFDictionaryGetValueIfPresent(v3, @"ForceRTGActive", (const void **)&value))
      {
        CFComparisonResult v5 = CFStringCompare(@"TRUE", (CFStringRef)value, 0);
        unsigned int v6 = "FALSE";
        BOOL v7 = v5 == kCFCompareEqualTo;
        if (v5 == kCFCompareEqualTo) {
          unsigned int v6 = "TRUE";
        }
        +[WCM_Logging logLevel:3, @"In fetchWRMdebugPlistForceRTG: Reading value %s", v6 message];
        goto LABEL_11;
      }
      CFStringRef v8 = @"In fetchWRMdebugPlistForceRTG: Reading value FAILED";
    }
    else
    {
      CFStringRef v8 = @"In fetchWRMdebugPlistForceTDD: dict does not exist";
    }
    +[WCM_Logging logLevel:3 message:v8];
    BOOL v7 = 0;
LABEL_11:
    CFRelease(v3);
    return v7;
  }
  +[WCM_Logging logLevel:3 message:@"In fetchWRMdebugPlistForceTDD: dict does not exist"];
  return 0;
}

- (void)updateClamshellState:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(WCM_PolicyManager *)self clamshellState] != a3)
  {
    CFComparisonResult v5 = "off";
    if (v3) {
      CFComparisonResult v5 = "on";
    }
    +[WCM_Logging logLevel:2, @"ClamshellState is %s now", v5 message];
    [(WCM_PolicyManager *)self setClamshellState:v3];
    id v6 = +[WCM_PolicyManager singleton];
    [v6 updateControllerState:1000];
  }
}

- (void)updateGPSBandsInfo:(id)a3 CLUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, @"updateGPSBandsInfo - counts %d %d", [a3 count], -[NSMutableArray count](-[WCM_PolicyManager gpsBandInfoList](self, "gpsBandInfoList"), "count"));
  if (v4)
  {
    BOOL v7 = [+[NSSet setWithArray:](NSSet, "setWithArray:", a3) isEqualToSet:+[NSSet setWithArray:[(WCM_PolicyManager *)self gpsBandInfoList]]];
    if (!v7)
    {
      [(NSMutableArray *)[(WCM_PolicyManager *)self gpsBandInfoList] removeAllObjects];
      [(WCM_PolicyManager *)self setGpsBandInfoList:a3];
    }
    unsigned int v8 = !v7;
  }
  else
  {
    BOOL v7 = 0;
    unsigned int v8 = 1;
  }
  +[WCM_Logging logLevel:3, @"updateGPSBandsInfo-2 CLUpdate %d updateDriver %d %d", v4, v8, v7 message];
  unsigned int v9 = [(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"CTSacDriverNeedGpsFreq"];
  int v10 = v8 ^ 1;
  if (((v8 ^ 1) & 1) == 0)
  {
    if (v9)
    {
      [(WCM_PolicyManager *)self updateCTSacDriverRemoveAllFrequenciesFromClient:2];
      if ([(NSMutableArray *)[(WCM_PolicyManager *)self gpsBandInfoList] count])
      {
        id v11 = objc_alloc_init((Class)NSMutableArray);
        id v12 = objc_alloc_init((Class)NSMutableArray);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        double v13 = [(WCM_PolicyManager *)self gpsBandInfoList];
        id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v25;
          do
          {
            uint64_t v17 = 0;
            do
            {
              if (*(void *)v25 != v16) {
                objc_enumerationMutation(v13);
              }
              BOOL v18 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v17);
              long long v22 = 0u;
              long long v23 = 0u;
              [v18 getValue:&v22];
              [v11 addObject:[NSNumber numberWithDouble:*((double *)&v22 + 1)]];
              [v12 addObject:[NSNumber numberWithDouble:v23]];
              uint64_t v17 = (char *)v17 + 1;
            }
            while (v15 != v17);
            id v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
          }
          while (v15);
        }
        if ([v11 count]) {
          [(WCM_PolicyManager *)self updateCTSacDriver:1 frequencyToAdd:v11 frequencyToAddBw:v12 frequencytoRemove:0 client:2];
        }
        [v11 removeAllObjects];
        [v12 removeAllObjects];
      }
    }
  }
  if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"SacPolicySupport"]&& (([(WCM_SacManager *)self->_sacManager isTestMode] | v10) & 1) == 0)
  {
    id v19 = [(NSMutableArray *)[(WCM_PolicyManager *)self gpsBandInfoList] copy];
    unsigned int v20 = [(WCM_SacManager *)self->_sacManager getQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000CD99C;
    block[3] = &unk_10020DAB0;
    block[4] = self;
    void block[5] = v19;
    dispatch_async(v20, block);
  }
  if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"AntennaTuningForGpsBB20"])
  {
    if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"EnhancedCoreLocationGnssBandUse"])
    {
      [(WCM_PolicyManager *)self updateGpsbandsInfoForBBv2];
    }
    else
    {
      [(WCM_PolicyManager *)self updateGpsbandsInfoForBB];
    }
  }
}

- (void)updateOnOperatorBundleChanged
{
  +[WCM_Logging logLevel:1, @"Operator Bundle Changed : Prev = %d", self->mWCI2DisabledForOperator message];
  if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WCI2Mode"])
  {
    CFBooleanRef v3 = (const __CFBoolean *)CFPreferencesCopyAppValue(@"DisableCoex", @"com.apple.operator");
    if (v3)
    {
      CFBooleanRef v4 = v3;
      CFTypeID v5 = CFGetTypeID(v3);
      BOOL v6 = v5 == CFBooleanGetTypeID() && CFBooleanGetValue(v4) != 0;
      CFRelease(v4);
      if (self->mWCI2DisabledForOperator == v6) {
        return;
      }
      self->mWCI2DisabledForOperator = v6;
      if (v6)
      {
        +[WCM_Logging logLevel:1 message:@"Disabling WCI2"];
        [(WCM_PolicyManager *)self configureAllWCI2:0];
        [(WCM_PolicyManager *)self setCellularWCI2CoexPolicyBitmap:0];
        return;
      }
    }
    else
    {
      +[WCM_Logging logLevel:0, @"%@ not found in %@", @"DisableCoex", @"com.apple.operator" message];
      if (!self->mWCI2DisabledForOperator) {
        return;
      }
      self->mWCI2DisabledForOperator = 0;
    }
    +[WCM_Logging logLevel:1 message:@"Enabling WCI2"];
    [(WCM_PolicyManager *)self setCellularWCI2CoexPolicyBitmap:[(NSNumber *)[(WCM_PlatformManager *)[(WCM_PolicyManager *)self platformManager] wcmCellularWCI2ModePolicy] unsignedLongValue]];
    [(WCM_PolicyManager *)self handleCellularNetworkUpdate];
  }
  else
  {
    +[WCM_Logging logLevel:2 message:@"WCI2 is disabled already"];
  }
}

- (BOOL)isCellularOnGPSIMDBand
{
  CFDictionaryRef v2 = [(WCM_PolicyManager *)self cellularController];
  [(WCM_CellularController *)v2 cachedULCenterFreq];
  BOOL result = 0;
  if (v3 != 0.0)
  {
    [(WCM_CellularController *)v2 cachedULCenterFreq];
    if (v4 >= 800.0)
    {
      [(WCM_CellularController *)v2 cachedULCenterFreq];
      if (v5 <= 915.0) {
        return 1;
      }
    }
  }
  return result;
}

- (BOOL)isCellularOnWiFi3FoBand
{
  CFDictionaryRef v2 = [(WCM_PolicyManager *)self cellularController];
  [(WCM_CellularController *)v2 cachedULCenterFreq];
  BOOL result = 0;
  if (v3 != 0.0)
  {
    [(WCM_CellularController *)v2 cachedULCenterFreq];
    if (v4 >= 806.0)
    {
      [(WCM_CellularController *)v2 cachedULCenterFreq];
      if (v5 <= 901.0) {
        return 1;
      }
    }
  }
  return result;
}

- (BOOL)isCellularOnIMD3CellBand
{
  CFDictionaryRef v2 = [(WCM_PolicyManager *)self cellularController];
  [(WCM_CellularController *)v2 cachedULCenterFreq];
  BOOL result = 0;
  if (v3 != 0.0 && ![(WCM_CellularController *)v2 tddBand])
  {
    [(WCM_CellularController *)v2 cachedULCenterFreq];
    if (v4 >= 2500.0)
    {
      [(WCM_CellularController *)v2 cachedULCenterFreq];
      if (v5 >= 2570.0) {
        return 1;
      }
    }
  }
  return result;
}

- (id)getControllerOfId:(int)a3
{
  switch(a3)
  {
    case 29:
      id result = [(WCM_PolicyManager *)self rcu1Controller];
      break;
    case 30:
      id result = [(WCM_PolicyManager *)self rcu2Controller];
      break;
    case 31:
      id result = [(WCM_PolicyManager *)self airplayController];
      break;
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
LABEL_5:
      id result = 0;
      break;
    case 38:
      id result = [(WCM_PolicyManager *)self p2pAwdlController];
      break;
    case 39:
      id result = [(WCM_PolicyManager *)self p2pNanController];
      break;
    default:
      switch(a3)
      {
        case 1:
          id result = [(WCM_PolicyManager *)self wifiController];
          break;
        case 2:
          id result = [(WCM_PolicyManager *)self ftController];
          break;
        case 3:
          id result = [(WCM_PolicyManager *)self cellularController];
          break;
        case 4:
          id result = [(WCM_PolicyManager *)self btController];
          break;
        default:
          goto LABEL_5;
      }
      break;
  }
  return result;
}

- (void)updateControllerSession:(id)a3 ofId:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  +[WCM_Logging logLevel:2, @"Policy Manager update processId=%d with Controller = %p", *(void *)&a4, a3 message];
  switch((int)v4)
  {
    case 29:
      [(WCM_PolicyManager *)self setRcu1Controller:a3];
      break;
    case 30:
      [(WCM_PolicyManager *)self setRcu2Controller:a3];
      break;
    case 31:
      [(WCM_PolicyManager *)self setAirplayController:a3];
      break;
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
      break;
    case 38:
      [(WCM_PolicyManager *)self setP2pAwdlController:a3];
      break;
    case 39:
      [(WCM_PolicyManager *)self setP2pNanController:a3];
      break;
    default:
      switch((int)v4)
      {
        case 1:
          if ([(WCM_PolicyManager *)self wifiController])
          {

            [(WCM_PolicyManager *)self setWifiController:0];
          }
          if (a3) {
            [(WCM_PolicyManager *)self setWifiController:a3];
          }
          break;
        case 2:
          [(WCM_PolicyManager *)self setFtController:a3];
          break;
        case 3:
          [(WCM_PolicyManager *)self setCellularController:a3];
          break;
        case 4:
          [(WCM_PolicyManager *)self setBtController:a3];
          break;
        default:
          goto LABEL_15;
      }
      break;
  }
LABEL_15:
  cellularRc1PolicyManager = self->_cellularRc1PolicyManager;
  if (cellularRc1PolicyManager) {
    [(WCM_CellularRc1PolicyManager *)cellularRc1PolicyManager updateControllerSession:a3 ofId:v4];
  }
  else {
    +[WCM_Logging logLevel:2, @"RC1 Policy Manager failed to update processId=%d with Controller = %p due to nil object", v4, a3 message];
  }
  [(WCM_PolicyManager *)self handleControllerAvailability:v4];
  uint64_t v8 = [(WCM_PolicyManager *)self cellularCoexBand];

  [(WCM_PolicyManager *)self updateCoexMonitorState:v8];
}

- (void)handleErrorReport:(int)a3
{
}

- (void)handleControllerAvailability:(unint64_t)a3
{
  if (a3 < 0x2A && ((0x3EEEFFFFFFFuLL >> a3) & 1) != 0)
  {
    double v5 = off_100211528[a3];
  }
  else
  {
    double v5 = "INVALID_PROC_ID!!!";
    if (a3 == 42) {
      double v5 = "WRMSOS";
    }
  }
  +[WCM_Logging logLevel:2, @"Handle controller availability for %s", v5 message];
  if (![(WCM_PolicyManager *)self cellularController]) {
    [(WCM_PolicyManager *)self configureAllWCI2:0];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CE30C;
  block[3] = &unk_10020DB90;
  block[4] = self;
  void block[5] = a3;
  dispatch_async([+[WCM_Server singleton](WCM_Server, "singleton") getQueue], block);
  if (a3 == 2) {
    [(WCM_FTController *)[(WCM_PolicyManager *)self ftController] getFaceTimeCallConfig];
  }
}

- (void)initControllerPolicy:(int)a3
{
  if (a3 == 4)
  {
    +[WCM_Logging logLevel:2 message:@"BT Crashed or init - resending WiFi states"];
    [(WCM_PolicyManager *)self handleWiFiBTCatsChange:0];
    if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"WiFiFigaroCoex"))
    {
      [(WCM_BTController *)[(WCM_PolicyManager *)self btController] update5GHzHostAP:[(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] hostAP5GHzActive]];
      if ([WCM_PolicyManager singleton].activeCoexFeatures.containsObject(@"RCU1Support"))[-[WCM_BTController updateUWB5GHzActive:](-[WCM_PolicyManager btController](self, "btController"), "updateUWB5GHzActive:", -[WCM_R1Controller mRCU15GHzInUse](-[WCM_PolicyManager rcu1Controller](self, "rcu1Controller"), "mRCU15GHzInUse"));
      if (_os_feature_enabled_impl())
      }
      {
        BOOL forceRealTimeAWDL = self->_forceRealTimeAWDL;
        double v5 = [(WCM_PolicyManager *)self btController];
        BOOL v6 = forceRealTimeAWDL
          || [(WCM_P2PAWDLController *)[(WCM_PolicyManager *)self p2pAwdlController] mRealTimeAwdlTrafficEnabled];
        [(WCM_BTController *)v5 updateAWDLRTGActive:v6];
        [(WCM_BTController *)[(WCM_PolicyManager *)self btController] updateWiFiChannelInfo:[(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiChannel] bandwidth:[(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] channelBandwidthMHz] regBand:[(WCM_PolicyManager *)self parseCenterFreqtoUNIIBand:[(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] channelCenterFreqMHz]]];
        [(WCM_BTController *)[(WCM_PolicyManager *)self btController] updateLowWiFi5GRates:0];
        [(WCM_PolicyManager *)self handleLow5GRate:0];
      }
      else
      {
        [(WCM_BTController *)[(WCM_PolicyManager *)self btController] updateNANActive:[(WCM_P2PNANController *)[(WCM_PolicyManager *)self p2pNanController] mNanEnabled]];
        BOOL v7 = [(WCM_PolicyManager *)self btController];
        BOOL v8 = [(WCM_P2PAWDLController *)[(WCM_PolicyManager *)self p2pAwdlController] mAwdlEnabled];
        [(WCM_BTController *)v7 updateAWDLActive:v8];
      }
    }
  }
}

- (void)combineWifiChannelList:(id)a3 withChannelList:(id)a4
{
  if (a3)
  {
    if (a4)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v6 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v12;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v12 != v8) {
              objc_enumerationMutation(a4);
            }
            uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * i);
            if (([a3 containsObject:v10] & 1) == 0) {
              [a3 addObject:v10];
            }
          }
          id v7 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v7);
      }
    }
  }
}

- (void)updateWifiOCLChannelList
{
  double v3 = [(WCM_PolicyManager *)self wifiController];
  uint64_t v4 = [(WCM_PolicyManager *)self cellularController];
  double v5 = [(WCM_PolicyManager *)self platformManager];
  +[WCM_PolicyManager singleton];
  id v6 = [(WCM_CellularController *)v4 getActiveULCAConfig];
  id v7 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", &off_10023CCC0, &off_10023CCD8, &off_10023CCF0, &off_10023CD08, &off_10023CD20, &off_10023CD38, &off_10023CD50, 0);
  id v8 = (id)[(WCM_CellularController *)v4 bandInfoType];
  [(WCM_CellularController *)v4 dlCenterFreq];
  double v10 = v9;
  [(WCM_CellularController *)v4 dlBandwidth];
  double v12 = v11;
  [(WCM_CellularController *)v4 dlCenterFreq];
  double v14 = v13;
  [(WCM_CellularController *)v4 dlBandwidth];
  double v16 = v15;
  [(WCM_CellularController *)v4 ulCenterFreq];
  double v18 = v17;
  [(WCM_CellularController *)v4 ulBandwidth];
  double v20 = v19;
  [(WCM_CellularController *)v4 ulCenterFreq];
  double v22 = v21;
  [(WCM_CellularController *)v4 ulBandwidth];
  double v24 = v23;
  id v25 = objc_alloc_init((Class)NSMutableArray);
  id v26 = objc_alloc_init((Class)NSMutableArray);
  long long v27 = WRM_MotionController;
  id v52 = objc_alloc_init((Class)NSMutableArray);
  if (v6)
  {
    +[WCM_Logging logLevel:2, @"update WiFi OCL channel list: total valid cellular carrier = %d", v6->var1 message];
    if (v6->var1)
    {
      id v51 = v3;
      id v28 = v25;
      unint64_t v29 = 0;
      p_double var2 = &v6->var0[0].var2;
      do
      {
        double v31 = p_var2[1] * 0.5;
        double v32 = *p_var2 - v31;
        double v33 = *p_var2 + v31;
        double v34 = *(p_var2 - 2);
        double v35 = *(p_var2 - 1) * 0.5;
        double v36 = v34 - v35;
        double v37 = v34 + v35;
        +[WCM_Logging logLevel:4, @"OCLDisable_WiFiEnh: carrier[%d], ulLowFrq = %fMHz, ulHighFreq = %fMHz", v29, v34 - v35, v34 + v35 message];
        unsigned int v38 = [(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiEnhCoexSupport"];
        uint64_t v39 = [(WCM_PlatformManager *)v5 wcmWiFiCellCoexIssueTable];
        if (v38)
        {
          id v40 = [(WCM_WiFiCellCoexIssueBandTable *)v39 wifiChannelsToDisableOCLWiFiEnhForCellBandInfoType:v8 cellDlLowFreq:v32 cellDlHighFreq:v33 cellUlLowFreq:v36 cellUlHighFreq:v37];
          +[WCM_Logging logLevel:4, @"OCLDisable_WiFiEnh: wifiChannelEnhDict = %@", v40 message];
          -[WCM_PolicyManager combineWifiChannelList:withChannelList:](self, "combineWifiChannelList:withChannelList:", v28, [v40 objectForKey:@"wifiChannels2Gand5G"]);
          id v41 = [v40 objectForKey:@"wifiChannelsEnh"];
          unsigned int v42 = self;
          id v43 = v26;
        }
        else
        {
          id v41 = [(WCM_WiFiCellCoexIssueBandTable *)v39 wifiChannelsToDisableOCLForCellBandInfoType:v8 cellDlLowFreq:v32 cellDlHighFreq:v33 cellUlLowFreq:v36 cellUlHighFreq:v37];
          unsigned int v42 = self;
          id v43 = v52;
        }
        [(WCM_PolicyManager *)v42 combineWifiChannelList:v43 withChannelList:v41];
        ++v29;
        p_var2 += 9;
      }
      while (v29 < v6->var1);
      double v3 = v51;
      id v25 = v28;
      long long v27 = WRM_MotionController;
    }
  }
  else
  {
    unsigned int v44 = [(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiEnhCoexSupport"];
    unint64_t v45 = [(WCM_PlatformManager *)v5 wcmWiFiCellCoexIssueTable];
    double v46 = v10 - v12 * 0.5;
    double v47 = v14 + v16 * 0.5;
    double v48 = v18 - v20 * 0.5;
    double v49 = v22 + v24 * 0.5;
    if (v44)
    {
      id v50 = [(WCM_WiFiCellCoexIssueBandTable *)v45 wifiChannelsToDisableOCLWiFiEnhForCellBandInfoType:v8 cellDlLowFreq:v46 cellDlHighFreq:v47 cellUlLowFreq:v48 cellUlHighFreq:v49];
      +[WCM_Logging logLevel:4, @"OCLDisable_WiFiEnh: wifiChannelEnhDict = %@", v50 message];
      id v25 = [v50 objectForKey:@"wifiChannels2Gand5G"];
      id v26 = [v50 objectForKey:@"wifiChannelsEnh"];
    }
    else
    {
      [(WCM_PolicyManager *)self combineWifiChannelList:v52 withChannelList:[(WCM_WiFiCellCoexIssueBandTable *)v45 wifiChannelsToDisableOCLForCellBandInfoType:v8 cellDlLowFreq:v46 cellDlHighFreq:v47 cellUlLowFreq:v48 cellUlHighFreq:v49]];
    }
  }
  if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiEnhCoexSupport"])
  {
    [v25 removeObjectsInArray:v7];
    [(WCM_PolicyManager *)self setWifiChannelsToDisableOCL2G5G:v25];
    [(WCM_PolicyManager *)self setWifiChannelsToDisableOCLEnh:v26];
    [&v27[50] logLevel:5, @"OCLDisable_WiFiEnh: WiFi channels to disble OCL -- fixed version %@", -[WCM_PolicyManager wifiChannelsToDisableOCL2G5G](self, "wifiChannelsToDisableOCL2G5G") message];
    [(WCM_WiFiController *)v3 updateChannelsToDisableOCLWiFiEnh:[(WCM_PolicyManager *)self wifiChannelsToDisableOCL2G5G] WiFiEnhChannels:[(WCM_PolicyManager *)self wifiChannelsToDisableOCLEnh]];
  }
  else
  {
    [v52 removeObjectsInArray:v7];
    [(WCM_PolicyManager *)self setWifiChannelsToDisableOCL:v52];
    [&v27[50] logLevel:5, @"WiFi channels to disble OCL -- fixed version %@", -[WCM_PolicyManager wifiChannelsToDisableOCL](self, "wifiChannelsToDisableOCL") message];
    [(WCM_WiFiController *)v3 updateChannelsToDisableOCL:[(WCM_PolicyManager *)self wifiChannelsToDisableOCL]];
  }
}

- (void)updateHPCellularMetric
{
  +[WCM_Logging logLevel:4 message:@"HPCellularCA: Update HPCellular Metric"];
  if ([(WCM_PolicyManager *)self btController])
  {
    id v3 = [(NSMutableArray *)[(WCM_BTController *)[(WCM_PolicyManager *)self btController] btConnections] count];
    unint64_t v4 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] getNum2GHzAclA2DPDevices];
    unint64_t v5 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] numeSCODevice];
    unint64_t v6 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] numSCODevice];
    unint64_t v7 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] numHIDDevice];
    unint64_t v8 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] numLEDevice];
    unint64_t v9 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] numLEADevice];
    unint64_t v10 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] numLLADevice];
  }
  else
  {
    unint64_t v4 = 0;
    unint64_t v5 = 0;
    unint64_t v6 = 0;
    unint64_t v7 = 0;
    unint64_t v8 = 0;
    unint64_t v9 = 0;
    unint64_t v10 = 0;
    id v3 = 0;
  }
  [+[WCM_HPCellular_CoreAnalyticsService singleton](WCM_HPCellular_CoreAnalyticsService, "singleton") updateHPCellularCoexStatsWithBtDeviceCount:v3 a2dpDeviceCount:v4 escoDeviceCount:v5 scoDeviceCount:v6 hidDeviceCount:v7 leDeviceCount:v8 leaDeviceCount:v9 llaDeviceCount:v10];
}

- (void)handleHPCellularSessionStart
{
  +[WCM_Logging logLevel:4 message:@"HPCellularCA: Handle session start."];
  [[+[WCM_HPCellular_CoreAnalyticsService singleton](WCM_HPCellular_CoreAnalyticsService, "singleton") resetHPCellularCoexStatsMetrics];

  [(WCM_PolicyManager *)self updateHPCellularMetric];
}

- (void)handleHPCellularSessionEnd
{
  +[WCM_Logging logLevel:4 message:@"HPCellularCA: Handle session end."];
  [(WCM_PolicyManager *)self updateHPCellularMetric];
  id v3 = +[WCM_HPCellular_CoreAnalyticsService singleton];

  [v3 submitHPCellularCoexStats];
}

- (void)updateWiFiChannelForConditionalMitigation
{
  unsigned int v3 = [(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiEnhCoexSupport"];
  unint64_t v4 = +[NSMutableArray arrayWithArray:[(WCM_PolicyManager *)self wifi2GHzChannelsToEnableType7MSGCombined]];
  if (v3)
  {
    [(NSMutableArray *)v4 addObjectsFromArray:[(WCM_PolicyManager *)self wifi5GHzChannelsToEnableType7MSGCombined]];
    unint64_t v5 = +[NSMutableArray arrayWithArray:[(WCM_PolicyManager *)self wifiEnhChannelsToEnableType7MSG]];
    unint64_t v6 = [(WCM_PolicyManager *)self wifiController];
    [(WCM_WiFiController *)v6 updateChannelsToEnableType7MSGWiFiEnh:v4 WiFiEnhChannels:v5];
  }
  else
  {
    [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] updateChannelsToEnableType7MSG:+[NSMutableArray arrayWithArray:[(WCM_PolicyManager *)self wifi5GHzChannelsToEnableType7MSGCombined]]];
    unint64_t v7 = [(WCM_PolicyManager *)self wifiController];
    [(WCM_WiFiController *)v7 updateChannelsToEnableType7MSG2GWiFi:v4];
  }
}

- (void)handleCallLQMStateChangeType7:(BOOL)a3
{
  id v3 = (id)a3;
  if (![(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"BB25ASuppot"])
  {
    unint64_t v5 = +[NSMutableArray arrayWithArray:[(WCM_PolicyManager *)self wifi2GHzChannelsToEnableType7MSGCombined]];
    unint64_t v6 = +[NSMutableArray arrayWithArray:[(WCM_PolicyManager *)self wifi5GHzChannelsToEnableType7MSGCombined]];
    unint64_t v7 = +[NSMutableArray arrayWithArray:&off_10024E428];
    unint64_t v8 = +[NSMutableArray arrayWithArray:&off_10024E440];
    BOOL v9 = [(WCM_PolicyManager *)self callActiveState];
    uint64_t v10 = [(WCM_PolicyManager *)self dataLqmState];
    double v17 = v8;
    if (v3)
    {
      id v3 = [(NSMutableArray *)v5 isEqualToArray:v7];
      id v11 = [(NSMutableArray *)v6 isEqualToArray:v8];
    }
    else
    {
      id v11 = 0;
    }
    +[WCM_Logging logLevel:4, @" handleCallLQMStateChangeType7 : %d %d %d %d ", v9, (int)v10, v3, v11 message];
    int v12 = (int)v10 < 50 || v9;
    unsigned __int8 v13 = [(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFi5GHzType7NR79AntBlocking"];
    if (v12 == 1)
    {
      if ((v13 & 1) == 0
        && ![(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiType7LTEMBAntBlocking"])
      {
        double v14 = v6;
        CFStringRef v15 = @"Combined WiFi bitmap for Type7 MSG (extended from LTEMB Only): callActiveState=%d, lqmCurrent = %d compared to lqmThreshold = %d. Thus using NoProtection instead of Snapshot version: wifi2GHzChannelType7Snapshot=%@, wifi5GHzChannelType7Snapshot=%@, wifi2GHzChannelType7NoProtection=%@, wifi5GHzChannelType7NoProtection=%@, skipIOVARAssert_2GHz=%d, skipIOVARAssert_5GHz=%d";
        goto LABEL_23;
      }
      double v14 = v6;
      if ((v11 & 1) == 0) {
        [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] updateChannelsToEnableType7MSG:v17];
      }
      CFStringRef v15 = @"Combined WiFi bitmap for Type7 MSG (extended from LTEMB Only): callActiveState=%d, lqmCurrent = %d compared to lqmThreshold = %d. Thus using NoProtection instead of Snapshot version: wifi2GHzChannelType7Snapshot=%@, wifi5GHzChannelType7Snapshot=%@, wifi2GHzChannelType7NoProtection=%@, wifi5GHzChannelType7NoProtection=%@, skipIOVARAssert_2GHz=%d, skipIOVARAssert_5GHz=%d";
      double v16 = v7;
      if (v3) {
        goto LABEL_23;
      }
    }
    else
    {
      if ((v13 & 1) == 0
        && ![(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiType7LTEMBAntBlocking"])
      {
        double v14 = v6;
        CFStringRef v15 = @"Combined WiFi bitmap for Type7 MSG (extended from LTEMB Only):: callActiveState=%d, lqmCurrent = %d compared to lqmThreshold = %d. Thus using Snapshot version instead of NoProtection version: wifi2GHzChannelType7Snapshot=%@, wifi5GHzChannelType7Snapshot=%@, wifi2GHzChannelType7NoProtection=%@, wifi5GHzChannelType7NoProtection=%@, skipIOVARAssert_2GHz=%d, skipIOVARAssert_5GHz=%d";
        goto LABEL_23;
      }
      if ((v11 & 1) == 0) {
        [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] updateChannelsToEnableType7MSG:v6];
      }
      double v14 = v6;
      CFStringRef v15 = @"Combined WiFi bitmap for Type7 MSG (extended from LTEMB Only):: callActiveState=%d, lqmCurrent = %d compared to lqmThreshold = %d. Thus using Snapshot version instead of NoProtection version: wifi2GHzChannelType7Snapshot=%@, wifi5GHzChannelType7Snapshot=%@, wifi2GHzChannelType7NoProtection=%@, wifi5GHzChannelType7NoProtection=%@, skipIOVARAssert_2GHz=%d, skipIOVARAssert_5GHz=%d";
      double v16 = v5;
      if (v3) {
        goto LABEL_23;
      }
    }
    [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] updateChannelsToEnableType7MSG2GWiFi:v16];
LABEL_23:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, v15, v9, v10, 50, v5, v14, v7, v17, v3, v11);
  }
}

- (void)handleBTConnectionChange
{
  uint64_t v3 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] getBTState];
  +[WCM_Logging logLevel:3, @"Handle BT connection change btState(%d)", v3 message];
  if (v3 == 2) {
    [(WCM_BTController *)[(WCM_PolicyManager *)self btController] updatePreferredRole:[(WCM_PolicyManager *)self btPreferredRole]];
  }

  [(WCM_PolicyManager *)self handleFTCall];
}

- (void)handleBTPowerStateChange
{
  unsigned int v3 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] powerState];
  unint64_t v4 = "off";
  if (v3) {
    unint64_t v4 = "on";
  }
  +[WCM_Logging logLevel:2, @"Updating policy for BT power %s", v4 message];
  unsigned int v5 = [(WCM_PolicyManager *)self cellularCoexBand];
  if ([(WCM_BTController *)[(WCM_PolicyManager *)self btController] powerState])
  {
    [(WCM_BTController *)[(WCM_PolicyManager *)self btController] updateWCI2Mode:0];
    [(WCM_BTController *)[(WCM_PolicyManager *)self btController] updateMWSSignalingConfig];
    unsigned int v6 = [(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"BTDiversityAFHMap"];
    unsigned int v7 = [(WCM_PolicyManager *)self gpsRadioActive];
    if (v6)
    {
      unint64_t v8 = [(WCM_PolicyManager *)self btController];
      if (v7)
      {
        BOOL v9 = [(WCM_PolicyManager *)self btDiversityChannelMapOnGpsRadioActiveForC0B0];
        uint64_t v10 = [(WCM_PolicyManager *)self btDiversityChannelMapOnGpsRadioActiveForC0B1];
        id v11 = [(WCM_PolicyManager *)self btDiversityChannelMapOnGpsRadioActiveForC1B0];
        int v12 = [(WCM_PolicyManager *)self btDiversityChannelMapOnGpsRadioActiveForC1B1];
      }
      else
      {
        BOOL v9 = [(WCM_PolicyManager *)self btDiversityChannelMapForC0B0];
        uint64_t v10 = [(WCM_PolicyManager *)self btDiversityChannelMapForC0B1];
        id v11 = [(WCM_PolicyManager *)self btDiversityChannelMapForC1B0];
        int v12 = [(WCM_PolicyManager *)self btDiversityChannelMapForC1B1];
      }
      [(WCM_BTController *)v8 updateDiversityAFHMapForC0B0:v9 C0B1:v10 C1B0:v11 C1B1:v12];
    }
    else
    {
      if (v7) {
        unsigned __int8 v13 = [(WCM_PolicyManager *)self btPreferredChannelMapOnGpsRadioActive];
      }
      else {
        unsigned __int8 v13 = [(WCM_PolicyManager *)self btPreferredChannelMap];
      }
      double v14 = v13;
      if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"hpcellularstatemonitorsupport"])
      {
        +[WCM_Logging logLevel:4, @"HPCellular (handleBTPowerStateChange): Bool flag self.hpCellNeed2SetBTAFH = (%d), Fixed AFH self.btPreferredChannelMapHPCellularActive = (%@).", [(WCM_PolicyManager *)self hpCellNeed2SetBTAFH], [(WCM_PolicyManager *)self btPreferredChannelMapHPCellularActive] message];
        if ([(WCM_PolicyManager *)self hpCellNeed2SetBTAFH]) {
          double v14 = [(WCM_PolicyManager *)self btPreferredChannelMapHPCellularActive];
        }
      }
      [(WCM_BTController *)[(WCM_PolicyManager *)self btController] updatePreferredAFHMap:v14];
    }
    if (_os_feature_enabled_impl()
      && [(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"HFBTCoex"])
    {
      CFStringRef v15 = [(WCM_PolicyManager *)self btPreferred5GChannelMap];
      +[WCM_Logging logLevel:3 message:@"HFAFHDebug_ Update channel bitmap"];
      [(WCM_BTController *)[(WCM_PolicyManager *)self btController] updatePreferredHFBTChannelMap:v15];
    }
    if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"BLEActiveScanPwrLmtEnabled"])
    {
      if ((v5 & 0xFFFFFFFE) == 2) {
        uint64_t v16 = 5;
      }
      else {
        uint64_t v16 = 0;
      }
      unint64_t v17 = [(WCM_PolicyManager *)self BLEActiveScanPwrLmtAssrInt];
      unint64_t v18 = [(WCM_PolicyManager *)self BLEActiveScanPwrLmtAssrInt];
      if (v16 == v17)
      {
        +[WCM_Logging logLevel:4, @"DLDebugBLEIntervalTooOften_ updateBLEActiveScanPwrLmtAssertionInterval is called by handleBTPowerStateChange. No Need to update with same value --- new interval (%lld), old interval (%lld)", v16, v18 message];
      }
      else
      {
        +[WCM_Logging logLevel:4, @"DLDebugBLEIntervalTooOften_ updateBLEActiveScanPwrLmtAssertionInterval is called by handleBTPowerStateChange. Updating with new interval (%lld), old interval (%lld)", v16, v18 message];
        [(WCM_PolicyManager *)self setBLEActiveScanPwrLmtAssrInt:v16];
        [(WCM_BTController *)[(WCM_PolicyManager *)self btController] updateBLEActiveScanPwrLmtAssertionInterval:[(WCM_PolicyManager *)self BLEActiveScanPwrLmtAssrInt]];
      }
    }
    [(WCM_BTController *)[(WCM_PolicyManager *)self btController] updatePreferredRole:[(WCM_PolicyManager *)self btPreferredRole]];
    if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"PencilCoexSupport"])
    {
      [(WCM_PolicyManager *)self configureBTAntennaSelection];
    }
    [(WCM_PolicyManager *)self updateCellTxPowerLimit];
    if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"LTEScanProtection"])
    {
      unsigned int v19 = [(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"LTEScanProtectionBTseparate"];
      double v20 = [(WCM_PolicyManager *)self btController];
      double v21 = [(WCM_PolicyManager *)self platformManager];
      if (v19) {
        double v22 = [(WCM_PlatformManager *)v21 wcmCellularScanProtectionCellFrequenciesforBT];
      }
      else {
        double v22 = [(WCM_PlatformManager *)v21 wcmCellularScanProtectionCellFrequencies];
      }
      [(WCM_BTController *)v20 updateMWSScanFrequencyTable:v22];
    }
    if (_os_feature_enabled_impl()
      && [(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"HFBTCoex"])
    {
      [(WCM_BTController *)[(WCM_PolicyManager *)self btController] updateHFBtTxIndication:1];
      +[WCM_Logging logLevel:4, @"HFBTAntBlkDebug_ Current enabled bands = %@", [(WCM_PolicyManager *)self HFBTAntBlkEnableBands] message];
      unsigned int v23 = [(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"HFBTConditionId"];
      double v24 = [(WCM_PolicyManager *)self btController];
      unint64_t v25 = [(WCM_PolicyManager *)self btAntBlockDuration];
      id v26 = [[-[NSDictionary objectForKeyedSubscript:](-[WCM_PolicyManager HFBTAntBlkEnableBands](self, "HFBTAntBlkEnableBands")) objectForKeyedSubscript:@"AntBlkBandUnii1Enabled"] BOOLValue];
      id v27 = [[-[NSDictionary objectForKeyedSubscript:](-[WCM_PolicyManager HFBTAntBlkEnableBands](self, "HFBTAntBlkEnableBands")) objectForKeyedSubscript:@"AntBlkBandUnii3Enabled"] BOOLValue];
      id v28 = [[-[NSDictionary objectForKeyedSubscript:](-[WCM_PolicyManager HFBTAntBlkEnableBands](self, "HFBTAntBlkEnableBands")) objectForKeyedSubscript:@"AntBlkBandUnii5aEnabled"] BOOLValue];
      id v29 = [[-[NSDictionary objectForKeyedSubscript:](-[WCM_PolicyManager HFBTAntBlkEnableBands](self, "HFBTAntBlkEnableBands")) objectForKeyedSubscript:@"AntBlkBandUnii5bEnabled"] BOOLValue];
      id v30 = [[-[NSDictionary objectForKeyedSubscript:](-[WCM_PolicyManager HFBTAntBlkEnableBands](self, "HFBTAntBlkEnableBands")) objectForKeyedSubscript:@"AntBlkBandUnii5cEnabled"] BOOLValue];
      LOBYTE(v35) = [[-[NSDictionary objectForKeyedSubscript:](-[WCM_PolicyManager HFBTAntBlkEnableBands](self, "HFBTAntBlkEnableBands") objectForKeyedSubscript:@"AntBlkBandUnii5dEnabled") BOOLValue];
      if (v23) {
        -[WCM_BTController updateHFBtAntennaRequestWithDuration:unii1Enabled:unii3Enabled:unii5aEnabled:unii5bEnabled:unii5cEnabled:unii5dEnabled:unii1ConditionId:unii3ConditionId:unii5aConditionId:unii5bConditionId:unii5cConditionId:unii5dConditionId:](v24, "updateHFBtAntennaRequestWithDuration:unii1Enabled:unii3Enabled:unii5aEnabled:unii5bEnabled:unii5cEnabled:unii5dEnabled:unii1ConditionId:unii3ConditionId:unii5aConditionId:unii5bConditionId:unii5cConditionId:unii5dConditionId:", v25, v26, v27, v28, v29, v30, v35, [&off_10023D0C8 unsignedIntValue], [&off_10023D0C8 unsignedIntValue], [&off_10023D0E0 unsignedIntValue], [&off_10023D0E0 unsignedIntValue], [&off_10023D0E0 unsignedIntValue], [&off_10023D0E0 unsignedIntValue]);
      }
      else {
        [(WCM_BTController *)v24 updateHFBtAntennaRequestWithDuration:v25 unii1Enabled:v26 unii3Enabled:v27 unii5aEnabled:v28 unii5bEnabled:v29 unii5cEnabled:v30 unii5dEnabled:v35];
      }
    }
    unsigned int v31 = [(WCM_PolicyManager *)self cellularCoexBand];
    [(WCM_BTController *)[(WCM_PolicyManager *)self btController] updateMWSChannelParameters:[(WCM_PolicyManager *)self cellularController]];
    if (v31 == 7)
    {
      +[WCM_Logging logLevel:4, @"ZeroFreqDebug: For non-coex scenario (including RRC idle), WRM pass actual frequences instead of zeros to BT. ([self cellularCoexBand] != WRM_BNON_COEX) as a BOOL is %d.", [(WCM_PolicyManager *)self cellularCoexBand] != 7 message];
    }
    else
    {
      [(WCM_PolicyManager *)self configureAllWCI2:1];
      if ([(WCM_PolicyManager *)self cellularWCI2CoexPolicyBitmap]) {
        [(WCM_BTController *)[(WCM_PolicyManager *)self btController] updateMWSFrameConfig:[(WCM_PolicyManager *)self cellularController]];
      }
    }
    [(WCM_PolicyManager *)self updateCoexMonitorState:[(WCM_PolicyManager *)self cellularCoexBand]];
    if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WifiBtAgcCoexMode"]&& [(WCM_PolicyManager *)self btAgcCoexModeEnable])
    {
      +[WCM_Logging logLevel:4, @"CrashDebug_ 2nd place self.btAgcCoexModeEnable is %d", [(NSNumber *)[(WCM_PolicyManager *)self btAgcCoexModeEnable] integerValue] message];
      [(WCM_BTController *)[(WCM_PolicyManager *)self btController] updateCoexRxGainMode:[(WCM_PolicyManager *)self btAgcCoexModeEnable]];
    }
    [(WCM_PolicyManager *)self sendRCU2UpdateMessage];
  }
  if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"CoexBBUnifiedSensorInfoSupport"])
  {
    if ([(WCM_PolicyManager *)self btController])
    {
      if ([(WCM_BTController *)[(WCM_PolicyManager *)self btController] getNum2GHzAclA2DPDevices])
      {
        uint64_t v32 = 4;
      }
      else if ([(WCM_BTController *)[(WCM_PolicyManager *)self btController] numeSCODevice])
      {
        uint64_t v32 = 2;
      }
      else if ([(WCM_BTController *)[(WCM_PolicyManager *)self btController] numSCODevice])
      {
        uint64_t v32 = 1;
      }
      else if ([(WCM_BTController *)[(WCM_PolicyManager *)self btController] numLEADevice])
      {
        uint64_t v32 = 5;
      }
      else
      {
        uint64_t v32 = 0;
      }
      if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"UseWCMAriDriver"])
      {
        if ([(WCM_BTController *)[(WCM_PolicyManager *)self btController] num2GHzAoSBiAudioDevice])
        {
          unsigned __int8 v33 = 2;
        }
        else
        {
          if ([(WCM_BTController *)[(WCM_PolicyManager *)self btController] num2GHzAoSUniAudioDevice])
          {
            unsigned __int8 v33 = 2;
            uint64_t v32 = 6;
            goto LABEL_63;
          }
          if (![(WCM_BTController *)[(WCM_PolicyManager *)self btController] num5GHzAoSBiAudioDevice])
          {
            unint64_t v34 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] num5GHzAoSUniAudioDevice];
            if (v34) {
              uint64_t v32 = 6;
            }
            else {
              uint64_t v32 = v32;
            }
            if (v34) {
              unsigned __int8 v33 = 3;
            }
            else {
              unsigned __int8 v33 = 2;
            }
            goto LABEL_63;
          }
          unsigned __int8 v33 = 3;
        }
        uint64_t v32 = 7;
      }
      else
      {
        unsigned __int8 v33 = 2;
      }
    }
    else
    {
      uint64_t v32 = 0;
      unsigned __int8 v33 = 0;
    }
LABEL_63:
    [(WCM_CellularController *)[(WCM_PolicyManager *)self cellularController] sendBBCoexSensorMessage:2 band:v33 usecase:v32];
  }
  if ([(WCM_PolicyManager *)self isInHpSession])
  {
    [(WCM_PolicyManager *)self updateHPCellularMetric];
  }
}

- (void)sendRCU2UpdateMessage
{
  +[WCM_Logging logLevel:3 message:@" In sendRCU2UpdateMessage.. enter"];
  if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"RCU2Support"])
  {
    +[WCM_Logging logLevel:3 message:@" BT power state change - Set RCU2 parameters"];
    [(WCM_RCU2Controller *)[(WCM_PolicyManager *)self rcu2Controller] setMRCU2PowerOn:[(WCM_CtrXPCClient *)[(WCM_RCU2Controller *)[(WCM_PolicyManager *)self rcu2Controller] threadClient] threadCOEXStatus]];
    [(WCM_RCU2Controller *)[(WCM_PolicyManager *)self rcu2Controller] setMRCU2ChannelNum:[(WCM_CtrXPCClient *)[(WCM_RCU2Controller *)[(WCM_PolicyManager *)self rcu2Controller] threadClient] getChannel]];
    [(WCM_RCU2Controller *)[(WCM_PolicyManager *)self rcu2Controller] setMRCU2ChannelActivity:[(WCM_CtrXPCClient *)[(WCM_RCU2Controller *)[(WCM_PolicyManager *)self rcu2Controller] threadClient] getChannelActivity]];
    +[WCM_Logging logLevel:0, @"WIFI/RCU2 - Setting values status = %d channelno =%d channel activity =%lld ", [(WCM_RCU2Controller *)[(WCM_PolicyManager *)self rcu2Controller] mRCU2PowerOn], [(WCM_RCU2Controller *)[(WCM_PolicyManager *)self rcu2Controller] mRCU2ChannelNum], [(WCM_RCU2Controller *)[(WCM_PolicyManager *)self rcu2Controller] mRCU2ChannelActivity] message];
    if ([(WCM_BTController *)[(WCM_PolicyManager *)self btController] powerState])
    {
      +[WCM_Logging logLevel:3, @" Setting AFH Map for RCU2 channel %d", [(WCM_RCU2Controller *)[(WCM_PolicyManager *)self rcu2Controller] mRCU2ChannelNum] message];
      [(WCM_BTController *)[(WCM_PolicyManager *)self btController] updatePreferredAFHMapRCU2:[(WCM_RCU2Controller *)[(WCM_PolicyManager *)self rcu2Controller] mRCU2ChannelNum]];
    }
    else
    {
      +[WCM_Logging logLevel:0 message:@"BT power state off - not sending afh map"];
    }
    unsigned int v3 = [(WCM_PolicyManager *)self rcu2Controller];
    [(WCM_RCU2Controller *)v3 handleRCU2Connection];
  }
}

- (void)handleBTScanConfigChange
{
  uint64_t v3 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] getBTState];
  BOOL v4 = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] isCarPlaySessionInProgress];
  uint64_t v5 = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] getCarPlayScanRelaxReason];
  +[WCM_Logging logLevel:3, @"handleBTScanConfigChange Handle BT radio state (%d)", v3 message];
  if (!v3 || v5)
  {
    +[WCM_Logging logLevel:3, @"BT controller is off or Carplay is not a reason, didnt send Carplay scan param changes btState(%d) reason (%d)", v3, v5 message];
  }
  else
  {
    [(WCM_BTController *)[(WCM_PolicyManager *)self btController] updateCarplayBTScanParams:v4 reason:0];
    +[WCM_Logging logLevel:3, @"Sent message to BT controller about Carplay scan param changes carPlayState(%d) carPlayReason(%d)", v4, 0 message];
  }
}

- (void)handleRCU2ContentionChange
{
  BOOL v3 = [(WCM_RCU2Controller *)[(WCM_PolicyManager *)self rcu2Controller] mRCU2PowerOn];
  id v4 = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] getLeastCongestedWifiParam];
  +[WCM_Logging logLevel:3, @"handleRCU2ContentionChange Handle RC2 radio state (%d)", v3 message];
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"RCU2Support"))
  {
    if (!v3)
    {
      +[WCM_Logging logLevel:3, @"RC2 controller is off (%d)", v3 message];
      return;
    }
    [-[WCM_RCU2Controller updateContentionFreeWiFiInfoToRC2:count:](-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "updateContentionFreeWiFiInfoToRC2:count:", [objc_msgSend(objc_msgSend(v4, "objectAtIndex:", 0), "unsignedIntValue"), objc_msgSend(objc_msgSend(v4, "objectAtIndex:", 1), "unsignedIntValue")]);
    CFStringRef v5 = @"Sent message to RC2 controller about least contested WiFi channel";
  }
  else
  {
    CFStringRef v5 = @"handleRCU2ContentionChange RCU2 feature not enabed";
  }

  +[WCM_Logging logLevel:3 message:v5];
}

- (BOOL)deviceIsMacBookAir
{
  return -[WCM_PlatformManager wrmPlatformId](-[WCM_PolicyManager platformManager](self, "platformManager"), "wrmPlatformId") == 308|| -[WCM_PlatformManager wrmPlatformId](-[WCM_PolicyManager platformManager](self, "platformManager"), "wrmPlatformId") == 309|| -[WCM_PlatformManager wrmPlatformId](-[WCM_PolicyManager platformManager](self, "platformManager"), "wrmPlatformId") == 307|| -[WCM_PlatformManager wrmPlatformId](-[WCM_PolicyManager platformManager](self, "platformManager"), "wrmPlatformId") == 305|| -[WCM_PlatformManager wrmPlatformId](-[WCM_PolicyManager platformManager](self, "platformManager"), "wrmPlatformId") == 306|| -[WCM_PlatformManager wrmPlatformId](-[WCM_PolicyManager platformManager](self, "platformManager"), "wrmPlatformId") == 342|| -[WCM_PlatformManager wrmPlatformId]([(WCM_PolicyManager *)self platformManager],
           "wrmPlatformId") == 343;
}

- (int)parseCenterFreqtoUNIIBand:(unsigned int)a3
{
  if (a3 - 1 < 0x9AF) {
    return 1;
  }
  if (a3 - 5150 < 0x65) {
    return 2;
  }
  if (a3 - 5250 < 0x65) {
    return 3;
  }
  if (a3 - 5470 < 0x100) {
    return 4;
  }
  if (a3 - 5725 < 0x65) {
    return 5;
  }
  if (a3 - 5850 < 0x4C) {
    return 6;
  }
  if (a3 - 5925 < 0x7E) {
    return 7;
  }
  if (a3 - 6051 < 0x7D) {
    return 8;
  }
  if (a3 - 6176 < 0x7D) {
    return 9;
  }
  if (a3 - 6301 < 0x7D) {
    return 10;
  }
  if (a3 - 6425 < 0x65) {
    return 11;
  }
  if (a3 - 6525 < 0x15F) {
    return 12;
  }
  if (a3 - 6875 >= 0xFB) {
    return 0;
  }
  return 13;
}

- (void)updateWiFiBTConnectionReport
{
  if ([(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] powerState])
  {
    v3[0] = @"2GAoSUni";
    v4[0] = +[NSNumber numberWithUnsignedInteger:[(WCM_BTController *)[(WCM_PolicyManager *)self btController] num2GHzAoSUniAudioDevice]];
    v3[1] = @"2GAoSBi";
    v4[1] = +[NSNumber numberWithUnsignedInteger:[(WCM_BTController *)[(WCM_PolicyManager *)self btController] num2GHzAoSBiAudioDevice]];
    v3[2] = @"5GAoSUni";
    v4[2] = +[NSNumber numberWithUnsignedInteger:[(WCM_BTController *)[(WCM_PolicyManager *)self btController] num5GHzAoSUniAudioDevice]];
    v3[3] = @"5GAoSBi";
    v4[3] = +[NSNumber numberWithUnsignedInteger:[(WCM_BTController *)[(WCM_PolicyManager *)self btController] num5GHzAoSBiAudioDevice]];
    v3[4] = @"ACL-A2DP";
    v4[4] = +[NSNumber numberWithUnsignedInteger:[(WCM_BTController *)[(WCM_PolicyManager *)self btController] getNum2GHzAclA2DPDevices]];
    v3[5] = @"ESCO";
    v4[5] = +[NSNumber numberWithUnsignedInteger:(char *)[(WCM_BTController *)[(WCM_PolicyManager *)self btController] numeSCODevice]+ [(WCM_BTController *)[(WCM_PolicyManager *)self btController] numSCODevice]];
    void v3[6] = @"HID";
    v4[6] = +[NSNumber numberWithUnsignedInteger:[(WCM_BTController *)[(WCM_PolicyManager *)self btController] numHIDDevice]];
    [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] updateWiFiBTConnectionReport:+[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:7]];
  }
  else
  {
    +[WCM_Logging logLevel:2 message:@"WCM_PolicyManager WiFi Power Off - Not sending BTConnectionReport"];
  }
}

- (void)handleWiFiRCU1PowerOff
{
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"RCU1Support")&& -[WCM_PolicyManager rcu1Controller](self, "rcu1Controller"))
  {
    BOOL v3 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] getAny5GHzBTDevicesConnected];
    [(WCM_R1Controller *)[(WCM_PolicyManager *)self rcu1Controller] setMRCU1CurrentMode:0];
    id v4 = [(WCM_PolicyManager *)self rcu1Controller];
    BOOL v5 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] powerState];
    [(WCM_R1Controller *)v4 sendRCU1Message:0 wifiBand:0 btPowerState:v5 btBand:v3 isForce:0];
  }
}

- (void)handleWiFiRCU2PowerOff
{
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"RCU2Support"))
  {
    [(WCM_PolicyManager *)self rcu2Controller];
  }
}

- (void)handleBTLeConn
{
  +[WCM_Logging logLevel:2 message:@"handleBTLeConn updating state to WiFi"];
  if ([(WCM_PolicyManager *)self wifiController])
  {
    unsigned int v3 = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiState];
    id v4 = [(WCM_PolicyManager *)self btController];
    BOOL v5 = &qword_10027D000;
    if (v4)
    {
      unint64_t v6 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] getLeConnDutyCycle];
      unint64_t v7 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] getLeConnDuration];
      unint64_t v13 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] getLeConnReason];
      unsigned int v8 = v6 - 1;
      if (v6 == 1) {
        uint64_t v9 = v7;
      }
      else {
        uint64_t v9 = 30;
      }
      +[WCM_Logging logLevel:2, @"LastSent: EN(%d) DC(%d) DUR(%d) Peak(%d)", byte_10027D2FC, dword_10027D2F0, dword_10027D2F4, dword_10027D2F8 message];
      uint64_t v10 = "DISABLED";
      switch(v3)
      {
        case 0u:
          goto LABEL_18;
        case 1u:
          uint64_t v10 = "ENABLED";
          goto LABEL_18;
        case 2u:
          +[WCM_Logging logLevel:2, @"CurrState: wifi(%s) EN(%d) DC(%d) DUR(%d) Peak(%d) ", "ASSOCIATED_2G", v8 < 4, v6, v7, v9 message];
          if (v8 >= 4)
          {
            id v4 = (WCM_BTController *)v9;
            BOOL v5 = &qword_10027D000;
            goto LABEL_22;
          }
          uint64_t v11 = 1;
          CFStringRef v12 = @"Set ON due to WiFi in 2G, current enable=1, and DC or DUR changed";
          if (dword_10027D2F0 == v6)
          {
            BOOL v5 = &qword_10027D000;
            if (dword_10027D2F4 == v7) {
              return;
            }
          }
          else
          {
            BOOL v5 = &qword_10027D000;
          }
          break;
        case 3u:
          uint64_t v10 = "ASSOCIATED_5G";
          goto LABEL_18;
        default:
          uint64_t v10 = "INVALID_STATE!!!";
          if (v3 == 4) {
            uint64_t v10 = "ASSOCIATED_6G";
          }
LABEL_18:
          +[WCM_Logging logLevel:2, @"CurrState: wifi(%s) EN(%d) DC(%d) DUR(%d) Peak(%d) ", v10, v8 < 4, v6, v7, v9 message];
          BOOL v5 = &qword_10027D000;
          goto LABEL_19;
      }
    }
    else
    {
      unint64_t v13 = 0;
      uint64_t v9 = 0;
      unint64_t v7 = 0;
      unint64_t v6 = 0;
      if (v3 == 2)
      {
LABEL_22:
        if (!byte_10027D2FC) {
          return;
        }
        uint64_t v11 = 0;
        CFStringRef v12 = @"Set OFF due to WiFi in 2G, current enable=0, and lastSent enable=1";
        uint64_t v9 = (uint64_t)v4;
      }
      else
      {
LABEL_19:
        if (!byte_10027D2FC) {
          return;
        }
        uint64_t v11 = 0;
        CFStringRef v12 = @"Set OFF due to WiFi NOT 2G and lastSent enable=1";
      }
    }
    +[WCM_Logging logLevel:2 message:v12];
    [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] updateWiFiBTLeConnEnable:v11 andPeakOutageMs:v9 andDurationMs:v7 andDutyCycle:v6 andReason:v13];
    byte_10027D2FC = v11;
    dword_10027D2F8 = v9;
    *((_DWORD *)v5 + 189) = v7;
    dword_10027D2F0 = v6;
  }
}

- (void)handleBTLeDiscoveryScanStateChange
{
  unsigned int v3 = "Other";
  id v4 = "stopped";
  if ([(WCM_PolicyManager *)self btController])
  {
    int64_t v5 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] getLeDiscoveryScanState];
    int64_t v6 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] getLeDiscoveryScanUseCase];
    BOOL v7 = v5 == 1;
    if (v7) {
      id v4 = "started";
    }
    BOOL v8 = v6 == 1;
    if (v6 == 1) {
      unsigned int v3 = "FindMyPencil";
    }
  }
  else
  {
    BOOL v8 = 0;
    BOOL v7 = 0;
  }
  +[WCM_Logging logLevel:2, @"handleBTLeDiscoveryScanStateChange - Scan %s, Use Case %s", v4, v3 message];
  unsigned int v9 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") activeCoexFeatures] containsObject:@"CFUseTddModeDuringFindMy"];
  if (v8 && v9) {
    self->_findMyPencilScanActive = v7;
  }

  [(WCM_PolicyManager *)self handleWiFiBTCoexChange];
}

- (void)handleWiFiBTAirplayChange
{
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"AirplayCriticalSupport"))
  {
    unsigned int v3 = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiState];
    unsigned int v4 = [(WCM_AirplayController *)[(WCM_PolicyManager *)self airplayController] mAirplayIsCritical];
    +[WCM_Logging logLevel:2 message:@"handleWiFiBTAirplayChange updating Airplay Critical to WiFi and BT"];
    BOOL v5 = v3 - 2 < 3;
    uint64_t v6 = v4 & v5;
    if ((v4 & v5) != 0) {
      BOOL v7 = "on";
    }
    else {
      BOOL v7 = "off";
    }
    +[WCM_Logging logLevel:4, @"Updating critical wifi state for AirPlay to %s", v7 message];
    [(WCM_PolicyManager *)self updateWiFiAirplayCriticalState:v6];
    [(WCM_PolicyManager *)self updateBTAirplayCriticalState:v6];
  }
}

- (void)updateWiFiAirplayCriticalState:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(WCM_PolicyManager *)self wifiController]
    && [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] powerState])
  {
    BOOL v5 = [(WCM_PolicyManager *)self wifiController];
    uint64_t v6 = [(WCM_AirplayController *)[(WCM_PolicyManager *)self airplayController] mAirplayDuration];
    uint64_t v7 = [(WCM_AirplayController *)[(WCM_PolicyManager *)self airplayController] mAirplayCriticalityPercentage];
    uint64_t v8 = [(WCM_Controller *)[(WCM_PolicyManager *)self airplayController] getProcessId];
    [(WCM_WiFiController *)v5 setCriticalWiFiTraffic:v3 duration:v6 criticalityPercentage:v7 forProcessID:v8];
  }
  else
  {
    +[WCM_Logging logLevel:2 message:@"WiFi is OFF"];
  }
}

- (void)updateWiFiCatsState:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(WCM_PolicyManager *)self wifiController]
    && [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] powerState])
  {
    BOOL v5 = [(WCM_PolicyManager *)self wifiController];
    [(WCM_WiFiController *)v5 setHPovrLEscanGrantDuration:v3];
  }
  else
  {
    +[WCM_Logging logLevel:2 message:@"WiFi is OFF"];
  }
}

- (void)updateBTAirplayCriticalState:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(WCM_PolicyManager *)self btController]
    && [(WCM_BTController *)[(WCM_PolicyManager *)self btController] powerState])
  {
    BOOL v5 = [(WCM_PolicyManager *)self btController];
    [(WCM_BTController *)v5 updateWiFiCriticalEnabled:v3];
  }
  else
  {
    +[WCM_Logging logLevel:2 message:@"BT is OFF"];
  }
}

- (void)handleWiFiNANChange
{
  if ((_os_feature_enabled_impl() & 1) == 0
    && objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"WiFiFigaroCoex"))
  {
    BOOL v3 = [(WCM_PolicyManager *)self btController];
    BOOL v4 = [(WCM_P2PNANController *)[(WCM_PolicyManager *)self p2pNanController] mNanEnabled];
    [(WCM_BTController *)v3 updateNANActive:v4];
  }
}

- (void)handleWiFiAWDLChange
{
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"WiFiFigaroCoex"))
  {
    if (_os_feature_enabled_impl())
    {
      BOOL forceRealTimeAWDL = self->_forceRealTimeAWDL;
      BOOL v4 = [(WCM_PolicyManager *)self btController];
      BOOL v5 = v4;
      if (forceRealTimeAWDL)
      {
        BOOL v6 = 1;
      }
      else
      {
        BOOL v6 = [(WCM_P2PAWDLController *)[(WCM_PolicyManager *)self p2pAwdlController] mRealTimeAwdlTrafficEnabled];
        BOOL v4 = v5;
      }
      [(WCM_BTController *)v4 updateAWDLRTGActive:v6];
    }
    else
    {
      [(WCM_BTController *)[(WCM_PolicyManager *)self btController] updateAWDLActive:[(WCM_P2PAWDLController *)[(WCM_PolicyManager *)self p2pAwdlController] mAwdlEnabled]];
    }
  }
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"RCU2SupportIntegrated"))
  {
    uint64_t v7 = [(WCM_RCU2Controller *)[(WCM_PolicyManager *)self rcu2Controller] threadClient];
    BOOL v8 = [(WCM_P2PAWDLController *)[(WCM_PolicyManager *)self p2pAwdlController] mRealTimeAwdlTrafficEnabled];
    [(WCM_CtrXPCClient *)v7 updateAWDLRealTimeMode:v8];
  }
}

- (void)updateWiFiRCU2CoexMode
{
  if ([(WCM_PolicyManager *)self wifiController]
    && [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] powerState])
  {
    id v3 = [(WCM_RCU2Controller *)[(WCM_PolicyManager *)self rcu2Controller] getRC2CoexMode];
    BOOL v4 = [(WCM_PolicyManager *)self wifiController];
    [(WCM_WiFiController *)v4 updateWiFiRCU2CoexMode:v3];
  }
}

- (void)updateWiFiRCU2PMProtectionMode
{
  if ([(WCM_PolicyManager *)self wifiController]
    && [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] powerState])
  {
    id v3 = [(WCM_RCU2Controller *)[(WCM_PolicyManager *)self rcu2Controller] getRC2PMProtectionMode];
    BOOL v4 = [(WCM_PolicyManager *)self wifiController];
    [(WCM_WiFiController *)v4 updateWiFiRCU2PMProtectionMode:v3];
  }
}

- (void)updateWiFiRCU2ULOFDMAStatus
{
  +[WCM_Logging logLevel:2 message:@"Handle WiFi RC2 UL_OFDMA state change"];
  if ([(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] powerState])
  {
    unsigned int v3 = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiState];
    unsigned int v4 = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] didWiFiDeviceReset];
    if (v3 >= 4)
    {
      BOOL v5 = "INVALID_STATE!!!";
      if (v3 == 4) {
        BOOL v5 = "ASSOCIATED_6G";
      }
    }
    else
    {
      BOOL v5 = off_100211678[v3];
    }
    +[WCM_Logging logLevel:2, @"WiFiState(%s)", v5 message];
    +[WCM_Logging logLevel:2, @"WiFiState : Power:(%d) ChannelNo:(%d)", [(WCM_RCU2Controller *)[(WCM_PolicyManager *)self rcu2Controller] mRCU2PowerOn], (__int16)[(WCM_RCU2Controller *)[(WCM_PolicyManager *)self rcu2Controller] mRCU2ChannelNum] message];
    int v6 = v3 == 2;
    if (byte_10027D2FD == v6) {
      int v7 = v4;
    }
    else {
      int v7 = 1;
    }
    if (v7 == 1)
    {
      BOOL v8 = v3 == 2;
      +[WCM_Logging logLevel:2, @"WiFi/RCU2 UL OFDMA disable state change prev (%d) current (%d) wifiReset (%d)", byte_10027D2FD, v8, v4 message];
      byte_10027D2FD = v6;
      unsigned int v9 = [(WCM_PolicyManager *)self wifiController];
      [(WCM_WiFiController *)v9 updateWiFiRCU2ULOFDMAstate:v8];
    }
  }
  else
  {
    byte_10027D2FD = 0;
  }
}

- (void)updateBTRCU2TimingArray
{
  if ([(WCM_PolicyManager *)self wifiController]) {
    unsigned int v3 = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] powerState];
  }
  else {
    unsigned int v3 = 0;
  }
  if ([(WCM_PolicyManager *)self btController]) {
    unsigned __int8 v4 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] powerState];
  }
  else {
    unsigned __int8 v4 = 0;
  }
  if ([(WCM_PolicyManager *)self rcu2Controller])
  {
    unsigned int v5 = [(WCM_RCU2Controller *)[(WCM_PolicyManager *)self rcu2Controller] mRCU2PowerOn];
    if (v4)
    {
LABEL_9:
      unint64_t v6 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] getNumberOfBTGameCtrlDev];
      +[WCM_Logging logLevel:2, @"Getting RCU2 radio status %d total controllers >= 2 ? %d", v5, v6 > 1 message];
      if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"RCU2DisableCTS2S")&& !-[WCM_RCU2Controller mRCU2ChannelActivity](-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "mRCU2ChannelActivity"))
      {
        +[WCM_Logging logLevel:2 message:@"Disabling RCU2 CTS2S"];
      }
      else
      {
        +[WCM_Logging logLevel:2 message:@"Enabling RCU2 CTS2S"];
        if (v6 > 1) {
          unsigned int v7 = v5;
        }
        else {
          unsigned int v7 = 0;
        }
        if (v7 == 1
          && (!v3
           || [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiState] != 2))
        {
          id v8 = [(WCM_RCU2Controller *)[(WCM_PolicyManager *)self rcu2Controller] getRC2BTTimingParam];
          unsigned int v9 = (_UNKNOWN **)[v8 objectAtIndex:0];
          uint64_t v10 = (_UNKNOWN **)[v8 objectAtIndex:1];
          uint64_t v11 = (_UNKNOWN **)[v8 objectAtIndex:2];
LABEL_24:
          v12[0] = v11;
          v12[1] = v9;
          v12[2] = v10;
          [(WCM_BTController *)[(WCM_PolicyManager *)self btController] updateBTRCU2TimingArray:+[NSArray arrayWithObjects:v12 count:3]];
          return;
        }
      }
      uint64_t v11 = &off_10023CCA8;
      unsigned int v9 = &off_10023CCA8;
      uint64_t v10 = &off_10023CCA8;
      goto LABEL_24;
    }
  }
  else
  {
    unsigned int v5 = 0;
    if (v4) {
      goto LABEL_9;
    }
  }

  +[WCM_Logging logLevel:2 message:@"BT is OFF"];
}

- (void)updateWiFiRCU2TimingArray
{
  if ([(WCM_PolicyManager *)self wifiController]) {
    unsigned __int8 v3 = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] powerState];
  }
  else {
    unsigned __int8 v3 = 0;
  }
  if ([(WCM_PolicyManager *)self btController]) {
    unsigned int v4 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] powerState];
  }
  else {
    unsigned int v4 = 0;
  }
  if ([(WCM_PolicyManager *)self rcu2Controller]) {
    unsigned int v5 = [(WCM_RCU2Controller *)[(WCM_PolicyManager *)self rcu2Controller] mRCU2PowerOn];
  }
  else {
    unsigned int v5 = 0;
  }
  BOOL v6 = [(WCM_WiFiService *)[(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiService] getP2pRCU2CoexEventStatus];
  [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiState];
  if (v4) {
    BOOL v7 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] getNumberOfBTGameCtrlDev] > 1;
  }
  else {
    BOOL v7 = 0;
  }
  if (v3)
  {
    +[WCM_Logging logLevel:2, @"Channel activity %lld", [(WCM_RCU2Controller *)[(WCM_PolicyManager *)self rcu2Controller] mRCU2ChannelActivity] message];
    if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"RCU2DisableCTS2S")&& !-[WCM_RCU2Controller mRCU2ChannelActivity](-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "mRCU2ChannelActivity"))
    {
      +[WCM_Logging logLevel:2, @"Disabling RCU2 CTS2S", v14 message];
    }
    else
    {
      +[WCM_Logging logLevel:2 message:@"Enabling RCU2 CTS2S"];
      +[WCM_Logging logLevel:2, @"P2pRCU2CoexEventInProgress(%d)", v6 message];
      if (v5 & v6)
      {
        +[WCM_Logging logLevel:2, @"Disabling CTS2S due to P2pRCU2CoexEventInProgress(%d)", v6 message];
      }
      else if (v5)
      {
        id v8 = [(WCM_RCU2Controller *)[(WCM_PolicyManager *)self rcu2Controller] getRC2WiFiTimingParam];
        unsigned int v9 = (_UNKNOWN **)[v8 objectAtIndex:0];
        uint64_t v10 = (_UNKNOWN **)[v8 objectAtIndex:1];
        uint64_t v11 = (_UNKNOWN **)[v8 objectAtIndex:2];
        CFStringRef v12 = (_UNKNOWN **)[v8 objectAtIndex:3];
        if (v7) {
          unint64_t v13 = v12;
        }
        else {
          unint64_t v13 = v11;
        }
        goto LABEL_27;
      }
    }
    unint64_t v13 = &off_10023CCA8;
    unsigned int v9 = &off_10023CCA8;
    uint64_t v10 = &off_10023CCA8;
LABEL_27:
    v15[0] = v13;
    v15[1] = v9;
    v15[2] = v10;
    [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] updateWiFiRCU2TimingArray:+[NSArray arrayWithObjects:v15 count:3]];
    +[WCM_Logging logLevel:2 message:@"Sent message to WiFi: RC2 grant params, updated GCs"];
    return;
  }

  +[WCM_Logging logLevel:2 message:@"WiFi is OFF"];
}

- (void)updateWiFiRCU2CoexParams
{
  if ([(WCM_PolicyManager *)self wifiController]
    && [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] powerState])
  {
    if ([(WCM_PolicyManager *)self rcu2Controller]
      && [(WCM_RCU2Controller *)[(WCM_PolicyManager *)self rcu2Controller] mRCU2PowerOn])
    {
      id v3 = [(WCM_RCU2Controller *)[(WCM_PolicyManager *)self rcu2Controller] getRC2WiFiTimingParam];
      +[WCM_Logging logLevel:2 message:@"updateWiFiRCU2CoexParams - not ignoring t3/t4 as channel activity is not 0"];
      unsigned int v4 = (_UNKNOWN **)[v3 objectAtIndex:0];
      unsigned int v5 = (_UNKNOWN **)[v3 objectAtIndex:1];
    }
    else
    {
      unsigned int v5 = &off_10023CCA8;
      unsigned int v4 = &off_10023CCA8;
    }
    v6[0] = [(WCM_RCU2Controller *)[(WCM_PolicyManager *)self rcu2Controller] getRC2CoexMode];
    v6[1] = v4;
    v6[2] = v5;
    v6[3] = +[NSNumber numberWithUnsignedInt:[(WCM_RCU2Controller *)[(WCM_PolicyManager *)self rcu2Controller] mRCU2ChannelNum]];
    [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] updateRCU2CoexParams:+[NSArray arrayWithObjects:v6 count:4]];
  }
}

- (void)handleWiFiRCU2Change
{
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"RCU2Support"))
  {
    if ([(WCM_PolicyManager *)self wifiController])
    {
      [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] didWiFiDeviceReset];
      unsigned int v3 = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] powerState];
      +[WCM_Logging logLevel:2, @"handleWiFiRCU2Change state change WiFi (%d) and RC2 (%d)", [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] powerState], [(WCM_RCU2Controller *)[(WCM_PolicyManager *)self rcu2Controller] mRCU2PowerOn] message];
      if (v3)
      {
        [(WCM_PolicyManager *)self updateWiFiRCU2CoexParams];
        [(WCM_PolicyManager *)self updateWiFiRCU2CoexMode];
        [(WCM_PolicyManager *)self updateWiFiRCU2PMProtectionMode];
        [(WCM_PolicyManager *)self updateWiFiRCU2ULOFDMAStatus];
      }
    }
    else
    {
      +[WCM_Logging logLevel:2, @"handleWiFiRCU2Change WiFi state change wifiReset (%d)", 0 message];
    }
  }
}

- (id)getNRrFemFrequencyRanges:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v4 = [(WCM_PolicyManager *)self platformManager];
  id v5 = objc_alloc_init((Class)NSMutableArray);
  if (v3)
  {
    id v6 = [(NSDictionary *)[(WCM_PlatformManager *)v4 wcmGen9rFemDefaultMode2gWiFiCellularbands] objectForKey:@"NR"];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v7 = [v6 countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v29;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v29 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = (double *)((char *)&unk_1001E8410
                         + 32
                         * [*(id *)(*((void *)&v28 + 1) + 8 * i) unsignedIntValue]);
          double v12 = v11[2];
          double v13 = v11[3];
          v35[0] = @"frequency_lower";
          v36[0] = +[NSNumber numberWithDouble:v12];
          v35[1] = @"frequency_upper";
          v36[1] = +[NSNumber numberWithDouble:v13];
          [v5 addObject:[+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, v35, 2)];
        }
        id v8 = [v6 countByEnumeratingWithState:&v28 objects:v37 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v14 = [(NSDictionary *)[(WCM_PlatformManager *)v4 wcmGen9rFemDefaultMode5gWiFiCellularbands] objectForKey:@"NR"];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v15 = [v14 countByEnumeratingWithState:&v24 objects:v34 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v25;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          unsigned int v19 = (double *)((char *)&unk_1001E8410
                         + 32
                         * [*(id *)(*((void *)&v24 + 1) + 8 * (void)j) unsignedIntValue]);
          double v20 = v19[2];
          double v21 = v19[3];
          v32[0] = @"frequency_lower";
          double v22 = +[NSNumber numberWithDouble:v20];
          v32[1] = @"frequency_upper";
          v33[0] = v22;
          v33[1] = +[NSNumber numberWithDouble:v21];
          [v5 addObject:[+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 2)];
        }
        id v16 = [v14 countByEnumeratingWithState:&v24 objects:v34 count:16];
      }
      while (v16);
    }
  }
  return v5;
}

- (unsigned)getWifiAntennaBitmapForPencilCoexByPlatform
{
  if ([(WCM_PlatformManager *)[(WCM_PolicyManager *)self platformManager] wrmPlatformId] == 170|| [(WCM_PlatformManager *)[(WCM_PolicyManager *)self platformManager] wrmPlatformId] == 168)
  {
    return 512;
  }
  if ([(WCM_PlatformManager *)[(WCM_PolicyManager *)self platformManager] wrmPlatformId] == 162|| [(WCM_PlatformManager *)[(WCM_PolicyManager *)self platformManager] wrmPlatformId] == 164|| [(WCM_PlatformManager *)[(WCM_PolicyManager *)self platformManager] wrmPlatformId] == 166)
  {
    return 128;
  }
  return 0;
}

- (unsigned)getBtBlockedAntennaForPencilCoexByPlatform
{
  if ([(WCM_PlatformManager *)[(WCM_PolicyManager *)self platformManager] wrmPlatformId] == 170|| [(WCM_PlatformManager *)[(WCM_PolicyManager *)self platformManager] wrmPlatformId] == 168)
  {
    return 14;
  }
  if ([(WCM_PlatformManager *)[(WCM_PolicyManager *)self platformManager] wrmPlatformId] == 162|| [(WCM_PlatformManager *)[(WCM_PolicyManager *)self platformManager] wrmPlatformId] == 164|| [(WCM_PlatformManager *)[(WCM_PolicyManager *)self platformManager] wrmPlatformId] == 166)
  {
    return 13;
  }
  return 0;
}

- (void)updatePencilCoexActivationCondition
{
  +[WCM_Logging logLevel:2 message:@"YYDebug_ check pencil coex activation condition"];
  BOOL v3 = [(WCM_PolicyManager *)self cellularController];
  if (![(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"EnableULCA"])goto LABEL_14; {
  +[WCM_Logging logLevel:2 message:@"YYDebug_ ENABLED_UL_CA"];
  }
  if (!v3 || (unsigned int v4 = [(WCM_CellularController *)v3 getActiveULCAConfig]) == 0)
  {
    +[WCM_Logging logLevel:0 message:@"YYDebug_ pencil coex Error: No ULCA config"];
    goto LABEL_14;
  }
  id v5 = v4;
  if (!v4->var1)
  {
LABEL_14:
    unsigned int v14 = 0;
    goto LABEL_15;
  }
  unint64_t v6 = 0;
  int v7 = 0;
  p_double var1 = &v4->var0[0].var1;
  do
  {
    double v9 = *(p_var1 - 1);
    double v10 = *p_var1 * 0.5;
    double v11 = v9 - v10;
    double v12 = v9 + v10;
    +[WCM_Logging logLevel:2, @"YYDebug_ Carrier %d, UL (%f, %f)", v6, v9 - v10, v9 + v10 message];
    if (v11 <= 2315.0 && v12 >= 2305.0) {
      int v7 = 1;
    }
    ++v6;
    p_var1 += 9;
  }
  while (v6 < v5->var1);
  unsigned int v14 = v7;
LABEL_15:
  [(WCM_CellularController *)v3 ulCenterFreq];
  if (v15 != 0.0)
  {
    [(WCM_CellularController *)v3 ulBandwidth];
    if (v16 != 0.0)
    {
      [(WCM_CellularController *)v3 ulCenterFreq];
      double v18 = v17;
      [(WCM_CellularController *)v3 ulBandwidth];
      double v20 = v19;
      [(WCM_CellularController *)v3 ulCenterFreq];
      double v22 = v21;
      [(WCM_CellularController *)v3 ulBandwidth];
      double v24 = v23;
      if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"EnableULCA"])
      {
        double v25 = v18 - v20 * 0.5;
        double v26 = v22 + v24 * 0.5;
      }
      else
      {
        [(WCM_CellularController *)v3 getCombinedUplinkFreqRange];
        double v26 = v25 + v27;
      }
      BOOL v28 = v26 >= 2305.0;
      if (v25 > 2315.0) {
        BOOL v28 = 0;
      }
      v14 |= v28;
    }
  }
  if (self->_pencilCoexActive == v14)
  {
    CFStringRef v29 = @"YYDebug_ No need to update pencil coex activation condition. Current condition is %d";
  }
  else
  {
    self->_pencilCoexActive = v14;
    CFStringRef v29 = @"YYDebug_ Need to update pencil coex activation condition to %d";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, v29, v14);
}

- (void)updateWifiAntennaSelectionV1V2Configs
{
  BOOL v3 = [(WCM_PolicyManager *)self platformManager];
  unsigned int v4 = [(WCM_PolicyManager *)self cellularController];
  if (![(WCM_PlatformManager *)v3 wcmWiFiCellCoexIssueTable]) {
    return;
  }
  if ([(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiState] < 2|| ([(WCM_CellularController *)v4 dlCenterFreq], v5 == 0.0)|| ([(WCM_CellularController *)v4 dlBandwidth], v6 == 0.0))
  {
    unsigned int v115 = 0;
    unsigned int v27 = 0;
    unsigned __int16 v104 = -4096;
    unsigned __int16 v106 = -8192;
    unsigned __int16 v108 = -12288;
    unsigned __int16 v110 = -20480;
    unsigned __int16 v112 = -24576;
    unsigned __int16 v28 = -28672;
    unsigned int v97 = 28672;
    unsigned int v99 = 24576;
    unsigned int v102 = 20480;
    unsigned int v29 = 12288;
    unsigned int v30 = 0x2000;
    unsigned int v31 = 4096;
    unsigned __int16 v32 = -16384;
    unsigned __int16 v117 = 0x8000;
    uint64_t v33 = 0x4000;
    LODWORD(v34) = 0x4000;
    unsigned __int16 v114 = 0x8000;
    unsigned __int16 v35 = -16384;
    goto LABEL_10;
  }
  [(WCM_CellularController *)v4 ulCenterFreq];
  if (v7 == 0.0) {
    return;
  }
  [(WCM_CellularController *)v4 ulBandwidth];
  if (v8 == 0.0) {
    return;
  }
  id v9 = (id)[(WCM_CellularController *)v4 bandInfoType];
  [(WCM_CellularController *)v4 dlCenterFreq];
  double v116 = v10;
  [(WCM_CellularController *)v4 dlBandwidth];
  double v12 = v11;
  [(WCM_CellularController *)v4 dlCenterFreq];
  double v14 = v13;
  [(WCM_CellularController *)v4 dlBandwidth];
  double v16 = v15;
  [(WCM_CellularController *)v4 ulCenterFreq];
  double v18 = v17;
  [(WCM_CellularController *)v4 ulBandwidth];
  double v20 = v19;
  [(WCM_CellularController *)v4 ulCenterFreq];
  double v22 = v21;
  [(WCM_CellularController *)v4 ulBandwidth];
  double v24 = v23;
  if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"EnableULCA"])
  {
    double v25 = v18 - v20 * 0.5;
    double v26 = v22 + v24 * 0.5;
  }
  else
  {
    [(WCM_CellularController *)v4 getCombinedUplinkFreqRange];
    double v25 = v47;
    double v26 = v47 + v48;
  }
  __int16 v118 = 0;
  if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiEnhCoexSupport"])
  {
    +[WCM_Logging logLevel:0 message:@"YYDebug_ executing v1/v2 wifi antenna selection in WiFiEnh platforms"];
    unsigned int v115 = 0;
    unsigned int v27 = 0;
    __int16 v49 = -4096;
    __int16 v50 = -8192;
    __int16 v51 = -12288;
    __int16 v52 = -20480;
    __int16 v53 = -24576;
    unsigned __int16 v28 = -28672;
    int v54 = 28672;
    int v55 = 24576;
    int v56 = 20480;
    unsigned int v29 = 12288;
    unsigned int v30 = 0x2000;
    unsigned int v31 = 4096;
    unsigned __int16 v32 = -16384;
    unsigned __int16 v117 = 0x8000;
    uint64_t v33 = 0x4000;
    goto LABEL_47;
  }
  id v58 = [(WCM_WiFiCellCoexIssueBandTable *)[(WCM_PlatformManager *)v3 wcmWiFiCellCoexIssueTable] findWiFiAntennaOrCellTxPowerConstraintCoexIssueByCellBandInfoType:v9 cellDlLowFreq:[(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiChannel] cellDlHighFreq:[(WCM_PolicyManager *)self gpsRadioActive] cellUlLowFreq:(char *)&v118 + 1 cellUlHighFreq:&v118 wifiChannel:v116 - v12 * 0.5 gpsRadioActive:v14 + v16 * 0.5 wifiAntennaConstraint:v25 cellTxPowerConstraint:v26];
  unsigned int v27 = 0;
  __int16 v49 = -4096;
  __int16 v50 = -8192;
  __int16 v51 = -12288;
  __int16 v52 = -20480;
  __int16 v53 = -24576;
  unsigned __int16 v28 = -28672;
  int v54 = 28672;
  int v55 = 24576;
  int v56 = 20480;
  unsigned int v29 = 12288;
  unsigned int v30 = 0x2000;
  unsigned int v31 = 4096;
  unsigned __int16 v32 = -16384;
  uint64_t v33 = 0x4000;
  unsigned int v115 = 0;
  unsigned __int16 v117 = 0x8000;
  if (!v58)
  {
    LODWORD(v34) = 0x4000;
    unsigned __int16 v114 = 0x8000;
    __int16 v57 = -16384;
    goto LABEL_49;
  }
  LODWORD(v34) = 0x4000;
  unsigned __int16 v114 = 0x8000;
  __int16 v57 = -16384;
  if (HIBYTE(v118))
  {
    id v59 = v58;
    if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"AntennaSelectionCoex"])
    {
      if ([v59 wifiUlAntennaBitmapOnCellLAT])
      {
        +[WCM_Logging logLevel:3 message:@"apply WiFi UL antenna constraint for Cellular primary antenna"];
        unsigned int v60 = [v59 wifiUlAntennaBitmapOnCellLAT];
        int v61 = (v60 << 7) | 0x2000;
        __int16 v62 = ((_WORD)v60 << 7) | 0xA000;
      }
      else
      {
        int v61 = 0;
        __int16 v62 = 0x8000;
      }
      unsigned __int16 v117 = v62;
      if ([v59 wifiUlAntennaBitmapOnCellUAT])
      {
        +[WCM_Logging logLevel:3 message:@"apply WiFi UL antenna constraint for Cellular secondary antenna"];
        unsigned int v66 = [v59 wifiUlAntennaBitmapOnCellUAT] << 7;
        uint64_t v33 = v66 | 0x6000;
        unsigned __int16 v32 = v66 | 0xE000;
      }
      else
      {
        unsigned __int16 v32 = -16384;
      }
      if ([v59 wifiDlAntennaBitmapOnCellLAT])
      {
        +[WCM_Logging logLevel:3 message:@"apply WiFi DL antenna constraint for Cellular primary antenna"];
        unsigned int v67 = [v59 wifiDlAntennaBitmapOnCellLAT] | 0x40;
        v61 |= v67;
        v117 |= v67;
      }
      unsigned int v115 = v61;
      if ([v59 wifiDlAntennaBitmapOnCellUAT])
      {
        +[WCM_Logging logLevel:3 message:@"apply WiFi DL antenna constraint for Cellular secondary antenna"];
        unsigned int v68 = [v59 wifiDlAntennaBitmapOnCellUAT];
        unsigned int v27 = 0;
        uint64_t v33 = v33 | v68 | 0x40;
        v32 |= (unsigned __int16)v68 | 0x40;
      }
      else
      {
        unsigned int v27 = 0;
      }
      __int16 v49 = -4096;
      __int16 v50 = -8192;
      __int16 v51 = -12288;
      __int16 v57 = -16384;
      __int16 v52 = -20480;
      __int16 v53 = -24576;
      unsigned __int16 v28 = -28672;
      unsigned __int16 v114 = 0x8000;
      int v54 = 28672;
      int v55 = 24576;
      int v56 = 20480;
      unsigned int v29 = 12288;
      goto LABEL_49;
    }
    float v63 = v59;
    if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"AntennaSelectionV1_1Coex"])
    {
      if ([v59 wifiUlAntennaBitmapOnCellLAT])
      {
        +[WCM_Logging logLevel:3 message:@"apply WiFi UL antenna constraint for Cellular primary antenna"];
        unsigned int v64 = [v59 wifiUlAntennaBitmapOnCellLAT];
        unsigned int v27 = (v64 << 6) | 0x800;
        __int16 v65 = ((_WORD)v64 << 6) | 0x8800;
      }
      else
      {
        unsigned int v27 = 0;
        __int16 v65 = 0x8000;
      }
      if ([v63 wifiUlAntennaBitmapOnCellUAT])
      {
        +[WCM_Logging logLevel:3 message:@"apply WiFi UL antenna constraint for Cellular secondary antenna"];
        unsigned int v69 = [v63 wifiUlAntennaBitmapOnCellUAT];
        unsigned int v31 = (v69 << 6) | 0x1800;
        unsigned __int16 v28 = ((_WORD)v69 << 6) | 0x9800;
      }
      else
      {
        unsigned __int16 v28 = -28672;
      }
      if ([v63 wifiDlAntennaBitmapOnCellLAT])
      {
        +[WCM_Logging logLevel:3 message:@"apply WiFi DL antenna constraint for Cellular primary antenna"];
        unsigned int v70 = [v63 wifiDlAntennaBitmapOnCellLAT] | 0x20;
        v27 |= v70;
        v65 |= v70;
      }
      unsigned __int16 v114 = v65;
      if ([v63 wifiDlAntennaBitmapOnCellUAT])
      {
        +[WCM_Logging logLevel:3 message:@"apply WiFi DL antenna constraint for Cellular secondary antenna"];
        unsigned int v71 = [v63 wifiDlAntennaBitmapOnCellUAT];
        unsigned int v115 = 0;
        v31 |= v71 | 0x20;
        v28 |= (unsigned __int16)v71 | 0x20;
      }
      else
      {
        unsigned int v115 = 0;
      }
      __int16 v49 = -4096;
      __int16 v50 = -8192;
      __int16 v51 = -12288;
      __int16 v52 = -20480;
      __int16 v53 = -24576;
      int v54 = 28672;
      int v55 = 24576;
      int v56 = 20480;
      unsigned __int16 v32 = -16384;
      unsigned __int16 v117 = 0x8000;
      LODWORD(v34) = 0x4000;
      goto LABEL_48;
    }
    if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"AntennaSelectionV2Coex"]&& ![(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiEnhCoexSupport"])
    {
      if ([v59 wifiUlAntennaBitmapOnCellAntBitmap000])
      {
        +[WCM_Logging logLevel:3 message:@"apply WiFi UL antenna constraint for Cellular Antenna Bitmap 000"];
        unsigned int v72 = [v59 wifiUlAntennaBitmapOnCellAntBitmap000];
        unsigned int v27 = (v72 << 6) | 0x800;
        __int16 v73 = ((_WORD)v72 << 6) | 0x8800;
      }
      else
      {
        unsigned int v27 = 0;
        __int16 v73 = 0x8000;
      }
      if ([v59 wifiUlAntennaBitmapOnCellAntBitmap001])
      {
        +[WCM_Logging logLevel:3 message:@"apply WiFi UL antenna constraint for Cellular Antenna bitmap 001"];
        unsigned int v74 = [v59 wifiUlAntennaBitmapOnCellAntBitmap001];
        int v95 = (v74 << 6) | 0x1800;
        __int16 v96 = ((_WORD)v74 << 6) | 0x9800;
      }
      else
      {
        __int16 v96 = -28672;
        int v95 = 4096;
      }
      if ([v59 wifiUlAntennaBitmapOnCellAntBitmap010])
      {
        +[WCM_Logging logLevel:3 message:@"apply WiFi UL antenna constraint for Cellular Antenna bitmap 010"];
        unsigned int v75 = [v59 wifiUlAntennaBitmapOnCellAntBitmap010];
        int v93 = (v75 << 6) | 0x2800;
        __int16 v113 = ((_WORD)v75 << 6) | 0xA800;
      }
      else
      {
        __int16 v113 = -24576;
        int v93 = 0x2000;
      }
      if ([v59 wifiUlAntennaBitmapOnCellAntBitmap011])
      {
        +[WCM_Logging logLevel:3 message:@"apply WiFi UL antenna constraint for Cellular Antenna bitmap 011"];
        unsigned int v76 = [v59 wifiUlAntennaBitmapOnCellAntBitmap011];
        int v92 = (v76 << 6) | 0x3800;
        __int16 v111 = ((_WORD)v76 << 6) | 0xB800;
      }
      else
      {
        __int16 v111 = -20480;
        int v92 = 12288;
      }
      if ([v59 wifiUlAntennaBitmapOnCellAntBitmap100])
      {
        +[WCM_Logging logLevel:3 message:@"apply WiFi UL antenna constraint for Cellular Antenna bitmap 100"];
        unsigned int v77 = [v59 wifiUlAntennaBitmapOnCellAntBitmap100];
        int v91 = (v77 << 6) | 0x4800;
        __int16 v78 = ((_WORD)v77 << 6) | 0xC800;
      }
      else
      {
        __int16 v78 = -16384;
        int v91 = 0x4000;
      }
      if ([v63 wifiUlAntennaBitmapOnCellAntBitmap101])
      {
        +[WCM_Logging logLevel:3 message:@"apply WiFi UL antenna constraint for Cellular Antenna bitmap 101"];
        unsigned int v79 = [v63 wifiUlAntennaBitmapOnCellAntBitmap101];
        int v103 = (v79 << 6) | 0x5800;
        __int16 v109 = ((_WORD)v79 << 6) | 0xD800;
      }
      else
      {
        __int16 v109 = -12288;
        int v103 = 20480;
      }
      if ([v63 wifiUlAntennaBitmapOnCellAntBitmap110])
      {
        +[WCM_Logging logLevel:3 message:@"apply WiFi UL antenna constraint for Cellular Antenna bitmap 110"];
        unsigned int v80 = [v63 wifiUlAntennaBitmapOnCellAntBitmap110];
        int v101 = (v80 << 6) | 0x6800;
        __int16 v107 = ((_WORD)v80 << 6) | 0xE800;
      }
      else
      {
        __int16 v107 = -8192;
        int v101 = 24576;
      }
      if ([v63 wifiUlAntennaBitmapOnCellAntBitmap111])
      {
        +[WCM_Logging logLevel:3 message:@"apply WiFi UL antenna constraint for Cellular Antenna bitmap 111"];
        unsigned int v81 = [v63 wifiUlAntennaBitmapOnCellAntBitmap111];
        int v98 = (v81 << 6) | 0x7800;
        __int16 v105 = ((_WORD)v81 << 6) | 0xF800;
      }
      else
      {
        __int16 v105 = -4096;
        int v98 = 28672;
      }
      if ([v63 wifiDlAntennaBitmapOnCellAntBitmap000])
      {
        +[WCM_Logging logLevel:3 message:@"apply WiFi DL antenna constraint for Cellular Antenna Bitmap 000"];
        unsigned int v82 = [v63 wifiDlAntennaBitmapOnCellAntBitmap000] | 0x20;
        v27 |= v82;
        v73 |= v82;
      }
      if ([v63 wifiDlAntennaBitmapOnCellAntBitmap001])
      {
        +[WCM_Logging logLevel:3 message:@"apply WiFi DL antenna constraint for Cellular Antenna bitmap 001"];
        unsigned int v83 = [v63 wifiDlAntennaBitmapOnCellAntBitmap001] | 0x20;
        v95 |= v83;
        v96 |= v83;
      }
      if ([v63 wifiDlAntennaBitmapOnCellAntBitmap010])
      {
        +[WCM_Logging logLevel:3 message:@"apply WiFi DL antenna constraint for Cellular Antenna bitmap 010"];
        unsigned int v84 = [v63 wifiDlAntennaBitmapOnCellAntBitmap010] | 0x20;
        v93 |= v84;
        v113 |= v84;
      }
      if ([v63 wifiDlAntennaBitmapOnCellAntBitmap011])
      {
        +[WCM_Logging logLevel:3 message:@"apply WiFi DL antenna constraint for Cellular Antenna bitmap 011"];
        unsigned int v85 = [v63 wifiDlAntennaBitmapOnCellAntBitmap011] | 0x20;
        v92 |= v85;
        v111 |= v85;
      }
      if ([v63 wifiDlAntennaBitmapOnCellAntBitmap100])
      {
        +[WCM_Logging logLevel:3 message:@"apply WiFi DL antenna constraint for Cellular Antenna bitmap 100"];
        unsigned int v86 = [v63 wifiDlAntennaBitmapOnCellAntBitmap100] | 0x20;
        v91 |= v86;
        v78 |= v86;
      }
      if ([v63 wifiDlAntennaBitmapOnCellAntBitmap101])
      {
        +[WCM_Logging logLevel:3 message:@"apply WiFi DL antenna constraint for Cellular Antenna bitmap 101"];
        unsigned int v87 = [v63 wifiDlAntennaBitmapOnCellAntBitmap101] | 0x20;
        v103 |= v87;
        v109 |= v87;
      }
      if ([v63 wifiDlAntennaBitmapOnCellAntBitmap110])
      {
        +[WCM_Logging logLevel:3 message:@"apply WiFi DL antenna constraint for Cellular Antenna bitmap 110"];
        unsigned int v88 = [v63 wifiDlAntennaBitmapOnCellAntBitmap110] | 0x20;
        v101 |= v88;
        v107 |= v88;
      }
      unsigned __int16 v114 = v73;
      if ([v63 wifiDlAntennaBitmapOnCellAntBitmap111])
      {
        +[WCM_Logging logLevel:3 message:@"apply WiFi DL antenna constraint for Cellular Antenna bitmap 111"];
        unsigned int v89 = [v63 wifiDlAntennaBitmapOnCellAntBitmap111];
        unsigned int v115 = 0;
        int v55 = v101;
        int v54 = v98 | v89 | 0x20;
        __int16 v50 = v107;
        __int16 v49 = v105 | v89 | 0x20;
        unsigned __int16 v32 = -16384;
        unsigned __int16 v117 = 0x8000;
        unsigned __int16 v28 = v96;
        __int16 v52 = v111;
        __int16 v53 = v113;
        unsigned int v30 = v93;
        unsigned int v31 = v95;
        __int16 v51 = v109;
        unsigned int v29 = v92;
        int v56 = v103;
      }
      else
      {
        unsigned int v115 = 0;
        unsigned __int16 v32 = -16384;
        unsigned __int16 v117 = 0x8000;
        unsigned __int16 v28 = v96;
        __int16 v52 = v111;
        __int16 v53 = v113;
        unsigned int v30 = v93;
        unsigned int v31 = v95;
        __int16 v50 = v107;
        __int16 v51 = v109;
        __int16 v49 = v105;
        unsigned int v29 = v92;
        int v55 = v101;
        int v56 = v103;
        int v54 = v98;
      }
      LODWORD(v34) = v91;
      __int16 v57 = v78;
      goto LABEL_49;
    }
    +[WCM_Logging logLevel:2 message:@"YYDebug_ WiFi antenna selection is not supported"];
    unsigned int v115 = 0;
    unsigned int v27 = 0;
    __int16 v49 = -4096;
    __int16 v50 = -8192;
    __int16 v51 = -12288;
    __int16 v52 = -20480;
    __int16 v53 = -24576;
    unsigned __int16 v28 = -28672;
    int v54 = 28672;
    int v55 = 24576;
    int v56 = 20480;
    unsigned __int16 v32 = -16384;
    unsigned __int16 v117 = 0x8000;
LABEL_47:
    LODWORD(v34) = 0x4000;
    unsigned __int16 v114 = 0x8000;
LABEL_48:
    __int16 v57 = -16384;
  }
LABEL_49:
  unsigned int v99 = v55;
  unsigned int v102 = v56;
  unsigned __int16 v35 = v57;
  unsigned int v97 = v54;
  unsigned __int16 v104 = v49;
  unsigned __int16 v106 = v50;
  unsigned __int16 v108 = v51;
  unsigned __int16 v110 = v52;
  unsigned __int16 v112 = v53;
LABEL_10:
  if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"AntennaSelectionCoex"])
  {
    +[WCM_Logging logLevel:3, @"Trying to update antenna selection bitmaps 0x%x 0x%x 0x%x 0x%x", v115, v33, v117, v32 message];
    double v36 = [(WCM_PolicyManager *)self wifiController];
    v120[0] = +[NSNumber numberWithUnsignedShort:v115];
    v120[1] = +[NSNumber numberWithUnsignedShort:v33];
    v120[2] = +[NSNumber numberWithUnsignedShort:v117];
    v120[3] = +[NSNumber numberWithUnsignedShort:v32];
    [(WCM_WiFiController *)v36 updateAntennaSelection:+[NSArray arrayWithObjects:v120 count:4]];
  }
  else if (([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"AntennaSelectionV2Coex"]|| [(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"AntennaSelectionV1_1Coex"])&& ![(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiEnhCoexSupport"])
  {
    if ([(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiState] == 2)
    {
      unsigned __int16 v104 = -4096;
      unsigned __int16 v106 = -8192;
      unsigned __int16 v108 = -12288;
      unsigned __int16 v35 = -16384;
      unsigned __int16 v110 = -20480;
      unsigned __int16 v112 = -24576;
      unsigned __int16 v28 = -28672;
      unsigned __int16 v114 = 0x8000;
    }
    unsigned int v37 = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] wifiState];
    if (v37 == 3) {
      uint64_t v38 = 0;
    }
    else {
      uint64_t v38 = v27;
    }
    if (v37 == 3) {
      uint64_t v39 = 4096;
    }
    else {
      uint64_t v39 = v31;
    }
    if (v37 == 3) {
      uint64_t v40 = 0x2000;
    }
    else {
      uint64_t v40 = v30;
    }
    if (v37 == 3) {
      uint64_t v41 = 12288;
    }
    else {
      uint64_t v41 = v29;
    }
    if (v37 == 3) {
      uint64_t v34 = 0x4000;
    }
    else {
      uint64_t v34 = v34;
    }
    if (v37 == 3) {
      uint64_t v42 = 20480;
    }
    else {
      uint64_t v42 = v102;
    }
    if (v37 == 3) {
      uint64_t v43 = 24576;
    }
    else {
      uint64_t v43 = v99;
    }
    if (v37 == 3) {
      uint64_t v44 = 28672;
    }
    else {
      uint64_t v44 = v97;
    }
    unsigned int v94 = v28;
    unsigned int v100 = v35;
    uint64_t v90 = v28;
    uint64_t v45 = v44;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 1, @"Trying to update antenna selection V2 bitmaps 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x", v38, v39, v40, v41, v34, v42, v43, v44, v114, v90, v112, v110, v35, v108, v106,
      v104);
    double v46 = [(WCM_PolicyManager *)self wifiController];
    v119[0] = +[NSNumber numberWithUnsignedShort:v38];
    v119[1] = +[NSNumber numberWithUnsignedShort:v39];
    v119[2] = +[NSNumber numberWithUnsignedShort:v40];
    v119[3] = +[NSNumber numberWithUnsignedShort:v41];
    v119[4] = +[NSNumber numberWithUnsignedShort:v34];
    v119[5] = +[NSNumber numberWithUnsignedShort:v42];
    v119[6] = +[NSNumber numberWithUnsignedShort:v43];
    v119[7] = +[NSNumber numberWithUnsignedShort:v45];
    v119[8] = +[NSNumber numberWithUnsignedShort:v114];
    v119[9] = +[NSNumber numberWithUnsignedShort:v94];
    v119[10] = +[NSNumber numberWithUnsignedShort:v112];
    v119[11] = +[NSNumber numberWithUnsignedShort:v110];
    v119[12] = +[NSNumber numberWithUnsignedShort:v100];
    v119[13] = +[NSNumber numberWithUnsignedShort:v108];
    v119[14] = +[NSNumber numberWithUnsignedShort:v106];
    v119[15] = +[NSNumber numberWithUnsignedShort:v104];
    [(WCM_WiFiController *)v46 updateAntennaSelectionV2:+[NSArray arrayWithObjects:v119 count:16]];
  }
  else
  {
    +[WCM_Logging logLevel:2 message:@"YYDebug_ WiFi antenna selection is not supported"];
  }
}

- (void)configureBTAntennaSelection
{
  +[WCM_Logging logLevel:2, @"YYDebug_ configureBTAntennaSelection: BT power state = %d, ", [(WCM_BTController *)[(WCM_PolicyManager *)self btController] powerState] message];
  if (self->_pencilCoexActive)
  {
    uint64_t v3 = [(WCM_PolicyManager *)self getBtBlockedAntennaForPencilCoexByPlatform];
    +[WCM_Logging logLevel:2 message:@"YYDebug_ enable BT pencil coex mitigation config"];
    unsigned int v4 = [(WCM_PolicyManager *)self btController];
    uint64_t v5 = 1;
    uint64_t v6 = v3;
    uint64_t v7 = v3;
  }
  else
  {
    +[WCM_Logging logLevel:2 message:@"YYDebug_ disable BT pencil coex mitigation config"];
    unsigned int v4 = [(WCM_PolicyManager *)self btController];
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }

  [(WCM_BTController *)v4 updatePencilCoexAntennaSelectionPolicy:v5 param1:v6 param2:v7];
}

- (void)handleWiFiPowerStateChange
{
  unsigned int v3 = [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] powerState];
  unsigned int v4 = "off";
  if (v3) {
    unsigned int v4 = "on";
  }
  +[WCM_Logging logLevel:5, @"Updating policy for WiFi power %s", v4 message];
  uint64_t v5 = [(WCM_PolicyManager *)self cellularController];
  [(WCM_PolicyManager *)self configureForLTECDRXWiFiTimeSharing];
  if ([(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] powerState]
    || [(WCM_BTController *)[(WCM_PolicyManager *)self btController] powerState])
  {
    [(WCM_CellularController *)v5 updateWCI2CoexPolicy:[(WCM_PolicyManager *)self cellularWCI2CoexPolicyBitmap]];
    [(WCM_PolicyManager *)self sendRCU2UpdateMessage];
  }
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"WifiBtAgcCoexMode")&& -[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState"))
  {
    +[WCM_Logging logLevel:4, @"2nd place self.wifiAgcCoexModeLevel is %d", [(NSNumber *)[(WCM_PolicyManager *)self wifiAgcCoexModeLevel] intValue] message];
    [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] setWifiAgcCoexMode:[(WCM_PolicyManager *)self wifiAgcCoexModeLevel]];
  }
  if ([(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] powerState])
  {
    [(WCM_PolicyManager *)self updateWiFiBTConnectionReport];
  }
  else if (_os_feature_enabled_impl())
  {
    [(WCM_BTController *)[(WCM_PolicyManager *)self btController] updateWiFiChannelInfo:0 bandwidth:0 regBand:0];
  }

  [(WCM_PolicyManager *)self handleWiFiConfigChange];
}

- (BOOL)isWiFiChannel:(int)a3 inChannelMap:(id)a4
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(a4);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) intValue] == a3)
        {
          LOBYTE(v6) = 1;
          return (char)v6;
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v6 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      id v7 = v6;
      if (v6) {
        continue;
      }
      break;
    }
  }
  return (char)v6;
}

- (id)legacyWiFiChannelsToAvoidForIMD2GPS
{
  id v3 = +[NSMutableArray array];
  if ([(WCM_PolicyManager *)self isCellularOnGPSIMDBand])
  {
    LODWORD(v4) = 0;
    do
    {
      uint64_t v5 = [(WCM_PolicyManager *)self platformManager];
      [(WCM_CellularController *)[(WCM_PolicyManager *)self cellularController] cachedULCenterFreq];
      double v7 = v6;
      [(WCM_CellularController *)[(WCM_PolicyManager *)self cellularController] cachedULBandwidth];
      if ([(WCM_PlatformManager *)v5 isIMD2ForFirstFreq:v7 firstBW:v8 secondFreq:(double)(5 * (int)v4 + 2412) secondBW:20.0 resultantFreq:1575.42 resultantBW:4.092])
      {
        uint64_t v4 = (v4 + 1);
        [v3 addObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4)]];
      }
      else
      {
        LODWORD(v4) = v4 + 1;
      }
    }
    while (v4 != 13);
  }
  +[WCM_Logging logLevel:4, @"Block Listed Channels for IMD2 GPS: %@", v3 message];
  return v3;
}

- (id)legacyWiFiChannelsToAvoidFor3FoWiFi
{
  id v3 = +[NSMutableArray array];
  if ([(WCM_PolicyManager *)self isCellularOnWiFi3FoBand])
  {
    LODWORD(v4) = 0;
    do
    {
      uint64_t v5 = [(WCM_PolicyManager *)self platformManager];
      [(WCM_CellularController *)[(WCM_PolicyManager *)self cellularController] cachedULCenterFreq];
      double v7 = v6;
      [(WCM_CellularController *)[(WCM_PolicyManager *)self cellularController] cachedULBandwidth];
      if ([(WCM_PlatformManager *)v5 is3FoForFreq:v7 bw:v8 resultantFreq:(double)(5 * (int)v4 + 2412) resultantBW:20.0])
      {
        uint64_t v4 = (v4 + 1);
        [v3 addObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4)]];
      }
      else
      {
        LODWORD(v4) = v4 + 1;
      }
    }
    while (v4 != 13);
  }
  +[WCM_Logging logLevel:4, @"Block Listed Channels for 3Fo WiFi: %@", v3 message];
  return v3;
}

- (id)legacyWiFiChannelsToAvoidForIMD3Cell
{
  id v3 = [(WCM_PolicyManager *)self cellularController];
  id v4 = +[NSMutableArray array];
  if ([(WCM_PolicyManager *)self isCellularOnIMD3CellBand])
  {
    [(WCM_CellularController *)v3 cachedULCenterFreq];
    double v6 = v5;
    [(WCM_CellularController *)v3 cachedULBandwidth];
    double v8 = v7;
    [(WCM_CellularController *)v3 dlCenterFreq];
    double v10 = v9;
    [(WCM_CellularController *)v3 dlBandwidth];
    double v12 = v11;
    +[WCM_Logging logLevel:4, @"Find Block Listed Channels for IMD3 Cell UlCenterFreq(%lf) UlBandwidth(%lf) DlCenterFreq(%lf) DlBandwidth(%lf)", *(void *)&v6, *(void *)&v8, *(void *)&v10, *(void *)&v11 message];
    LODWORD(v3) = 0;
    do
    {
      if ([(WCM_PlatformManager *)[(WCM_PolicyManager *)self platformManager] isIMD3ForFirstFreq:v6 firstBW:v8 secondFreq:(double)(5 * (int)v3 + 2412) secondBW:20.0 resultantFreq:v10 resultantBW:v12])
      {
        id v3 = (WCM_CellularController *)(v3 + 1);
        [v4 addObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3)];
      }
      else
      {
        LODWORD(v3) = v3 + 1;
      }
    }
    while (v3 != 13);
    if (sub_10008C87C(v4))
    {
      if (v6 >= 2550.0) {
        long long v13 = &off_10023D020;
      }
      else {
        long long v13 = &off_10023D110;
      }
      [v4 removeObject:v13];
      +[WCM_Logging logLevel:4, @"removing channel %@ for UlCenterFreq %lf", v13, *(void *)&v6 message];
    }
  }
  +[WCM_Logging logLevel:4, @"Block Listed Channels for IMD3 Cell: %@", v4 message];
  return v4;
}

- (void)submitWiFiBTCoexMetrics:(unsigned __int16)a3
{
  if ([(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] powerState]) {
    [(WCM_WiFiController *)[(WCM_PolicyManager *)self wifiController] getWiFiBTSharedAntennaDisabledStatus];
  }
  id v4 = [(WCM_PolicyManager *)self btController];

  [(WCM_BTController *)v4 powerState];
}

- (void)handleMedtronicConnection
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, @"External : In handleMBTConnection; connection status = %d",
    [(WCM_ExternalAccessory *)self->_extAccessory eaConnection]);
  id v3 = [(WCM_PolicyManager *)self wifiController];
  uint64_t v4 = [(WCM_ExternalAccessory *)self->_extAccessory eaConnection];

  [(WCM_WiFiController *)v3 updateMedtronicState:v4];
}

- (void)handleCCConnectionUpdate
{
  +[WCM_Logging logLevel:4 message:@"Sac Driver: handleCCConnectionUpdate"];
  if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"CTSacDriverNeedWiFiFreq"])
  {
    [(WCM_PolicyManager *)self setSacWifiFrequency:0];
    [(WCM_PolicyManager *)self updateCTSacDriverRemoveAllFrequenciesFromClient:1];
    [(WCM_PolicyManager *)self updateCTSacDriverWifiInfo];
  }
  if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"CTSacDriverNeedGpsFreq"]|| [(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"AntennaTuningForGpsBB20"])
  {
    [(WCM_PolicyManager *)self updateGPSBandsInfo:0 CLUpdate:0];
  }
}

- (void)updateCTSacDriverWifiInfo
{
  id v3 = [(WCM_PolicyManager *)self wifiController];
  id v4 = (id)[(WCM_WiFiController *)v3 wifiState];
  id v5 = (id)[(WCM_WiFiController *)v3 wifiChannel];
  id v6 = (id)[(WCM_WiFiController *)v3 reportedChannelCenterFreqMHz];
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v13 = objc_alloc_init((Class)NSMutableArray);
  +[WCM_Logging logLevel:3, @"Sac Driver: updateCTSacDriverWifiInfo Wifi frequency details wifistate = %d channel = %d st.frequency = %d re.Frequency = %d recal.frequency = %d\n", v4, v5, self->_sacWifiFrequency, v6, [(WCM_WiFiController *)v3 channelCenterFreqMHz] message];
  if ([(WCM_PolicyManager *)self sacWifiFrequency] != v6)
  {
    if ([(WCM_PolicyManager *)self sacWifiFrequency])
    {
      uint64_t v8 = [(WCM_PolicyManager *)self sacWifiFrequency];
      [(WCM_PolicyManager *)self setSacWifiFrequency:0];
      if (!v6)
      {
        uint64_t v9 = 2;
        +[WCM_Logging logLevel:3, @"Sac Driver: updateCTSacDriverWifiInfo-2 F.remove %d F.add %d Oper %d\n", v8, 0, 2 message];
        goto LABEL_11;
      }
      uint64_t v9 = 3;
    }
    else
    {
      if (!v6)
      {
        +[WCM_Logging logLevel:3, @"Sac Driver: updateCTSacDriverWifiInfo-2 F.remove %d F.add %d Oper %d\n", 0, 0, 0 message];
        goto LABEL_12;
      }
      uint64_t v8 = 0;
      uint64_t v9 = 1;
    }
    [v7 addObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v6)]];
    [v13 addObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 20)]];
    [(WCM_PolicyManager *)self setSacWifiFrequency:v6];
    +[WCM_Logging logLevel:3, @"Sac Driver: updateCTSacDriverWifiInfo-2 F.remove %d F.add %d Oper %d\n", v8, v6, v9 message];
LABEL_11:
    [(WCM_PolicyManager *)self updateCTSacDriver:v9 frequencyToAdd:v7 frequencyToAddBw:v13 frequencytoRemove:v8 client:1];
    goto LABEL_12;
  }
  +[WCM_Logging logLevel:3, @"Sac Driver:_conditions did not match for initiating SAC access", v10, v11, v12 message];
LABEL_12:
  [v7 removeAllObjects];
  [v13 removeAllObjects];
}

- (void)updateCTSacDriver:(int)a3 frequencyToAdd:(id)a4 frequencyToAddBw:(id)a5 frequencytoRemove:(unsigned int)a6 client:(unsigned __int8)a7
{
  uint64_t v7 = a7;
  uint64_t v8 = *(void *)&a6;
  char v11 = a3;
  +[WCM_Logging logLevel:3, @"Sac Driver: updateCTSacDriver Operation = %d\n", *(void *)&a3 message];
  uint64_t v12 = (const void *)_CTServerConnectionCreate();
  _CTServerConnectionGetCommCenterInitializationState();
  _CTServerConnectionSendBarrier();
  +[WCM_Logging logLevel:0 message:@"Sac Driver: WARNING!!! CommCenter is in a reset state!!"];
  if (v12)
  {
    if ((v11 & 2) != 0)
    {
      if (v8)
      {
        unint64_t v13 = _CTServerConnectionRemoveVictimFreq();
        +[WCM_Logging logLevel:2, @"Sac Driver: Removing frequency %lu for client %d \n", v8, v7, 0, 0, 0, 0, 0 message];
        if (HIDWORD(v13)) {
          +[WCM_Logging logLevel:0, @"Sac Driver:_CTServerConnectionRemoveVictimFreq: error: %d, domain: %d", HIDWORD(v13), v13 message];
        }
      }
    }
    _CTServerConnectionSendBarrier();
    if ([a4 count])
    {
      uint64_t v14 = 0;
      int v15 = 0;
      unint64_t v16 = 0;
      unint64_t v17 = 0;
      do
      {
        id v18 = [[a4 objectAtIndex:v14] unsignedIntValue];
        [objc_msgSend(a5, "objectAtIndex:", v14) unsignedIntValue];
        if ((v11 & 1) != 0 && v18)
        {
          unint64_t v16 = _CTServerConnectionAddVictimFreq();
          unint64_t v17 = HIDWORD(v16);
          +[WCM_Logging logLevel:2, @"Sac Driver: Adding frequency  %d for client %d\n", v18, v7 message];
        }
        if (v17) {
          +[WCM_Logging logLevel:0, @"Sac Driver:_CTServerConnectionAddVictimFreq: error: %d, domain: %d", v17, v16 message];
        }
        uint64_t v14 = ++v15;
      }
      while ((unint64_t)[a4 count] > v15);
    }
    CFRelease(v12);
  }
  else
  {
    +[WCM_Logging logLevel:0 message:@"Sac Driver: Unable to create connection to CTServer - may be CommCenter is unloaded?\n"];
  }
}

- (void)updateCTSacDriverRemoveAllFromWifiClient
{
  if ([(WCM_PolicyManager *)self sacWifiFrequency])
  {
    [(WCM_PolicyManager *)self updateCTSacDriverRemoveAllFrequenciesFromClient:1];
    [(WCM_PolicyManager *)self setSacWifiFrequency:0];
  }
}

- (void)updateCTSacDriverRemoveAllFrequenciesFromClient:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  +[WCM_Logging logLevel:3 message:@"Sac Driver: Removing all frequencies"];
  id v4 = (const void *)_CTServerConnectionCreate();
  _CTServerConnectionGetCommCenterInitializationState();
  _CTServerConnectionSendBarrier();
  +[WCM_Logging logLevel:0 message:@"Sac Driver: WARNING!!! CommCenter is in a reset state!!"];
  if (v4)
  {
    unint64_t v5 = _CTServerConnectionClearVictimFreq();
    +[WCM_Logging logLevel:4, @"Sac Driver: Clearning frequency for client %d", v3 message];
    if (HIDWORD(v5)) {
      +[WCM_Logging logLevel:0, @"Sac Driver:_CTServerConnectionRemoveVictimFreq: error: %d, domain: %d", HIDWORD(v5), v5, 0, 0, 0, 0, 0 message];
    }
    CFRelease(v4);
  }
  else
  {
    +[WCM_Logging logLevel:0 message:@"Sac Driver: Unable to create connection to CTServer - may be CommCenter is unloaded?\n"];
  }
}

- (void)updateGpsbandsInfoForBB
{
  unsigned int v3 = [(WCM_PolicyManager *)self cellularController];
  if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"AntennaTuningForGpsBB20"])
  {
    LOBYTE(v4) = 4;
    +[WCM_Logging logLevel:4, @"BB20: updateGpsbandsInfoForBB: Count =  %d\n", [(NSMutableArray *)[(WCM_PolicyManager *)self gpsBandInfoList] count] message];
    if ([(NSMutableArray *)[(WCM_PolicyManager *)self gpsBandInfoList] count])
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      unint64_t v5 = [(WCM_PolicyManager *)self gpsBandInfoList];
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v6)
      {
        id v7 = v6;
        int v8 = 0;
        char v9 = 0;
        char v21 = 0;
        uint64_t v10 = *(void *)v25;
        int v4 = 4;
        int v11 = 4;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v25 != v10) {
              objc_enumerationMutation(v5);
            }
            unint64_t v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            long long v22 = 0u;
            long long v23 = 0u;
            [v13 getValue:&v22];
            if (v22 == 2)
            {
              v8 |= 2u;
              if (DWORD2(v23) == 512) {
                int v15 = 2;
              }
              else {
                int v15 = v4;
              }
              char v21 = 1;
              if (DWORD2(v23) == 256) {
                int v4 = 1;
              }
              else {
                int v4 = v15;
              }
            }
            else if (v22 == 1)
            {
              v8 |= 1u;
              if (DWORD2(v23) == 512) {
                int v14 = 2;
              }
              else {
                int v14 = v11;
              }
              if (DWORD2(v23) == 256) {
                int v11 = 1;
              }
              else {
                int v11 = v14;
              }
              char v9 = 1;
            }
          }
          id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v7);
      }
      else
      {
        LOBYTE(v8) = 0;
        char v9 = 0;
        char v21 = 0;
        LOBYTE(v4) = 4;
        LOBYTE(v11) = 4;
      }
      uint64_t v16 = v9 & 1;
      uint64_t v17 = v21 & 1;
    }
    else
    {
      LOBYTE(v8) = 0;
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      LOBYTE(v11) = 4;
    }
    BOOL v18 = [(WCM_BTController *)[(WCM_PolicyManager *)self btController] getNum2GHzAclA2DPDevices] != 0;
    +[WCM_Logging logLevel:1, @"BB20: updateGpsbandsInfoForBB: L1enabled = %d, L5Enabled = %d, btA2DPEnabled = %d, l5Level = %d, l1Level = %d\n", v16, v17, v18, v4, v11 message];
    [(WCM_CellularController *)v3 setGpsBandInfoToBB:v16 l5Enabled:v17 btA2DPEnabled:v18 l5Level:v4];
    if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"CoexBBUnifiedSensorInfoSupport"])
    {
      unsigned int v19 = [(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"AntennaTunningForGpsL1Level"];
      char v20 = 16 * v11;
      if (!v19) {
        char v20 = 0;
      }
      [(WCM_CellularController *)v3 sendBBCoexSensorMessage:0 band:v8 usecase:v20 & 0xF0 | v4 & 0xFu];
    }
  }
}

- (void)updateGpsbandsInfoForBBv2
{
  CFDictionaryRef v2 = self;
  char v21 = [(WCM_PolicyManager *)self cellularController];
  uint64_t v3 = 4;
  +[WCM_Logging logLevel:4, @"BB20: updateGpsbandsInfoForBBv2: Count =  %lu\n", [(NSMutableArray *)[(WCM_PolicyManager *)v2 gpsBandInfoList] count] message];
  if ([(NSMutableArray *)[(WCM_PolicyManager *)v2 gpsBandInfoList] count])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    char v20 = v2;
    obj = [(WCM_PolicyManager *)v2 gpsBandInfoList];
    id v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v4)
    {
      id v5 = v4;
      int v6 = 0;
      char v7 = 0;
      char v8 = 0;
      uint64_t v9 = *(void *)v26;
      uint64_t v3 = 4;
      uint64_t v10 = 4;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          uint64_t v12 = v10;
          uint64_t v13 = v3;
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(obj);
          }
          int v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          long long v23 = 0u;
          long long v24 = 0u;
          [v14 getValue:&v23];
          int v15 = v23;
          +[WCM_Logging logLevel:4, @"updateGpsbandsInfoForBBv2:gpsBandInfoList band = %u, bandUsePriority = %u\n", v23, DWORD2(v24) message];
          if (v15 == 2)
          {
            v6 |= 2u;
            HIDWORD(v17) = DWORD2(v24);
            LODWORD(v17) = DWORD2(v24) - 256;
            char v8 = 1;
            uint64_t v3 = 1;
            switch((v17 >> 8))
            {
              case 0u:
                continue;
              case 1u:
                char v8 = 1;
                uint64_t v3 = 2;
                break;
              case 3u:
                char v8 = 1;
                uint64_t v3 = 3;
                break;
              case 7u:
                char v8 = 1;
                uint64_t v3 = 5;
                break;
              default:
                char v8 = 1;
                goto LABEL_18;
            }
          }
          else if (v15 == 1)
          {
            v6 |= 1u;
            HIDWORD(v16) = DWORD2(v24);
            LODWORD(v16) = DWORD2(v24) - 256;
            uint64_t v10 = 1;
            char v7 = 1;
            uint64_t v3 = v13;
            switch((v16 >> 8))
            {
              case 0u:
                continue;
              case 1u:
              case 3u:
                uint64_t v10 = 2;
                goto LABEL_19;
              case 7u:
                uint64_t v10 = 5;
                goto LABEL_19;
              default:
                char v7 = 1;
                goto LABEL_18;
            }
          }
          else
          {
LABEL_18:
            uint64_t v10 = v12;
LABEL_19:
            uint64_t v3 = v13;
          }
        }
        id v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v5);
    }
    else
    {
      LOBYTE(v6) = 0;
      char v7 = 0;
      char v8 = 0;
      uint64_t v3 = 4;
      uint64_t v10 = 4;
    }
    uint64_t v18 = v7 & 1;
    uint64_t v19 = v8 & 1;
    CFDictionaryRef v2 = v20;
  }
  else
  {
    LOBYTE(v6) = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v10 = 4;
  }
  +[WCM_Logging logLevel:1, @"updateGpsbandsInfoForBBv2: L1enabled = %d, L5Enabled = %d, l1Level = %llu, l5Level = %llu\n", v18, v19, v10, v3 message];
  if ([(NSSet *)[(WCM_PolicyManager *)v2 activeCoexFeatures] containsObject:@"CoexBBUnifiedSensorInfoSupport"])
  {
    if ([(NSSet *)[(WCM_PolicyManager *)v2 activeCoexFeatures] containsObject:@"UseWCMAriDriver"])
    {
      [(WCM_CellularController *)v21 sendBBCoexSensorMessage:0 band:v6 usecase:v3 & 0xF | (16 * v10)];
    }
  }
}

- (void)handleCallLQMStateChange
{
  if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"WiFiEnhCoexSupport"])
  {
    [(WCM_PolicyManager *)self handleCallLQMStateChangeType7WiFiEnh:1];
  }
  else
  {
    [(WCM_PolicyManager *)self handleCallLQMStateChangeType7:1];
  }
}

- (void)updateCallStateActive:(BOOL)a3
{
  BOOL v3 = a3;
  +[WCM_Logging logLevel:3, @"BB20: updateCallStateActive: callActive = %d self.callActive %d", a3, [(WCM_PolicyManager *)self callActiveState] message];
  if ([(WCM_PolicyManager *)self callActiveState] != v3)
  {
    [(WCM_PolicyManager *)self setCallActiveState:v3];
    id v5 = +[WCM_PolicyManager singleton];
    [v5 updateControllerState:105];
  }
}

- (void)updateLqmState:(int)a3 deviceRRCState:(unsigned __int8)a4 subscriptionSlot:(int64_t)a5
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D430C;
  block[3] = &unk_10020DF00;
  int v6 = a3;
  unsigned __int8 v7 = a4;
  block[4] = self;
  void block[5] = a5;
  dispatch_async([+[WCM_Server singleton](WCM_Server, "singleton") getQueue], block);
}

- (void)submitWifiAntselPolicyStats
{
  unsigned __int8 v7 = [(WCM_PolicyManager *)self lockObjectWifiAntselPolicyStats];
  objc_sync_enter(v7);
  +[WCM_Logging logLevel:2 message:@"submitWifiAntselPolicyStats"];
  BOOL v3 = +[NSArray arrayWithArray:[(WCM_PolicyManager *)self wifiAntselPolicyStatsArray]];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    obj = v3;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(obj);
        }
        [WCM_Logging logLevel:4 message:@"Sending AntSelPolicyStates: issueBand %@, issueType %@, isCoexBand %@, hasAntConstraint %@ issuecount %@", [*(id *)(*((void *)&v9 + 1) + 8 * i) objectForKeyedSubscript:@"IssueBand"], [*(id *)(*((void *)&v9 + 1) + 8 * i) objectForKeyedSubscript:@"IssueType"], [*(id *)(*((void *)&v9 + 1) + 8 * i) objectForKeyedSubscript:@"IsCoexBand"], [*(id *)(*((void *)&v9 + 1) + 8 * i) objectForKeyedSubscript:@"HasAntConstraint"], [*(id *)(*((void *)&v9 + 1) + 8 * i) objectForKeyedSubscript:@"count"]];
        AnalyticsSendEventLazy();
      }
      id v4 = [(NSArray *)obj countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  [(NSMutableArray *)[(WCM_PolicyManager *)self wifiAntselPolicyStatsArray] removeAllObjects];
  objc_sync_exit(v7);
}

- (void)handleBTCoexWiFiStateEvent:(int)a3 wifiChannel:(unsigned int)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D4854;
  block[3] = &unk_10020DB30;
  int v5 = a3;
  unsigned int v6 = a4;
  dispatch_async([+[WCM_Server singleton](WCM_Server, "singleton") getQueue], block);
}

- (void)handle5GHzHostAPStateEvent:(BOOL)a3
{
  BOOL v3 = a3;
  if ([+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton").activeCoexFeatures containsObject:@"WiFiFigaroCoex"])BOOL v5 = byte_10027D2FE == v3; {
  else
  }
    BOOL v5 = 1;
  if (!v5)
  {
    [(WCM_BTController *)[(WCM_PolicyManager *)self btController] update5GHzHostAP:v3];
    byte_10027D2FE = v3;
  }
}

- (void)handleBTCoexConnectedDevicesEvent_numA2DP:(unint64_t)a3 numLLA:(unint64_t)a4 numHID:(unint64_t)a5 numSCO:(unint64_t)a6 numeSCO:(unint64_t)a7 numLE:(unint64_t)a8 numLEA:(unint64_t)a9
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D49E8;
  block[3] = &unk_100211468;
  void block[4] = a3;
  void block[5] = a4;
  void block[6] = a5;
  block[7] = a6;
  block[8] = a7;
  block[9] = a8;
  block[10] = a9;
  dispatch_async([+[WCM_Server singleton](WCM_Server, "singleton") getQueue], block);
}

- (void)handleBTCoexStatsEvent_tddCnt:(unsigned int)a3 hybridCnt:(unsigned int)a4 btDurMs:(unsigned int)a5 totDurMs:(unsigned int)a6 parallelCnt:(unsigned int)a7 btDurAirMs:(unsigned int)a8 wlrssiCoex:(char)a9 btrssiCoex:(char)a10
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D4B38;
  block[3] = &unk_100211490;
  void block[4] = self;
  unsigned int v11 = a3;
  unsigned int v12 = a4;
  unsigned int v13 = a5;
  unsigned int v14 = a6;
  unsigned int v15 = a7;
  unsigned int v16 = a8;
  char v17 = a9;
  char v18 = a10;
  dispatch_async([+[WCM_Server singleton](WCM_Server, "singleton") getQueue], block);
}

- (void)handleCameraStateIndication
{
  if ([(NSSet *)[(WCM_PolicyManager *)self activeCoexFeatures] containsObject:@"UseWCMAriDriver"])
  {
    xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v3, "kWCMCellularSetCameraState", self->_cameraState);
    [(WCM_CellularController *)[(WCM_PolicyManager *)self cellularController] sendMessage:1233 withArgs:v3];
    xpc_release(v3);
  }
  else
  {
    [(WCM_PolicyManager *)self handleMavCameraStateIndication];
  }
}

- (void)handleMavCameraStateIndication
{
  +[WCM_Logging logLevel:2, @"PolicyManager handle camera state indication, new camera state = 0x%X", self->_cameraState message];
  unsigned int cameraState = self->_cameraState;
  if ([(WCM_IOKitWrapper *)self->_iokitWrapper isFrontCameraSupported]) {
    [(WCM_CellularController *)[(WCM_PolicyManager *)self cellularController] sendBBCameraState:41 state:(cameraState >> 3) & 1];
  }
  if ([(WCM_IOKitWrapper *)self->_iokitWrapper isFaceIdSupported]) {
    [(WCM_CellularController *)[(WCM_PolicyManager *)self cellularController] sendBBCameraState:40 state:cameraState & 1];
  }
  if ([(WCM_IOKitWrapper *)self->_iokitWrapper isBackTeleCameraSupported]) {
    [(WCM_CellularController *)[(WCM_PolicyManager *)self cellularController] sendBBCameraState:44 state:(cameraState >> 6) & 1];
  }
  if ([(WCM_IOKitWrapper *)self->_iokitWrapper isBackSuperWideCameraSupported])
  {
    id v4 = [(WCM_PolicyManager *)self cellularController];
    [(WCM_CellularController *)v4 sendBBCameraState:43 state:(cameraState >> 9) & 1];
  }
}

- (void)handlePencilStateIndication
{
  +[WCM_Logging logLevel:2, @"YYDebug_ PolicyManager handle pencil state indication, new pencil state = %d", self->_pencilState message];
}

- (void)sendWirelessBtLoad:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  +[WCM_Logging logLevel:2, @"sendWirelessBtLoad Load:%u", *(void *)&a3 message];
  id v4 = +[WCM_UCMClientManager WCM_UCMClientManagerSingleton];

  [v4 updateWirelessBtLoad:v3];
}

- (void)startHomeKitTimer
{
  +[WCM_Logging logLevel:2 message:@"startHomeKitTimer"];
  id v2 = +[WCM_UCMClientManager WCM_UCMClientManagerSingleton];

  [v2 startHomeKitTimer:300.0];
}

- (void)stopHomeKitTimer
{
  +[WCM_Logging logLevel:2 message:@"stopHomeKitTimer"];
  id v2 = +[WCM_UCMClientManager WCM_UCMClientManagerSingleton];

  [v2 stopHomeKitTimer];
}

- (void)sendULFrequencyUpdates:(int64_t)a3 ulCenterFreq:(double)a4 ulBandwidth:(double)a5
{
  v10[0] = @"BandInfoType";
  v11[0] = +[NSNumber numberWithLongLong:a3];
  v10[1] = @"ULCenterFrequency";
  v11[1] = +[NSNumber numberWithDouble:a4];
  v10[2] = @"ULBandwidth";
  v11[2] = +[NSNumber numberWithDouble:a5];
  char v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];
  if (v8)
  {
    long long v9 = v8;
    if (![(WCM_PolicyManager *)self prevULFrequencyUpdate]
      || ![(NSDictionary *)v9 isEqualToDictionary:[(WCM_PolicyManager *)self prevULFrequencyUpdate]])
    {
      [+[WCM_UCMClientManager WCM_UCMClientManagerSingleton](WCM_UCMClientManager, "WCM_UCMClientManagerSingleton") sendULFrequencyUpdates:v9];

      [(WCM_PolicyManager *)self setPrevULFrequencyUpdate:[(NSDictionary *)v9 copy]];
    }
  }
}

- (WCM_CellularRc1PolicyManager)cellularRc1PolicyManager
{
  return self->_cellularRc1PolicyManager;
}

- (void)setCoexSupported:(BOOL)a3
{
  self->_coexSupported = a3;
}

- (BOOL)iRATSupported
{
  return self->_iRATSupported;
}

- (void)setIRATSupported:(BOOL)a3
{
  self->_iRATSupported = a3;
}

- (void)setPlatformManager:(id)a3
{
  self->_platformManager = (WCM_PlatformManager *)a3;
}

- (void)setCellularController:(id)a3
{
  self->_cellularController = (WCM_CellularController *)a3;
}

- (void)setHpCellularMonitor:(id)a3
{
  self->_hpCellularMonitor = (WCM_HPCellularStateMonitor *)a3;
}

- (void)setWifiController:(id)a3
{
  self->_wifiController = (WCM_WiFiController *)a3;
}

- (void)setBtController:(id)a3
{
  self->_btController = (WCM_BTController *)a3;
}

- (void)setFtController:(id)a3
{
  self->_ftController = (WCM_FTController *)a3;
}

- (void)setRcu1Controller:(id)a3
{
  self->_rcu1Controller = (WCM_R1Controller *)a3;
}

- (void)setRcu2Controller:(id)a3
{
  self->_rcu2Controller = (WCM_RCU2Controller *)a3;
}

- (WCM_P2PAWDLController)p2pAwdlController
{
  return self->_p2pAwdlController;
}

- (void)setP2pAwdlController:(id)a3
{
  self->_p2pAwdlController = (WCM_P2PAWDLController *)a3;
}

- (WCM_P2PNANController)p2pNanController
{
  return self->_p2pNanController;
}

- (void)setP2pNanController:(id)a3
{
  self->_p2pNanController = (WCM_P2PNANController *)a3;
}

- (WCM_AirplayController)airplayController
{
  return self->_airplayController;
}

- (void)setAirplayController:(id)a3
{
  self->_airplayController = (WCM_AirplayController *)a3;
}

- (WCM_CoexMonitor)coexMonitor
{
  return self->_coexMonitor;
}

- (void)setCoexMonitor:(id)a3
{
  self->_coexMonitor = (WCM_CoexMonitor *)a3;
}

- (WCM_ExternalAccessory)extAccessory
{
  return self->_extAccessory;
}

- (void)setExtAccessory:(id)a3
{
  self->_extAccessory = (WCM_ExternalAccessory *)a3;
}

- (WCM_BSPMonitor)bspMonitor
{
  return self->_bspMonitor;
}

- (void)setBspMonitor:(id)a3
{
  self->_bspMonitor = (WCM_BSPMonitor *)a3;
}

- (WCM_MavAntennaPolicy)mavAntPolicy
{
  return self->_mavAntPolicy;
}

- (void)setActiveCoexFeatures:(id)a3
{
}

- (NSData)btPreferredChannelMapOnGpsRadioActive
{
  return self->_btPreferredChannelMapOnGpsRadioActive;
}

- (NSData)btDiversityChannelMapForC0B0
{
  return self->_btDiversityChannelMapForC0B0;
}

- (void)setBtDiversityChannelMapForC0B0:(id)a3
{
}

- (NSData)btDiversityChannelMapForC0B1
{
  return self->_btDiversityChannelMapForC0B1;
}

- (void)setBtDiversityChannelMapForC0B1:(id)a3
{
}

- (NSData)btDiversityChannelMapForC1B0
{
  return self->_btDiversityChannelMapForC1B0;
}

- (void)setBtDiversityChannelMapForC1B0:(id)a3
{
}

- (NSData)btDiversityChannelMapForC1B1
{
  return self->_btDiversityChannelMapForC1B1;
}

- (void)setBtDiversityChannelMapForC1B1:(id)a3
{
}

- (NSData)btDiversityChannelMapOnGpsRadioActiveForC0B0
{
  return self->_btDiversityChannelMapOnGpsRadioActiveForC0B0;
}

- (void)setBtDiversityChannelMapOnGpsRadioActiveForC0B0:(id)a3
{
}

- (NSData)btDiversityChannelMapOnGpsRadioActiveForC0B1
{
  return self->_btDiversityChannelMapOnGpsRadioActiveForC0B1;
}

- (void)setBtDiversityChannelMapOnGpsRadioActiveForC0B1:(id)a3
{
}

- (NSData)btDiversityChannelMapOnGpsRadioActiveForC1B0
{
  return self->_btDiversityChannelMapOnGpsRadioActiveForC1B0;
}

- (void)setBtDiversityChannelMapOnGpsRadioActiveForC1B0:(id)a3
{
}

- (NSData)btDiversityChannelMapOnGpsRadioActiveForC1B1
{
  return self->_btDiversityChannelMapOnGpsRadioActiveForC1B1;
}

- (void)setBtDiversityChannelMapOnGpsRadioActiveForC1B1:(id)a3
{
}

- (int)btPreferredRole
{
  return self->_btPreferredRole;
}

- (NSArray)wifiChannelsToEnableWCI2
{
  return self->_wifiChannelsToEnableWCI2;
}

- (void)setWifiChannelsToEnableWCI2:(id)a3
{
}

- (NSMutableArray)wifiChannelsToEnableWCI2V2
{
  return self->_wifiChannelsToEnableWCI2V2;
}

- (void)setWifiChannelsToEnableWCI2V2:(id)a3
{
}

- (void)setWifi5GHzChannelsToEnableType7MSGCombined:(id)a3
{
}

- (void)setWifi2GHzChannelsToEnableType7MSGCombined:(id)a3
{
}

- (NSMutableArray)wifi2G5GChannelsToEnableType7MSG
{
  return self->_wifi2G5GChannelsToEnableType7MSG;
}

- (void)setWifi2G5GChannelsToEnableType7MSG:(id)a3
{
}

- (unsigned)type7CellAntBlkIdx
{
  return self->_type7CellAntBlkIdx;
}

- (NSArray)wifiChannelsToDisableOCL
{
  return self->_wifiChannelsToDisableOCL;
}

- (void)setWifiChannelsToDisableOCL:(id)a3
{
}

- (void)setGpsRadioActive:(BOOL)a3
{
  self->_gpsRadioActive = a3;
}

- (BOOL)audioBuiltInReceiver
{
  return self->_audioBuiltInReceiver;
}

- (void)setAudioBuiltInReceiver:(BOOL)a3
{
  self->_audioBuiltInReceiver = a3;
}

- (void)setCallActiveState:(BOOL)a3
{
  self->_callActiveState = a3;
}

- (void)setDataLqmState:(char)a3
{
  self->_dataLqmState = a3;
}

- (unsigned)callType
{
  return self->_callType;
}

- (unsigned)CTRrcState
{
  return self->_CTRrcState;
}

- (void)setCTRrcState:(unsigned __int8)a3
{
  self->_CTRrcState = a3;
}

- (BOOL)clamshellState
{
  return self->_clamshellState;
}

- (void)setClamshellState:(BOOL)a3
{
  self->_clamshellState = a3;
}

- (BOOL)wcmCellularWCI2Mode_Ext_Enable
{
  return self->_wcmCellularWCI2Mode_Ext_Enable;
}

- (NSMutableArray)gpsBandInfoList
{
  return self->_gpsBandInfoList;
}

- (void)setGpsBandInfoList:(id)a3
{
}

- (void)setHpCellNeed2SetBTAFH:(BOOL)a3
{
  self->_hpCellNeed2SetBTAFH = a3;
}

- (void)setDynamicAntBlkingBand:(unsigned __int16)a3
{
  self->_dynamicAntBlkingBand = a3;
}

- (void)setDynamicCellAntBlkEnableIdx1:(unsigned __int8)a3
{
  self->_dynamicCellAntBlkEnableIdx1 = a3;
}

- (void)setDynamicCellAntBlkEnableIdx2:(unsigned __int8)a3
{
  self->_dynamicCellAntBlkEnableIdx2 = a3;
}

- (unsigned)cameraState
{
  return self->_cameraState;
}

- (void)setCameraState:(unsigned int)a3
{
  self->_unsigned int cameraState = a3;
}

- (unsigned)pencilState
{
  return self->_pencilState;
}

- (void)setPencilState:(unsigned int)a3
{
  self->_pencilState = a3;
}

- (BOOL)pencilCoexActive
{
  return self->_pencilCoexActive;
}

- (BOOL)findMyPencilScanActive
{
  return self->_findMyPencilScanActive;
}

- (int)coexProfile2GTDDReason
{
  return self->_coexProfile2GTDDReason;
}

- (unsigned)type7WiFiEnhCellAntBlkIdx
{
  return self->_type7WiFiEnhCellAntBlkIdx;
}

- (NSArray)legacyWiFiBlocklistChannelsFor3FoWiFi
{
  return self->_legacyWiFiBlocklistChannelsFor3FoWiFi;
}

- (void)setLegacyWiFiBlocklistChannelsFor3FoWiFi:(id)a3
{
}

- (int)watchCellularAntPref
{
  return self->_watchCellularAntPref;
}

- (void)setWatchCellularAntPref:(int)a3
{
  self->_watchCellularAntPref = a3;
}

- (NSNumber)btAgcCoexModeEnable
{
  return self->_btAgcCoexModeEnable;
}

- (NSNumber)wifiAgcCoexModeLevel
{
  return self->_wifiAgcCoexModeLevel;
}

- (unsigned)sacWifiFrequency
{
  return self->_sacWifiFrequency;
}

- (void)setSacWifiFrequency:(unsigned int)a3
{
  self->_sacWifiFrequency = a3;
}

- (void)setBLEActiveScanPwrLmtAssrInt:(unint64_t)a3
{
  self->_BLEActiveScanPwrLmtAssrInt = a3;
}

- (WCM_IOKitWrapper)iokitWrapper
{
  return self->_iokitWrapper;
}

- (void)setIokitWrapper:(id)a3
{
}

- (BOOL)forceRealTimeAWDL
{
  return self->_forceRealTimeAWDL;
}

- (void)setForceRealTimeAWDL:(BOOL)a3
{
  self->_BOOL forceRealTimeAWDL = a3;
}

- (void)setWifiAntselPolicyStatsArray:(id)a3
{
}

- (void)setPreviousStartTime:(double)a3
{
  self->_previousStartTime = a3;
}

- (void)setLockObjectWifiAntselPolicyStats:(id)a3
{
}

- (BOOL)prevNR7xRFEnabled
{
  return self->_prevNR7xRFEnabled;
}

- (void)setPrevNR7xRFEnabled:(BOOL)a3
{
  self->_prevNR7xRFEnabled = a3;
}

- (BOOL)prevNR41RFEnabled
{
  return self->_prevNR41RFEnabled;
}

- (void)setPrevNR41RFEnabled:(BOOL)a3
{
  self->_prevNR41RFEnabled = a3;
}

- (NSMutableDictionary)prevULFrequencyUpdate
{
  return self->_prevULFrequencyUpdate;
}

- (void)setPrevULFrequencyUpdate:(id)a3
{
  self->_prevULFrequencyUpdate = (NSMutableDictionary *)a3;
}

@end