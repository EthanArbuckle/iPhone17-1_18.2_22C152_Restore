@interface NetworkQualityResult
+ (BOOL)supportsSecureCoding;
+ (int64_t)ratingForResponsivenessScore:(int64_t)a3;
- (BOOL)isCellular;
- (BOOL)proxied;
- (NSDate)timestamp;
- (NSDictionary)idleLatencyValues;
- (NSDictionary)otherValues;
- (NSDictionary)protocolNames;
- (NSDictionary)urlSessionMetrics;
- (NSDictionary)workingLatencyValues;
- (NSError)error;
- (NSNumber)downlinkBytesTransferred;
- (NSNumber)downlinkFlows;
- (NSNumber)downlinkHTTPForeignResponsiveness;
- (NSNumber)downlinkHTTPSelfResponsiveness;
- (NSNumber)downlinkTCPResponsiveness;
- (NSNumber)downlinkTLSResponsiveness;
- (NSNumber)httpLatency;
- (NSNumber)tcpLatency;
- (NSNumber)tlsLatency;
- (NSNumber)uplinkBytesTransferred;
- (NSNumber)uplinkFlows;
- (NSNumber)uplinkHTTPForeignResponsiveness;
- (NSNumber)uplinkHTTPSelfResponsiveness;
- (NSNumber)uplinkTCPResponsiveness;
- (NSNumber)uplinkTLSResponsiveness;
- (NSString)appProtocol;
- (NSString)interfaceName;
- (NSString)latencyMeasurementServiceType;
- (NSString)loadGeneratingNetworkServiceType;
- (NSString)osVersion;
- (NSString)testEndpoint;
- (NetworkQualityResult)init;
- (NetworkQualityResult)initWithCoder:(id)a3;
- (NetworkQualityValue)downlinkCapacity;
- (NetworkQualityValue)downlinkResponsiveness;
- (NetworkQualityValue)latency;
- (NetworkQualityValue)uplinkCapacity;
- (NetworkQualityValue)uplinkResponsiveness;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)index;
- (void)encodeWithCoder:(id)a3;
- (void)finalizeResult;
- (void)setAppProtocol:(id)a3;
- (void)setDownlinkBytesTransferred:(id)a3;
- (void)setDownlinkCapacity:(id)a3;
- (void)setDownlinkFlows:(id)a3;
- (void)setDownlinkHTTPForeignResponsiveness:(id)a3;
- (void)setDownlinkHTTPSelfResponsiveness:(id)a3;
- (void)setDownlinkResponsiveness:(id)a3;
- (void)setDownlinkTCPResponsiveness:(id)a3;
- (void)setDownlinkTLSResponsiveness:(id)a3;
- (void)setError:(id)a3;
- (void)setHttpLatency:(id)a3;
- (void)setIdleLatencyValues:(id)a3;
- (void)setIndex:(int64_t)a3;
- (void)setInterfaceName:(id)a3;
- (void)setIsCellular:(BOOL)a3;
- (void)setLatency:(id)a3;
- (void)setLatencyMeasurementServiceType:(id)a3;
- (void)setLoadGeneratingNetworkServiceType:(id)a3;
- (void)setOsVersion:(id)a3;
- (void)setOtherValues:(id)a3;
- (void)setProtocolNames:(id)a3;
- (void)setProxied:(BOOL)a3;
- (void)setTcpLatency:(id)a3;
- (void)setTestEndpoint:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setTlsLatency:(id)a3;
- (void)setUplinkBytesTransferred:(id)a3;
- (void)setUplinkCapacity:(id)a3;
- (void)setUplinkFlows:(id)a3;
- (void)setUplinkHTTPForeignResponsiveness:(id)a3;
- (void)setUplinkHTTPSelfResponsiveness:(id)a3;
- (void)setUplinkResponsiveness:(id)a3;
- (void)setUplinkTCPResponsiveness:(id)a3;
- (void)setUplinkTLSResponsiveness:(id)a3;
- (void)setUrlSessionMetrics:(id)a3;
- (void)setWorkingLatencyValues:(id)a3;
@end

