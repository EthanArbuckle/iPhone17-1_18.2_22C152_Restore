@interface NetworkQualityConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)download;
- (BOOL)edgeRelay;
- (BOOL)edgeRelayRemote;
- (BOOL)forceDisableL4S;
- (BOOL)forceHTTP1;
- (BOOL)forceHTTP2;
- (BOOL)forceHTTP3;
- (BOOL)forceL4S;
- (BOOL)idleLatency;
- (BOOL)parallel;
- (BOOL)privateRelay;
- (BOOL)telemetry;
- (BOOL)upload;
- (BOOL)useUnifiedHTTPStack;
- (BOOL)validateCertificate;
- (BOOL)workingLatency;
- (NSObject)configuration;
- (NSString)bonjourHost;
- (NSString)hostOverride;
- (NSString)networkInterfaceName;
- (NetworkQualityConfiguration)init;
- (NetworkQualityConfiguration)initWithCoder:(id)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)latencyCriteria;
- (int64_t)maxDownlinkData;
- (int64_t)maxDownlinkThroughput;
- (int64_t)maxDownloadFlows;
- (int64_t)maxRuntime;
- (int64_t)maxUplinkData;
- (int64_t)maxUplinkThroughput;
- (int64_t)maxUploadFlows;
- (int64_t)minDownloadFlows;
- (int64_t)minRuntime;
- (int64_t)minUploadFlows;
- (int64_t)movingAveragePeriod;
- (int64_t)multipathServiceType;
- (int64_t)standardDeviationThreshold;
- (int64_t)trimmedMeanThreshold;
- (unint64_t)latencyMeasurementServiceType;
- (unint64_t)loadGeneratingNetworkServiceType;
- (void)encodeWithCoder:(id)a3;
- (void)setBonjourHost:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDownload:(BOOL)a3;
- (void)setEdgeRelay:(BOOL)a3;
- (void)setEdgeRelayRemote:(BOOL)a3;
- (void)setForceDisableL4S:(BOOL)a3;
- (void)setForceHTTP1:(BOOL)a3;
- (void)setForceHTTP2:(BOOL)a3;
- (void)setForceHTTP3:(BOOL)a3;
- (void)setForceL4S:(BOOL)a3;
- (void)setHostOverride:(id)a3;
- (void)setIdleLatency:(BOOL)a3;
- (void)setLatencyCriteria:(int64_t)a3;
- (void)setLatencyMeasurementServiceType:(unint64_t)a3;
- (void)setLoadGeneratingNetworkServiceType:(unint64_t)a3;
- (void)setMaxDownlinkData:(int64_t)a3;
- (void)setMaxDownlinkThroughput:(int64_t)a3;
- (void)setMaxDownloadFlows:(int64_t)a3;
- (void)setMaxRuntime:(int64_t)a3;
- (void)setMaxUplinkData:(int64_t)a3;
- (void)setMaxUplinkThroughput:(int64_t)a3;
- (void)setMaxUploadFlows:(int64_t)a3;
- (void)setMinDownloadFlows:(int64_t)a3;
- (void)setMinRuntime:(int64_t)a3;
- (void)setMinUploadFlows:(int64_t)a3;
- (void)setMovingAveragePeriod:(int64_t)a3;
- (void)setMultipathServiceType:(int64_t)a3;
- (void)setNetworkInterfaceName:(id)a3;
- (void)setParallel:(BOOL)a3;
- (void)setPrivateRelay:(BOOL)a3;
- (void)setStandardDeviationThreshold:(int64_t)a3;
- (void)setTelemetry:(BOOL)a3;
- (void)setTrimmedMeanThreshold:(int64_t)a3;
- (void)setUpload:(BOOL)a3;
- (void)setUseUnifiedHTTPStack:(BOOL)a3;
- (void)setValidateCertificate:(BOOL)a3;
- (void)setWorkingLatency:(BOOL)a3;
@end

@implementation NetworkQualityConfiguration

