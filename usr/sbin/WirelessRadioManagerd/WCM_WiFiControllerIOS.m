@interface WCM_WiFiControllerIOS
- (BOOL)isCarPlaySessionInProgress;
- (BOOL)lteCDRXTDDMode;
- (BOOL)mCarPlaySessionInProgress;
- (BOOL)sharedAntennaDisabled;
- (BOOL)wifiBTCoexProfilesDownloaded;
- (NSArray)antennaConfig;
- (NSArray)antennaSelection;
- (NSArray)antennaSelectionEnh2G;
- (NSArray)antennaSelectionEnh5G;
- (NSArray)antennaSelectionEnh6G;
- (NSArray)cdrxTDDEnabledChannels;
- (NSArray)channelsBlocklisted;
- (NSArray)channelsOCLDisabled;
- (NSArray)channelsWCI2Enabled;
- (NSArray)scanChannels;
- (NSDictionary)frameConfiguration;
- (NSMutableArray)channelsDisableOCL2Gand5G;
- (NSMutableArray)channelsDisableOCLWiFiEnh;
- (NSMutableArray)channelsToEnableType7MSG;
- (NSMutableArray)channelsToEnableType7MSG2GWiFi;
- (NSMutableArray)channelsWCI2Enabled2Gand5G;
- (NSMutableArray)channelsWCI2EnabledV2;
- (NSMutableArray)channelsWCI2EnabledWiFiEnh;
- (NSMutableArray)channelsWiFiType7MSG2Gand5G;
- (NSMutableArray)channelsWiFiType7MSGWiFiEnh;
- (NSNumber)rxPriThreshold;
- (NSNumber)wifiAgcModeEnable;
- (WCM_WiFiControllerIOS)init;
- (double)cellularULBandwidth;
- (double)cellularULBandwidth2;
- (double)cellularULCenterFreq;
- (double)cellularULCenterFreq2;
- (id)getLeastCongestedWifiParam;
- (id)getWiFiServiceSingletone;
- (int)getCarPlayScanRelaxReason;
- (int)mCarPlayBTScanRelaxReason;
- (int64_t)activeProfileFor2G;
- (int64_t)activeProfileFor5G;
- (int64_t)getWiFiBTActiveProfileFor2G;
- (unsigned)mLeastCongestedChannel;
- (unsigned)mLeastCongestedChannelCount;
- (void)bspBandSwitchRequest:(int)a3 targetBand:(int)a4;
- (void)bspGetBandSwitchStatus;
- (void)bspGetChannelQualityInfo;
- (void)bspNanPhsStateRequest;
- (void)bspRegulatoryInfoRequest;
- (void)bspSetCoexMode:(BOOL)a3 wifiSupportedBands:(int)a4 btCurrentBand:(int)a5 btSupportedBands:(int)a6 setTimeToTSTOnly:(BOOL)a7 timeToTST:(int)a8;
- (void)bspStatusRequest;
- (void)bspUpdateBTStatus_powerState:(BOOL)a3 frequencyBand:(int)a4 ullaMode:(int)a5;
- (void)clearDownloadCoexProfilesState;
- (void)dealloc;
- (void)downloadWiFiBTCoexProfiles;
- (void)enableWifiLaaCoexMode;
- (void)handlePowerState:(BOOL)a3;
- (void)setActiveProfileFor2G:(int64_t)a3;
- (void)setActiveProfileFor5G:(int64_t)a3;
- (void)setAntennaConfig:(id)a3;
- (void)setAntennaSelection:(id)a3;
- (void)setAntennaSelectionEnh2G:(id)a3;
- (void)setAntennaSelectionEnh5G:(id)a3;
- (void)setAntennaSelectionEnh6G:(id)a3;
- (void)setAntennaSelectionWiFiEnh:(id)a3;
- (void)setCdrxTDDEnabledChannels:(id)a3;
- (void)setCellularULBandwidth2:(double)a3;
- (void)setCellularULBandwidth:(double)a3;
- (void)setCellularULCenterFreq2:(double)a3;
- (void)setCellularULCenterFreq:(double)a3;
- (void)setChannelsBlocklisted:(id)a3;
- (void)setChannelsDisableOCL2Gand5G:(id)a3;
- (void)setChannelsDisableOCLWiFiEnh:(id)a3;
- (void)setChannelsOCLDisabled:(id)a3;
- (void)setChannelsToEnableType7MSG2GWiFi:(id)a3;
- (void)setChannelsToEnableType7MSG:(id)a3;
- (void)setChannelsWCI2Enabled2Gand5G:(id)a3;
- (void)setChannelsWCI2Enabled:(id)a3;
- (void)setChannelsWCI2EnabledV2:(id)a3;
- (void)setChannelsWCI2EnabledWiFiEnh:(id)a3;
- (void)setChannelsWiFiType7MSG2Gand5G:(id)a3;
- (void)setChannelsWiFiType7MSGWiFiEnh:(id)a3;
- (void)setCoexParams:(const char *)a3 withValue:(id)a4;
- (void)setCriticalWiFiTraffic:(BOOL)a3 duration:(unsigned int)a4 criticalityPercentage:(unsigned __int16)a5 forProcessID:(int)a6;
- (void)setFrameConfiguration:(id)a3;
- (void)setHPovrLEscanGrantDuration:(unsigned int)a3;
- (void)setLteCDRXTDDMode:(BOOL)a3;
- (void)setMCarPlayBTScanRelaxReason:(int)a3;
- (void)setMCarPlaySessionInProgress:(BOOL)a3;
- (void)setMLeastCongestedChannel:(unsigned int)a3;
- (void)setMLeastCongestedChannelCount:(unsigned int)a3;
- (void)setRxPriThreshold:(id)a3;
- (void)setScanChannels:(id)a3;
- (void)setSharedAntennaDisabled:(BOOL)a3;
- (void)setWifiAgcCoexMode:(id)a3;
- (void)setWifiAgcModeEnable:(id)a3;
- (void)setWifiBTCoexProfilesDownloaded:(BOOL)a3;
- (void)updateAntennaPreference:(id)a3 withCellPolicy:(id)a4;
- (void)updateAntennaSelection:(id)a3;
- (void)updateAntennaSelectionV2:(id)a3;
- (void)updateAntennaSelectionWiFiEnh2G:(id)a3;
- (void)updateAntennaSelectionWiFiEnh5G:(id)a3;
- (void)updateAntennaSelectionWiFiEnh6G:(id)a3;
- (void)updateCarPlaySessionState:(BOOL)a3 reason:(int)a4;
- (void)updateCellularFrequencyConfig:(id)a3 withWiFiRangingDesenseFlag:(BOOL)a4;
- (void)updateChannelsForTimeSharingMode:(id)a3;
- (void)updateChannelsToBlocklist:(id)a3;
- (void)updateChannelsToDisableOCL:(id)a3;
- (void)updateChannelsToDisableOCLWiFiEnh:(id)a3 WiFiEnhChannels:(id)a4;
- (void)updateChannelsToEnableType7MSG2GWiFi:(id)a3;
- (void)updateChannelsToEnableType7MSG:(id)a3;
- (void)updateChannelsToEnableType7MSGWiFiEnh:(id)a3 WiFiEnhChannels:(id)a4;
- (void)updateChannelsToEnableWCI2:(id)a3;
- (void)updateChannelsToEnableWCI2V2:(id)a3;
- (void)updateChannelsToEnableWCI2WiFiEnh:(id)a3 WiFiEnhChannels:(id)a4;
- (void)updateContentionFreeWiFiInfoToRC2:(unsigned int)a3 count:(unsigned int)a4;
- (void)updateGen9rFemConfiguration;
- (void)updateMWSFrameConfig:(id)a3;
- (void)updateMWSSignalingConfig;
- (void)updateMedtronicState:(int)a3;
- (void)updatePowerOnGen9rFemConfiguration;
- (void)updateRCU2CoexParams:(id)a3;
- (void)updateRxPriorityThreshold:(id)a3;
- (void)updateWiFiA2DPActiveStatus:(int)a3;
- (void)updateWiFiA2DPLLAActiveStatus:(int)a3;
- (void)updateWiFiBTCoexActiveProfileFor2G:(int64_t)a3 and5G:(int64_t)a4;
- (void)updateWiFiBTCoexProfile:(id)a3 atIndex:(int64_t)a4;
- (void)updateWiFiBTConnectionReport:(id)a3;
- (void)updateWiFiBTLeConnEnable:(BOOL)a3 andPeakOutageMs:(unsigned int)a4 andDurationMs:(unsigned int)a5 andDutyCycle:(unsigned int)a6 andReason:(unsigned int)a7;
- (void)updateWiFiBTULOFDMAstate:(BOOL)a3;
- (void)updateWiFiLimitedAggregationActiveStatus:(int)a3;
- (void)updateWiFiLimitedAggregationActiveStatus:(int)a3 andUseCase:(int)a4;
- (void)updateWiFiRCU1ModeChanged:(BOOL)a3 andChannelChanged:(BOOL)a4 andMode:(id)a5 andChannel:(id)a6;
- (void)updateWiFiRCU1ULOFDMAstate:(BOOL)a3;
- (void)updateWiFiRCU2CoexMode:(id)a3;
- (void)updateWiFiRCU2PMProtectionMode:(id)a3;
- (void)updateWiFiRCU2TimingArray:(id)a3;
- (void)updateWiFiRCU2ULOFDMAstate:(BOOL)a3;
- (void)updateWiFieSCOActiveStatus:(int)a3;
- (void)updateWifiEnvelopeParams;
@end

@implementation WCM_WiFiControllerIOS

- (void)updateChannelsForTimeSharingMode:(id)a3
{
  uint64_t v5 = [a3 isEqualToArray:&off_10024E650] ^ 1;
  if (v5 == [(WCM_WiFiControllerIOS *)self lteCDRXTDDMode]
    && objc_msgSend(a3, "isEqualToArray:", -[WCM_WiFiControllerIOS cdrxTDDEnabledChannels](self, "cdrxTDDEnabledChannels")))
  {
    +[WCM_Logging logLevel:4, @"Already set lteCDRXTDDMode(%d) cdrxTDDEnabledChannels %@", v5, a3 message];
  }
  else
  {
    [(WCM_WiFiControllerIOS *)self setLteCDRXTDDMode:v5];
    [(WCM_WiFiControllerIOS *)self setCdrxTDDEnabledChannels:a3];
    v6 = [(WCM_WiFiController *)self wifiService];
    [(WCM_WiFiService *)v6 setChannelsForTimeSharingMode:a3];
  }
}

