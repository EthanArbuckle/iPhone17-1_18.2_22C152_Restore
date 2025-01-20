@interface WCM_WiFiCellCoexIssue
- (BOOL)HFBTAntBlkBandUnii1Enabled;
- (BOOL)HFBTAntBlkBandUnii3Enabled;
- (BOOL)HFBTAntBlkBandUnii5aEnabled;
- (BOOL)HFBTAntBlkBandUnii5bEnabled;
- (BOOL)HFBTAntBlkBandUnii5cEnabled;
- (BOOL)HFBTAntBlkBandUnii5dEnabled;
- (BOOL)enableWifiChannelAvoidance;
- (BOOL)isWifiEnhBand;
- (BOOL)needCellTxPowerConstraintOnCellDlLowFreq:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6 wifiChannel:(int)a7 gpsRadioActive:(BOOL)a8;
- (BOOL)needCellTxPowerConstraintWiFiEnhOnCellDlLowFreq:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6 wifiChannel:(int)a7 wifiCenterFreq:(unsigned int)a8 wifiBandwidth:(unsigned int)a9 gpsRadioActive:(BOOL)a10;
- (BOOL)needWiFiAntennaConstraintOnCellDlLowFreq:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6 wifiChannel:(int)a7 gpsRadioActive:(BOOL)a8;
- (BOOL)needWiFiAntennaConstraintWiFiEnhOnCellDlLowFreq:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6 wifiChannel:(int)a7 wifiCenterFreq:(unsigned int)a8 wifiBandwidth:(unsigned int)a9 gpsRadioActive:(BOOL)a10;
- (BOOL)watchAntennaPrefEnabledInPolicy:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6 watchAntPref:(int *)a7;
- (BOOL)wifiBtAgcCoexModeEnabledInPolicy:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6 agccoexmode:(int *)a7;
- (BOOL)wifiBtAgcCoexModeEnabledInPolicyV2:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6 wifiChannel:(unsigned int)a7 channelCenterFreqMHz:(unsigned int)a8 channelBandwidthMHz:(unsigned int)a9 coexModeWifiLevel:(int64_t *)a10 coexModeBTLevel:(int64_t *)a11;
- (NSArray)btChannelsToAvoidForC0B0;
- (NSArray)btChannelsToAvoidForC0B1;
- (NSArray)btChannelsToAvoidForC1B0;
- (NSArray)btChannelsToAvoidForC1B1;
- (NSArray)wifiChannelsToApplyCellAntBlocking;
- (NSArray)wifiChannelsToAvoidForCellOOB;
- (NSArray)wifiChannelsToAvoidForOCL;
- (NSArray)wifiChannelsToAvoidForPHS;
- (NSArray)wifiChannelsToDoAntennaSelectionForCellOOB;
- (WCM_WiFiCellCoexIssue)initWithCoexIssueConfig:(id *)a3;
- (double)cellBandwidthLimitForOOB;
- (double)cellFrequencyLimitForOOB;
- (id)HFBTAntBlkBandsForCellUlLowFreq:(double)a3 cellUlHighFreq:(double)a4;
- (id)HFBTChannelsToAvoidForCellUlLowFreq:(double)a3 cellUlHighFreq:(double)a4 cellDlLowFreq:(double)a5 cellDlHighFreq:(double)a6 btBandLowFreq:(double)a7 btBandHighFreq:(double)a8 gpsRadioActive:(BOOL)a9;
- (id)btChannelsToAvoidFor:(int)a3;
- (id)btChannelsToAvoidForCellUlLowFreq:(double)a3 cellUlHighFreq:(double)a4 gpsRadioActive:(BOOL)a5;
- (id)btDiversityChannelsToAvoidForCellBTAntennaCombination:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 gpsRadioActive:(BOOL)a8;
- (id)getAllBtChannelsInBandForBtHighFreq:(double)a3 btLowFreq:(double)a4;
- (id)wiFiEnhChannelsAffectedByCellUlLowFreq:(double)a3 cellUlHighFreq:(double)a4;
- (id)wiFiEnhOclChannelsAffectedByCellUlLowFreq:(double)a3 cellUlHighFreq:(double)a4;
- (id)wifi5GHzChannelsAffectedByNR79UlLowFreq:(double)a3 cellUlHighFreq:(double)a4;
- (id)wifiChannelsAffectedByCellUlLowFreq:(double)a3 cellUlHighFreq:(double)a4 wifi5G:(BOOL)a5;
- (id)wifiChannelsIMD3ByCellDlLowFreq:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6 wifi5G:(BOOL)a7;
- (id)wifiChannelsToAvoidForCellDlLowFreq:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6 wifi5G:(BOOL)a7 wifiEssentialChannel:(int *)a8;
- (id)wifiChannelsToAvoidWiFiEnhForCellDlLowFreq:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6;
- (id)wifiOclChannelsAffectedByCellUlLowFreq:(double)a3 cellUlHighFreq:(double)a4 isWifi5G:(BOOL)a5;
- (id)wifiPHSChannelsToBlocklistForCellDlLowFreq:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6 wifi5G:(BOOL)a7 wifiEssentialChannel:(int *)a8;
- (int)btDiversityBlocklistTypeFor:(int)a3;
- (int)btDiversityBlocklistTypeForC0B0;
- (int)btDiversityBlocklistTypeForC0B1;
- (int)btDiversityBlocklistTypeForC1B0;
- (int)btDiversityBlocklistTypeForC1B1;
- (int)issueType;
- (int)watchAntType;
- (unint64_t)cellTxPowerLimit;
- (unsigned)btAgcCoexModeEnable;
- (unsigned)cellAntBlkEnableIdx;
- (unsigned)cellAntBlkEnableIdx2;
- (unsigned)ulcaPriority;
- (unsigned)ulcaPriorityCCBT;
- (unsigned)ulcaPriorityCCWiFi;
- (unsigned)wifiBtAgcCoexModeEnable;
- (unsigned)wifiDlAntennaBitmapOnCellAntBitmap000;
- (unsigned)wifiDlAntennaBitmapOnCellAntBitmap001;
- (unsigned)wifiDlAntennaBitmapOnCellAntBitmap010;
- (unsigned)wifiDlAntennaBitmapOnCellAntBitmap011;
- (unsigned)wifiDlAntennaBitmapOnCellAntBitmap100;
- (unsigned)wifiDlAntennaBitmapOnCellAntBitmap101;
- (unsigned)wifiDlAntennaBitmapOnCellAntBitmap110;
- (unsigned)wifiDlAntennaBitmapOnCellAntBitmap111;
- (unsigned)wifiDlAntennaBitmapOnCellLAT;
- (unsigned)wifiDlAntennaBitmapOnCellUAT;
- (unsigned)wifiUlAntennaBitmapOnCellAntBitmap000;
- (unsigned)wifiUlAntennaBitmapOnCellAntBitmap001;
- (unsigned)wifiUlAntennaBitmapOnCellAntBitmap010;
- (unsigned)wifiUlAntennaBitmapOnCellAntBitmap011;
- (unsigned)wifiUlAntennaBitmapOnCellAntBitmap100;
- (unsigned)wifiUlAntennaBitmapOnCellAntBitmap101;
- (unsigned)wifiUlAntennaBitmapOnCellAntBitmap110;
- (unsigned)wifiUlAntennaBitmapOnCellAntBitmap111;
- (unsigned)wifiUlAntennaBitmapOnCellLAT;
- (unsigned)wifiUlAntennaBitmapOnCellUAT;
- (void)cellFreqRangeWithIssueForCellDlLowFreq:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6 wifiLowFreq:(double)a7 wifiHighFreq:(double)a8 cellTxIssueRange:(id *)a9 cellRxIssueRange:(id *)a10;
- (void)dealloc;
@end

@implementation WCM_WiFiCellCoexIssue

- (WCM_WiFiCellCoexIssue)initWithCoexIssueConfig:(id *)a3
{
  v28.receiver = self;
  v28.super_class = (Class)WCM_WiFiCellCoexIssue;
  v4 = [(WCM_WiFiCellCoexIssue *)&v28 init];
  v5 = v4;
  if (!v4) {
    return v5;
  }
  int var1 = a3->var1;
  v4->_issueType = var1;
  v4->_enableWifiChannelAvoidance = a3->var2;
  v4->_wifiUlAntennaBitmapOnCellLAT = a3->var3;
  v4->_wifiUlAntennaBitmapOnCellUAT = a3->var4;
  v4->_wifiDlAntennaBitmapOnCellLAT = a3->var5;
  v4->_wifiDlAntennaBitmapOnCellUAT = a3->var6;
  v4->_wifiUlAntennaBitmapOnCellAntBitmap000 = a3->var7;
  v4->_wifiUlAntennaBitmapOnCellAntBitmap001 = a3->var8;
  v4->_wifiUlAntennaBitmapOnCellAntBitmap010 = a3->var9;
  v4->_wifiUlAntennaBitmapOnCellAntBitmap011 = a3->var10;
  v4->_wifiUlAntennaBitmapOnCellAntBitmap100 = a3->var11;
  v4->_wifiUlAntennaBitmapOnCellAntBitmap101 = a3->var12;
  v4->_wifiUlAntennaBitmapOnCellAntBitmap110 = a3->var13;
  v4->_wifiUlAntennaBitmapOnCellAntBitmap111 = a3->var14;
  v4->_wifiDlAntennaBitmapOnCellAntBitmap000 = a3->var15;
  v4->_wifiDlAntennaBitmapOnCellAntBitmap001 = a3->var16;
  v4->_wifiDlAntennaBitmapOnCellAntBitmap010 = a3->var17;
  v4->_wifiDlAntennaBitmapOnCellAntBitmap011 = a3->var18;
  v4->_wifiDlAntennaBitmapOnCellAntBitmap100 = a3->var19;
  v4->_wifiDlAntennaBitmapOnCellAntBitmap101 = a3->var20;
  v4->_wifiDlAntennaBitmapOnCellAntBitmap110 = a3->var21;
  v4->_wifiDlAntennaBitmapOnCellAntBitmap111 = a3->var22;
  v4->_cellTxPowerLimit = a3->var23;
  v4->_cellFrequencyLimitForOOB = a3->var24;
  v4->_cellBandwidthLimitForOOB = a3->var25;
  v4->_btDiversityBlocklistTypeForC0B0 = a3->var30;
  v4->_btDiversityBlocklistTypeForC0B1 = a3->var31;
  v4->_btDiversityBlocklistTypeForC1B0 = a3->var32;
  v4->_btDiversityBlocklistTypeForC1B1 = a3->var33;
  v4->_watchAntType = a3->var42;
  v4->_wifiBtAgcCoexModeEnable = a3->var43;
  v4->_ulcaPriority = a3->var44;
  v4->_ulcaPriorityCCWiFi = a3->var45;
  v4->_ulcaPriorityCCBT = a3->var46;
  v4->_btAgcCoexModeEnable = a3->var47;
  v4->_cellAntBlkEnableIdx = a3->var48;
  v4->_isWifiEnhBand = a3->var51;
  v4->_HFBTAntBlkBandUnii1Enabled = a3->var54;
  v4->_HFBTAntBlkBandUnii3Enabled = a3->var55;
  v4->_HFBTAntBlkBandUnii5aEnabled = a3->var56;
  v4->_HFBTAntBlkBandUnii5bEnabled = a3->var57;
  v4->_HFBTAntBlkBandUnii5cEnabled = a3->var58;
  v4->_HFBTAntBlkBandUnii5dEnabled = a3->var59;
  if ((var1 & 0xFFFFFFFE) != 0xC) {
    return v5;
  }
  v7 = sub_10008D478(a3->var51, a3->var26, a3->var27);
  if (v7)
  {
    v5->_wifiChannelsToAvoidForCellOOB = (NSArray *)[(NSMutableArray *)v7 copy];
  }
  else if (a3->var26 || a3->var27)
  {
    v25 = a3;
    CFStringRef v11 = @"pIssueConfig(%p) has invalid WiFi channel to avoid on OOB";
LABEL_46:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, v11, v25, var0, v27);
    goto LABEL_47;
  }
  wifiChannelsToAvoidForCellOOB = sub_10008D478(a3->var51, a3->var49, a3->var50);
  if (!wifiChannelsToAvoidForCellOOB)
  {
    uint64_t v9 = a3->var50;
    if (!(a3->var49 | v9))
    {
      wifiChannelsToAvoidForOCL = v5->_wifiChannelsToAvoidForOCL;
      goto LABEL_13;
    }
    +[WCM_Logging logLevel:4, @"initWithCoexIssueConfig pIssueConfig(%p) has invalid WiFi OCL channel [%d, %d] to avoid on OOB. Going back to use wifiChannelsToAvoidForCellOOB", a3, a3->var49, v9 message];
    wifiChannelsToAvoidForCellOOB = (NSMutableArray *)v5->_wifiChannelsToAvoidForCellOOB;
  }
  wifiChannelsToAvoidForOCL = (NSArray *)[(NSMutableArray *)wifiChannelsToAvoidForCellOOB copy];
  v5->_wifiChannelsToAvoidForOCL = wifiChannelsToAvoidForOCL;
LABEL_13:
  +[WCM_Logging logLevel:4, @"initWithCoexIssueConfig: _wifiChannelsToAvoidForOCL: %@", wifiChannelsToAvoidForOCL message];
  v12 = sub_10008D478(a3->var51, a3->var52, a3->var53);
  if (!v12)
  {
    uint64_t var53 = a3->var53;
    if (a3->var52 | var53)
    {
      +[WCM_Logging logLevel:4, @"pIssueConfig(%p) has invalid WiFi PHS channel [%d, %d] to avoid on OOB. Going back to use wifiChannelsToAvoidForCellOOB", a3, a3->var52, var53 message];
LABEL_47:

      return 0;
    }
    v12 = (NSMutableArray *)v5->_wifiChannelsToAvoidForCellOOB;
  }
  v14 = (NSArray *)[(NSMutableArray *)v12 copy];
  v5->_wifiChannelsToAvoidForPHS = v14;
  +[WCM_Logging logLevel:4, @"initWithCoexIssueConfig: _wifiChannelsToAvoidForPHS: %@", v14 message];
  v15 = sub_10008D478(a3->var51, a3->var28, a3->var29);
  if (v15)
  {
    v5->_wifiChannelsToDoAntennaSelectionForCellOOB = (NSArray *)[(NSMutableArray *)v15 copy];
    goto LABEL_18;
  }
  if (a3->var28 || a3->var29)
  {
    v25 = a3;
    uint64_t var0 = a3->var0;
    CFStringRef v11 = @"pIssueConfig(%p) and pIssueConfig->_issueBand(%d) has invalid WiFi channel to do antenna selection on OOB";
    goto LABEL_46;
  }
LABEL_18:
  if (v5->_btDiversityBlocklistTypeForC0B0 != 3) {
    goto LABEL_23;
  }
  uint64_t var34 = a3->var34;
  if (var34 > 0x4E
    || (uint64_t var35 = a3->var35, var35 > 0x4E)
    || var34 > var35)
  {
    v25 = a3;
    CFStringRef v11 = @"pIssueConfig(%p) has invalid BT channel to avoid for C0B0";
    goto LABEL_46;
  }
  v5->_btChannelsToAvoidForC0B0 = (NSArray *)sub_10008CCFC(var34, var35);
LABEL_23:
  if (v5->_btDiversityBlocklistTypeForC0B1 != 3) {
    goto LABEL_28;
  }
  uint64_t var36 = a3->var36;
  if (var36 > 0x4E
    || (uint64_t var37 = a3->var37, var37 > 0x4E)
    || var36 > var37)
  {
    v25 = a3;
    CFStringRef v11 = @"pIssueConfig(%p) has invalid BT channel to avoid for C0B1";
    goto LABEL_46;
  }
  v5->_btChannelsToAvoidForC0B1 = (NSArray *)sub_10008CCFC(var36, var37);
LABEL_28:
  if (v5->_btDiversityBlocklistTypeForC1B0 != 3) {
    goto LABEL_33;
  }
  uint64_t var38 = a3->var38;
  if (var38 > 0x4E
    || (uint64_t var39 = a3->var39, var39 > 0x4E)
    || var38 > var39)
  {
    v25 = a3;
    CFStringRef v11 = @"pIssueConfig(%p) has invalid BT channel to avoid for C1B0";
    goto LABEL_46;
  }
  v5->_btChannelsToAvoidForC1B0 = (NSArray *)sub_10008CCFC(var38, var39);
LABEL_33:
  if (v5->_btDiversityBlocklistTypeForC1B1 == 3)
  {
    uint64_t v22 = a3->var40;
    if (v22 <= 0x4E)
    {
      uint64_t var41 = a3->var41;
      if (var41 <= 0x4E && v22 <= var41)
      {
        v5->_btChannelsToAvoidForC1B1 = (NSArray *)sub_10008CCFC(v22, var41);
        return v5;
      }
    }
    v25 = a3;
    CFStringRef v11 = @"pIssueConfig(%p) has invalid BT channel to avoid for C1B1";
    goto LABEL_46;
  }
  return v5;
}

- (void)dealloc
{
  wifiChannelsToAvoidForOCL = self->_wifiChannelsToAvoidForOCL;
  if (wifiChannelsToAvoidForOCL) {

  }
  wifiChannelsToAvoidForPHS = self->_wifiChannelsToAvoidForPHS;
  if (wifiChannelsToAvoidForPHS) {

  }
  if ([[[WCM_PolicyManager singleton] activeCoexFeatures] containsObject:@"BB22_N79_DYNAMIC_ANTENNA_BLOCKING"])self->_wifiChannelsToApplyCellAntBlocking; {
  v5.receiver = self;
  }
  v5.super_class = (Class)WCM_WiFiCellCoexIssue;
  [(WCM_WiFiCellCoexIssue *)&v5 dealloc];
}

