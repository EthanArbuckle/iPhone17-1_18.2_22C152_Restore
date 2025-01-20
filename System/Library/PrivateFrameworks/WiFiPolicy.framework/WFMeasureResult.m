@interface WFMeasureResult
+ (void)initialize;
- (BOOL)backhaulResultsValid;
- (BOOL)dnsResultsValid;
- (BOOL)dnsSuccess;
- (BOOL)gatewayResultsValid;
- (BOOL)localResultsValid;
- (BOOL)publicResultsValid;
- (BOOL)seenSpecificAcFailure;
- (BOOL)siriACEResultsValid;
- (BOOL)siriACESuccess;
- (BOOL)siriTCPResultsValid;
- (BOOL)siriTCPSuccess;
- (BOOL)siriTLSResultsValid;
- (BOOL)siriTLSSuccess;
- (NSError)downloadError;
- (NSMutableSet)dnsServers;
- (NSString)gatewayAddress;
- (WFMeasureResult)initWithType:(unint64_t)a3;
- (double)backhaulThroughput;
- (id)allPrimitiveProperties;
- (id)binnedProperty:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)statusForAcFailure;
- (id)statusForDNS;
- (id)statusForInternet;
- (id)statusForLocal;
- (id)statusForSiriTCP;
- (id)statusForSiriTLS;
- (id)typeAsString;
- (int64_t)gatewayMaxRTT;
- (int64_t)gatewayMinRTT;
- (int64_t)gatewayPacketLoss;
- (int64_t)localDNSMaxRTT;
- (int64_t)localDNSMinRTT;
- (int64_t)localDNSPacketLoss;
- (int64_t)publicDNSMaxRTT;
- (int64_t)publicDNSMinRTT;
- (int64_t)publicDNSPacketLoss;
- (int64_t)siriTrafficClass;
- (int64_t)trafficClassBEAttemptedLarge;
- (int64_t)trafficClassBEAttemptedSmall;
- (int64_t)trafficClassBESucceededLarge;
- (int64_t)trafficClassBESucceededSmall;
- (int64_t)trafficClassBKAttemptedLarge;
- (int64_t)trafficClassBKAttemptedSmall;
- (int64_t)trafficClassBKSucceededLarge;
- (int64_t)trafficClassBKSucceededSmall;
- (int64_t)trafficClassVIAttemptedLarge;
- (int64_t)trafficClassVIAttemptedSmall;
- (int64_t)trafficClassVISucceededLarge;
- (int64_t)trafficClassVISucceededSmall;
- (int64_t)trafficClassVOAttemptedLarge;
- (int64_t)trafficClassVOAttemptedSmall;
- (int64_t)trafficClassVOSucceededLarge;
- (int64_t)trafficClassVOSucceededSmall;
- (unint64_t)numAcAttempted;
- (unint64_t)numAcFailed;
- (unint64_t)numAcSuccess;
- (unint64_t)numLargePingPacketsAttempted;
- (unint64_t)numLargePingPacketsFailed;
- (unint64_t)numLargePingPacketsSuccess;
- (unint64_t)numPingPacketsAttempted;
- (unint64_t)numPingPacketsFailed;
- (unint64_t)numPingPacketsSuccess;
- (unint64_t)numSmallPingPacketsAttempted;
- (unint64_t)numSmallPingPacketsFailed;
- (unint64_t)numSmallPingPacketsSuccess;
- (unint64_t)options;
- (unint64_t)type;
- (void)setBackhaulResultsValid:(BOOL)a3;
- (void)setBackhaulThroughput:(double)a3;
- (void)setDnsResultsValid:(BOOL)a3;
- (void)setDnsServers:(id)a3;
- (void)setDnsSuccess:(BOOL)a3;
- (void)setDownloadError:(id)a3;
- (void)setGatewayAddress:(id)a3;
- (void)setGatewayMaxRTT:(int64_t)a3;
- (void)setGatewayMinRTT:(int64_t)a3;
- (void)setGatewayPacketLoss:(int64_t)a3;
- (void)setGatewayResultsValid:(BOOL)a3;
- (void)setLocalDNSMaxRTT:(int64_t)a3;
- (void)setLocalDNSMinRTT:(int64_t)a3;
- (void)setLocalDNSPacketLoss:(int64_t)a3;
- (void)setLocalResultsValid:(BOOL)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setPublicDNSMaxRTT:(int64_t)a3;
- (void)setPublicDNSMinRTT:(int64_t)a3;
- (void)setPublicDNSPacketLoss:(int64_t)a3;
- (void)setPublicResultsValid:(BOOL)a3;
- (void)setSeenSpecificAcFailure:(BOOL)a3;
- (void)setSiriACEResultsValid:(BOOL)a3;
- (void)setSiriACESuccess:(BOOL)a3;
- (void)setSiriTCPResultsValid:(BOOL)a3;
- (void)setSiriTCPSuccess:(BOOL)a3;
- (void)setSiriTLSResultsValid:(BOOL)a3;
- (void)setSiriTLSSuccess:(BOOL)a3;
- (void)setSiriTrafficClass:(int64_t)a3;
- (void)setTrafficClassBEAttemptedLarge:(int64_t)a3;
- (void)setTrafficClassBEAttemptedSmall:(int64_t)a3;
- (void)setTrafficClassBESucceededLarge:(int64_t)a3;
- (void)setTrafficClassBESucceededSmall:(int64_t)a3;
- (void)setTrafficClassBKAttemptedLarge:(int64_t)a3;
- (void)setTrafficClassBKAttemptedSmall:(int64_t)a3;
- (void)setTrafficClassBKSucceededLarge:(int64_t)a3;
- (void)setTrafficClassBKSucceededSmall:(int64_t)a3;
- (void)setTrafficClassVIAttemptedLarge:(int64_t)a3;
- (void)setTrafficClassVIAttemptedSmall:(int64_t)a3;
- (void)setTrafficClassVISucceededLarge:(int64_t)a3;
- (void)setTrafficClassVISucceededSmall:(int64_t)a3;
- (void)setTrafficClassVOAttemptedLarge:(int64_t)a3;
- (void)setTrafficClassVOAttemptedSmall:(int64_t)a3;
- (void)setTrafficClassVOSucceededLarge:(int64_t)a3;
- (void)setTrafficClassVOSucceededSmall:(int64_t)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation WFMeasureResult