- (void)updateChannelsToEnableType7MSGWiFiEnh:(id)a3 WiFiEnhChannels:(id)a4
{
  if (objc_msgSend(a3, "isEqualToArray:", -[WCM_WiFiControllerIOS channelsWiFiType7MSG2Gand5G](self, "channelsWiFiType7MSG2Gand5G"))&& objc_msgSend(a4, "isEqualToArray:", -[WCM_WiFiControllerIOS channelsWiFiType7MSGWiFiEnh](self, "channelsWiFiType7MSGWiFiEnh")))
  {
    +[WCM_Logging logLevel:4 message:@"WiFiType7_WiFiEnh:  Channel lists are the same as channelsWiFiType7MSG2Gand5G and channelsWiFiType7MSGWiFiEnh, no need to update."];
  }
  else
  {
    [(WCM_WiFiControllerIOS *)self setChannelsWiFiType7MSG2Gand5G:a3];
    [(WCM_WiFiControllerIOS *)self setChannelsWiFiType7MSGWiFiEnh:a4];
    v7 = [(WCM_WiFiController *)self wifiService];
    v8 = [(WCM_WiFiControllerIOS *)self channelsWiFiType7MSG2Gand5G];
    v9 = [(WCM_WiFiControllerIOS *)self channelsWiFiType7MSGWiFiEnh];
    [(WCM_WiFiService *)v7 setChannelsToEnableType7MSGWiFiEnh:v8 WiFiEnhChannels:v9];
  }
}

- (void)updateChannelsToDisableOCLWiFiEnh:(id)a3 WiFiEnhChannels:(id)a4
{
  if (objc_msgSend(a3, "isEqualToArray:", -[WCM_WiFiControllerIOS channelsDisableOCL2Gand5G](self, "channelsDisableOCL2Gand5G"))&& objc_msgSend(a4, "isEqualToArray:", -[WCM_WiFiControllerIOS channelsDisableOCLWiFiEnh](self, "channelsDisableOCLWiFiEnh")))
  {
    +[WCM_Logging logLevel:4 message:@"DisableOCL_WiFiEnh: Channel lists are the same as channelsDisableOCL2Gand5G and channelsDisableOCLWiFiEnh, no need to update."];
  }
  else
  {
    [(WCM_WiFiControllerIOS *)self setChannelsDisableOCL2Gand5G:a3];
    [(WCM_WiFiControllerIOS *)self setChannelsDisableOCLWiFiEnh:a4];
    v7 = [(WCM_WiFiController *)self wifiService];
    v8 = [(WCM_WiFiControllerIOS *)self channelsDisableOCL2Gand5G];
    v9 = [(WCM_WiFiControllerIOS *)self channelsDisableOCLWiFiEnh];
    [(WCM_WiFiService *)v7 setChannelsToDisableOCLWiFiEnh:v8 WiFiEnhChannels:v9];
  }
}

- (void)updateChannelsToEnableWCI2WiFiEnh:(id)a3 WiFiEnhChannels:(id)a4
{
  if (objc_msgSend(a3, "isEqualToArray:", -[WCM_WiFiControllerIOS channelsWCI2Enabled2Gand5G](self, "channelsWCI2Enabled2Gand5G"))&& objc_msgSend(a4, "isEqualToArray:", -[WCM_WiFiControllerIOS channelsWCI2EnabledWiFiEnh](self, "channelsWCI2EnabledWiFiEnh")))
  {
    +[WCM_Logging logLevel:4 message:@"WCI2_WiFiEnh:  Channel lists are the same as channelsWCI2Enabled2Gand5G and channelsWCI2EnabledWiFiEnh, no need to update."];
  }
  else
  {
    [(WCM_WiFiControllerIOS *)self setChannelsWCI2Enabled2Gand5G:a3];
    [(WCM_WiFiControllerIOS *)self setChannelsWCI2EnabledWiFiEnh:a4];
    v7 = [(WCM_WiFiController *)self wifiService];
    v8 = [(WCM_WiFiControllerIOS *)self channelsWCI2Enabled2Gand5G];
    v9 = [(WCM_WiFiControllerIOS *)self channelsWCI2EnabledWiFiEnh];
    [(WCM_WiFiService *)v7 setChannelsToEnableWCI2WiFiEnh:v8 WiFiEnhChannels:v9];
  }
}

- (void)updateMWSFrameConfig:(id)a3
{
  if (a3)
  {
    id v5 = +[NSMutableArray array];
    id v6 = +[NSMutableArray array];
    if ([a3 tddBand])
    {
      unint64_t v7 = (unint64_t)[a3 tddULDLConfig];
      unint64_t v8 = (unint64_t)[a3 subframeFormat];
      id v9 = [a3 dlCPConfig];
      id v10 = [a3 ulCPConfig];
      if (v7 > 6 || v8 > 9)
      {
        +[WCM_Logging logLevel:0, @"Invalid tddULDLConfig(%d) subframeFormat(%d)", v7, v8 message];
        return;
      }
      v29 = self;
      int v11 = 0;
      __int16 v12 = 0;
      uint64_t v13 = 120;
      if (!v10) {
        uint64_t v13 = 80;
      }
      v30 = (float *)((char *)&unk_1001EB158 + 4 * v8 + v13);
      v31 = (float *)((char *)&unk_1001EB158 + 40 * (v9 != 0) + 4 * v8);
      do
      {
        int v14 = aDsuuudsuuudsuu[10 * v7 + v11];
        [v6 addObject:[+[NSNumber numberWithChar:](NSNumber, "numberWithChar:", v14 != 68)];
        if (v11 <= 9) {
          uint64_t v15 = 9;
        }
        else {
          uint64_t v15 = v11;
        }
        uint64_t v16 = v15 - v11;
        v17 = &aDsuuudsuuudsuu[10 * v7 + 1 + v11];
        int v18 = v11;
        do
        {
          v12 += 1000;
          if (!v16) {
            goto LABEL_23;
          }
          int v20 = *v17++;
          int v19 = v20;
          ++v18;
          --v16;
        }
        while (v20 == v14);
        if (v19 != 83)
        {
          LODWORD(v15) = v18 - 1;
LABEL_23:
          [v5 addObject:[+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", v12)]];
          __int16 v12 = 0;
          int v18 = v15;
          goto LABEL_24;
        }
        __int16 v21 = llroundf(*v31);
        __int16 v22 = llroundf(*v30);
        if (v14 == 68) {
          __int16 v23 = v21;
        }
        else {
          __int16 v23 = v22;
        }
        uint64_t v24 = (__int16)(v23 + v12);
        if (v14 == 68) {
          __int16 v12 = v22;
        }
        else {
          __int16 v12 = v21;
        }
        [v5 addObject:[+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", v24)]];
        [v6 addObject:[NSNumber numberWithChar:3]];
        [v5 addObject:[+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)(1000 - (v21 + v22)))]];
LABEL_24:
        int v11 = v18 + 1;
      }
      while (v18 < 9);
      v25 = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)[v6 count]);
      self = v29;
    }
    else
    {
      v25 = +[NSNumber numberWithShort:1];
      [v5 addObject:[+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", 10000)];
      [v6 addObject:[+[NSNumber numberWithChar:](NSNumber, "numberWithChar:", 2)]];
    }
    id v26 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") platformManager];
    v32[0] = @"MWS_Aggressor_Frame_SyncAssertOffset";
    v33[0] = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)[v26 wcmWCI2FrameSyncAssertOffset]);
    v32[1] = @"MWS_Aggressor_Frame_SyncAssertJitter";
    v33[1] = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)[v26 wcmWCI2FrameSyncAssertJitter]);
    v32[2] = @"MWS_Aggressor_Frame_Duration";
    v33[2] = +[NSNumber numberWithShort:10000];
    v33[3] = v25;
    v32[3] = @"MWS_Aggressor_Frame_NumPeriods";
    v32[4] = @"MWS_Aggressor_Frame_PeriodDuration";
    v32[5] = @"MWS_Aggressor_Frame_PeriodType";
    v33[4] = v5;
    v33[5] = v6;
    v27 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:6];
    if ([(NSDictionary *)[(WCM_WiFiControllerIOS *)self frameConfiguration] isEqualToDictionary:v27])
    {
      +[WCM_Logging logLevel:4, @"Already set frameConfiguration %@", v27, v28 message];
    }
    else
    {
      [(WCM_WiFiControllerIOS *)self setFrameConfiguration:v27];
      [(WCM_WiFiService *)[(WCM_WiFiController *)self wifiService] setMWSFrameConfig:v27];
    }
  }
}

- (void)updateGen9rFemConfiguration
{
  id v3 = +[WCM_PolicyManager singleton];
  [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") platformManager];
  +[WCM_Logging logLevel:2 message:@"Wifi Controller: updateGen9rFemConfiguration"];
  unsigned int v4 = [v3 wcmGen9rFemLpmMode2g];
  unsigned int v5 = byte_10027D340;
  if (byte_10027D340 == v4)
  {
    unsigned int v6 = [v3 wcmGen9rFemLpmMode5g];
    if (byte_10027D341 == v6)
    {
      +[WCM_Logging logLevel:2 message:@"Wifi Controller: updateGen9rFemConfiguration, skipped due to duplicated command"];
      return;
    }
    unsigned int v5 = byte_10027D340;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, @"Wifi Controller: updateGen9rFemConfiguration, 2g(%d->%d)", v5, [v3 wcmGen9rFemLpmMode2g]);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, @"Wifi Controller: updateGen9rFemConfiguration, 5g(%d->%d)", byte_10027D341, [v3 wcmGen9rFemLpmMode5g]);
  unsigned int v7 = [v3 wcmGen9rFemLpmMode2g];
  int v8 = byte_10027D340;
  byte_10027D340 = [v3 wcmGen9rFemLpmMode2g];
  byte_10027D341 = [v3 wcmGen9rFemLpmMode5g];
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"WifiGen9rFemConfig2gWifiOnly"))
  {
    if (v8 == v7) {
      return;
    }
    v17 = [(WCM_WiFiController *)self wifiService];
    id v14 = [v3 wcmGen9rFemLpmMode2g];
    uint64_t v13 = v17;
    id v15 = 0;
    id v12 = 0;
    uint64_t v16 = 0;
  }
  else
  {
    id v9 = [(WCM_WiFiController *)self wifiService];
    id v10 = [v3 wcmGen9rFemLpmMode2g];
    id v11 = [v3 wcmGen9rFemLpmMode5g];
    id v12 = [v3 wcmGen9rFemLpmMode5g];
    uint64_t v13 = v9;
    id v14 = v10;
    id v15 = v11;
    uint64_t v16 = 1;
  }

  [(WCM_WiFiService *)v13 setChannelsToEnablerFemModeWiFiEnh:v14 enable5G:v15 enable6G:v12 setDefaultForall:v16];
}