- (NetworkQualityConfiguration)init
{
  v10.receiver = self;
  v10.super_class = (Class)NetworkQualityConfiguration;
  v2 = [(NetworkQualityConfiguration *)&v10 init];
  v3 = v2;
  if (v2)
  {
    customConfigurationString = v2->customConfigurationString;
    v2->customConfigurationString = 0;

    customConfigurationDictionary = v3->customConfigurationDictionary;
    v3->customConfigurationDictionary = 0;

    bonjourHost = v3->_bonjourHost;
    v3->_bonjourHost = 0;

    networkInterfaceName = v3->_networkInterfaceName;
    v3->_networkInterfaceName = 0;

    *(_WORD *)&v3->_workingLatency = 257;
    *(_DWORD *)&v3->_idleLatency = 16843009;
    *(_OWORD *)&v3->_minUploadFlows = xmmword_219319BF0;
    *(_OWORD *)&v3->_minDownloadFlows = xmmword_219319BF0;
    v3->_telemetry = 1;
    *(_OWORD *)&v3->_minRuntime = xmmword_219319C00;
    *(_DWORD *)&v3->_forceHTTP1 = 0;
    *(_OWORD *)&v3->_latencyCriteria = 0u;
    *(_OWORD *)&v3->_maxUplinkData = 0u;
    hostOverride = v3->_hostOverride;
    v3->_maxUplinkThroughput = 0;
    v3->_hostOverride = 0;

    *(_OWORD *)&v3->_movingAveragePeriod = xmmword_219319C10;
    v3->_useUnifiedHTTPStack = 0;
    v3->_trimmedMeanThreshold = 95;
    v3->_multipathServiceType = 0;
    v3->_latencyMeasurementServiceType = 0;
    v3->_loadGeneratingNetworkServiceType = 0;
  }
  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(NetworkQualityConfiguration);
  objc_storeStrong((id *)&v4->customConfigurationString, self->customConfigurationString);
  objc_storeStrong((id *)&v4->customConfigurationDictionary, self->customConfigurationDictionary);
  v5 = [(NetworkQualityConfiguration *)self bonjourHost];
  [(NetworkQualityConfiguration *)v4 setBonjourHost:v5];

  v6 = [(NetworkQualityConfiguration *)self networkInterfaceName];
  [(NetworkQualityConfiguration *)v4 setNetworkInterfaceName:v6];

  [(NetworkQualityConfiguration *)v4 setIdleLatency:[(NetworkQualityConfiguration *)self idleLatency]];
  [(NetworkQualityConfiguration *)v4 setUpload:[(NetworkQualityConfiguration *)self upload]];
  [(NetworkQualityConfiguration *)v4 setDownload:[(NetworkQualityConfiguration *)self download]];
  [(NetworkQualityConfiguration *)v4 setParallel:[(NetworkQualityConfiguration *)self parallel]];
  [(NetworkQualityConfiguration *)v4 setWorkingLatency:[(NetworkQualityConfiguration *)self workingLatency]];
  [(NetworkQualityConfiguration *)v4 setValidateCertificate:[(NetworkQualityConfiguration *)self validateCertificate]];
  [(NetworkQualityConfiguration *)v4 setMinUploadFlows:[(NetworkQualityConfiguration *)self minUploadFlows]];
  [(NetworkQualityConfiguration *)v4 setMaxUploadFlows:[(NetworkQualityConfiguration *)self maxUploadFlows]];
  [(NetworkQualityConfiguration *)v4 setMinDownloadFlows:[(NetworkQualityConfiguration *)self minDownloadFlows]];
  [(NetworkQualityConfiguration *)v4 setMaxDownloadFlows:[(NetworkQualityConfiguration *)self maxDownloadFlows]];
  [(NetworkQualityConfiguration *)v4 setMaxDownlinkThroughput:[(NetworkQualityConfiguration *)self maxDownlinkThroughput]];
  [(NetworkQualityConfiguration *)v4 setMaxUplinkThroughput:[(NetworkQualityConfiguration *)self maxUplinkThroughput]];
  [(NetworkQualityConfiguration *)v4 setTelemetry:[(NetworkQualityConfiguration *)self telemetry]];
  [(NetworkQualityConfiguration *)v4 setMinRuntime:[(NetworkQualityConfiguration *)self minRuntime]];
  [(NetworkQualityConfiguration *)v4 setMaxRuntime:[(NetworkQualityConfiguration *)self maxRuntime]];
  [(NetworkQualityConfiguration *)v4 setLatencyCriteria:[(NetworkQualityConfiguration *)self latencyCriteria]];
  [(NetworkQualityConfiguration *)v4 setMaxDownlinkData:[(NetworkQualityConfiguration *)self maxDownlinkData]];
  [(NetworkQualityConfiguration *)v4 setMaxUplinkData:[(NetworkQualityConfiguration *)self maxUplinkData]];
  [(NetworkQualityConfiguration *)v4 setForceHTTP1:[(NetworkQualityConfiguration *)self forceHTTP1]];
  [(NetworkQualityConfiguration *)v4 setForceHTTP2:[(NetworkQualityConfiguration *)self forceHTTP2]];
  [(NetworkQualityConfiguration *)v4 setForceHTTP3:[(NetworkQualityConfiguration *)self forceHTTP3]];
  [(NetworkQualityConfiguration *)v4 setForceL4S:[(NetworkQualityConfiguration *)self forceL4S]];
  [(NetworkQualityConfiguration *)v4 setForceDisableL4S:[(NetworkQualityConfiguration *)self forceDisableL4S]];
  [(NetworkQualityConfiguration *)v4 setPrivateRelay:[(NetworkQualityConfiguration *)self privateRelay]];
  [(NetworkQualityConfiguration *)v4 setEdgeRelay:[(NetworkQualityConfiguration *)self edgeRelay]];
  [(NetworkQualityConfiguration *)v4 setEdgeRelayRemote:[(NetworkQualityConfiguration *)self edgeRelayRemote]];
  v7 = [(NetworkQualityConfiguration *)self hostOverride];
  [(NetworkQualityConfiguration *)v4 setHostOverride:v7];

  [(NetworkQualityConfiguration *)v4 setMovingAveragePeriod:[(NetworkQualityConfiguration *)self movingAveragePeriod]];
  [(NetworkQualityConfiguration *)v4 setStandardDeviationThreshold:[(NetworkQualityConfiguration *)self standardDeviationThreshold]];
  [(NetworkQualityConfiguration *)v4 setTrimmedMeanThreshold:[(NetworkQualityConfiguration *)self trimmedMeanThreshold]];
  [(NetworkQualityConfiguration *)v4 setMultipathServiceType:[(NetworkQualityConfiguration *)self multipathServiceType]];
  [(NetworkQualityConfiguration *)v4 setLatencyMeasurementServiceType:[(NetworkQualityConfiguration *)self latencyMeasurementServiceType]];
  [(NetworkQualityConfiguration *)v4 setLoadGeneratingNetworkServiceType:[(NetworkQualityConfiguration *)self loadGeneratingNetworkServiceType]];
  [(NetworkQualityConfiguration *)v4 setUseUnifiedHTTPStack:[(NetworkQualityConfiguration *)self useUnifiedHTTPStack]];
  return v4;
}