- (int)btDiversityBlocklistTypeFor:(int)a3
{
  switch(a3)
  {
    case 0:
      int result = [(WCM_WiFiCellCoexIssue *)self btDiversityBlocklistTypeForC0B0];
      break;
    case 1:
      int result = [(WCM_WiFiCellCoexIssue *)self btDiversityBlocklistTypeForC0B1];
      break;
    case 2:
      int result = [(WCM_WiFiCellCoexIssue *)self btDiversityBlocklistTypeForC1B0];
      break;
    case 3:
      int result = [(WCM_WiFiCellCoexIssue *)self btDiversityBlocklistTypeForC1B1];
      break;
    default:
      +[WCM_Logging logLevel:0, @"Invalid antennaCombinationCxBx(%d)", *(void *)&a3 message];
      int result = 0;
      break;
  }
  return result;
}

- (id)btChannelsToAvoidFor:(int)a3
{
  switch(a3)
  {
    case 0:
      id result = [(WCM_WiFiCellCoexIssue *)self btChannelsToAvoidForC0B0];
      break;
    case 1:
      id result = [(WCM_WiFiCellCoexIssue *)self btChannelsToAvoidForC0B1];
      break;
    case 2:
      id result = [(WCM_WiFiCellCoexIssue *)self btChannelsToAvoidForC1B0];
      break;
    case 3:
      id result = [(WCM_WiFiCellCoexIssue *)self btChannelsToAvoidForC1B1];
      break;
    default:
      +[WCM_Logging logLevel:0, @"Invalid antennaCombinationCxBx(%d)", *(void *)&a3 message];
      id result = 0;
      break;
  }
  return result;
}

- (BOOL)needWiFiAntennaConstraintOnCellDlLowFreq:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6 wifiChannel:(int)a7 gpsRadioActive:(BOOL)a8
{
  int8x8_t v10 = vorr_s8(*(int8x8_t *)&self->_wifiUlAntennaBitmapOnCellAntBitmap000, (int8x8_t)*(_OWORD *)&vextq_s8(*(int8x16_t *)&self->_wifiUlAntennaBitmapOnCellAntBitmap000, *(int8x16_t *)&self->_wifiUlAntennaBitmapOnCellAntBitmap000, 8uLL));
  if (self->_wifiUlAntennaBitmapOnCellUAT | self->_wifiUlAntennaBitmapOnCellLAT | self->_wifiDlAntennaBitmapOnCellLAT | self->_wifiDlAntennaBitmapOnCellUAT)
  {
    BOOL v12 = 0;
  }
  else
  {
    uint64_t v11 = *(void *)&v10 | HIDWORD(*(void *)&v10) | ((*(void *)&v10 | HIDWORD(*(void *)&v10)) >> 16);
    BOOL v12 = (v11 | BYTE1(v11)) == 0;
  }
  if (v12) {
    return 0;
  }
  BOOL v13 = a8;
  uint64_t v14 = *(void *)&a7;
  double v18 = sub_10008C550(*(uint64_t *)&a7);
  uint64_t issueType = self->_issueType;
  double v21 = v18;
  double v22 = v19;
  double v23 = a6 - a5;
  double v24 = a4 - a3;
  switch((int)issueType)
  {
    case 0:
      double v25 = (v23 + a5) * 3.0 - a5 * 3.0;
      if (a5 * 3.0 >= v21) {
        double v26 = a5 * 3.0;
      }
      else {
        double v26 = v21;
      }
      double v27 = a5 * 3.0 + v25;
      goto LABEL_34;
    case 1:
    case 7:
      double v21 = a5;
      goto LABEL_19;
    case 2:
      if (!v13) {
        return 0;
      }
      double v28 = 1573.374;
      double v24 = 4.092;
      double v29 = a5;
      goto LABEL_15;
    case 3:
      double v29 = a5;
      double v28 = a3;
LABEL_15:
      return sub_10008B3EC(0, v18, v19, v29, v23, v28, v24);
    case 4:
      double v18 = a5;
      double v19 = a6 - a5;
      double v23 = v22;
LABEL_19:
      double v31 = a3;
      goto LABEL_20;
    case 5:
      if (!v13) {
        return 0;
      }
      double v31 = 1573.374;
      double v24 = 4.092;
      double v18 = a5;
      double v19 = a6 - a5;
      double v23 = v22;
      goto LABEL_20;
    case 6:
      if (!v13) {
        return 0;
      }
      double v31 = 1573.374;
      double v24 = 4.092;
      double v21 = a5;
LABEL_20:
      return sub_10008B494(0, v18, v19, v21, v23, v31, v24);
    case 8:
      return sub_10008B574(0, a5, a6 - a5, v18, v19, a3, v24);
    case 9:
      double v32 = v23 + a5 + v23 + a5 - (a5 + a5);
      if (a5 + a5 >= v18) {
        double v26 = a5 + a5;
      }
      else {
        double v26 = v18;
      }
      double v27 = a5 + a5 + v32;
LABEL_34:
      if (v27 >= v21 + v22) {
        double v27 = v21 + v22;
      }
      return v26 < v27;
    case 10:
      double v34 = v18 * 0.5;
      double v35 = (v18 + v22) * 0.5;
      goto LABEL_39;
    case 11:
      double v34 = v18 / 3.0;
      double v35 = (v18 + v22) / 3.0;
LABEL_39:
      double v36 = v35 - v34;
      if (v34 >= a3) {
        double v37 = v34;
      }
      else {
        double v37 = a3;
      }
      double v38 = v34 + v36;
      goto LABEL_57;
    case 12:
      if (self->_cellFrequencyLimitForOOB <= a5) {
        return 0;
      }
      goto LABEL_46;
    case 13:
      if (self->_cellFrequencyLimitForOOB >= a6) {
        return 0;
      }
LABEL_46:
      BOOL result = 0;
      if (!v14 || v23 <= self->_cellBandwidthLimitForOOB) {
        return result;
      }
      wifiChannelsToDoAntennaSelectionForCellOOB = self->_wifiChannelsToDoAntennaSelectionForCellOOB;
      if (!wifiChannelsToDoAntennaSelectionForCellOOB) {
        return 0;
      }
      v40 = +[NSNumber numberWithInt:v14];
      BOOL result = [(NSArray *)wifiChannelsToDoAntennaSelectionForCellOOB containsObject:v40];
      break;
    case 14:
      double v41 = v18 + v18;
      double v42 = v21 + v19 + v21 + v19 - (v21 + v21);
      if (v21 + v21 >= a3) {
        double v37 = v21 + v21;
      }
      else {
        double v37 = a3;
      }
      double v38 = v41 + v42;
LABEL_57:
      if (v38 >= v24 + a3) {
        double v38 = v24 + a3;
      }
      return v37 < v38;
    default:
      +[WCM_Logging logLevel:0, @"WCM_WiFiCellCoexIssue(%p) has invalid _issueType(%d)", self, issueType message];
      return 0;
  }
  return result;
}

- (BOOL)needWiFiAntennaConstraintWiFiEnhOnCellDlLowFreq:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6 wifiChannel:(int)a7 wifiCenterFreq:(unsigned int)a8 wifiBandwidth:(unsigned int)a9 gpsRadioActive:(BOOL)a10
{
  BOOL v10 = a10;
  uint64_t v13 = *(void *)&a7;
  +[WCM_Logging logLevel:5, @"WiFiEnh_: AntSel Constraint Check: cellular downlink(%lf ~ %lf), cellular uplink(%lf ~ %lf), wifiChannel(%d), wifiBandwidth(%d), wifiCenterFreq(%d), gpsRadioActive(%d)", *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7, *(void *)&a9, *(void *)&a8, a10 message];
  int8x8_t v19 = vorr_s8(*(int8x8_t *)&self->_wifiUlAntennaBitmapOnCellAntBitmap000, (int8x8_t)*(_OWORD *)&vextq_s8(*(int8x16_t *)&self->_wifiUlAntennaBitmapOnCellAntBitmap000, *(int8x16_t *)&self->_wifiUlAntennaBitmapOnCellAntBitmap000, 8uLL));
  if (self->_wifiUlAntennaBitmapOnCellUAT | self->_wifiUlAntennaBitmapOnCellLAT | self->_wifiDlAntennaBitmapOnCellLAT | self->_wifiDlAntennaBitmapOnCellUAT)
  {
    BOOL v21 = 0;
  }
  else
  {
    uint64_t v20 = *(void *)&v19 | HIDWORD(*(void *)&v19) | ((*(void *)&v19 | HIDWORD(*(void *)&v19)) >> 16);
    BOOL v21 = (v20 | BYTE1(v20)) == 0;
  }
  if (v21) {
    return 0;
  }
  uint64_t issueType = self->_issueType;
  double v23 = a6 - a5;
  double v24 = (double)(a8 - (a9 >> 1));
  double v25 = a4 - a3;
  unsigned int v26 = a8 + (a9 >> 1);
  double v27 = (double)v26 - v24;
  switch((int)issueType)
  {
    case 0:
      double v30 = (v23 + a5) * 3.0 - a5 * 3.0;
      if (a5 * 3.0 >= v24) {
        double v31 = a5 * 3.0;
      }
      else {
        double v31 = (double)(a8 - (a9 >> 1));
      }
      double v32 = a5 * 3.0 + v30;
      goto LABEL_34;
    case 1:
    case 7:
      double v28 = (double)(a8 - (a9 >> 1));
      double v29 = (double)v26 - v24;
      double v24 = a5;
      goto LABEL_19;
    case 2:
      if (!v10) {
        return 0;
      }
      double v33 = 1573.374;
      double v25 = 4.092;
      double v34 = (double)(a8 - (a9 >> 1));
      double v35 = (double)v26 - v24;
      double v36 = a5;
      goto LABEL_15;
    case 3:
      double v34 = (double)(a8 - (a9 >> 1));
      double v35 = (double)v26 - v24;
      double v36 = a5;
      double v33 = a3;
LABEL_15:
      return sub_10008B3EC(0, v34, v35, v36, v23, v33, v25);
    case 4:
      double v28 = a5;
      double v29 = a6 - a5;
      double v23 = (double)v26 - v24;
LABEL_19:
      double v38 = a3;
      goto LABEL_20;
    case 5:
      if (!v10) {
        return 0;
      }
      double v38 = 1573.374;
      double v25 = 4.092;
      double v28 = a5;
      double v29 = a6 - a5;
      double v23 = (double)v26 - v24;
      goto LABEL_20;
    case 6:
      if (!v10) {
        return 0;
      }
      double v38 = 1573.374;
      double v25 = 4.092;
      double v28 = (double)(a8 - (a9 >> 1));
      double v29 = (double)v26 - v24;
      double v24 = a5;
LABEL_20:
      return sub_10008B494(0, v28, v29, v24, v23, v38, v25);
    case 8:
      return sub_10008B574(0, a5, a6 - a5, v24, (double)v26 - v24, a3, v25);
    case 9:
      double v39 = v23 + a5 + v23 + a5 - (a5 + a5);
      if (a5 + a5 >= v24) {
        double v31 = a5 + a5;
      }
      else {
        double v31 = (double)(a8 - (a9 >> 1));
      }
      double v32 = a5 + a5 + v39;
LABEL_34:
      if (v32 >= v27 + v24) {
        double v32 = v27 + v24;
      }
      return v31 < v32;
    case 10:
      double v41 = v24 * 0.5;
      double v42 = (v27 + v24) * 0.5;
      goto LABEL_39;
    case 11:
      double v41 = v24 / 3.0;
      double v42 = (v27 + v24) / 3.0;
LABEL_39:
      double v43 = v42 - v41;
      if (v41 >= a3) {
        double v44 = v41;
      }
      else {
        double v44 = a3;
      }
      double v45 = v41 + v43;
      goto LABEL_57;
    case 12:
      if (self->_cellFrequencyLimitForOOB <= a5) {
        return 0;
      }
      goto LABEL_46;
    case 13:
      if (self->_cellFrequencyLimitForOOB >= a6) {
        return 0;
      }
LABEL_46:
      BOOL result = 0;
      if (!v13 || v23 <= self->_cellBandwidthLimitForOOB) {
        return result;
      }
      wifiChannelsToDoAntennaSelectionForCellOOB = self->_wifiChannelsToDoAntennaSelectionForCellOOB;
      if (!wifiChannelsToDoAntennaSelectionForCellOOB) {
        return 0;
      }
      v47 = +[NSNumber numberWithInt:v13];
      BOOL result = [(NSArray *)wifiChannelsToDoAntennaSelectionForCellOOB containsObject:v47];
      break;
    case 14:
      double v48 = v24 + v24;
      double v49 = v27 + v24 + v27 + v24 - (v24 + v24);
      if (v24 + v24 >= a3) {
        double v44 = v24 + v24;
      }
      else {
        double v44 = a3;
      }
      double v45 = v48 + v49;
LABEL_57:
      if (v45 >= v25 + a3) {
        double v45 = v25 + a3;
      }
      return v44 < v45;
    default:
      +[WCM_Logging logLevel:0, @"WiFiEnh_: Antenna Selection Constraint: WCM_WiFiCellCoexIssue(%p) has invalid _issueType(%d)", self, issueType message];
      return 0;
  }
  return result;
}

- (BOOL)needCellTxPowerConstraintOnCellDlLowFreq:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6 wifiChannel:(int)a7 gpsRadioActive:(BOOL)a8
{
  if (!self->_cellTxPowerLimit) {
    return 0;
  }
  BOOL v8 = a8;
  uint64_t v9 = *(void *)&a7;
  double v15 = sub_10008C550(*(uint64_t *)&a7);
  uint64_t issueType = self->_issueType;
  double v18 = v15;
  double v19 = v16;
  double v20 = a6 - a5;
  double v21 = a4 - a3;
  switch((int)issueType)
  {
    case 0:
      double v22 = (v20 + a5) * 3.0 - a5 * 3.0;
      if (a5 * 3.0 >= v18) {
        double v23 = a5 * 3.0;
      }
      else {
        double v23 = v18;
      }
      double v24 = a5 * 3.0 + v22;
      goto LABEL_31;
    case 1:
    case 7:
      double v18 = a5;
      goto LABEL_16;
    case 2:
      if (!v8) {
        return 0;
      }
      double v25 = 1573.374;
      double v21 = 4.092;
      double v26 = a5;
      goto LABEL_12;
    case 3:
      double v26 = a5;
      double v25 = a3;
LABEL_12:
      return sub_10008B3EC(0, v15, v16, v26, v20, v25, v21);
    case 4:
      double v15 = a5;
      double v16 = a6 - a5;
      double v20 = v19;
LABEL_16:
      double v28 = a3;
      goto LABEL_17;
    case 5:
      if (!v8) {
        return 0;
      }
      double v28 = 1573.374;
      double v21 = 4.092;
      double v15 = a5;
      double v16 = a6 - a5;
      double v20 = v19;
      goto LABEL_17;
    case 6:
      if (!v8) {
        return 0;
      }
      double v28 = 1573.374;
      double v21 = 4.092;
      double v18 = a5;
LABEL_17:
      return sub_10008B494(0, v15, v16, v18, v20, v28, v21);
    case 8:
      return sub_10008B574(0, a5, a6 - a5, v15, v16, a3, v21);
    case 9:
      double v29 = v20 + a5 + v20 + a5 - (a5 + a5);
      if (a5 + a5 >= v15) {
        double v23 = a5 + a5;
      }
      else {
        double v23 = v15;
      }
      double v24 = a5 + a5 + v29;
LABEL_31:
      if (v24 >= v18 + v19) {
        double v24 = v18 + v19;
      }
      return v23 < v24;
    case 10:
      double v31 = v15 * 0.5;
      double v32 = (v15 + v19) * 0.5;
      goto LABEL_36;
    case 11:
      double v31 = v15 / 3.0;
      double v32 = (v15 + v19) / 3.0;
LABEL_36:
      double v33 = v32 - v31;
      if (v31 >= a3) {
        double v34 = v31;
      }
      else {
        double v34 = a3;
      }
      double v35 = v31 + v33;
      goto LABEL_54;
    case 12:
      if (self->_cellFrequencyLimitForOOB <= a5) {
        return 0;
      }
      goto LABEL_43;
    case 13:
      if (self->_cellFrequencyLimitForOOB >= a6) {
        return 0;
      }
LABEL_43:
      BOOL result = 0;
      if (!v9 || v20 <= self->_cellBandwidthLimitForOOB) {
        return result;
      }
      wifiChannelsToAvoidForCellOOB = self->_wifiChannelsToAvoidForCellOOB;
      if (!wifiChannelsToAvoidForCellOOB) {
        return 0;
      }
      double v37 = +[NSNumber numberWithInt:v9];
      BOOL result = [(NSArray *)wifiChannelsToAvoidForCellOOB containsObject:v37];
      break;
    case 14:
      double v38 = v15 + v15;
      double v39 = v18 + v16 + v18 + v16 - (v18 + v18);
      if (v18 + v18 >= a3) {
        double v34 = v18 + v18;
      }
      else {
        double v34 = a3;
      }
      double v35 = v38 + v39;
LABEL_54:
      if (v35 >= v21 + a3) {
        double v35 = v21 + a3;
      }
      return v34 < v35;
    default:
      +[WCM_Logging logLevel:0, @"WCM_WiFiCellCoexIssue(%p) has invalid _issueType(%d)", self, issueType message];
      return 0;
  }
  return result;
}

