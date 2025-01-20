@interface WiFiUsagePrivacyFilter
+ ($FEE1510A43A03BFC9F45CB2D5A0A197D)getModeCountersByCandidatesByBand:(SEL)a3;
+ ($FEE1510A43A03BFC9F45CB2D5A0A197D)getPercForFloatByBand:(SEL)a3 Over:(id *)a4;
+ ($FEE1510A43A03BFC9F45CB2D5A0A197D)getPercForIntegerByBand:(SEL)a3 Over:(id *)a4;
+ (BOOL)canPerformActionWithSampleRate:(unint64_t)a3;
+ (BOOL)isInternalInstall;
+ (BOOL)isLocallyAdministeredBitSetInBSSData:(id)a3;
+ (BOOL)isLocallyAdministeredBitSetInBSSString:(id)a3;
+ (double)timeSinceBootInSeconds;
+ (id)bandAsString:(int)a3;
+ (id)describeSampleRate:(unint64_t)a3;
+ (id)getBinEvery10Over100:(unint64_t)a3 As:(unint64_t)a4;
+ (id)getBinFor:(int64_t)a3 In:(id)a4 WithLowestEdge:(id)a5 As:(unint64_t)a6;
+ (id)getBinTimeInterval:(double)a3 As:(unint64_t)a4;
+ (id)getHumanSecondsFromObject:(id)a3;
+ (id)getHumanSecondsFromTimeInterval:(double)a3;
+ (id)getLabelForBandUsageDuration:(id *)a3 overTotalDuration:(double)a4 binned:(BOOL)a5;
+ (id)getLabelForCoreRssiMode:(unint64_t)a3;
+ (id)getLabelForIntegerByBand:(id *)a3;
+ (id)getLabelForIntegerByBand:(id *)a3 In:(id)a4 WithLowestEdge:(id)a5 As:(unint64_t)a6;
+ (id)getLabelForIntegerByBand:(id *)a3 withCap:(BOOL)a4;
+ (id)getLabelForIntegerByBandTransition:(id *)a3 In:(id)a4 WithLowestEdge:(id)a5 As:(unint64_t)a6;
+ (id)getLabelForNeighborsByBand:(id)a3;
+ (id)getLabelForPercIntegerByBand:(id *)a3;
+ (id)getLabelForPhyModes:(int)a3;
+ (id)getLabelForRTCoexType:(unint64_t)a3;
+ (id)getLabelForRssiByBand:(id *)a3;
+ (id)getLabelForRssiDeltaByBand:(id *)a3;
+ (id)getLabelForRssiDeltaByBandTransition:(id *)a3;
+ (id)getLabelForSteeringRequest:(unint64_t)a3;
+ (id)getLabelForTDMode:(int)a3;
+ (id)getLabelForTDTrigger:(int)a3;
+ (id)getLabelForUsbVendor:(unint64_t)a3;
+ (id)getLabelsForNetworkProperties:(id)a3;
+ (id)getSumArrayCountAllBand:(id)a3;
+ (id)localTimestamp:(id)a3;
+ (id)macAddressData:(id)a3;
+ (id)numberWithByteCount:(unint64_t)a3;
+ (id)numberWithDuration:(double)a3;
+ (id)numberWithDurationMillisecond:(double)a3;
+ (id)numberWithFrameCount:(unint64_t)a3;
+ (id)numberWithInstances:(unint64_t)a3;
+ (id)oui:(id)a3;
+ (id)reformatMACAddress:(id)a3;
+ (id)sanitizedOUI:(id)a3;
+ (id)subBandForBSPAsStringFromChannel:(int64_t)a3 andBand:(int)a4;
+ (id)timePercentage:(double)a3 overTotalDuration:(double)a4;
+ (id)toBinString:(id)a3;
+ (id)toHEXString:(char *)a3 length:(unint64_t)a4;
+ (id)twoSigFig:(unint64_t)a3;
+ (int)bandFromAppleChannelSpec:(int)a3;
+ (int)bandFromChanInfo:(id)a3;
+ (int)bandFromChannel:(unint64_t)a3;
+ (int)bandFromFlags:(id)a3 OrChannel:(id)a4;
+ (int)bandFromFlags:(unint64_t)a3;
+ (int64_t)getSumAllBands:(id *)a3;
+ (unint64_t)channelWidthAppleChannelSpec:(int)a3;
+ (unint64_t)channelWidthFromFlags:(unint64_t)a3;
+ (void)initialize;
@end

@implementation WiFiUsagePrivacyFilter