@implementation NetworkQualityResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NetworkQualityResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v88.receiver = self;
  v88.super_class = (Class)NetworkQualityResult;
  v5 = [(NetworkQualityResult *)&v88 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v6;

    uint64_t v8 = objc_opt_class();
    v87 = [v4 decodeObjectOfClass:v8 forKey:@"index"];
    v5->_index = [v87 integerValue];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = [v4 decodeObjectOfClass:v9 forKey:@"downlinkCapacity"];
    downlinkCapacity = v5->_downlinkCapacity;
    v5->_downlinkCapacity = (NetworkQualityValue *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:v8 forKey:@"downlinkBytesTransferred"];
    downlinkBytesTransferred = v5->_downlinkBytesTransferred;
    v5->_downlinkBytesTransferred = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:v8 forKey:@"downlinkFlows"];
    downlinkFlows = v5->_downlinkFlows;
    v5->_downlinkFlows = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interfaceName"];
    interfaceName = v5->_interfaceName;
    v5->_interfaceName = (NSString *)v16;

    v5->_isCellular = [v4 decodeBoolForKey:@"isCellular"];
    uint64_t v18 = [v4 decodeObjectOfClass:v9 forKey:@"uplinkCapacity"];
    uplinkCapacity = v5->_uplinkCapacity;
    v5->_uplinkCapacity = (NetworkQualityValue *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:v8 forKey:@"uplinkBytesTransferred"];
    uplinkBytesTransferred = v5->_uplinkBytesTransferred;
    v5->_uplinkBytesTransferred = (NSNumber *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:v8 forKey:@"uplinkFlows"];
    uplinkFlows = v5->_uplinkFlows;
    v5->_uplinkFlows = (NSNumber *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:v9 forKey:@"downlinkResponsiveness"];
    downlinkResponsiveness = v5->_downlinkResponsiveness;
    v5->_downlinkResponsiveness = (NetworkQualityValue *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:v8 forKey:@"downlinkTCPResponsiveness"];
    downlinkTCPResponsiveness = v5->_downlinkTCPResponsiveness;
    v5->_downlinkTCPResponsiveness = (NSNumber *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:v8 forKey:@"downlinkTLSResponsiveness"];
    downlinkTLSResponsiveness = v5->_downlinkTLSResponsiveness;
    v5->_downlinkTLSResponsiveness = (NSNumber *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:v8 forKey:@"downlinkHTTPForeignResponsiveness"];
    downlinkHTTPForeignResponsiveness = v5->_downlinkHTTPForeignResponsiveness;
    v5->_downlinkHTTPForeignResponsiveness = (NSNumber *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:v8 forKey:@"downlinkHTTPSelfResponsiveness"];
    downlinkHTTPSelfResponsiveness = v5->_downlinkHTTPSelfResponsiveness;
    v5->_downlinkHTTPSelfResponsiveness = (NSNumber *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:v9 forKey:@"uplinkResponsiveness"];
    uplinkResponsiveness = v5->_uplinkResponsiveness;
    v5->_uplinkResponsiveness = (NetworkQualityValue *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:v8 forKey:@"uplinkTCPResponsiveness"];
    uplinkTCPResponsiveness = v5->_uplinkTCPResponsiveness;
    v5->_uplinkTCPResponsiveness = (NSNumber *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:v8 forKey:@"uplinkTLSResponsiveness"];
    uplinkTLSResponsiveness = v5->_uplinkTLSResponsiveness;
    v5->_uplinkTLSResponsiveness = (NSNumber *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:v8 forKey:@"uplinkHTTPForeignResponsiveness"];
    uplinkHTTPForeignResponsiveness = v5->_uplinkHTTPForeignResponsiveness;
    v5->_uplinkHTTPForeignResponsiveness = (NSNumber *)v40;

    uint64_t v42 = [v4 decodeObjectOfClass:v8 forKey:@"uplinkHTTPSelfResponsiveness"];
    uplinkHTTPSelfResponsiveness = v5->_uplinkHTTPSelfResponsiveness;
    v5->_uplinkHTTPSelfResponsiveness = (NSNumber *)v42;

    v44 = (void *)MEMORY[0x263EFFA08];
    uint64_t v45 = objc_opt_class();
    uint64_t v46 = objc_opt_class();
    uint64_t v47 = objc_opt_class();
    [v44 setWithObjects:v45, v46, v47, objc_opt_class(), 0];
    uint64_t v49 = [v4 decodeObjectOfClasses:v48 forKey:@"workingLatencyValues"];
    workingLatencyValues = v5->_workingLatencyValues;
    v5->_workingLatencyValues = (NSDictionary *)v49;

    uint64_t v51 = [v4 decodeObjectOfClass:v9 forKey:@"latency"];
    latency = v5->_latency;
    v5->_latency = (NetworkQualityValue *)v51;

    v53 = (void *)MEMORY[0x263EFFA08];
    uint64_t v54 = objc_opt_class();
    uint64_t v55 = objc_opt_class();
    uint64_t v56 = objc_opt_class();
    v57 = [v53 setWithObjects:v54, v55, v56, objc_opt_class(), nil];
    uint64_t v58 = [v4 decodeObjectOfClasses:v57 forKey:@"idleLatencyValues"];
    idleLatencyValues = v5->_idleLatencyValues;
    v5->_idleLatencyValues = (NSDictionary *)v58;

    v60 = (void *)MEMORY[0x263EFFA08];
    uint64_t v61 = objc_opt_class();
    uint64_t v62 = objc_opt_class();
    uint64_t v63 = objc_opt_class();
    v64 = [v60 setWithObjects:v61, v62, v63, objc_opt_class(), nil];
    uint64_t v65 = [v4 decodeObjectOfClasses:v64 forKey:@"protocolNamesValues"];
    protocolNames = v5->_protocolNames;
    v5->_protocolNames = (NSDictionary *)v65;

    v67 = (void *)MEMORY[0x263EFFA08];
    uint64_t v68 = objc_opt_class();
    uint64_t v69 = objc_opt_class();
    uint64_t v70 = objc_opt_class();
    v71 = [v67 setWithObjects:v68, v69, v70, objc_opt_class(), 0];
    uint64_t v72 = [v4 decodeObjectOfClasses:v71 forKey:@"otherValues"];
    otherValues = v5->_otherValues;
    v5->_otherValues = (NSDictionary *)v72;

    uint64_t v74 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"testEndpoint"];
    testEndpoint = v5->_testEndpoint;
    v5->_testEndpoint = (NSString *)v74;

    uint64_t v76 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"osVersion"];
    osVersion = v5->_osVersion;
    v5->_osVersion = (NSString *)v76;

    uint64_t v78 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v78;

    v5->_proxied = [v4 decodeBoolForKey:@"proxied"];
    uint64_t v80 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appProtocol"];
    appProtocol = v5->_appProtocol;
    v5->_appProtocol = (NSString *)v80;

    uint64_t v82 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"latencyMeasurementServiceType"];
    latencyMeasurementServiceType = v5->_latencyMeasurementServiceType;
    v5->_latencyMeasurementServiceType = (NSString *)v82;

    uint64_t v84 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"loadGeneratingNetworkServiceType"];
    loadGeneratingNetworkServiceType = v5->_loadGeneratingNetworkServiceType;
    v5->_loadGeneratingNetworkServiceType = (NSString *)v84;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  timestamp = self->_timestamp;
  id v5 = a3;
  [v5 encodeObject:timestamp forKey:@"timestamp"];
  id v6 = (id)[objc_alloc(NSNumber) initWithInteger:self->_index];
  [v5 encodeObject:v6 forKey:@"index"];
  [v5 encodeObject:self->_downlinkCapacity forKey:@"downlinkCapacity"];
  [v5 encodeObject:self->_downlinkBytesTransferred forKey:@"downlinkBytesTransferred"];
  [v5 encodeObject:self->_downlinkFlows forKey:@"downlinkFlows"];
  [v5 encodeObject:self->_interfaceName forKey:@"interfaceName"];
  [v5 encodeBool:self->_isCellular forKey:@"isCellular"];
  [v5 encodeObject:self->_uplinkCapacity forKey:@"uplinkCapacity"];
  [v5 encodeObject:self->_uplinkBytesTransferred forKey:@"uplinkBytesTransferred"];
  [v5 encodeObject:self->_uplinkFlows forKey:@"uplinkFlows"];
  [v5 encodeObject:self->_downlinkResponsiveness forKey:@"downlinkResponsiveness"];
  [v5 encodeObject:self->_downlinkTCPResponsiveness forKey:@"downlinkTCPResponsiveness"];
  [v5 encodeObject:self->_downlinkTLSResponsiveness forKey:@"downlinkTLSResponsiveness"];
  [v5 encodeObject:self->_downlinkHTTPForeignResponsiveness forKey:@"downlinkHTTPForeignResponsiveness"];
  [v5 encodeObject:self->_downlinkHTTPSelfResponsiveness forKey:@"downlinkHTTPSelfResponsiveness"];
  [v5 encodeObject:self->_uplinkResponsiveness forKey:@"uplinkResponsiveness"];
  [v5 encodeObject:self->_uplinkTCPResponsiveness forKey:@"uplinkTCPResponsiveness"];
  [v5 encodeObject:self->_uplinkTLSResponsiveness forKey:@"uplinkTLSResponsiveness"];
  [v5 encodeObject:self->_uplinkHTTPForeignResponsiveness forKey:@"uplinkHTTPForeignResponsiveness"];
  [v5 encodeObject:self->_uplinkHTTPSelfResponsiveness forKey:@"uplinkHTTPSelfResponsiveness"];
  [v5 encodeObject:self->_workingLatencyValues forKey:@"workingLatencyValues"];
  [v5 encodeObject:self->_latency forKey:@"latency"];
  [v5 encodeObject:self->_tcpLatency forKey:@"tcpLatency"];
  [v5 encodeObject:self->_tlsLatency forKey:@"tlsLatency"];
  [v5 encodeObject:self->_httpLatency forKey:@"httpLatency"];
  [v5 encodeObject:self->_idleLatencyValues forKey:@"idleLatencyValues"];
  [v5 encodeObject:self->_protocolNames forKey:@"protocolNamesValues"];
  [v5 encodeObject:self->_otherValues forKey:@"otherValues"];
  [v5 encodeObject:self->_testEndpoint forKey:@"testEndpoint"];
  [v5 encodeObject:self->_osVersion forKey:@"osVersion"];
  [v5 encodeObject:self->_error forKey:@"error"];
  [v5 encodeBool:self->_proxied forKey:@"proxied"];
  [v5 encodeObject:self->_appProtocol forKey:@"appProtocol"];
  [v5 encodeObject:self->_latencyMeasurementServiceType forKey:@"latencyMeasurementServiceType"];
  [v5 encodeObject:self->_loadGeneratingNetworkServiceType forKey:@"loadGeneratingNetworkServiceType"];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: _downlinkCapacity=%@, _uplinkCapacity=%@, _downlinkResponsiveness=%@, _uplinkResponsiveness=%@>", v5, self->_downlinkCapacity, self->_uplinkCapacity, self->_downlinkResponsiveness, self->_uplinkResponsiveness];

  return v6;
}