- (WFMeasureResult)initWithType:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFMeasureResult;
  v4 = [(WFMeasureResult *)&v6 init];
  [(WFMeasureResult *)v4 setType:a3];
  [(WFMeasureResult *)v4 setBackhaulResultsValid:0];
  [(WFMeasureResult *)v4 setGatewayResultsValid:0];
  [(WFMeasureResult *)v4 setLocalResultsValid:0];
  [(WFMeasureResult *)v4 setPublicResultsValid:0];
  [(WFMeasureResult *)v4 setDnsResultsValid:0];
  [(WFMeasureResult *)v4 setSiriTCPResultsValid:0];
  [(WFMeasureResult *)v4 setSiriTLSResultsValid:0];
  [(WFMeasureResult *)v4 setSeenSpecificAcFailure:0];
  [(WFMeasureResult *)v4 setTrafficClassBEAttemptedSmall:0];
  [(WFMeasureResult *)v4 setTrafficClassBKAttemptedSmall:0];
  [(WFMeasureResult *)v4 setTrafficClassVOAttemptedSmall:0];
  [(WFMeasureResult *)v4 setTrafficClassVIAttemptedSmall:0];
  [(WFMeasureResult *)v4 setTrafficClassBESucceededSmall:0];
  [(WFMeasureResult *)v4 setTrafficClassBKSucceededSmall:0];
  [(WFMeasureResult *)v4 setTrafficClassVOSucceededSmall:0];
  [(WFMeasureResult *)v4 setTrafficClassVISucceededSmall:0];
  [(WFMeasureResult *)v4 setTrafficClassBEAttemptedLarge:0];
  [(WFMeasureResult *)v4 setTrafficClassBKAttemptedLarge:0];
  [(WFMeasureResult *)v4 setTrafficClassVOAttemptedLarge:0];
  [(WFMeasureResult *)v4 setTrafficClassVIAttemptedLarge:0];
  [(WFMeasureResult *)v4 setTrafficClassBESucceededLarge:0];
  [(WFMeasureResult *)v4 setTrafficClassBKSucceededLarge:0];
  [(WFMeasureResult *)v4 setTrafficClassVOSucceededLarge:0];
  [(WFMeasureResult *)v4 setTrafficClassVISucceededLarge:0];
  return v4;
}