+ (BOOL)canPerformActionWithSampleRate:(unint64_t)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  unint64_t v9 = 0;
  switch(a3)
  {
    case 1uLL:
      goto LABEL_5;
    case 2uLL:
      a3 = 5;
      goto LABEL_5;
    case 3uLL:
      a3 = 10;
      goto LABEL_5;
    case 4uLL:
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __57__WiFiUsagePrivacyFilter_canPerformActionWithSampleRate___block_invoke;
      v5[3] = &unk_1E69BE700;
      v5[4] = &v6;
      +[WCAFetchWiFiBehaviorParameters fetchWiFiBehaviorWithCompletion:v5];
      goto LABEL_6;
    default:
      a3 = 49;
LABEL_5:
      unint64_t v9 = a3;
LABEL_6:
      BOOL v3 = v7[3] >= (unint64_t)arc4random_uniform(0x63u);
      _Block_object_dispose(&v6, 8);
      return v3;
  }
}

+ (void)initialize
{
  _isInternalInstall = MGGetBoolAnswer();
}

+ (id)numberWithDuration:(double)a3
{
  if (a3 >= 0.0)
  {
    v5 = [NSNumber numberWithUnsignedInteger:v3];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)numberWithDurationMillisecond:(double)a3
{
  return (id)[NSNumber numberWithUnsignedInteger:(unint64_t)(a3 * 1000.0)];
}

+ (id)timePercentage:(double)a3 overTotalDuration:(double)a4
{
  if (a4 <= 0.0)
  {
    uint64_t v6 = 0;
  }
  else
  {
    if (a3 > a4) {
      a3 = a4;
    }
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", (unint64_t)(a3 * 100.0 / a4 + 0.5), v4);
  }
  return v6;
}

+ (id)twoSigFig:(unint64_t)a3
{
  if (a3)
  {
    double v3 = (double)a3;
    double v4 = log10((double)a3);
    double v5 = __exp10(floor(v4) + -1.0);
    a3 = (unint64_t)(v5 * (double)(int)(v3 / v5));
  }
  uint64_t v6 = NSNumber;

  return (id)[v6 numberWithUnsignedInteger:a3];
}

+ (id)numberWithByteCount:(unint64_t)a3
{
  return +[WiFiUsagePrivacyFilter twoSigFig:a3];
}

+ (id)numberWithFrameCount:(unint64_t)a3
{
  return +[WiFiUsagePrivacyFilter twoSigFig:a3];
}

+ (id)numberWithInstances:(unint64_t)a3
{
  return (id)[NSNumber numberWithUnsignedInteger:a3];
}

+ (id)localTimestamp:(id)a3
{
  double v3 = (void *)MEMORY[0x1E4F1CAF0];
  id v4 = a3;
  double v5 = [v3 defaultTimeZone];
  uint64_t v6 = [v5 secondsFromGMTForDate:v4];
  v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v4 sinceDate:(double)v6];

  return v7;
}

+ (id)describeSampleRate:(unint64_t)a3
{
  if (a3 > 4) {
    return @"unknown";
  }
  else {
    return off_1E69BE720[a3];
  }
}