- (void)updateAntennaSelectionWiFiEnh6G:(id)a3
{
  +[WCM_Logging logLevel:4, @"Try to set 6G antennaSelection %@", a3 message];
  if (objc_msgSend(a3, "isEqualToArray:", -[WCM_WiFiControllerIOS antennaSelectionEnh6G](self, "antennaSelectionEnh6G")))
  {
    +[WCM_Logging logLevel:4, @"Already set 6G antennaSelection %@", a3 message];
  }
  else
  {
    [(WCM_WiFiControllerIOS *)self setAntennaSelectionEnh6G:a3];
    unsigned int v5 = [(WCM_WiFiController *)self wifiService];
    unsigned int v6 = [(WCM_WiFiControllerIOS *)self antennaSelectionEnh6G];
    [(WCM_WiFiService *)v5 setAntennaSelectionWiFiEnh:v6];
  }
}

- (void)updateAntennaSelectionWiFiEnh5G:(id)a3
{
  +[WCM_Logging logLevel:4, @"Try to set 5G antennaSelection %@", a3 message];
  if (objc_msgSend(a3, "isEqualToArray:", -[WCM_WiFiControllerIOS antennaSelectionEnh5G](self, "antennaSelectionEnh5G")))
  {
    +[WCM_Logging logLevel:4, @"Already set 5G antennaSelection %@", a3 message];
  }
  else
  {
    [(WCM_WiFiControllerIOS *)self setAntennaSelectionEnh5G:a3];
    unsigned int v5 = [(WCM_WiFiController *)self wifiService];
    unsigned int v6 = [(WCM_WiFiControllerIOS *)self antennaSelectionEnh5G];
    [(WCM_WiFiService *)v5 setAntennaSelectionWiFiEnh:v6];
  }
}

- (void)updateAntennaSelectionWiFiEnh2G:(id)a3
{
  +[WCM_Logging logLevel:4, @"Try to set 2G antennaSelection %@", a3 message];
  if (objc_msgSend(a3, "isEqualToArray:", -[WCM_WiFiControllerIOS antennaSelectionEnh2G](self, "antennaSelectionEnh2G")))
  {
    +[WCM_Logging logLevel:4, @"Already set 2G antennaSelection %@", a3 message];
  }
  else
  {
    [(WCM_WiFiControllerIOS *)self setAntennaSelectionEnh2G:a3];
    unsigned int v5 = [(WCM_WiFiController *)self wifiService];
    unsigned int v6 = [(WCM_WiFiControllerIOS *)self antennaSelectionEnh2G];
    [(WCM_WiFiService *)v5 setAntennaSelectionWiFiEnh:v6];
  }
}

- (NSArray)antennaSelectionEnh6G
{
  return *(NSArray **)((char *)&self->_antennaSelectionEnh5G + 4);
}

- (NSArray)antennaSelectionEnh5G
{
  return *(NSArray **)((char *)&self->_antennaSelectionEnh2G + 4);
}

- (NSArray)antennaSelectionEnh2G
{
  return *(NSArray **)((char *)&self->_antennaSelection + 4);
}

- (void)updateChannelsToEnableWCI2:(id)a3
{
  if (objc_msgSend(a3, "isEqualToArray:", -[WCM_WiFiControllerIOS channelsWCI2Enabled](self, "channelsWCI2Enabled")))
  {
    +[WCM_Logging logLevel:4, @"Already WCI2 enabled on channels %@", a3 message];
  }
  else
  {
    [(WCM_WiFiControllerIOS *)self setChannelsWCI2Enabled:a3];
    unsigned int v5 = [(WCM_WiFiController *)self wifiService];
    [(WCM_WiFiService *)v5 setChannelsToEnableWCI2:a3];
  }
}

- (NSArray)channelsWCI2Enabled
{
  return *(NSArray **)((char *)&self->_channelsBlocklisted + 4);
}

- (void)updateWiFiLimitedAggregationActiveStatus:(int)a3 andUseCase:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  +[WCM_Logging logLevel:2, @"Wifi Controller sending eSCOHid indication to Wifi (%d) useCase (%d)", *(void *)&a3, *(void *)&a4 message];
  unsigned int v7 = [(WCM_WiFiController *)self wifiService];

  [(WCM_WiFiService *)v7 setWifiBTeSCOHidStatus:v5 andUseCase:v4];
}

- (void)updateRxPriorityThreshold:(id)a3
{
  if ([(NSNumber *)[(WCM_WiFiControllerIOS *)self rxPriThreshold] isEqualToNumber:a3])
  {
    +[WCM_Logging logLevel:4, @"Already set rxPriThreshold %@", a3 message];
  }
  else
  {
    [(WCM_WiFiControllerIOS *)self setRxPriThreshold:a3];
    uint64_t v5 = [(WCM_WiFiController *)self wifiService];
    [(WCM_WiFiService *)v5 setRxPriorityThreshold:a3];
  }
}

- (void)updateChannelsToBlocklist:(id)a3
{
  if (objc_msgSend(a3, "isEqualToArray:", -[WCM_WiFiControllerIOS channelsBlocklisted](self, "channelsBlocklisted")))
  {
    +[WCM_Logging logLevel:4, @"Already blocklisted channels %@", a3 message];
  }
  else
  {
    [(WCM_WiFiControllerIOS *)self setChannelsBlocklisted:a3];
    uint64_t v5 = [(WCM_WiFiController *)self wifiService];
    [(WCM_WiFiService *)v5 setChannelsToBlocklist:a3];
  }
}

- (NSNumber)rxPriThreshold
{
  return *(NSNumber **)&self->_mLeastCongestedChannelCount;
}

- (BOOL)lteCDRXTDDMode
{
  return BYTE4(self->super._catsAppBitmap);
}

- (NSDictionary)frameConfiguration
{
  return *(NSDictionary **)((char *)&self->_scanChannels + 4);
}

- (NSMutableArray)channelsWiFiType7MSGWiFiEnh
{
  return *(NSMutableArray **)((char *)&self->_channelsWiFiType7MSG2Gand5G + 4);
}

- (NSMutableArray)channelsWiFiType7MSG2Gand5G
{
  return *(NSMutableArray **)((char *)&self->_channelsToEnableType7MSG2GWiFi + 4);
}

- (NSMutableArray)channelsWCI2EnabledWiFiEnh
{
  return *(NSMutableArray **)((char *)&self->_channelsWCI2Enabled2Gand5G + 4);
}

- (NSMutableArray)channelsWCI2Enabled2Gand5G
{
  return *(NSMutableArray **)((char *)&self->_channelsWCI2EnabledV2 + 4);
}

- (NSMutableArray)channelsDisableOCLWiFiEnh
{
  return *(NSMutableArray **)((char *)&self->_channelsDisableOCL2Gand5G + 4);
}

- (NSMutableArray)channelsDisableOCL2Gand5G
{
  return *(NSMutableArray **)((char *)&self->_channelsOCLDisabled + 4);
}

- (NSArray)channelsBlocklisted
{
  return *(NSArray **)((char *)&self->_rxPriThreshold + 4);
}

- (NSArray)cdrxTDDEnabledChannels
{
  return *(NSArray **)((char *)&self->_antennaSelectionEnh6G + 4);
}

- (WCM_WiFiControllerIOS)init
{
  v5.receiver = self;
  v5.super_class = (Class)WCM_WiFiControllerIOS;
  v2 = [(WCM_WiFiController *)&v5 init];
  id v3 = v2;
  if (v2)
  {
    v2[76] = 0;
    *(void *)(v2 + 92) = &off_10023D170;
    *(void *)(v3 + 100) = &off_10024E560;
    *(void *)(v3 + 108) = &off_10024E578;
    *(void *)(v3 + 116) = [&__NSArray0__struct mutableCopy];
    *(void *)(v3 + 124) = [&__NSArray0__struct mutableCopy];
    *(void *)(v3 + 132) = [&__NSArray0__struct mutableCopy];
    *(void *)(v3 + 140) = [&__NSArray0__struct mutableCopy];
    *(void *)(v3 + 148) = [&__NSArray0__struct mutableCopy];
    *(void *)(v3 + 156) = [&__NSArray0__struct mutableCopy];
    *(void *)(v3 + 164) = [&__NSArray0__struct mutableCopy];
    *(void *)(v3 + 180) = [&__NSArray0__struct mutableCopy];
    *(void *)(v3 + 188) = [&__NSArray0__struct mutableCopy];
    *(void *)(v3 + 196) = &off_10024E5C0;
    *(void *)(v3 + 204) = &off_10024E5D8;
    *(void *)(v3 + 212) = &off_10024E5F0;
    *(void *)(v3 + 220) = &off_10024E608;
    *(void *)(v3 + 228) = &off_10024E620;
    *(void *)(v3 + 236) = &off_10024E638;
    *(void *)(v3 + 252) = objc_alloc_init((Class)NSDictionary);
    v3[77] = 0;
    *((_DWORD *)v3 + 20) = 4;
    *((_DWORD *)v3 + 21) = 0;
    *((_DWORD *)v3 + 22) = 0;
    *(void *)(v3 + 300) = -1;
    *(void *)(v3 + 308) = -1;
    v3[79] = 0;
  }
  return (WCM_WiFiControllerIOS *)v3;
}