- (BOOL)needCellTxPowerConstraintWiFiEnhOnCellDlLowFreq:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6 wifiChannel:(int)a7 wifiCenterFreq:(unsigned int)a8 wifiBandwidth:(unsigned int)a9 gpsRadioActive:(BOOL)a10
{
  BOOL v10 = a10;
  uint64_t v13 = *(void *)&a7;
  +[WCM_Logging logLevel:5, @"WiFiEnh_: Cellular Tx Power Limiting Constraint Check: cellular downlink(%lf ~ %lf), cellular uplink(%lf ~ %lf), wifiChannel(%d), wifiBandwidth(%d), wifiCenterFreq(%d), gpsRadioActive(%d)", *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7, *(void *)&a9, *(void *)&a8, a10 message];
  if (!self->_cellTxPowerLimit) {
    return 0;
  }
  uint64_t issueType = self->_issueType;
  double v20 = a6 - a5;
  double v21 = (double)(a8 - (a9 >> 1));
  double v22 = a4 - a3;
  unsigned int v23 = a8 + (a9 >> 1);
  double v24 = (double)v23 - v21;
  switch((int)issueType)
  {
    case 0:
      double v27 = (v20 + a5) * 3.0 - a5 * 3.0;
      if (a5 * 3.0 >= v21) {
        double v28 = a5 * 3.0;
      }
      else {
        double v28 = (double)(a8 - (a9 >> 1));
      }
      double v29 = a5 * 3.0 + v27;
      goto LABEL_31;
    case 1:
    case 7:
      double v25 = (double)(a8 - (a9 >> 1));
      double v26 = (double)v23 - v21;
      double v21 = a5;
      goto LABEL_16;
    case 2:
      if (!v10) {
        return 0;
      }
      double v30 = 1573.374;
      double v22 = 4.092;
      double v31 = (double)(a8 - (a9 >> 1));
      double v32 = (double)v23 - v21;
      double v33 = a5;
      goto LABEL_12;
    case 3:
      double v31 = (double)(a8 - (a9 >> 1));
      double v32 = (double)v23 - v21;
      double v33 = a5;
      double v30 = a3;
LABEL_12:
      return sub_10008B3EC(0, v31, v32, v33, v20, v30, v22);
    case 4:
      double v25 = a5;
      double v26 = a6 - a5;
      double v20 = (double)v23 - v21;
LABEL_16:
      double v35 = a3;
      goto LABEL_17;
    case 5:
      if (!v10) {
        return 0;
      }
      double v35 = 1573.374;
      double v22 = 4.092;
      double v25 = a5;
      double v26 = a6 - a5;
      double v20 = (double)v23 - v21;
      goto LABEL_17;
    case 6:
      if (!v10) {
        return 0;
      }
      double v35 = 1573.374;
      double v22 = 4.092;
      double v25 = (double)(a8 - (a9 >> 1));
      double v26 = (double)v23 - v21;
      double v21 = a5;
LABEL_17:
      return sub_10008B494(0, v25, v26, v21, v20, v35, v22);
    case 8:
      return sub_10008B574(0, a5, a6 - a5, v21, (double)v23 - v21, a3, v22);
    case 9:
      double v36 = v20 + a5 + v20 + a5 - (a5 + a5);
      if (a5 + a5 >= v21) {
        double v28 = a5 + a5;
      }
      else {
        double v28 = (double)(a8 - (a9 >> 1));
      }
      double v29 = a5 + a5 + v36;
LABEL_31:
      if (v29 >= v24 + v21) {
        double v29 = v24 + v21;
      }
      return v28 < v29;
    case 10:
      double v38 = v21 * 0.5;
      double v39 = (v24 + v21) * 0.5;
      goto LABEL_36;
    case 11:
      double v38 = v21 / 3.0;
      double v39 = (v24 + v21) / 3.0;
LABEL_36:
      double v40 = v39 - v38;
      if (v38 >= a3) {
        double v41 = v38;
      }
      else {
        double v41 = a3;
      }
      double v42 = v38 + v40;
      goto LABEL_54;
    case 12:
      if (self->_cellFrequencyLimitForOOB <= a5) {
        return 0;
      }
      goto LABEL_43;
    case 13:
      if (self->_cellFrequencyLimitForOOB >= a6) {
        return 0;
      }
LABEL_43:
      BOOL result = 0;
      if (!v13 || v20 <= self->_cellBandwidthLimitForOOB) {
        return result;
      }
      wifiChannelsToAvoidForCellOOB = self->_wifiChannelsToAvoidForCellOOB;
      if (!wifiChannelsToAvoidForCellOOB) {
        return 0;
      }
      double v44 = +[NSNumber numberWithInt:v13];
      BOOL result = [(NSArray *)wifiChannelsToAvoidForCellOOB containsObject:v44];
      break;
    case 14:
      double v45 = v21 + v21;
      double v46 = v24 + v21 + v24 + v21 - (v21 + v21);
      if (v21 + v21 >= a3) {
        double v41 = v21 + v21;
      }
      else {
        double v41 = a3;
      }
      double v42 = v45 + v46;
LABEL_54:
      if (v42 >= v22 + a3) {
        double v42 = v22 + a3;
      }
      return v41 < v42;
    default:
      +[WCM_Logging logLevel:0, @"WiFiEnh_: Power Limiting Constraint: WCM_WiFiCellCoexIssue(%p) has invalid _issueType(%d)", self, issueType message];
      return 0;
  }
  return result;
}

- (id)wifiChannelsAffectedByCellUlLowFreq:(double)a3 cellUlHighFreq:(double)a4 wifi5G:(BOOL)a5
{
  BOOL v5 = a5;
  +[WCM_Logging logLevel:4, @"V2BtimapDebug_ wifiChannelsAffectedByCellUlLowFreq gets called and self.issueType is %d", [(WCM_WiFiCellCoexIssue *)self issueType] message];
  if ([(WCM_WiFiCellCoexIssue *)self issueType]
    && [(WCM_WiFiCellCoexIssue *)self issueType] != 9
    && ([(WCM_WiFiCellCoexIssue *)self issueType] & 0xFFFFFFFE) != 0xC)
  {
    uint64_t v18 = 0;
    BOOL enableWifiChannelAvoidance = self->_enableWifiChannelAvoidance;
    goto LABEL_25;
  }
  if (!self->_enableWifiChannelAvoidance)
  {
    BOOL enableWifiChannelAvoidance = 0;
    uint64_t v18 = 1;
LABEL_25:
    +[WCM_Logging logLevel:4, @"V2BtimapDebug_ isWiFiVictimIssue is %d, _enableWifiChannelAvoidance is %d, Thus return empty array.", v18, enableWifiChannelAvoidance message];
    return &__NSArray0__struct;
  }
  double v9 = a4 - a3;
  double v10 = 80.0;
  if (v5) {
    double v10 = 675.0;
  }
  double v11 = 2402.0;
  if (v5) {
    double v11 = 5160.0;
  }
  uint64_t issueType = self->_issueType;
  if ((int)issueType > 11)
  {
    if (issueType == 12)
    {
      if (self->_cellFrequencyLimitForOOB <= a3) {
        return &__NSArray0__struct;
      }
    }
    else
    {
      if (issueType != 13) {
        goto LABEL_27;
      }
      if (self->_cellFrequencyLimitForOOB >= a4) {
        return &__NSArray0__struct;
      }
    }
    if (v9 > self->_cellBandwidthLimitForOOB) {
      return self->_wifiChannelsToAvoidForCellOOB;
    }
    return &__NSArray0__struct;
  }
  if (!issueType)
  {
    double v13 = a3 * 3.0;
    double v14 = (v9 + a3) * 3.0 - a3 * 3.0;
    if (a3 * 3.0 >= v11) {
      double v21 = a3 * 3.0;
    }
    else {
      double v21 = v11;
    }
    double v22 = v11 + v10;
    if (v13 + v14 < v22) {
      double v22 = v13 + v14;
    }
    if (v21 < v22)
    {
      +[WCM_Logging logLevel:4, @"3 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)", *(void *)&a3, *(void *)&a4, a3 * 3.0, v13 + v14 message];
      goto LABEL_36;
    }
    return &__NSArray0__struct;
  }
  if (issueType != 9)
  {
LABEL_27:
    if (issueType <= 0xE) {
      double v20 = off_10020F988[issueType];
    }
    else {
      double v20 = "<ISSUE_TYPE_INVALID>";
    }
    +[WCM_Logging logLevel:0, @"%s is not considered for WiFi channels to enable WCI2", v20, v23 message];
    return &__NSArray0__struct;
  }
  double v13 = a3 + a3;
  double v14 = v9 + a3 + v9 + a3 - (a3 + a3);
  if (a3 + a3 >= v11) {
    double v15 = a3 + a3;
  }
  else {
    double v15 = v11;
  }
  double v16 = v11 + v10;
  if (v13 + v14 < v16) {
    double v16 = v13 + v14;
  }
  if (v15 >= v16) {
    return &__NSArray0__struct;
  }
  +[WCM_Logging logLevel:4, @"2 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)", *(void *)&a3, *(void *)&a4, a3 + a3, v13 + v14 message];
LABEL_36:

  return sub_10008C60C(0, v13, v14);
}

- (id)wiFiEnhChannelsAffectedByCellUlLowFreq:(double)a3 cellUlHighFreq:(double)a4
{
  +[WCM_Logging logLevel:4, @"WiFiEnhBitmap_ wiFiEnhChannelsAffectedByCellUlLowFreq gets called and self.issueType is %d", [(WCM_WiFiCellCoexIssue *)self issueType] message];
  if ([(WCM_WiFiCellCoexIssue *)self issueType]
    && [(WCM_WiFiCellCoexIssue *)self issueType] != 9
    && ([(WCM_WiFiCellCoexIssue *)self issueType] & 0xFFFFFFFE) != 0xC)
  {
    uint64_t v13 = 0;
    BOOL enableWifiChannelAvoidance = self->_enableWifiChannelAvoidance;
    goto LABEL_19;
  }
  if (!self->_enableWifiChannelAvoidance)
  {
    BOOL enableWifiChannelAvoidance = 0;
    uint64_t v13 = 1;
LABEL_19:
    +[WCM_Logging logLevel:4, @"WiFiEnhBitmap_ isWiFiVictimIssue is %d, _enableWifiChannelAvoidance is %d, Thus return empty array.", v13, enableWifiChannelAvoidance message];
    return &__NSArray0__struct;
  }
  double v7 = a4 - a3;
  uint64_t issueType = self->_issueType;
  if ((int)issueType > 11)
  {
    if (issueType == 12)
    {
      if (self->_cellFrequencyLimitForOOB <= a3) {
        return &__NSArray0__struct;
      }
    }
    else
    {
      if (issueType != 13) {
        goto LABEL_21;
      }
      if (self->_cellFrequencyLimitForOOB >= a4) {
        return &__NSArray0__struct;
      }
    }
    if (v7 > self->_cellBandwidthLimitForOOB) {
      return self->_wifiChannelsToAvoidForCellOOB;
    }
    return &__NSArray0__struct;
  }
  if (!issueType)
  {
    double v9 = a3 * 3.0;
    double v10 = (v7 + a3) * 3.0 - a3 * 3.0;
    if (a3 * 3.0 >= 5945.0) {
      double v16 = a3 * 3.0;
    }
    else {
      double v16 = 5945.0;
    }
    if (v16 < fmin(v9 + v10, 7125.0))
    {
      +[WCM_Logging logLevel:4, @"WiFiEnhBitmap_: 3 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)", *(void *)&a3, *(void *)&a4, a3 * 3.0, v9 + v10 message];
      goto LABEL_28;
    }
    return &__NSArray0__struct;
  }
  if (issueType != 9)
  {
LABEL_21:
    if (issueType <= 0xE) {
      double v15 = off_10020F988[issueType];
    }
    else {
      double v15 = "<ISSUE_TYPE_INVALID>";
    }
    +[WCM_Logging logLevel:0, @"WiFiEnhBitmap_: %s is not considered for WiFi channels to enable WCI2", v15, v17 message];
    return &__NSArray0__struct;
  }
  double v9 = a3 + a3;
  double v10 = v7 + a3 + v7 + a3 - (a3 + a3);
  if (a3 + a3 >= 5945.0) {
    double v11 = a3 + a3;
  }
  else {
    double v11 = 5945.0;
  }
  if (v11 >= fmin(v9 + v10, 7125.0)) {
    return &__NSArray0__struct;
  }
  +[WCM_Logging logLevel:4, @"WiFiEnhBitmap_: 2 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)", *(void *)&a3, *(void *)&a4, a3 + a3, v9 + v10 message];
LABEL_28:

  return sub_10008C7C0(v9, v10);
}

- (id)wifiOclChannelsAffectedByCellUlLowFreq:(double)a3 cellUlHighFreq:(double)a4 isWifi5G:(BOOL)a5
{
  BOOL v5 = a5;
  +[WCM_Logging logLevel:4, @"V2BtimapDebug_ wifiOclChannelsAffectedByCellUlLowFreq gets called and self.issueType is %d", [(WCM_WiFiCellCoexIssue *)self issueType] message];
  if ([(WCM_WiFiCellCoexIssue *)self issueType]
    && [(WCM_WiFiCellCoexIssue *)self issueType] != 9
    && ([(WCM_WiFiCellCoexIssue *)self issueType] & 0xFFFFFFFE) != 0xC)
  {
    uint64_t v18 = 0;
    BOOL enableWifiChannelAvoidance = self->_enableWifiChannelAvoidance;
    goto LABEL_25;
  }
  if (!self->_enableWifiChannelAvoidance)
  {
    BOOL enableWifiChannelAvoidance = 0;
    uint64_t v18 = 1;
LABEL_25:
    +[WCM_Logging logLevel:4, @"V2BtimapDebug_ isWiFiVictimIssue is %d, _enableWifiChannelAvoidance is %d, Thus return empty array.", v18, enableWifiChannelAvoidance message];
    return &__NSArray0__struct;
  }
  double v9 = a4 - a3;
  double v10 = 80.0;
  if (v5) {
    double v10 = 675.0;
  }
  double v11 = 2402.0;
  if (v5) {
    double v11 = 5160.0;
  }
  uint64_t issueType = self->_issueType;
  if ((int)issueType > 11)
  {
    if (issueType == 12)
    {
      if (self->_cellFrequencyLimitForOOB <= a3) {
        return &__NSArray0__struct;
      }
    }
    else
    {
      if (issueType != 13) {
        goto LABEL_27;
      }
      if (self->_cellFrequencyLimitForOOB >= a4) {
        return &__NSArray0__struct;
      }
    }
    if (v9 > self->_cellBandwidthLimitForOOB) {
      return self->_wifiChannelsToAvoidForOCL;
    }
    return &__NSArray0__struct;
  }
  if (!issueType)
  {
    double v13 = a3 * 3.0;
    double v14 = (v9 + a3) * 3.0 - a3 * 3.0;
    if (a3 * 3.0 >= v11) {
      double v21 = a3 * 3.0;
    }
    else {
      double v21 = v11;
    }
    double v22 = v11 + v10;
    if (v13 + v14 < v22) {
      double v22 = v13 + v14;
    }
    if (v21 < v22)
    {
      +[WCM_Logging logLevel:4, @"3 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)", *(void *)&a3, *(void *)&a4, a3 * 3.0, v13 + v14 message];
      goto LABEL_36;
    }
    return &__NSArray0__struct;
  }
  if (issueType != 9)
  {
LABEL_27:
    if (issueType <= 0xE) {
      double v20 = off_10020F988[issueType];
    }
    else {
      double v20 = "<ISSUE_TYPE_INVALID>";
    }
    +[WCM_Logging logLevel:0, @"%s is not considered for WiFi channels to enable WCI2", v20, v23 message];
    return &__NSArray0__struct;
  }
  double v13 = a3 + a3;
  double v14 = v9 + a3 + v9 + a3 - (a3 + a3);
  if (a3 + a3 >= v11) {
    double v15 = a3 + a3;
  }
  else {
    double v15 = v11;
  }
  double v16 = v11 + v10;
  if (v13 + v14 < v16) {
    double v16 = v13 + v14;
  }
  if (v15 >= v16) {
    return &__NSArray0__struct;
  }
  +[WCM_Logging logLevel:4, @"2 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)", *(void *)&a3, *(void *)&a4, a3 + a3, v13 + v14 message];
LABEL_36:

  return sub_10008C60C(0, v13, v14);
}