void __57__WiFiUsagePrivacyFilter_canPerformActionWithSampleRate___block_invoke(uint64_t a1, void *a2)
{
  double v3 = [a2 jtrnDefaults];
  if (v3)
  {
    double v5 = v3;
    id v4 = [v3 valueForKey:@"kWiFiUsagePrivacySampleRateNetworkName"];
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = (int)[v4 intValue];

    double v3 = v5;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

+ (double)timeSinceBootInSeconds
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  *(void *)uint64_t v8 = 0x1500000001;
  size_t v5 = 16;
  uint64_t v6 = 0;
  int v2 = sysctl(v8, 2u, &v6, &v5, 0, 0);
  double result = 0.0;
  if (!v2)
  {
    double v4 = (double)(int)v7 / 1000000.0 + (double)v6 - *MEMORY[0x1E4F1CF78];
    return CFAbsoluteTimeGetCurrent() - (double)(unint64_t)v4;
  }
  return result;
}

+ (id)getBinFor:(int64_t)a3 In:(id)a4 WithLowestEdge:(id)a5 As:(unint64_t)a6
{
  id v10 = a4;
  v11 = (__CFString *)a5;
  if ([v10 count])
  {
    unint64_t v12 = 0;
    v13 = 0;
    while (1)
    {
      v14 = [v10 objectAtIndexedSubscript:v12];
      int64_t v15 = [v14 integerValue];

      if (v15 >= a3) {
        break;
      }
      v16 = [v10 objectAtIndexedSubscript:v12];

      ++v12;
      v13 = v16;
      if ([v10 count] <= v12) {
        goto LABEL_8;
      }
    }
    v16 = v13;
  }
  else
  {
    v16 = 0;
    unint64_t v12 = 0;
  }
LABEL_8:
  v17 = v16;
  v18 = v17;
  if ([v10 count] > v12)
  {
    v19 = [v10 objectAtIndexedSubscript:v12];
    int64_t v20 = [v19 integerValue];

    v18 = v17;
    if (v20 >= a3)
    {
      v18 = [v10 objectAtIndexedSubscript:v12];
    }
  }
  if ([v10 count] == v12 && -[__CFString integerValue](v18, "integerValue") < a3)
  {

    v18 = 0;
  }
  switch(a6)
  {
    case 2uLL:
      v23 = v18;
LABEL_24:
      v24 = v23;
      goto LABEL_33;
    case 1uLL:
      v25 = NSString;
      if (v17) {
        v26 = v17;
      }
      else {
        v26 = v11;
      }
      v27 = [a1 getHumanSecondsFromObject:v26];
      if (v18) {
        v28 = v18;
      }
      else {
        v28 = @"+inf";
      }
      v29 = [a1 getHumanSecondsFromObject:v28];
      v24 = objc_msgSend(v25, "stringWithFormat:", @"(%@:%@]"), v27, v29;

      goto LABEL_33;
    case 0uLL:
      if (v17) {
        v21 = v17;
      }
      else {
        v21 = v11;
      }
      v22 = @"+inf";
      if (v18) {
        v22 = v18;
      }
      objc_msgSend(NSString, "stringWithFormat:", @"(%@:%@]"), v21, v22;
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
  }
  v24 = 0;
LABEL_33:

  return v24;
}

+ (id)getBinTimeInterval:(double)a3 As:(unint64_t)a4
{
  return (id)[a1 getBinFor:(unint64_t)a3 In:&unk_1F2B95590 WithLowestEdge:@"0" As:a4];
}

+ (id)getHumanSecondsFromObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
LABEL_5:
    uint64_t v6 = v5;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(a1, "getHumanSecondsFromTimeInterval:", (double)(unint64_t)objc_msgSend(v4, "unsignedIntegerValue"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  uint64_t v6 = 0;
LABEL_7:

  return v6;
}

+ (id)getHumanSecondsFromTimeInterval:(double)a3
{
  id v4 = objc_opt_new();
  id v5 = v4;
  if (a3 >= 86400.0)
  {
    objc_msgSend(v4, "appendFormat:", @"%lud", (unint64_t)(a3 / 86400.0));
    a3 = a3 - (double)(86400 * (unint64_t)(a3 / 86400.0));
  }
  if (a3 >= 3600.0)
  {
    objc_msgSend(v5, "appendFormat:", @"%luh", (unint64_t)(a3 / 3600.0));
    a3 = a3 - (double)(3600 * (unint64_t)(a3 / 3600.0));
  }
  if (a3 >= 60.0)
  {
    objc_msgSend(v5, "appendFormat:", @"%lum", (unint64_t)(a3 / 60.0));
    a3 = a3 - (double)(60 * (unint64_t)(a3 / 60.0));
  }
  if (a3 > 0.0) {
    objc_msgSend(v5, "appendFormat:", @"%lus", (unint64_t)a3);
  }
  uint64_t v6 = [NSString stringWithString:v5];

  return v6;
}

+ (id)getBinEvery10Over100:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:a3 In:&unk_1F2B955A8 WithLowestEdge:@"0" As:a4];
}

+ (id)toHEXString:(char *)a3 length:(unint64_t)a4
{
  id v4 = (__CFString *)a4;
  if (a4)
  {
    uint64_t v6 = malloc_type_malloc((2 * a4) | 1, 0x100004077774924uLL);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = v6;
      do
      {
        unsigned int v9 = *a3++;
        *uint64_t v8 = a0123456789abcd[(unint64_t)v9 >> 4];
        v8[1] = a0123456789abcd[v9 & 0xF];
        v8 += 2;
        id v4 = (__CFString *)((char *)v4 - 1);
      }
      while (v4);
      *uint64_t v8 = 0;
      id v4 = [NSString stringWithUTF8String:v6];
      free(v7);
    }
    else
    {
      id v4 = 0;
    }
  }
  if (v4) {
    id v10 = v4;
  }
  else {
    id v10 = &stru_1F2B5AC50;
  }
  v11 = v10;

  return v11;
}