- (void)dealloc
{
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"RCU1Support"))
  {
    [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton")] handleWiFiRCU1PowerOff];
    [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton")] handleWiFiRCU2PowerOff];
  }
  v3.receiver = self;
  v3.super_class = (Class)WCM_WiFiControllerIOS;
  [(WCM_WiFiController *)&v3 dealloc];
}

- (void)handlePowerState:(BOOL)a3
{
  if (!a3)
  {
    BYTE4(self->super._catsAppBitmap) = 0;
    v20.receiver = self;
    v20.super_class = (Class)WCM_WiFiControllerIOS;
    [(WCM_WiFiController *)&v20 handlePowerState:0];
    return;
  }
  v20.receiver = self;
  v20.super_class = (Class)WCM_WiFiControllerIOS;
  [(WCM_WiFiController *)&v20 handlePowerState:1];
  [(WCM_WiFiControllerIOS *)self updateWifiEnvelopeParams];
  if ([+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") activeCoexFeatures].containsObject(@"WifiAssocProtectionModeSupport"))[-[WCM_WiFiService setChannelsToEnableAssocProtectionModeWiFiEnh](-[WCM_WiFiController wifiService](self, "wifiService"), "setChannelsToEnableAssocProtectionModeWiFiEnh");
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"WlanConditionId"))
  }
  {
    [-[WCM_WiFiController wifiService](self, "wifiService") setChannelConfigurationForConditionId:[&off_10023D1E8 intValue] enable2G:1 enable5G:0 enable6G:0 wifi_channel_lower:[&off_10023D188 intValue] wifi_channel_upper:[&off_10023D2D8 intValue]];
    [-[WCM_WiFiController wifiService](self, "wifiService") setChannelConfigurationForConditionId:[&off_10023D200 intValue] enable2G:0 enable5G:1 enable6G:0 wifi_channel_lower:[&off_10023D2F0 intValue] wifi_channel_upper:[&off_10023D308 intValue]];
    [-[WCM_WiFiController wifiService](self, "wifiService") setChannelConfigurationForConditionId:[&off_10023D218 intValue] enable2G:0 enable5G:0 enable6G:1 wifi_channel_lower:[&off_10023D188 intValue] wifi_channel_upper:[&off_10023D320 intValue]];
  }
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"LTEScanProtection"))
  {
    id v4 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") platformManager];
    unsigned int v5 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") activeCoexFeatures] containsObject:@"WiFiEnhCoexSupport"];
    unsigned int v6 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") activeCoexFeatures] containsObject:@"WifiScanProtectionModeSupport"];
    unsigned int v7 = [(WCM_WiFiController *)self wifiService];
    id v8 = [v4 wcmCellularScanProtectionWiFiChannels];
    if (v5)
    {
      id v9 = [v4 wcmCellularScanProtectionWiFiChannelsWiFiEnh];
      if (v6)
      {
        id v10 = [v4 wcmWiFiScanThrottlingChannelIndices];
        id v11 = v7;
        id v12 = v8;
        id v13 = v9;
      }
      else
      {
        id v11 = v7;
        id v12 = v8;
        id v13 = v9;
        id v10 = 0;
      }
      [(WCM_WiFiService *)v11 setChannelsForCellularScanProtectionWiFiEnh:v12 wiFiEnhChannels:v13 indexArrayForScanThrottling:v10];
    }
    else
    {
      if (v6)
      {
        id v14 = [v4 wcmWiFiScanThrottlingChannelIndices];
        id v15 = v7;
        id v16 = v8;
      }
      else
      {
        id v15 = v7;
        id v16 = v8;
        id v14 = 0;
      }
      [(WCM_WiFiService *)v15 setChannelsForCellularScanProtectionWithMode:v16 indexArrayForScanThrottling:v14];
    }
    -[WCM_WiFiService setMaxDurationForCellularScanProtection:](-[WCM_WiFiController wifiService](self, "wifiService"), "setMaxDurationForCellularScanProtection:", [v4 wcmCellularScanProtectionWiFiMaxDuration]);
  }
  if ([+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton").activeCoexFeatures containsObject:@"LTELAACoexSupport"])[WCM_WiFiControllerIOS enableWifiLaaCoexMode](self); {
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"MedtronicSupport"))
  }
  {
    id v17 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") extAccessory];
    if (v17) {
      [v17 accessoryReconnect];
    }
  }
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"WiFiBtProfile"))
  {
    [(WCM_WiFiControllerIOS *)self downloadWiFiBTCoexProfiles];
    if ([(WCM_WiFiControllerIOS *)self wifiBTCoexProfilesDownloaded])
    {
      +[WCM_Logging logLevel:2 message:@"All Coex Profiles Downloaded Successfully, Activating Default Profile"];
      [(WCM_WiFiService *)[(WCM_WiFiController *)self wifiService] setWiFiBTCoexActiveProfileFor2G:0 and5G:0];
      uint64_t v18 = 0;
      uint64_t v19 = 0;
LABEL_30:
      [(WCM_WiFiControllerIOS *)self setActiveProfileFor2G:v18];
      [(WCM_WiFiControllerIOS *)self setActiveProfileFor5G:v19];
      goto LABEL_31;
    }
    goto LABEL_29;
  }
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"WiFiBt5GProfile"))
  {
    [(WCM_WiFiControllerIOS *)self downloadWiFiBTCoexProfiles];
    if ([(WCM_WiFiControllerIOS *)self wifiBTCoexProfilesDownloaded])
    {
      +[WCM_Logging logLevel:2 message:@"All Coex Profiles Downloaded Successfully, Activating Default Profiles"];
      uint64_t v19 = 6;
      [(WCM_WiFiService *)[(WCM_WiFiController *)self wifiService] setWiFiBTCoexActiveProfileFor2G:0 and5G:6];
      uint64_t v18 = 0;
      goto LABEL_30;
    }
LABEL_29:
    +[WCM_Logging logLevel:2 message:@"All Coex Profiles Not Downloaded Successfully, Not Activating"];
    uint64_t v18 = -1;
    uint64_t v19 = -1;
    goto LABEL_30;
  }
LABEL_31:
  if ([+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") activeCoexFeatures].containsObject(@"WifiGen9rFemConfig"))-[WCM_WiFiControllerIOS updatePowerOnGen9rFemConfiguration](self); {
  if ([+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton").activeCoexFeatures containsObject:@"RCU1Support"])[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") updateWiFiRCU1Status];
  }
}

- (void)clearDownloadCoexProfilesState
{
  +[WCM_Logging logLevel:2 message:@"clearDownloadCoexProfilesState"];
  [(WCM_WiFiControllerIOS *)self setWifiBTCoexProfilesDownloaded:0];
  [(WCM_WiFiControllerIOS *)self setActiveProfileFor2G:-1];

  [(WCM_WiFiControllerIOS *)self setActiveProfileFor5G:-1];
}

- (void)downloadWiFiBTCoexProfiles
{
  id v3 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") platformManager];
  [(WCM_WiFiControllerIOS *)self setWifiBTCoexProfilesDownloaded:1];
  if ([v3 wcmWiFiBTCoexProfileDefault]) {
    -[WCM_WiFiControllerIOS setWifiBTCoexProfilesDownloaded:](self, "setWifiBTCoexProfilesDownloaded:", -[WCM_WiFiService setWiFiBTCoexProfile:atIndex:](-[WCM_WiFiController wifiService](self, "wifiService"), "setWiFiBTCoexProfile:atIndex:", [v3 wcmWiFiBTCoexProfileDefault], 0) & -[WCM_WiFiControllerIOS wifiBTCoexProfilesDownloaded](self, "wifiBTCoexProfilesDownloaded"));
  }
  if ([v3 wcmWiFiBTCoexProfileLight]) {
    -[WCM_WiFiControllerIOS setWifiBTCoexProfilesDownloaded:](self, "setWifiBTCoexProfilesDownloaded:", -[WCM_WiFiService setWiFiBTCoexProfile:atIndex:](-[WCM_WiFiController wifiService](self, "wifiService"), "setWiFiBTCoexProfile:atIndex:", [v3 wcmWiFiBTCoexProfileLight], 1) & -[WCM_WiFiControllerIOS wifiBTCoexProfilesDownloaded](self, "wifiBTCoexProfilesDownloaded"));
  }
  if ([v3 wcmWiFiBTCoexProfileHeavyHFP]) {
    -[WCM_WiFiControllerIOS setWifiBTCoexProfilesDownloaded:](self, "setWifiBTCoexProfilesDownloaded:", -[WCM_WiFiService setWiFiBTCoexProfile:atIndex:](-[WCM_WiFiController wifiService](self, "wifiService"), "setWiFiBTCoexProfile:atIndex:", [v3 wcmWiFiBTCoexProfileHeavyHFP], 2) & -[WCM_WiFiControllerIOS wifiBTCoexProfilesDownloaded](self, "wifiBTCoexProfilesDownloaded"));
  }
  if ([v3 wcmWiFiBTCoexProfileHeavyA2DP]) {
    -[WCM_WiFiControllerIOS setWifiBTCoexProfilesDownloaded:](self, "setWifiBTCoexProfilesDownloaded:", -[WCM_WiFiService setWiFiBTCoexProfile:atIndex:](-[WCM_WiFiController wifiService](self, "wifiService"), "setWiFiBTCoexProfile:atIndex:", [v3 wcmWiFiBTCoexProfileHeavyA2DP], 3) & -[WCM_WiFiControllerIOS wifiBTCoexProfilesDownloaded](self, "wifiBTCoexProfilesDownloaded"));
  }
  if ([v3 wcmWiFiBTCoexProfileTDD]) {
    -[WCM_WiFiControllerIOS setWifiBTCoexProfilesDownloaded:](self, "setWifiBTCoexProfilesDownloaded:", -[WCM_WiFiService setWiFiBTCoexProfile:atIndex:](-[WCM_WiFiController wifiService](self, "wifiService"), "setWiFiBTCoexProfile:atIndex:", [v3 wcmWiFiBTCoexProfileTDD], 4) & -[WCM_WiFiControllerIOS wifiBTCoexProfilesDownloaded](self, "wifiBTCoexProfilesDownloaded"));
  }
  if ([v3 wcmWiFiBTCoexProfileDefault5G])
  {
    unsigned int v4 = -[WCM_WiFiService setWiFiBTCoexProfile:atIndex:](-[WCM_WiFiController wifiService](self, "wifiService"), "setWiFiBTCoexProfile:atIndex:", [v3 wcmWiFiBTCoexProfileDefault5G], 6);
    uint64_t v5 = v4 & [(WCM_WiFiControllerIOS *)self wifiBTCoexProfilesDownloaded];
    [(WCM_WiFiControllerIOS *)self setWifiBTCoexProfilesDownloaded:v5];
  }
}