- (id)wiFiEnhOclChannelsAffectedByCellUlLowFreq:(double)a3 cellUlHighFreq:(double)a4
{
  +[WCM_Logging logLevel:4, @"WiFiEnhBitmap_ wiFiEnhChannelsAffectedByCellUlLowFreq gets called and self.issueType is %d", [(WCM_WiFiCellCoexIssue *)self issueType] message];
  if ([(WCM_WiFiCellCoexIssue *)self issueType]
    && [(WCM_WiFiCellCoexIssue *)self issueType] != 9
    && ([(WCM_WiFiCellCoexIssue *)self issueType] & 0xFFFFFFFE) != 0xC)
  {
    uint64_t v13 = 0;
    BOOL enableWifiChannelAvoidance = self->_enableWifiChannelAvoidance;
    goto LABEL_19;
  }
  if (!self->_enableWifiChannelAvoidance)
  {
    BOOL enableWifiChannelAvoidance = 0;
    uint64_t v13 = 1;
LABEL_19:
    +[WCM_Logging logLevel:4, @"WiFiEnhBitmap_ isWiFiVictimIssue is %d, _enableWifiChannelAvoidance is %d, Thus return empty array.", v13, enableWifiChannelAvoidance message];
    return &__NSArray0__struct;
  }
  double v7 = a4 - a3;
  uint64_t issueType = self->_issueType;
  if ((int)issueType > 11)
  {
    if (issueType == 12)
    {
      if (self->_cellFrequencyLimitForOOB <= a3) {
        return &__NSArray0__struct;
      }
    }
    else
    {
      if (issueType != 13) {
        goto LABEL_21;
      }
      if (self->_cellFrequencyLimitForOOB >= a4) {
        return &__NSArray0__struct;
      }
    }
    if (v7 > self->_cellBandwidthLimitForOOB) {
      return self->_wifiChannelsToAvoidForOCL;
    }
    return &__NSArray0__struct;
  }
  if (!issueType)
  {
    double v9 = a3 * 3.0;
    double v10 = (v7 + a3) * 3.0 - a3 * 3.0;
    if (a3 * 3.0 >= 5945.0) {
      double v16 = a3 * 3.0;
    }
    else {
      double v16 = 5945.0;
    }
    if (v16 < fmin(v9 + v10, 7125.0))
    {
      +[WCM_Logging logLevel:4, @"WiFiEnhBitmap_: 3 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)", *(void *)&a3, *(void *)&a4, a3 * 3.0, v9 + v10 message];
      goto LABEL_28;
    }
    return &__NSArray0__struct;
  }
  if (issueType != 9)
  {
LABEL_21:
    if (issueType <= 0xE) {
      double v15 = off_10020F988[issueType];
    }
    else {
      double v15 = "<ISSUE_TYPE_INVALID>";
    }
    +[WCM_Logging logLevel:0, @"WiFiEnhBitmap_: %s is not considered for WiFi channels to enable WCI2", v15, v17 message];
    return &__NSArray0__struct;
  }
  double v9 = a3 + a3;
  double v10 = v7 + a3 + v7 + a3 - (a3 + a3);
  if (a3 + a3 >= 5945.0) {
    double v11 = a3 + a3;
  }
  else {
    double v11 = 5945.0;
  }
  if (v11 >= fmin(v9 + v10, 7125.0)) {
    return &__NSArray0__struct;
  }
  +[WCM_Logging logLevel:4, @"WiFiEnhBitmap_: 2 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)", *(void *)&a3, *(void *)&a4, a3 + a3, v9 + v10 message];
LABEL_28:

  return sub_10008C7C0(v9, v10);
}

- (id)wifi5GHzChannelsAffectedByNR79UlLowFreq:(double)a3 cellUlHighFreq:(double)a4
{
  if (([(WCM_WiFiCellCoexIssue *)self issueType] & 0xFFFFFFFE) == 0xC
    && self->_enableWifiChannelAvoidance
    && self->_issueType == 13
    && self->_cellFrequencyLimitForOOB < a4
    && a4 - a3 > self->_cellBandwidthLimitForOOB)
  {
    return self->_wifiChannelsToAvoidForCellOOB;
  }
  else
  {
    return &__NSArray0__struct;
  }
}

- (id)wifiChannelsIMD3ByCellDlLowFreq:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6 wifi5G:(BOOL)a7
{
  double v12 = a6 - a5;
  double v13 = a4 - a3;
  if (a7) {
    double v14 = 5160.0;
  }
  else {
    double v14 = 2402.0;
  }
  if (a7) {
    double v15 = 675.0;
  }
  else {
    double v15 = 80.0;
  }
  id v16 = +[NSMutableArray array];
  if (sub_10008B494(0, a5, v12, v14, v15, a3, v13))
  {
    double v17 = -(a4 - a5 * 2.0);
    double v18 = -(a3 - a6 * 2.0) - v17 - (a4 - a5 * 2.0);
    +[WCM_Logging logLevel:4, @"TYPE7_2GWIFI_SUPPORT_: 2 x CellTx(%lf~%lf) - WifiTx(%lf~%lf) = CellRx(%lf~%lf)", *(void *)&a5, *(void *)&a6, *(void *)&v17, *(void *)&v18, *(void *)&a3, *(void *)&a4 message];
    if (a7)
    {
      for (uint64_t i = 0; i != 138; i += 3)
      {
        int v20 = word_1001E9F90[i + 1];
        double v21 = (double)word_1001E9F90[i + 2];
        double v22 = (double)v20 + v21 * -0.5;
        if (v22 >= v17) {
          double v23 = (double)v20 + v21 * -0.5;
        }
        else {
          double v23 = -(a4 - a5 * 2.0);
        }
        double v24 = v22 + v21;
        if (v24 >= v18) {
          double v24 = -(a3 - a6 * 2.0) - v17 - (a4 - a5 * 2.0);
        }
        if (v23 < v24) {
          [v16 addObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", word_1001E9F90[i])]];
        }
      }
    }
    else
    {
      uint64_t v25 = 1;
      for (int j = 2402; j != 2467; j += 5)
      {
        if (v17 <= (double)j) {
          double v27 = (double)j;
        }
        else {
          double v27 = -(a4 - a5 * 2.0);
        }
        double v28 = (double)j + 20.0;
        if (v28 >= v18) {
          double v28 = -(a3 - a6 * 2.0) - v17 - (a4 - a5 * 2.0);
        }
        if (v27 < v28) {
          [v16 addObject:[NSNumber numberWithInt:v25]];
        }
        uint64_t v25 = (v25 + 1);
      }
    }
  }
  else
  {
    +[WCM_Logging logLevel:4 message:@"TYPE7_2GWIFI_SUPPORT_: No IMD3 issue detected after calculation. Returning empty channel array."];
    return &__NSArray0__struct;
  }
  return v16;
}

- (id)getAllBtChannelsInBandForBtHighFreq:(double)a3 btLowFreq:(double)a4
{
  if (a3 > 5250.0 || a4 < 5150.0)
  {
    if (a3 > 5850.0 || a4 < 5725.0)
    {
      if ((a3 > 6050.0 || a4 < 5925.0) && (a3 > 6175.0 || a4 < 6051.0) && (a3 > 6300.0 || a4 < 6176.0))
      {
        if (a3 > 6425.0 || (a3 = 6301.0, a4 < 6301.0))
        {
          +[WCM_Logging logLevel:0, @"Unknown BT band range", a3, a4 message];
          objc_exception_throw(NSInternalInconsistencyException);
        }
      }
      unsigned int v4 = 125;
    }
    else
    {
      unsigned int v4 = 126;
    }
  }
  else
  {
    unsigned int v4 = 101;
  }
  BOOL v5 = +[NSMutableArray arrayWithCapacity:v4];
  uint64_t v6 = 0;
  do
  {
    [(NSMutableArray *)v5 addObject:+[NSNumber numberWithInt:v6]];
    uint64_t v6 = (v6 + 1);
  }
  while (v4 != v6);
  return v5;
}

- (id)HFBTChannelsToAvoidForCellUlLowFreq:(double)a3 cellUlHighFreq:(double)a4 cellDlLowFreq:(double)a5 cellDlHighFreq:(double)a6 btBandLowFreq:(double)a7 btBandHighFreq:(double)a8 gpsRadioActive:(BOOL)a9
{
  uint64_t issueType = self->_issueType;
  double v17 = a4 - a3;
  double v18 = a6 - a5;
  double v19 = a7 + -0.5;
  double v20 = a8 + 0.5 - (a7 + -0.5);
  switch((int)issueType)
  {
    case 0:
      double v21 = a3 * 3.0;
      double v22 = (v17 + a3) * 3.0 - a3 * 3.0;
      if (a3 * 3.0 >= v19) {
        double v23 = a3 * 3.0;
      }
      else {
        double v23 = a7 + -0.5;
      }
      double v24 = v19 + v20;
      if (v21 + v22 < v24) {
        double v24 = v21 + v22;
      }
      if (v23 >= v24) {
        goto LABEL_75;
      }
      +[WCM_Logging logLevel:4, @"3 x CellTx(%lf~%lf) = BTRx(%lf~%lf)", *(void *)&a3, *(void *)&a4, a3 * 3.0, v21 + v22, v41, v42 message];
      goto LABEL_58;
    case 1:
      if (!sub_10008B494(0, a7 + -0.5, a8 + 0.5 - (a7 + -0.5), a3, v17, a5, v18)) {
        goto LABEL_75;
      }
      double v26 = (a3 + a5) * 0.5;
      double v27 = (a4 + a6) * 0.5 - v26;
      +[WCM_Logging logLevel:4, @"2 x BTTx(%lf~%lf) - CellTx(%lf~%lf) = CellRx(%lf~%lf)", *(void *)&v26, v26 + v27, *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6 message];
      goto LABEL_61;
    case 2:
      if (!a9 || !sub_10008B3EC(0, a7 + -0.5, a8 + 0.5 - (a7 + -0.5), a3, v17, 1573.374, 4.092)) {
        goto LABEL_75;
      }
      double v21 = a3 + 1573.374;
      double v22 = a4 + 1577.466 - (a3 + 1573.374);
      +[WCM_Logging logLevel:4, @"BTTx(%lf~%lf) - CellTx(%lf~%lf) = GpsRx(%lf~%lf)", a3 + 1573.374, a3 + 1573.374 + v22, *(void *)&a3, *(void *)&a4, 0x4098957EF9DB22D1, 0x4098A5DD2F1A9FBFLL message];
      goto LABEL_58;
    case 3:
      if (!sub_10008B3EC(0, a7 + -0.5, a8 + 0.5 - (a7 + -0.5), a3, v17, a5, v18)) {
        goto LABEL_75;
      }
      double v26 = a3 + a5;
      double v27 = a4 + a6 - (a3 + a5);
      +[WCM_Logging logLevel:4, @"BTTx(%lf~%lf) - CellTx(%lf~%lf) = CellRx(%lf~%lf)", a3 + a5, a3 + a5 + v27, *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6 message];
      goto LABEL_61;
    case 4:
      if (!sub_10008B494(0, a3, v17, v19, v20, a5, v18)) {
        goto LABEL_75;
      }
      double v26 = -(a6 - a3 * 2.0);
      double v27 = -(a5 - a4 * 2.0) - v26;
      +[WCM_Logging logLevel:4, @"2 x CellTx(%lf~%lf) - BTTx(%lf~%lf) = CellRx(%lf~%lf)", *(void *)&a3, *(void *)&a4, *(void *)&v26, v27 - (a6 - a3 * 2.0), *(void *)&a5, *(void *)&a6 message];
      goto LABEL_61;
    case 5:
      if (!a9 || !sub_10008B494(0, a3, v17, v19, v20, 1573.374, 4.092)) {
        goto LABEL_75;
      }
      double v21 = a3 * 2.0 + -1577.466;
      double v22 = a4 * 2.0 + -1573.374 - v21;
      +[WCM_Logging logLevel:4, @"2 x CellTx(%lf~%lf) - BTTx(%lf~%lf) = GpsRx(%lf~%lf)", *(void *)&a3, *(void *)&a4, *(void *)&v21, v21 + v22, 0x4098957EF9DB22D1, 0x4098A5DD2F1A9FBFLL message];
      goto LABEL_58;
    case 6:
      if (!a9 || !sub_10008B494(0, a7 + -0.5, a8 + 0.5 - (a7 + -0.5), a3, v17, 1573.374, 4.092)) {
        goto LABEL_75;
      }
      double v21 = a3 * 2.0 + 1573.374;
      double v22 = a4 * 2.0 + 1577.466 - v21;
      +[WCM_Logging logLevel:4, @"BTTx(%lf~%lf) - 2 x CellTx(%lf~%lf) = GpsRx(%lf~%lf)", *(void *)&v21, v21 + v22, *(void *)&a3, *(void *)&a4, 0x4098957EF9DB22D1, 0x4098A5DD2F1A9FBFLL message];
      goto LABEL_58;
    case 7:
      if (!sub_10008B494(0, a7 + -0.5, a8 + 0.5 - (a7 + -0.5), a3, v17, a5, v18)) {
        goto LABEL_75;
      }
      double v26 = a5 + a3 * 2.0;
      double v27 = a6 + a4 * 2.0 - v26;
      +[WCM_Logging logLevel:4, @"BTTx(%lf~%lf) - 2 x CellTx(%lf~%lf) = CellRx(%lf~%lf)", *(void *)&v26, v26 + v27, *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6 message];
      goto LABEL_61;
    case 8:
      if (!sub_10008B574(0, a3, v17, v19, v20, a5, v18)) {
        goto LABEL_75;
      }
      double v26 = -(a6 - a3 * 4.0);
      double v27 = -(a5 - a4 * 4.0) - v26;
      +[WCM_Logging logLevel:4, @"4 x CellTx(%lf~%lf) - BTTx(%lf~%lf) = CellRx(%lf~%lf)", *(void *)&a3, *(void *)&a4, *(void *)&v26, v27 - (a6 - a3 * 4.0), *(void *)&a5, *(void *)&a6 message];
LABEL_61:
      double v36 = v26;
      double v37 = v27;
      goto LABEL_70;
    case 9:
      double v21 = a3 + a3;
      double v22 = v17 + a3 + v17 + a3 - (a3 + a3);
      if (a3 + a3 >= v19) {
        double v28 = a3 + a3;
      }
      else {
        double v28 = a7 + -0.5;
      }
      double v29 = v19 + v20;
      if (v21 + v22 < v29) {
        double v29 = v21 + v22;
      }
      if (v28 >= v29) {
        goto LABEL_75;
      }
      +[WCM_Logging logLevel:4, @"2 x CellTx(%lf~%lf) = BTRx(%lf~%lf)", *(void *)&a3, *(void *)&a4, a3 + a3, v21 + v22, v41, v42 message];
LABEL_58:
      double v36 = v21;
      double v37 = v22;
      goto LABEL_70;
    case 10:
      double v30 = v19 * 0.5;
      double v31 = (v19 + v20) * 0.5 - v19 * 0.5;
      if (v19 * 0.5 >= a5) {
        double v38 = v19 * 0.5;
      }
      else {
        double v38 = a5;
      }
      double v39 = v18 + a5;
      if (v30 + v31 < v18 + a5) {
        double v39 = v30 + v31;
      }
      if (v38 >= v39) {
        goto LABEL_75;
      }
      +[WCM_Logging logLevel:4, @"BTTx(%lf~%lf) / 2 = CellRx(%lf~%lf)", *(void *)&v30, v30 + v31, *(void *)&a5, *(void *)&a6 message];
      goto LABEL_69;
    case 11:
      double v30 = v19 / 3.0;
      double v31 = (v19 + v20) / 3.0 - v19 / 3.0;
      if (v19 / 3.0 >= a5) {
        double v32 = v19 / 3.0;
      }
      else {
        double v32 = a5;
      }
      double v33 = v18 + a5;
      if (v30 + v31 < v18 + a5) {
        double v33 = v30 + v31;
      }
      if (v32 >= v33) {
        goto LABEL_75;
      }
      +[WCM_Logging logLevel:4, @"BTTx(%lf~%lf) / 3 = CellRx(%lf~%lf)", *(void *)&v30, v30 + v31, *(void *)&a5, *(void *)&a6 message];
      goto LABEL_69;
    case 12:
      if (!objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton", a9), "activeCoexFeatures"), "containsObject:", @"HFBTOOBMASKING")|| self->_cellFrequencyLimitForOOB <= a3)
      {
        goto LABEL_75;
      }
      goto LABEL_44;
    case 13:
      if (!objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton", a9), "activeCoexFeatures"), "containsObject:", @"HFBTOOBMASKING")|| self->_cellFrequencyLimitForOOB >= a4)
      {
        goto LABEL_75;
      }
LABEL_44:
      if (v17 <= self->_cellBandwidthLimitForOOB)
      {
LABEL_75:
        id result = &__NSArray0__struct;
      }
      else
      {
        id result = [(WCM_WiFiCellCoexIssue *)self getAllBtChannelsInBandForBtHighFreq:a8 btLowFreq:a7];
      }
      break;
    case 14:
      double v30 = v19 + v19;
      double v31 = v19 + v20 + v19 + v20 - (v19 + v19);
      if (v19 + v19 >= a5) {
        double v34 = v19 + v19;
      }
      else {
        double v34 = a5;
      }
      double v35 = v18 + a5;
      if (v30 + v31 < v18 + a5) {
        double v35 = v30 + v31;
      }
      if (v34 >= v35) {
        goto LABEL_75;
      }
      +[WCM_Logging logLevel:4, @"(2 x BTTx)(i.e. %lf~%lf) = CellRx(%lf~%lf)", *(void *)&v30, v30 + v31, *(void *)&a5, *(void *)&a6 message];
LABEL_69:
      double v36 = v30;
      double v37 = v31;
LABEL_70:
      id result = sub_10008CA68(v36, v37, a7, a8);
      break;
    default:
      if (issueType <= 0xE) {
        uint64_t v25 = off_10020F988[issueType];
      }
      else {
        uint64_t v25 = "<ISSUE_TYPE_INVALID>";
      }
      +[WCM_Logging logLevel:0, @"%s is not applicable for BT channel blocklisting", v25 message];
      goto LABEL_75;
  }
  return result;
}

- (id)HFBTAntBlkBandsForCellUlLowFreq:(double)a3 cellUlHighFreq:(double)a4
{
  id v7 = [&off_100254A60 mutableCopy];
  int issueType = self->_issueType;
  if (issueType == 13)
  {
    if ((objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"HFBTOOBMASKING") & 1) != 0|| self->_cellFrequencyLimitForOOB >= a4)
    {
      return v7;
    }
  }
  else if (issueType != 12 {
         || (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"HFBTOOBMASKING") & 1) != 0|| self->_cellFrequencyLimitForOOB <= a3)
  }
  {
    return v7;
  }
  if (a4 - a3 > self->_cellBandwidthLimitForOOB && self->_wifiChannelsToAvoidForCellOOB)
  {
    [v7 setObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_HFBTAntBlkBandUnii1Enabled, a4 - a3)] forKeyedSubscript:@"AntBlkBandUnii1Enabled"];
    [v7 setObject:+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_HFBTAntBlkBandUnii3Enabled) forKeyedSubscript:@"AntBlkBandUnii3Enabled"];
    [v7 setObject:+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_HFBTAntBlkBandUnii5aEnabled) forKeyedSubscript:@"AntBlkBandUnii5aEnabled"];
    [v7 setObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_HFBTAntBlkBandUnii5bEnabled)] forKeyedSubscript:@"AntBlkBandUnii5bEnabled"];
    [v7 setObject:+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_HFBTAntBlkBandUnii5cEnabled) forKeyedSubscript:@"AntBlkBandUnii5cEnabled"];
    [v7 setObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_HFBTAntBlkBandUnii5dEnabled)] forKeyedSubscript:@"AntBlkBandUnii5dEnabled"];
  }
  return v7;
}

