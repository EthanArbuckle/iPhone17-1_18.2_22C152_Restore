@interface WCM_WiFiCellCoexIssueBandTable
- ($342A0BF88B4ABE00867B0BBC077042BD)findIssueBandForBandInfoType:(int)a3 cellDlHighFreq:(double)a4 cellDlLowFreq:(double)a5 cellUlHighFreq:(double)a6 cellUlLowFreq:(double)a7 wifiBand:(int)a8;
- (BOOL)coexBandCheckBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7;
- (BOOL)configureBy:(id *)a3;
- (BOOL)isLTEB7FoundForCellDlLowFreq:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6;
- (BOOL)isNR79FoundForCellUlLowFreq:(double)a3 cellUlHighFreq:(double)a4;
- (BOOL)isWifiRangingProtectionEnabledForOOBCoexIssueBand:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7;
- (BOOL)wifiBtAgcCoexModeEnableCheckBandCombination:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 coexModeWifiLevel:(int64_t *)a8;
- (BOOL)wifiBtAgcCoexModeEnableCheckBandCombinationV2:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 wifiChannel:(unsigned int)a8 channelCenterFreqMHz:(unsigned int)a9 channelBandwidthMHz:(unsigned int)a10 coexModeWifiLevel:(int64_t *)a11 coexModeBTLevel:(int64_t *)a12;
- (WCM_WiFiCellCoexIssueBandTable)init;
- (id)GetHFBTBandBlockedChannelMapWithCellUlHighFreq:(double)a3 cellUlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellDlLowFreq:(double)a6 gpsRadioActive:(BOOL)a7 coexIssues:(id)a8 btBandLowFreq:(double)a9 btBandHighFreq:(double)a10 btNumChannel:(int)a11;
- (id)HFBTAntBlockingBandsFromWiFiConfigForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7;
- (id)HFBTPreferredChannelMapForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 gpsRadioActive:(BOOL)a8;
- (id)btDiversityChannelMapForCellBTAntennaCombination:(int)a3 cellBandInfoType:(int)a4 cellDlLowFreq:(double)a5 cellDlHighFreq:(double)a6 cellUlLowFreq:(double)a7 cellUlHighFreq:(double)a8 gpsRadioActive:(BOOL)a9;
- (id)btPreferredChannelMapForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 gpsRadioActive:(BOOL)a8;
- (id)btPreferredChannelMapFromLegacyWiFiConfigForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 gpsRadioActive:(BOOL)a8 maxChannelsToAvoidForCellOOB:(int)a9;
- (id)coexIssuesFor:(int)a3;
- (id)findWiFiAntennaOrCellTxPowerConstraintCoexIssueByCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 wifiChannel:(int)a8 gpsRadioActive:(BOOL)a9 wifiAntennaConstraint:(BOOL *)a10 cellTxPowerConstraint:(BOOL *)a11;
- (id)findWiFiAntennaOrCellTxPowerConstraintWiFiEnhCoexIssueByCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 wifiChannel:(int)a8 wifiCenterFreq:(unsigned int)a9 wifiBandwidth:(unsigned int)a10 gpsRadioActive:(BOOL)a11 wifiAntennaConstraint:(BOOL *)a12 cellTxPowerConstraint:(BOOL *)a13;
- (id)findWiFiVictimCoexIssueByCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7;
- (id)getHFBTAFHCoexIssuesFromIssueBand:(id *)a3;
- (id)getWifiDesensedCoexIssueFromIssueBand:(id *)a3;
- (id)wifi2GHzLTEB7IMD3EnableType7ForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7;
- (id)wifi5GHzChannelsToEnableType7MSGForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7;
- (id)wifiChannelsToDisableOCLForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7;
- (id)wifiChannelsToDisableOCLWiFiEnhForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7;
- (id)wifiChannelsToEnableLTEMBType7ForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 pissueBandMatchAntIdx:(unsigned __int16 *)a8;
- (id)wifiChannelsToEnableType7WiFiEnhForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 pissueBandMatchAntIdx:(unsigned __int16 *)a8;
- (id)wifiChannelsToEnableWCI2ForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7;
- (id)wifiChannelsToEnableWCI2V2ForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 pissueBandMatch:(BOOL *)a8;
- (id)wifiChannelsToEnableWCI2WiFiEnhForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 pissueBandMatch:(BOOL *)a8;
- (id)wifiPHSChannelsToBlocklistForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7;
- (id)wifiPHSChannelsToBlocklistV2ForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7;
- (int)watchAntennaPreferenceEnableCheckBandCombination:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7;
- (void)dealloc;
- (void)getCellDynamicAntBlockingIndex:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 wifiChannel:(unsigned int)a8 pissueBandMatchAntIdx:(unsigned __int16 *)a9 cellAntBlkEnableIdx1:(char *)a10 cellAntBlkEnableIdx2:(char *)a11;
@end

@implementation WCM_WiFiCellCoexIssueBandTable

- (id)wifiPHSChannelsToBlocklistForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7
{
  +[WCM_Logging logLevel:3, @"Try to get WiFi channels to avoid on cell bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf)", *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7 message];
  uint64_t v13 = 0;
  for (i = self->_issueBand[0]._coexIssues;
        (*(_DWORD *)(i - 5) & a3) == 0
     || *((double *)i - 4) > a4
     || *((double *)i - 3) < a5
     || *((double *)i - 2) > a6
     || *((double *)i - 1) < a7
     || !*((unsigned char *)i + 40);
        i += 11)
  {
    if (++v13 == 28)
    {
      +[WCM_Logging logLevel:3 message:@"No matching issue band found"];
      return &off_10024E038;
    }
  }
  +[WCM_Logging logLevel:3, @"need to apply rules for %s", off_10020F7A0[v13] message];
  id v15 = +[NSMutableArray array];
  for (uint64_t j = 0; j != 5; ++j)
  {
    v18 = i[j];
    if (!v18) {
      break;
    }
    unsigned int v31 = 0;
    id v19 = [(WCM_WiFiCellCoexIssue *)v18 wifiPHSChannelsToBlocklistForCellDlLowFreq:0 cellDlHighFreq:&v31 cellUlLowFreq:a4 cellUlHighFreq:a5 wifi5G:a6 wifiEssentialChannel:a7];
    unsigned int v20 = [(WCM_WiFiCellCoexIssue *)v18 issueType];
    v21 = "<ISSUE_TYPE_INVALID>";
    if (v20 <= 0xE) {
      v21 = off_10020F988[v20];
    }
    +[WCM_Logging logLevel:3, @"WiFi PHS channels to avoid for %s is %@", v21, v19 message];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v22 = [v19 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v28;
      do
      {
        for (k = 0; k != v23; k = (char *)k + 1)
        {
          if (*(void *)v28 != v24) {
            objc_enumerationMutation(v19);
          }
          uint64_t v26 = *(void *)(*((void *)&v27 + 1) + 8 * (void)k);
          if (([v15 containsObject:v26] & 1) == 0) {
            [v15 addObject:v26];
          }
        }
        id v23 = [v19 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v23);
    }
    if (sub_10008C87C(v15) && v31)
    {
      [v15 removeObject:[NSNumber numberWithInt:]];
      +[WCM_Logging logLevel:3, @"removed channel %d, combined channels became %@", v31, v15 message];
    }
  }
  [v15 sortUsingComparator:&stru_10020F618];
  if (![v15 count]) {
    [v15 addObject:&off_10023CB10];
  }
  +[WCM_Logging logLevel:5, @"WiFi PHS channels to blocklist %@", v15 message];
  return v15;
}

- (id)wifi5GHzChannelsToEnableType7MSGForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7
{
  +[WCM_Logging logLevel:5, @"DLDebug_: (WiFi_Type7) Try to get WiFi channels to enable WiFi_Type7 on bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf)", *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7 message];
  id v13 = +[NSMutableArray array];
  v14 = &self->_issueBand[28];
  uint64_t v15 = 100;
  while (1)
  {
    uint64_t v16 = v15 - 100;
    if ((v14[v15 - 100]._bandInfoType & a3) != 0
      && v14[v16]._downlinkLowFreq <= a4
      && v14[v16]._downlinkHighFreq >= a5
      && v14[v16]._uplinkLowFreq <= a6
      && v14[v16]._uplinkHighFreq >= a7
      && v14[v16]._hasIssue)
    {
      break;
    }
    if (++v15 == 117) {
      goto LABEL_9;
    }
  }
  +[WCM_Logging logLevel:4 message:@"DLDebug_: (WiFi_Type7) Matching issue band (in terms of cellular frequency match) found on (FV)GHz WiFi Band."];
  uint64_t v18 = 0;
  id v19 = &v14[v16];
  do
  {
    unsigned int v20 = (char *)v19 + 8 * v18;
    v21 = (void *)*((void *)v20 + 5);
    if (v21)
    {
      id v22 = [*((id *)v20 + 5) wifi5GHzChannelsAffectedByNR79UlLowFreq:a6 cellUlHighFreq:a7];
      if ([v22 count])
      {
        unsigned int v23 = [v21 issueType];
        uint64_t v24 = "<ISSUE_TYPE_INVALID>";
        if (v23 <= 0xE) {
          uint64_t v24 = off_10020F988[v23];
        }
        +[WCM_Logging logLevel:3, @"DLDebug_: (WiFi_Type7) WiFi channels for %s %@", v24, v22 message];
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v25 = [v22 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v25)
        {
          id v26 = v25;
          uint64_t v27 = *(void *)v31;
          do
          {
            for (i = 0; i != v26; i = (char *)i + 1)
            {
              if (*(void *)v31 != v27) {
                objc_enumerationMutation(v22);
              }
              uint64_t v29 = *(void *)(*((void *)&v30 + 1) + 8 * i);
              if ([&off_10024E0F8 containsObject:v29]
                && ([v13 containsObject:v29] & 1) == 0)
              {
                [v13 addObject:v29];
              }
            }
            id v26 = [v22 countByEnumeratingWithState:&v30 objects:v34 count:16];
          }
          while (v26);
        }
      }
    }
    ++v18;
  }
  while (v18 != 5);
  [v13 sortUsingComparator:&stru_10020F6F8];
LABEL_9:
  if (![v13 count]) {
    [v13 addObject:&off_10023CB10];
  }
  +[WCM_Logging logLevel:1, @"DLDebug_: WiFi channels to enable Type7 MSG %@", v13 message];
  return v13;
}

- (id)wifiChannelsToEnableType7WiFiEnhForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 pissueBandMatchAntIdx:(unsigned __int16 *)a8
{
  +[WCM_Logging logLevel:5, @"WiFiType7_WiFiEnh: Try to get WiFiEnh channels to enable Type7 on bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf)", *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7 message];
  id v15 = +[NSMutableArray array];
  uint64_t v16 = v15;
  v17 = &self->_issueBand[45];
  uint64_t v18 = 200;
  while (1)
  {
    uint64_t v19 = v18 - 200;
    if ((v17[v18 - 200]._bandInfoType & a3) != 0
      && v17[v19]._downlinkLowFreq <= a4
      && v17[v19]._downlinkHighFreq >= a5
      && v17[v19]._uplinkLowFreq <= a6
      && v17[v19]._uplinkHighFreq >= a7
      && v17[v19]._hasIssue)
    {
      break;
    }
    if (++v18 == 211)
    {
      if (![v15 count]) {
        [v16 addObject:&off_10023CB10];
      }
      goto LABEL_11;
    }
  }
  +[WCM_Logging logLevel:4 message:@"WiFiType7_WiFiEnh: Matching issue band (in terms of cellular frequency match) found on (Enh)GHz WiFi Band."];
  uint64_t v21 = 0;
  id v22 = &v17[v19];
  v35 = v22;
  v36 = a8;
  do
  {
    unsigned int v23 = (char *)v22 + 8 * v21;
    uint64_t v24 = (void *)*((void *)v23 + 5);
    if (v24)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, @"WiFiType7_WiFiEnh: coexIssue_Enh.issueType is %d and the priority p = %d", [*((id *)v23 + 5) issueType], v21);
      id v25 = [v24 cellAntBlkEnableIdx];
      if (v25)
      {
        id v26 = v25;
        id v27 = [v24 wifiChannelsToAvoidWiFiEnhForCellDlLowFreq:a4 cellDlHighFreq:a5 cellUlLowFreq:a6 cellUlHighFreq:a7];
        if ([v27 count])
        {
          unsigned int v28 = [v24 issueType];
          uint64_t v29 = "<ISSUE_TYPE_INVALID>";
          if (v28 <= 0xE) {
            uint64_t v29 = off_10020F988[v28];
          }
          +[WCM_Logging logLevel:4, @"WiFiType7_WiFiEnh: WiFi channels for %s %@", v29, v27 message];
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v30 = [v27 countByEnumeratingWithState:&v37 objects:v41 count:16];
          if (v30)
          {
            id v31 = v30;
            uint64_t v32 = *(void *)v38;
            do
            {
              for (i = 0; i != v31; i = (char *)i + 1)
              {
                if (*(void *)v38 != v32) {
                  objc_enumerationMutation(v27);
                }
                uint64_t v34 = *(void *)(*((void *)&v37 + 1) + 8 * i);
                if ([&off_10024E0E0 containsObject:v34]
                  && ([v16 containsObject:v34] & 1) == 0)
                {
                  [v16 addObject:v34];
                }
              }
              id v31 = [v27 countByEnumeratingWithState:&v37 objects:v41 count:16];
            }
            while (v31);
          }
          unsigned __int16 *v36 = (unsigned __int16)v26;
          +[WCM_Logging logLevel:4, @"WiFiType7_WiFiEnh: Matching issue band (in terms of cellular frequency match) found on (Enh)GHz WiFi Band. *pissueBandMatchWiFiEnhType7AntIdx=cellAntBlkEnableIdx_Enh(%d)", v26 message];
          id v22 = v35;
        }
      }
    }
    ++v21;
  }
  while (v21 != 5);
  [v16 sortUsingComparator:&stru_10020F6D8];
LABEL_11:
  +[WCM_Logging logLevel:4, @"WiFiType7_WiFiEnh: WiFi channels to enable Type7 MSG on Enh Band is %@", v16 message];
  return v16;
}

- (id)wifi2GHzLTEB7IMD3EnableType7ForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7
{
  +[WCM_Logging logLevel:5, @"TYPE7_2GWIFI_SUPPORT_: Band7 Cell info: bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf)", *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7 message];
  id v13 = +[NSMutableArray array];
  uint64_t v14 = 0;
  while ((self->_issueBand[v14]._bandInfoType & a3) == 0
       || self->_issueBand[v14]._downlinkLowFreq > a4
       || self->_issueBand[v14]._downlinkHighFreq < a5
       || self->_issueBand[v14]._uplinkLowFreq > a6
       || self->_issueBand[v14]._uplinkHighFreq < a7
       || !self->_issueBand[v14]._hasIssue)
  {
    if (++v14 == 28) {
      goto LABEL_9;
    }
  }
  if (v14 == 8)
  {
    coexIssues = (id *)self->_issueBand[8]._coexIssues;
    +[WCM_Logging logLevel:4 message:@"TYPE7_2GWIFI_SUPPORT_: issueBand confirmed to be B7."];
    +[WCM_Logging logLevel:4 message:@"TYPE7_2GWIFI_SUPPORT_: LTE Band7 Freq match confirmed."];
    id v17 = 0;
    uint64_t v18 = 5;
    do
    {
      if ([*coexIssues issueType] == 4)
      {
        id v17 = *coexIssues;
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, @"TYPE7_2GWIFI_SUPPORT_: IssueType is also matched as %d", [*coexIssues issueType]);
      }
      ++coexIssues;
      --v18;
    }
    while (v18);
    id v19 = [v17 wifiChannelsIMD3ByCellDlLowFreq:0 cellDlHighFreq:a4 cellUlLowFreq:a5 cellUlHighFreq:a6 wifi5G:a7];
    if ([v19 count])
    {
      +[WCM_Logging logLevel:4, @"TYPE7_2GWIFI_SUPPORT_: 2.4GHz WiFi channels with Type7 MSG enabled are: %@", v19 message];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v20 = [v19 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v26;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v26 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v25 + 1) + 8 * i);
            if ([&off_10024E110 containsObject:v24]
              && ([v13 containsObject:v24] & 1) == 0)
            {
              [v13 addObject:v24];
            }
          }
          id v21 = [v19 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v21);
      }
    }
    [v13 sortUsingComparator:&stru_10020F718];
  }
  else
  {
    +[WCM_Logging logLevel:4 message:@"TYPE7_2GWIFI_SUPPORT_: WARNING: issueBand matched, but is NOT B7."];
  }
LABEL_9:
  if (![v13 count]) {
    [v13 addObject:&off_10023CB10];
  }
  +[WCM_Logging logLevel:3, @"TYPE7_2GWIFI_SUPPORT_: WiFi channels to enable Type %@", v13 message];
  return v13;
}

- (id)findWiFiVictimCoexIssueByCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7
{
  uint64_t v11 = *(void *)&a3;
  +[WCM_Logging logLevel:5, @"WCI2_V2: Try to get coex issue (row in policy table) in terms of WiFi victim  bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf)", *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7 message];
  uint64_t v13 = 0;
  while (1)
  {
    uint64_t bandInfoType = self->_issueBand[v13]._bandInfoType;
    if ((bandInfoType & v11) != 0)
    {
      double downlinkLowFreq = self->_issueBand[v13]._downlinkLowFreq;
      if (downlinkLowFreq <= a4)
      {
        double downlinkHighFreq = self->_issueBand[v13]._downlinkHighFreq;
        if (downlinkHighFreq >= a5)
        {
          double uplinkLowFreq = self->_issueBand[v13]._uplinkLowFreq;
          if (uplinkLowFreq <= a6 && self->_issueBand[v13]._uplinkHighFreq >= a7 && self->_issueBand[v13]._hasIssue) {
            break;
          }
        }
      }
    }
    if (++v13 == 28)
    {
      uint64_t v18 = 0;
      goto LABEL_10;
    }
  }
  +[WCM_Logging logLevel:4, @"WCI2_V2: CC2UnitTest: pIssueBand->_bandInfoType(%d) & bandInfoType(%d) && pIssueBand->_downlinkLowFreq(%lf) <= cellDlLowFreq(%lf) && pIssueBand->_downlinkHighFreq(%lf) >= cellDlHighFreq(%lf) && pIssueBand->_uplinkLowFreq(%lf) <= cellUlLowFreq(%lf) && pIssueBand->_uplinkHighFreq(%lf) >= cellUlHighFreq(%lf), ", bandInfoType, v11, *(void *)&downlinkLowFreq, *(void *)&a4, *(void *)&downlinkHighFreq, *(void *)&a5, *(void *)&uplinkLowFreq, *(void *)&a6, *(void *)&self->_issueBand[v13]._uplinkHighFreq, *(void *)&a7 message];
  uint64_t v18 = &self->_issueBand[v13];
LABEL_10:
  uint64_t v19 = 0;
  BOOL v20 = 0;
  unint64_t v21 = 100;
  while (1)
  {
    uint64_t v22 = self->_issueBand[v19 + 28]._bandInfoType;
    if ((v22 & v11) != 0)
    {
      double v23 = self->_issueBand[v19 + 28]._downlinkLowFreq;
      if (v23 <= a4)
      {
        double v24 = self->_issueBand[v19 + 28]._downlinkHighFreq;
        if (v24 >= a5)
        {
          double v25 = self->_issueBand[v19 + 28]._uplinkLowFreq;
          if (v25 <= a6 && self->_issueBand[v19 + 28]._uplinkHighFreq >= a7 && self->_issueBand[v19 + 28]._hasIssue) {
            break;
          }
        }
      }
    }
    BOOL v20 = v21++ > 0x73;
    if (++v19 == 17)
    {
      if (v18)
      {
LABEL_22:
        +[WCM_Logging logLevel:4 message:@"WCI2_V2: Matching issueBand (in terms of cellular frequency match) found only for 2.4GHz WiFi Band."];
        uint64_t v27 = 0;
        coexIssues = v18->_coexIssues;
        while (1)
        {
          uint64_t v29 = coexIssues[v27];
          if (!v29) {
            break;
          }
          if (objc_msgSend(-[WCM_WiFiCellCoexIssue wifiChannelsAffectedByCellUlLowFreq:cellUlHighFreq:wifi5G:](coexIssues[v27], "wifiChannelsAffectedByCellUlLowFreq:cellUlHighFreq:wifi5G:", 0, a6, a7), "count"))
          {
            unsigned int v30 = [(WCM_WiFiCellCoexIssue *)v29 issueType];
            if (v30 <= 0xE) {
              id v31 = off_10020F988[v30];
            }
            else {
              id v31 = "<ISSUE_TYPE_INVALID>";
            }
            +[WCM_Logging logLevel:4, @"WCI2_V2: Matching issueType (%s) found only for 5GHz WiFi Band.", v31 message];
            break;
          }
          if (++v27 == 5)
          {
            uint64_t v29 = 0;
            break;
          }
        }
        +[WCM_Logging logLevel:4, @"WCI2_V2: CC2UnitTest: coexIssueCCWiFi_Temp.issueType = %d, coexIssueCCWiFi_Temp.ulcaPriorityCCWiFi=(%d).", [(WCM_WiFiCellCoexIssue *)v29 issueType], [(WCM_WiFiCellCoexIssue *)v29 ulcaPriorityCCWiFi] message];
        goto LABEL_34;
      }
      +[WCM_Logging logLevel:4, @"WCI2_V2: No matching issue band (in terms of cellular frequency match) found.", v52, v54, v56, v58 message];
      return 0;
    }
  }
  +[WCM_Logging logLevel:4, @"WCI2_V2: CC2UnitTest: pIssueBand_5GHz->_bandInfoType(%d) & bandInfoType(%d) && pIssueBand_5GHz->_downlinkLowFreq(%lf) <= cellDlLowFreq(%lf) && pIssueBand_5GHz->_downlinkHighFreq(%lf) >= cellDlHighFreq(%lf) && pIssueBand_5GHz->_uplinkLowFreq(%lf) <= cellUlLowFreq(%lf) && pIssueBand_5GHz->_uplinkHighFreq(%lf) >= cellUlHighFreq(%lf)", v22, v11, *(void *)&v23, *(void *)&a4, *(void *)&v24, *(void *)&a5, *(void *)&v25, *(void *)&a6, *(void *)&self->_issueBand[v19 + 28]._uplinkHighFreq, *(void *)&a7 message];
  uint64_t v32 = (char *)self + v19 * 88;
  if (v18)
  {
    long long v33 = v32 + 2472;
    if (v20) {
      goto LABEL_22;
    }
    uint64_t v34 = 0;
    v35 = v33 + 40;
    while (1)
    {
      uint64_t v29 = *(WCM_WiFiCellCoexIssue **)&v35[v34];
      if (!v29) {
        break;
      }
      if (objc_msgSend(objc_msgSend(*(id *)&v35[v34], "wifiChannelsAffectedByCellUlLowFreq:cellUlHighFreq:wifi5G:", 1, a6, a7), "count"))
      {
        unsigned int v36 = [(WCM_WiFiCellCoexIssue *)v29 issueType];
        if (v36 <= 0xE) {
          long long v37 = off_10020F988[v36];
        }
        else {
          long long v37 = "<ISSUE_TYPE_INVALID>";
        }
        +[WCM_Logging logLevel:4, @"WCI2_V2: Matching issueType (%s) found only for 5GHz WiFi Band.", v37 message];
        break;
      }
      v34 += 8;
      if (v34 == 40)
      {
        uint64_t v29 = 0;
        break;
      }
    }
    uint64_t v38 = 0;
    long long v39 = v18->_coexIssues;
    while (1)
    {
      long long v40 = v39[v38];
      if (!v40) {
        break;
      }
      if (objc_msgSend(-[WCM_WiFiCellCoexIssue wifiChannelsAffectedByCellUlLowFreq:cellUlHighFreq:wifi5G:](v39[v38], "wifiChannelsAffectedByCellUlLowFreq:cellUlHighFreq:wifi5G:", 0, a6, a7), "count"))
      {
        unsigned int v41 = [(WCM_WiFiCellCoexIssue *)v40 issueType];
        if (v41 <= 0xE) {
          v42 = off_10020F988[v41];
        }
        else {
          v42 = "<ISSUE_TYPE_INVALID>";
        }
        +[WCM_Logging logLevel:4, @"WCI2_V2: Matching issueType (%s) found only for 5GHz WiFi Band.", v42 message];
        break;
      }
      if (++v38 == 5)
      {
        long long v40 = 0;
        break;
      }
    }
    if ([(WCM_WiFiCellCoexIssue *)v40 ulcaPriorityCCWiFi] >= 0x63
      && [(WCM_WiFiCellCoexIssue *)v29 ulcaPriorityCCWiFi] > 0x62)
    {
      CFStringRef v44 = @"WCI2_V2:  CC_WiFi Priority = PRIORITY_WIFINOCONCERN(99) for both (2.4GHz and 5GHz) WiFi Bands. WiFi is not victim with current Cell Freq.";
    }
    else
    {
      +[WCM_Logging logLevel:4 message:@"WCI2_V2: WiFi Victim issue found on one of the two (2.4GHz and 5GHz) WiFi Bands. Picking the issue with higher CC_WiFi Priority."];
      +[WCM_Logging logLevel:4, @"WCI2_V2: CC2UnitTest: coexIssueCCWiFi_Temp.issueType = %d, coexIssueCCWiFi_Temp.ulcaPriorityCCWiFi=(%d).", [(WCM_WiFiCellCoexIssue *)v40 issueType], [(WCM_WiFiCellCoexIssue *)v40 ulcaPriorityCCWiFi] message];
      +[WCM_Logging logLevel:4, @"WCI2_V2: CC2UnitTest: coexIssueCCWiFi_5GHz_Temp.issueType = %d, coexIssueCCWiFi_5GHz_Temp.ulcaPriorityCCWiFi=(%d).", [(WCM_WiFiCellCoexIssue *)v29 issueType], [(WCM_WiFiCellCoexIssue *)v29 ulcaPriorityCCWiFi] message];
      if (![(WCM_WiFiCellCoexIssue *)v40 ulcaPriorityCCWiFi]
        && ![(WCM_WiFiCellCoexIssue *)v29 ulcaPriorityCCWiFi])
      {
        +[WCM_Logging logLevel:4, @"WCI2_V2: CC2UnitTest: Both coexIssueCCWiFi_Temp.ulcaPriorityCCWiFi and coexIssueCCWiFi_5GHz_Temp.ulcaPriorityCCWiFi should be 0 here, which means neither 2.4GHz nor 5GHz WiFi is Victim. In this case, we should return nil. Fact check: coexIssueCCWiFi_Temp.issueType = %d, coexIssueCCWiFi_Temp.ulcaPriorityCCWiFi=(%d). coexIssueCCWiFi_5GHz_Temp.issueType = %d, coexIssueCCWiFi_5GHz_Temp.ulcaPriorityCCWiFi=(%d).", [(WCM_WiFiCellCoexIssue *)v40 issueType], [(WCM_WiFiCellCoexIssue *)v40 ulcaPriorityCCWiFi], [(WCM_WiFiCellCoexIssue *)v29 issueType], [(WCM_WiFiCellCoexIssue *)v29 ulcaPriorityCCWiFi] message];
        return 0;
      }
      if (![(WCM_WiFiCellCoexIssue *)v40 ulcaPriorityCCWiFi]
        && [(WCM_WiFiCellCoexIssue *)v29 ulcaPriorityCCWiFi])
      {
        +[WCM_Logging logLevel:4, @"WCI2_V2: CC2UnitTest: coexIssueCCWiFi_Temp.ulcaPriorityCCWiFi should be 0 here, and we should return coexIssueCCWiFi_5GHz_Temp. Fact check: coexIssueCCWiFi_Temp.issueType = %d, coexIssueCCWiFi_Temp.ulcaPriorityCCWiFi=(%d). coexIssueCCWiFi_5GHz_Temp.issueType = %d, coexIssueCCWiFi_5GHz_Temp.ulcaPriorityCCWiFi=(%d).", [(WCM_WiFiCellCoexIssue *)v40 issueType], [(WCM_WiFiCellCoexIssue *)v40 ulcaPriorityCCWiFi], [(WCM_WiFiCellCoexIssue *)v29 issueType], [(WCM_WiFiCellCoexIssue *)v29 ulcaPriorityCCWiFi] message];
        return v29;
      }
      if (![(WCM_WiFiCellCoexIssue *)v40 ulcaPriorityCCWiFi]
        || [(WCM_WiFiCellCoexIssue *)v29 ulcaPriorityCCWiFi])
      {
        +[WCM_Logging logLevel:4, @"WCI2_V2: CC2UnitTest: None of coexIssueCCWiFi_Temp.ulcaPriorityCCWiFi and coexIssueCCWiFi_5GHz_Temp.ulcaPriorityCCWiFi should be 0 here, which means both 2.4GHz nor 5GHz WiFi are Victim. In this case, we should return the one with higher ulcaPriorityCCWiFi. Fact check: coexIssueCCWiFi_Temp.issueType = %d, coexIssueCCWiFi_Temp.ulcaPriorityCCWiFi=(%d). coexIssueCCWiFi_5GHz_Temp.issueType = %d, coexIssueCCWiFi_5GHz_Temp.ulcaPriorityCCWiFi=(%d).", [(WCM_WiFiCellCoexIssue *)v40 issueType], [(WCM_WiFiCellCoexIssue *)v40 ulcaPriorityCCWiFi], [(WCM_WiFiCellCoexIssue *)v29 issueType], [(WCM_WiFiCellCoexIssue *)v29 ulcaPriorityCCWiFi] message];
        unsigned int v43 = [(WCM_WiFiCellCoexIssue *)v40 ulcaPriorityCCWiFi];
        if (v43 < [(WCM_WiFiCellCoexIssue *)v29 ulcaPriorityCCWiFi]) {
          return v40;
        }
        return v29;
      }
      id v45 = (id)[(WCM_WiFiCellCoexIssue *)v40 issueType];
      unsigned int v46 = [(WCM_WiFiCellCoexIssue *)v40 ulcaPriorityCCWiFi];
      id v57 = (id)[(WCM_WiFiCellCoexIssue *)v29 issueType];
      uint64_t v59 = [(WCM_WiFiCellCoexIssue *)v29 ulcaPriorityCCWiFi];
      id v53 = v45;
      uint64_t v55 = v46;
      CFStringRef v44 = @"WCI2_V2: CC2UnitTest: coexIssueCCWiFi_5GHz_Temp.ulcaPriorityCCWiFi should be 0 here, and we should return coexIssueCCWiFi_Temp. Fact check: coexIssueCCWiFi_Temp.issueType = %d, coexIssueCCWiFi_Temp.ulcaPriorityCCWiFi=(%d). coexIssueCCWiFi_5GHz_Temp.issueType = %d, coexIssueCCWiFi_5GHz_Temp.ulcaPriorityCCWiFi=(%d).";
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, v44, v53, v55, v57, v59);
    return v40;
  }
  v48 = (id *)(v32 + 2512);
  +[WCM_Logging logLevel:4 message:@"WCI2_V2: Matching issueBand (in terms of cellular frequency match) found only for 5GHz WiFi Band."];
  uint64_t v49 = 5;
  while (1)
  {
    uint64_t v29 = (WCM_WiFiCellCoexIssue *)*v48;
    if (!*v48) {
      break;
    }
    if (objc_msgSend(objc_msgSend(*v48, "wifiChannelsAffectedByCellUlLowFreq:cellUlHighFreq:wifi5G:", 1, a6, a7), "count"))
    {
      unsigned int v50 = [(WCM_WiFiCellCoexIssue *)v29 issueType];
      if (v50 <= 0xE) {
        v51 = off_10020F988[v50];
      }
      else {
        v51 = "<ISSUE_TYPE_INVALID>";
      }
      +[WCM_Logging logLevel:4, @"WCI2_V2: Matching issueType (%s) found only for 5GHz WiFi Band.", v51 message];
      break;
    }
    ++v48;
    if (!--v49)
    {
      uint64_t v29 = 0;
      break;
    }
  }
  +[WCM_Logging logLevel:4, @"WCI2_V2: CC2UnitTest: coexIssueCCWiFi_5GHz_Temp.issueType = %d, coexIssueCCWiFi_5GHz_Temp.ulcaPriorityCCWiFi=(%d).", [(WCM_WiFiCellCoexIssue *)v29 issueType], [(WCM_WiFiCellCoexIssue *)v29 ulcaPriorityCCWiFi] message];
LABEL_34:
  if (![(WCM_WiFiCellCoexIssue *)v29 ulcaPriorityCCWiFi]) {
    return 0;
  }
  return v29;
}

- (id)wifiChannelsToEnableLTEMBType7ForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 pissueBandMatchAntIdx:(unsigned __int16 *)a8
{
  +[WCM_Logging logLevel:5, @"2.4GHzWiFi_Type7(extended from LTEMB only): Try to get WiFi channels to enable WCI2 Type7 on bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf)", *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7 message];
  id v14 = +[NSMutableArray array];
  uint64_t v15 = 0;
  while ((self->_issueBand[v15]._bandInfoType & a3) == 0
       || self->_issueBand[v15]._downlinkLowFreq > a4
       || self->_issueBand[v15]._downlinkHighFreq < a5
       || self->_issueBand[v15]._uplinkLowFreq > a6
       || self->_issueBand[v15]._uplinkHighFreq < a7
       || !self->_issueBand[v15]._hasIssue)
  {
    if (++v15 == 28)
    {
      uint64_t v16 = 0;
      goto LABEL_10;
    }
  }
  uint64_t v16 = &self->_issueBand[v15];
LABEL_10:
  unint64_t v17 = -1496;
  while ((*(int *)((unsigned char *)&self->_issueBand[45]._bandInfoType + v17) & a3) == 0
       || *(double *)((char *)&self->_issueBand[45]._downlinkLowFreq + v17) > a4
       || *(double *)((char *)&self->_issueBand[45]._downlinkHighFreq + v17) < a5
       || *(double *)((char *)&self->_issueBand[45]._uplinkLowFreq + v17) > a6
       || *(double *)((char *)&self->_issueBand[45]._uplinkHighFreq + v17) < a7
       || !LOBYTE(self->_issueBand[45]._coexIssues[v17 / 8 + 5]))
  {
    v17 += 88;
    if (!v17)
    {
      unint64_t v18 = 0;
      goto LABEL_19;
    }
  }
  unint64_t v18 = (unint64_t)&self->_issueBand[45] + v17;
LABEL_19:
  uint64_t v49 = v16;
  if (v16)
  {
    +[WCM_Logging logLevel:4 message:@"2.4GHzWiFi_Type7(extended from LTEMB only): Matching issue band (in terms of cellular frequency match) found on 2.4GHz WiFi Band."];
    for (uint64_t i = 0; i != 5; ++i)
    {
      BOOL v20 = (char *)v16 + 8 * i;
      unint64_t v21 = (void *)*((void *)v20 + 5);
      if (v21)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, @"2.4GHzWiFi_Type7(extended from LTEMB only): coexIssue.issueType is %d and the priority p = %d", [*((id *)v20 + 5) issueType], i);
        id v22 = [v21 cellAntBlkEnableIdx];
        if (v22)
        {
          id v23 = v22;
          int v59 = 0;
          id v24 = [v21 wifiChannelsToAvoidForCellDlLowFreq:0 cellDlHighFreq:&v59 cellUlLowFreq:a4 cellUlHighFreq:a5 wifi5G:a6 wifiEssentialChannel:a7];
          if ([v24 count])
          {
            unsigned int v25 = [v21 issueType];
            long long v26 = "<ISSUE_TYPE_INVALID>";
            if (v25 <= 0xE) {
              long long v26 = off_10020F988[v25];
            }
            +[WCM_Logging logLevel:3, @"2.4GHzWiFi_Type7(extended from LTEMB only): WiFi channels for %s %@", v26, v24 message];
            long long v57 = 0u;
            long long v58 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            id v27 = [v24 countByEnumeratingWithState:&v55 objects:v61 count:16];
            if (v27)
            {
              id v28 = v27;
              uint64_t v29 = *(void *)v56;
              do
              {
                for (uint64_t j = 0; j != v28; uint64_t j = (char *)j + 1)
                {
                  if (*(void *)v56 != v29) {
                    objc_enumerationMutation(v24);
                  }
                  uint64_t v31 = *(void *)(*((void *)&v55 + 1) + 8 * (void)j);
                  if (([v14 containsObject:v31] & 1) == 0) {
                    [v14 addObject:v31];
                  }
                }
                id v28 = [v24 countByEnumeratingWithState:&v55 objects:v61 count:16];
              }
              while (v28);
            }
            *a8 = (unsigned __int16)v23;
            +[WCM_Logging logLevel:4, @"2.4GHzWiFi_Type7(extended from LTEMB only): Matching issue band (in terms of cellular frequency match) found on 2.4GHz WiFi Band. *pissueBandMatchAntIdx=cellAntBlkEnableIdx(%d)", v23 message];
            uint64_t v16 = v49;
          }
        }
      }
    }
  }
  if (v18)
  {
    +[WCM_Logging logLevel:4 message:@"2.4GHzWiFi_Type7(extended from LTEMB only): Matching issue band (in terms of cellular frequency match) found on (FV)GHz WiFi Band."];
    uint64_t v32 = 0;
    CFStringRef v33 = @"5GHzWiFi_Type7(extended from LTEMB only): coexIssue_5GHz.issueType is %d and the priority p = %d";
    v48 = (char *)v18;
    do
    {
      uint64_t v34 = (char *)(v18 + 8 * v32);
      v35 = (void *)*((void *)v34 + 5);
      if (v35)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, v33, [*((id *)v34 + 5) issueType], v32);
        id v36 = [v35 cellAntBlkEnableIdx];
        if (v36)
        {
          id v37 = v36;
          int v59 = 0;
          id v38 = [v35 wifiChannelsToAvoidForCellDlLowFreq:1 cellDlHighFreq:&v59 cellUlLowFreq:a4 cellUlHighFreq:a5 wifi5G:a6 wifiEssentialChannel:a7];
          if ([v38 count])
          {
            CFStringRef v39 = v33;
            unsigned int v40 = [v35 issueType];
            unsigned int v41 = "<ISSUE_TYPE_INVALID>";
            if (v40 <= 0xE) {
              unsigned int v41 = off_10020F988[v40];
            }
            +[WCM_Logging logLevel:3, @"5GHzWiFi_Type7(extended from LTEMB only): WiFi channels for %s %@", v41, v38 message];
            long long v53 = 0u;
            long long v54 = 0u;
            long long v51 = 0u;
            long long v52 = 0u;
            id v42 = [v38 countByEnumeratingWithState:&v51 objects:v60 count:16];
            if (v42)
            {
              id v43 = v42;
              uint64_t v44 = *(void *)v52;
              do
              {
                for (k = 0; k != v43; k = (char *)k + 1)
                {
                  if (*(void *)v52 != v44) {
                    objc_enumerationMutation(v38);
                  }
                  uint64_t v46 = *(void *)(*((void *)&v51 + 1) + 8 * (void)k);
                  if ([&off_10024E0C8 containsObject:v46]
                    && ([v14 containsObject:v46] & 1) == 0)
                  {
                    [v14 addObject:v46];
                  }
                }
                id v43 = [v38 countByEnumeratingWithState:&v51 objects:v60 count:16];
              }
              while (v43);
            }
            *a8 = (unsigned __int16)v37;
            +[WCM_Logging logLevel:4, @"5GHzWiFi_Type7(extended from LTEMB only): Matching issue band (in terms of cellular frequency match) found on (FV)GHz WiFi Band. *pissueBandMatchAntIdx=cellAntBlkEnableIdx_5GHz(%d)", v37 message];
            CFStringRef v33 = v39;
            unint64_t v18 = (unint64_t)v48;
          }
        }
      }
      ++v32;
    }
    while (v32 != 5);
  }
  if ((unint64_t)v49 | v18)
  {
    [v14 sortUsingComparator:&stru_10020F6B8];
  }
  else if (![v14 count])
  {
    [v14 addObject:&off_10023CB10];
  }
  +[WCM_Logging logLevel:3, @"5GHzWiFi_Type7(extended from LTEMB only): WiFi channels to enable Type7 MSG after combining 2.4GHz and 5GHz channel lists%@", v14 message];
  return v14;
}