+ (id)macAddressData:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3
    && (id v5 = v3, [v5 UTF8String])
    && (uint64_t v6 = ether_aton((const char *)[v5 UTF8String])) != 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v6 length:6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)toBinString:(id)a3
{
  id v3 = a3;
  id v4 = (unsigned __int8 *)[v3 bytes];
  if (![v3 length] && objc_msgSend(v3, "length") != 6)
  {
    NSLog(&cfstr_SIsNotAMacAddr.isa, "+[WiFiUsagePrivacyFilter toBinString:]", v3);
    goto LABEL_11;
  }
  id v5 = malloc_type_malloc((8 * [v3 length]) | 1, 0x100004077774924uLL);
  if (!v5)
  {
LABEL_11:
    v11 = 0;
    goto LABEL_12;
  }
  uint64_t v6 = v5;
  uint64_t v7 = v5;
  if ([v3 length])
  {
    unint64_t v8 = 0;
    uint64_t v7 = v6;
    do
    {
      uint64_t v9 = 0;
      unsigned __int8 v10 = *v4;
      do
      {
        v7[v9] = v10 & 1 | 0x30;
        v10 >>= 1;
        ++v9;
      }
      while (v9 != 8);
      ++v4;
      ++v8;
      v7 += v9;
    }
    while ([v3 length] > v8);
  }
  unsigned char *v7 = 0;
  v11 = [NSString stringWithUTF8String:v6];
  free(v6);
LABEL_12:
  if (v11) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = &stru_1F2B5AC50;
  }
  v13 = v12;

  return v13;
}

+ (BOOL)isLocallyAdministeredBitSetInBSSData:(id)a3
{
  id v3 = [a1 toBinString:a3];
  id v4 = v3;
  BOOL v5 = v3
    && (unint64_t)[v3 length] >= 2
    && [v4 characterAtIndex:1] == 49;

  return v5;
}

+ (BOOL)isLocallyAdministeredBitSetInBSSString:(id)a3
{
  id v3 = a1;
  id v4 = [a1 macAddressData:a3];
  LOBYTE(v3) = [v3 isLocallyAdministeredBitSetInBSSData:v4];

  return (char)v3;
}