- (id)btChannelsToAvoidForCellUlLowFreq:(double)a3 cellUlHighFreq:(double)a4 gpsRadioActive:(BOOL)a5
{
  double v7 = a4 - a3;
  uint64_t issueType = self->_issueType;
  if ((int)issueType <= 11)
  {
    if (!issueType)
    {
      double v9 = a3 * 3.0;
      double v10 = (v7 + a3) * 3.0 - a3 * 3.0;
      if (a3 * 3.0 >= 2401.5) {
        double v13 = a3 * 3.0;
      }
      else {
        double v13 = 2401.5;
      }
      if (v13 < fmin(v9 + v10, 2480.5))
      {
        +[WCM_Logging logLevel:4, @"3 x CellTx(%lf~%lf) = BTRx(%lf~%lf)", *(void *)&a3, *(void *)&a4, a3 * 3.0, v9 + v10, v19, v20 message];
        goto LABEL_18;
      }
      return &__NSArray0__struct;
    }
    if (issueType == 2)
    {
      if (a5 && sub_10008B3EC(0, 2401.5, 79.0, a3, v7, 1573.374, 4.092))
      {
        double v9 = a3 + 1573.374;
        double v10 = a4 + 1577.466 - (a3 + 1573.374);
        +[WCM_Logging logLevel:4, @"BTTx(%lf~%lf) - CellTx(%lf~%lf) = GpsRx(%lf~%lf)", a3 + 1573.374, a3 + 1573.374 + v10, *(void *)&a3, *(void *)&a4, 0x4098957EF9DB22D1, 0x4098A5DD2F1A9FBFLL message];
LABEL_18:
        return sub_10008C9A8(v9, v10);
      }
      return &__NSArray0__struct;
    }
LABEL_11:
    if (issueType <= 0xE) {
      double v12 = off_10020F988[issueType];
    }
    else {
      double v12 = "<ISSUE_TYPE_INVALID>";
    }
    +[WCM_Logging logLevel:0, @"%s is not applicable for BT channel blocklisting", v12 message];
    return &__NSArray0__struct;
  }
  if (issueType == 12)
  {
    if (self->_cellFrequencyLimitForOOB <= a3) {
      return &__NSArray0__struct;
    }
  }
  else
  {
    if (issueType != 13) {
      goto LABEL_11;
    }
    if (self->_cellFrequencyLimitForOOB >= a4) {
      return &__NSArray0__struct;
    }
  }
  if (v7 <= self->_cellBandwidthLimitForOOB) {
    return &__NSArray0__struct;
  }
  wifiChannelsToAvoidForCellOOB = self->_wifiChannelsToAvoidForCellOOB;
  if (!wifiChannelsToAvoidForCellOOB) {
    return &__NSArray0__struct;
  }
  id v16 = (char *)[(NSArray *)wifiChannelsToAvoidForCellOOB count] - 1;
  id v17 = [[-[NSArray objectAtIndex:](self->_wifiChannelsToAvoidForCellOOB, "objectAtIndex:", 0) intValue];
  id v18 = [[-[NSArray objectAtIndex:](self->_wifiChannelsToAvoidForCellOOB, "objectAtIndex:", v16) intValue];
  +[WCM_Logging logLevel:4, @"BT channels corresponding to WiFi channels %d ~ %d", v17, v18 message];

  return sub_10008CB68((uint64_t)v17, (uint64_t)v18);
}

- (id)btDiversityChannelsToAvoidForCellBTAntennaCombination:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 gpsRadioActive:(BOOL)a8
{
  uint64_t issueType = self->_issueType;
  double v13 = a7 - a6;
  double v14 = a5 - a4;
  switch((int)issueType)
  {
    case 0:
      double v15 = a6 * 3.0;
      double v16 = (v13 + a6) * 3.0 - a6 * 3.0;
      if (a6 * 3.0 >= 2401.5) {
        double v17 = a6 * 3.0;
      }
      else {
        double v17 = 2401.5;
      }
      if (v17 >= fmin(v15 + v16, 2480.5)) {
        return &__NSArray0__struct;
      }
      +[WCM_Logging logLevel:4, @"3 x CellTx(%lf~%lf) = BTRx(%lf~%lf)", *(void *)&a6, *(void *)&a7, a6 * 3.0, v15 + v16, v29, v30 message];
      goto LABEL_41;
    case 1:
      if (!sub_10008B494(0, 2401.5, 79.0, a6, v13, a4, v14)) {
        return &__NSArray0__struct;
      }
      double v18 = (a4 + a6) * 0.5;
      double v19 = (a5 + a7) * 0.5 - v18;
      +[WCM_Logging logLevel:4, @"2 x BTTx(%lf~%lf) - CellTx(%lf~%lf) = CellRx(%lf~%lf)", *(void *)&v18, v18 + v19, *(void *)&a6, *(void *)&a7, *(void *)&a4, *(void *)&a5 message];
      goto LABEL_44;
    case 2:
      if (!a8 || !sub_10008B3EC(0, 2401.5, 79.0, a6, v13, 1573.374, 4.092)) {
        return &__NSArray0__struct;
      }
      double v15 = a6 + 1573.374;
      double v16 = a7 + 1577.466 - (a6 + 1573.374);
      +[WCM_Logging logLevel:4, @"BTTx(%lf~%lf) - CellTx(%lf~%lf) = GpsRx(%lf~%lf)", a6 + 1573.374, a6 + 1573.374 + v16, *(void *)&a6, *(void *)&a7, 0x4098957EF9DB22D1, 0x4098A5DD2F1A9FBFLL message];
      goto LABEL_41;
    case 3:
      if (!sub_10008B3EC(0, 2401.5, 79.0, a6, v13, a4, v14)) {
        return &__NSArray0__struct;
      }
      double v18 = a4 + a6;
      double v19 = a5 + a7 - (a4 + a6);
      +[WCM_Logging logLevel:4, @"BTTx(%lf~%lf) - CellTx(%lf~%lf) = CellRx(%lf~%lf)", a4 + a6, a4 + a6 + v19, *(void *)&a6, *(void *)&a7, *(void *)&a4, *(void *)&a5 message];
      goto LABEL_44;
    case 4:
      if (!sub_10008B494(0, a6, v13, 2401.5, 79.0, a4, v14)) {
        return &__NSArray0__struct;
      }
      double v18 = -(a5 - a6 * 2.0);
      double v19 = -(a4 - a7 * 2.0) - v18;
      +[WCM_Logging logLevel:4, @"2 x CellTx(%lf~%lf) - BTTx(%lf~%lf) = CellRx(%lf~%lf)", *(void *)&a6, *(void *)&a7, *(void *)&v18, v19 - (a5 - a6 * 2.0), *(void *)&a4, *(void *)&a5 message];
      goto LABEL_44;
    case 5:
      if (!a8 || !sub_10008B494(0, a6, v13, 2401.5, 79.0, 1573.374, 4.092)) {
        return &__NSArray0__struct;
      }
      double v15 = a6 * 2.0 + -1577.466;
      double v16 = a7 * 2.0 + -1573.374 - v15;
      +[WCM_Logging logLevel:4, @"2 x CellTx(%lf~%lf) - BTTx(%lf~%lf) = GpsRx(%lf~%lf)", *(void *)&a6, *(void *)&a7, *(void *)&v15, v15 + v16, 0x4098957EF9DB22D1, 0x4098A5DD2F1A9FBFLL message];
      goto LABEL_41;
    case 6:
      if (!a8 || !sub_10008B494(0, 2401.5, 79.0, a6, v13, 1573.374, 4.092)) {
        return &__NSArray0__struct;
      }
      double v15 = a6 * 2.0 + 1573.374;
      double v16 = a7 * 2.0 + 1577.466 - v15;
      +[WCM_Logging logLevel:4, @"BTTx(%lf~%lf) - 2 x CellTx(%lf~%lf) = GpsRx(%lf~%lf)", *(void *)&v15, v15 + v16, *(void *)&a6, *(void *)&a7, 0x4098957EF9DB22D1, 0x4098A5DD2F1A9FBFLL message];
      goto LABEL_41;
    case 7:
      if (!sub_10008B494(0, 2401.5, 79.0, a6, v13, a4, v14)) {
        return &__NSArray0__struct;
      }
      double v18 = a4 + a6 * 2.0;
      double v19 = a5 + a7 * 2.0 - v18;
      +[WCM_Logging logLevel:4, @"BTTx(%lf~%lf) - 2 x CellTx(%lf~%lf) = CellRx(%lf~%lf)", *(void *)&v18, v18 + v19, *(void *)&a6, *(void *)&a7, *(void *)&a4, *(void *)&a5 message];
      goto LABEL_44;
    case 8:
      if (!sub_10008B574(0, a6, v13, 2401.5, 79.0, a4, v14)) {
        return &__NSArray0__struct;
      }
      double v18 = -(a5 - a6 * 4.0);
      double v19 = -(a4 - a7 * 4.0) - v18;
      +[WCM_Logging logLevel:4, @"4 x CellTx(%lf~%lf) - BTTx(%lf~%lf) = CellRx(%lf~%lf)", *(void *)&a6, *(void *)&a7, *(void *)&v18, v19 - (a5 - a6 * 4.0), *(void *)&a4, *(void *)&a5 message];
LABEL_44:
      double v25 = v18;
      double v24 = v19;
      goto LABEL_50;
    case 9:
      double v15 = a6 + a6;
      double v16 = v13 + a6 + v13 + a6 - (a6 + a6);
      if (a6 + a6 >= 2401.5) {
        double v20 = a6 + a6;
      }
      else {
        double v20 = 2401.5;
      }
      if (v20 >= fmin(v15 + v16, 2480.5)) {
        return &__NSArray0__struct;
      }
      +[WCM_Logging logLevel:4, @"2 x CellTx(%lf~%lf) = BTRx(%lf~%lf)", *(void *)&a6, *(void *)&a7, a6 + a6, v15 + v16, v29, v30 message];
LABEL_41:
      double v25 = v15;
      double v24 = v16;
      goto LABEL_50;
    case 10:
      uint64_t v21 = 0x4092C30000000000;
      double v26 = fmax(a4, 1200.75);
      double v27 = v14 + a4;
      if (v14 + a4 > 1240.25) {
        double v27 = 1240.25;
      }
      if (v26 >= v27) {
        return &__NSArray0__struct;
      }
      +[WCM_Logging logLevel:4, @"BTTx(%lf~%lf) / 2 = CellRx(%lf~%lf)", 0x4092C30000000000, 0x4093610000000000, *(void *)&a4, *(void *)&a5 message];
      double v24 = 39.5;
      goto LABEL_49;
    case 11:
      uint64_t v21 = 0x4089040000000000;
      double v22 = fmax(a4, 800.5);
      double v23 = v14 + a4;
      if (v14 + a4 > 826.833333) {
        double v23 = 826.833333;
      }
      if (v22 >= v23) {
        return &__NSArray0__struct;
      }
      +[WCM_Logging logLevel:4, @"BTTx(%lf~%lf) / 3 = CellRx(%lf~%lf)", 0x4089040000000000, 0x4089D6AAAAAAAAABLL, *(void *)&a4, *(void *)&a5 message];
      double v24 = 26.3333333;
LABEL_49:
      double v25 = *(double *)&v21;
LABEL_50:
      return sub_10008C9A8(v25, v24);
    case 12:
      if (self->_cellFrequencyLimitForOOB <= a6) {
        return &__NSArray0__struct;
      }
      goto LABEL_33;
    case 13:
      if (self->_cellFrequencyLimitForOOB >= a7) {
        return &__NSArray0__struct;
      }
LABEL_33:
      if (v13 <= self->_cellBandwidthLimitForOOB) {
        return &__NSArray0__struct;
      }
      return -[WCM_WiFiCellCoexIssue btChannelsToAvoidFor:](self, "btChannelsToAvoidFor:", *(void *)&a3, a8);
    default:
      +[WCM_Logging logLevel:0, @"WCM_WiFiCellCoexIssue(%p) has invalid _issueType(%d)", self, issueType message];
      return &__NSArray0__struct;
  }
}

- (id)wifiChannelsToAvoidForCellDlLowFreq:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6 wifi5G:(BOOL)a7 wifiEssentialChannel:(int *)a8
{
  if (a7) {
    double v11 = 5160.0;
  }
  else {
    double v11 = 2402.0;
  }
  if (a7) {
    double v12 = 675.0;
  }
  else {
    double v12 = 80.0;
  }
  if (!self->_enableWifiChannelAvoidance) {
    return &__NSArray0__struct;
  }
  uint64_t issueType = self->_issueType;
  double v17 = a6 - a5;
  double v18 = a4 - a3;
  switch((int)issueType)
  {
    case 0:
      double v19 = a5 * 3.0;
      double v20 = (v17 + a5) * 3.0 - a5 * 3.0;
      if (a5 * 3.0 >= v11) {
        double v21 = a5 * 3.0;
      }
      else {
        double v21 = v11;
      }
      double v22 = v11 + v12;
      if (v19 + v20 < v22) {
        double v22 = v19 + v20;
      }
      if (v21 >= v22) {
        return &__NSArray0__struct;
      }
      +[WCM_Logging logLevel:4, @"3 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)", *(void *)&a5, *(void *)&a6, a5 * 3.0, v19 + v20, v53, v54 message];
      goto LABEL_41;
    case 1:
      if (!sub_10008B494(0, v11, v12, a5, v17, a3, v18)) {
        return &__NSArray0__struct;
      }
      double v23 = (a3 + a5) * 0.5;
      double v24 = (a4 + a6) * 0.5 - v23;
      +[WCM_Logging logLevel:4, @"2 x WifiTx(%lf~%lf) - CellTx(%lf~%lf) = CellRx(%lf~%lf)", *(void *)&v23, v23 + v24, *(void *)&a5, *(void *)&a6, *(void *)&a3, *(void *)&a4 message];
      goto LABEL_33;
    case 2:
      if (!sub_10008B3EC(0, v11, v12, a5, v17, 1573.374, 4.092)) {
        return &__NSArray0__struct;
      }
      double v19 = a5 + 1573.374;
      double v20 = a6 + 1577.466 - (a5 + 1573.374);
      +[WCM_Logging logLevel:4, @"WifiTx(%lf~%lf) - CellTx(%lf~%lf) = GpsRx(%lf~%lf)", a5 + 1573.374, a5 + 1573.374 + v20, *(void *)&a5, *(void *)&a6, 0x4098957EF9DB22D1, 0x4098A5DD2F1A9FBFLL message];
      goto LABEL_41;
    case 3:
      if (!sub_10008B3EC(0, v11, v12, a5, v17, a3, v18)) {
        return &__NSArray0__struct;
      }
      double v23 = a3 + a5;
      double v24 = a4 + a6 - (a3 + a5);
      +[WCM_Logging logLevel:4, @"WifiTx(%lf~%lf) - CellTx(%lf~%lf) = CellRx(%lf~%lf)", a3 + a5, a3 + a5 + v24, *(void *)&a5, *(void *)&a6, *(void *)&a3, *(void *)&a4 message];
      goto LABEL_33;
    case 4:
      if (!sub_10008B494(0, a5, v17, v11, v12, a3, v18)) {
        return &__NSArray0__struct;
      }
      double v23 = -(a4 - a5 * 2.0);
      double v24 = -(a3 - a6 * 2.0) - v23;
      +[WCM_Logging logLevel:4, @"2 x CellTx(%lf~%lf) - WifiTx(%lf~%lf) = CellRx(%lf~%lf)", *(void *)&a5, *(void *)&a6, *(void *)&v23, v24 - (a4 - a5 * 2.0), *(void *)&a3, *(void *)&a4 message];
      goto LABEL_33;
    case 5:
      if (!sub_10008B494(0, a5, v17, v11, v12, 1573.374, 4.092)) {
        return &__NSArray0__struct;
      }
      double v19 = a5 * 2.0 + -1577.466;
      double v20 = a6 * 2.0 + -1573.374 - v19;
      +[WCM_Logging logLevel:4, @"2 x CellTx(%lf~%lf) - WifiTx(%lf~%lf) = GpsRx(%lf~%lf)", *(void *)&a5, *(void *)&a6, *(void *)&v19, v19 + v20, 0x4098957EF9DB22D1, 0x4098A5DD2F1A9FBFLL message];
      goto LABEL_41;
    case 6:
      if (!sub_10008B494(0, v11, v12, a5, v17, 1573.374, 4.092)) {
        return &__NSArray0__struct;
      }
      double v19 = a5 * 2.0 + 1573.374;
      double v20 = a6 * 2.0 + 1577.466 - v19;
      +[WCM_Logging logLevel:4, @"WifiTx(%lf~%lf) - 2 x CellTx(%lf~%lf) = GpsRx(%lf~%lf)", *(void *)&v19, v19 + v20, *(void *)&a5, *(void *)&a6, 0x4098957EF9DB22D1, 0x4098A5DD2F1A9FBFLL message];
      goto LABEL_41;
    case 7:
      if (!sub_10008B494(0, v11, v12, a5, v17, a3, v18)) {
        return &__NSArray0__struct;
      }
      double v23 = a3 + a5 * 2.0;
      double v24 = a4 + a6 * 2.0 - v23;
      +[WCM_Logging logLevel:4, @"WifiTx(%lf~%lf) - 2 x CellTx(%lf~%lf) = CellRx(%lf~%lf)", *(void *)&v23, v23 + v24, *(void *)&a5, *(void *)&a6, *(void *)&a3, *(void *)&a4 message];
      goto LABEL_33;
    case 8:
      if (!sub_10008B574(0, a5, v17, v11, v12, a3, v18)) {
        return &__NSArray0__struct;
      }
      double v23 = -(a4 - a5 * 4.0);
      double v24 = -(a3 - a6 * 4.0) - v23;
      +[WCM_Logging logLevel:4, @"4 x CellTx(%lf~%lf) - WifiTx(%lf~%lf) = CellRx(%lf~%lf)", *(void *)&a5, *(void *)&a6, *(void *)&v23, v24 - (a4 - a5 * 4.0), *(void *)&a3, *(void *)&a4 message];
LABEL_33:
      double v25 = v23;
      double v26 = v24;
      goto LABEL_101;
    case 9:
      double v19 = a5 + a5;
      double v20 = v17 + a5 + v17 + a5 - (a5 + a5);
      if (a5 + a5 >= v11) {
        double v27 = a5 + a5;
      }
      else {
        double v27 = v11;
      }
      double v28 = v11 + v12;
      if (v19 + v20 < v28) {
        double v28 = v19 + v20;
      }
      if (v27 >= v28) {
        return &__NSArray0__struct;
      }
      +[WCM_Logging logLevel:4, @"2 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)", *(void *)&a5, *(void *)&a6, a5 + a5, v19 + v20, v53, v54 message];
LABEL_41:
      double v25 = v19;
      double v26 = v20;
      goto LABEL_101;
    case 10:
      double v29 = v11 * 0.5;
      double v30 = (v11 + v12) * 0.5 - v11 * 0.5;
      if (v11 * 0.5 >= a3) {
        double v31 = v11 * 0.5;
      }
      else {
        double v31 = a3;
      }
      double v32 = v18 + a3;
      if (v29 + v30 < v18 + a3) {
        double v32 = v29 + v30;
      }
      if (v31 >= v32) {
        return &__NSArray0__struct;
      }
      +[WCM_Logging logLevel:4, @"WifiTx(%lf~%lf) / 2 = CellRx(%lf~%lf)", *(void *)&v29, v29 + v30, *(void *)&a3, *(void *)&a4 message];
      goto LABEL_100;
    case 11:
      double v29 = v11 / 3.0;
      double v30 = (v11 + v12) / 3.0 - v11 / 3.0;
      if (v11 / 3.0 >= a3) {
        double v33 = v11 / 3.0;
      }
      else {
        double v33 = a3;
      }
      double v34 = v18 + a3;
      if (v29 + v30 < v18 + a3) {
        double v34 = v29 + v30;
      }
      if (v33 >= v34) {
        return &__NSArray0__struct;
      }
      +[WCM_Logging logLevel:4, @"WifiTx(%lf~%lf) / 3 = CellRx(%lf~%lf)", *(void *)&v29, v29 + v30, *(void *)&a3, *(void *)&a4 message];
      goto LABEL_100;
    case 12:
      if (self->_cellFrequencyLimitForOOB <= a5 || v17 <= self->_cellBandwidthLimitForOOB) {
        return &__NSArray0__struct;
      }
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      wifiChannelsToAvoidForCellOOB = self->_wifiChannelsToAvoidForCellOOB;
      id v36 = [(NSArray *)wifiChannelsToAvoidForCellOOB countByEnumeratingWithState:&v59 objects:v64 count:16];
      if (!v36) {
        goto LABEL_92;
      }
      id v37 = v36;
      uint64_t v38 = *(void *)v60;
      int v39 = 13;
      do
      {
        for (uint64_t i = 0; i != v37; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v60 != v38) {
            objc_enumerationMutation(wifiChannelsToAvoidForCellOOB);
          }
          unsigned int v41 = [*(id *)(*((void *)&v59 + 1) + 8 * i) intValue];
          BOOL v42 = v41 > 0xB || ((1 << v41) & 0x842) == 0;
          if (!v42 && (int)v41 < v39) {
            int v39 = v41;
          }
        }
        id v37 = [(NSArray *)wifiChannelsToAvoidForCellOOB countByEnumeratingWithState:&v59 objects:v64 count:16];
      }
      while (v37);
      if (!a8 || v39 == 13) {
        goto LABEL_92;
      }
      goto LABEL_91;
    case 13:
      if (self->_cellFrequencyLimitForOOB >= a6 || v17 <= self->_cellBandwidthLimitForOOB) {
        return &__NSArray0__struct;
      }
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      double v43 = self->_wifiChannelsToAvoidForCellOOB;
      id v44 = [(NSArray *)v43 countByEnumeratingWithState:&v55 objects:v63 count:16];
      if (v44)
      {
        id v45 = v44;
        int v39 = 0;
        uint64_t v46 = *(void *)v56;
        do
        {
          for (int j = 0; j != v45; int j = (char *)j + 1)
          {
            if (*(void *)v56 != v46) {
              objc_enumerationMutation(v43);
            }
            unsigned int v48 = [*(id *)(*((void *)&v55 + 1) + 8 * (void)j) intValue];
            BOOL v49 = v48 > 0xB || ((1 << v48) & 0x842) == 0;
            if (!v49 && (int)v48 > v39) {
              int v39 = v48;
            }
          }
          id v45 = [(NSArray *)v43 countByEnumeratingWithState:&v55 objects:v63 count:16];
        }
        while (v45);
        if (a8 && v39) {
LABEL_91:
        }
          *a8 = v39;
      }
LABEL_92:
      id result = self->_wifiChannelsToAvoidForCellOOB;
      break;
    case 14:
      double v29 = v11 + v11;
      double v30 = v11 + v12 + v11 + v12 - (v11 + v11);
      if (v11 + v11 >= a3) {
        double v51 = v11 + v11;
      }
      else {
        double v51 = a3;
      }
      double v52 = v18 + a3;
      if (v29 + v30 < v18 + a3) {
        double v52 = v29 + v30;
      }
      if (v51 >= v52) {
        return &__NSArray0__struct;
      }
      +[WCM_Logging logLevel:4, @"(2 x WiFiTx)(i.e. %lf~%lf) = CellRx(%lf~%lf)", *(void *)&v29, v29 + v30, *(void *)&a3, *(void *)&a4 message];
LABEL_100:
      double v25 = v29;
      double v26 = v30;
LABEL_101:
      id result = sub_10008C60C(a8, v25, v26);
      break;
    default:
      +[WCM_Logging logLevel:0, @"WCM_WiFiCellCoexIssue(%p) has invalid _issueType(%d)", self, issueType message];
      return &__NSArray0__struct;
  }
  return result;
}

- (id)wifiPHSChannelsToBlocklistForCellDlLowFreq:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6 wifi5G:(BOOL)a7 wifiEssentialChannel:(int *)a8
{
  if (a7) {
    double v12 = 5160.0;
  }
  else {
    double v12 = 2402.0;
  }
  if (a7) {
    double v13 = 675.0;
  }
  else {
    double v13 = 80.0;
  }
  uint64_t issueType = self->_issueType;
  double v17 = a6 - a5;
  double v18 = a4 - a3;
  switch((int)issueType)
  {
    case 0:
      double v19 = a5 * 3.0;
      double v20 = (v17 + a5) * 3.0 - a5 * 3.0;
      if (a5 * 3.0 >= v12) {
        double v21 = a5 * 3.0;
      }
      else {
        double v21 = v12;
      }
      double v22 = v12 + v13;
      if (v19 + v20 < v22) {
        double v22 = v19 + v20;
      }
      if (v21 >= v22) {
        goto LABEL_103;
      }
      +[WCM_Logging logLevel:4, @"3 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)", *(void *)&a5, *(void *)&a6, a5 * 3.0, v19 + v20, v53, v54 message];
      goto LABEL_40;
    case 1:
      if (!sub_10008B494(0, v12, v13, a5, v17, a3, v18)) {
        goto LABEL_103;
      }
      double v23 = (a3 + a5) * 0.5;
      double v24 = (a4 + a6) * 0.5 - v23;
      +[WCM_Logging logLevel:4, @"2 x WifiTx(%lf~%lf) - CellTx(%lf~%lf) = CellRx(%lf~%lf)", *(void *)&v23, v23 + v24, *(void *)&a5, *(void *)&a6, *(void *)&a3, *(void *)&a4 message];
      goto LABEL_32;
    case 2:
      if (!sub_10008B3EC(0, v12, v13, a5, v17, 1573.374, 4.092)) {
        goto LABEL_103;
      }
      double v19 = a5 + 1573.374;
      double v20 = a6 + 1577.466 - (a5 + 1573.374);
      +[WCM_Logging logLevel:4, @"WifiTx(%lf~%lf) - CellTx(%lf~%lf) = GpsRx(%lf~%lf)", a5 + 1573.374, a5 + 1573.374 + v20, *(void *)&a5, *(void *)&a6, 0x4098957EF9DB22D1, 0x4098A5DD2F1A9FBFLL message];
      goto LABEL_40;
    case 3:
      if (!sub_10008B3EC(0, v12, v13, a5, v17, a3, v18)) {
        goto LABEL_103;
      }
      double v23 = a3 + a5;
      double v24 = a4 + a6 - (a3 + a5);
      +[WCM_Logging logLevel:4, @"WifiTx(%lf~%lf) - CellTx(%lf~%lf) = CellRx(%lf~%lf)", a3 + a5, a3 + a5 + v24, *(void *)&a5, *(void *)&a6, *(void *)&a3, *(void *)&a4 message];
      goto LABEL_32;
    case 4:
      if (!sub_10008B494(0, a5, v17, v12, v13, a3, v18)) {
        goto LABEL_103;
      }
      double v23 = -(a4 - a5 * 2.0);
      double v24 = -(a3 - a6 * 2.0) - v23;
      +[WCM_Logging logLevel:4, @"2 x CellTx(%lf~%lf) - WifiTx(%lf~%lf) = CellRx(%lf~%lf)", *(void *)&a5, *(void *)&a6, *(void *)&v23, v24 - (a4 - a5 * 2.0), *(void *)&a3, *(void *)&a4 message];
      goto LABEL_32;
    case 5:
      if (!sub_10008B494(0, a5, v17, v12, v13, 1573.374, 4.092)) {
        goto LABEL_103;
      }
      double v19 = a5 * 2.0 + -1577.466;
      double v20 = a6 * 2.0 + -1573.374 - v19;
      +[WCM_Logging logLevel:4, @"2 x CellTx(%lf~%lf) - WifiTx(%lf~%lf) = GpsRx(%lf~%lf)", *(void *)&a5, *(void *)&a6, *(void *)&v19, v19 + v20, 0x4098957EF9DB22D1, 0x4098A5DD2F1A9FBFLL message];
      goto LABEL_40;
    case 6:
      if (!sub_10008B494(0, v12, v13, a5, v17, 1573.374, 4.092)) {
        goto LABEL_103;
      }
      double v19 = a5 * 2.0 + 1573.374;
      double v20 = a6 * 2.0 + 1577.466 - v19;
      +[WCM_Logging logLevel:4, @"WifiTx(%lf~%lf) - 2 x CellTx(%lf~%lf) = GpsRx(%lf~%lf)", *(void *)&v19, v19 + v20, *(void *)&a5, *(void *)&a6, 0x4098957EF9DB22D1, 0x4098A5DD2F1A9FBFLL message];
      goto LABEL_40;
    case 7:
      if (!sub_10008B494(0, v12, v13, a5, v17, a3, v18)) {
        goto LABEL_103;
      }
      double v23 = a3 + a5 * 2.0;
      double v24 = a4 + a6 * 2.0 - v23;
      +[WCM_Logging logLevel:4, @"WifiTx(%lf~%lf) - 2 x CellTx(%lf~%lf) = CellRx(%lf~%lf)", *(void *)&v23, v23 + v24, *(void *)&a5, *(void *)&a6, *(void *)&a3, *(void *)&a4 message];
      goto LABEL_32;
    case 8:
      if (!sub_10008B574(0, a5, v17, v12, v13, a3, v18)) {
        goto LABEL_103;
      }
      double v23 = -(a4 - a5 * 4.0);
      double v24 = -(a3 - a6 * 4.0) - v23;
      +[WCM_Logging logLevel:4, @"4 x CellTx(%lf~%lf) - WifiTx(%lf~%lf) = CellRx(%lf~%lf)", *(void *)&a5, *(void *)&a6, *(void *)&v23, v24 - (a4 - a5 * 4.0), *(void *)&a3, *(void *)&a4 message];
LABEL_32:
      double v25 = v23;
      double v26 = v24;
      goto LABEL_100;
    case 9:
      double v19 = a5 + a5;
      double v20 = v17 + a5 + v17 + a5 - (a5 + a5);
      if (a5 + a5 >= v12) {
        double v27 = a5 + a5;
      }
      else {
        double v27 = v12;
      }
      double v28 = v12 + v13;
      if (v19 + v20 < v28) {
        double v28 = v19 + v20;
      }
      if (v27 >= v28) {
        goto LABEL_103;
      }
      +[WCM_Logging logLevel:4, @"2 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)", *(void *)&a5, *(void *)&a6, a5 + a5, v19 + v20, v53, v54 message];
LABEL_40:
      double v25 = v19;
      double v26 = v20;
      goto LABEL_100;
    case 10:
      double v29 = v12 * 0.5;
      double v30 = (v12 + v13) * 0.5 - v12 * 0.5;
      if (v12 * 0.5 >= a3) {
        double v31 = v12 * 0.5;
      }
      else {
        double v31 = a3;
      }
      double v32 = v18 + a3;
      if (v29 + v30 < v18 + a3) {
        double v32 = v29 + v30;
      }
      if (v31 >= v32) {
        goto LABEL_103;
      }
      +[WCM_Logging logLevel:4, @"WifiTx(%lf~%lf) / 2 = CellRx(%lf~%lf)", *(void *)&v29, v29 + v30, *(void *)&a3, *(void *)&a4 message];
      goto LABEL_99;
    case 11:
      double v29 = v12 / 3.0;
      double v30 = (v12 + v13) / 3.0 - v12 / 3.0;
      if (v12 / 3.0 >= a3) {
        double v33 = v12 / 3.0;
      }
      else {
        double v33 = a3;
      }
      double v34 = v18 + a3;
      if (v29 + v30 < v18 + a3) {
        double v34 = v29 + v30;
      }
      if (v33 >= v34) {
        goto LABEL_103;
      }
      +[WCM_Logging logLevel:4, @"WifiTx(%lf~%lf) / 3 = CellRx(%lf~%lf)", *(void *)&v29, v29 + v30, *(void *)&a3, *(void *)&a4 message];
      goto LABEL_99;
    case 12:
      if (self->_cellFrequencyLimitForOOB <= a5 || v17 <= self->_cellBandwidthLimitForOOB) {
        goto LABEL_103;
      }
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      wifiChannelsToAvoidForCellOOB = self->_wifiChannelsToAvoidForCellOOB;
      id v36 = [(NSArray *)wifiChannelsToAvoidForCellOOB countByEnumeratingWithState:&v59 objects:v64 count:16];
      if (!v36) {
        goto LABEL_91;
      }
      id v37 = v36;
      uint64_t v38 = *(void *)v60;
      int v39 = 13;
      do
      {
        for (uint64_t i = 0; i != v37; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v60 != v38) {
            objc_enumerationMutation(wifiChannelsToAvoidForCellOOB);
          }
          unsigned int v41 = [*(id *)(*((void *)&v59 + 1) + 8 * i) intValue];
          BOOL v42 = v41 > 0xB || ((1 << v41) & 0x842) == 0;
          if (!v42 && (int)v41 < v39) {
            int v39 = v41;
          }
        }
        id v37 = [(NSArray *)wifiChannelsToAvoidForCellOOB countByEnumeratingWithState:&v59 objects:v64 count:16];
      }
      while (v37);
      if (!a8 || v39 == 13) {
        goto LABEL_91;
      }
      goto LABEL_90;
    case 13:
      if (self->_cellFrequencyLimitForOOB >= a6 || v17 <= self->_cellBandwidthLimitForOOB) {
        goto LABEL_103;
      }
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      double v43 = self->_wifiChannelsToAvoidForCellOOB;
      id v44 = [(NSArray *)v43 countByEnumeratingWithState:&v55 objects:v63 count:16];
      if (v44)
      {
        id v45 = v44;
        int v39 = 0;
        uint64_t v46 = *(void *)v56;
        do
        {
          for (int j = 0; j != v45; int j = (char *)j + 1)
          {
            if (*(void *)v56 != v46) {
              objc_enumerationMutation(v43);
            }
            unsigned int v48 = [*(id *)(*((void *)&v55 + 1) + 8 * (void)j) intValue];
            BOOL v49 = v48 > 0xB || ((1 << v48) & 0x842) == 0;
            if (!v49 && (int)v48 > v39) {
              int v39 = v48;
            }
          }
          id v45 = [(NSArray *)v43 countByEnumeratingWithState:&v55 objects:v63 count:16];
        }
        while (v45);
        if (a8 && v39) {
LABEL_90:
        }
          *a8 = v39;
      }
LABEL_91:
      id result = self->_wifiChannelsToAvoidForPHS;
      break;
    case 14:
      double v29 = v12 + v12;
      double v30 = v12 + v13 + v12 + v13 - (v12 + v12);
      if (v12 + v12 >= a3) {
        double v51 = v12 + v12;
      }
      else {
        double v51 = a3;
      }
      double v52 = v18 + a3;
      if (v29 + v30 < v18 + a3) {
        double v52 = v29 + v30;
      }
      if (v51 >= v52) {
        goto LABEL_103;
      }
      +[WCM_Logging logLevel:4, @"(2 x WiFiTx)(i.e. %lf~%lf) = CellRx(%lf~%lf)", *(void *)&v29, v29 + v30, *(void *)&a3, *(void *)&a4 message];
LABEL_99:
      double v25 = v29;
      double v26 = v30;
LABEL_100:
      id result = sub_10008C60C(a8, v25, v26);
      break;
    default:
      +[WCM_Logging logLevel:0, @"WCM_WiFiCellCoexIssue(%p) has invalid _issueType(%d)", self, issueType message];
LABEL_103:
      id result = &__NSArray0__struct;
      break;
  }
  return result;
}