- (id)wifiPHSChannelsToBlocklistV2ForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7
{
  +[WCM_Logging logLevel:3, @"PDHLSV2: Try to get WiFi channels to avoid on cell bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf)", *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7 message];
  id v13 = +[NSMutableArray array];
  uint64_t v14 = 0;
  unint64_t v15 = 0;
  BOOL v16 = 1;
  while ((self->_issueBand[v14]._bandInfoType & a3) == 0
       || self->_issueBand[v14]._downlinkLowFreq > a4
       || self->_issueBand[v14]._downlinkHighFreq < a5
       || self->_issueBand[v14]._uplinkLowFreq > a6
       || self->_issueBand[v14]._uplinkHighFreq < a7
       || !self->_issueBand[v14]._hasIssue)
  {
    BOOL v16 = v15++ < 0x1B;
    if (++v14 == 28)
    {
      *((void *)&v47 + 1) = 0;
      LODWORD(v15) = 28;
      goto LABEL_13;
    }
  }
  *((void *)&v47 + 1) = &self->_issueBand[v14];
LABEL_13:
  unsigned int v18 = 100;
  unint64_t v19 = -1496;
  while ((*(int *)((unsigned char *)&self->_issueBand[45]._bandInfoType + v19) & a3) == 0
       || *(double *)((char *)&self->_issueBand[45]._downlinkLowFreq + v19) > a4
       || *(double *)((char *)&self->_issueBand[45]._downlinkHighFreq + v19) < a5
       || *(double *)((char *)&self->_issueBand[45]._uplinkLowFreq + v19) > a6
       || *(double *)((char *)&self->_issueBand[45]._uplinkHighFreq + v19) < a7
       || !LOBYTE(self->_issueBand[45]._coexIssues[v19 / 8 + 5]))
  {
    ++v18;
    v19 += 88;
    if (!v19)
    {
      *(void *)&long long v47 = 0;
      unsigned int v18 = 117;
      goto LABEL_22;
    }
  }
  *(void *)&long long v47 = (char *)&self->_issueBand[45] + v19;
LABEL_22:
  if (*((void *)&v47 + 1))
  {
    if ((v15 - 100) > 0x10)
    {
      if (!v16)
      {
        unint64_t v21 = "<ISSUE_BAND_INVALID: Negative number.>";
LABEL_29:
        +[WCM_Logging logLevel:4, @"PDHLSV2: Matching issue band (in terms of cellular frequency match) found on 2.4GHz WiFi Band. Need to apply rules for %s", v21 message];
        for (uint64_t i = 0; i != 5; ++i)
        {
          id v23 = *(void **)(*((void *)&v47 + 1) + 8 * i + 40);
          if (!v23) {
            break;
          }
          unsigned int v56 = 0;
          id v24 = [v23 wifiPHSChannelsToBlocklistForCellDlLowFreq:0 cellDlHighFreq:&v56 cellUlLowFreq:a4 cellUlHighFreq:a5 wifi5G:a6 wifiEssentialChannel:a7];
          unsigned int v25 = [v23 issueType];
          long long v26 = "<ISSUE_TYPE_INVALID>";
          if (v25 <= 0xE) {
            long long v26 = off_10020F988[v25];
          }
          +[WCM_Logging logLevel:3, @"PDHLSV2: WiFi 2.4GHz PDHLS channels to avoid for %s is %@", v26, v24 message];
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          id v27 = [v24 countByEnumeratingWithState:&v52 objects:v58 count:16];
          if (v27)
          {
            id v28 = v27;
            uint64_t v29 = *(void *)v53;
            do
            {
              for (uint64_t j = 0; j != v28; uint64_t j = (char *)j + 1)
              {
                if (*(void *)v53 != v29) {
                  objc_enumerationMutation(v24);
                }
                uint64_t v31 = *(void *)(*((void *)&v52 + 1) + 8 * (void)j);
                if (([v13 containsObject:v31] & 1) == 0) {
                  [v13 addObject:v31];
                }
              }
              id v28 = [v24 countByEnumeratingWithState:&v52 objects:v58 count:16];
            }
            while (v28);
          }
          if (sub_10008C87C(v13) && v56)
          {
            [v13 removeObject:[NSNumber numberWithInt:];
            +[WCM_Logging logLevel:3, @"PDHLSV2: WiFi 2.4GHz PDHLS removed channel %d, combined channels became %@", v56, v13 message];
          }
        }
        goto LABEL_46;
      }
      BOOL v20 = &off_10020F7A0[v15];
    }
    else
    {
      BOOL v20 = &off_10020F880[(v15 - 100)];
    }
    unint64_t v21 = *v20;
    goto LABEL_29;
  }
LABEL_46:
  if ((void)v47)
  {
    if (v18 > 0xD2)
    {
      uint64_t v32 = "<ISSUE_BAND_INVALID: beyond the range>";
      goto LABEL_55;
    }
    unsigned int v33 = v18 - 200;
    if (v18 < 0xC8)
    {
      unsigned int v33 = v18 - 100;
      if (v18 - 100 > 0x10)
      {
        if (v18 > 0x1B)
        {
          uint64_t v32 = "<ISSUE_BAND_INVALID: Negative number.>";
LABEL_55:
          +[WCM_Logging logLevel:4, @"PDHLSV2: Matching issue band (in terms of cellular frequency match) found on (FV)GHz WiFi Band. Need to apply rules for %s", v32 message];
          uint64_t v36 = 0;
          while (1)
          {
            id v37 = *(void **)(v47 + 8 * v36 + 40);
            if (!v37) {
              goto LABEL_74;
            }
            unsigned int v56 = 0;
            id v38 = [v37 wifiChannelsToAvoidForCellDlLowFreq:1 cellDlHighFreq:&v56 cellUlLowFreq:a4 cellUlHighFreq:a5 wifi5G:a6 wifiEssentialChannel:a7];
            unsigned int v39 = [v37 issueType];
            unsigned int v40 = "<ISSUE_TYPE_INVALID>";
            if (v39 <= 0xE) {
              unsigned int v40 = off_10020F988[v39];
            }
            +[WCM_Logging logLevel:3, @"PDHLSV2: WiFi (FV)GHz PDHLS channels to avoid for %s is %@", v40, v38 message];
            long long v50 = 0u;
            long long v51 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            id v41 = [v38 countByEnumeratingWithState:&v48 objects:v57 count:16];
            if (v41)
            {
              id v42 = v41;
              uint64_t v43 = *(void *)v49;
              do
              {
                for (k = 0; k != v42; k = (char *)k + 1)
                {
                  if (*(void *)v49 != v43) {
                    objc_enumerationMutation(v38);
                  }
                  uint64_t v45 = *(void *)(*((void *)&v48 + 1) + 8 * (void)k);
                  if ([&off_10024E050 containsObject:v45]
                    && ([v13 containsObject:v45] & 1) == 0)
                  {
                    [v13 addObject:v45];
                  }
                }
                id v42 = [v38 countByEnumeratingWithState:&v48 objects:v57 count:16];
              }
              while (v42);
            }
            if (sub_10008C87C(v13) && v56)
            {
              [v13 removeObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:")]];
              +[WCM_Logging logLevel:3, @"PDHLSV2: WiFi (FV)GHz PDHLS removed channel %d, combined channels became %@", v56, v13 message];
            }
            if (++v36 == 5) {
              goto LABEL_73;
            }
          }
        }
        v35 = (const char **)&off_10020F7A0[v18];
LABEL_54:
        uint64_t v32 = *v35;
        goto LABEL_55;
      }
      uint64_t v34 = off_10020F880;
    }
    else
    {
      uint64_t v34 = off_10020F908;
    }
    v35 = (const char **)&v34[v33];
    goto LABEL_54;
  }
LABEL_73:
  if (v47 != 0)
  {
LABEL_74:
    [v13 sortUsingComparator:&stru_10020F638];
    goto LABEL_77;
  }
  if (![v13 count]) {
    [v13 addObject:&off_10023CB10];
  }
LABEL_77:
  +[WCM_Logging logLevel:5, @"PDHLSV2: Overall WiFi PDHLS channels to blocklist %@", v13 message];
  return v13;
}

- (BOOL)wifiBtAgcCoexModeEnableCheckBandCombination:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 coexModeWifiLevel:(int64_t *)a8
{
  +[WCM_Logging logLevel:3, @"Check if band is eligible for AgcCoexMode on bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf) ", *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7 message];
  uint64_t v15 = 0;
  int v28 = 0;
  BOOL v16 = off_10020F7A0;
  while ((self->_issueBand[v15]._bandInfoType & a3) == 0
       || self->_issueBand[v15]._downlinkLowFreq > a4
       || self->_issueBand[v15]._downlinkHighFreq < a5
       || self->_issueBand[v15]._uplinkLowFreq > a6
       || self->_issueBand[v15]._uplinkHighFreq < a7
       || !self->_issueBand[v15]._hasIssue)
  {
    ++v15;
    ++v16;
    if (v15 == 28) {
      goto LABEL_9;
    }
  }
  +[WCM_Logging logLevel:3, @"AgcCoexMode need to apply rules for %s", *v16 message];
  BOOL v20 = (char *)self + v15 * 88;
  unint64_t v21 = self->_issueBand[v15]._coexIssues[0];
  if (!v21)
  {
LABEL_9:
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    goto LABEL_10;
  }
  LODWORD(v18) = 0;
  id v22 = (WCM_WiFiCellCoexIssue **)(v20 + 56);
  uint64_t v23 = 4;
  do
  {
    unsigned int v24 = [(WCM_WiFiCellCoexIssue *)v21 wifiBtAgcCoexModeEnabledInPolicy:&v28 cellDlHighFreq:a4 cellUlLowFreq:a5 cellUlHighFreq:a6 agccoexmode:a7];
    uint64_t v17 = v28;
    if (v24) {
      int v25 = v28;
    }
    else {
      int v25 = 0;
    }
    uint64_t v18 = (v25 + v18);
    if (v28 > 0 || v23 == 0) {
      break;
    }
    id v27 = *v22++;
    unint64_t v21 = v27;
    --v23;
  }
  while (v27);
LABEL_10:
  +[WCM_Logging logLevel:3, @"AgcCoexMode for this band 0 - No NonZero - Yes %d, level %d", v18, v17 message];
  BOOL result = (int)v18 > 0;
  *a8 = v28;
  return result;
}

- (id)wifiChannelsToDisableOCLWiFiEnhForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7
{
  uint64_t v11 = *(void *)&a3;
  +[WCM_Logging logLevel:5, @"DisableOCL_WiFiEnh: Try to get WiFi channels to disable OCL on bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf)", *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7 message];
  if ((objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"OclPlistInput") & 1) == 0)
  {
    +[WCM_Logging logLevel:0 message:@"OCL_PLIST_INPUT is not enabled"];
    objc_exception_throw(NSInternalInconsistencyException);
  }
  id v13 = +[NSMutableArray array];
  id v14 = +[NSMutableArray array];
  uint64_t v15 = 0;
  while (1)
  {
    uint64_t bandInfoType = self->_issueBand[v15]._bandInfoType;
    if ((bandInfoType & v11) != 0)
    {
      double downlinkLowFreq = self->_issueBand[v15]._downlinkLowFreq;
      if (downlinkLowFreq <= a4)
      {
        double downlinkHighFreq = self->_issueBand[v15]._downlinkHighFreq;
        if (downlinkHighFreq >= a5)
        {
          double uplinkLowFreq = self->_issueBand[v15]._uplinkLowFreq;
          if (uplinkLowFreq <= a6 && self->_issueBand[v15]._uplinkHighFreq >= a7 && self->_issueBand[v15]._hasIssue) {
            break;
          }
        }
      }
    }
    if (++v15 == 28)
    {
      BOOL v20 = 0;
      goto LABEL_11;
    }
  }
  +[WCM_Logging logLevel:4, @"DisableOCL_WiFiEnh 2G Part: pIssueBandMatched: pIssueBand->_bandInfoType(%d) & bandInfoType(%d) && pIssueBand->_downlinkLowFreq(%lf) <= cellDlLowFreq(%lf) && pIssueBand->_downlinkHighFreq(%lf) >= cellDlHighFreq(%lf) && pIssueBand->_uplinkLowFreq(%lf) <= cellUlLowFreq(%lf) && pIssueBand->_uplinkHighFreq(%lf) >= cellUlHighFreq(%lf)", bandInfoType, v11, *(void *)&downlinkLowFreq, *(void *)&a4, *(void *)&downlinkHighFreq, *(void *)&a5, *(void *)&uplinkLowFreq, *(void *)&a6, *(void *)&self->_issueBand[v15]._uplinkHighFreq, *(void *)&a7 message];
  BOOL v20 = &self->_issueBand[v15];
LABEL_11:
  unint64_t v21 = -1496;
  while (1)
  {
    uint64_t v22 = *(unsigned int *)((char *)&self->_issueBand[45]._bandInfoType + v21);
    if ((v22 & v11) != 0)
    {
      double v23 = *(double *)((char *)&self->_issueBand[45]._downlinkLowFreq + v21);
      if (v23 <= a4)
      {
        double v24 = *(double *)((char *)&self->_issueBand[45]._downlinkHighFreq + v21);
        if (v24 >= a5)
        {
          double v25 = *(double *)((char *)&self->_issueBand[45]._uplinkLowFreq + v21);
          if (v25 <= a6
            && *(double *)((char *)&self->_issueBand[45]._uplinkHighFreq + v21) >= a7
            && LOBYTE(self->_issueBand[45]._coexIssues[v21 / 8 + 5]))
          {
            break;
          }
        }
      }
    }
    v21 += 88;
    if (!v21)
    {
      long long v26 = 0;
      goto LABEL_20;
    }
  }
  +[WCM_Logging logLevel:4, @"DisableOCL_WiFiEnh 5G Part: pIssueBandMatched_5GHz: pIssueBand_5GHz->_bandInfoType(%d) & bandInfoType(%d) && pIssueBand_5GHz->_downlinkLowFreq(%lf) <= cellDlLowFreq(%lf) && pIssueBand_5GHz->_downlinkHighFreq(%lf) >= cellDlHighFreq(%lf) && pIssueBand_5GHz->_uplinkLowFreq(%lf) <= cellUlLowFreq(%lf) && pIssueBand_5GHz->_uplinkHighFreq(%lf) >= cellUlHighFreq(%lf)", v22, v11, *(void *)&v23, *(void *)&a4, *(void *)&v24, *(void *)&a5, *(void *)&v25, *(void *)&a6, *(void *)((char *)&self->_issueBand[45]._uplinkHighFreq + v21), *(void *)&a7 message];
  long long v26 = (char *)&self->_issueBand[45] + v21;
LABEL_20:
  unint64_t v27 = -968;
  while (1)
  {
    uint64_t v28 = *(unsigned int *)((char *)&self[1].super.isa + v27);
    if ((v28 & v11) != 0)
    {
      double v29 = *(double *)((char *)&self[1]._issueBand[0]._bandInfoType + v27);
      if (v29 <= a4)
      {
        double v30 = *(double *)((char *)&self[1]._issueBand[0]._downlinkLowFreq + v27);
        if (v30 >= a5)
        {
          double v31 = *(double *)((char *)&self[1]._issueBand[0]._downlinkHighFreq + v27);
          if (v31 <= a6
            && *(double *)((char *)&self[1]._issueBand[0]._uplinkLowFreq + v27) >= a7
            && LOBYTE(self[1]._issueBand[0]._coexIssues[v27 / 8 + 4]))
          {
            break;
          }
        }
      }
    }
    v27 += 88;
    if (!v27)
    {
      v63 = 0;
      goto LABEL_29;
    }
  }
  +[WCM_Logging logLevel:4, @"DisableOCL_WiFiEnh Enh Part: pIssueBandMatched_Enh: pIssueBand_Enh->_bandInfoType(%d) & bandInfoType(%d) && pIssueBand_Enh->_downlinkLowFreq(%lf) <= cellDlLowFreq(%lf) && pIssueBand_Enh->_downlinkHighFreq(%lf) >= cellDlHighFreq(%lf) && pIssueBand_Enh->_uplinkLowFreq(%lf) <= cellUlLowFreq(%lf) && pIssueBand_Enh->_uplinkHighFreq(%lf) >= cellUlHighFreq(%lf)", v28, v11, *(void *)&v29, *(void *)&a4, *(void *)&v30, *(void *)&a5, *(void *)&v31, *(void *)&a6, *(void *)((char *)&self[1]._issueBand[0]._uplinkLowFreq + v27), *(void *)&a7 message];
  v63 = (char *)&self[1] + v27;
LABEL_29:
  if (v20)
  {
    +[WCM_Logging logLevel:4 message:@"DisableOCL_WiFiEnh 2G Part: Matching issue band (in terms of cellular frequency match) found on 2.4GHz WiFi Band."];
    for (uint64_t i = 0; i != 5; ++i)
    {
      unsigned int v33 = v20->_coexIssues[i];
      if (v33)
      {
        +[WCM_Logging logLevel:4, @"DisableOCL_WiFiEnh 2G Part: coexIssue.issueType is %d and the priority p = %d", [(WCM_WiFiCellCoexIssue *)v33 issueType], i message];
        id v34 = [(WCM_WiFiCellCoexIssue *)v33 wifiOclChannelsAffectedByCellUlLowFreq:0 cellUlHighFreq:a6 isWifi5G:a7];
        if ([v34 count])
        {
          unsigned int v35 = [(WCM_WiFiCellCoexIssue *)v33 issueType];
          uint64_t v36 = "<ISSUE_TYPE_INVALID>";
          if (v35 <= 0xE) {
            uint64_t v36 = off_10020F988[v35];
          }
          +[WCM_Logging logLevel:4, @"DisableOCL_WiFiEnh 2G Part: WiFi channels for %s %@", v36, v34 message];
          long long v74 = 0u;
          long long v75 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          id v37 = [v34 countByEnumeratingWithState:&v72 objects:v80 count:16];
          if (v37)
          {
            id v38 = v37;
            uint64_t v39 = *(void *)v73;
            do
            {
              for (uint64_t j = 0; j != v38; uint64_t j = (char *)j + 1)
              {
                if (*(void *)v73 != v39) {
                  objc_enumerationMutation(v34);
                }
                uint64_t v41 = *(void *)(*((void *)&v72 + 1) + 8 * (void)j);
                if (([v13 containsObject:v41] & 1) == 0) {
                  [v13 addObject:v41];
                }
              }
              id v38 = [v34 countByEnumeratingWithState:&v72 objects:v80 count:16];
            }
            while (v38);
          }
        }
      }
    }
  }
  if (v26)
  {
    +[WCM_Logging logLevel:4 message:@"DisableOCL_WiFiEnh 5G Part: Matching issue band (in terms of cellular frequency match) found on (FV)GHz WiFi Band."];
    for (uint64_t k = 0; k != 5; ++k)
    {
      uint64_t v43 = *(void **)&v26[8 * k + 40];
      if (v43)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, @"DisableOCL_WiFiEnh 5G Part: coexIssue_5GHz.issueType is %d and the priority p = %d", [v43 issueType], k);
        id v44 = [v43 wifiOclChannelsAffectedByCellUlLowFreq:1 cellUlHighFreq:a6 isWifi5G:a7];
        if ([v44 count])
        {
          unsigned int v45 = [v43 issueType];
          uint64_t v46 = "<ISSUE_TYPE_INVALID>";
          if (v45 <= 0xE) {
            uint64_t v46 = off_10020F988[v45];
          }
          +[WCM_Logging logLevel:4, @"DisableOCL_WiFiEnh 5G Part: WiFi channels for %s %@", v46, v44 message];
          long long v70 = 0u;
          long long v71 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          id v47 = [v44 countByEnumeratingWithState:&v68 objects:v79 count:16];
          if (v47)
          {
            id v48 = v47;
            uint64_t v49 = *(void *)v69;
            do
            {
              for (m = 0; m != v48; m = (char *)m + 1)
              {
                if (*(void *)v69 != v49) {
                  objc_enumerationMutation(v44);
                }
                uint64_t v51 = *(void *)(*((void *)&v68 + 1) + 8 * (void)m);
                if ([&off_10024E128 containsObject:v51]
                  && ([v13 containsObject:v51] & 1) == 0)
                {
                  [v13 addObject:v51];
                }
              }
              id v48 = [v44 countByEnumeratingWithState:&v68 objects:v79 count:16];
            }
            while (v48);
          }
        }
      }
    }
  }
  if (v63)
  {
    +[WCM_Logging logLevel:4 message:@"DisableOCL_WiFiEnh Enh Part: Matching issue band (in terms of cellular frequency match) found on Enh WiFi Band."];
    for (uint64_t n = 0; n != 5; ++n)
    {
      long long v53 = *(void **)&v63[8 * n + 40];
      if (v53)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, @"DisableOCL_WiFiEnh Enh Part: coexIssue_Enh.issueType is %d and the priority p = %d", [v53 issueType], n);
        id v54 = [v53 wiFiEnhOclChannelsAffectedByCellUlLowFreq:a6 cellUlHighFreq:a7];
        if ([v54 count])
        {
          unsigned int v55 = [v53 issueType];
          unsigned int v56 = "<ISSUE_TYPE_INVALID>";
          if (v55 <= 0xE) {
            unsigned int v56 = off_10020F988[v55];
          }
          +[WCM_Logging logLevel:4, @"DisableOCL_WiFiEnh Enh Part: WiFi channels for %s %@", v56, v54 message];
          long long v66 = 0u;
          long long v67 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          id v57 = [v54 countByEnumeratingWithState:&v64 objects:v78 count:16];
          if (v57)
          {
            id v58 = v57;
            uint64_t v59 = *(void *)v65;
            do
            {
              for (iuint64_t i = 0; ii != v58; iuint64_t i = (char *)ii + 1)
              {
                if (*(void *)v65 != v59) {
                  objc_enumerationMutation(v54);
                }
                uint64_t v61 = *(void *)(*((void *)&v64 + 1) + 8 * (void)ii);
                if ([&off_10024E140 containsObject:v61]
                  && ([v14 containsObject:v61] & 1) == 0)
                {
                  [v14 addObject:v61];
                }
              }
              id v58 = [v54 countByEnumeratingWithState:&v64 objects:v78 count:16];
            }
            while (v58);
          }
        }
      }
    }
  }
  +[WCM_Logging logLevel:3, @"DisableOCL_WiFiEnh: WiFi channels to disable OCL combinedChannels is %@, combinedChannelsEnh is %@", v13, v14 message];
  v76[0] = @"wifiChannels2Gand5G";
  v76[1] = @"wifiChannelsEnh";
  v77[0] = v13;
  v77[1] = v14;
  return +[NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:2];
}