- (id)getWiFiServiceSingletone
{
  if (qword_10027D338 != -1) {
    dispatch_once(&qword_10027D338, &stru_100211B70);
  }
  return (id)qword_10027D330;
}

- (int64_t)getWiFiBTActiveProfileFor2G
{
  return *(int64_t *)((char *)&self->_wifiAgcModeEnable + 4);
}

- (void)updateWiFiBTCoexProfile:(id)a3 atIndex:(int64_t)a4
{
  unsigned int v6 = [(WCM_WiFiController *)self wifiService];

  [(WCM_WiFiService *)v6 setWiFiBTCoexProfile:a3 atIndex:a4];
}

- (void)updateWiFiBTCoexActiveProfileFor2G:(int64_t)a3 and5G:(int64_t)a4
{
  if ([(WCM_WiFiControllerIOS *)self activeProfileFor2G] == a3
    && [(WCM_WiFiControllerIOS *)self activeProfileFor5G] == a4)
  {
    +[WCM_Logging logLevel:2, @"Already set index2G(%d) index5G(%d)", a3, a4 message];
    return;
  }
  if ([(WCM_WiFiControllerIOS *)self wifiBTCoexProfilesDownloaded]) {
    goto LABEL_7;
  }
  +[WCM_Logging logLevel:2 message:@"All Coex Profiles Not Downloaded Successfully, Attempting to Download Again"];
  [(WCM_WiFiControllerIOS *)self downloadWiFiBTCoexProfiles];
  if ([(WCM_WiFiControllerIOS *)self wifiBTCoexProfilesDownloaded])
  {
    +[WCM_Logging logLevel:2 message:@"All Coex Profiles Downloaded Successfully on 2nd Attempt, Updating"];
LABEL_7:
    [(WCM_WiFiControllerIOS *)self setActiveProfileFor2G:a3];
    [(WCM_WiFiControllerIOS *)self setActiveProfileFor5G:a4];
    unsigned int v7 = [(WCM_WiFiController *)self wifiService];
    [(WCM_WiFiService *)v7 setWiFiBTCoexActiveProfileFor2G:a3 and5G:a4];
    return;
  }
  +[WCM_Logging logLevel:2 message:@"All Coex Profiles Not Downloaded Successfully On 2nd Attepmt, Not Activating"];
  [(WCM_WiFiControllerIOS *)self setActiveProfileFor2G:-1];

  [(WCM_WiFiControllerIOS *)self setActiveProfileFor5G:-1];
}

- (void)updateChannelsToEnableWCI2V2:(id)a3
{
  if (objc_msgSend(a3, "isEqualToArray:", -[WCM_WiFiControllerIOS channelsWCI2EnabledV2](self, "channelsWCI2EnabledV2")))
  {
    +[WCM_Logging logLevel:4, @"WCI2_V2: WCI2 is already enabled on channels %@", a3 message];
  }
  else
  {
    [(WCM_WiFiControllerIOS *)self setChannelsWCI2EnabledV2:a3];
    uint64_t v5 = [(WCM_WiFiController *)self wifiService];
    [(WCM_WiFiService *)v5 setChannelsToEnableWCI2V2:a3];
  }
}

- (void)updateChannelsToEnableType7MSG:(id)a3
{
  if (objc_msgSend(a3, "isEqualToArray:", -[WCM_WiFiControllerIOS channelsToEnableType7MSG](self, "channelsToEnableType7MSG")))
  {
    +[WCM_Logging logLevel:4, @"DLDebug_: WiFi_Type7 MSG is already enabled on channels %@", a3 message];
  }
  else
  {
    [(WCM_WiFiControllerIOS *)self setChannelsToEnableType7MSG:a3];
    uint64_t v5 = [(WCM_WiFiController *)self wifiService];
    [(WCM_WiFiService *)v5 setChannelsToEnableType7MSG:a3];
  }
}

- (void)updateChannelsToEnableType7MSG2GWiFi:(id)a3
{
  if (objc_msgSend(a3, "isEqualToArray:", -[WCM_WiFiControllerIOS channelsToEnableType7MSG2GWiFi](self, "channelsToEnableType7MSG2GWiFi")))
  {
    +[WCM_Logging logLevel:4, @"DLDebug_: 2GWiFi_Type7 MSG is already enabled on channels %@", a3 message];
  }
  else
  {
    [(WCM_WiFiControllerIOS *)self setChannelsToEnableType7MSG2GWiFi:a3];
    uint64_t v5 = [(WCM_WiFiController *)self wifiService];
    unsigned int v6 = [(WCM_WiFiControllerIOS *)self channelsToEnableType7MSG2GWiFi];
    [(WCM_WiFiService *)v5 setChannelsToEnableType7MSG2GWiFi:v6];
  }
}

- (void)updateChannelsToDisableOCL:(id)a3
{
  if (a3)
  {
    if (objc_msgSend(a3, "isEqualToArray:", -[WCM_WiFiControllerIOS channelsOCLDisabled](self, "channelsOCLDisabled")))
    {
      +[WCM_Logging logLevel:4, @"Already OCL disabled on channels %@", a3 message];
    }
    else
    {
      [(WCM_WiFiControllerIOS *)self setChannelsOCLDisabled:a3];
      uint64_t v5 = [(WCM_WiFiController *)self wifiService];
      [(WCM_WiFiService *)v5 setChannelsToDisableOCL:a3];
    }
  }
  else
  {
    +[WCM_Logging logLevel:4 message:@"DLWarning: channels is a null pointer. Return here"];
  }
}

- (void)updateAntennaPreference:(id)a3 withCellPolicy:(id)a4
{
  unsigned int v6 = self;
  if (objc_msgSend(a3, "isEqualToArray:", -[WCM_WiFiControllerIOS antennaConfig](self, "antennaConfig")))
  {
    +[WCM_Logging logLevel:4, @"Already set antennaPreference %@", a3 message];
  }
  else
  {
    uint64_t v18 = v6;
    [(WCM_WiFiControllerIOS *)v6 setAntennaConfig:a3];
    id v7 = [a3 firstObject];
    id v8 = [a3 lastObject];
    uint64_t v9 = 0;
    LODWORD(v6) = 858980352;
    char v10 = 1;
    do
    {
      char v11 = v10;
      id v12 = (_UNKNOWN **)[v7 objectAtIndex:v9];
      if ([v12 isEqual:&off_10023D170]) {
        id v13 = &off_10023D1B8;
      }
      else {
        id v13 = v12;
      }
      uint64_t v14 = ([v13 intValue] << (8 * v9)) | v6;
      +[WCM_Logging logLevel:3, @"2G Core %d config Command = 0x%x Antenna Config = %@", v9, v14, v12 message];
      id v15 = (_UNKNOWN **)[v8 objectAtIndex:v9];
      if ([v15 isEqual:&off_10023D170]) {
        id v16 = &off_10023D1B8;
      }
      else {
        id v16 = v15;
      }
      unsigned int v6 = (WCM_WiFiControllerIOS *)(([v16 intValue] << ((8 * v9) | 4)) | v14);
      +[WCM_Logging logLevel:3, @"5G Core %d config Command = 0x%x Antenna Config = %@", v9, v6, v15 message];
      char v10 = 0;
      uint64_t v9 = 1;
    }
    while ((v11 & 1) != 0);
    [objc_msgSend(v18, "wifiService") setRxAntennaPreference:[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 858993459)];
    [objc_msgSend(v18, "wifiService") setTxAntennaPreference:+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 858993459)];
    if (v6 != 858993459)
    {
      [objc_msgSend(v18, "wifiService") setTxAntennaPreference:[NSNumber numberWithInt:v6]];
      [objc_msgSend(v18, "wifiService") setRxAntennaPreference:[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v6)];
      id v17 = [v18 wifiService];
      [v17 setAntennaCellPolicy:a4];
    }
  }
}

- (void)updateAntennaSelection:(id)a3
{
  if (objc_msgSend(a3, "isEqualToArray:", -[WCM_WiFiControllerIOS antennaSelection](self, "antennaSelection")))
  {
    +[WCM_Logging logLevel:4, @"Already set antennaSelection %@", a3 message];
  }
  else
  {
    [(WCM_WiFiControllerIOS *)self setAntennaSelection:a3];
    uint64_t v5 = [(WCM_WiFiController *)self wifiService];
    [(WCM_WiFiService *)v5 setAntennaSelection:a3];
  }
}

- (void)updateAntennaSelectionV2:(id)a3
{
  if (objc_msgSend(a3, "isEqualToArray:", -[WCM_WiFiControllerIOS antennaSelection](self, "antennaSelection")))
  {
    +[WCM_Logging logLevel:4, @"Already set antennaSelection %@", a3 message];
  }
  else
  {
    [(WCM_WiFiControllerIOS *)self setAntennaSelection:a3];
    uint64_t v5 = [(WCM_WiFiController *)self wifiService];
    [(WCM_WiFiService *)v5 setAntennaSelectionV2:a3];
  }
}