+ (id)reformatMACAddress:(id)a3
{
  id v3 = a3;
  if (v3
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (id v4 = v3, [v4 UTF8String])
    && (BOOL v5 = ether_aton((const char *)[v4 UTF8String])) != 0)
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%02x:%02x:%02x:%02x:%02x:%02x", v5->octet[0], v5->octet[1], v5->octet[2], v5->octet[3], v5->octet[4], v5->octet[5]);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)oui:(id)a3
{
  id v3 = a3;
  if (v3
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (id v4 = v3, [v4 UTF8String])
    && (BOOL v5 = ether_aton((const char *)[v4 UTF8String])) != 0)
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%02x:%02x:%02x", v5->octet[0], v5->octet[1], v5->octet[2]);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)sanitizedOUI:(id)a3
{
  id v3 = a3;
  if (v3
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (id v4 = v3, [v4 UTF8String])
    && (BOOL v5 = ether_aton((const char *)[v4 UTF8String])) != 0)
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%02x:%02x:%02x", v5->octet[0] & 0xFC, v5->octet[1], v5->octet[2]);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (BOOL)isInternalInstall
{
  return _isInternalInstall;
}

+ (int64_t)getSumAllBands:(id *)a3
{
  uint64_t v3 = 0;
  int64_t result = 0;
  do
  {
    if (a3->var1[v3]) {
      result += a3->var0[v3];
    }
    ++v3;
  }
  while (v3 != 3);
  return result;
}

+ ($FEE1510A43A03BFC9F45CB2D5A0A197D)getPercForIntegerByBand:(SEL)a3 Over:(id *)a4
{
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[2] = 0u;
  if (a5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v7 = *(_OWORD *)&a4->var0[2];
    v9[0] = *(_OWORD *)a4->var0;
    v9[1] = v7;
    int64_t result = ($FEE1510A43A03BFC9F45CB2D5A0A197D *)[($FEE1510A43A03BFC9F45CB2D5A0A197D *)result getSumAllBands:v9];
    a5 = (unint64_t)result;
  }
  for (uint64_t i = 0; i != 3; ++i)
  {
    if (a4->var1[i])
    {
      retstr->var0[i] = (unint64_t)((double)a4->var0[i] * 100.0 / (double)a5 + 0.5);
      retstr->var1[i] = 1;
    }
  }
  return result;
}

+ ($FEE1510A43A03BFC9F45CB2D5A0A197D)getPercForFloatByBand:(SEL)a3 Over:(id *)a4
{
  uint64_t v5 = 0;
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[2] = 0u;
  do
  {
    if (a4->var1[v5])
    {
      retstr->var0[v5] = (unint64_t)(a4->var0[v5] * 100.0 / a5 + 0.5);
      retstr->var1[v5] = 1;
    }
    ++v5;
  }
  while (v5 != 3);
  return result;
}

+ (id)getSumArrayCountAllBand:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v3 = objc_msgSend(a3, "allValues", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = 0;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v3);
          }
          v6 += [*(id *)(*((void *)&v11 + 1) + 8 * i) count];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }
    else
    {
      uint64_t v6 = 0;
    }

    uint64_t v9 = [NSNumber numberWithInteger:v6];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ ($FEE1510A43A03BFC9F45CB2D5A0A197D)getModeCountersByCandidatesByBand:(SEL)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[2] = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = [v5 allKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        long long v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v13 = objc_msgSend(v5, "objectForKeyedSubscript:", v12, v17, v18);
        unint64_t v14 = [v13 count];

        if (v14 > v9)
        {
          int64_t v15 = [v5 objectForKeyedSubscript:v12];
          unint64_t v9 = [v15 count];

          if (v12)
          {
            [v12 candidateSet];
          }
          else
          {
            long long v17 = 0u;
            long long v18 = 0u;
          }
          *(_OWORD *)retstr->var0 = v17;
          *(_OWORD *)&retstr->var0[2] = v18;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  return result;
}

+ (id)getLabelForIntegerByBand:(id *)a3 withCap:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = objc_opt_new();
  for (uint64_t i = 0; i != 3; ++i)
  {
    if (a3->var1[i])
    {
      if (v4 && a3->var0[i] > 5)
      {
        uint64_t v8 = +[WiFiUsagePrivacyFilter bandAsString:i];
        [v6 appendFormat:@"%@GHz>%d ", v8, 5];
      }
      else
      {
        uint64_t v8 = +[WiFiUsagePrivacyFilter bandAsString:i];
        [v6 appendFormat:@"%@GHz:%lu ", v8, a3->var0[i]];
      }
    }
  }
  if ([v6 isEqualToString:&stru_1F2B5AC50])
  {
    unint64_t v9 = 0;
  }
  else
  {
    unint64_t v9 = [NSString stringWithString:v6];
  }

  return v9;
}

+ (id)getLabelForIntegerByBand:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[2];
  v6[0] = *(_OWORD *)a3->var0;
  v6[1] = v3;
  BOOL v4 = [a1 getLabelForIntegerByBand:v6 withCap:0];

  return v4;
}

+ (id)getLabelForIntegerByBand:(id *)a3 In:(id)a4 WithLowestEdge:(id)a5 As:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a5;
  long long v12 = objc_opt_new();
  uint64_t v13 = 0;
  if (a6 == 2) {
    unint64_t v14 = @"<=";
  }
  else {
    unint64_t v14 = @":";
  }
  do
  {
    if (a3->var1[v13])
    {
      int64_t v15 = [a1 bandAsString:v13];
      uint64_t v16 = [a1 getBinFor:a3->var0[v13] In:v10 WithLowestEdge:v11 As:a6];
      [v12 appendFormat:@"%@GHz%@%@ ", v15, v14, v16];
    }
    ++v13;
  }
  while (v13 != 3);
  long long v17 = [NSString stringWithString:v12];

  return v17;
}

+ (id)getLabelForIntegerByBandTransition:(id *)a3 In:(id)a4 WithLowestEdge:(id)a5 As:(unint64_t)a6
{
  id v22 = a4;
  id v21 = a5;
  long long v20 = objc_opt_new();
  uint64_t v10 = 0;
  unint64_t v11 = a6;
  if (a6 == 2) {
    long long v12 = @"<=";
  }
  else {
    long long v12 = @":";
  }
  var1 = a3->var1;
  do
  {
    for (uint64_t i = 0; i != 3; ++i)
    {
      if ((*var1)[i])
      {
        int64_t v15 = [a1 bandAsString:v10];
        uint64_t v16 = [a1 bandAsString:i];
        long long v17 = [a1 getBinFor:a3->var0[0][i] In:v22 WithLowestEdge:v21 As:v11];
        [v20 appendFormat:@"%@GHz->%@GHz%@%@ ", v15, v16, v12, v17];
      }
    }
    ++v10;
    ++var1;
    a3 = ($13477CEFC6EEA4B326536BBEC35DF1AE *)((char *)a3 + 24);
  }
  while (v10 != 3);
  long long v18 = [NSString stringWithString:v20];

  return v18;
}