- (id)statusForLocal
{
  if (self->_gatewayResultsValid)
  {
    int64_t gatewayPacketLoss = self->_gatewayPacketLoss;
    if (gatewayPacketLoss == 100)
    {
      v3 = &kWFMeasureStatusBroken;
    }
    else
    {
      BOOL v5 = self->_gatewayMaxRTT < 100 && gatewayPacketLoss < 50;
      v3 = &kWFMeasureStatusSlow;
      if (v5) {
        v3 = &kWFMeasureStatusOK;
      }
    }
    v4 = *v3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)statusForInternet
{
  if (self->_dnsResultsValid && self->_gatewayResultsValid && self->_publicResultsValid)
  {
    if (self->_dnsSuccess)
    {
      if (self->_gatewayMaxRTT <= 100) {
        v2 = &kWFMeasureStatusOK;
      }
      else {
        v2 = &kWFMeasureStatusSlow;
      }
    }
    else
    {
      v2 = &kWFMeasureStatusLimited;
      if (self->_publicDNSPacketLoss >= 50 && self->_gatewayPacketLoss >= 50) {
        v2 = &kWFMeasureStatusBroken;
      }
    }
    v3 = *v2;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)statusForDNS
{
  if (self->_dnsResultsValid)
  {
    v2 = &kWFMeasureStatusBroken;
    if (self->_dnsSuccess) {
      v2 = &kWFMeasureStatusOK;
    }
    v3 = *v2;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)statusForSiriTCP
{
  if (self->_siriTCPResultsValid)
  {
    v2 = &kWFMeasureStatusBroken;
    if (self->_siriTCPSuccess) {
      v2 = &kWFMeasureStatusOK;
    }
    v3 = *v2;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)statusForSiriTLS
{
  if (self->_siriTLSResultsValid)
  {
    v2 = &kWFMeasureStatusBroken;
    if (self->_siriTLSSuccess) {
      v2 = &kWFMeasureStatusOK;
    }
    v3 = *v2;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (unint64_t)numAcAttempted
{
  BOOL v2 = self->_trafficClassBEAttemptedSmall > 0 || self->_trafficClassBEAttemptedLarge > 0;
  BOOL v3 = self->_trafficClassBKAttemptedSmall > 0 || self->_trafficClassBKAttemptedLarge > 0;
  BOOL v4 = self->_trafficClassVOAttemptedSmall > 0 || self->_trafficClassVOAttemptedLarge > 0;
  if (self->_trafficClassVIAttemptedSmall >= 1)
  {
    if (v2) {
      int v5 = 2;
    }
    else {
      int v5 = 1;
    }
    if (v3) {
      BOOL v2 = v5;
    }
    unsigned int v6 = v4 + v2;
    return ++v6;
  }
  if (v2) {
    int v7 = 2;
  }
  else {
    int v7 = 1;
  }
  if (v3) {
    BOOL v2 = v7;
  }
  unsigned int v6 = v4 + v2;
  if (self->_trafficClassVIAttemptedLarge >= 1) {
    return ++v6;
  }
  return v6;
}

- (unint64_t)numAcSuccess
{
  unint64_t v3 = [(WFMeasureResult *)self numAcAttempted];
  return v3 - [(WFMeasureResult *)self numAcFailed];
}

- (unint64_t)numAcFailed
{
  BOOL v2 = self->_trafficClassBEAttemptedSmall > 0 || self->_trafficClassBEAttemptedLarge > 0;
  if (self->_trafficClassBESucceededSmall) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = self->_trafficClassBESucceededLarge == 0;
  }
  BOOL v4 = self->_trafficClassBKAttemptedSmall > 0 || self->_trafficClassBKAttemptedLarge > 0;
  if (self->_trafficClassBKSucceededSmall) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = self->_trafficClassBKSucceededLarge == 0;
  }
  BOOL v6 = self->_trafficClassVOAttemptedSmall > 0 || self->_trafficClassVOAttemptedLarge > 0;
  if (self->_trafficClassVOSucceededSmall) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = self->_trafficClassVOSucceededLarge == 0;
  }
  BOOL v8 = self->_trafficClassVIAttemptedSmall > 0 || self->_trafficClassVIAttemptedLarge > 0;
  if (self->_trafficClassVISucceededSmall) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = self->_trafficClassVISucceededLarge == 0;
  }
  BOOL v10 = v2 && v3;
  BOOL v11 = v4 && v5;
  BOOL v12 = v11 + v10;
  BOOL v13 = v6 && v7;
  BOOL v14 = v8 && v9;
  return v12 + v13 + v14;
}

- (unint64_t)numSmallPingPacketsAttempted
{
  return vaddvq_s64(vaddq_s64(*(int64x2_t *)&self->_trafficClassBEAttemptedSmall, *(int64x2_t *)&self->_trafficClassVOAttemptedSmall));
}

- (unint64_t)numLargePingPacketsAttempted
{
  return vaddvq_s64(vaddq_s64(*(int64x2_t *)&self->_trafficClassBEAttemptedLarge, *(int64x2_t *)&self->_trafficClassVOAttemptedLarge));
}

- (unint64_t)numPingPacketsAttempted
{
  unint64_t v3 = [(WFMeasureResult *)self numSmallPingPacketsAttempted];
  return [(WFMeasureResult *)self numLargePingPacketsAttempted] + v3;
}

- (unint64_t)numSmallPingPacketsSuccess
{
  return vaddvq_s64(vaddq_s64(*(int64x2_t *)&self->_trafficClassBESucceededSmall, *(int64x2_t *)&self->_trafficClassVOSucceededSmall));
}

- (unint64_t)numLargePingPacketsSuccess
{
  return vaddvq_s64(vaddq_s64(*(int64x2_t *)&self->_trafficClassBESucceededLarge, *(int64x2_t *)&self->_trafficClassVOSucceededLarge));
}

- (unint64_t)numPingPacketsSuccess
{
  unint64_t v3 = [(WFMeasureResult *)self numSmallPingPacketsSuccess];
  return [(WFMeasureResult *)self numLargePingPacketsSuccess] + v3;
}

- (unint64_t)numSmallPingPacketsFailed
{
  unint64_t v3 = [(WFMeasureResult *)self numSmallPingPacketsAttempted];
  return v3 - [(WFMeasureResult *)self numSmallPingPacketsSuccess];
}

- (unint64_t)numLargePingPacketsFailed
{
  unint64_t v3 = [(WFMeasureResult *)self numLargePingPacketsAttempted];
  return v3 - [(WFMeasureResult *)self numLargePingPacketsSuccess];
}

- (unint64_t)numPingPacketsFailed
{
  unint64_t v3 = [(WFMeasureResult *)self numPingPacketsAttempted];
  return v3 - [(WFMeasureResult *)self numPingPacketsSuccess];
}

- (id)statusForAcFailure
{
  unint64_t v3 = [MEMORY[0x1E4F28E78] string];
  BOOL v4 = self->_trafficClassBEAttemptedSmall > 0 || self->_trafficClassBEAttemptedLarge > 0;
  BOOL v5 = self->_trafficClassBKAttemptedSmall > 0 || self->_trafficClassBKAttemptedLarge > 0;
  BOOL v6 = self->_trafficClassVOAttemptedSmall > 0 || self->_trafficClassVOAttemptedLarge > 0;
  BOOL v7 = self->_trafficClassVIAttemptedSmall > 0 || self->_trafficClassVIAttemptedLarge > 0;
  unint64_t v8 = [(WFMeasureResult *)self numAcAttempted];
  unint64_t v9 = [(WFMeasureResult *)self numAcFailed];
  if (self->_seenSpecificAcFailure)
  {
    if (v8 < 2)
    {
      if (!v4) {
        goto LABEL_16;
      }
      goto LABEL_28;
    }
    if (v8 == v9)
    {
      BOOL v11 = @"_All";
    }
    else
    {
      unint64_t v12 = v9;
      unint64_t v13 = v8 - v9;
      BOOL v11 = @"_%luACF_%luP";
    }
  }
  else
  {
    BOOL v11 = @"_OK";
  }
  objc_msgSend(v3, "appendFormat:", v11, v12, v13);
  if (!v4)
  {
LABEL_16:
    if (!v5) {
      goto LABEL_17;
    }
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v3, "appendFormat:", @"_BEL%d:%d_S%d:%d", self->_trafficClassBESucceededLarge, self->_trafficClassBEAttemptedLarge, self->_trafficClassBESucceededSmall, self->_trafficClassBEAttemptedSmall);
  if (!v5)
  {
LABEL_17:
    if (!v6) {
      goto LABEL_18;
    }
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v3, "appendFormat:", @"_BKL%d:%d_S%d:%d", self->_trafficClassBKSucceededLarge, self->_trafficClassBKAttemptedLarge, self->_trafficClassBKSucceededSmall, self->_trafficClassBKAttemptedSmall);
  if (!v6)
  {
LABEL_18:
    if (!v7) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_30:
  objc_msgSend(v3, "appendFormat:", @"_VOL%d:%d_S%d:%d", self->_trafficClassVOSucceededLarge, self->_trafficClassVOAttemptedLarge, self->_trafficClassVOSucceededSmall, self->_trafficClassVOAttemptedSmall);
  if (v7) {
LABEL_19:
  }
    objc_msgSend(v3, "appendFormat:", @"_VIL%d:%d_S%d:%d", self->_trafficClassVISucceededLarge, self->_trafficClassVIAttemptedLarge, self->_trafficClassVISucceededSmall, self->_trafficClassVIAttemptedSmall);
LABEL_20:

  return v3;
}

- (id)description
{
  unint64_t v3 = [MEMORY[0x1E4F28E78] string];
  BOOL v4 = v3;
  if (self->_backhaulResultsValid) {
    [v3 appendFormat:@"Backhaul:Tput:(%d)mbps Error:(%@) ", (int)self->_backhaulThroughput, self->_downloadError];
  }
  if (self->_gatewayResultsValid) {
    objc_msgSend(v4, "appendFormat:", @"Gateway:RTT:(%d-%d)ms PER:(%d)%% ", self->_gatewayMinRTT, self->_gatewayMaxRTT, self->_gatewayPacketLoss);
  }
  if (self->_localResultsValid) {
    objc_msgSend(v4, "appendFormat:", @"LocalDNS:RTT(%d-%d)ms PER:(%d)%% ", self->_localDNSMinRTT, self->_localDNSMaxRTT, self->_localDNSPacketLoss);
  }
  if (self->_publicResultsValid) {
    objc_msgSend(v4, "appendFormat:", @"PublicDNS:RTT(%d-%d)ms PER:(%d)%% ", self->_publicDNSMinRTT, self->_publicDNSMaxRTT, self->_publicDNSPacketLoss);
  }
  if (self->_seenSpecificAcFailure) {
    objc_msgSend(v4, "appendFormat:", @"SeenSpecificAcFailure %d ", 1);
  }
  if (self->_siriTCPResultsValid)
  {
    BOOL v5 = [(WFMeasureResult *)self statusForSiriTCP];
    [v4 appendFormat:@"SiriTCP: %@ (TrafficClass %ld) ", v5, self->_siriTrafficClass];
  }
  if (self->_siriTLSResultsValid)
  {
    BOOL v6 = [(WFMeasureResult *)self statusForSiriTLS];
    [v4 appendFormat:@"SiriTLS: %@ (TrafficClass %ld) ", v6, self->_siriTrafficClass];
  }
  BOOL v7 = [(WFMeasureResult *)self statusForLocal];
  unint64_t v8 = [(WFMeasureResult *)self statusForInternet];
  unint64_t v9 = [(WFMeasureResult *)self statusForDNS];
  BOOL v10 = [(WFMeasureResult *)self statusForAcFailure];
  [v4 appendFormat:@"Status:Local:%@ Internet:%@ DNS:%@ PerAC:%@ ", v7, v8, v9, v10];

  return v4;
}

- (id)allPrimitiveProperties
{
  unsigned int outCount = 0;
  v28 = objc_opt_new();
  unint64_t v3 = (objc_class *)objc_opt_class();
  BOOL v4 = class_copyPropertyList(v3, &outCount);
  BOOL v5 = v4;
  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      Attributes = property_getAttributes(v5[i]);
      if (!Attributes) {
        goto LABEL_7;
      }
      unint64_t v8 = Attributes;
      unint64_t v9 = [NSString stringWithUTF8String:Attributes];
      char v10 = [v9 hasPrefix:@"T@"];

      if ((v10 & 1) == 0)
      {
        BOOL v11 = [NSString stringWithUTF8String:v8];
        char v12 = [v11 hasPrefix:@"T#"];

        if ((v12 & 1) == 0)
        {
          unint64_t v13 = [NSString stringWithUTF8String:v8];
          char v14 = [v13 hasPrefix:@"T:"];

          if ((v14 & 1) == 0)
          {
LABEL_7:
            v15 = objc_msgSend(NSString, "stringWithCString:encoding:", property_getName(v5[i]), objc_msgSend(NSString, "defaultCStringEncoding"));
            v16 = [MEMORY[0x1E4F28B88] uppercaseLetterCharacterSet];
            uint64_t v17 = [v15 rangeOfCharacterFromSet:v16];
            uint64_t v19 = v18;

            if (([v15 hasSuffix:@"ResultsValid"] & 1) == 0
              && (v17 != 0x7FFFFFFFFFFFFFFFLL || v19 != 0))
            {
              v21 = [v15 substringToIndex:v17];
              v22 = [NSString stringWithFormat:@"%@ResultsValid", v21];
              v23 = (objc_class *)objc_opt_class();
              id v24 = v22;
              if (class_getProperty(v23, (const char *)[v24 UTF8String]))
              {
                v25 = [(WFMeasureResult *)self valueForKey:v24];
                if (v25)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    if ([v25 BOOLValue]) {
                      [v28 addObject:v15];
                    }
                  }
                }
              }
              else
              {
                v25 = 0;
              }
            }
          }
        }
      }
    }
  }
  else if (!v4)
  {
    goto LABEL_24;
  }
  free(v5);