- (NetworkQualityConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NetworkQualityConfiguration;
  v5 = [(NetworkQualityConfiguration *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configurationString"];
    customConfigurationString = v5->customConfigurationString;
    v5->customConfigurationString = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configurationDictionary"];
    customConfigurationDictionary = v5->customConfigurationDictionary;
    v5->customConfigurationDictionary = (NSDictionary *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bonjourHost"];
    bonjourHost = v5->_bonjourHost;
    v5->_bonjourHost = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"networkInterfaceName"];
    networkInterfaceName = v5->_networkInterfaceName;
    v5->_networkInterfaceName = (NSString *)v12;

    v5->_idleLatency = [v4 decodeBoolForKey:@"idleLatency"];
    v5->_upload = [v4 decodeBoolForKey:@"upload"];
    v5->_download = [v4 decodeBoolForKey:@"download"];
    v5->_parallel = [v4 decodeBoolForKey:@"parallel"];
    v5->_workingLatency = [v4 decodeBoolForKey:@"workingLatency"];
    v5->_validateCertificate = [v4 decodeBoolForKey:@"validateCertificate"];
    v5->_minUploadFlows = [v4 decodeIntegerForKey:@"minUploadFlows"];
    v5->_maxUploadFlows = [v4 decodeIntegerForKey:@"maxUploadFlows"];
    v5->_minDownloadFlows = [v4 decodeIntegerForKey:@"minDownloadFlows"];
    v5->_maxDownloadFlows = [v4 decodeIntegerForKey:@"maxDownloadFlows"];
    v5->_telemetry = [v4 decodeBoolForKey:@"telemetry"];
    v5->_minRuntime = [v4 decodeIntegerForKey:@"minRuntime"];
    v5->_maxRuntime = [v4 decodeIntegerForKey:@"maxRuntime"];
    v5->_latencyCriteria = [v4 decodeIntegerForKey:@"latencyCriteria"];
    v5->_maxDownlinkData = [v4 decodeIntegerForKey:@"maxDownlinkData"];
    v5->_maxUplinkData = [v4 decodeIntegerForKey:@"maxUplinkData"];
    v5->_maxDownlinkThroughput = [v4 decodeIntegerForKey:@"maxDownlinkThroughput"];
    v5->_maxUplinkThroughput = [v4 decodeIntegerForKey:@"maxUplinkThroughput"];
    v5->_forceHTTP1 = [v4 decodeBoolForKey:@"forceHTTP1"];
    v5->_forceHTTP2 = [v4 decodeBoolForKey:@"forceHTTP2"];
    v5->_forceHTTP3 = [v4 decodeBoolForKey:@"forceHTTP3"];
    v5->_forceL4S = [v4 decodeBoolForKey:@"forceL4S"];
    v5->_forceDisableL4S = [v4 decodeBoolForKey:@"forceDisableL4S"];
    v5->_privateRelay = [v4 decodeBoolForKey:@"privateRelay"];
    v5->_edgeRelay = [v4 decodeBoolForKey:@"edgeRelay"];
    v5->_edgeRelayRemote = [v4 decodeBoolForKey:@"edgeRelayRemote"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hostOverride"];
    hostOverride = v5->_hostOverride;
    v5->_hostOverride = (NSString *)v14;

    v5->_movingAveragePeriod = [v4 decodeIntegerForKey:@"movingAveragePeriod"];
    v5->_standardDeviationThreshold = [v4 decodeIntegerForKey:@"standardDeviationThreshold"];
    v5->_trimmedMeanThreshold = [v4 decodeIntegerForKey:@"trimmedMeanThreshold"];
    v5->_multipathServiceType = (int)[v4 decodeIntForKey:@"multipathServiceType"];
    v5->_latencyMeasurementServiceType = (int)[v4 decodeIntForKey:@"latencyMeasurementServiceType"];
    v5->_loadGeneratingNetworkServiceType = (int)[v4 decodeIntForKey:@"loadGeneratingNetworkServiceType"];
    v5->_useUnifiedHTTPStack = [v4 decodeBoolForKey:@"useUnifiedHTTPStack"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  customConfigurationString = self->customConfigurationString;
  id v5 = a3;
  [v5 encodeObject:customConfigurationString forKey:@"configurationString"];
  [v5 encodeObject:self->customConfigurationDictionary forKey:@"configurationDictionary"];
  [v5 encodeObject:self->_bonjourHost forKey:@"bonjourHost"];
  [v5 encodeObject:self->_networkInterfaceName forKey:@"networkInterfaceName"];
  [v5 encodeBool:self->_idleLatency forKey:@"idleLatency"];
  [v5 encodeBool:self->_upload forKey:@"upload"];
  [v5 encodeBool:self->_download forKey:@"download"];
  [v5 encodeBool:self->_parallel forKey:@"parallel"];
  [v5 encodeBool:self->_workingLatency forKey:@"workingLatency"];
  [v5 encodeBool:self->_validateCertificate forKey:@"validateCertificate"];
  [v5 encodeInt64:self->_minUploadFlows forKey:@"minUploadFlows"];
  [v5 encodeInt64:self->_maxUploadFlows forKey:@"maxUploadFlows"];
  [v5 encodeInt64:self->_minDownloadFlows forKey:@"minDownloadFlows"];
  [v5 encodeInt64:self->_maxDownloadFlows forKey:@"maxDownloadFlows"];
  [v5 encodeBool:self->_telemetry forKey:@"telemetry"];
  [v5 encodeInt64:self->_minRuntime forKey:@"minRuntime"];
  [v5 encodeInt64:self->_maxRuntime forKey:@"maxRuntime"];
  [v5 encodeInt64:self->_latencyCriteria forKey:@"latencyCriteria"];
  [v5 encodeInt64:self->_maxDownlinkData forKey:@"maxDownlinkData"];
  [v5 encodeInt64:self->_maxUplinkData forKey:@"maxUplinkData"];
  [v5 encodeInt64:self->_maxDownlinkThroughput forKey:@"maxDownlinkThroughput"];
  [v5 encodeInt64:self->_maxUplinkThroughput forKey:@"maxUplinkThroughput"];
  [v5 encodeBool:self->_forceHTTP1 forKey:@"forceHTTP1"];
  [v5 encodeBool:self->_forceHTTP2 forKey:@"forceHTTP2"];
  [v5 encodeBool:self->_forceHTTP3 forKey:@"forceHTTP3"];
  [v5 encodeBool:self->_forceL4S forKey:@"forceL4S"];
  [v5 encodeBool:self->_forceDisableL4S forKey:@"forceDisableL4S"];
  [v5 encodeBool:self->_privateRelay forKey:@"privateRelay"];
  [v5 encodeBool:self->_edgeRelay forKey:@"edgeRelay"];
  [v5 encodeBool:self->_edgeRelayRemote forKey:@"edgeRelayRemote"];
  [v5 encodeObject:self->_hostOverride forKey:@"hostOverride"];
  [v5 encodeInt64:self->_movingAveragePeriod forKey:@"movingAveragePeriod"];
  [v5 encodeInt64:self->_standardDeviationThreshold forKey:@"standardDeviationThreshold"];
  [v5 encodeInt64:self->_trimmedMeanThreshold forKey:@"trimmedMeanThreshold"];
  [v5 encodeInteger:self->_multipathServiceType forKey:@"multipathServiceType"];
  [v5 encodeInteger:self->_latencyMeasurementServiceType forKey:@"latencyMeasurementServiceType"];
  [v5 encodeInteger:self->_loadGeneratingNetworkServiceType forKey:@"loadGeneratingNetworkServiceType"];
  [v5 encodeBool:self->_useUnifiedHTTPStack forKey:@"useUnifiedHTTPStack"];
}

- (void)setConfiguration:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = (NSString *)[v7 copy];
    customConfigurationString = (NSDictionary *)self->customConfigurationString;
    self->customConfigurationString = v4;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    uint64_t v6 = (NSDictionary *)[v7 copy];
    customConfigurationString = self->customConfigurationDictionary;
    self->customConfigurationDictionary = v6;
  }

LABEL_6:
}

- (NSObject)configuration
{
  customConfigurationString = (NSDictionary *)self->customConfigurationString;
  if (customConfigurationString || (customConfigurationString = self->customConfigurationDictionary) != 0)
  {
    id v4 = customConfigurationString;
  }
  else
  {
    if ([(NetworkQualityConfiguration *)self edgeRelay])
    {
      uint64_t v6 = @"mensura-edge-relay.cdn-apple.com";
    }
    else
    {
      BOOL v7 = [(NetworkQualityConfiguration *)self edgeRelayRemote];
      uint64_t v6 = @"mensura.cdn-apple.com";
      if (v7) {
        uint64_t v6 = @"mensura-edge-relay-remote.cdn-apple.com";
      }
    }
    id v4 = [NSString stringWithFormat:@"https://%@/.well-known/nq", v6];
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(NetworkQualityConfiguration *)self configuration];
  BOOL v7 = [v3 stringWithFormat:@"<%@: configuration=%@, bonjourHost=%@>", v5, v6, self->_bonjourHost];

  return v7;
}

- (NSString)bonjourHost
{
  return self->_bonjourHost;
}

- (void)setBonjourHost:(id)a3
{
}

- (NSString)networkInterfaceName
{
  return self->_networkInterfaceName;
}

- (void)setNetworkInterfaceName:(id)a3
{
}

- (BOOL)idleLatency
{
  return self->_idleLatency;
}

- (void)setIdleLatency:(BOOL)a3
{
  self->_idleLatency = a3;
}

- (BOOL)upload
{
  return self->_upload;
}

- (void)setUpload:(BOOL)a3
{
  self->_upload = a3;
}

- (BOOL)download
{
  return self->_download;
}

- (void)setDownload:(BOOL)a3
{
  self->_download = a3;
}

- (BOOL)parallel
{
  return self->_parallel;
}

- (void)setParallel:(BOOL)a3
{
  self->_parallel = a3;
}

- (BOOL)workingLatency
{
  return self->_workingLatency;
}

- (void)setWorkingLatency:(BOOL)a3
{
  self->_workingLatency = a3;
}

- (BOOL)validateCertificate
{
  return self->_validateCertificate;
}

- (void)setValidateCertificate:(BOOL)a3
{
  self->_validateCertificate = a3;
}

- (int64_t)minUploadFlows
{
  return self->_minUploadFlows;
}

- (void)setMinUploadFlows:(int64_t)a3
{
  self->_minUploadFlows = a3;
}

- (int64_t)maxUploadFlows
{
  return self->_maxUploadFlows;
}

- (void)setMaxUploadFlows:(int64_t)a3
{
  self->_maxUploadFlows = a3;
}

- (int64_t)minDownloadFlows
{
  return self->_minDownloadFlows;
}

- (void)setMinDownloadFlows:(int64_t)a3
{
  self->_minDownloadFlows = a3;
}

- (int64_t)maxDownloadFlows
{
  return self->_maxDownloadFlows;
}

- (void)setMaxDownloadFlows:(int64_t)a3
{
  self->_maxDownloadFlows = a3;
}

- (BOOL)telemetry
{
  return self->_telemetry;
}

- (void)setTelemetry:(BOOL)a3
{
  self->_telemetry = a3;
}

- (int64_t)minRuntime
{
  return self->_minRuntime;
}

- (void)setMinRuntime:(int64_t)a3
{
  self->_minRuntime = a3;
}

- (int64_t)maxRuntime
{
  return self->_maxRuntime;
}

- (void)setMaxRuntime:(int64_t)a3
{
  self->_maxRuntime = a3;
}

- (int64_t)latencyCriteria
{
  return self->_latencyCriteria;
}

- (void)setLatencyCriteria:(int64_t)a3
{
  self->_latencyCriteria = a3;
}

- (int64_t)maxDownlinkData
{
  return self->_maxDownlinkData;
}

- (void)setMaxDownlinkData:(int64_t)a3
{
  self->_maxDownlinkData = a3;
}

- (int64_t)maxUplinkData
{
  return self->_maxUplinkData;
}

- (void)setMaxUplinkData:(int64_t)a3
{
  self->_maxUplinkData = a3;
}

- (int64_t)maxDownlinkThroughput
{
  return self->_maxDownlinkThroughput;
}

- (void)setMaxDownlinkThroughput:(int64_t)a3
{
  self->_maxDownlinkThroughput = a3;
}

- (int64_t)maxUplinkThroughput
{
  return self->_maxUplinkThroughput;
}

- (void)setMaxUplinkThroughput:(int64_t)a3
{
  self->_maxUplinkThroughput = a3;
}

- (BOOL)forceHTTP1
{
  return self->_forceHTTP1;
}

- (void)setForceHTTP1:(BOOL)a3
{
  self->_forceHTTP1 = a3;
}

- (BOOL)forceHTTP2
{
  return self->_forceHTTP2;
}

- (void)setForceHTTP2:(BOOL)a3
{
  self->_forceHTTP2 = a3;
}

- (BOOL)forceHTTP3
{
  return self->_forceHTTP3;
}

- (void)setForceHTTP3:(BOOL)a3
{
  self->_forceHTTP3 = a3;
}

- (BOOL)forceL4S
{
  return self->_forceL4S;
}

- (void)setForceL4S:(BOOL)a3
{
  self->_forceL4S = a3;
}

- (BOOL)forceDisableL4S
{
  return self->_forceDisableL4S;
}

- (void)setForceDisableL4S:(BOOL)a3
{
  self->_forceDisableL4S = a3;
}

- (BOOL)privateRelay
{
  return self->_privateRelay;
}

- (void)setPrivateRelay:(BOOL)a3
{
  self->_privateRelay = a3;
}

- (BOOL)edgeRelay
{
  return self->_edgeRelay;
}

- (void)setEdgeRelay:(BOOL)a3
{
  self->_edgeRelay = a3;
}

- (BOOL)edgeRelayRemote
{
  return self->_edgeRelayRemote;
}

- (void)setEdgeRelayRemote:(BOOL)a3
{
  self->_edgeRelayRemote = a3;
}

- (NSString)hostOverride
{
  return self->_hostOverride;
}

- (void)setHostOverride:(id)a3
{
}

- (int64_t)movingAveragePeriod
{
  return self->_movingAveragePeriod;
}

- (void)setMovingAveragePeriod:(int64_t)a3
{
  self->_movingAveragePeriod = a3;
}

- (int64_t)standardDeviationThreshold
{
  return self->_standardDeviationThreshold;
}

- (void)setStandardDeviationThreshold:(int64_t)a3
{
  self->_standardDeviationThreshold = a3;
}

- (int64_t)trimmedMeanThreshold
{
  return self->_trimmedMeanThreshold;
}

- (void)setTrimmedMeanThreshold:(int64_t)a3
{
  self->_trimmedMeanThreshold = a3;
}

- (int64_t)multipathServiceType
{
  return self->_multipathServiceType;
}

- (void)setMultipathServiceType:(int64_t)a3
{
  self->_multipathServiceType = a3;
}

- (unint64_t)latencyMeasurementServiceType
{
  return self->_latencyMeasurementServiceType;
}

- (void)setLatencyMeasurementServiceType:(unint64_t)a3
{
  self->_latencyMeasurementServiceType = a3;
}

- (unint64_t)loadGeneratingNetworkServiceType
{
  return self->_loadGeneratingNetworkServiceType;
}

- (void)setLoadGeneratingNetworkServiceType:(unint64_t)a3
{
  self->_loadGeneratingNetworkServiceType = a3;
}

- (BOOL)useUnifiedHTTPStack
{
  return self->_useUnifiedHTTPStack;
}

- (void)setUseUnifiedHTTPStack:(BOOL)a3
{
  self->_useUnifiedHTTPStack = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostOverride, 0);
  objc_storeStrong((id *)&self->_networkInterfaceName, 0);
  objc_storeStrong((id *)&self->_bonjourHost, 0);
  objc_storeStrong((id *)&self->customConfigurationDictionary, 0);

  objc_storeStrong((id *)&self->customConfigurationString, 0);
}

@end