+ (id)getLabelForPercIntegerByBand:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0[2];
  v7[0] = *(_OWORD *)a3->var0;
  v7[1] = v4;
  [a1 getPercForIntegerByBand:v7 Over:0x7FFFFFFFFFFFFFFFLL];
  id v5 = [a1 getLabelForIntegerByBand:v8 In:&unk_1F2B955C0 WithLowestEdge:@"0" As:2];

  return v5;
}

+ (id)getLabelForNeighborsByBand:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    long long v4 = objc_opt_new();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = [v3 allKeys];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          unint64_t v11 = [v3 objectForKeyedSubscript:v10];
          unint64_t v12 = [v11 count];

          uint64_t v13 = +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:", [v10 unsignedIntValue]);
          unint64_t v14 = (void *)v13;
          if (v12 > 5) {
            [v4 appendFormat:@"%@GHz>%d ", v13, 5];
          }
          else {
            [v4 appendFormat:@"%@GHz:%lu ", v13, v12];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }

    if ([v4 isEqualToString:&stru_1F2B5AC50])
    {
      int64_t v15 = 0;
    }
    else
    {
      int64_t v15 = [NSString stringWithString:v4];
    }
  }
  else
  {
    int64_t v15 = 0;
  }

  return v15;
}

+ (id)getLabelForBandUsageDuration:(id *)a3 overTotalDuration:(double)a4 binned:(BOOL)a5
{
  long long v27 = 0u;
  long long v28 = 0u;
  long long v9 = *(_OWORD *)&a3->var0[2];
  v26[0] = *(_OWORD *)a3->var0;
  v26[1] = v9;
  [a1 getPercForFloatByBand:v26 Over:a4];
  if (a5)
  {
    if (a4 == 0.0)
    {
      uint64_t v10 = 0;
    }
    else
    {
      v25[0] = v27;
      v25[1] = v28;
      uint64_t v10 = [a1 getLabelForIntegerByBand:v25 In:&unk_1F2B955D8 WithLowestEdge:@"0" As:2];
    }
  }
  else
  {
    unint64_t v11 = NSString;
    unint64_t v12 = +[WiFiUsagePrivacyFilter bandAsString:0];
    double v13 = 0.0;
    double v14 = 0.0;
    if (a3->var1[0]) {
      double v14 = a3->var0[0];
    }
    if (BYTE8(v28)) {
      uint64_t v15 = v27;
    }
    else {
      uint64_t v15 = 0;
    }
    uint64_t v16 = +[WiFiUsagePrivacyFilter bandAsString:1];
    if (a3->var1[1]) {
      double v13 = a3->var0[1];
    }
    if (BYTE9(v28)) {
      uint64_t v17 = *((void *)&v27 + 1);
    }
    else {
      uint64_t v17 = 0;
    }
    long long v18 = NSString;
    uint64_t v19 = +[WiFiUsagePrivacyFilter bandAsString:2];
    long long v20 = (void *)v19;
    if (a3->var1[2]) {
      double v21 = a3->var0[2];
    }
    else {
      double v21 = 0.0;
    }
    if (BYTE10(v28)) {
      uint64_t v22 = v28;
    }
    else {
      uint64_t v22 = 0;
    }
    v23 = [v18 stringWithFormat:@"%@:%fs/%fs(%lu%%)", v19, *(void *)&v21, *(void *)&a4, v22];
    uint64_t v10 = [v11 stringWithFormat:@"%@:%fs/%fs(%ld%%) %@:%fs/%fs(%lu%%) %@", v12, *(void *)&v14, *(void *)&a4, v15, v16, *(void *)&v13, *(void *)&a4, v17, v23];
  }

  return v10;
}

+ (id)getLabelForRssiByBand:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[2];
  v6[0] = *(_OWORD *)a3->var0;
  v6[1] = v3;
  long long v4 = [a1 getLabelForIntegerByBand:v6 In:&unk_1F2B955F0 WithLowestEdge:@"-inf" As:0];

  return v4;
}

+ (id)getLabelForRssiDeltaByBand:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[2];
  v6[0] = *(_OWORD *)a3->var0;
  v6[1] = v3;
  long long v4 = [a1 getLabelForIntegerByBand:v6 In:&unk_1F2B95608 WithLowestEdge:@"-inf" As:0];

  return v4;
}