- (id)wifiChannelsToEnableWCI2WiFiEnhForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 pissueBandMatch:(BOOL *)a8
{
  uint64_t v13 = *(void *)&a3;
  +[WCM_Logging logLevel:5, @"WCI2_WiFiEnh: Try to get WiFi channels to enable WCI2 on bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf)", *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7 message];
  id v15 = +[NSMutableArray array];
  id v16 = +[NSMutableArray array];
  uint64_t v17 = 0;
  while (1)
  {
    uint64_t bandInfoType = self->_issueBand[v17]._bandInfoType;
    if ((bandInfoType & v13) != 0)
    {
      double downlinkLowFreq = self->_issueBand[v17]._downlinkLowFreq;
      if (downlinkLowFreq <= a4)
      {
        double downlinkHighFreq = self->_issueBand[v17]._downlinkHighFreq;
        if (downlinkHighFreq >= a5)
        {
          double uplinkLowFreq = self->_issueBand[v17]._uplinkLowFreq;
          if (uplinkLowFreq <= a6 && self->_issueBand[v17]._uplinkHighFreq >= a7 && self->_issueBand[v17]._hasIssue) {
            break;
          }
        }
      }
    }
    if (++v17 == 28)
    {
      *((void *)&v67 + 1) = 0;
      goto LABEL_10;
    }
  }
  +[WCM_Logging logLevel:4, @"WCI2_WiFiEnh2G5G 2G Part: pIssueBandMatched: pIssueBand->_bandInfoType(%d) & bandInfoType(%d) && pIssueBand->_downlinkLowFreq(%lf) <= cellDlLowFreq(%lf) && pIssueBand->_downlinkHighFreq(%lf) >= cellDlHighFreq(%lf) && pIssueBand->_uplinkLowFreq(%lf) <= cellUlLowFreq(%lf) && pIssueBand->_uplinkHighFreq(%lf) >= cellUlHighFreq(%lf)", bandInfoType, v13, *(void *)&downlinkLowFreq, *(void *)&a4, *(void *)&downlinkHighFreq, *(void *)&a5, *(void *)&uplinkLowFreq, *(void *)&a6, *(void *)&self->_issueBand[v17]._uplinkHighFreq, *(void *)&a7 message];
  *((void *)&v67 + 1) = &self->_issueBand[v17];
LABEL_10:
  unint64_t v22 = -1496;
  long long v66 = a8;
  while (1)
  {
    uint64_t v23 = *(unsigned int *)((char *)&self->_issueBand[45]._bandInfoType + v22);
    if ((v23 & v13) != 0)
    {
      double v24 = *(double *)((char *)&self->_issueBand[45]._downlinkLowFreq + v22);
      if (v24 <= a4)
      {
        double v25 = *(double *)((char *)&self->_issueBand[45]._downlinkHighFreq + v22);
        if (v25 >= a5)
        {
          double v26 = *(double *)((char *)&self->_issueBand[45]._uplinkLowFreq + v22);
          if (v26 <= a6
            && *(double *)((char *)&self->_issueBand[45]._uplinkHighFreq + v22) >= a7
            && LOBYTE(self->_issueBand[45]._coexIssues[v22 / 8 + 5]))
          {
            break;
          }
        }
      }
    }
    v22 += 88;
    if (!v22)
    {
      *(void *)&long long v67 = 0;
      goto LABEL_19;
    }
  }
  +[WCM_Logging logLevel:4, @"WCI2_WiFiEnh2G5G 5G Part: pIssueBandMatched_5GHz: pIssueBand_5GHz->_bandInfoType(%d) & bandInfoType(%d) && pIssueBand_5GHz->_downlinkLowFreq(%lf) <= cellDlLowFreq(%lf) && pIssueBand_5GHz->_downlinkHighFreq(%lf) >= cellDlHighFreq(%lf) && pIssueBand_5GHz->_uplinkLowFreq(%lf) <= cellUlLowFreq(%lf) && pIssueBand_5GHz->_uplinkHighFreq(%lf) >= cellUlHighFreq(%lf)", v23, v13, *(void *)&v24, *(void *)&a4, *(void *)&v25, *(void *)&a5, *(void *)&v26, *(void *)&a6, *(void *)((char *)&self->_issueBand[45]._uplinkHighFreq + v22), *(void *)&a7 message];
  *(void *)&long long v67 = (char *)&self->_issueBand[45] + v22;
LABEL_19:
  unint64_t v27 = -968;
  while (1)
  {
    uint64_t v28 = *(unsigned int *)((char *)&self[1].super.isa + v27);
    if ((v28 & v13) != 0)
    {
      double v29 = *(double *)((char *)&self[1]._issueBand[0]._bandInfoType + v27);
      if (v29 <= a4)
      {
        double v30 = *(double *)((char *)&self[1]._issueBand[0]._downlinkLowFreq + v27);
        if (v30 >= a5)
        {
          double v31 = *(double *)((char *)&self[1]._issueBand[0]._downlinkHighFreq + v27);
          if (v31 <= a6
            && *(double *)((char *)&self[1]._issueBand[0]._uplinkLowFreq + v27) >= a7
            && LOBYTE(self[1]._issueBand[0]._coexIssues[v27 / 8 + 4]))
          {
            break;
          }
        }
      }
    }
    v27 += 88;
    if (!v27)
    {
      uint64_t v32 = 0;
      goto LABEL_28;
    }
  }
  +[WCM_Logging logLevel:4, @"WCI2_WiFiEnh2G5G Enh Part: pIssueBandMatched_Enh: pIssueBand_Enh->_bandInfoType(%d) & bandInfoType(%d) && pIssueBand_Enh->_downlinkLowFreq(%lf) <= cellDlLowFreq(%lf) && pIssueBand_Enh->_downlinkHighFreq(%lf) >= cellDlHighFreq(%lf) && pIssueBand_Enh->_uplinkLowFreq(%lf) <= cellUlLowFreq(%lf) && pIssueBand_Enh->_uplinkHighFreq(%lf) >= cellUlHighFreq(%lf)", v28, v13, *(void *)&v29, *(void *)&a4, *(void *)&v30, *(void *)&a5, *(void *)&v31, *(void *)&a6, *(void *)((char *)&self[1]._issueBand[0]._uplinkLowFreq + v27), *(void *)&a7 message];
  uint64_t v32 = (char *)&self[1] + v27;
LABEL_28:
  if (*((void *)&v67 + 1))
  {
    +[WCM_Logging logLevel:4 message:@"WCI2_WiFiEnh2G5G 2G Part: Matching issue band (in terms of cellular frequency match) found on 2.4GHz WiFi Band."];
    for (uint64_t i = 0; i != 5; ++i)
    {
      id v34 = *(void **)(*((void *)&v67 + 1) + 8 * i + 40);
      if (v34)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, @"WCI2_WiFiEnh2G5G 2G Part: coexIssue.issueType is %d and the priority p = %d", [v34 issueType], i);
        id v35 = [v34 wifiChannelsAffectedByCellUlLowFreq:0 cellUlHighFreq:a6 wifi5G:a7];
        if ([v35 count])
        {
          unsigned int v36 = [v34 issueType];
          id v37 = "<ISSUE_TYPE_INVALID>";
          if (v36 <= 0xE) {
            id v37 = off_10020F988[v36];
          }
          +[WCM_Logging logLevel:4, @"WCI2_WiFiEnh2G5G 2G Part: WiFi channels for %s %@", v37, v35 message];
          long long v78 = 0u;
          long long v79 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          id v38 = [v35 countByEnumeratingWithState:&v76 objects:v84 count:16];
          if (v38)
          {
            id v39 = v38;
            uint64_t v40 = *(void *)v77;
            do
            {
              for (uint64_t j = 0; j != v39; uint64_t j = (char *)j + 1)
              {
                if (*(void *)v77 != v40) {
                  objc_enumerationMutation(v35);
                }
                uint64_t v42 = *(void *)(*((void *)&v76 + 1) + 8 * (void)j);
                if (([v15 containsObject:v42] & 1) == 0) {
                  [v15 addObject:v42];
                }
              }
              id v39 = [v35 countByEnumeratingWithState:&v76 objects:v84 count:16];
            }
            while (v39);
          }
        }
      }
    }
  }
  if ((void)v67)
  {
    +[WCM_Logging logLevel:4 message:@"WCI2_WiFiEnh2G5G 5G Part: Matching issue band (in terms of cellular frequency match) found on (FV)GHz WiFi Band."];
    for (uint64_t k = 0; k != 5; ++k)
    {
      id v44 = *(void **)(v67 + 8 * k + 40);
      if (v44)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, @"WCI2_WiFiEnh2G5G 5G Part: coexIssue_5GHz.issueType is %d and the priority p = %d", [v44 issueType], k);
        id v45 = [v44 wifiChannelsAffectedByCellUlLowFreq:1 cellUlHighFreq:a6 wifi5G:a7];
        if ([v45 count])
        {
          unsigned int v46 = [v44 issueType];
          id v47 = "<ISSUE_TYPE_INVALID>";
          if (v46 <= 0xE) {
            id v47 = off_10020F988[v46];
          }
          +[WCM_Logging logLevel:4, @"WCI2_WiFiEnh2G5G 5G Part: WiFi channels for %s %@", v47, v45 message];
          long long v74 = 0u;
          long long v75 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          id v48 = [v45 countByEnumeratingWithState:&v72 objects:v83 count:16];
          if (v48)
          {
            id v49 = v48;
            uint64_t v50 = *(void *)v73;
            do
            {
              for (m = 0; m != v49; m = (char *)m + 1)
              {
                if (*(void *)v73 != v50) {
                  objc_enumerationMutation(v45);
                }
                uint64_t v52 = *(void *)(*((void *)&v72 + 1) + 8 * (void)m);
                if ([&off_10024E098 containsObject:v52]
                  && ([v15 containsObject:v52] & 1) == 0)
                {
                  [v15 addObject:v52];
                }
              }
              id v49 = [v45 countByEnumeratingWithState:&v72 objects:v83 count:16];
            }
            while (v49);
          }
        }
      }
    }
  }
  if (v32)
  {
    +[WCM_Logging logLevel:4 message:@"WCI2_WiFiEnh Enh Part: Matching issue band (in terms of cellular frequency match) found on Enh WiFi Band."];
    for (uint64_t n = 0; n != 5; ++n)
    {
      id v54 = *(void **)&v32[8 * n + 40];
      if (v54)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, @"WCI2_WiFiEnh Enh Part: coexIssue_Enh.issueType is %d and the priority p = %d", [v54 issueType], n);
        id v55 = [v54 wiFiEnhChannelsAffectedByCellUlLowFreq:a6 cellUlHighFreq:a7];
        if ([v55 count])
        {
          unsigned int v56 = [v54 issueType];
          id v57 = "<ISSUE_TYPE_INVALID>";
          if (v56 <= 0xE) {
            id v57 = off_10020F988[v56];
          }
          +[WCM_Logging logLevel:4, @"WCI2_WiFiEnh Enh Part: WiFi channels for %s %@", v57, v55 message];
          long long v70 = 0u;
          long long v71 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          id v58 = [v55 countByEnumeratingWithState:&v68 objects:v82 count:16];
          if (v58)
          {
            id v59 = v58;
            uint64_t v60 = *(void *)v69;
            do
            {
              for (iuint64_t i = 0; ii != v59; iuint64_t i = (char *)ii + 1)
              {
                if (*(void *)v69 != v60) {
                  objc_enumerationMutation(v55);
                }
                uint64_t v62 = *(void *)(*((void *)&v68 + 1) + 8 * (void)ii);
                if ([&off_10024E0B0 containsObject:v62]
                  && ([v16 containsObject:v62] & 1) == 0)
                {
                  [v16 addObject:v62];
                }
              }
              id v59 = [v55 countByEnumeratingWithState:&v68 objects:v82 count:16];
            }
            while (v59);
          }
        }
      }
    }
  }
  if (v67 == 0)
  {
    long long v64 = v66;
    if (![v15 count]) {
      [v15 addObject:&off_10023CB10];
    }
    char v63 = 0;
  }
  else
  {
    [v15 sortUsingComparator:&stru_10020F698];
    char v63 = 1;
    long long v64 = v66;
  }
  *long long v64 = v63;
  +[WCM_Logging logLevel:3, @"WiFi channels to enable WCI2_WiFiEnh2G5G is %@, combinedChannelsEnh is %@", v15, v16 message];
  v80[0] = @"wifiChannels2Gand5G";
  v80[1] = @"wifiChannelsEnh";
  v81[0] = v15;
  v81[1] = v16;
  return +[NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:2];
}

- (id)findWiFiAntennaOrCellTxPowerConstraintWiFiEnhCoexIssueByCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 wifiChannel:(int)a8 wifiCenterFreq:(unsigned int)a9 wifiBandwidth:(unsigned int)a10 gpsRadioActive:(BOOL)a11 wifiAntennaConstraint:(BOOL *)a12 cellTxPowerConstraint:(BOOL *)a13
{
  BOOL v14 = a11;
  uint64_t v15 = *(void *)&a10;
  uint64_t v16 = *(void *)&a9;
  uint64_t v17 = *(void *)&a8;
  +[WCM_Logging logLevel:5, @"WiFiEnh_: Try to find WiFi antenna or Cell Tx power constraints for bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf), wifiChannel(%d), wifiBandwidth(%d), wifiCenterFreq(%d), gpsRadioActive(%d)", *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7, *(void *)&a8, *(void *)&a10, *(void *)&a9, a11 message];
  if ((v16 - 2400) >= 0x65)
  {
    if ((v16 - 5170) >= 0x29A)
    {
      if ((v16 - 5925) >= 0x4B1)
      {
        id v39 = +[WCM_PolicyManager singleton];
        uint64_t v40 = 999;
        uint64_t v41 = 999;
        uint64_t v42 = 0;
        uint64_t v43 = 0;
        goto LABEL_50;
      }
      BOOL v60 = v14;
      id v59 = a12;
      unsigned int v25 = 210;
      unsigned int v24 = 200;
    }
    else
    {
      BOOL v60 = v14;
      id v59 = a12;
      unsigned int v25 = 116;
      unsigned int v24 = 100;
    }
  }
  else
  {
    BOOL v60 = v14;
    id v59 = a12;
    unsigned int v24 = 0;
    unsigned int v25 = 27;
  }
  id v26 = +[WRM_MetricsService getSingleton];
  unint64_t v27 = v26;
  if (v26) {
    [v26 initLTECoexMetrics];
  }
  uint64_t v28 = (char *)[v27 getLTECoexMetrics];
  double v29 = (unsigned int *)(v28 + 8);
  char v63 = v28;
  if (v28)
  {
    *(int32x2_t *)double v29 = vdup_n_s32(0x3E7u);
    *((_WORD *)v28 + 8) = 0;
  }
  if (v24 > v25)
  {
LABEL_32:
    CFStringRef v36 = @"No matching issue band found";
LABEL_46:
    +[WCM_Logging logLevel:3 message:v36];
    unsigned int v51 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") activeCoexFeatures] containsObject:@"AntSelStatsAWDStats"];
    id v47 = 0;
    if (!v63 || !v51) {
      return v47;
    }
    if (![[[WCM_PolicyManager singleton] activeCoexFeatures] containsObject:@"ANTSELSTATSAWDSTATSCAMigration"])return 0; {
    id v39 = +[WCM_PolicyManager singleton];
    }
    uint64_t v40 = *v29;
    uint64_t v41 = v29[1];
    uint64_t v42 = *((unsigned __int8 *)v29 + 8);
    uint64_t v43 = *((unsigned __int8 *)v29 + 9);
LABEL_50:
    [v39 wRMCACoexSubmit_AntSelPolicyStates:v40 IssueType:v41 IsCoexBand:v42 HasAntConstraint:v43];
    return 0;
  }
  id v58 = (unsigned int *)(v28 + 8);
  uint64_t v61 = &self->_issueBand[45];
  issueBand = self->_issueBand;
  double v30 = &self->_issueBand[28];
  unint64_t v31 = v24;
  uint64_t v32 = v25 + 1;
  unsigned int v33 = &issueBand[v24];
  while (1)
  {
    id v34 = v33;
    if (v31 >= 0x1C)
    {
      if ((v31 - 100) > 0x10)
      {
        if (v31 < 0xC8)
        {
          +[WCM_Logging logLevel:0 message:@"WiFiEnh_: thisIssueBand does not match any of the predefined ranges defined in WCM_WiFiCellCoexIssueBand enum."];
          id v34 = issueBand;
        }
        else
        {
          id v34 = &v61[(v31 - 200)];
        }
      }
      else
      {
        id v34 = &v30[(v31 - 100)];
      }
    }
    if ((v34->_bandInfoType & a3) != 0
      && v34->_downlinkLowFreq <= a4
      && v34->_downlinkHighFreq >= a5
      && v34->_uplinkLowFreq <= a6
      && v34->_uplinkHighFreq >= a7)
    {
      if (v63 && v34->_hasIssue)
      {
        double v29 = v58;
        *id v58 = v31;
        *((unsigned char *)v58 + 8) = 1;
        LODWORD(v32) = v31;
        goto LABEL_30;
      }
      if (v34->_hasIssue) {
        break;
      }
    }
    ++v31;
    ++v33;
    if (v32 == v31)
    {
      id v34 = 0;
      goto LABEL_29;
    }
  }
  LODWORD(v32) = v31;
LABEL_29:
  double v29 = v58;
  if (!v34) {
    goto LABEL_32;
  }
LABEL_30:
  if (v32 > 0xD2)
  {
    id v35 = "<ISSUE_BAND_INVALID: beyond the range>";
    goto LABEL_40;
  }
  int v37 = v32 - 200;
  if (v32 >= 0xC8)
  {
    id v38 = off_10020F908;
LABEL_38:
    id v44 = (const char **)&v38[v37];
LABEL_39:
    id v35 = *v44;
    goto LABEL_40;
  }
  int v37 = v32 - 100;
  if ((v32 - 100) <= 0x10)
  {
    id v38 = off_10020F880;
    goto LABEL_38;
  }
  if (v32 <= 0x1B)
  {
    id v44 = (const char **)&off_10020F7A0[v32];
    goto LABEL_39;
  }
  id v35 = "<ISSUE_BAND_INVALID: Negative number.>";
LABEL_40:
  +[WCM_Logging logLevel:3, @"need to apply rules for %s", v35 message];
  uint64_t v45 = 0;
  coexIssues = v34->_coexIssues;
  while (1)
  {
    id v47 = coexIssues[v45];
    if (!v47)
    {
LABEL_45:
      CFStringRef v36 = @"No constraint required";
      goto LABEL_46;
    }
    unsigned int v48 = [(WCM_WiFiCellCoexIssue *)coexIssues[v45] needWiFiAntennaConstraintWiFiEnhOnCellDlLowFreq:v17 cellDlHighFreq:v16 cellUlLowFreq:v15 cellUlHighFreq:v60 wifiChannel:a4 wifiCenterFreq:a5 wifiBandwidth:a6 gpsRadioActive:a7];
    unsigned int v49 = [(WCM_WiFiCellCoexIssue *)v47 needCellTxPowerConstraintWiFiEnhOnCellDlLowFreq:v17 cellDlHighFreq:v16 cellUlLowFreq:v15 cellUlHighFreq:v60 wifiChannel:a4 wifiCenterFreq:a5 wifiBandwidth:a6 gpsRadioActive:a7];
    BOOL v50 = v49;
    if ((v48 & 1) != 0 || v49) {
      break;
    }
    if (++v45 == 5) {
      goto LABEL_45;
    }
  }
  if (v48) {
    long long v53 = "WiFi antenna ";
  }
  else {
    long long v53 = "";
  }
  unsigned int v54 = [(WCM_WiFiCellCoexIssue *)v47 issueType];
  if (v54 <= 0xE) {
    id v55 = off_10020F988[v54];
  }
  else {
    id v55 = "<ISSUE_TYPE_INVALID>";
  }
  unsigned int v56 = "Cell Tx power ";
  if (!v50) {
    unsigned int v56 = "";
  }
  +[WCM_Logging logLevel:3, @"WiFiEnh_: %s requires %s%sconstraint", v55, v53, v56 message];
  *id v59 = v48;
  *a13 = v50;
  if (v63)
  {
    v29[1] = [(WCM_WiFiCellCoexIssue *)v47 issueType];
    *((unsigned char *)v29 + 9) = v48;
  }
  unsigned int v57 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") activeCoexFeatures] containsObject:@"AntSelStatsAWDStats"];
  if (v63
    && v57
    && objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"ANTSELSTATSAWDSTATSCAMigration"))
  {
    [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") wRMCACoexSubmit_AntSelPolicyStates:IssueType:IsCoexBand:HasAntConstraint:*v29, v29[1], *((unsigned __int8 *)v29 + 8), *((unsigned __int8 *)v29 + 9)];
  }
  return v47;
}

- (id)HFBTAntBlockingBandsFromWiFiConfigForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7
{
  uint64_t v11 = *(void *)&a3;
  id v13 = [&off_100254A88 mutableCopy];
  id v14 = [(WCM_WiFiCellCoexIssueBandTable *)self getWifiDesensedCoexIssueFromIssueBand:[(WCM_WiFiCellCoexIssueBandTable *)self findIssueBandForBandInfoType:v11 cellDlHighFreq:1 cellDlLowFreq:a5 cellUlHighFreq:a4 cellUlLowFreq:a7 wifiBand:a6]];
  if (v14)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100094D0C;
    v18[3] = &unk_10020F780;
    v18[4] = v13;
    [objc_msgSend(v14, "HFBTAntBlkBandsForCellUlLowFreq:cellUlHighFreq:", a6, a7) enumerateKeysAndObjectsUsingBlock:v18];
  }
  id v15 = [(WCM_WiFiCellCoexIssueBandTable *)self getWifiDesensedCoexIssueFromIssueBand:[(WCM_WiFiCellCoexIssueBandTable *)self findIssueBandForBandInfoType:v11 cellDlHighFreq:2 cellDlLowFreq:a5 cellUlHighFreq:a4 cellUlLowFreq:a7 wifiBand:a6]];
  if (v15)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100094D7C;
    v17[3] = &unk_10020F780;
    v17[4] = v13;
    [objc_msgSend(v15, "HFBTAntBlkBandsForCellUlLowFreq:cellUlHighFreq:", a6, a7) enumerateKeysAndObjectsUsingBlock:v17];
  }
  return v13;
}

- (id)getWifiDesensedCoexIssueFromIssueBand:(id *)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v3 = 0;
  var5 = a3->var5;
  while (1)
  {
    id v5 = var5[v3];
    if (!v5 || [var5[v3] enableWifiChannelAvoidance]) {
      break;
    }
    if (++v3 == 5) {
      return 0;
    }
  }
  return v5;
}

- (id)HFBTPreferredChannelMapForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 gpsRadioActive:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v13 = *(void *)&a3;
  +[WCM_Logging logLevel:3, @"HFAFHDebug_ Try to get preferred channel map on bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf) ", *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7 message];
  id v15 = +[NSMutableData data];
  id v16 = [(WCM_WiFiCellCoexIssueBandTable *)self getHFBTAFHCoexIssuesFromIssueBand:[(WCM_WiFiCellCoexIssueBandTable *)self findIssueBandForBandInfoType:v13 cellDlHighFreq:1 cellDlLowFreq:a5 cellUlHighFreq:a4 cellUlLowFreq:a7 wifiBand:a6]];
  if ([v16 count])
  {
    [v15 appendData:-[WCM_WiFiCellCoexIssueBandTable GetHFBTBandBlockedChannelMapWithCellUlHighFreq:cellUlLowFreq:cellDlHighFreq:cellDlLowFreq:gpsRadioActive:coexIssues:btBandLowFreq:btBandHighFreq:btNumChannel:](self, "GetHFBTBandBlockedChannelMapWithCellUlHighFreq:cellUlLowFreq:cellDlHighFreq:cellDlLowFreq:gpsRadioActive:coexIssues:btBandLowFreq:btBandHighFreq:btNumChannel:", v8, v16, 101, a7, a6, a5, a4, 5150.0, 5250.0)];
    uint64_t v17 = [(WCM_WiFiCellCoexIssueBandTable *)self GetHFBTBandBlockedChannelMapWithCellUlHighFreq:v8 cellUlLowFreq:v16 cellDlHighFreq:126 cellDlLowFreq:a7 gpsRadioActive:a6 coexIssues:a5 btBandLowFreq:a4 btBandHighFreq:5725.0 btNumChannel:5850.0];
  }
  else
  {
    [v15 appendData:sub_10001CF40([NSMutableArray array], 101)];
    uint64_t v17 = sub_10001CF40(+[NSMutableArray array], 126);
  }
  [v15 appendData:v17];
  id v18 = [(WCM_WiFiCellCoexIssueBandTable *)self getHFBTAFHCoexIssuesFromIssueBand:[(WCM_WiFiCellCoexIssueBandTable *)self findIssueBandForBandInfoType:v13 cellDlHighFreq:2 cellDlLowFreq:a5 cellUlHighFreq:a4 cellUlLowFreq:a7 wifiBand:a6]];
  if ([v18 count])
  {
    [v15 appendData:-[WCM_WiFiCellCoexIssueBandTable GetHFBTBandBlockedChannelMapWithCellUlHighFreq:cellUlLowFreq:cellDlHighFreq:cellDlLowFreq:gpsRadioActive:coexIssues:btBandLowFreq:btBandHighFreq:btNumChannel:](self, "GetHFBTBandBlockedChannelMapWithCellUlHighFreq:cellUlLowFreq:cellDlHighFreq:cellDlLowFreq:gpsRadioActive:coexIssues:btBandLowFreq:btBandHighFreq:btNumChannel:", v8, v18, 125, a7, a6, a5, a4, 5925.0, 6050.0)];
    [v15 appendData:-[WCM_WiFiCellCoexIssueBandTable GetHFBTBandBlockedChannelMapWithCellUlHighFreq:cellUlLowFreq:cellDlHighFreq:cellDlLowFreq:gpsRadioActive:coexIssues:btBandLowFreq:btBandHighFreq:btNumChannel:](self, "GetHFBTBandBlockedChannelMapWithCellUlHighFreq:cellUlLowFreq:cellDlHighFreq:cellDlLowFreq:gpsRadioActive:coexIssues:btBandLowFreq:btBandHighFreq:btNumChannel:", v8, v18, 125, a7, a6, a5, a4, 6051.0, 6175.0)];
    [v15 appendData:-[WCM_WiFiCellCoexIssueBandTable GetHFBTBandBlockedChannelMapWithCellUlHighFreq:cellUlLowFreq:cellDlHighFreq:cellDlLowFreq:gpsRadioActive:coexIssues:btBandLowFreq:btBandHighFreq:btNumChannel:](self, "GetHFBTBandBlockedChannelMapWithCellUlHighFreq:cellUlLowFreq:cellDlHighFreq:cellDlLowFreq:gpsRadioActive:coexIssues:btBandLowFreq:btBandHighFreq:btNumChannel:", v8, v18, 125, a7, a6, a5, a4, 6176.0, 6300.0)];
    unint64_t v19 = [(WCM_WiFiCellCoexIssueBandTable *)self GetHFBTBandBlockedChannelMapWithCellUlHighFreq:v8 cellUlLowFreq:v18 cellDlHighFreq:125 cellDlLowFreq:a7 gpsRadioActive:a6 coexIssues:a5 btBandLowFreq:a4 btBandHighFreq:6301.0 btNumChannel:6425.0];
  }
  else
  {
    [v15 appendData:sub_10001CF40([+[NSMutableArray array](NSMutableArray, "array"), 125]);
    [v15 appendData:sub_10001CF40([NSMutableArray array], 125)];
    [v15 appendData:sub_10001CF40([+[NSMutableArray array](NSMutableArray, "array"), 125]);
    unint64_t v19 = sub_10001CF40(+[NSMutableArray array], 125);
  }
  [v15 appendData:v19];
  +[WCM_Logging logLevel:3, @"HFAFHDebug_ preferred channel map %@", v15 message];
  if ([v15 length] != (id)96)
  {
    +[WCM_Logging logLevel:0 message:@"HFAFHDebug_ Wrong map length"];
    objc_exception_throw(NSInternalInconsistencyException);
  }
  return v15;
}

- ($342A0BF88B4ABE00867B0BBC077042BD)findIssueBandForBandInfoType:(int)a3 cellDlHighFreq:(double)a4 cellDlLowFreq:(double)a5 cellUlHighFreq:(double)a6 cellUlLowFreq:(double)a7 wifiBand:(int)a8
{
  if (a8)
  {
    if (a8 == 1)
    {
      uint64_t v14 = 0;
      id v15 = &stru_10020FAC0;
      unsigned int v16 = 100;
      p_signature = (const char **)off_10020F880;
      while ((self->_issueBand[v14 + 28]._bandInfoType & a3) == 0
           || self->_issueBand[v14 + 28]._downlinkLowFreq > a5
           || self->_issueBand[v14 + 28]._downlinkHighFreq < a4
           || self->_issueBand[v14 + 28]._uplinkLowFreq > a7
           || self->_issueBand[v14 + 28]._uplinkHighFreq < a6
           || !self->_issueBand[v14 + 28]._hasIssue)
      {
        id v15 = (Block_descriptor_3 *)((char *)v15 + 8);
        ++v16;
        ++p_signature;
        if (++v14 == 17) {
          return 0;
        }
      }
      id v18 = &self->_issueBand[v14 + 28];
      if (v16 - 100 >= 0x11 && (p_signature = &v15->signature, v16 > 0x1B)) {
        unint64_t v21 = "<ISSUE_BAND_INVALID: Negative number.>";
      }
      else {
        unint64_t v21 = *p_signature;
      }
      +[WCM_Logging logLevel:3, @"HFAFHDebug_ found match for 5G band %s", v21 message];
    }
    else if (a8 == 2)
    {
      uint64_t v8 = 0;
      v9 = off_10020FDE0;
      v10 = &qword_10020FBA0;
      unsigned int v11 = 200;
      v12 = (const char **)off_10020F908;
      while ((self->_issueBand[v8 + 45]._bandInfoType & a3) == 0
           || self->_issueBand[v8 + 45]._downlinkLowFreq > a5
           || self->_issueBand[v8 + 45]._downlinkHighFreq < a4
           || self->_issueBand[v8 + 45]._uplinkLowFreq > a7
           || self->_issueBand[v8 + 45]._uplinkHighFreq < a6
           || !self->_issueBand[v8 + 45]._hasIssue)
      {
        ++v9;
        ++v11;
        ++v10;
        ++v12;
        if (++v8 == 11) {
          return 0;
        }
      }
      id v18 = &self->_issueBand[v8 + 45];
      if (v11 <= 0xC7 && (v12 = (const char **)v10, v11 - 100 >= 0x11) && (v12 = (const char **)v9, v11 > 0x1B)) {
        BOOL v20 = "<ISSUE_BAND_INVALID: Negative number.>";
      }
      else {
        BOOL v20 = *v12;
      }
      +[WCM_Logging logLevel:3, @"HFAFHDebug_ found match for 6G band %s", v20 message];
    }
    else
    {
      return 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
    while ((self->_issueBand[v13]._bandInfoType & a3) == 0
         || self->_issueBand[v13]._downlinkLowFreq > a5
         || self->_issueBand[v13]._downlinkHighFreq < a4
         || self->_issueBand[v13]._uplinkLowFreq > a7
         || self->_issueBand[v13]._uplinkHighFreq < a6
         || !self->_issueBand[v13]._hasIssue)
    {
      if (++v13 == 28) {
        return 0;
      }
    }
    return ($342A0BF88B4ABE00867B0BBC077042BD *)&self->_issueBand[v13];
  }
  return ($342A0BF88B4ABE00867B0BBC077042BD *)v18;
}

- (id)getHFBTAFHCoexIssuesFromIssueBand:(id *)a3
{
  id v4 = (id)objc_opt_new();
  if (a3)
  {
    uint64_t v5 = 0;
    var5 = a3->var5;
    while (1)
    {
      id v7 = var5[v5];
      if (!v7) {
        goto LABEL_11;
      }
      if ([var5[v5] issueType] != 12 && objc_msgSend(v7, "issueType") != 13) {
        break;
      }
      if ([[[WCM_PolicyManager singleton] activeCoexFeatures] containsObject:@"HFBTOOBMASKING"])goto LABEL_7; {
LABEL_10:
      }
      if (++v5 == 5) {
        goto LABEL_11;
      }
    }
    if ([v7 btDiversityBlocklistTypeForC0B1] != 3
      || [v7 btChannelsToAvoidForC0B1])
    {
      goto LABEL_10;
    }
LABEL_7:
    [v4 addObject:v7];
    goto LABEL_10;
  }
LABEL_11:

  return +[NSArray arrayWithArray:v4];
}

- (id)btPreferredChannelMapForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 gpsRadioActive:(BOOL)a8
{
  BOOL v8 = a8;
  +[WCM_Logging logLevel:3, @"Try to get BT preferred channel map on bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf) gpsRadioActive(%d)", *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7, a8 message];
  id v15 = +[NSMutableArray array];
  uint64_t v16 = 0;
  issueBand = self->_issueBand;
  while ((issueBand[v16]._bandInfoType & a3) == 0
       || issueBand[v16]._downlinkLowFreq > a4
       || issueBand[v16]._downlinkHighFreq < a5
       || issueBand[v16]._uplinkLowFreq > a6
       || issueBand[v16]._uplinkHighFreq < a7
       || !issueBand[v16]._hasIssue)
  {
    if (++v16 == 28) {
      goto LABEL_9;
    }
  }
  +[WCM_Logging logLevel:5, @"need to apply rules for %s", off_10020F7A0[v16] message];
  unint64_t v20 = 0;
  int v37 = &issueBand[v16];
  do
  {
    unint64_t v21 = (char *)v37 + 8 * v20;
    unint64_t v22 = (void *)*((void *)v21 + 5);
    if (!v22) {
      break;
    }
    unsigned int v23 = [*((id *)v21 + 5) btDiversityBlocklistTypeFor:1];
    if ((v23 & 0xFFFFFFFD) == 1)
    {
      id v24 = &__NSArray0__struct;
      if (v23 != 1) {
        id v24 = [v22 btDiversityChannelsToAvoidForCellBTAntennaCombination:1 cellDlLowFreq:v8 cellDlHighFreq:a4 cellUlLowFreq:a5 cellUlHighFreq:a6 gpsRadioActive:a7];
      }
    }
    else
    {
      +[WCM_Logging logLevel:0, @"%@ featuere is enabled but platform configuration is not valid for this feature", @"BTUseC0B1AntennaConfig" message];
      id v24 = &__NSArray0__struct;
    }
    unsigned int v25 = (char *)[v24 count];
    if (v25)
    {
      id v26 = v25;
      id v27 = [[v24 objectAtIndex:0] intValue];
      id v28 = [[v24 objectAtIndex:v26 - 1] intValue];
      unsigned int v29 = [v22 issueType];
      double v30 = "<ISSUE_TYPE_INVALID>";
      if (v29 <= 0xE) {
        double v30 = off_10020F988[v29];
      }
      +[WCM_Logging logLevel:3, @"BT channels to avoid for %s: %d ~ %d (%lu channels)", v30, v27, v28, v26 message];
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v31 = [v24 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v31)
      {
        id v32 = v31;
        uint64_t v33 = *(void *)v39;
        while (2)
        {
          for (uint64_t i = 0; i != v32; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v39 != v33) {
              objc_enumerationMutation(v24);
            }
            id v35 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            if (([v15 containsObject:v35] & 1) == 0)
            {
              if ((int)([v15 count] - 80) >= -21)
              {
                +[WCM_Logging logLevel:message:](WCM_Logging, @"stop combining at channel %d with %lu total blocklist channels", [v35 intValue], objc_msgSend(v15, "count"));
                goto LABEL_9;
              }
              [v15 addObject:v35];
            }
          }
          id v32 = [v24 countByEnumeratingWithState:&v38 objects:v42 count:16];
          if (v32) {
            continue;
          }
          break;
        }
      }
    }
  }
  while (v20++ < 4);
LABEL_9:
  id v18 = sub_10001C8A4(v15);
  +[WCM_Logging logLevel:3, @"BT preferred channel map %@", v18 message];
  return v18;
}

- (BOOL)isNR79FoundForCellUlLowFreq:(double)a3 cellUlHighFreq:(double)a4
{
  return a4 < 5000.01 && a3 > 4399.99;
}

- (BOOL)isLTEB7FoundForCellDlLowFreq:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6
{
  BOOL v6 = a3 >= 2620.0;
  if (a4 > 2690.0) {
    BOOL v6 = 0;
  }
  if (a5 <= 2500.0) {
    BOOL v6 = 0;
  }
  return a6 < 2570.0 && v6;
}

- (void)getCellDynamicAntBlockingIndex:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 wifiChannel:(unsigned int)a8 pissueBandMatchAntIdx:(unsigned __int16 *)a9 cellAntBlkEnableIdx1:(char *)a10 cellAntBlkEnableIdx2:(char *)a11
{
  uint64_t v13 = *(void *)&a8;
  uint64_t v18 = *(void *)&a3;
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton", *(void *)&a3, *(void *)&a8, a9), "activeCoexFeatures"), "containsObject:", @"BB22_N79_DYNAMIC_ANTENNA_BLOCKING"))
  {
    +[WCM_Logging logLevel:4, @"YYDebug_ getCellDynamicAntBlockingIndex bandinfoType(0x%x) dlLowFreq = %lf, dlHighFreq = %lf, ulLowFreq = %lf, ulHighFreq = %lf, wifiChannel = %d", v18, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7, v13 message];
    unint64_t v20 = &self->_issueBand[28];
    uint64_t v21 = 100;
    while (1)
    {
      uint64_t v22 = v21 - 100;
      if ((v20[v21 - 100]._bandInfoType & v18) != 0
        && v20[v22]._downlinkLowFreq <= a4
        && v20[v22]._downlinkHighFreq >= a5
        && v20[v22]._uplinkLowFreq <= a6
        && v20[v22]._uplinkHighFreq >= a7
        && v20[v22]._hasIssue)
      {
        break;
      }
      if (++v21 == 117) {
        return;
      }
    }
    +[WCM_Logging logLevel:4 message:@"YYDebug_ getCellDynamicAntBlockingIndex issueBand5GHz found"];
    uint64_t v23 = 0;
    id v24 = &v20[v22];
    int v37 = a11;
    long long v38 = v24;
    do
    {
      unsigned int v25 = (char *)v24 + 8 * v23;
      id v26 = (void *)*((void *)v25 + 5);
      if (v26 && [*((id *)v25 + 5) issueType])
      {
        id v27 = [v26 issueType];
        [v26 cellFrequencyLimitForOOB];
        +[WCM_Logging logLevel:message:](WCM_Logging, @"YYDebug_ getCellDynamicAntBlockingIndex: coexIssue_5GHz.issueType is %d and the priority p = %d, cell cutoff frequency = %lf, wifi channels count = %lu, blockIndex (%d, %d)", v27, v23, v28, [objc_msgSend(objc_msgSend(v26, "wifiChannelsToApplyCellAntBlocking"), "count")], [v26 cellAntBlkEnableIdx], [v26 cellAntBlkEnableIdx2]);
        if ([v26 issueType] == 13)
        {
          [v26 cellFrequencyLimitForOOB];
          id v24 = v38;
          if (v29 < a7)
          {
            [v26 cellBandwidthLimitForOOB];
            if (a7 - a6 > v30)
            {
              long long v42 = 0u;
              long long v43 = 0u;
              long long v40 = 0u;
              long long v41 = 0u;
              obuint64_t j = [v26 wifiChannelsToApplyCellAntBlocking];
              id v31 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
              if (v31)
              {
                id v32 = v31;
                uint64_t v33 = *(void *)v41;
                while (2)
                {
                  for (uint64_t i = 0; i != v32; uint64_t i = (char *)i + 1)
                  {
                    if (*(void *)v41 != v33) {
                      objc_enumerationMutation(obj);
                    }
                    id v35 = *(void **)(*((void *)&v40 + 1) + 8 * i);
                    if ([v35 intValue] == v13)
                    {
                      [v26 cellFrequencyLimitForOOB];
                      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, @"YYDebug_ matched cutoff frequency %lf and channel %d ", v36, [v35 intValue]);
                      *a10 = [v26 cellAntBlkEnableIdx];
                      *int v37 = [v26 cellAntBlkEnableIdx2];
                      return;
                    }
                  }
                  id v32 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
                  id v24 = v38;
                  if (v32) {
                    continue;
                  }
                  break;
                }
              }
            }
          }
        }
        else
        {
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, @"getCellDynamicAntBlockingIndex has invalid _issueType(%d)", self, [v26 issueType]);
          id v24 = v38;
        }
      }
      ++v23;
    }
    while (v23 != 5);
  }
  else
  {
    +[WCM_Logging logLevel:0 message:@"ERROR: This should never happen. getCellDynamicAntBlockingIndex"];
  }
}

- (BOOL)coexBandCheckBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7
{
  +[WCM_Logging logLevel:5, @"NewCoexBandCheck-- Checking if the following cell freq match a row in policy table: bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf)", *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7 message];
  uint64_t v13 = 0;
  while ((self->_issueBand[v13]._bandInfoType & a3) == 0
       || self->_issueBand[v13]._downlinkLowFreq > a4
       || self->_issueBand[v13]._downlinkHighFreq < a5
       || self->_issueBand[v13]._uplinkLowFreq > a6
       || self->_issueBand[v13]._uplinkHighFreq < a7
       || !self->_issueBand[v13]._hasIssue)
  {
    if (++v13 == 28)
    {
      uint64_t v14 = 0;
      goto LABEL_10;
    }
  }
  uint64_t v14 = &self->_issueBand[v13];
LABEL_10:
  BOOL v15 = 1;
  unint64_t v16 = -1496;
  unint64_t v17 = 100;
  do
  {
    if ((*(int *)((unsigned char *)&self->_issueBand[45]._bandInfoType + v16) & a3) != 0
      && *(double *)((char *)&self->_issueBand[45]._downlinkLowFreq + v16) <= a4
      && *(double *)((char *)&self->_issueBand[45]._downlinkHighFreq + v16) >= a5
      && *(double *)((char *)&self->_issueBand[45]._uplinkLowFreq + v16) <= a6
      && *(double *)((char *)&self->_issueBand[45]._uplinkHighFreq + v16) >= a7
      && LOBYTE(self->_issueBand[45]._coexIssues[v16 / 8 + 5]))
    {
      break;
    }
    BOOL v18 = v17++ >= 0x74;
    BOOL v15 = !v18;
    v16 += 88;
  }
  while (v16);
  return v14 != 0 || v15;
}