+ (int64_t)ratingForResponsivenessScore:(int64_t)a3
{
  if (a3 <= 1000) {
    return a3 > 200;
  }
  else {
    return 2;
  }
}

- (NetworkQualityResult)init
{
  v24.receiver = self;
  v24.super_class = (Class)NetworkQualityResult;
  v2 = [(NetworkQualityResult *)&v24 init];
  if (v2)
  {
    v3 = objc_alloc_init(NetworkQualityValue);
    downlinkCapacity = v2->_downlinkCapacity;
    v2->_downlinkCapacity = v3;

    id v5 = objc_alloc_init(NetworkQualityValue);
    uplinkCapacity = v2->_uplinkCapacity;
    v2->_uplinkCapacity = v5;

    v7 = objc_alloc_init(NetworkQualityValue);
    downlinkResponsiveness = v2->_downlinkResponsiveness;
    v2->_downlinkResponsiveness = v7;

    uint64_t v9 = objc_alloc_init(NetworkQualityValue);
    uplinkResponsiveness = v2->_uplinkResponsiveness;
    v2->_uplinkResponsiveness = v9;

    v11 = (NSDictionary *)objc_alloc_init(NSDictionary);
    workingLatencyValues = v2->_workingLatencyValues;
    v2->_workingLatencyValues = v11;

    v13 = objc_alloc_init(NetworkQualityValue);
    latency = v2->_latency;
    v2->_latency = v13;

    v15 = (NSDictionary *)objc_alloc_init(NSDictionary);
    idleLatencyValues = v2->_idleLatencyValues;
    v2->_idleLatencyValues = v15;

    v17 = (NSDictionary *)objc_alloc_init(NSDictionary);
    protocolNames = v2->_protocolNames;
    v2->_protocolNames = v17;

    v19 = (NSDictionary *)objc_alloc_init(NSDictionary);
    otherValues = v2->_otherValues;
    v2->_otherValues = v19;

    v21 = (NSDictionary *)objc_alloc_init(NSDictionary);
    urlSessionMetrics = v2->_urlSessionMetrics;
    v2->_urlSessionMetrics = v21;
  }
  return v2;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(NetworkQualityResult);
  id v5 = [(NetworkQualityResult *)self timestamp];
  id v6 = (void *)[v5 copy];
  [(NetworkQualityResult *)v4 setTimestamp:v6];

  [(NetworkQualityResult *)v4 setIndex:[(NetworkQualityResult *)self index]];
  v7 = [(NetworkQualityResult *)self downlinkCapacity];
  uint64_t v8 = (void *)[v7 copy];
  [(NetworkQualityResult *)v4 setDownlinkCapacity:v8];

  uint64_t v9 = [(NetworkQualityResult *)self downlinkBytesTransferred];
  uint64_t v10 = (void *)[v9 copy];
  [(NetworkQualityResult *)v4 setDownlinkBytesTransferred:v10];

  v11 = [(NetworkQualityResult *)self downlinkFlows];
  uint64_t v12 = (void *)[v11 copy];
  [(NetworkQualityResult *)v4 setDownlinkFlows:v12];

  v13 = [(NetworkQualityResult *)self interfaceName];
  uint64_t v14 = (void *)[v13 copy];
  [(NetworkQualityResult *)v4 setInterfaceName:v14];

  [(NetworkQualityResult *)v4 setIsCellular:[(NetworkQualityResult *)self isCellular]];
  v15 = [(NetworkQualityResult *)self uplinkCapacity];
  uint64_t v16 = (void *)[v15 copy];
  [(NetworkQualityResult *)v4 setUplinkCapacity:v16];

  v17 = [(NetworkQualityResult *)self uplinkBytesTransferred];
  uint64_t v18 = (void *)[v17 copy];
  [(NetworkQualityResult *)v4 setUplinkBytesTransferred:v18];

  v19 = [(NetworkQualityResult *)self uplinkFlows];
  uint64_t v20 = (void *)[v19 copy];
  [(NetworkQualityResult *)v4 setUplinkFlows:v20];

  v21 = [(NetworkQualityResult *)self downlinkResponsiveness];
  uint64_t v22 = (void *)[v21 copy];
  [(NetworkQualityResult *)v4 setDownlinkResponsiveness:v22];

  v23 = [(NetworkQualityResult *)self downlinkTCPResponsiveness];
  objc_super v24 = (void *)[v23 copy];
  [(NetworkQualityResult *)v4 setDownlinkTCPResponsiveness:v24];

  v25 = [(NetworkQualityResult *)self downlinkTLSResponsiveness];
  uint64_t v26 = (void *)[v25 copy];
  [(NetworkQualityResult *)v4 setDownlinkTLSResponsiveness:v26];

  v27 = [(NetworkQualityResult *)self downlinkHTTPForeignResponsiveness];
  uint64_t v28 = (void *)[v27 copy];
  [(NetworkQualityResult *)v4 setDownlinkHTTPForeignResponsiveness:v28];

  v29 = [(NetworkQualityResult *)self downlinkHTTPSelfResponsiveness];
  uint64_t v30 = (void *)[v29 copy];
  [(NetworkQualityResult *)v4 setDownlinkHTTPSelfResponsiveness:v30];

  v31 = [(NetworkQualityResult *)self uplinkResponsiveness];
  uint64_t v32 = (void *)[v31 copy];
  [(NetworkQualityResult *)v4 setUplinkResponsiveness:v32];

  v33 = [(NetworkQualityResult *)self uplinkTCPResponsiveness];
  uint64_t v34 = (void *)[v33 copy];
  [(NetworkQualityResult *)v4 setUplinkTCPResponsiveness:v34];

  v35 = [(NetworkQualityResult *)self uplinkTLSResponsiveness];
  uint64_t v36 = (void *)[v35 copy];
  [(NetworkQualityResult *)v4 setUplinkTLSResponsiveness:v36];

  v37 = [(NetworkQualityResult *)self uplinkHTTPForeignResponsiveness];
  uint64_t v38 = (void *)[v37 copy];
  [(NetworkQualityResult *)v4 setUplinkHTTPForeignResponsiveness:v38];

  v39 = [(NetworkQualityResult *)self uplinkHTTPSelfResponsiveness];
  uint64_t v40 = (void *)[v39 copy];
  [(NetworkQualityResult *)v4 setUplinkHTTPSelfResponsiveness:v40];

  v41 = [(NetworkQualityResult *)self workingLatencyValues];
  uint64_t v42 = (void *)[v41 copy];
  [(NetworkQualityResult *)v4 setWorkingLatencyValues:v42];

  v43 = [(NetworkQualityResult *)self latency];
  v44 = (void *)[v43 copy];
  [(NetworkQualityResult *)v4 setLatency:v44];

  uint64_t v45 = [(NetworkQualityResult *)self tcpLatency];
  uint64_t v46 = (void *)[v45 copy];
  [(NetworkQualityResult *)v4 setTcpLatency:v46];

  uint64_t v47 = [(NetworkQualityResult *)self tlsLatency];
  v48 = (void *)[v47 copy];
  [(NetworkQualityResult *)v4 setTlsLatency:v48];

  uint64_t v49 = [(NetworkQualityResult *)self httpLatency];
  v50 = (void *)[v49 copy];
  [(NetworkQualityResult *)v4 setHttpLatency:v50];

  uint64_t v51 = [(NetworkQualityResult *)self idleLatencyValues];
  v52 = (void *)[v51 copy];
  [(NetworkQualityResult *)v4 setIdleLatencyValues:v52];

  v53 = [(NetworkQualityResult *)self protocolNames];
  uint64_t v54 = (void *)[v53 copy];
  [(NetworkQualityResult *)v4 setProtocolNames:v54];

  uint64_t v55 = [(NetworkQualityResult *)self otherValues];
  uint64_t v56 = (void *)[v55 copy];
  [(NetworkQualityResult *)v4 setOtherValues:v56];

  v57 = [(NetworkQualityResult *)self urlSessionMetrics];
  uint64_t v58 = (void *)[v57 copy];
  [(NetworkQualityResult *)v4 setUrlSessionMetrics:v58];

  v59 = [(NetworkQualityResult *)self testEndpoint];
  v60 = (void *)[v59 copy];
  [(NetworkQualityResult *)v4 setTestEndpoint:v60];

  uint64_t v61 = [(NetworkQualityResult *)self osVersion];
  uint64_t v62 = (void *)[v61 copy];
  [(NetworkQualityResult *)v4 setOsVersion:v62];

  uint64_t v63 = [(NetworkQualityResult *)self error];
  v64 = (void *)[v63 copy];
  [(NetworkQualityResult *)v4 setError:v64];

  [(NetworkQualityResult *)v4 setProxied:[(NetworkQualityResult *)self proxied]];
  uint64_t v65 = [(NetworkQualityResult *)self appProtocol];
  v66 = (void *)[v65 copy];
  [(NetworkQualityResult *)v4 setAppProtocol:v66];

  v67 = [(NetworkQualityResult *)self latencyMeasurementServiceType];
  [(NetworkQualityResult *)v4 setLatencyMeasurementServiceType:v67];

  uint64_t v68 = [(NetworkQualityResult *)self loadGeneratingNetworkServiceType];
  [(NetworkQualityResult *)v4 setLoadGeneratingNetworkServiceType:v68];

  return v4;
}