- (void)updateMWSSignalingConfig
{
  id v3 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") platformManager];
  v4[0] = @"MWS_WCI_Signaling_RxAssertOffset";
  v5[0] = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)[v3 wcmWCI2MWSRxAssertOffset]);
  v4[1] = @"MWS_WCI_Signaling_RxAssertJitter";
  v5[1] = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)[v3 wcmWCI2MWSRxAssertJitter]);
  v4[2] = @"MWS_WCI_Signaling_RxDeAssertOffset";
  v5[2] = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)[v3 wcmWCI2MWSRxDeAssertOffset]);
  v4[3] = @"MWS_WCI_Signaling_RxDeAssertJitter";
  v5[3] = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)[v3 wcmWCI2MWSRxDeAssertJitter]);
  v4[4] = @"MWS_WCI_Signaling_TxAssertOffset";
  v5[4] = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)[v3 wcmWCI2MWSTxAssertOffset]);
  v4[5] = @"MWS_WCI_Signaling_TxAssertJitter";
  v5[5] = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)[v3 wcmWCI2MWSTxAssertJitter]);
  v4[6] = @"MWS_WCI_Signaling_TxDeAssertOffset";
  v5[6] = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)[v3 wcmWCI2MWSTxDeAssertOffset]);
  v4[7] = @"MWS_WCI_Signaling_TxDeAssertJitter";
  v5[7] = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)[v3 wcmWCI2MWSTxDeAssertJitter]);
  v4[8] = @"MWS_WCI_Signaling_PatternAssertOffset";
  v5[8] = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)[v3 wcmWCI2MWSPatternAssertOffset]);
  v4[9] = @"MWS_WCI_Signaling_PatternAssertJitter";
  v5[9] = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)[v3 wcmWCI2MWSPatternAssertJitter]);
  v4[10] = @"MWS_WCI_Signaling_InactivityAssertOffset";
  v5[10] = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)[v3 wcmWCI2MWSInactivityAssertOffset]);
  v4[11] = @"MWS_WCI_Signaling_InactivityAssertJitter";
  v5[11] = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)[v3 wcmWCI2MWSInactivityAssertJitter]);
  v4[12] = @"MWS_WCI_Signaling_ScanFrequencyAssertOffset";
  v5[12] = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)[v3 wcmWCI2MWSScanFrequencyAssertOffset]);
  v4[13] = @"MWS_WCI_Signaling_ScanFrequencyAssertJitter";
  v5[13] = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)[v3 wcmWCI2MWSScanFrequencyAssertJitter]);
  v4[14] = @"MWS_WCI_Signaling_PriorityAssertOffsetRequest";
  v5[14] = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)[v3 wcmWCI2MWSPriorityAssertOffsetRequest]);
  [(WCM_WiFiService *)[(WCM_WiFiController *)self wifiService] setMWSSignalingConfig:+[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:15]];
}

- (BOOL)isCarPlaySessionInProgress
{
  +[WCM_Logging logLevel:2, @"WiFi IOS Controller CarPlaySessioninProgress state:(%d)", [(WCM_WiFiControllerIOS *)self mCarPlaySessionInProgress] message];

  return [(WCM_WiFiControllerIOS *)self mCarPlaySessionInProgress];
}

- (int)getCarPlayScanRelaxReason
{
  +[WCM_Logging logLevel:2, @"WiFi IOS Controller CarPlayRelaxReason :(%d)", [(WCM_WiFiControllerIOS *)self mCarPlayBTScanRelaxReason] message];

  return [(WCM_WiFiControllerIOS *)self mCarPlayBTScanRelaxReason];
}

- (void)updateCarPlaySessionState:(BOOL)a3 reason:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  +[WCM_Logging logLevel:2, @"Update IOS Controller CarPlayState state:(%d), reason:(%d)", a3, *(void *)&a4 message];
  [(WCM_WiFiControllerIOS *)self setMCarPlaySessionInProgress:v5];
  [(WCM_WiFiControllerIOS *)self setMCarPlayBTScanRelaxReason:v4];
  v7.receiver = self;
  v7.super_class = (Class)WCM_WiFiControllerIOS;
  [(WCM_WiFiController *)&v7 updateCarPlaySessionState:v5 reason:v4];
}

- (void)updateContentionFreeWiFiInfoToRC2:(unsigned int)a3 count:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  +[WCM_Logging logLevel:0 message:@"WiFi IOS Controller updateContentionFreeWiFiInfoToRC2 implementation"];
  [(WCM_WiFiControllerIOS *)self setMLeastCongestedChannel:v5];
  [(WCM_WiFiControllerIOS *)self setMLeastCongestedChannelCount:v4];
  v7.receiver = self;
  v7.super_class = (Class)WCM_WiFiControllerIOS;
  [(WCM_WiFiController *)&v7 updateContentionFreeWiFiInfoToRC2:v5 count:v4];
}

- (id)getLeastCongestedWifiParam
{
  +[WCM_Logging logLevel:0 message:@"WiFi IOS Controller getLeastCongestedWifiParam implementation"];
  id v3 = +[NSMutableArray array];
  [v3 addObject:[NSNumber numberWithUnsignedInt:-[WCM_WiFiControllerIOS mLeastCongestedChannel](self, "mLeastCongestedChannel")]];
  [v3 addObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[WCM_WiFiControllerIOS mLeastCongestedChannelCount](self, "mLeastCongestedChannelCount"))]];
  return v3;
}

- (void)updateCellularFrequencyConfig:(id)a3 withWiFiRangingDesenseFlag:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    if (([a3 bandInfoType] & 0x21) != 0)
    {
      [a3 ulCenterFreq];
      double v8 = v7;
      [(WCM_WiFiControllerIOS *)self cellularULCenterFreq];
      if (v8 != v9) {
        goto LABEL_10;
      }
      [a3 ulBandwidth];
      double v11 = v10;
      [(WCM_WiFiControllerIOS *)self cellularULBandwidth];
      if (v11 != v12) {
        goto LABEL_10;
      }
      [a3 ulCenterFreq2];
      double v14 = v13;
      [(WCM_WiFiControllerIOS *)self cellularULCenterFreq2];
      if (v14 == v15
        && ([a3 ulBandwidth2],
            double v17 = v16,
            [(WCM_WiFiControllerIOS *)self cellularULBandwidth2],
            v17 == v18))
      {
        +[WCM_Logging logLevel:3 message:@"Skip sending cellular frequency config as uplink carriers are the same as previous ones"];
      }
      else
      {
LABEL_10:
        [a3 ulCenterFreq];
        -[WCM_WiFiControllerIOS setCellularULCenterFreq:](self, "setCellularULCenterFreq:");
        [a3 ulBandwidth];
        -[WCM_WiFiControllerIOS setCellularULBandwidth:](self, "setCellularULBandwidth:");
        [a3 ulCenterFreq2];
        -[WCM_WiFiControllerIOS setCellularULCenterFreq2:](self, "setCellularULCenterFreq2:");
        [a3 ulBandwidth2];
        -[WCM_WiFiControllerIOS setCellularULBandwidth2:](self, "setCellularULBandwidth2:");
        BOOL v19 = [a3 bandInfoType] != 1;
        id v20 = +[NSMutableArray array];
        [a3 ulCenterFreq];
        if (v21 != 0.0)
        {
          [a3 ulBandwidth];
          if (v22 != 0.0)
          {
            [a3 ulCenterFreq];
            uint64_t v24 = +[NSNumber numberWithUnsignedInt:(v23 * 1000.0)];
            [a3 ulBandwidth];
            [v20 addObject:[NSDictionary dictionaryWithObjectsAndKeys:v24, @"MWS_CELLULAR_FREQ_CONFIG_CENTER", [NSNumber numberWithUnsignedInt:(v25 * 1000.0)], @"MWS_CELLULAR_FREQ_CONFIG_BW", 0]];
          }
        }
        [a3 ulCenterFreq2];
        if (v26 != 0.0)
        {
          [a3 ulBandwidth2];
          if (v27 != 0.0)
          {
            [a3 ulCenterFreq2];
            v29 = +[NSNumber numberWithUnsignedInt:(v28 * 1000.0)];
            [a3 ulBandwidth2];
            [v20 addObject:[NSDictionary dictionaryWithObjectsAndKeys:v29, @"MWS_CELLULAR_FREQ_CONFIG_CENTER", [NSNumber numberWithUnsignedInt:v30 * 1000.0], @"MWS_CELLULAR_FREQ_CONFIG_BW", 0]];
          }
        }
        id v31 = +[NSMutableArray array];
        [a3 dlCenterFreq];
        if (v32 != 0.0)
        {
          [a3 dlBandwidth];
          if (v33 != 0.0)
          {
            [a3 dlCenterFreq];
            v35 = +[NSNumber numberWithUnsignedInt:(v34 * 1000.0)];
            [a3 dlBandwidth];
            [v31 addObject:[NSDictionary dictionaryWithObjectsAndKeys:v35, @"MWS_CELLULAR_FREQ_CONFIG_CENTER", [NSNumber numberWithUnsignedInt:v36 * 1000.0], @"MWS_CELLULAR_FREQ_CONFIG_BW", 0]];
          }
        }
        [a3 dlCenterFreq2];
        if (v37 != 0.0)
        {
          [a3 dlBandwidth2];
          if (v38 != 0.0)
          {
            [a3 dlCenterFreq2];
            v40 = +[NSNumber numberWithUnsignedInt:(v39 * 1000.0)];
            [a3 dlBandwidth2];
            [v31 addObject:[+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v40, @"MWS_CELLULAR_FREQ_CONFIG_CENTER", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", (v41 * 1000.0)), @"MWS_CELLULAR_FREQ_CONFIG_BW", 0)]];
          }
        }
        v42[0] = @"MWS_CELLULAR_FREQ_CONFIG_TECH";
        v43[0] = +[NSNumber numberWithInt:v19];
        v43[1] = v20;
        v42[1] = @"MWS_CELLULAR_FREQ_CONFIG_UL";
        v42[2] = @"MWS_CELLULAR_FREQ_CONFIG_DL";
        v43[2] = v31;
        v42[3] = @"MWS_CELLULAR_FREQ_CONFIG_DESENSE_TOF";
        v43[3] = +[NSNumber numberWithInt:v4];
        [(WCM_WiFiService *)[(WCM_WiFiController *)self wifiService] setCellularFrequencyConfig:+[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:4]];
      }
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, @"Skip sending cellular frequency config on bandInfoType(%d)", [a3 bandInfoType]);
    }
  }
}

- (void)updateWifiEnvelopeParams
{
  id v3 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") platformManager];
  [WCM_Logging logLevel:3 message:@"Wifi Controller Envelope setting envelope params %@ %@", [v3 wcmWiFiEnvelopeOnIndication], [v3 wcmWiFiEnvelopeIndicationTimer]];
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"WifiBt2gEnvelopeIndication"))
  {
    -[WCM_WiFiService setEnableEnvelopeIndicationFor2G:](-[WCM_WiFiController wifiService](self, "wifiService"), "setEnableEnvelopeIndicationFor2G:", [v3 wcmWiFiEnvelopeOnIndication]);
    BOOL v4 = [(WCM_WiFiController *)self wifiService];
    id v5 = [v3 wcmWiFiEnvelopeIndicationTimer];
    [(WCM_WiFiService *)v4 setEnvelopeIndicationTimerFor2G:v5];
  }
}