LABEL_24:
  v26 = (void *)[v28 copy];

  return v26;
}

- (id)binnedProperty:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WFMeasureResult *)self valueForKey:v4];
  if (v5)
  {
    BOOL v6 = [(id)WFMeasureResult_PropertyToBinMethod objectForKeyedSubscript:v4];
    uint64_t v7 = [v6 integerValue];

    switch(v7)
    {
      case 0:
        id v8 = v5;
        break;
      case 1:
        +[WiFiUsageLQMTransformations getBinThroughput:As:](WiFiUsageLQMTransformations, "getBinThroughput:As:", [v5 unsignedIntegerValue], 0);
        id v8 = (id)objc_claimAutoreleasedReturnValue();
        break;
      case 2:
        id v8 = [v5 description];
        break;
      case 3:
        +[WiFiUsageLQMTransformations getBinRTT:As:](WiFiUsageLQMTransformations, "getBinRTT:As:", [v5 unsignedIntegerValue], 0);
        id v8 = (id)objc_claimAutoreleasedReturnValue();
        break;
      case 4:
        +[WiFiUsagePrivacyFilter getBinEvery10Over100:As:](WiFiUsagePrivacyFilter, "getBinEvery10Over100:As:", [v5 unsignedIntegerValue], 0);
        id v8 = (id)objc_claimAutoreleasedReturnValue();
        break;
      default:
        goto LABEL_4;
    }
    unint64_t v9 = v8;
  }
  else
  {
LABEL_4:
    unint64_t v9 = 0;
  }

  return v9;
}