- (WCM_WiFiCellCoexIssueBandTable)init
{
  v3.receiver = self;
  v3.super_class = (Class)WCM_WiFiCellCoexIssueBandTable;
  BOOL result = [(WCM_WiFiCellCoexIssueBandTable *)&v3 init];
  if (result)
  {
    result->_issueBand[0]._uint64_t bandInfoType = 24;
    *(_OWORD *)&result->_issueBand[0]._double downlinkLowFreq = xmmword_1001E8170;
    *(_OWORD *)&result->_issueBand[0]._double uplinkLowFreq = xmmword_1001E8180;
    result->_issueBand[0]._hasIssue = 0;
    result->_issueBand[1]._uint64_t bandInfoType = 63;
    *(_OWORD *)&result->_issueBand[1]._double downlinkLowFreq = xmmword_1001E8190;
    *(_OWORD *)&result->_issueBand[1]._double uplinkLowFreq = xmmword_1001E81A0;
    result->_issueBand[1]._hasIssue = 0;
    result->_issueBand[2]._uint64_t bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[2]._double downlinkLowFreq = xmmword_1001E81B0;
    *(_OWORD *)&result->_issueBand[2]._double uplinkLowFreq = xmmword_1001E81C0;
    result->_issueBand[2]._hasIssue = 0;
    result->_issueBand[3]._uint64_t bandInfoType = 35;
    result->_issueBand[3]._double downlinkLowFreq = 860.0;
    *(_OWORD *)&result->_issueBand[3]._double downlinkHighFreq = xmmword_1001E81D0;
    result->_issueBand[3]._uplinkHighFreq = 830.0;
    result->_issueBand[3]._hasIssue = 0;
    result->_issueBand[4]._uint64_t bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[4]._double downlinkLowFreq = xmmword_1001E81E0;
    *(_OWORD *)&result->_issueBand[4]._double uplinkLowFreq = xmmword_1001E81F0;
    result->_issueBand[4]._hasIssue = 0;
    result->_issueBand[5]._uint64_t bandInfoType = 35;
    result->_issueBand[5]._double downlinkLowFreq = 791.0;
    *(_OWORD *)&result->_issueBand[5]._double downlinkHighFreq = xmmword_1001E8200;
    result->_issueBand[5]._uplinkHighFreq = 862.0;
    result->_issueBand[5]._hasIssue = 0;
    result->_issueBand[6]._uint64_t bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[6]._double downlinkLowFreq = xmmword_1001E8210;
    *(_OWORD *)&result->_issueBand[6]._double uplinkLowFreq = xmmword_1001E8220;
    result->_issueBand[6]._hasIssue = 0;
    result->_issueBand[7]._uint64_t bandInfoType = 35;
    result->_issueBand[7]._double downlinkLowFreq = 852.0;
    *(_OWORD *)&result->_issueBand[7]._double downlinkHighFreq = xmmword_1001E8230;
    result->_issueBand[7]._uplinkHighFreq = 824.0;
    result->_issueBand[7]._hasIssue = 0;
    result->_issueBand[8]._uint64_t bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[8]._double downlinkLowFreq = xmmword_1001E8240;
    *(_OWORD *)&result->_issueBand[8]._double uplinkLowFreq = xmmword_1001E8250;
    result->_issueBand[8]._hasIssue = 0;
    result->_issueBand[9]._uint64_t bandInfoType = 35;
    result->_issueBand[9]._double downlinkLowFreq = 2350.0;
    *(_OWORD *)&result->_issueBand[9]._double downlinkHighFreq = xmmword_1001E8260;
    result->_issueBand[9]._uplinkHighFreq = 2315.0;
    result->_issueBand[9]._hasIssue = 0;
    result->_issueBand[10]._uint64_t bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[10]._double downlinkLowFreq = xmmword_1001E8270;
    *(_OWORD *)&result->_issueBand[10]._double uplinkLowFreq = xmmword_1001E8270;
    result->_issueBand[10]._hasIssue = 0;
    result->_issueBand[11]._uint64_t bandInfoType = 35;
    result->_issueBand[11]._double downlinkLowFreq = 2300.0;
    *(_OWORD *)&result->_issueBand[11]._double downlinkHighFreq = xmmword_1001E8280;
    result->_issueBand[11]._uplinkHighFreq = 2400.0;
    result->_issueBand[11]._hasIssue = 0;
    result->_issueBand[12]._uint64_t bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[12]._double downlinkLowFreq = xmmword_1001E8290;
    *(_OWORD *)&result->_issueBand[12]._double uplinkLowFreq = xmmword_1001E8290;
    result->_issueBand[12]._hasIssue = 0;
    result->_issueBand[13]._uint64_t bandInfoType = 64;
    result->_issueBand[13]._double downlinkLowFreq = 4400.0;
    *(_OWORD *)&result->_issueBand[13]._double downlinkHighFreq = xmmword_1001E82A0;
    result->_issueBand[13]._uplinkHighFreq = 5000.0;
    result->_issueBand[13]._hasIssue = 0;
    result->_issueBand[14]._uint64_t bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[14]._double downlinkLowFreq = xmmword_1001E82B0;
    *(_OWORD *)&result->_issueBand[14]._double uplinkLowFreq = xmmword_1001E82C0;
    result->_issueBand[14]._hasIssue = 0;
    result->_issueBand[15]._uint64_t bandInfoType = 35;
    result->_issueBand[15]._double downlinkLowFreq = 1880.0;
    *(_OWORD *)&result->_issueBand[15]._double downlinkHighFreq = xmmword_1001E82D0;
    result->_issueBand[15]._uplinkHighFreq = 1920.0;
    result->_issueBand[15]._hasIssue = 0;
    result->_issueBand[16]._uint64_t bandInfoType = 64;
    *(_OWORD *)&result->_issueBand[16]._double downlinkLowFreq = xmmword_1001E8290;
    *(_OWORD *)&result->_issueBand[16]._double uplinkLowFreq = xmmword_1001E8290;
    result->_issueBand[16]._hasIssue = 0;
    result->_issueBand[17]._uint64_t bandInfoType = 35;
    result->_issueBand[17]._double downlinkLowFreq = 1930.0;
    *(_OWORD *)&result->_issueBand[17]._double downlinkHighFreq = xmmword_1001E82E0;
    result->_issueBand[17]._uplinkHighFreq = 1915.0;
    result->_issueBand[17]._hasIssue = 0;
    result->_issueBand[21]._uint64_t bandInfoType = 35;
    result->_issueBand[21]._double downlinkLowFreq = 1930.0;
    *(_OWORD *)&result->_issueBand[21]._double downlinkHighFreq = xmmword_1001E82F0;
    result->_issueBand[21]._uplinkHighFreq = 1910.0;
    result->_issueBand[21]._hasIssue = 0;
    result->_issueBand[18]._uint64_t bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[18]._double downlinkLowFreq = xmmword_1001E8300;
    *(_OWORD *)&result->_issueBand[18]._double uplinkLowFreq = xmmword_1001E8310;
    result->_issueBand[18]._hasIssue = 0;
    result->_issueBand[19]._uint64_t bandInfoType = 35;
    result->_issueBand[19]._double downlinkLowFreq = 2110.0;
    *(_OWORD *)&result->_issueBand[19]._double downlinkHighFreq = xmmword_1001E8320;
    result->_issueBand[19]._uplinkHighFreq = 1755.0;
    result->_issueBand[19]._hasIssue = 0;
    result->_issueBand[20]._uint64_t bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[20]._double downlinkLowFreq = xmmword_1001E8330;
    *(_OWORD *)&result->_issueBand[20]._double uplinkLowFreq = xmmword_1001E8340;
    result->_issueBand[20]._hasIssue = 0;
    result->_issueBand[22]._uint64_t bandInfoType = 64;
    *(_OWORD *)&result->_issueBand[22]._double downlinkLowFreq = xmmword_1001E8350;
    *(_OWORD *)&result->_issueBand[22]._double uplinkLowFreq = xmmword_1001E8350;
    result->_issueBand[22]._hasIssue = 0;
    result->_issueBand[23]._uint64_t bandInfoType = 64;
    result->_issueBand[23]._double downlinkLowFreq = 860.0;
    *(_OWORD *)&result->_issueBand[23]._double downlinkHighFreq = xmmword_1001E81D0;
    result->_issueBand[23]._uplinkHighFreq = 830.0;
    result->_issueBand[23]._hasIssue = 0;
    result->_issueBand[24]._uint64_t bandInfoType = 64;
    result->_issueBand[24]._hasIssue = 0;
    *(_OWORD *)&result->_issueBand[24]._double uplinkLowFreq = 0u;
    *(_OWORD *)&result->_issueBand[24]._double downlinkLowFreq = 0u;
    result->_issueBand[25]._uint64_t bandInfoType = 64;
    result->_issueBand[25]._double downlinkLowFreq = 791.0;
    *(_OWORD *)&result->_issueBand[25]._double downlinkHighFreq = xmmword_1001E8200;
    result->_issueBand[25]._uplinkHighFreq = 862.0;
    result->_issueBand[25]._hasIssue = 0;
    result->_issueBand[26]._uint64_t bandInfoType = 64;
    *(_OWORD *)&result->_issueBand[26]._double downlinkLowFreq = xmmword_1001E8240;
    *(_OWORD *)&result->_issueBand[26]._double uplinkLowFreq = xmmword_1001E8250;
    result->_issueBand[26]._hasIssue = 0;
    result->_issueBand[27]._uint64_t bandInfoType = 64;
    result->_issueBand[27]._double downlinkLowFreq = 869.0;
    *(_OWORD *)&result->_issueBand[27]._double downlinkHighFreq = xmmword_1001E8360;
    result->_issueBand[27]._uplinkHighFreq = 849.0;
    result->_issueBand[27]._hasIssue = 0;
    result->_issueBand[28]._uint64_t bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[28]._double downlinkLowFreq = xmmword_1001E82B0;
    *(_OWORD *)&result->_issueBand[28]._double uplinkLowFreq = xmmword_1001E82C0;
    result->_issueBand[28]._hasIssue = 0;
    result->_issueBand[29]._uint64_t bandInfoType = 35;
    result->_issueBand[29]._double downlinkLowFreq = 1930.0;
    *(_OWORD *)&result->_issueBand[29]._double downlinkHighFreq = xmmword_1001E82E0;
    result->_issueBand[29]._uplinkHighFreq = 1915.0;
    result->_issueBand[29]._hasIssue = 0;
    result->_issueBand[30]._uint64_t bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[30]._double downlinkLowFreq = xmmword_1001E8300;
    *(_OWORD *)&result->_issueBand[30]._double uplinkLowFreq = xmmword_1001E8310;
    result->_issueBand[30]._hasIssue = 0;
    result->_issueBand[31]._uint64_t bandInfoType = 35;
    result->_issueBand[31]._double downlinkLowFreq = 2110.0;
    *(_OWORD *)&result->_issueBand[31]._double downlinkHighFreq = xmmword_1001E8320;
    result->_issueBand[31]._uplinkHighFreq = 1755.0;
    result->_issueBand[31]._hasIssue = 0;
    result->_issueBand[32]._uint64_t bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[32]._double downlinkLowFreq = xmmword_1001E8270;
    *(_OWORD *)&result->_issueBand[32]._double uplinkLowFreq = xmmword_1001E8270;
    result->_issueBand[32]._hasIssue = 0;
    result->_issueBand[33]._uint64_t bandInfoType = 35;
    result->_issueBand[33]._double downlinkLowFreq = 1880.0;
    *(_OWORD *)&result->_issueBand[33]._double downlinkHighFreq = xmmword_1001E82D0;
    result->_issueBand[33]._uplinkHighFreq = 1920.0;
    result->_issueBand[33]._hasIssue = 0;
    result->_issueBand[34]._uint64_t bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[34]._double downlinkLowFreq = xmmword_1001E8240;
    *(_OWORD *)&result->_issueBand[34]._double uplinkLowFreq = xmmword_1001E8250;
    result->_issueBand[34]._hasIssue = 0;
    result->_issueBand[35]._uint64_t bandInfoType = 35;
    result->_issueBand[35]._double downlinkLowFreq = 2496.0;
    *(_OWORD *)&result->_issueBand[35]._double downlinkHighFreq = xmmword_1001E8370;
    result->_issueBand[35]._uplinkHighFreq = 2690.0;
    result->_issueBand[35]._hasIssue = 0;
    result->_issueBand[36]._uint64_t bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[36]._double downlinkLowFreq = xmmword_1001E8380;
    *(_OWORD *)&result->_issueBand[36]._double uplinkLowFreq = xmmword_1001E8380;
    result->_issueBand[36]._hasIssue = 0;
    result->_issueBand[37]._uint64_t bandInfoType = 64;
    result->_issueBand[37]._double downlinkLowFreq = 4400.0;
    *(_OWORD *)&result->_issueBand[37]._double downlinkHighFreq = xmmword_1001E82A0;
    result->_issueBand[37]._uplinkHighFreq = 5000.0;
    result->_issueBand[37]._hasIssue = 0;
    result->_issueBand[38]._uint64_t bandInfoType = 64;
    *(_OWORD *)&result->_issueBand[38]._double downlinkLowFreq = xmmword_1001E8290;
    *(_OWORD *)&result->_issueBand[38]._double uplinkLowFreq = xmmword_1001E8290;
    result->_issueBand[38]._hasIssue = 0;
    result->_issueBand[39]._uint64_t bandInfoType = 35;
    result->_issueBand[39]._double downlinkLowFreq = 2110.0;
    *(_OWORD *)&result->_issueBand[39]._double downlinkHighFreq = xmmword_1001E8390;
    result->_issueBand[39]._uplinkHighFreq = 1780.0;
    result->_issueBand[39]._hasIssue = 0;
    result->_issueBand[40]._uint64_t bandInfoType = 64;
    *(_OWORD *)&result->_issueBand[40]._double downlinkLowFreq = xmmword_1001E83A0;
    *(_OWORD *)&result->_issueBand[40]._double uplinkLowFreq = xmmword_1001E83B0;
    result->_issueBand[40]._hasIssue = 0;
    result->_issueBand[41]._uint64_t bandInfoType = 64;
    result->_issueBand[41]._double downlinkLowFreq = 1805.0;
    *(_OWORD *)&result->_issueBand[41]._double downlinkHighFreq = xmmword_1001E83C0;
    result->_issueBand[41]._uplinkHighFreq = 1785.0;
    result->_issueBand[41]._hasIssue = 0;
    result->_issueBand[42]._uint64_t bandInfoType = 64;
    *(_OWORD *)&result->_issueBand[42]._double downlinkLowFreq = xmmword_1001E8330;
    *(_OWORD *)&result->_issueBand[42]._double uplinkLowFreq = xmmword_1001E8340;
    result->_issueBand[42]._hasIssue = 0;
    result->_issueBand[43]._uint64_t bandInfoType = 64;
    result->_issueBand[43]._double downlinkLowFreq = 2110.0;
    *(_OWORD *)&result->_issueBand[43]._double downlinkHighFreq = xmmword_1001E83D0;
    result->_issueBand[43]._uplinkHighFreq = 1980.0;
    result->_issueBand[43]._hasIssue = 0;
    result->_issueBand[44]._uint64_t bandInfoType = 64;
    *(_OWORD *)&result->_issueBand[44]._double downlinkLowFreq = xmmword_1001E83E0;
    *(_OWORD *)&result->_issueBand[44]._double uplinkLowFreq = xmmword_1001E83E0;
    result->_issueBand[44]._hasIssue = 0;
    result->_issueBand[45]._uint64_t bandInfoType = 35;
    result->_issueBand[45]._double downlinkLowFreq = 2350.0;
    *(_OWORD *)&result->_issueBand[45]._double downlinkHighFreq = xmmword_1001E8260;
    result->_issueBand[45]._uplinkHighFreq = 2315.0;
    result->_issueBand[45]._hasIssue = 0;
    result->_issueBand[46]._uint64_t bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[46]._double downlinkLowFreq = xmmword_1001E8350;
    *(_OWORD *)&result->_issueBand[46]._double uplinkLowFreq = xmmword_1001E8350;
    result->_issueBand[46]._hasIssue = 0;
    result->_issueBand[47]._uint64_t bandInfoType = 64;
    result->_issueBand[47]._double downlinkLowFreq = 4400.0;
    *(_OWORD *)&result->_issueBand[47]._double downlinkHighFreq = xmmword_1001E82A0;
    result->_issueBand[47]._uplinkHighFreq = 5000.0;
    result->_issueBand[47]._hasIssue = 0;
    result->_issueBand[48]._uint64_t bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[48]._double downlinkLowFreq = xmmword_1001E82B0;
    *(_OWORD *)&result->_issueBand[48]._double uplinkLowFreq = xmmword_1001E82C0;
    result->_issueBand[48]._hasIssue = 0;
    result->_issueBand[49]._uint64_t bandInfoType = 64;
    result->_issueBand[49]._double downlinkLowFreq = 2110.0;
    *(_OWORD *)&result->_issueBand[49]._double downlinkHighFreq = xmmword_1001E83D0;
    result->_issueBand[49]._uplinkHighFreq = 1980.0;
    result->_issueBand[49]._hasIssue = 0;
    result->_issueBand[50]._uint64_t bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[50]._double downlinkLowFreq = xmmword_1001E8380;
    *(_OWORD *)&result->_issueBand[50]._double uplinkLowFreq = xmmword_1001E8380;
    result->_issueBand[50]._hasIssue = 0;
    result->_issueBand[51]._uint64_t bandInfoType = 64;
    result->_issueBand[51]._hasIssue = 0;
    *(_OWORD *)&result->_issueBand[51]._double downlinkLowFreq = 0u;
    *(_OWORD *)&result->_issueBand[51]._double uplinkLowFreq = 0u;
    result->_issueBand[52]._uint64_t bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[52]._double downlinkLowFreq = xmmword_1001E83F0;
    *(_OWORD *)&result->_issueBand[52]._double uplinkLowFreq = xmmword_1001E83F0;
    result->_issueBand[52]._hasIssue = 0;
    result->_issueBand[53]._uint64_t bandInfoType = 64;
    result->_issueBand[53]._double downlinkLowFreq = 3300.0;
    *(_OWORD *)&result->_issueBand[53]._double downlinkHighFreq = xmmword_1001E8400;
    result->_issueBand[53]._uplinkHighFreq = 4200.0;
    result->_issueBand[53]._hasIssue = 0;
    result->_issueBand[54]._uint64_t bandInfoType = 64;
    *(_OWORD *)&result->_issueBand[54]._double downlinkLowFreq = xmmword_1001E83F0;
    *(_OWORD *)&result->_issueBand[54]._double uplinkLowFreq = xmmword_1001E83F0;
    result->_issueBand[54]._hasIssue = 0;
  }
  return result;
}

- (void)dealloc
{
  uint64_t v3 = 0;
  coexIssues = self->_issueBand[0]._coexIssues;
  do
  {
    for (uint64_t i = 0; i != 5; ++i)

    ++v3;
    coexIssues += 11;
  }
  while (v3 != 56);
  v6.receiver = self;
  v6.super_class = (Class)WCM_WiFiCellCoexIssueBandTable;
  [(WCM_WiFiCellCoexIssueBandTable *)&v6 dealloc];
}

- (id)coexIssuesFor:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = +[NSMutableArray array];
  if (v3 >= 0x1C)
  {
    int v7 = v3 - 100;
    if ((v3 - 100) >= 0x11)
    {
      int v7 = v3 - 200;
      if ((v3 - 200) >= 0xB)
      {
        +[WCM_Logging logLevel:0, @"band %d does not match any of the predefined ranges defined in WCM_WiFiCellCoexIssueBand enum. Thus can not configure internal table _issueBand (which is an array of WCM_WiFiCellCoexIssueBandTableEntry type)", v3 message];
        return v5;
      }
      uint64_t v6 = 3968;
    }
    else
    {
      uint64_t v6 = 2472;
    }
    LODWORD(v3) = v7;
  }
  else
  {
    uint64_t v6 = 8;
  }
  uint64_t v8 = 0;
  v9 = (char *)&self->_issueBand[v3]._uplinkHighFreq + v6;
  do
  {
    if (*(void *)&v9[v8]) {
      [v5 addObject:];
    }
    v8 += 8;
  }
  while (v8 != 40);
  return v5;
}

- (BOOL)configureBy:(id *)a3
{
  if (!a3)
  {
    id v26 = WCM_Logging;
    CFStringRef v27 = @"pConfigTable = NULL";
LABEL_60:
    -[__objc2_class logLevel:message:](v26, "logLevel:message:", 0, v27, v33, var23, v35);
    return 0;
  }
  uint64_t v3 = a3;
  unsigned int var0 = a3->var0;
  BOOL result = 1;
  if (a3->var0 <= 0xD2u)
  {
    uint64_t v7 = 0;
    issueBand = self->_issueBand;
    v9 = &self->_issueBand[45];
    v10 = &self->_issueBand[28];
    unsigned int v11 = WRM_MotionController;
    do
    {
      if (v3->var1 >= 0xFu)
      {
        [&v11[50] logLevel:0 message:@"pConfigTable[%d] has invalid _issueType(%d)", v7, v3->var1, v35];
        return 0;
      }
      if (v3->var3 > 0xFu || v3->var4 > 0xFu || v3->var5 > 0xFu || v3->var6 >= 0x10u)
      {
        [&v11[50] logLevel:0 message:@"pConfigTable[%d] has invalid antenna bitmaps", v7, var23, v35];
        return 0;
      }
      if (v3->var7 > 0xFu
        || v3->var8 > 0xFu
        || v3->var9 > 0xFu
        || v3->var10 > 0xFu
        || v3->var11 > 0xFu
        || v3->var12 > 0xFu
        || v3->var13 > 0xFu
        || v3->var14 > 0xFu
        || v3->var15 > 0xFu
        || v3->var16 > 0xFu
        || v3->var17 > 0xFu
        || v3->var18 > 0xFu
        || v3->var19 > 0xFu
        || v3->var20 > 0xFu
        || v3->var21 > 0xFu
        || v3->var22 >= 0x10u)
      {
        [&v11[50] logLevel:0 message:@"pConfigTable[%d] has invalid V2 antenna bitmaps", v7, var23, v35];
        return 0;
      }
      if (v3->var23 >= 0x1F)
      {
        id v26 = v11 + 50;
        uint64_t v33 = v7;
        unint64_t var23 = v3->var23;
        CFStringRef v27 = @"pConfigTable[%d] has invalid _cellTxPowerLimit(%llu)";
        goto LABEL_60;
      }
      int v37 = v9;
      long long v38 = issueBand;
      uint64_t v36 = v10;
      if (var0 > 0x1B)
      {
        if (var0 - 100 > 0x10)
        {
          v12 = v11;
          if (var0 < 0xC8)
          {
            [&v11[50] logLevel:0 message:@"pConfigTable->_issueBand does not match any of the predefined ranges defined in WCM_WiFiCellCoexIssueBand enum. Thus can not configure internal table _issueBand (which is an array of WCM_WiFiCellCoexIssueBandTableEntry type). pConfigTable->_issueBand is wrong with the Coex Table plist file at row pConfigTable[%d]", v7];
            uint64_t v13 = issueBand;
          }
          else
          {
            uint64_t v13 = &v9[var0 - 200];
          }
        }
        else
        {
          v12 = v11;
          uint64_t v13 = &v10[var0 - 100];
        }
      }
      else
      {
        v12 = v11;
        uint64_t v13 = &issueBand[var0];
      }
      uint64_t v14 = 0;
      v13->_hasIssue = 1;
      while (1)
      {
        BOOL v15 = v13->_coexIssues[v14];
        if (!v15) {
          break;
        }
        unsigned int v16 = [(WCM_WiFiCellCoexIssue *)v15 issueType];
        int var1 = v3->var1;
        if (v16 == var1 && (var1 & 0xFFFFFFFE) != 12)
        {
          [&v12[50] logLevel:0 message:@"There is a higher priority WCM_WiFiCellCoexIssue with the same issue type as pConfigTable[%d]", v7, var23, v35];
          return 0;
        }
        if (++v14 == 5)
        {
          [&v12[50] logLevel:0 message:@"There is no slot left for pConfigTable[%d]", v7, var23, v35];
          return 0;
        }
      }
      unint64_t v19 = [[WCM_WiFiCellCoexIssue alloc] initWithCoexIssueConfig:v3];
      if (!v19)
      {
        uint64_t v28 = v3->var0;
        if (v28 > 0xD2)
        {
          double v29 = "<ISSUE_BAND_INVALID: beyond the range>";
          goto LABEL_70;
        }
        if (v28 >= 0xC8)
        {
          double v30 = &off_10020F908[(v28 - 200)];
          goto LABEL_69;
        }
        if ((v28 - 100) <= 0x10)
        {
          double v30 = &off_10020F880[(v28 - 100)];
          goto LABEL_69;
        }
        if (v28 > 0x1B)
        {
          double v29 = "<ISSUE_BAND_INVALID: Negative number.>";
        }
        else
        {
          double v30 = &off_10020F7A0[v28];
LABEL_69:
          double v29 = *v30;
        }
LABEL_70:
        uint64_t v31 = v3->var1;
        if (v31 <= 0xE) {
          id v32 = off_10020F988[v31];
        }
        else {
          id v32 = "<ISSUE_TYPE_INVALID>";
        }
        [&v12[50] logLevel:1 message:@"\tskip invliad configuration pConfigTable[%d]: %s - %s", v7, v29, v32];
        return 0;
      }
      v13->_coexIssues[v14] = v19;
      uint64_t v20 = v3->var0;
      uint64_t v21 = "<ISSUE_BAND_INVALID: beyond the range>";
      unsigned int v11 = v12;
      if (v20 <= 0xD2)
      {
        if (v20 >= 0xC8)
        {
          uint64_t v22 = &off_10020F908[(v20 - 200)];
LABEL_50:
          uint64_t v21 = *v22;
          goto LABEL_51;
        }
        if ((v20 - 100) <= 0x10)
        {
          uint64_t v22 = &off_10020F880[(v20 - 100)];
          goto LABEL_50;
        }
        uint64_t v21 = "<ISSUE_BAND_INVALID: Negative number.>";
        if (v20 <= 0x1B)
        {
          uint64_t v22 = &off_10020F7A0[v20];
          goto LABEL_50;
        }
      }
LABEL_51:
      uint64_t v23 = v3->var1;
      id v24 = "<ISSUE_TYPE_INVALID>";
      if (v23 <= 0xE) {
        id v24 = off_10020F988[v23];
      }
      [&v12[50] logLevel:3 message:@"\tconfigure %s with %s at %s", v21, v24, off_10020F960[v14]];
      uint64_t v7 = (v7 + 1);
      unsigned int v25 = v3[1].var0;
      ++v3;
      unsigned int var0 = v25;
      BOOL result = 1;
      v9 = v37;
      issueBand = v38;
      v10 = v36;
    }
    while (v25 <= 0xD2);
  }
  return result;
}

