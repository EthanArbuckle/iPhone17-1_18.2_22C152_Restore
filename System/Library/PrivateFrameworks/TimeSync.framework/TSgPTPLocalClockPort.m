@interface TSgPTPLocalClockPort
+ (id)diagnosticDescriptionForInfo:(id)a3 withIndent:(id)a4;
+ (id)keyPathsForValuesAffectingHasLocalFrequencyStabilityLower;
+ (id)keyPathsForValuesAffectingHasLocalFrequencyStabilityUpper;
+ (id)keyPathsForValuesAffectingHasLocalFrequencyToleranceLower;
+ (id)keyPathsForValuesAffectingHasLocalFrequencyToleranceUpper;
+ (id)keyPathsForValuesAffectingLocalFrequencyStabilityLower;
+ (id)keyPathsForValuesAffectingLocalFrequencyStabilityUpper;
+ (id)keyPathsForValuesAffectingLocalFrequencyToleranceLower;
+ (id)keyPathsForValuesAffectingLocalFrequencyToleranceUpper;
+ (id)keyPathsForValuesAffectingLocalOscillatorType;
- (BOOL)hasLocalFrequencyStabilityLower;
- (BOOL)hasLocalFrequencyStabilityUpper;
- (BOOL)hasLocalFrequencyToleranceLower;
- (BOOL)hasLocalFrequencyToleranceUpper;
- (TSgPTPLocalClockPort)initWithImplDC:(id)a3;
- (int)localFrequencyStabilityLower;
- (int)localFrequencyStabilityUpper;
- (int)localFrequencyToleranceLower;
- (int)localFrequencyToleranceUpper;
- (unsigned)localOscillatorType;
@end

@implementation TSgPTPLocalClockPort

- (TSgPTPLocalClockPort)initWithImplDC:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v10 = "[portImpl isKindOfClass:[TSDgPTPLocalClockPort class]]";
      __int16 v11 = 2048;
      uint64_t v12 = 0;
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2080;
      v16 = "";
      __int16 v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSgPTPPort.m";
      __int16 v19 = 1024;
      int v20 = 406;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    id v5 = 0;
    goto LABEL_4;
  }
  v8.receiver = self;
  v8.super_class = (Class)TSgPTPLocalClockPort;
  id v5 = [(TSgPTPPort *)&v8 initWithImplDC:v4];
  if (v5)
  {
    id v6 = v4;
    self = (TSgPTPLocalClockPort *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v6;
LABEL_4:
  }
  return (TSgPTPLocalClockPort *)v5;
}

+ (id)keyPathsForValuesAffectingLocalOscillatorType
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.localOscillatorType", 0);
}

- (unsigned)localOscillatorType
{
  return [(_TSF_TSDgPTPLocalClockPort *)self->_impl localOscillatorType];
}

+ (id)keyPathsForValuesAffectingHasLocalFrequencyToleranceLower
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.hasLocalFrequencyToleranceLower", 0);
}

- (BOOL)hasLocalFrequencyToleranceLower
{
  return [(_TSF_TSDgPTPLocalClockPort *)self->_impl hasLocalFrequencyToleranceLower];
}

+ (id)keyPathsForValuesAffectingLocalFrequencyToleranceLower
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.localFrequencyToleranceLower", 0);
}

- (int)localFrequencyToleranceLower
{
  return [(_TSF_TSDgPTPLocalClockPort *)self->_impl localFrequencyToleranceLower];
}

+ (id)keyPathsForValuesAffectingHasLocalFrequencyToleranceUpper
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.hasLocalFrequencyToleranceUpper", 0);
}

- (BOOL)hasLocalFrequencyToleranceUpper
{
  return [(_TSF_TSDgPTPLocalClockPort *)self->_impl hasLocalFrequencyToleranceUpper];
}

+ (id)keyPathsForValuesAffectingLocalFrequencyToleranceUpper
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.localFrequencyToleranceUpper", 0);
}

- (int)localFrequencyToleranceUpper
{
  return [(_TSF_TSDgPTPLocalClockPort *)self->_impl localFrequencyToleranceUpper];
}

+ (id)keyPathsForValuesAffectingHasLocalFrequencyStabilityLower
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.hasLocalFrequencyStabilityLower", 0);
}

- (BOOL)hasLocalFrequencyStabilityLower
{
  return [(_TSF_TSDgPTPLocalClockPort *)self->_impl hasLocalFrequencyStabilityLower];
}

+ (id)keyPathsForValuesAffectingLocalFrequencyStabilityLower
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.localFrequencyStabilityLower", 0);
}

- (int)localFrequencyStabilityLower
{
  return [(_TSF_TSDgPTPLocalClockPort *)self->_impl localFrequencyStabilityLower];
}

+ (id)keyPathsForValuesAffectingHasLocalFrequencyStabilityUpper
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.hasLocalFrequencyToleranceUpper", 0);
}