- (id)wifiChannelsToAvoidWiFiEnhForCellDlLowFreq:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6
{
  if (!self->_enableWifiChannelAvoidance) {
    return &__NSArray0__struct;
  }
  uint64_t issueType = self->_issueType;
  double v11 = a6 - a5;
  double v12 = a4 - a3;
  switch((int)issueType)
  {
    case 0:
      double v13 = a5 * 3.0;
      double v14 = (v11 + a5) * 3.0 - a5 * 3.0;
      if (a5 * 3.0 >= 5945.0) {
        double v15 = a5 * 3.0;
      }
      else {
        double v15 = 5945.0;
      }
      if (v15 >= fmin(v13 + v14, 7125.0)) {
        return &__NSArray0__struct;
      }
      +[WCM_Logging logLevel:4, @"3 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)", *(void *)&a5, *(void *)&a6, a5 * 3.0, v13 + v14, v29, v30 message];
      goto LABEL_31;
    case 1:
      if (!sub_10008B494(0, 5945.0, 1180.0, a5, v11, a3, v12)) {
        return &__NSArray0__struct;
      }
      double v16 = (a3 + a5) * 0.5;
      double v17 = (a4 + a6) * 0.5 - v16;
      +[WCM_Logging logLevel:4, @"2 x WifiTx(%lf~%lf) - CellTx(%lf~%lf) = CellRx(%lf~%lf)", *(void *)&v16, v16 + v17, *(void *)&a5, *(void *)&a6, *(void *)&a3, *(void *)&a4 message];
      goto LABEL_25;
    case 2:
      if (!sub_10008B3EC(0, 5945.0, 1180.0, a5, v11, 1573.374, 4.092)) {
        return &__NSArray0__struct;
      }
      double v13 = a5 + 1573.374;
      double v14 = a6 + 1577.466 - (a5 + 1573.374);
      +[WCM_Logging logLevel:4, @"WifiTx(%lf~%lf) - CellTx(%lf~%lf) = GpsRx(%lf~%lf)", a5 + 1573.374, a5 + 1573.374 + v14, *(void *)&a5, *(void *)&a6, 0x4098957EF9DB22D1, 0x4098A5DD2F1A9FBFLL message];
      goto LABEL_31;
    case 3:
      if (!sub_10008B3EC(0, 5945.0, 1180.0, a5, v11, a3, v12)) {
        return &__NSArray0__struct;
      }
      double v16 = a3 + a5;
      double v17 = a4 + a6 - (a3 + a5);
      +[WCM_Logging logLevel:4, @"WifiTx(%lf~%lf) - CellTx(%lf~%lf) = CellRx(%lf~%lf)", a3 + a5, a3 + a5 + v17, *(void *)&a5, *(void *)&a6, *(void *)&a3, *(void *)&a4 message];
      goto LABEL_25;
    case 4:
      if (!sub_10008B494(0, a5, v11, 5945.0, 1180.0, a3, v12)) {
        return &__NSArray0__struct;
      }
      double v16 = -(a4 - a5 * 2.0);
      double v17 = -(a3 - a6 * 2.0) - v16;
      +[WCM_Logging logLevel:4, @"2 x CellTx(%lf~%lf) - WifiTx(%lf~%lf) = CellRx(%lf~%lf)", *(void *)&a5, *(void *)&a6, *(void *)&v16, v17 - (a4 - a5 * 2.0), *(void *)&a3, *(void *)&a4 message];
      goto LABEL_25;
    case 5:
      if (!sub_10008B494(0, a5, v11, 5945.0, 1180.0, 1573.374, 4.092)) {
        return &__NSArray0__struct;
      }
      double v13 = a5 * 2.0 + -1577.466;
      double v14 = a6 * 2.0 + -1573.374 - v13;
      +[WCM_Logging logLevel:4, @"2 x CellTx(%lf~%lf) - WifiTx(%lf~%lf) = GpsRx(%lf~%lf)", *(void *)&a5, *(void *)&a6, *(void *)&v13, v13 + v14, 0x4098957EF9DB22D1, 0x4098A5DD2F1A9FBFLL message];
      goto LABEL_31;
    case 6:
      if (!sub_10008B494(0, 5945.0, 1180.0, a5, v11, 1573.374, 4.092)) {
        return &__NSArray0__struct;
      }
      double v13 = a5 * 2.0 + 1573.374;
      double v14 = a6 * 2.0 + 1577.466 - v13;
      +[WCM_Logging logLevel:4, @"WifiTx(%lf~%lf) - 2 x CellTx(%lf~%lf) = GpsRx(%lf~%lf)", *(void *)&v13, v13 + v14, *(void *)&a5, *(void *)&a6, 0x4098957EF9DB22D1, 0x4098A5DD2F1A9FBFLL message];
      goto LABEL_31;
    case 7:
      if (!sub_10008B494(0, 5945.0, 1180.0, a5, v11, a3, v12)) {
        return &__NSArray0__struct;
      }
      double v16 = a3 + a5 * 2.0;
      double v17 = a4 + a6 * 2.0 - v16;
      +[WCM_Logging logLevel:4, @"WifiTx(%lf~%lf) - 2 x CellTx(%lf~%lf) = CellRx(%lf~%lf)", *(void *)&v16, v16 + v17, *(void *)&a5, *(void *)&a6, *(void *)&a3, *(void *)&a4 message];
      goto LABEL_25;
    case 8:
      if (!sub_10008B574(0, a5, v11, 5945.0, 1180.0, a3, v12)) {
        return &__NSArray0__struct;
      }
      double v16 = -(a4 - a5 * 4.0);
      double v17 = -(a3 - a6 * 4.0) - v16;
      +[WCM_Logging logLevel:4, @"4 x CellTx(%lf~%lf) - WifiTx(%lf~%lf) = CellRx(%lf~%lf)", *(void *)&a5, *(void *)&a6, *(void *)&v16, v17 - (a4 - a5 * 4.0), *(void *)&a3, *(void *)&a4 message];
LABEL_25:
      double v18 = v16;
      double v19 = v17;
      goto LABEL_50;
    case 9:
      double v13 = a5 + a5;
      double v14 = v11 + a5 + v11 + a5 - (a5 + a5);
      if (a5 + a5 >= 5945.0) {
        double v20 = a5 + a5;
      }
      else {
        double v20 = 5945.0;
      }
      if (v20 >= fmin(v13 + v14, 7125.0)) {
        return &__NSArray0__struct;
      }
      +[WCM_Logging logLevel:4, @"2 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)", *(void *)&a5, *(void *)&a6, a5 + a5, v13 + v14, v29, v30 message];
LABEL_31:
      double v18 = v13;
      double v19 = v14;
      goto LABEL_50;
    case 10:
      uint64_t v21 = 0x40A7390000000000;
      double v22 = fmax(a3, 2972.5);
      double v23 = v12 + a3;
      if (v12 + a3 > 3562.5) {
        double v23 = 3562.5;
      }
      if (v22 >= v23) {
        return &__NSArray0__struct;
      }
      +[WCM_Logging logLevel:4, @"WifiTx(%lf~%lf) / 2 = CellRx(%lf~%lf)", 0x40A7390000000000, 0x40ABD50000000000, *(void *)&a3, *(void *)&a4 message];
      double v19 = 590.0;
      goto LABEL_49;
    case 11:
      uint64_t v21 = 0x409EF6AAAAAAAAABLL;
      double v24 = fmax(a3, 1981.66667);
      double v25 = v12 + a3;
      if (v12 + a3 > 2375.0) {
        double v25 = 2375.0;
      }
      if (v24 >= v25) {
        return &__NSArray0__struct;
      }
      +[WCM_Logging logLevel:4, @"WifiTx(%lf~%lf) / 3 = CellRx(%lf~%lf)", 0x409EF6AAAAAAAAABLL, 0x40A28E0000000000, *(void *)&a3, *(void *)&a4 message];
      double v19 = 393.333333;
      goto LABEL_49;
    case 12:
      if (self->_cellFrequencyLimitForOOB <= a5) {
        return &__NSArray0__struct;
      }
      goto LABEL_43;
    case 13:
      if (self->_cellFrequencyLimitForOOB >= a6) {
        return &__NSArray0__struct;
      }
LABEL_43:
      if (v11 <= self->_cellBandwidthLimitForOOB) {
        return &__NSArray0__struct;
      }
      id result = self->_wifiChannelsToAvoidForCellOOB;
      break;
    case 14:
      uint64_t v21 = 0x40C7390000000000;
      double v27 = fmax(a3, 11890.0);
      double v28 = v12 + a3;
      if (v12 + a3 > 14250.0) {
        double v28 = 14250.0;
      }
      if (v27 >= v28) {
        return &__NSArray0__struct;
      }
      +[WCM_Logging logLevel:4, @"(2 x WiFiTx)(i.e. %lf~%lf) = CellRx(%lf~%lf)", 0x40C7390000000000, 0x40CBD50000000000, *(void *)&a3, *(void *)&a4 message];
      double v19 = 2360.0;
LABEL_49:
      double v18 = *(double *)&v21;
LABEL_50:
      return sub_10008C7C0(v18, v19);
    default:
      +[WCM_Logging logLevel:0, @"WiFiType7_WiFiEnh: WCM_WiFiCellCoexIssue(%p) has invalid _issueType(%d)", self, issueType message];
      return &__NSArray0__struct;
  }
  return result;
}