- (void)finalizeResult
{
  v3 = [MEMORY[0x263EFF910] now];
  [(NetworkQualityResult *)self setTimestamp:v3];

  id v4 = NSNumber;
  id v5 = [(NetworkQualityResult *)self downlinkResponsiveness];
  id v6 = [v5 value];
  v7 = [v4 numberWithInteger:+[NetworkQualityResult ratingForResponsivenessScore:](NetworkQualityResult, "ratingForResponsivenessScore:", [v6 integerValue])];
  uint64_t v8 = [(NetworkQualityResult *)self downlinkResponsiveness];
  [v8 setRating:v7];

  uint64_t v9 = NSNumber;
  uint64_t v10 = [(NetworkQualityResult *)self uplinkResponsiveness];
  v11 = [v10 value];
  uint64_t v12 = [v9 numberWithInteger:+[NetworkQualityResult ratingForResponsivenessScore:](NetworkQualityResult, "ratingForResponsivenessScore:", [v11 integerValue])];
  v13 = [(NetworkQualityResult *)self uplinkResponsiveness];
  [v13 setRating:v12];

  id v15 = [MEMORY[0x263F08AB0] processInfo];
  uint64_t v14 = [v15 operatingSystemVersionString];
  [(NetworkQualityResult *)self setOsVersion:v14];
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTimestamp:(id)a3
{
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (NetworkQualityValue)downlinkCapacity
{
  return (NetworkQualityValue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDownlinkCapacity:(id)a3
{
}

- (NSNumber)downlinkBytesTransferred
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDownlinkBytesTransferred:(id)a3
{
}

- (NSNumber)downlinkFlows
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDownlinkFlows:(id)a3
{
}

- (NSString)interfaceName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setInterfaceName:(id)a3
{
}

- (BOOL)isCellular
{
  return self->_isCellular;
}

- (void)setIsCellular:(BOOL)a3
{
  self->_isCellular = a3;
}

- (NetworkQualityValue)uplinkCapacity
{
  return (NetworkQualityValue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUplinkCapacity:(id)a3
{
}

- (NSNumber)uplinkBytesTransferred
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUplinkBytesTransferred:(id)a3
{
}

- (NSNumber)uplinkFlows
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setUplinkFlows:(id)a3
{
}

- (NetworkQualityValue)downlinkResponsiveness
{
  return (NetworkQualityValue *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDownlinkResponsiveness:(id)a3
{
}

- (NSNumber)downlinkTCPResponsiveness
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDownlinkTCPResponsiveness:(id)a3
{
}

- (NSNumber)downlinkTLSResponsiveness
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDownlinkTLSResponsiveness:(id)a3
{
}

- (NSNumber)downlinkHTTPForeignResponsiveness
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDownlinkHTTPForeignResponsiveness:(id)a3
{
}

- (NSNumber)downlinkHTTPSelfResponsiveness
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDownlinkHTTPSelfResponsiveness:(id)a3
{
}

- (NetworkQualityValue)uplinkResponsiveness
{
  return (NetworkQualityValue *)objc_getProperty(self, a2, 128, 1);
}

- (void)setUplinkResponsiveness:(id)a3
{
}

- (NSNumber)uplinkTCPResponsiveness
{
  return (NSNumber *)objc_getProperty(self, a2, 136, 1);
}

- (void)setUplinkTCPResponsiveness:(id)a3
{
}

- (NSNumber)uplinkTLSResponsiveness
{
  return (NSNumber *)objc_getProperty(self, a2, 144, 1);
}

- (void)setUplinkTLSResponsiveness:(id)a3
{
}

- (NSNumber)uplinkHTTPForeignResponsiveness
{
  return (NSNumber *)objc_getProperty(self, a2, 152, 1);
}

- (void)setUplinkHTTPForeignResponsiveness:(id)a3
{
}

- (NSNumber)uplinkHTTPSelfResponsiveness
{
  return (NSNumber *)objc_getProperty(self, a2, 160, 1);
}

- (void)setUplinkHTTPSelfResponsiveness:(id)a3
{
}

- (NSDictionary)workingLatencyValues
{
  return (NSDictionary *)objc_getProperty(self, a2, 168, 1);
}

- (void)setWorkingLatencyValues:(id)a3
{
}

- (NetworkQualityValue)latency
{
  return (NetworkQualityValue *)objc_getProperty(self, a2, 176, 1);
}

- (void)setLatency:(id)a3
{
}

- (NSNumber)tcpLatency
{
  return (NSNumber *)objc_getProperty(self, a2, 184, 1);
}

- (void)setTcpLatency:(id)a3
{
}

- (NSNumber)tlsLatency
{
  return (NSNumber *)objc_getProperty(self, a2, 192, 1);
}

- (void)setTlsLatency:(id)a3
{
}

- (NSNumber)httpLatency
{
  return (NSNumber *)objc_getProperty(self, a2, 200, 1);
}

- (void)setHttpLatency:(id)a3
{
}

- (NSDictionary)idleLatencyValues
{
  return (NSDictionary *)objc_getProperty(self, a2, 208, 1);
}

- (void)setIdleLatencyValues:(id)a3
{
}

- (NSDictionary)protocolNames
{
  return (NSDictionary *)objc_getProperty(self, a2, 216, 1);
}

- (void)setProtocolNames:(id)a3
{
}

- (NSDictionary)otherValues
{
  return (NSDictionary *)objc_getProperty(self, a2, 224, 1);
}

- (void)setOtherValues:(id)a3
{
}

- (NSDictionary)urlSessionMetrics
{
  return (NSDictionary *)objc_getProperty(self, a2, 232, 1);
}

- (void)setUrlSessionMetrics:(id)a3
{
}

- (NSString)testEndpoint
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setTestEndpoint:(id)a3
{
}

- (NSString)osVersion
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void)setOsVersion:(id)a3
{
}

- (NSString)latencyMeasurementServiceType
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (void)setLatencyMeasurementServiceType:(id)a3
{
}

- (NSString)loadGeneratingNetworkServiceType
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (void)setLoadGeneratingNetworkServiceType:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 272, 1);
}

- (void)setError:(id)a3
{
}

- (BOOL)proxied
{
  return self->_proxied;
}

- (void)setProxied:(BOOL)a3
{
  self->_proxied = a3;
}

- (NSString)appProtocol
{
  return (NSString *)objc_getProperty(self, a2, 280, 1);
}

- (void)setAppProtocol:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appProtocol, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_loadGeneratingNetworkServiceType, 0);
  objc_storeStrong((id *)&self->_latencyMeasurementServiceType, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_testEndpoint, 0);
  objc_storeStrong((id *)&self->_urlSessionMetrics, 0);
  objc_storeStrong((id *)&self->_otherValues, 0);
  objc_storeStrong((id *)&self->_protocolNames, 0);
  objc_storeStrong((id *)&self->_idleLatencyValues, 0);
  objc_storeStrong((id *)&self->_httpLatency, 0);
  objc_storeStrong((id *)&self->_tlsLatency, 0);
  objc_storeStrong((id *)&self->_tcpLatency, 0);
  objc_storeStrong((id *)&self->_latency, 0);
  objc_storeStrong((id *)&self->_workingLatencyValues, 0);
  objc_storeStrong((id *)&self->_uplinkHTTPSelfResponsiveness, 0);
  objc_storeStrong((id *)&self->_uplinkHTTPForeignResponsiveness, 0);
  objc_storeStrong((id *)&self->_uplinkTLSResponsiveness, 0);
  objc_storeStrong((id *)&self->_uplinkTCPResponsiveness, 0);
  objc_storeStrong((id *)&self->_uplinkResponsiveness, 0);
  objc_storeStrong((id *)&self->_downlinkHTTPSelfResponsiveness, 0);
  objc_storeStrong((id *)&self->_downlinkHTTPForeignResponsiveness, 0);
  objc_storeStrong((id *)&self->_downlinkTLSResponsiveness, 0);
  objc_storeStrong((id *)&self->_downlinkTCPResponsiveness, 0);
  objc_storeStrong((id *)&self->_downlinkResponsiveness, 0);
  objc_storeStrong((id *)&self->_uplinkFlows, 0);
  objc_storeStrong((id *)&self->_uplinkBytesTransferred, 0);
  objc_storeStrong((id *)&self->_uplinkCapacity, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_downlinkFlows, 0);
  objc_storeStrong((id *)&self->_downlinkBytesTransferred, 0);
  objc_storeStrong((id *)&self->_downlinkCapacity, 0);

  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end