- (void)setWifiAgcCoexMode:(id)a3
{
  if ([(NSNumber *)[(WCM_WiFiControllerIOS *)self wifiAgcModeEnable] isEqualToNumber:a3])
  {
    +[WCM_Logging logLevel:4, @"Wifi Coex Agc Rx Gain Mode already set to %@", a3 message];
  }
  else
  {
    [(WCM_WiFiControllerIOS *)self setWifiAgcModeEnable:a3];
    +[WCM_Logging logLevel:3, @"Wifi Controller setting Agc Rx Coex Gain Mode %@", a3 message];
    id v5 = [(WCM_WiFiController *)self wifiService];
    [(WCM_WiFiService *)v5 setEnableAgcCoexMode:a3];
  }
}

- (void)enableWifiLaaCoexMode
{
  id v3 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") platformManager];
  +[WCM_Logging logLevel:message:](WCM_Logging, @"Wifi Controller setting LAA params TxDurationThresh %@ ActiveScanThrottleMask %@ ActiveDwellTime %@", [v3 wcmWiFiWCI2TxDurationThresh], [v3 wcmWiFiActiveScanThrottleMask], [v3 wcmWiFiActiveDwellTime]);
  [(WCM_WiFiService *)[(WCM_WiFiController *)self wifiService] setLAACoexConfigEnableTxInd];
  -[WCM_WiFiService setLAACoexConfigWci2TxDurationThreshold:](-[WCM_WiFiController wifiService](self, "wifiService"), "setLAACoexConfigWci2TxDurationThreshold:", [v3 wcmWiFiWCI2TxDurationThresh]);
  -[WCM_WiFiService setLAACoexConfigScanThrottleMask:](-[WCM_WiFiController wifiService](self, "wifiService"), "setLAACoexConfigScanThrottleMask:", [v3 wcmWiFiActiveScanThrottleMask]);
  BOOL v4 = [(WCM_WiFiController *)self wifiService];
  id v5 = [v3 wcmWiFiActiveDwellTime];

  [(WCM_WiFiService *)v4 setLAACoexConfigWifiDwellTime:v5];
}

- (void)updateMedtronicState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v4 = [(WCM_WiFiController *)self wifiService];

  [(WCM_WiFiService *)v4 setMedtronicState:v3];
}

- (void)updatePowerOnGen9rFemConfiguration
{
  id v3 = +[WCM_PolicyManager singleton];
  [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") platformManager];
  +[WCM_Logging logLevel:2 message:@"Wifi Controller: updatePowerOnGen9rFemConfiguration"];
  unsigned int v4 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") activeCoexFeatures] containsObject:@"WifiGen9rFemConfig2gWifiOnly"];
  id v5 = [(WCM_WiFiController *)self wifiService];
  id v6 = [v3 wcmGen9rFemLpmMode2g];
  if (v4)
  {
    double v7 = v5;
    id v8 = v6;
    id v9 = 0;
    id v10 = 0;
    uint64_t v11 = 0;
  }
  else
  {
    id v12 = [v3 wcmGen9rFemLpmMode5g];
    id v10 = [v3 wcmGen9rFemLpmMode5g];
    double v7 = v5;
    id v8 = v6;
    id v9 = v12;
    uint64_t v11 = 1;
  }

  [(WCM_WiFiService *)v7 setChannelsToEnablerFemModeWiFiEnh:v8 enable5G:v9 enable6G:v10 setDefaultForall:v11];
}

- (void)updateWiFiBTULOFDMAstate:(BOOL)a3
{
  BOOL v3 = a3;
  +[WCM_Logging logLevel:2, @"Wifi Controller: WiFi / BT setting UL OFDMA disable state (%d)", a3 message];
  id v5 = [(WCM_WiFiController *)self wifiService];

  [(WCM_WiFiService *)v5 setWiFiBTULOFDMAstate:v3];
}

- (void)updateWiFiRCU1ULOFDMAstate:(BOOL)a3
{
  BOOL v3 = a3;
  +[WCM_Logging logLevel:2, @"Wifi Controller: WiFi / RCU1 setting UL OFDMA disable state (%d)", a3 message];
  id v5 = [(WCM_WiFiController *)self wifiService];

  [(WCM_WiFiService *)v5 setWiFiRCU1ULOFDMAstate:v3];
}

- (void)updateWiFiRCU2ULOFDMAstate:(BOOL)a3
{
  BOOL v3 = a3;
  +[WCM_Logging logLevel:2, @"Wifi Controller: WiFi / RCU2 setting UL OFDMA disable state (%d)", a3 message];
  id v5 = [(WCM_WiFiController *)self wifiService];

  [(WCM_WiFiService *)v5 setWiFiRCU2ULOFDMAstate:v3];
}

- (void)updateWiFiRCU1ModeChanged:(BOOL)a3 andChannelChanged:(BOOL)a4 andMode:(id)a5 andChannel:(id)a6
{
  BOOL v8 = a4;
  BOOL v9 = a3;
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"RCU1Support"))
  {
    +[WCM_Logging logLevel:2, @"Wifi Controller setting RCU1 ModeChanged(%d) ChanChanged(%d) Mode(%@) Chan(%@)", v9, v8, a5, a6 message];
    uint64_t v11 = [(WCM_WiFiController *)self wifiService];
    [(WCM_WiFiService *)v11 setWiFiRCU1ModeChanged:v9 andChannelChanged:v8 andMode:a5 andChannel:a6];
  }
}

- (void)updateWiFiBTLeConnEnable:(BOOL)a3 andPeakOutageMs:(unsigned int)a4 andDurationMs:(unsigned int)a5 andDutyCycle:(unsigned int)a6 andReason:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  BOOL v11 = a3;
  +[WCM_Logging logLevel:2, @"Wifi Controller sending LeConn enable(%d) peakOutageMs(%d) durationMs(%d) dutyCycle(%d) reason(%d)", a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7 message];
  double v13 = [(WCM_WiFiController *)self wifiService];

  [(WCM_WiFiService *)v13 setWiFiBTLeConnEnable:v11 andPeakOutageMs:v10 andDurationMs:v9 andDutyCycle:v8 andReason:v7];
}

- (void)updateWiFiRCU2CoexMode:(id)a3
{
  +[WCM_Logging logLevel:2, @"Wifi Controller setting RCU2 Coex Mode (%@)", a3 message];
  id v5 = [(WCM_WiFiController *)self wifiService];

  [(WCM_WiFiService *)v5 setWiFiRCU2CoexMode:a3];
}

- (void)updateWiFiRCU2PMProtectionMode:(id)a3
{
  +[WCM_Logging logLevel:2, @"Wifi Controller setting RCU2 PM Protection Mode (%@)", a3 message];
  id v5 = [(WCM_WiFiController *)self wifiService];

  [(WCM_WiFiService *)v5 setWiFiRCU2PMProtectionMode:a3];
}

- (void)updateWiFiRCU2TimingArray:(id)a3
{
  +[WCM_Logging logLevel:2, @"Wifi Controller setting RCU2 Timing Array (%@)", a3 message];
  id v5 = [(WCM_WiFiController *)self wifiService];

  [(WCM_WiFiService *)v5 setWiFiRCU2TimingArray:a3];
}

- (void)setHPovrLEscanGrantDuration:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned int v4 = [(WCM_WiFiController *)self wifiService];

  [(WCM_WiFiService *)v4 setHPovrLEscanGrantDuration:v3];
}

- (void)setCriticalWiFiTraffic:(BOOL)a3 duration:(unsigned int)a4 criticalityPercentage:(unsigned __int16)a5 forProcessID:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = a5;
  uint64_t v8 = *(void *)&a4;
  BOOL v9 = a3;
  +[WCM_Logging logLevel:2, @"Wifi Controller setting Airplay critical wifi traffic (%d), duration (ms) (%d), criticality percentage (%d), processID (%d)", a3, *(void *)&a4, a5, *(void *)&a6 message];
  BOOL v11 = [(WCM_WiFiController *)self wifiService];

  [(WCM_WiFiService *)v11 setCriticalWiFiTraffic:v9 duration:v8 criticalityPercentage:v7 forProcessID:v6];
}

- (void)updateRCU2CoexParams:(id)a3
{
  +[WCM_Logging logLevel:2, @"Wifi Controller setting RCU2 coex param (%@)", a3 message];
  id v5 = [(WCM_WiFiController *)self wifiService];

  [(WCM_WiFiService *)v5 setRCU2CoexParams:a3];
}

- (void)updateWiFieSCOActiveStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  +[WCM_Logging logLevel:2, @"Wifi Controller sending eSCO indication to Wifi (%d)", *(void *)&a3 message];
  id v5 = [(WCM_WiFiController *)self wifiService];

  [(WCM_WiFiService *)v5 setWifiBTeSCOStatus:v3];
}

- (void)updateWiFiLimitedAggregationActiveStatus:(int)a3
{
}

- (void)updateWiFiA2DPActiveStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  +[WCM_Logging logLevel:2, @"Wifi Controller sending A2DP indication to Wifi (%d)", *(void *)&a3 message];
  id v5 = [(WCM_WiFiController *)self wifiService];

  [(WCM_WiFiService *)v5 setWifiBTA2DPStatus:v3];
}

- (void)updateWiFiA2DPLLAActiveStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  +[WCM_Logging logLevel:2, @"Wifi Controller sending A2DP LLA indication to Wifi (%d)", *(void *)&a3 message];
  id v5 = [(WCM_WiFiController *)self wifiService];

  [(WCM_WiFiService *)v5 setWifiBTA2DPLLAStatus:v3];
}

- (void)updateWiFiBTConnectionReport:(id)a3
{
  +[WCM_Logging logLevel:2 message:@"Wifi Controller sending BT Connection Report to Wifi"];
  id v5 = [(WCM_WiFiController *)self wifiService];

  [(WCM_WiFiService *)v5 setBTConnectionReport:a3];
}