- (BOOL)hasLocalFrequencyStabilityUpper
{
  return [(_TSF_TSDgPTPLocalClockPort *)self->_impl hasLocalFrequencyToleranceUpper];
}

+ (id)keyPathsForValuesAffectingLocalFrequencyStabilityUpper
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.localFrequencyStabilityUpper", 0);
}

- (int)localFrequencyStabilityUpper
{
  return [(_TSF_TSDgPTPLocalClockPort *)self->_impl localFrequencyStabilityUpper];
}

+ (id)diagnosticDescriptionForInfo:(id)a3 withIndent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v43.receiver = a1;
  v43.super_class = (Class)&OBJC_METACLASS___TSgPTPLocalClockPort;
  objc_super v8 = objc_msgSendSuper2(&v43, sel_diagnosticDescriptionForInfo_withIndent_, v6, v7);
  [v8 appendFormat:@"%@    Announce Clock Priority 1: ", v7];
  v9 = [v6 objectForKeyedSubscript:@"ClockPriority1"];
  v10 = v9;
  if (v9) {
    objc_msgSend(v8, "appendFormat:", @"%hhu\n", objc_msgSend(v9, "unsignedCharValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Announce Clock Class: ", v7];
  __int16 v11 = [v6 objectForKeyedSubscript:@"ClockClass"];

  if (v11) {
    objc_msgSend(v8, "appendFormat:", @"%hhu\n", objc_msgSend(v11, "unsignedCharValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Announce Clock Accuracy: ", v7];
  uint64_t v12 = [v6 objectForKeyedSubscript:@"ClockAccuracy"];

  if (v12) {
    objc_msgSend(v8, "appendFormat:", @"%hhu\n", objc_msgSend(v12, "unsignedCharValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Announce Offset Scaled Log Variance: ", v7];
  __int16 v13 = [v6 objectForKeyedSubscript:@"OffsetScaledLogVariance"];

  if (v13) {
    objc_msgSend(v8, "appendFormat:", @"%hu\n", objc_msgSend(v13, "unsignedShortValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Announce Clock Priority 2: ", v7];
  uint64_t v14 = [v6 objectForKeyedSubscript:@"ClockPriority2"];

  if (v14) {
    objc_msgSend(v8, "appendFormat:", @"%hhu\n", objc_msgSend(v14, "unsignedCharValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Announce Grandmaster Identity: ", v7];
  __int16 v15 = [v6 objectForKeyedSubscript:@"GrandmasterID"];

  if (v15) {
    objc_msgSend(v8, "appendFormat:", @"%016llx\n", objc_msgSend(v15, "unsignedLongLongValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Announce Steps Removed: ", v7];
  v16 = [v6 objectForKeyedSubscript:@"StepsRemoved"];

  if (v16) {
    objc_msgSend(v8, "appendFormat:", @"%hu\n", objc_msgSend(v16, "unsignedShortValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Announce Time Source: ", v7];
  __int16 v17 = [v6 objectForKeyedSubscript:@"TimeSource"];

  if (v17) {
    objc_msgSend(v8, "appendFormat:", @"%hhu\n", objc_msgSend(v17, "unsignedCharValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Received Clock Priority 1: ", v7];
  v18 = [v6 objectForKeyedSubscript:@"ReceivedClockPriority1"];

  if (v18) {
    objc_msgSend(v8, "appendFormat:", @"%hhu\n", objc_msgSend(v18, "unsignedCharValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Received Clock Class: ", v7];
  __int16 v19 = [v6 objectForKeyedSubscript:@"ReceivedClockClass"];

  if (v19) {
    objc_msgSend(v8, "appendFormat:", @"%hhu\n", objc_msgSend(v19, "unsignedCharValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Received Clock Accuracy: ", v7];
  int v20 = [v6 objectForKeyedSubscript:@"ReceivedClockAccuracy"];

  if (v20) {
    objc_msgSend(v8, "appendFormat:", @"%hhu\n", objc_msgSend(v20, "unsignedCharValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Received Offset Scaled Log Variance: ", v7];
  uint64_t v21 = [v6 objectForKeyedSubscript:@"ReceivedOffsetScaledLogVariance"];

  if (v21) {
    objc_msgSend(v8, "appendFormat:", @"%hu\n", objc_msgSend(v21, "unsignedShortValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Received Clock Priority 2: ", v7];
  v22 = [v6 objectForKeyedSubscript:@"ReceivedClockPriority2"];

  if (v22) {
    objc_msgSend(v8, "appendFormat:", @"%hhu\n", objc_msgSend(v22, "unsignedCharValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Received Grandmaster Identity: ", v7];
  v23 = [v6 objectForKeyedSubscript:@"ReceivedGrandmasterID"];

  if (v23) {
    objc_msgSend(v8, "appendFormat:", @"%016llx\n", objc_msgSend(v23, "unsignedLongLongValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Received Steps Removed: ", v7];
  v24 = [v6 objectForKeyedSubscript:@"ReceivedStepsRemoved"];

  if (v24) {
    objc_msgSend(v8, "appendFormat:", @"%hu\n", objc_msgSend(v24, "unsignedShortValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Received Time Source: ", v7];
  v25 = [v6 objectForKeyedSubscript:@"ReceivedTimeSource"];

  if (v25) {
    objc_msgSend(v8, "appendFormat:", @"%hhu\n", objc_msgSend(v25, "unsignedCharValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Battery Powered: ", v7];
  v26 = [v6 objectForKeyedSubscript:@"BatteryPowered"];

  if (v26)
  {
    if ([v26 BOOLValue]) {
      v27 = @"YES\n";
    }
    else {
      v27 = @"NO\n";
    }
    [v8 appendString:v27];
  }
  [v8 appendFormat:@"%@    External Power Connected: ", v7];
  v28 = [v6 objectForKeyedSubscript:@"ExternalPowerConnected"];

  if (v28)
  {
    if ([v28 BOOLValue]) {
      v29 = @"YES\n";
    }
    else {
      v29 = @"NO\n";
    }
    [v8 appendString:v29];
  }
  [v8 appendFormat:@"%@    Has Wired Ethernet Link Active: ", v7];
  v30 = [v6 objectForKeyedSubscript:@"HasWiredEthernetLinkActive"];

  if (v30)
  {
    if ([v30 BOOLValue]) {
      v31 = @"YES\n";
    }
    else {
      v31 = @"NO\n";
    }
    [v8 appendString:v31];
  }
  [v8 appendFormat:@"%@    Has Ethernet Hardware Timestamping: ", v7];
  v32 = [v6 objectForKeyedSubscript:@"HasEthernetHardwareTimestamping"];

  if (v32)
  {
    if ([v32 BOOLValue]) {
      v33 = @"YES\n";
    }
    else {
      v33 = @"NO\n";
    }
    [v8 appendString:v33];
  }
  [v8 appendFormat:@"%@    Has WiFi Hardware Timestamping: ", v7];
  v34 = [v6 objectForKeyedSubscript:@"HasWiFiHardwareTimestamping"];

  if (v34)
  {
    if ([v34 BOOLValue]) {
      v35 = @"YES\n";
    }
    else {
      v35 = @"NO\n";
    }
    [v8 appendString:v35];
  }
  [v8 appendFormat:@"%@    Local Oscillator Type: ", v7];
  v36 = [v6 objectForKeyedSubscript:@"LocalOscillatorType"];

  if (v36)
  {
    switch([v36 unsignedCharValue])
    {
      case 0u:
        v37 = @"Unknown\n";
        goto LABEL_78;
      case 1u:
        v37 = @"Crystal\n";
        goto LABEL_78;
      case 2u:
        v37 = @"MEMS\n";
        goto LABEL_78;
      case 3u:
        v37 = @"TCXO\n";
        goto LABEL_78;
      case 4u:
        v37 = @"VCO\n";
        goto LABEL_78;
      case 5u:
        v37 = @"VCYCXO\n";
        goto LABEL_78;
      case 6u:
        v37 = @"OCXO\n";
        goto LABEL_78;
      case 7u:
        v37 = @"DOCXO\n";
        goto LABEL_78;
      case 8u:
        v37 = @"VCOCXO\n";
        goto LABEL_78;
      case 9u:
        v37 = @"VCDOCXO\n";
        goto LABEL_78;
      default:
        objc_msgSend(v8, "appendFormat:", @"Undefined oscillator type %hhu\n", objc_msgSend(v36, "unsignedCharValue"));
        break;
    }
  }
  else
  {
    v37 = @"Could not read property\n";
LABEL_78:
    [v8 appendString:v37];
  }
  [v8 appendFormat:@"%@    Local Frequency Tolerance Lower: ", v7];
  v38 = [v6 objectForKeyedSubscript:@"LocalFrequencyToleranceLower"];

  if (v38) {
    objc_msgSend(v8, "appendFormat:", @"%d ppb\n", objc_msgSend(v38, "intValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Local Frequency Tolerance Upper: ", v7];
  v39 = [v6 objectForKeyedSubscript:@"LocalFrequencyToleranceUpper"];

  if (v39) {
    objc_msgSend(v8, "appendFormat:", @"%d ppb\n", objc_msgSend(v39, "intValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Local Frequency Stability Lower: ", v7];
  v40 = [v6 objectForKeyedSubscript:@"LocalFrequencyStabilityLower"];

  if (v40) {
    objc_msgSend(v8, "appendFormat:", @"%d ppb\n", objc_msgSend(v40, "intValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Local Frequency Stability Upper: ", v7];
  v41 = [v6 objectForKeyedSubscript:@"LocalFrequencyStabilityUpper"];

  if (v41) {
    objc_msgSend(v8, "appendFormat:", @"%d ppb\n", objc_msgSend(v41, "intValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end