+ (id)getLabelForRssiDeltaByBandTransition:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[2][0];
  _OWORD v7[2] = *(_OWORD *)&a3->var0[1][1];
  v7[3] = v3;
  v7[4] = *(_OWORD *)&a3->var0[2][2];
  uint64_t v8 = *(void *)&a3->var1[2][2];
  long long v4 = *(_OWORD *)&a3->var0[0][2];
  v7[0] = *(_OWORD *)&a3->var0[0][0];
  v7[1] = v4;
  id v5 = [a1 getLabelForIntegerByBandTransition:v7 In:&unk_1F2B95620 WithLowestEdge:@"-inf" As:0];

  return v5;
}

+ (id)getLabelForRTCoexType:(unint64_t)a3
{
  if (a3) {
    return @"Unknown";
  }
  else {
    return @"AWDL RealTime";
  }
}

+ (id)getLabelForSteeringRequest:(unint64_t)a3
{
  if (a3 > 3) {
    return @"Unknown";
  }
  else {
    return off_1E69BE748[a3];
  }
}

+ (id)getLabelForTDMode:(int)a3
{
  if ((a3 - 1) > 2) {
    return @"Unknown";
  }
  else {
    return off_1E69BE768[a3 - 1];
  }
}

+ (id)getLabelForTDTrigger:(int)a3
{
  if (a3 > 0xE) {
    return @"Unknown";
  }
  else {
    return off_1E69BE780[a3];
  }
}

+ (id)getLabelForCoreRssiMode:(unint64_t)a3
{
  if (a3 > 2) {
    return @"Unknown";
  }
  else {
    return off_1E69BE7F8[a3];
  }
}

+ (id)getLabelForUsbVendor:(unint64_t)a3
{
  if ((uint64_t)a3 <= 1920)
  {
    if ((uint64_t)a3 > 1438)
    {
      switch(a3)
      {
        case 0x59FuLL:
          return @"LaCie";
        case 0x5ACuLL:
          return @"Apple";
        case 0x5DCuLL:
          return @"Lexar";
      }
    }
    else
    {
      switch(a3)
      {
        case 0uLL:
          return @"DeviceMode";
        case 0x477uLL:
          return @"Seagate";
        case 0x4E8uLL:
          return @"Samsung";
      }
    }
  }
  else if ((uint64_t)a3 <= 5420)
  {
    switch(a3)
    {
      case 0x781uLL:
        return @"SanDisk";
      case 0x951uLL:
        return @"Kingston";
      case 0x1058uLL:
        return @"Western Digital";
    }
  }
  else if ((uint64_t)a3 > 18320)
  {
    if (a3 == 18321) {
      return @"G-Technology";
    }
    if (a3 == 0xFFFF) {
      return @"DisplayPort";
    }
  }
  else
  {
    if (a3 == 5421) {
      return @"Sabrent";
    }
    if (a3 == 8201) {
      return @"iStorage";
    }
  }
  return @"Other";
}