- (id)findWiFiAntennaOrCellTxPowerConstraintCoexIssueByCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 wifiChannel:(int)a8 gpsRadioActive:(BOOL)a9 wifiAntennaConstraint:(BOOL *)a10 cellTxPowerConstraint:(BOOL *)a11
{
  BOOL v13 = a9;
  uint64_t v14 = *(void *)&a8;
  +[WCM_Logging logLevel:5, @"Try to find WiFi antenna or Cell Tx power constraints for bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf) wifiChannel(%d) gpsRadioActive(%d)", *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7, *(void *)&a8, a9 message];
  if ((v14 - 1) >= 0xD)
  {
    if ((int)v14 >= 174)
    {
      id v35 = +[WCM_PolicyManager singleton];
      uint64_t v36 = 999;
      uint64_t v37 = 999;
      uint64_t v38 = 0;
      uint64_t v39 = 0;
      goto LABEL_46;
    }
    unsigned int v56 = a10;
    unsigned int v57 = a11;
    unsigned int v22 = 116;
    unsigned int v21 = 100;
  }
  else
  {
    unsigned int v56 = a10;
    unsigned int v57 = a11;
    unsigned int v21 = 0;
    unsigned int v22 = 27;
  }
  id v23 = +[WRM_MetricsService getSingleton];
  id v24 = v23;
  if (v23) {
    [v23 initLTECoexMetrics];
  }
  unsigned int v25 = (char *)[v24 getLTECoexMetrics];
  id v26 = (unsigned int *)(v25 + 8);
  id v58 = v25;
  if (v25)
  {
    *(int32x2_t *)id v26 = vdup_n_s32(0x3E7u);
    *((_WORD *)v25 + 8) = 0;
  }
  if (v21 > v22)
  {
LABEL_28:
    CFStringRef v34 = @"No matching issue band found";
LABEL_42:
    +[WCM_Logging logLevel:3 message:v34];
    unsigned int v48 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") activeCoexFeatures] containsObject:@"AntSelStatsAWDStats"];
    id v44 = 0;
    if (!v58 || !v48) {
      return v44;
    }
    if (![[[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") activeCoexFeatures] containsObject:@"ANTSELSTATSAWDSTATSCAMigration"])return 0; {
    id v35 = +[WCM_PolicyManager singleton];
    }
    uint64_t v36 = *v26;
    uint64_t v37 = v26[1];
    uint64_t v38 = *((unsigned __int8 *)v26 + 8);
    uint64_t v39 = *((unsigned __int8 *)v26 + 9);
LABEL_46:
    [v35 wRMCACoexSubmit_AntSelPolicyStates:v36 IssueType:v37 IsCoexBand:v38 HasAntConstraint:v39];
    return 0;
  }
  id v55 = (unsigned int *)(v25 + 8);
  issueBand = self->_issueBand;
  uint64_t v28 = &self->_issueBand[28];
  unint64_t v29 = v21;
  uint64_t v30 = v22 + 1;
  uint64_t v31 = &issueBand[v21];
  while (1)
  {
    id v32 = v31;
    if (v29 >= 0x1C)
    {
      if (v29 < 0x64)
      {
        +[WCM_Logging logLevel:0 message:@"thisIssueBand does not match any of the predefined ranges defined in WCM_WiFiCellCoexIssueBand enum."];
        id v32 = issueBand;
      }
      else
      {
        id v32 = &v28[(v29 - 100)];
      }
    }
    if ((v32->_bandInfoType & a3) != 0
      && v32->_downlinkLowFreq <= a4
      && v32->_downlinkHighFreq >= a5
      && v32->_uplinkLowFreq <= a6
      && v32->_uplinkHighFreq >= a7)
    {
      if (v58 && v32->_hasIssue)
      {
        id v26 = v55;
        *id v55 = v29;
        *((unsigned char *)v55 + 8) = 1;
        LODWORD(v30) = v29;
        goto LABEL_26;
      }
      if (v32->_hasIssue) {
        break;
      }
    }
    ++v29;
    ++v31;
    if (v30 == v29)
    {
      id v32 = 0;
      goto LABEL_25;
    }
  }
  LODWORD(v30) = v29;
LABEL_25:
  id v26 = v55;
  if (!v32) {
    goto LABEL_28;
  }
LABEL_26:
  if (v30 > 0xD2)
  {
    uint64_t v33 = "<ISSUE_BAND_INVALID: beyond the range>";
    goto LABEL_36;
  }
  int v40 = v30 - 200;
  if (v30 >= 0xC8)
  {
    long long v41 = off_10020F908;
LABEL_34:
    long long v42 = (const char **)&v41[v40];
LABEL_35:
    uint64_t v33 = *v42;
    goto LABEL_36;
  }
  int v40 = v30 - 100;
  if ((v30 - 100) <= 0x10)
  {
    long long v41 = off_10020F880;
    goto LABEL_34;
  }
  if (v30 <= 0x1B)
  {
    long long v42 = (const char **)&off_10020F7A0[v30];
    goto LABEL_35;
  }
  uint64_t v33 = "<ISSUE_BAND_INVALID: Negative number.>";
LABEL_36:
  +[WCM_Logging logLevel:3, @"need to apply rules for %s", v33 message];
  uint64_t v43 = 0;
  while (1)
  {
    id v44 = v32->_coexIssues[v43];
    if (!v44)
    {
LABEL_41:
      CFStringRef v34 = @"No constraint required";
      goto LABEL_42;
    }
    unsigned int v45 = [(WCM_WiFiCellCoexIssue *)v32->_coexIssues[v43] needWiFiAntennaConstraintOnCellDlLowFreq:v14 cellDlHighFreq:v13 cellUlLowFreq:a4 cellUlHighFreq:a5 wifiChannel:a6 gpsRadioActive:a7];
    unsigned int v46 = [(WCM_WiFiCellCoexIssue *)v44 needCellTxPowerConstraintOnCellDlLowFreq:v14 cellDlHighFreq:v13 cellUlLowFreq:a4 cellUlHighFreq:a5 wifiChannel:a6 gpsRadioActive:a7];
    unsigned int v47 = v46;
    if ((v45 & 1) != 0 || v46) {
      break;
    }
    if (++v43 == 5) {
      goto LABEL_41;
    }
  }
  if (v45) {
    BOOL v50 = "WiFi antenna ";
  }
  else {
    BOOL v50 = "";
  }
  unsigned int v51 = [(WCM_WiFiCellCoexIssue *)v44 issueType];
  if (v51 <= 0xE) {
    uint64_t v52 = off_10020F988[v51];
  }
  else {
    uint64_t v52 = "<ISSUE_TYPE_INVALID>";
  }
  long long v53 = "Cell Tx power ";
  if (!v47) {
    long long v53 = "";
  }
  +[WCM_Logging logLevel:3, @"%s requires %s%sconstraint", v52, v50, v53 message];
  *unsigned int v56 = v45;
  *unsigned int v57 = v47;
  if (v58)
  {
    v26[1] = [(WCM_WiFiCellCoexIssue *)v44 issueType];
    *((unsigned char *)v26 + 9) = v45;
  }
  unsigned int v54 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") activeCoexFeatures] containsObject:@"AntSelStatsAWDStats"];
  if (v58
    && v54
    && objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"ANTSELSTATSAWDSTATSCAMigration"))
  {
    [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") wRMCACoexSubmit_AntSelPolicyStates:IssueType:IsCoexBand:HasAntConstraint:v26[1], *((unsigned __int8 *)v26 + 8), *((unsigned __int8 *)v26 + 9)];
  }
  return v44;
}

- (BOOL)isWifiRangingProtectionEnabledForOOBCoexIssueBand:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7
{
  uint64_t v7 = 0;
  while ((self->_issueBand[v7]._bandInfoType & a3) == 0
       || self->_issueBand[v7]._downlinkLowFreq > a4
       || self->_issueBand[v7]._downlinkHighFreq < a5
       || self->_issueBand[v7]._uplinkLowFreq > a6
       || self->_issueBand[v7]._uplinkHighFreq < a7
       || !self->_issueBand[v7]._hasIssue)
  {
    if (++v7 == 28)
    {
      +[WCM_Logging logLevel:3 message:@"No matching issue band found"];
      return 0;
    }
  }
  coexIssues = (id *)self->_issueBand[v7]._coexIssues;
  uint64_t v10 = 5;
  while (1)
  {
    id v11 = *coexIssues;
    if (!*coexIssues) {
      break;
    }
    if (([*coexIssues issueType] & 0xFFFFFFFE) == 0xC
      && [v11 enableWifiChannelAvoidance]
      && ([v11 issueType] == 12 || objc_msgSend(v11, "issueType") == 13))
    {
      return 1;
    }
    BOOL result = 0;
    ++coexIssues;
    if (!--v10) {
      return result;
    }
  }
  return 0;
}

- (id)wifiChannelsToEnableWCI2ForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7
{
  +[WCM_Logging logLevel:5, @"Try to get WiFi channels to enable WCI2 on bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf)", *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7 message];
  uint64_t v13 = 0;
  for (uint64_t i = self->_issueBand[0]._coexIssues;
        (*(_DWORD *)(i - 5) & a3) == 0
     || *((double *)i - 4) > a4
     || *((double *)i - 3) < a5
     || *((double *)i - 2) > a6
     || *((double *)i - 1) < a7
     || !*((unsigned char *)i + 40);
        i += 11)
  {
    if (++v13 == 28)
    {
      +[WCM_Logging logLevel:3 message:@"No matching issue band found"];
      return &off_10024E068;
    }
  }
  +[WCM_Logging logLevel:3, @"need to apply rules for %s", off_10020F7A0[v13] message];
  id v15 = +[NSMutableArray array];
  for (uint64_t j = 0; j != 5; ++j)
  {
    BOOL v18 = i[j];
    if (!v18) {
      break;
    }
    id v19 = [(WCM_WiFiCellCoexIssue *)i[j] wifiChannelsAffectedByCellUlLowFreq:0 cellUlHighFreq:a6 wifi5G:a7];
    if ([v19 count])
    {
      unsigned int v20 = [(WCM_WiFiCellCoexIssue *)v18 issueType];
      unsigned int v21 = "<ISSUE_TYPE_INVALID>";
      if (v20 <= 0xE) {
        unsigned int v21 = off_10020F988[v20];
      }
      +[WCM_Logging logLevel:3, @"WiFi channels for %s %@", v21, v19 message];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v22 = [v19 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v28;
        do
        {
          for (uint64_t k = 0; k != v23; uint64_t k = (char *)k + 1)
          {
            if (*(void *)v28 != v24) {
              objc_enumerationMutation(v19);
            }
            uint64_t v26 = *(void *)(*((void *)&v27 + 1) + 8 * (void)k);
            if (([v15 containsObject:v26] & 1) == 0) {
              [v15 addObject:v26];
            }
          }
          id v23 = [v19 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v23);
      }
    }
  }
  [v15 sortUsingComparator:&stru_10020F658];
  if (![v15 count]) {
    [v15 addObject:&off_10023CB10];
  }
  +[WCM_Logging logLevel:3, @"WiFi channels to enable WCI2 %@", v15 message];
  return v15;
}

- (id)wifiChannelsToEnableWCI2V2ForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 pissueBandMatch:(BOOL *)a8
{
  uint64_t v13 = *(void *)&a3;
  +[WCM_Logging logLevel:5, @"WCI2_V2: Try to get WiFi channels to enable WCI2 on bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf)", *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7 message];
  id v15 = +[NSMutableArray array];
  uint64_t v16 = 0;
  while (1)
  {
    uint64_t bandInfoType = self->_issueBand[v16]._bandInfoType;
    if ((bandInfoType & v13) != 0)
    {
      double downlinkLowFreq = self->_issueBand[v16]._downlinkLowFreq;
      if (downlinkLowFreq <= a4)
      {
        double downlinkHighFreq = self->_issueBand[v16]._downlinkHighFreq;
        if (downlinkHighFreq >= a5)
        {
          double uplinkLowFreq = self->_issueBand[v16]._uplinkLowFreq;
          if (uplinkLowFreq <= a6 && self->_issueBand[v16]._uplinkHighFreq >= a7 && self->_issueBand[v16]._hasIssue) {
            break;
          }
        }
      }
    }
    if (++v16 == 28)
    {
      unint64_t v21 = 0;
      goto LABEL_10;
    }
  }
  +[WCM_Logging logLevel:4, @"V2BtimapDebug_: pIssueBandMatched: pIssueBand->_bandInfoType(%d) & bandInfoType(%d) && pIssueBand->_downlinkLowFreq(%lf) <= cellDlLowFreq(%lf) && pIssueBand->_downlinkHighFreq(%lf) >= cellDlHighFreq(%lf) && pIssueBand->_uplinkLowFreq(%lf) <= cellUlLowFreq(%lf) && pIssueBand->_uplinkHighFreq(%lf) >= cellUlHighFreq(%lf)", bandInfoType, v13, *(void *)&downlinkLowFreq, *(void *)&a4, *(void *)&downlinkHighFreq, *(void *)&a5, *(void *)&uplinkLowFreq, *(void *)&a6, *(void *)&self->_issueBand[v16]._uplinkHighFreq, *(void *)&a7 message];
  unint64_t v21 = (unint64_t)&self->_issueBand[v16];
LABEL_10:
  uint64_t v22 = -1496;
  BOOL v50 = a8;
  while (1)
  {
    uint64_t v23 = *(unsigned int *)((char *)&self->_issueBand[45]._bandInfoType + v22);
    if ((v23 & v13) != 0)
    {
      double v24 = *(double *)((char *)&self->_issueBand[45]._downlinkLowFreq + v22);
      if (v24 <= a4)
      {
        double v25 = *(double *)((char *)&self->_issueBand[45]._downlinkHighFreq + v22);
        if (v25 >= a5)
        {
          double v26 = *(double *)((char *)&self->_issueBand[45]._uplinkLowFreq + v22);
          if (v26 <= a6
            && *(double *)((char *)&self->_issueBand[45]._uplinkHighFreq + v22) >= a7
            && *((unsigned char *)&self->_issueBand[45]._coexIssues[5] + v22))
          {
            break;
          }
        }
      }
    }
    v22 += 88;
    if (!v22)
    {
      if (!v21) {
        goto LABEL_34;
      }
      goto LABEL_19;
    }
  }
  +[WCM_Logging logLevel:4, @"V2BtimapDebug_: pIssueBandMatched_5GHz: pIssueBand_5GHz->_bandInfoType(%d) & bandInfoType(%d) && pIssueBand_5GHz->_downlinkLowFreq(%lf) <= cellDlLowFreq(%lf) && pIssueBand_5GHz->_downlinkHighFreq(%lf) >= cellDlHighFreq(%lf) && pIssueBand_5GHz->_uplinkLowFreq(%lf) <= cellUlLowFreq(%lf) && pIssueBand_5GHz->_uplinkHighFreq(%lf) >= cellUlHighFreq(%lf)", v23, v13, *(void *)&v24, *(void *)&a4, *(void *)&v25, *(void *)&a5, *(void *)&v26, *(void *)&a6, *(void *)((char *)&self->_issueBand[45]._uplinkHighFreq + v22), *(void *)&a7 message];
  v22 += (uint64_t)&self->_issueBand[45];
  if (!v21) {
    goto LABEL_34;
  }
LABEL_19:
  +[WCM_Logging logLevel:4 message:@"WCI2_V2: Matching issue band (in terms of cellular frequency match) found on 2.4GHz WiFi Band."];
  for (uint64_t i = 0; i != 5; ++i)
  {
    long long v28 = *(WCM_WiFiCellCoexIssue **)(v21 + 8 * i + 40);
    if (v28)
    {
      +[WCM_Logging logLevel:4, @"V2BtimapDebug_: coexIssue.issueType is %d and the priority p = %d", [(WCM_WiFiCellCoexIssue *)v28 issueType], i message];
      id v29 = [(WCM_WiFiCellCoexIssue *)v28 wifiChannelsAffectedByCellUlLowFreq:0 cellUlHighFreq:a6 wifi5G:a7];
      if ([v29 count])
      {
        unsigned int v30 = [(WCM_WiFiCellCoexIssue *)v28 issueType];
        uint64_t v31 = "<ISSUE_TYPE_INVALID>";
        if (v30 <= 0xE) {
          uint64_t v31 = off_10020F988[v30];
        }
        +[WCM_Logging logLevel:3, @"WCI2_V2: WiFi channels for %s %@", v31, v29 message];
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id v32 = [v29 countByEnumeratingWithState:&v55 objects:v60 count:16];
        if (v32)
        {
          id v33 = v32;
          uint64_t v34 = *(void *)v56;
          do
          {
            for (uint64_t j = 0; j != v33; uint64_t j = (char *)j + 1)
            {
              if (*(void *)v56 != v34) {
                objc_enumerationMutation(v29);
              }
              uint64_t v36 = *(void *)(*((void *)&v55 + 1) + 8 * (void)j);
              if (([v15 containsObject:v36] & 1) == 0) {
                [v15 addObject:v36];
              }
            }
            id v33 = [v29 countByEnumeratingWithState:&v55 objects:v60 count:16];
          }
          while (v33);
        }
      }
    }
  }
LABEL_34:
  if (v22)
  {
    +[WCM_Logging logLevel:4 message:@"WCI2_V2: Matching issue band (in terms of cellular frequency match) found on (FV)GHz WiFi Band."];
    for (uint64_t k = 0; k != 5; ++k)
    {
      uint64_t v38 = *(void **)(v22 + 8 * k + 40);
      if (v38)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, @"V2BtimapDebug_: coexIssue_5GHz.issueType is %d and the priority p = %d", [v38 issueType], k);
        id v39 = [v38 wifiChannelsAffectedByCellUlLowFreq:1 cellUlHighFreq:a6 wifi5G:a7];
        if ([v39 count])
        {
          unsigned int v40 = [v38 issueType];
          long long v41 = "<ISSUE_TYPE_INVALID>";
          if (v40 <= 0xE) {
            long long v41 = off_10020F988[v40];
          }
          +[WCM_Logging logLevel:3, @"WCI2_V2: WiFi channels for %s %@", v41, v39 message];
          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          id v42 = [v39 countByEnumeratingWithState:&v51 objects:v59 count:16];
          if (v42)
          {
            id v43 = v42;
            uint64_t v44 = *(void *)v52;
            do
            {
              for (m = 0; m != v43; m = (char *)m + 1)
              {
                if (*(void *)v52 != v44) {
                  objc_enumerationMutation(v39);
                }
                uint64_t v46 = *(void *)(*((void *)&v51 + 1) + 8 * (void)m);
                if ([&off_10024E080 containsObject:v46]
                  && ([v15 containsObject:v46] & 1) == 0)
                {
                  [v15 addObject:v46];
                }
              }
              id v43 = [v39 countByEnumeratingWithState:&v51 objects:v59 count:16];
            }
            while (v43);
          }
        }
      }
    }
  }
  if (v21 | v22)
  {
    [v15 sortUsingComparator:&stru_10020F678];
    char v47 = 1;
    unsigned int v48 = v50;
  }
  else
  {
    unsigned int v48 = v50;
    if (![v15 count]) {
      [v15 addObject:&off_10023CB10];
    }
    char v47 = 0;
  }
  unsigned char *v48 = v47;
  +[WCM_Logging logLevel:3, @"WiFi channels to enable WCI2_V2 %@", v15 message];
  return v15;
}

- (id)wifiChannelsToDisableOCLForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7
{
  +[WCM_Logging logLevel:3, @"Try to get WiFi channels to disable OCL on bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf)", *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7 message];
  id v13 = +[NSMutableArray array];
  uint64_t v14 = 0;
  coexIssues = self->_issueBand[0]._coexIssues;
  while ((*(_DWORD *)(coexIssues - 5) & a3) == 0
       || *((double *)coexIssues - 4) > a4
       || *((double *)coexIssues - 3) < a5
       || *((double *)coexIssues - 2) > a6
       || *((double *)coexIssues - 1) < a7
       || !*((unsigned char *)coexIssues + 40))
  {
    ++v14;
    coexIssues += 11;
    if (v14 == 28) {
      goto LABEL_9;
    }
  }
  +[WCM_Logging logLevel:3, @"need to apply rules for %s", off_10020F7A0[v14] message];
  for (uint64_t i = 0; i != 5; ++i)
  {
    unint64_t v21 = coexIssues[i];
    if (!v21) {
      break;
    }
    if ([WCM_PolicyManager singleton].activeCoexFeatures.containsObject(@"OclPlistInput"))id v22 = -[WCM_WiFiCellCoexIssue wifiOclChannelsAffectedByCellUlLowFreq:cellUlHighFreq:isWifi5G:](v21, @"wifiOclChannelsAffectedByCellUlLowFreq:cellUlHighFreq:isWifi5G:", 0, a6, a7); {
    else
    }
      id v22 = [(WCM_WiFiCellCoexIssue *)v21 wifiChannelsAffectedByCellUlLowFreq:0 cellUlHighFreq:a6 wifi5G:a7];
    uint64_t v23 = v22;
    if ([v22 count])
    {
      unsigned int v24 = [(WCM_WiFiCellCoexIssue *)v21 issueType];
      double v25 = "<ISSUE_TYPE_INVALID>";
      if (v24 <= 0xE) {
        double v25 = off_10020F988[v24];
      }
      +[WCM_Logging logLevel:3, @"WiFi channels for %s %@", v25, v23 message];
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v26 = [v23 countByEnumeratingWithState:&v47 objects:v52 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v48;
        do
        {
          for (uint64_t j = 0; j != v27; uint64_t j = (char *)j + 1)
          {
            if (*(void *)v48 != v28) {
              objc_enumerationMutation(v23);
            }
            uint64_t v30 = *(void *)(*((void *)&v47 + 1) + 8 * (void)j);
            if (([v13 containsObject:v30] & 1) == 0) {
              [v13 addObject:v30];
            }
          }
          id v27 = [v23 countByEnumeratingWithState:&v47 objects:v52 count:16];
        }
        while (v27);
      }
    }
  }
LABEL_9:
  uint64_t v16 = 0;
  unint64_t v17 = &stru_10020FAC0;
  p_signature = (const char **)off_10020F880;
  while ((self->_issueBand[28]._bandInfoType & a3) == 0
       || self->_issueBand[28]._downlinkLowFreq > a4
       || self->_issueBand[28]._downlinkHighFreq < a5
       || self->_issueBand[28]._uplinkLowFreq > a6
       || self->_issueBand[28]._uplinkHighFreq < a7
       || !self->_issueBand[28]._hasIssue)
  {
    unint64_t v17 = (Block_descriptor_3 *)((char *)v17 + 8);
    ++v16;
    ++p_signature;
    self = (WCM_WiFiCellCoexIssueBandTable *)((char *)self + 88);
    if (v16 == 17) {
      goto LABEL_17;
    }
  }
  if (v16 >= 0x11 && (p_signature = &v17->signature, (v16 + 100) > 0x1B)) {
    uint64_t v31 = "<ISSUE_BAND_INVALID: Negative number.>";
  }
  else {
    uint64_t v31 = *p_signature;
  }
  +[WCM_Logging logLevel:3, @"need to apply rules for %s", v31 message];
  for (uint64_t k = 0; k != 5; ++k)
  {
    id v33 = self->_issueBand[28]._coexIssues[k];
    if (!v33) {
      break;
    }
    if ([+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") activeCoexFeatures].containsObject(@"OclPlistInput"))id v34 = [-[WCM_WiFiCellCoexIssue wifiOclChannelsAffectedByCellUlLowFreq:cellUlHighFreq:isWifi5G:](v33, "wifiOclChannelsAffectedByCellUlLowFreq:cellUlHighFreq:isWifi5G:", 1, a6, a7); {
    else
    }
      id v34 = [(WCM_WiFiCellCoexIssue *)v33 wifiChannelsAffectedByCellUlLowFreq:1 cellUlHighFreq:a6 wifi5G:a7];
    id v35 = v34;
    if ([v34 count])
    {
      unsigned int v36 = [(WCM_WiFiCellCoexIssue *)v33 issueType];
      uint64_t v37 = "<ISSUE_TYPE_INVALID>";
      if (v36 <= 0xE) {
        uint64_t v37 = off_10020F988[v36];
      }
      +[WCM_Logging logLevel:3, @"WiFi channels for %s %@", v37, v35 message];
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v38 = [v35 countByEnumeratingWithState:&v43 objects:v51 count:16];
      if (v38)
      {
        id v39 = v38;
        uint64_t v40 = *(void *)v44;
        do
        {
          for (m = 0; m != v39; m = (char *)m + 1)
          {
            if (*(void *)v44 != v40) {
              objc_enumerationMutation(v35);
            }
            uint64_t v42 = *(void *)(*((void *)&v43 + 1) + 8 * (void)m);
            if (([v13 containsObject:v42] & 1) == 0) {
              [v13 addObject:v42];
            }
          }
          id v39 = [v35 countByEnumeratingWithState:&v43 objects:v51 count:16];
        }
        while (v39);
      }
    }
  }
LABEL_17:
  +[WCM_Logging logLevel:3, @"WiFi channels to disble OCL %@", v13 message];
  return v13;
}

- (id)GetHFBTBandBlockedChannelMapWithCellUlHighFreq:(double)a3 cellUlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellDlLowFreq:(double)a6 gpsRadioActive:(BOOL)a7 coexIssues:(id)a8 btBandLowFreq:(double)a9 btBandHighFreq:(double)a10 btNumChannel:(int)a11
{
  uint64_t v11 = *(void *)&a11;
  BOOL v15 = a7;
  unsigned int v20 = +[NSArray array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v21 = [a8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v27;
    do
    {
      unsigned int v24 = 0;
      do
      {
        if (*(void *)v27 != v23) {
          objc_enumerationMutation(a8);
        }
        unsigned int v20 = -[NSArray arrayByAddingObjectsFromArray:](v20, "arrayByAddingObjectsFromArray:", [*(id *)(*((void *)&v26 + 1) + 8 * (void)v24) HFBTChannelsToAvoidForCellUlLowFreq:v15 cellUlHighFreq:a4 cellDlLowFreq:a3 cellDlHighFreq:a6 btBandLowFreq:a5 btBandHighFreq:a9 gpsRadioActive:a10]);
        unsigned int v24 = (char *)v24 + 1;
      }
      while (v22 != v24);
      id v22 = [a8 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v22);
  }
  return sub_10001CF40([(NSArray *)[+[NSSet setWithArray:v20] allObjects] sortedArrayUsingComparator:&stru_10020F758], v11);
}

- (id)btPreferredChannelMapFromLegacyWiFiConfigForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 gpsRadioActive:(BOOL)a8 maxChannelsToAvoidForCellOOB:(int)a9
{
  uint64_t v9 = *(void *)&a9;
  BOOL v10 = a8;
  +[WCM_Logging logLevel:3, @"Try to get BT preferred channel map on bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf) gpsRadioActive(%d) maxChannelsToAvoidForCellOOB(%d)", *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7, a8, *(void *)&a9 message];
  id v17 = +[NSMutableArray array];
  uint64_t v18 = 0;
  issueBand = self->_issueBand;
  while ((issueBand[v18]._bandInfoType & a3) == 0
       || issueBand[v18]._downlinkLowFreq > a4
       || issueBand[v18]._downlinkHighFreq < a5
       || issueBand[v18]._uplinkLowFreq > a6
       || issueBand[v18]._uplinkHighFreq < a7
       || !issueBand[v18]._hasIssue)
  {
    if (++v18 == 28) {
      goto LABEL_9;
    }
  }
  +[WCM_Logging logLevel:3, @"need to apply rules for %s", off_10020F7A0[v18] message];
  unint64_t v22 = 0;
  id v38 = &issueBand[v18];
  unint64_t v23 = (int)v9;
  do
  {
    unsigned int v24 = v38->_coexIssues[v22];
    if (!v24) {
      break;
    }
    unint64_t v39 = v22;
    if ([(WCM_WiFiCellCoexIssue *)v24 enableWifiChannelAvoidance]
      || [(WCM_WiFiCellCoexIssue *)v24 wifiUlAntennaBitmapOnCellLAT]
      || [(WCM_WiFiCellCoexIssue *)v24 wifiUlAntennaBitmapOnCellUAT])
    {
      id v25 = [(WCM_WiFiCellCoexIssue *)v24 btChannelsToAvoidForCellUlLowFreq:v10 cellUlHighFreq:a6 gpsRadioActive:a7];
      long long v26 = (char *)[v25 count];
      unsigned int v27 = [(WCM_WiFiCellCoexIssue *)v24 issueType];
      if (v9)
      {
        if ((v27 & 0xFFFFFFFE) == 0xC && (unint64_t)v26 > v23)
        {
          +[WCM_Logging logLevel:3, @"limit OOB affected channels from %lu to %d channels", v26, v9 message];
          id v25 = [v25 subarrayWithRange:0, v23];
          long long v26 = (char *)v23;
        }
      }
      if (v26)
      {
        id v29 = [[v25 objectAtIndex:0] intValue];
        id v30 = [[v25 objectAtIndex:v26 - 1] intValue];
        unsigned int v31 = [(WCM_WiFiCellCoexIssue *)v24 issueType];
        id v32 = "<ISSUE_TYPE_INVALID>";
        if (v31 <= 0xE) {
          id v32 = off_10020F988[v31];
        }
        +[WCM_Logging logLevel:3, @"BT channels to avoid for %s: %d ~ %d (%lu channels)", v32, v29, v30, v26 message];
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v33 = [v25 countByEnumeratingWithState:&v40 objects:v44 count:16];
        unint64_t v23 = (int)v9;
        if (v33)
        {
          id v34 = v33;
          uint64_t v35 = *(void *)v41;
          while (2)
          {
            for (uint64_t i = 0; i != v34; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v41 != v35) {
                objc_enumerationMutation(v25);
              }
              uint64_t v37 = *(void **)(*((void *)&v40 + 1) + 8 * i);
              if (([v17 containsObject:v37] & 1) == 0)
              {
                if ((int)([v17 count] - 80) >= -21)
                {
                  +[WCM_Logging logLevel:message:](WCM_Logging, @"stop combining at channel %d with %lu total blocklist channels", [v37 intValue], objc_msgSend(v17, "count"));
                  goto LABEL_9;
                }
                [v17 addObject:v37];
              }
            }
            id v34 = [v25 countByEnumeratingWithState:&v40 objects:v44 count:16];
            if (v34) {
              continue;
            }
            break;
          }
        }
      }
    }
    unint64_t v22 = v39 + 1;
  }
  while (v39 < 4);
LABEL_9:
  unsigned int v20 = sub_10001C8A4(v17);
  +[WCM_Logging logLevel:3, @"BT preferred channel map %@", v20 message];
  return v20;
}

- (id)btDiversityChannelMapForCellBTAntennaCombination:(int)a3 cellBandInfoType:(int)a4 cellDlLowFreq:(double)a5 cellDlHighFreq:(double)a6 cellUlLowFreq:(double)a7 cellUlHighFreq:(double)a8 gpsRadioActive:(BOOL)a9
{
  BOOL v9 = a9;
  uint64_t v15 = *(void *)&a3;
  if (a3 <= 3) {
    id v17 = off_10020FA00[a3];
  }
  else {
    id v17 = "<ANTENNA_COMBINATION_INVALID>";
  }
  +[WCM_Logging logLevel:3, @"Try to get BT diversity channel map for %s on bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf) gpsRadioActive(%d)", v17, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7, *(void *)&a8, a9 message];
  id v18 = +[NSMutableArray array];
  uint64_t v19 = 0;
  issueBand = self->_issueBand;
  while ((issueBand[v19]._bandInfoType & a4) == 0
       || issueBand[v19]._downlinkLowFreq > a5
       || issueBand[v19]._downlinkHighFreq < a6
       || issueBand[v19]._uplinkLowFreq > a7
       || issueBand[v19]._uplinkHighFreq < a8
       || !issueBand[v19]._hasIssue)
  {
    if (++v19 == 28) {
      goto LABEL_12;
    }
  }
  +[WCM_Logging logLevel:3, @"need to apply rules for %s", off_10020F7A0[v19] message];
  unint64_t v23 = 0;
  long long v43 = &issueBand[v19];
  do
  {
    unsigned int v24 = (char *)v43 + 8 * v23;
    id v25 = (void *)*((void *)v24 + 5);
    if (!v25) {
      break;
    }
    unsigned int v26 = [*((id *)v24 + 5) btDiversityBlocklistTypeFor:v15];
    if (v26 - 4 > 0xFFFFFFFC)
    {
      id v27 = &__NSArray0__struct;
      if (v26 != 1)
      {
        if (v26 == 2)
        {
          unsigned int v40 = [v25 issueType];
          if (v40 <= 0xE) {
            long long v41 = off_10020F988[v40];
          }
          else {
            long long v41 = "<ISSUE_TYPE_INVALID>";
          }
          +[WCM_Logging logLevel:3, @"Just avoid all BT channels for %s on antennaCombinationCxBx(%d)", v41, v15 message];
          long long v42 = sub_10009560C(0, 0x4Eu);
          return sub_10001C8A4(v42);
        }
        id v27 = [v25 btDiversityChannelsToAvoidForCellBTAntennaCombination:v15 cellDlLowFreq:v9 cellDlHighFreq:a5 cellUlLowFreq:a6 cellUlHighFreq:a7 gpsRadioActive:a8];
      }
    }
    else
    {
      +[WCM_Logging logLevel:0, @"%@ featuere is enabled but platform configuration is not valid for this feature", @"BTDiversityAFHMap" message];
      id v27 = &__NSArray0__struct;
    }
    long long v28 = (char *)[v27 count];
    if (v28)
    {
      id v29 = v28;
      id v30 = [[v27 objectAtIndex:0] intValue];
      id v31 = [[v27 objectAtIndex:v29 - 1] intValue];
      unsigned int v32 = [v25 issueType];
      id v33 = "<ISSUE_TYPE_INVALID>";
      if (v32 <= 0xE) {
        id v33 = off_10020F988[v32];
      }
      +[WCM_Logging logLevel:3, @"BT channels to avoid for %s: %d ~ %d (%lu channels)", v33, v30, v31, v29 message];
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v34 = [v27 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v34)
      {
        id v35 = v34;
        uint64_t v36 = *(void *)v45;
        while (2)
        {
          for (uint64_t i = 0; i != v35; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v45 != v36) {
              objc_enumerationMutation(v27);
            }
            id v38 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            if (([v18 containsObject:v38] & 1) == 0)
            {
              if ((int)sub_10008CEF8(v18, 1) <= 20)
              {
                +[WCM_Logging logLevel:message:](WCM_Logging, @"stop combining at channel %d with %lu total blocklist channels", [v38 intValue], objc_msgSend(v18, "count"));
                goto LABEL_12;
              }
              [v18 addObject:v38];
            }
          }
          id v35 = [v27 countByEnumeratingWithState:&v44 objects:v48 count:16];
          if (v35) {
            continue;
          }
          break;
        }
      }
    }
  }
  while (v23++ < 4);
LABEL_12:
  id v21 = sub_10001C8A4(v18);
  +[WCM_Logging logLevel:3, @"BT diversity channel map %@", v21 message];
  return v21;
}

- (BOOL)wifiBtAgcCoexModeEnableCheckBandCombinationV2:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 wifiChannel:(unsigned int)a8 channelCenterFreqMHz:(unsigned int)a9 channelBandwidthMHz:(unsigned int)a10 coexModeWifiLevel:(int64_t *)a11 coexModeBTLevel:(int64_t *)a12
{
  int64_t v61 = 0;
  int64_t v62 = 0;
  uint64_t v58 = *(void *)&a8;
  +[WCM_Logging logLevel:5, @"DLDebug_ Check if band is eligible for AgcCoexMode on bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf) wifiChannel(%d)", *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7, *(void *)&a8 message];
  unsigned int v19 = a9 - 2400;
  unsigned int v20 = a9 - 5170;
  uint64_t v21 = 100;
  unsigned int v59 = a9;
  uint64_t v22 = 200;
  if (a9 - 5925 >= 0x4B1) {
    uint64_t v22 = 0;
  }
  uint64_t v23 = 27;
  if (a9 - 5925 < 0x4B1) {
    uint64_t v23 = 210;
  }
  BOOL v24 = v20 >= 0x29A;
  if (v20 >= 0x29A) {
    uint64_t v25 = v23;
  }
  else {
    uint64_t v25 = 116;
  }
  if (v24) {
    uint64_t v21 = v22;
  }
  BOOL v26 = v19 >= 0x65;
  if (v19 >= 0x65) {
    uint64_t v27 = v25;
  }
  else {
    uint64_t v27 = 27;
  }
  if (v26) {
    unint64_t v28 = v21;
  }
  else {
    unint64_t v28 = 0;
  }
  uint64_t v29 = v27 + 1;
  id v30 = &self->_issueBand[v28];
  do
  {
    issueBand = v30;
    if (v28 >= 0x1C)
    {
      if ((v28 - 100) > 0x10)
      {
        if (v28 < 0xC8)
        {
          +[WCM_Logging logLevel:0 message:@"thisIssueBand does not match any of the predefined ranges defined in WCM_WiFiCellCoexIssueBand enum."];
          issueBand = self->_issueBand;
        }
        else
        {
          issueBand = &self->_issueBand[(v28 - 200) + 45];
        }
      }
      else
      {
        issueBand = &self->_issueBand[(v28 - 100) + 28];
      }
    }
    if ((issueBand->_bandInfoType & a3) != 0
      && issueBand->_downlinkLowFreq <= a4
      && issueBand->_downlinkHighFreq >= a5
      && issueBand->_uplinkLowFreq <= a6
      && issueBand->_uplinkHighFreq >= a7
      && issueBand->_hasIssue)
    {
      id v35 = "<ISSUE_BAND_INVALID: beyond the range>";
      if (v28 <= 0xD2)
      {
        if (v28 < 0xC8)
        {
          if ((v28 - 100) > 0x10)
          {
            if (v28 > 0x1B)
            {
              id v35 = "<ISSUE_BAND_INVALID: Negative number.>";
              goto LABEL_41;
            }
            uint64_t v36 = &off_10020F7A0[v28];
          }
          else
          {
            uint64_t v36 = &off_10020F880[(v28 - 100)];
          }
        }
        else
        {
          uint64_t v36 = &off_10020F908[(v28 - 200)];
        }
        id v35 = *v36;
      }
LABEL_41:
      +[WCM_Logging logLevel:3, @"AgcCoexMode need to apply rules for %s", v35 message];
      uint64_t v37 = 0;
      char v38 = 0;
      char v39 = 0;
      char v40 = 0;
      BOOL v32 = 0;
      long long v41 = &off_10020F7A0[v28];
      BOOL v42 = (v28 - 100) > 0x10 && (v28 - 200) > 0xFFFFFF53;
      if ((v28 - 100) <= 0x10) {
        long long v41 = &off_10020F880[(v28 - 100)];
      }
      if (v28 <= 0xC7) {
        long long v43 = v41;
      }
      else {
        long long v43 = &off_10020F908[(v28 - 200)];
      }
      if (v28 > 0xD2) {
        BOOL v42 = 1;
      }
      BOOL v55 = v42;
      long long v44 = "<ISSUE_BAND_INVALID: Negative number.>";
      if (v28 > 0xD2) {
        long long v44 = "<ISSUE_BAND_INVALID: beyond the range>";
      }
      long long v54 = v44;
      long long v52 = v43;
      coexIssues = issueBand->_coexIssues;
      while (1)
      {
        long long v45 = (void *)v54;
        if (!v55) {
          long long v45 = *v52;
        }
        long long v46 = coexIssues[v37];
        unsigned int v47 = [(WCM_WiFiCellCoexIssue *)v46 issueType];
        long long v48 = "<ISSUE_TYPE_INVALID>";
        if (v47 <= 0xE) {
          long long v48 = off_10020F988[v47];
        }
        +[WCM_Logging logLevel:4, @"DLDebug_ For coexIssueBand (%s), coexIssueType (%s), coexIssuePrioirty (%s)", v45, v48, off_10020F960[v37] message];
        +[WCM_Logging logLevel:4, @"DLDebug_ For the coexIssue above, the policy table has following entries: wifiBtAgcCoexModeEnable = (%d), btAgcCoexModeEnable = (%d)", [(WCM_WiFiCellCoexIssue *)v46 wifiBtAgcCoexModeEnable], [(WCM_WiFiCellCoexIssue *)v46 btAgcCoexModeEnable] message];
        if (!v46)
        {
LABEL_74:
          BOOL v33 = v40 & 1;
          goto LABEL_32;
        }
        BOOL v32 = [(WCM_WiFiCellCoexIssue *)v46 wifiBtAgcCoexModeEnabledInPolicyV2:v58 cellDlHighFreq:v59 cellUlLowFreq:a10 cellUlHighFreq:&v62 wifiChannel:&v61 channelCenterFreqMHz:a4 channelBandwidthMHz:a5 coexModeWifiLevel:a6 coexModeBTLevel:a7];
        +[WCM_Logging logLevel:4, @"DLDebug_ Upon returning from wifiBtAgcCoexModeEnabledInPolicyV2, coexModeWifiLevel = %ld and coexModeBTLevel = %ld, Flag coexModeBandMatch = %d", v62, v61, v32 message];
        +[WCM_Logging logLevel:4, @"DLDebug_ nonzeroCoexModeWiFiMatchedBefore = %d, nonzeroCoexModeBTMatchedBefore = %d", v39 & 1, v38 & 1 message];
        if (v32)
        {
          long long v49 = (void *)v54;
          if (!v55) {
            long long v49 = *v52;
          }
          +[WCM_Logging logLevel:4, @"DLDebug_ coexModeBandMatch = %s for Band %d, Priority %d", v49, v32, v37 message];
          if (v39)
          {
            char v39 = 1;
            if ((v38 & 1) == 0) {
              goto LABEL_69;
            }
          }
          else
          {
            int64_t v50 = v62;
            *a11 = v62;
            +[WCM_Logging logLevel:4, @"DLDebug_ Assign coexModeWifiLevel_temp value (%ld) to *coexModeWifiLevel (%ld)", v50, v50 message];
            if (v62 < 1)
            {
              char v39 = 0;
              if ((v38 & 1) == 0)
              {
LABEL_69:
                int64_t v51 = v61;
                *a12 = v61;
                +[WCM_Logging logLevel:4, @"DLDebug_ Assign coexModeBTLevel_temp value (%ld) to *coexModeBTLevel (%ld)", v51, v51 message];
                if (v61 < 1)
                {
                  char v38 = 0;
                }
                else
                {
                  char v38 = 1;
                  +[WCM_Logging logLevel:4, @"DLDebug_ nonzeroCoexModeBTMatchedBefore switched from FALSE to %d", 1 message];
                }
                char v40 = 1;
                goto LABEL_73;
              }
            }
            else
            {
              char v39 = 1;
              +[WCM_Logging logLevel:4, @"DLDebug_ nonzeroCoexModeWiFiMatchedBefore switched from FALSE to %d", 1 message];
              if ((v38 & 1) == 0) {
                goto LABEL_69;
              }
            }
          }
          char v40 = 1;
          char v38 = 1;
        }
LABEL_73:
        if (++v37 == 5) {
          goto LABEL_74;
        }
      }
    }
    ++v28;
    ++v30;
  }
  while (v29 != v28);
  BOOL v32 = 0;
  BOOL v33 = 0;
LABEL_32:
  +[WCM_Logging logLevel:4, @"DLDebug_ wifiBtAgcCoexModeEnableCheckBandCombinationV2 is returning with coexModeBandMatch = %d and coexModeBandMatch_Flag = %d", v32, v33 message];
  return v33;
}

- (int)watchAntennaPreferenceEnableCheckBandCombination:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7
{
  +[WCM_Logging logLevel:3, @"Check if band is eligible for WatchAntennaPreference on bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf) ", *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7 message];
  uint64_t v13 = 0;
  unsigned int v19 = 0;
  uint64_t v14 = off_10020F7A0;
  while ((self->_issueBand[v13]._bandInfoType & a3) == 0
       || self->_issueBand[v13]._downlinkLowFreq > a4
       || self->_issueBand[v13]._downlinkHighFreq < a5
       || self->_issueBand[v13]._uplinkLowFreq > a6
       || self->_issueBand[v13]._uplinkHighFreq < a7
       || !self->_issueBand[v13]._hasIssue)
  {
    ++v13;
    ++v14;
    if (v13 == 28) {
      goto LABEL_9;
    }
  }
  +[WCM_Logging logLevel:3, @"WatchAntennaPref need to apply rules for %s", *v14 message];
  coexIssues = self->_issueBand[v13]._coexIssues;
  uint64_t v18 = 5;
  while (*coexIssues)
  {
    if ([(WCM_WiFiCellCoexIssue *)*coexIssues watchAntennaPrefEnabledInPolicy:&v19 cellDlHighFreq:a4 cellUlLowFreq:a5 cellUlHighFreq:a6 watchAntPref:a7])
    {
      uint64_t v15 = v19;
      goto LABEL_10;
    }
    uint64_t v15 = 0;
    ++coexIssues;
    if (!--v18) {
      goto LABEL_10;
    }
  }
LABEL_9:
  uint64_t v15 = 0;
LABEL_10:
  +[WCM_Logging logLevel:3, @"WatchAntennaPreference for this band Yes or No %d", v15 message];
  if ((int)v15 <= 0) {
    return 0;
  }
  else {
    return v19;
  }
}

@end