+ (void)initialize
{
  id v14 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  v15 = [NSNumber numberWithInt:1];
  BOOL v2 = [NSNumber numberWithInt:2];
  unint64_t v3 = [NSNumber numberWithInt:3];
  id v4 = [NSNumber numberWithInt:3];
  BOOL v5 = [NSNumber numberWithInt:3];
  BOOL v6 = [NSNumber numberWithInt:3];
  uint64_t v7 = [NSNumber numberWithInt:3];
  id v8 = [NSNumber numberWithInt:3];
  unint64_t v9 = [NSNumber numberWithInt:4];
  char v10 = [NSNumber numberWithInt:4];
  BOOL v11 = [NSNumber numberWithInt:4];
  uint64_t v12 = objc_msgSend(v14, "initWithObjectsAndKeys:", v15, @"backhaulThroughput", v2, @"downloadError", v3, @"gatewayMinRTT", v4, @"gatewayMaxRTT", v5, @"localDNSMinRTT", v6, @"localDNSMaxRTT", v7, @"publicDNSMinRTT", v8, @"publicDNSMaxRTT", v9,
          @"gatewayPacketLoss",
          v10,
          @"localDNSPacketLoss",
          v11,
          @"publicDNSPacketLoss",
          0);
  unint64_t v13 = (void *)WFMeasureResult_PropertyToBinMethod;
  WFMeasureResult_PropertyToBinMethod = v12;
}