- (BOOL)wifiBtAgcCoexModeEnabledInPolicy:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6 agccoexmode:(int *)a7
{
  double v7 = a6 - a5;
  uint64_t issueType = self->_issueType;
  switch(issueType)
  {
    case 0xD:
      if (self->_cellFrequencyLimitForOOB >= a6) {
        return 0;
      }
LABEL_11:
      if (v7 > self->_cellBandwidthLimitForOOB) {
        goto LABEL_12;
      }
      return 0;
    case 0xC:
      if (self->_cellFrequencyLimitForOOB <= a5) {
        return 0;
      }
      goto LABEL_11;
    case 0:
      double v9 = (v7 + a5) * 3.0 - a5 * 3.0;
      double v10 = 2402.0;
      if (a5 * 3.0 >= 2402.0) {
        double v10 = a5 * 3.0;
      }
      if (v10 >= fmin(a5 * 3.0 + v9, 2482.0)) {
        return 0;
      }
LABEL_12:
      *a7 = self->_wifiBtAgcCoexModeEnable;
      return 1;
  }
  +[WCM_Logging logLevel:0, @"WCM_WiFiCellCoexIssue(%p) has invalid _issueType(%d) in AgcCoexMode", v7, a4, self, issueType message];
  return 0;
}

- (BOOL)wifiBtAgcCoexModeEnabledInPolicyV2:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6 wifiChannel:(unsigned int)a7 channelCenterFreqMHz:(unsigned int)a8 channelBandwidthMHz:(unsigned int)a9 coexModeWifiLevel:(int64_t *)a10 coexModeBTLevel:(int64_t *)a11
{
  if ([(WCM_WiFiCellCoexIssue *)self issueType]
    && [(WCM_WiFiCellCoexIssue *)self issueType] != 9
    && ([(WCM_WiFiCellCoexIssue *)self issueType] & 0xFFFFFFFE) != 0xC
    || !self->_enableWifiChannelAvoidance)
  {
    return 0;
  }
  double v18 = a6 - a5;
  uint64_t issueType = self->_issueType;
  if ((int)issueType > 11)
  {
    if (issueType == 12)
    {
      if (self->_cellFrequencyLimitForOOB > a5 && v18 > self->_cellBandwidthLimitForOOB)
      {
        +[WCM_Logging logLevel:4, @"DLDebug_: ISSUE_TYPE_OOB_ISM_RIGHT matched for both WiFi/BT with CellTxLow(%lf~%lf) and WifiRx(%lf~%lf)", *(void *)&a5, *(void *)&a6, 0, 0 message];
        goto LABEL_60;
      }
    }
    else
    {
      if (issueType != 13) {
        goto LABEL_34;
      }
      if (self->_cellFrequencyLimitForOOB < a6 && v18 > self->_cellBandwidthLimitForOOB)
      {
        +[WCM_Logging logLevel:4, @"DLDebug_: ISSUE_TYPE_OOB_ISM_LEFT matched for both WiFi/BT with CellTxLow(%lf~%lf) and WifiRx(%lf~%lf)", *(void *)&a5, *(void *)&a6, 0, 0 message];
LABEL_60:
        *a10 = self->_wifiBtAgcCoexModeEnable;
        goto LABEL_61;
      }
    }
    return 0;
  }
  double v20 = (double)(a8 - (a9 >> 1));
  double v21 = (double)(a8 + (a9 >> 1)) - v20;
  if (issueType)
  {
    if (issueType == 9)
    {
      double v22 = a5 + a5;
      double v23 = v18 + a5 + v18 + a5 - (a5 + a5);
      if (a5 + a5 >= v20) {
        double v24 = a5 + a5;
      }
      else {
        double v24 = (double)(a8 - (a9 >> 1));
      }
      double v25 = v21 + v20;
      if (v22 + v23 < v25) {
        double v25 = v22 + v23;
      }
      double v26 = 2402.0;
      if (v22 >= 2402.0) {
        double v26 = a5 + a5;
      }
      double v27 = fmin(v22 + v23, 2482.0);
      if (v26 >= v27 && v24 >= v25) {
        return 0;
      }
      BOOL v29 = v26 < v27;
      if (v26 >= v27) {
        double v30 = 0.0;
      }
      else {
        double v30 = a5 + a5;
      }
      if (v26 >= v27) {
        double v31 = 0.0;
      }
      else {
        double v31 = v23;
      }
      if (v24 >= v25)
      {
        double v23 = 0.0;
        double v22 = 0.0;
      }
      +[WCM_Logging logLevel:4, @"DLDebug_: ISSUE_TYPE_2CELL_2FO_WIFI_VICTIM matched flag is %d, for WiFi with 2 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)", v24 < v25, *(void *)&a5, *(void *)&a6, *(void *)&v22, v22 + v23 message];
      *a10 = self->_wifiBtAgcCoexModeEnable;
      +[WCM_Logging logLevel:4, @"DLDebug_: ISSUE_TYPE_2CELL_2FO_WIFI_VICTIM matched flag is %d, for BT with 2 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)", v29, *(void *)&a5, *(void *)&a6, *(void *)&v30, v31 + v30 message];
      goto LABEL_61;
    }
LABEL_34:
    if (issueType <= 0xE) {
      double v32 = off_10020F988[issueType];
    }
    else {
      double v32 = "<ISSUE_TYPE_INVALID>";
    }
    +[WCM_Logging logLevel:0, @"%s is not considered for WiFi/BT Coex Mode, putting all zeros (assuming policy table entries are correct)", v18, v32 message];
    BOOL result = 0;
    *a10 = self->_wifiBtAgcCoexModeEnable;
    goto LABEL_65;
  }
  double v33 = a5 * 3.0;
  double v34 = (v18 + a5) * 3.0 - a5 * 3.0;
  if (a5 * 3.0 >= v20) {
    double v35 = a5 * 3.0;
  }
  else {
    double v35 = (double)(a8 - (a9 >> 1));
  }
  double v36 = v21 + v20;
  if (v33 + v34 < v36) {
    double v36 = v33 + v34;
  }
  double v37 = 2402.0;
  if (v33 >= 2402.0) {
    double v37 = a5 * 3.0;
  }
  double v38 = fmin(v33 + v34, 2482.0);
  if (v37 >= v38 && v35 >= v36) {
    return 0;
  }
  BOOL v40 = v37 < v38;
  if (v37 >= v38) {
    double v41 = 0.0;
  }
  else {
    double v41 = a5 * 3.0;
  }
  if (v37 >= v38) {
    double v42 = 0.0;
  }
  else {
    double v42 = v34;
  }
  if (v35 >= v36)
  {
    double v34 = 0.0;
    double v33 = 0.0;
  }
  +[WCM_Logging logLevel:4, @"DLDebug_: ISSUE_TYPE_3CELL_3FO_WIFI_VICTIM matched flag = %d, for WiFi with 3 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)", v35 < v36, *(void *)&a5, *(void *)&a6, *(void *)&v33, v33 + v34 message];
  *a10 = self->_wifiBtAgcCoexModeEnable;
  +[WCM_Logging logLevel:4, @"DLDebug_: ISSUE_TYPE_3CELL_3FO_WIFI_VICTIM matched flag = %d, for BT with 3 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)", v40, *(void *)&a5, *(void *)&a6, *(void *)&v41, v42 + v41 message];
LABEL_61:
  BOOL result = 1;
LABEL_65:
  *a11 = self->_btAgcCoexModeEnable;
  return result;
}