+ (id)getLabelForPhyModes:(int)a3
{
  __int16 v3 = a3;
  long long v4 = objc_opt_new();
  id v5 = v4;
  if ((v3 & 0x400) != 0)
  {
    [v4 addObject:@"6Ghz"];
    if ((v3 & 0x200) == 0)
    {
LABEL_3:
      if ((v3 & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((v3 & 0x200) == 0)
  {
    goto LABEL_3;
  }
  [v5 addObject:@"11BE"];
  if ((v3 & 0x100) == 0)
  {
LABEL_4:
    if ((v3 & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v5 addObject:@"11AX"];
  if ((v3 & 0x80) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_19:
  [v5 addObject:@"11AC"];
  if ((v3 & 0x10) != 0) {
LABEL_6:
  }
    [v5 addObject:@"11N"];
LABEL_7:
  if ((v3 & 0x48) != 0) {
    [v5 addObject:@"11G"];
  }
  if ((v3 & 0x22) != 0) {
    [v5 addObject:@"11A"];
  }
  if ((v3 & 4) != 0) {
    [v5 addObject:@"11B"];
  }
  uint64_t v6 = [v5 componentsJoinedByString:@"|"];

  return v6;
}

+ (id)getLabelsForNetworkProperties:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v16 = [MEMORY[0x1E4F28E78] stringWithString:&stru_1F2B5AC50];
  uint64_t v17 = [MEMORY[0x1E4F28E78] stringWithString:&stru_1F2B5AC50];
  unsigned int outCount = 0;
  long long v4 = (objc_class *)objc_opt_class();
  id v5 = class_copyPropertyList(v4, &outCount);
  uint64_t v6 = v5;
  if (outCount)
  {
    unint64_t v7 = 0;
    uint64_t v8 = MEMORY[0x1E4F1CC38];
    do
    {
      long long v9 = objc_msgSend(NSString, "stringWithCString:encoding:", property_getName(v6[v7]), objc_msgSend(NSString, "defaultCStringEncoding"));
      if ([v9 hasPrefix:@"is"])
      {
        uint64_t v10 = [v3 valueForKey:v9];
        if ([v10 isEqual:v8]
          && ![v9 isEqualToString:@"isWork"])
        {
          char v13 = [v9 isEqualToString:@"isHome"];

          if ((v13 & 1) == 0) {
            [v16 appendFormat:@"%@&", v9];
          }
        }
        else
        {
        }
      }
      if (([v9 hasPrefix:@"has"] & 1) != 0
        || [v9 hasPrefix:@"requires"])
      {
        unint64_t v11 = [v3 valueForKey:v9];
        int v12 = [v11 isEqual:v8];

        if (v12) {
          [v17 appendFormat:@"%@&", v9];
        }
      }

      ++v7;
    }
    while (v7 < outCount);
  }
  else if (!v5)
  {
    goto LABEL_17;
  }
  free(v6);
LABEL_17:
  if ([v3 captiveStatus] == 2) {
    [v16 appendFormat:@"%@&", @"isCaptive"];
  }
  v19[0] = @"networkType";
  v19[1] = @"networkProperties";
  v20[0] = v16;
  v20[1] = v17;
  double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

  return v14;
}

+ (id)bandAsString:(int)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return off_1E69BE810[a3];
  }
}

+ (id)subBandForBSPAsStringFromChannel:(int64_t)a3 andBand:(int)a4
{
  if (a4 != 1) {
    goto LABEL_10;
  }
  if ((unint64_t)(a3 - 32) < 0x25)
  {
    uint64_t v6 = @"5low";
    return v6;
  }
  if ((unint64_t)(a3 - 96) < 0x46)
  {
    uint64_t v6 = @"5high";
  }
  else
  {
LABEL_10:
    objc_msgSend(a1, "bandAsString:", *(void *)&a4, v4);
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

+ (int)bandFromFlags:(id)a3 OrChannel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 integerValue] >= 1)
  {
    int v8 = objc_msgSend(a1, "bandFromFlags:", objc_msgSend(v6, "integerValue"));
    if (!v7) {
      goto LABEL_10;
    }
  }
  else
  {
    int v8 = 3;
    if (!v7) {
      goto LABEL_10;
    }
  }
  if (v8 == 3)
  {
    if ([v7 unsignedIntegerValue]) {
      int v8 = objc_msgSend(a1, "bandFromChannel:", objc_msgSend(v7, "unsignedIntegerValue"));
    }
    else {
      int v8 = 3;
    }
  }
LABEL_10:

  return v8;
}

+ (unint64_t)channelWidthFromFlags:(unint64_t)a3
{
  unint64_t v3 = 80;
  uint64_t v4 = 40;
  if ((a3 & 4) == 0) {
    uint64_t v4 = 20;
  }
  if ((a3 & 0x400) == 0) {
    unint64_t v3 = v4;
  }
  if ((a3 & 0x800) != 0) {
    return 160;
  }
  else {
    return v3;
  }
}

+ (int)bandFromFlags:(unint64_t)a3
{
  if ((a3 & 0x2000) != 0) {
    int v3 = 2;
  }
  else {
    int v3 = 3;
  }
  if ((a3 & 0x10) != 0) {
    int v4 = 1;
  }
  else {
    int v4 = v3;
  }
  if ((a3 & 8) != 0) {
    return 0;
  }
  else {
    return v4;
  }
}

+ (int)bandFromChannel:(unint64_t)a3
{
  if (a3 - 36 < 0x86) {
    int v3 = 1;
  }
  else {
    int v3 = 3;
  }
  if (a3 >= 0xF) {
    return v3;
  }
  else {
    return 0;
  }
}

+ (int)bandFromChanInfo:(id)a3
{
  int v3 = [a3 objectForKeyedSubscript:@"CHANNELINFO_BAND_NUM"];
  int v4 = v3;
  if (v3 && (unint64_t v5 = [v3 integerValue], v5 <= 3)) {
    int v6 = dword_1D3D95DC0[v5];
  }
  else {
    int v6 = 3;
  }

  return v6;
}

+ (int)bandFromAppleChannelSpec:(int)a3
{
  if (a3 > 3) {
    return 3;
  }
  else {
    return dword_1D3D95DC0[a3];
  }
}

+ (unint64_t)channelWidthAppleChannelSpec:(int)a3
{
  if ((a3 - 1) > 4) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return qword_1D3D95DD0[a3 - 1];
  }
}

@end