- (void)bspUpdateBTStatus_powerState:(BOOL)a3 frequencyBand:(int)a4 ullaMode:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  BOOL v7 = a3;
  +[WCM_Logging logLevel:2, @"Wifi Controller sending bspUpdateBTStatus to Wifi (%d, 0x%x, %d)", a3, *(void *)&a4, *(void *)&a5 message];
  BOOL v9 = [(WCM_WiFiController *)self wifiService];

  [(WCM_WiFiService *)v9 bspUpdateBTStatus_powerState:v7 frequencyBand:v6 ullaMode:v5];
}

- (void)bspBandSwitchRequest:(int)a3 targetBand:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  +[WCM_Logging logLevel:2, @"Wifi Controller sending bspBandSwitchRequest to Wifi (0x%x, 0x%x)", *(void *)&a3, *(void *)&a4 message];
  BOOL v7 = [(WCM_WiFiController *)self wifiService];

  [(WCM_WiFiService *)v7 bspBandSwitchRequest:v5 targetBand:v4];
}

- (void)bspStatusRequest
{
  +[WCM_Logging logLevel:2 message:@"Wifi Controller sending bspStatusRequest to Wifi"];
  uint64_t v3 = [(WCM_WiFiController *)self wifiService];

  [(WCM_WiFiService *)v3 bspStatusRequest];
}

- (void)bspRegulatoryInfoRequest
{
  +[WCM_Logging logLevel:2 message:@"Wifi Controller sending bspRegulatoryInfoRequest to Wifi"];
  uint64_t v3 = [(WCM_WiFiController *)self wifiService];

  [(WCM_WiFiService *)v3 bspRegulatoryInfoRequest];
}

- (void)bspNanPhsStateRequest
{
  +[WCM_Logging logLevel:2 message:@"Wifi Controller sending bspNanPhsStateRequest to Wifi"];
  uint64_t v3 = [(WCM_WiFiController *)self wifiService];

  [(WCM_WiFiService *)v3 bspNanPhsStateRequest];
}

- (void)bspSetCoexMode:(BOOL)a3 wifiSupportedBands:(int)a4 btCurrentBand:(int)a5 btSupportedBands:(int)a6 setTimeToTSTOnly:(BOOL)a7 timeToTST:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  BOOL v9 = a7;
  uint64_t v10 = *(void *)&a6;
  uint64_t v11 = *(void *)&a5;
  uint64_t v12 = *(void *)&a4;
  BOOL v13 = a3;
  +[WCM_Logging logLevel:2 message:@"Wifi Controller sending bspSetCoexMode to Wifi"];
  double v15 = [(WCM_WiFiController *)self wifiService];

  [(WCM_WiFiService *)v15 bspSetCoexMode:v13 wifiSupportedBands:v12 btCurrentBand:v11 btSupportedBands:v10 setTimeToTSTOnly:v9 timeToTST:v8];
}

- (void)bspGetBandSwitchStatus
{
  +[WCM_Logging logLevel:2 message:@"Wifi Controller sending bspGetBandSwitchStatus to Wifi"];
  uint64_t v3 = [(WCM_WiFiController *)self wifiService];

  [(WCM_WiFiService *)v3 bspGetBandSwitchStatus];
}

- (void)bspGetChannelQualityInfo
{
  +[WCM_Logging logLevel:2 message:@"Wifi Controller sending bspGetChannelQualityInfo to Wifi"];
  uint64_t v3 = [(WCM_WiFiController *)self wifiService];

  [(WCM_WiFiService *)v3 bspGetChannelQualityInfo];
}

- (void)setCoexParams:(const char *)a3 withValue:(id)a4
{
  +[WCM_Logging logLevel:2, @"Wifi Controller setting params for %s", a3 message];
  BOOL v7 = [(WCM_WiFiController *)self wifiService];

  [(WCM_WiFiService *)v7 setCoexParams:a3 withValue:a4];
}

- (void)setAntennaSelectionWiFiEnh:(id)a3
{
  +[WCM_Logging logLevel:2, @"Wifi Controller setting antennaSelection %@", a3 message];
  uint64_t v5 = [(WCM_WiFiController *)self wifiService];

  [(WCM_WiFiService *)v5 setAntennaSelectionWiFiEnh:a3];
}

- (void)setLteCDRXTDDMode:(BOOL)a3
{
  BYTE4(self->super._catsAppBitmap) = a3;
}

- (void)setRxPriThreshold:(id)a3
{
}

- (void)setChannelsBlocklisted:(id)a3
{
}

- (void)setChannelsWCI2Enabled:(id)a3
{
}

- (NSMutableArray)channelsWCI2EnabledV2
{
  return *(NSMutableArray **)((char *)&self->_channelsWCI2Enabled + 4);
}

- (void)setChannelsWCI2EnabledV2:(id)a3
{
}

- (void)setChannelsWCI2Enabled2Gand5G:(id)a3
{
}

- (void)setChannelsWCI2EnabledWiFiEnh:(id)a3
{
}

- (NSMutableArray)channelsToEnableType7MSG
{
  return *(NSMutableArray **)((char *)&self->_channelsWCI2EnabledWiFiEnh + 4);
}

- (void)setChannelsToEnableType7MSG:(id)a3
{
}

- (NSMutableArray)channelsToEnableType7MSG2GWiFi
{
  return *(NSMutableArray **)((char *)&self->_channelsToEnableType7MSG + 4);
}

- (void)setChannelsToEnableType7MSG2GWiFi:(id)a3
{
}

- (void)setChannelsWiFiType7MSG2Gand5G:(id)a3
{
}

- (void)setChannelsWiFiType7MSGWiFiEnh:(id)a3
{
}

- (NSArray)channelsOCLDisabled
{
  return *(NSArray **)((char *)&self->_channelsWiFiType7MSGWiFiEnh + 4);
}

- (void)setChannelsOCLDisabled:(id)a3
{
}

- (void)setChannelsDisableOCL2Gand5G:(id)a3
{
}

- (void)setChannelsDisableOCLWiFiEnh:(id)a3
{
}

- (NSArray)antennaConfig
{
  return *(NSArray **)((char *)&self->_channelsDisableOCLWiFiEnh + 4);
}

- (void)setAntennaConfig:(id)a3
{
}

- (NSArray)antennaSelection
{
  return *(NSArray **)((char *)&self->_antennaConfig + 4);
}

- (void)setAntennaSelection:(id)a3
{
}

- (void)setAntennaSelectionEnh2G:(id)a3
{
}

- (void)setAntennaSelectionEnh5G:(id)a3
{
}

- (void)setAntennaSelectionEnh6G:(id)a3
{
}

- (void)setCdrxTDDEnabledChannels:(id)a3
{
}

- (NSArray)scanChannels
{
  return *(NSArray **)((char *)&self->_cdrxTDDEnabledChannels + 4);
}

- (void)setScanChannels:(id)a3
{
}

- (void)setFrameConfiguration:(id)a3
{
}

- (double)cellularULCenterFreq
{
  return *(double *)((char *)&self->_frameConfiguration + 4);
}

- (void)setCellularULCenterFreq:(double)a3
{
  *(double *)((char *)&self->_frameConfiguration + 4) = a3;
}

- (double)cellularULBandwidth
{
  return *(double *)((char *)&self->_cellularULCenterFreq + 4);
}

- (void)setCellularULBandwidth:(double)a3
{
  *(double *)((char *)&self->_cellularULCenterFreq + 4) = a3;
}

- (double)cellularULCenterFreq2
{
  return *(double *)((char *)&self->_cellularULBandwidth + 4);
}

- (void)setCellularULCenterFreq2:(double)a3
{
  *(double *)((char *)&self->_cellularULBandwidth + 4) = a3;
}

- (double)cellularULBandwidth2
{
  return *(double *)((char *)&self->_cellularULCenterFreq2 + 4);
}

- (void)setCellularULBandwidth2:(double)a3
{
  *(double *)((char *)&self->_cellularULCenterFreq2 + 4) = a3;
}

- (NSNumber)wifiAgcModeEnable
{
  return *(NSNumber **)((char *)&self->_cellularULBandwidth2 + 4);
}

- (void)setWifiAgcModeEnable:(id)a3
{
}

- (BOOL)mCarPlaySessionInProgress
{
  return BYTE5(self->super._catsAppBitmap);
}

- (void)setMCarPlaySessionInProgress:(BOOL)a3
{
  BYTE5(self->super._catsAppBitmap) = a3;
}

- (int)mCarPlayBTScanRelaxReason
{
  return *(_DWORD *)&self->_lteCDRXTDDMode;
}

- (void)setMCarPlayBTScanRelaxReason:(int)a3
{
  *(_DWORD *)&self->_lteCDRXTDDMode = a3;
}

- (unsigned)mLeastCongestedChannel
{
  return self->_mCarPlayBTScanRelaxReason;
}

- (void)setMLeastCongestedChannel:(unsigned int)a3
{
  self->_mCarPlayBTScanRelaxReason = a3;
}

- (unsigned)mLeastCongestedChannelCount
{
  return self->_mLeastCongestedChannel;
}

- (void)setMLeastCongestedChannelCount:(unsigned int)a3
{
  self->_mLeastCongestedChannel = a3;
}

- (int64_t)activeProfileFor2G
{
  return *(int64_t *)((char *)&self->_wifiAgcModeEnable + 4);
}

- (void)setActiveProfileFor2G:(int64_t)a3
{
  *(NSNumber **)((char *)&self->_wifiAgcModeEnable + 4) = (NSNumber *)a3;
}

- (int64_t)activeProfileFor5G
{
  return *(int64_t *)((char *)&self->_activeProfileFor2G + 4);
}

- (void)setActiveProfileFor5G:(int64_t)a3
{
  *(int64_t *)((char *)&self->_activeProfileFor2G + 4) = a3;
}

- (BOOL)sharedAntennaDisabled
{
  return BYTE6(self->super._catsAppBitmap);
}

- (void)setSharedAntennaDisabled:(BOOL)a3
{
  BYTE6(self->super._catsAppBitmap) = a3;
}

- (BOOL)wifiBTCoexProfilesDownloaded
{
  return HIBYTE(self->super._catsAppBitmap);
}

- (void)setWifiBTCoexProfilesDownloaded:(BOOL)a3
{
  HIBYTE(self->super._catsAppBitmap) = a3;
}

@end