- (id)typeAsString
{
  unint64_t type = self->_type;
  unint64_t v3 = @"Unknown Test";
  if (type == 2) {
    unint64_t v3 = @"Link Test";
  }
  if (type == 1) {
    return @"Throughput Test";
  }
  else {
    return v3;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v4[3] = self->_type;
  v4[4] = self->_options;
  v4[5] = *(void *)&self->_backhaulThroughput;
  uint64_t v5 = [(NSError *)self->_downloadError copy];
  BOOL v6 = (void *)v4[6];
  v4[6] = v5;

  v4[7] = self->_gatewayMinRTT;
  v4[8] = self->_gatewayMaxRTT;
  v4[9] = self->_gatewayPacketLoss;
  v4[10] = self->_localDNSMinRTT;
  v4[11] = self->_localDNSMaxRTT;
  v4[12] = self->_localDNSPacketLoss;
  v4[13] = self->_publicDNSMinRTT;
  v4[14] = self->_publicDNSMaxRTT;
  v4[15] = self->_publicDNSPacketLoss;
  *((unsigned char *)v4 + 8) = self->_dnsSuccess;
  *((unsigned char *)v4 + 9) = self->_backhaulResultsValid;
  *((unsigned char *)v4 + 10) = self->_gatewayResultsValid;
  *((unsigned char *)v4 + 11) = self->_localResultsValid;
  *((unsigned char *)v4 + 12) = self->_publicResultsValid;
  *((unsigned char *)v4 + 13) = self->_dnsResultsValid;
  *((unsigned char *)v4 + 15) = self->_siriTCPResultsValid;
  *((unsigned char *)v4 + 16) = self->_siriTLSResultsValid;
  *((unsigned char *)v4 + 14) = self->_seenSpecificAcFailure;
  v4[16] = self->_trafficClassBEAttemptedSmall;
  v4[17] = self->_trafficClassBKAttemptedSmall;
  v4[18] = self->_trafficClassVOAttemptedSmall;
  v4[19] = self->_trafficClassVIAttemptedSmall;
  v4[20] = self->_trafficClassBESucceededSmall;
  v4[21] = self->_trafficClassBKSucceededSmall;
  v4[22] = self->_trafficClassVOSucceededSmall;
  v4[23] = self->_trafficClassVISucceededSmall;
  v4[24] = self->_trafficClassBEAttemptedLarge;
  v4[25] = self->_trafficClassBKAttemptedLarge;
  v4[26] = self->_trafficClassVOAttemptedLarge;
  v4[27] = self->_trafficClassVIAttemptedLarge;
  v4[28] = self->_trafficClassBESucceededLarge;
  v4[29] = self->_trafficClassBKSucceededLarge;
  v4[30] = self->_trafficClassVOSucceededLarge;
  v4[31] = self->_trafficClassVISucceededLarge;
  v4[32] = self->_siriTrafficClass;
  *((unsigned char *)v4 + 17) = self->_siriTCPSuccess;
  *((unsigned char *)v4 + 18) = self->_siriTLSSuccess;
  uint64_t v7 = [(NSString *)self->_gatewayAddress copy];
  id v8 = (void *)v4[33];
  v4[33] = v7;

  uint64_t v9 = [(NSMutableSet *)self->_dnsServers copy];
  char v10 = (void *)v4[34];
  v4[34] = v9;

  return v4;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (double)backhaulThroughput
{
  return self->_backhaulThroughput;
}

- (void)setBackhaulThroughput:(double)a3
{
  self->_backhaulThroughput = a3;
}

- (NSError)downloadError
{
  return self->_downloadError;
}

- (void)setDownloadError:(id)a3
{
}

- (int64_t)gatewayMinRTT
{
  return self->_gatewayMinRTT;
}

- (void)setGatewayMinRTT:(int64_t)a3
{
  self->_gatewayMinRTT = a3;
}

- (int64_t)gatewayMaxRTT
{
  return self->_gatewayMaxRTT;
}

- (void)setGatewayMaxRTT:(int64_t)a3
{
  self->_gatewayMaxRTT = a3;
}

- (int64_t)gatewayPacketLoss
{
  return self->_gatewayPacketLoss;
}

- (void)setGatewayPacketLoss:(int64_t)a3
{
  self->_int64_t gatewayPacketLoss = a3;
}

- (int64_t)localDNSMinRTT
{
  return self->_localDNSMinRTT;
}

- (void)setLocalDNSMinRTT:(int64_t)a3
{
  self->_localDNSMinRTT = a3;
}

- (int64_t)localDNSMaxRTT
{
  return self->_localDNSMaxRTT;
}

- (void)setLocalDNSMaxRTT:(int64_t)a3
{
  self->_localDNSMaxRTT = a3;
}

- (int64_t)localDNSPacketLoss
{
  return self->_localDNSPacketLoss;
}

- (void)setLocalDNSPacketLoss:(int64_t)a3
{
  self->_localDNSPacketLoss = a3;
}

- (int64_t)publicDNSMinRTT
{
  return self->_publicDNSMinRTT;
}

- (void)setPublicDNSMinRTT:(int64_t)a3
{
  self->_publicDNSMinRTT = a3;
}

- (int64_t)publicDNSMaxRTT
{
  return self->_publicDNSMaxRTT;
}

- (void)setPublicDNSMaxRTT:(int64_t)a3
{
  self->_publicDNSMaxRTT = a3;
}

- (int64_t)publicDNSPacketLoss
{
  return self->_publicDNSPacketLoss;
}

- (void)setPublicDNSPacketLoss:(int64_t)a3
{
  self->_publicDNSPacketLoss = a3;
}

- (BOOL)dnsSuccess
{
  return self->_dnsSuccess;
}

- (void)setDnsSuccess:(BOOL)a3
{
  self->_dnsSuccess = a3;
}

- (BOOL)backhaulResultsValid
{
  return self->_backhaulResultsValid;
}

- (void)setBackhaulResultsValid:(BOOL)a3
{
  self->_backhaulResultsValid = a3;
}

- (BOOL)gatewayResultsValid
{
  return self->_gatewayResultsValid;
}

- (void)setGatewayResultsValid:(BOOL)a3
{
  self->_gatewayResultsValid = a3;
}

- (BOOL)localResultsValid
{
  return self->_localResultsValid;
}

- (void)setLocalResultsValid:(BOOL)a3
{
  self->_localResultsValid = a3;
}

- (BOOL)publicResultsValid
{
  return self->_publicResultsValid;
}

- (void)setPublicResultsValid:(BOOL)a3
{
  self->_publicResultsValid = a3;
}

- (BOOL)dnsResultsValid
{
  return self->_dnsResultsValid;
}

- (void)setDnsResultsValid:(BOOL)a3
{
  self->_dnsResultsValid = a3;
}

- (BOOL)seenSpecificAcFailure
{
  return self->_seenSpecificAcFailure;
}

- (void)setSeenSpecificAcFailure:(BOOL)a3
{
  self->_seenSpecificAcFailure = a3;
}

- (int64_t)trafficClassBEAttemptedSmall
{
  return self->_trafficClassBEAttemptedSmall;
}

- (void)setTrafficClassBEAttemptedSmall:(int64_t)a3
{
  self->_trafficClassBEAttemptedSmall = a3;
}

- (int64_t)trafficClassBKAttemptedSmall
{
  return self->_trafficClassBKAttemptedSmall;
}

- (void)setTrafficClassBKAttemptedSmall:(int64_t)a3
{
  self->_trafficClassBKAttemptedSmall = a3;
}

- (int64_t)trafficClassVOAttemptedSmall
{
  return self->_trafficClassVOAttemptedSmall;
}

- (void)setTrafficClassVOAttemptedSmall:(int64_t)a3
{
  self->_trafficClassVOAttemptedSmall = a3;
}

- (int64_t)trafficClassVIAttemptedSmall
{
  return self->_trafficClassVIAttemptedSmall;
}

- (void)setTrafficClassVIAttemptedSmall:(int64_t)a3
{
  self->_trafficClassVIAttemptedSmall = a3;
}

- (int64_t)trafficClassBESucceededSmall
{
  return self->_trafficClassBESucceededSmall;
}

- (void)setTrafficClassBESucceededSmall:(int64_t)a3
{
  self->_trafficClassBESucceededSmall = a3;
}

- (int64_t)trafficClassBKSucceededSmall
{
  return self->_trafficClassBKSucceededSmall;
}

- (void)setTrafficClassBKSucceededSmall:(int64_t)a3
{
  self->_trafficClassBKSucceededSmall = a3;
}

- (int64_t)trafficClassVOSucceededSmall
{
  return self->_trafficClassVOSucceededSmall;
}

- (void)setTrafficClassVOSucceededSmall:(int64_t)a3
{
  self->_trafficClassVOSucceededSmall = a3;
}

- (int64_t)trafficClassVISucceededSmall
{
  return self->_trafficClassVISucceededSmall;
}

- (void)setTrafficClassVISucceededSmall:(int64_t)a3
{
  self->_trafficClassVISucceededSmall = a3;
}

- (int64_t)trafficClassBEAttemptedLarge
{
  return self->_trafficClassBEAttemptedLarge;
}

- (void)setTrafficClassBEAttemptedLarge:(int64_t)a3
{
  self->_trafficClassBEAttemptedLarge = a3;
}

- (int64_t)trafficClassBKAttemptedLarge
{
  return self->_trafficClassBKAttemptedLarge;
}

- (void)setTrafficClassBKAttemptedLarge:(int64_t)a3
{
  self->_trafficClassBKAttemptedLarge = a3;
}

- (int64_t)trafficClassVOAttemptedLarge
{
  return self->_trafficClassVOAttemptedLarge;
}

- (void)setTrafficClassVOAttemptedLarge:(int64_t)a3
{
  self->_trafficClassVOAttemptedLarge = a3;
}

- (int64_t)trafficClassVIAttemptedLarge
{
  return self->_trafficClassVIAttemptedLarge;
}

- (void)setTrafficClassVIAttemptedLarge:(int64_t)a3
{
  self->_trafficClassVIAttemptedLarge = a3;
}

- (int64_t)trafficClassBESucceededLarge
{
  return self->_trafficClassBESucceededLarge;
}

- (void)setTrafficClassBESucceededLarge:(int64_t)a3
{
  self->_trafficClassBESucceededLarge = a3;
}

- (int64_t)trafficClassBKSucceededLarge
{
  return self->_trafficClassBKSucceededLarge;
}

- (void)setTrafficClassBKSucceededLarge:(int64_t)a3
{
  self->_trafficClassBKSucceededLarge = a3;
}

- (int64_t)trafficClassVOSucceededLarge
{
  return self->_trafficClassVOSucceededLarge;
}

- (void)setTrafficClassVOSucceededLarge:(int64_t)a3
{
  self->_trafficClassVOSucceededLarge = a3;
}

- (int64_t)trafficClassVISucceededLarge
{
  return self->_trafficClassVISucceededLarge;
}

- (void)setTrafficClassVISucceededLarge:(int64_t)a3
{
  self->_trafficClassVISucceededLarge = a3;
}

- (int64_t)siriTrafficClass
{
  return self->_siriTrafficClass;
}

- (void)setSiriTrafficClass:(int64_t)a3
{
  self->_siriTrafficClass = a3;
}

- (BOOL)siriTCPResultsValid
{
  return self->_siriTCPResultsValid;
}

- (void)setSiriTCPResultsValid:(BOOL)a3
{
  self->_siriTCPResultsValid = a3;
}

- (BOOL)siriTLSResultsValid
{
  return self->_siriTLSResultsValid;
}

- (void)setSiriTLSResultsValid:(BOOL)a3
{
  self->_siriTLSResultsValid = a3;
}

- (BOOL)siriTCPSuccess
{
  return self->_siriTCPSuccess;
}

- (void)setSiriTCPSuccess:(BOOL)a3
{
  self->_siriTCPSuccess = a3;
}

- (BOOL)siriTLSSuccess
{
  return self->_siriTLSSuccess;
}

- (void)setSiriTLSSuccess:(BOOL)a3
{
  self->_siriTLSSuccess = a3;
}

- (NSString)gatewayAddress
{
  return self->_gatewayAddress;
}

- (void)setGatewayAddress:(id)a3
{
}

- (NSMutableSet)dnsServers
{
  return self->_dnsServers;
}

- (void)setDnsServers:(id)a3
{
}

- (BOOL)siriACEResultsValid
{
  return self->_siriACEResultsValid;
}

- (void)setSiriACEResultsValid:(BOOL)a3
{
  self->_siriACEResultsValid = a3;
}

- (BOOL)siriACESuccess
{
  return self->_siriACESuccess;
}

- (void)setSiriACESuccess:(BOOL)a3
{
  self->_siriACESuccess = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dnsServers, 0);
  objc_storeStrong((id *)&self->_gatewayAddress, 0);

  objc_storeStrong((id *)&self->_downloadError, 0);
}

@end