- (BOOL)watchAntennaPrefEnabledInPolicy:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6 watchAntPref:(int *)a7
{
  int issueType = self->_issueType;
  if (issueType == 13)
  {
    if (self->_cellFrequencyLimitForOOB >= a6) {
      return 0;
    }
  }
  else
  {
    if (issueType != 12)
    {
      +[WCM_Logging logLevel:0, @"WCM_WiFiCellCoexIssue(%p) has invalid _issueType(%d) in watchAntPreference %d", a3, a4, a5, a6, self, self->_issueType, self->_watchAntType message];
      return 0;
    }
    if (self->_cellFrequencyLimitForOOB <= a5) {
      return 0;
    }
  }
  if (a6 - a5 > self->_cellBandwidthLimitForOOB)
  {
    *a7 = self->_watchAntType;
    return 1;
  }
  return 0;
}

- (void)cellFreqRangeWithIssueForCellDlLowFreq:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6 wifiLowFreq:(double)a7 wifiHighFreq:(double)a8 cellTxIssueRange:(id *)a9 cellRxIssueRange:(id *)a10
{
  $F24F406B2B787EFB06265DBA3D28CBD5 v38 = ($F24F406B2B787EFB06265DBA3D28CBD5)0;
  $F24F406B2B787EFB06265DBA3D28CBD5 v37 = ($F24F406B2B787EFB06265DBA3D28CBD5)0;
  uint64_t issueType = self->_issueType;
  double v16 = a3;
  double v17 = a6 - a5;
  double v18 = a4 - a3;
  double v19 = a8 - a7;
  switch((int)issueType)
  {
    case 0:
      double v20 = a5 * 3.0;
      double v21 = (v17 + a5) * 3.0 - a5 * 3.0;
      if (v20 >= a7) {
        double v22 = v20;
      }
      else {
        double v22 = a7;
      }
      double v23 = v20 + v21;
      if (v23 >= v19 + a7) {
        double v23 = v19 + a7;
      }
      if (v22 < v23)
      {
        v38.uint64_t var0 = v22 / 3.0;
        v38.int var1 = (v23 - v22) / 3.0;
        +[WCM_Logging logLevel:4, @"3 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)", v22 / 3.0, v22 / 3.0 + v38.var1, *(void *)&a7, *(void *)&a8, v35, v36 message];
      }
      break;
    case 1:
    case 4:
    case 7:
      if (sub_10008BB44(0, &v38.var0, &v37.var0, a7, a8 - a7, a5, v17, a3, v18)) {
        +[WCM_Logging logLevel:4, @"2 x WifiTx(%lf~%lf) - CellTx(%lf~%lf) = CellRx(%lf~%lf)", *(void *)&a7, *(void *)&a8, *(void *)&v38.var0, v38.var0 + v38.var1, *(void *)&v37.var0, v37.var0 + v37.var1 message];
      }
      break;
    case 2:
      if (sub_10008BB44(0, &v38.var0, 0, a7, v19, a5, v17, 1573.374, 4.092)) {
        +[WCM_Logging logLevel:4, @"WifiTx(%lf~%lf) - CellTx(%lf~%lf) = GpsRx(%lf~%lf)", *(void *)&a7, *(void *)&a8, *(void *)&v38.var0, v38.var0 + v38.var1, 0x4098957EF9DB22D1, 0x4098A5DD2F1A9FBFLL message];
      }
      break;
    case 3:
      if (sub_10008B8F0(0, &v38.var0, &v37.var0, a7, a8 - a7, a5, v17, a3, v18)) {
        +[WCM_Logging logLevel:4, @"WifiTx(%lf~%lf) - CellTx(%lf~%lf) = CellRx(%lf~%lf)", *(void *)&a7, *(void *)&a8, *(void *)&v38.var0, v38.var0 + v38.var1, *(void *)&v37.var0, v37.var0 + v37.var1 message];
      }
      break;
    case 5:
    case 6:
      if (sub_10008BB44(&v38.var0, 0, 0, a5, v17, a7, v19, 1573.374, 4.092)) {
        +[WCM_Logging logLevel:4, @"2 x CellTx(%lf~%lf) - WifiTx(%lf~%lf) = GpsRx(%lf~%lf)", *(void *)&v38.var0, v38.var0 + v38.var1, *(void *)&a7, *(void *)&a8, 0x4098957EF9DB22D1, 0x4098A5DD2F1A9FBFLL message];
      }
      break;
    case 8:
      if (sub_10008BE1C(&v38.var0, 0, &v37.var0, a5, v17, a7, a8 - a7, a3, v18)) {
        +[WCM_Logging logLevel:4, @"4 x CellTx(%lf~%lf) - WifiTx(%lf~%lf) = CellRx(%lf~%lf)", *(void *)&v38.var0, v38.var0 + v38.var1, *(void *)&a7, *(void *)&a8, *(void *)&v37.var0, v37.var0 + v37.var1 message];
      }
      break;
    case 9:
      double v24 = a5 + a5;
      double v25 = v17 + a5 + v17 + a5 - (a5 + a5);
      if (v24 >= a7) {
        double v26 = v24;
      }
      else {
        double v26 = a7;
      }
      double v27 = v24 + v25;
      if (v27 >= v19 + a7) {
        double v27 = v19 + a7;
      }
      if (v26 < v27)
      {
        v38.uint64_t var0 = v26 * 0.5;
        v38.int var1 = (v27 - v26) * 0.5;
        +[WCM_Logging logLevel:4, @"2 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)", v26 * 0.5, v26 * 0.5 + v38.var1, *(void *)&a7, *(void *)&a8, v35, v36 message];
      }
      break;
    case 10:
      if (a7 * 0.5 >= a3) {
        a3 = a7 * 0.5;
      }
      double v31 = a7 * 0.5 + (v19 + a7) * 0.5 - a7 * 0.5;
      if (v31 >= v18 + v16) {
        double v31 = v18 + v16;
      }
      if (a3 < v31)
      {
        v37.uint64_t var0 = a3;
        v37.int var1 = v31 - a3;
        +[WCM_Logging logLevel:4, @"WifiTx(%lf~%lf) / 2 = CellRx(%lf~%lf)", *(void *)&a7, *(void *)&a8, *(void *)&a3, a3 + v31 - a3, v35, v36 message];
      }
      break;
    case 11:
      if (a7 / 3.0 >= a3) {
        a3 = a7 / 3.0;
      }
      double v28 = a7 / 3.0 + (v19 + a7) / 3.0 - a7 / 3.0;
      if (v28 >= v18 + v16) {
        double v28 = v18 + v16;
      }
      if (a3 < v28)
      {
        v37.uint64_t var0 = a3;
        v37.int var1 = v28 - a3;
        +[WCM_Logging logLevel:4, @"WifiTx(%lf~%lf) / 3 = CellRx(%lf~%lf)", *(void *)&a7, *(void *)&a8, *(void *)&a3, a3 + v28 - a3, v35, v36 message];
      }
      break;
    case 12:
      double cellFrequencyLimitForOOB = self->_cellFrequencyLimitForOOB;
      if (cellFrequencyLimitForOOB > a5 && v17 > self->_cellBandwidthLimitForOOB)
      {
        v38.uint64_t var0 = a5;
        v38.int var1 = cellFrequencyLimitForOOB - a5;
      }
      break;
    case 13:
      double v32 = self->_cellFrequencyLimitForOOB;
      if (v32 < a6 && v17 > self->_cellBandwidthLimitForOOB)
      {
        v38.uint64_t var0 = self->_cellFrequencyLimitForOOB;
        v38.int var1 = a6 - v32;
      }
      break;
    case 14:
      if (a7 + a7 >= a3) {
        a3 = a7 + a7;
      }
      double v30 = a7 + a7 + v19 + a7 + v19 + a7 - (a7 + a7);
      if (v30 >= v18 + v16) {
        double v30 = v18 + v16;
      }
      if (a3 < v30)
      {
        v37.uint64_t var0 = a3;
        v37.int var1 = v30 - a3;
        +[WCM_Logging logLevel:4, @"(2 x WiFiTx)(i.e. %lf~%lf) = CellRx(%lf~%lf)", *(void *)&a7, *(void *)&a8, *(void *)&a3, a3 + v30 - a3, v35, v36 message];
      }
      break;
    default:
      +[WCM_Logging logLevel:0, @"WCM_WiFiCellCoexIssue(%p) has invalid _issueType(%d)", self, issueType, v33, v34, v35, v36 message];
      break;
  }
  if (a9) {
    *a9 = v38;
  }
  if (a10) {
    *a10 = v37;
  }
}

- (int)issueType
{
  return self->_issueType;
}

- (BOOL)enableWifiChannelAvoidance
{
  return self->_enableWifiChannelAvoidance;
}

- (unsigned)wifiUlAntennaBitmapOnCellLAT
{
  return self->_wifiUlAntennaBitmapOnCellLAT;
}

- (unsigned)wifiUlAntennaBitmapOnCellUAT
{
  return self->_wifiUlAntennaBitmapOnCellUAT;
}

- (unsigned)wifiDlAntennaBitmapOnCellLAT
{
  return self->_wifiDlAntennaBitmapOnCellLAT;
}

- (unsigned)wifiDlAntennaBitmapOnCellUAT
{
  return self->_wifiDlAntennaBitmapOnCellUAT;
}

- (unsigned)wifiUlAntennaBitmapOnCellAntBitmap000
{
  return self->_wifiUlAntennaBitmapOnCellAntBitmap000;
}

- (unsigned)wifiUlAntennaBitmapOnCellAntBitmap001
{
  return self->_wifiUlAntennaBitmapOnCellAntBitmap001;
}

- (unsigned)wifiUlAntennaBitmapOnCellAntBitmap010
{
  return self->_wifiUlAntennaBitmapOnCellAntBitmap010;
}

- (unsigned)wifiUlAntennaBitmapOnCellAntBitmap011
{
  return self->_wifiUlAntennaBitmapOnCellAntBitmap011;
}

- (unsigned)wifiUlAntennaBitmapOnCellAntBitmap100
{
  return self->_wifiUlAntennaBitmapOnCellAntBitmap100;
}

- (unsigned)wifiUlAntennaBitmapOnCellAntBitmap101
{
  return self->_wifiUlAntennaBitmapOnCellAntBitmap101;
}

- (unsigned)wifiUlAntennaBitmapOnCellAntBitmap110
{
  return self->_wifiUlAntennaBitmapOnCellAntBitmap110;
}

- (unsigned)wifiUlAntennaBitmapOnCellAntBitmap111
{
  return self->_wifiUlAntennaBitmapOnCellAntBitmap111;
}

- (unsigned)wifiDlAntennaBitmapOnCellAntBitmap000
{
  return self->_wifiDlAntennaBitmapOnCellAntBitmap000;
}

- (unsigned)wifiDlAntennaBitmapOnCellAntBitmap001
{
  return self->_wifiDlAntennaBitmapOnCellAntBitmap001;
}

- (unsigned)wifiDlAntennaBitmapOnCellAntBitmap010
{
  return self->_wifiDlAntennaBitmapOnCellAntBitmap010;
}

- (unsigned)wifiDlAntennaBitmapOnCellAntBitmap011
{
  return self->_wifiDlAntennaBitmapOnCellAntBitmap011;
}

- (unsigned)wifiDlAntennaBitmapOnCellAntBitmap100
{
  return self->_wifiDlAntennaBitmapOnCellAntBitmap100;
}

- (unsigned)wifiDlAntennaBitmapOnCellAntBitmap101
{
  return self->_wifiDlAntennaBitmapOnCellAntBitmap101;
}

- (unsigned)wifiDlAntennaBitmapOnCellAntBitmap110
{
  return self->_wifiDlAntennaBitmapOnCellAntBitmap110;
}

- (unsigned)wifiDlAntennaBitmapOnCellAntBitmap111
{
  return self->_wifiDlAntennaBitmapOnCellAntBitmap111;
}

- (unint64_t)cellTxPowerLimit
{
  return self->_cellTxPowerLimit;
}

- (double)cellFrequencyLimitForOOB
{
  return self->_cellFrequencyLimitForOOB;
}

- (double)cellBandwidthLimitForOOB
{
  return self->_cellBandwidthLimitForOOB;
}

- (NSArray)wifiChannelsToAvoidForCellOOB
{
  return self->_wifiChannelsToAvoidForCellOOB;
}

- (NSArray)wifiChannelsToAvoidForOCL
{
  return self->_wifiChannelsToAvoidForOCL;
}

- (NSArray)wifiChannelsToAvoidForPHS
{
  return self->_wifiChannelsToAvoidForPHS;
}

- (NSArray)wifiChannelsToDoAntennaSelectionForCellOOB
{
  return self->_wifiChannelsToDoAntennaSelectionForCellOOB;
}

- (int)btDiversityBlocklistTypeForC0B0
{
  return self->_btDiversityBlocklistTypeForC0B0;
}

- (int)btDiversityBlocklistTypeForC0B1
{
  return self->_btDiversityBlocklistTypeForC0B1;
}

- (int)btDiversityBlocklistTypeForC1B0
{
  return self->_btDiversityBlocklistTypeForC1B0;
}

- (int)btDiversityBlocklistTypeForC1B1
{
  return self->_btDiversityBlocklistTypeForC1B1;
}

- (NSArray)btChannelsToAvoidForC0B0
{
  return self->_btChannelsToAvoidForC0B0;
}

- (NSArray)btChannelsToAvoidForC0B1
{
  return self->_btChannelsToAvoidForC0B1;
}

- (NSArray)btChannelsToAvoidForC1B0
{
  return self->_btChannelsToAvoidForC1B0;
}

- (NSArray)btChannelsToAvoidForC1B1
{
  return self->_btChannelsToAvoidForC1B1;
}

- (int)watchAntType
{
  return self->_watchAntType;
}

- (unsigned)wifiBtAgcCoexModeEnable
{
  return self->_wifiBtAgcCoexModeEnable;
}

- (unsigned)ulcaPriority
{
  return self->_ulcaPriority;
}

- (unsigned)ulcaPriorityCCWiFi
{
  return self->_ulcaPriorityCCWiFi;
}

- (unsigned)ulcaPriorityCCBT
{
  return self->_ulcaPriorityCCBT;
}

- (unsigned)btAgcCoexModeEnable
{
  return self->_btAgcCoexModeEnable;
}

- (unsigned)cellAntBlkEnableIdx
{
  return self->_cellAntBlkEnableIdx;
}

- (BOOL)isWifiEnhBand
{
  return self->_isWifiEnhBand;
}

- (BOOL)HFBTAntBlkBandUnii1Enabled
{
  return self->_HFBTAntBlkBandUnii1Enabled;
}

- (BOOL)HFBTAntBlkBandUnii3Enabled
{
  return self->_HFBTAntBlkBandUnii3Enabled;
}

- (BOOL)HFBTAntBlkBandUnii5aEnabled
{
  return self->_HFBTAntBlkBandUnii5aEnabled;
}

- (BOOL)HFBTAntBlkBandUnii5bEnabled
{
  return self->_HFBTAntBlkBandUnii5bEnabled;
}

- (BOOL)HFBTAntBlkBandUnii5cEnabled
{
  return self->_HFBTAntBlkBandUnii5cEnabled;
}

- (BOOL)HFBTAntBlkBandUnii5dEnabled
{
  return self->_HFBTAntBlkBandUnii5dEnabled;
}

- (NSArray)wifiChannelsToApplyCellAntBlocking
{
  return self->_wifiChannelsToApplyCellAntBlocking;
}

- (unsigned)cellAntBlkEnableIdx2
{
  return self->_cellAntBlkEnableIdx2;
}

@end