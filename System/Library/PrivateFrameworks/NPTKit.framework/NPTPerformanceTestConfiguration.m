@interface NPTPerformanceTestConfiguration
+ (id)defaultConfiguration;
+ (id)defaultConfigurationCellular;
+ (id)defaultConfigurationWiFi;
+ (id)defaultConfigurationWiredEthernet;
+ (id)evaluateInterfaceName:(int)a3;
+ (id)fileSizeConfigurationWithTimeout:(int)a3 timeout:(unint64_t)a4 downloadFileSize:(int)a5 uploadFileSize:(int)a6;
+ (id)interfaceServiceName:(int)a3;
- (BOOL)collectMetadata;
- (BOOL)collectWRMMetrics;
- (BOOL)customURLSet;
- (BOOL)endWhenStable;
- (BOOL)forceWiFi;
- (BOOL)legacyMode;
- (BOOL)multiStream;
- (BOOL)stopAtFileSize;
- (BOOL)useSecureConnection;
- (NPTPerformanceTestConfiguration)init;
- (NSDictionary)asDictionary;
- (NSString)bonjourHost;
- (NSString)clientName;
- (NSString)interfaceName;
- (NSString)pingHost;
- (NSString)uuid;
- (NSURL)downloadURL;
- (NSURL)uploadURL;
- (NetworkQualityConfiguration)NQConfiguration;
- (NetworkQualityConfiguration)NQDownloadConfiguration;
- (NetworkQualityConfiguration)NQUploadConfiguration;
- (id)cdnDownloadURL;
- (id)cdnUploadURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)downloadSize;
- (int)interfaceType;
- (int)pingAddressStyle;
- (int)uploadSize;
- (int64_t)concurrentStreams;
- (unint64_t)pingCount;
- (unint64_t)testDuration;
- (void)setBonjourHost:(id)a3;
- (void)setClientName:(id)a3;
- (void)setCollectMetadata:(BOOL)a3;
- (void)setCollectWRMMetrics:(BOOL)a3;
- (void)setConcurrentStreams:(int64_t)a3;
- (void)setDownloadSize:(int)a3;
- (void)setDownloadURL:(id)a3;
- (void)setEndWhenStable:(BOOL)a3;
- (void)setInterfaceName:(id)a3;
- (void)setInterfaceType:(int)a3;
- (void)setLegacyMode:(BOOL)a3;
- (void)setMultiStream:(BOOL)a3;
- (void)setPingAddressStyle:(int)a3;
- (void)setPingCount:(unint64_t)a3;
- (void)setPingHost:(id)a3;
- (void)setStopAtFileSize:(BOOL)a3;
- (void)setTestDuration:(unint64_t)a3;
- (void)setUploadSize:(int)a3;
- (void)setUploadURL:(id)a3;
- (void)setUseSecureConnection:(BOOL)a3;
- (void)setUuid:(id)a3;
@end

@implementation NPTPerformanceTestConfiguration

- (NetworkQualityConfiguration)NQConfiguration
{
  id v3 = objc_alloc_init(MEMORY[0x263F8C638]);
  [v3 setMaxRuntime:180];
  if (![(NPTPerformanceTestConfiguration *)self multiStream])
  {
    [v3 setMaxDownloadFlows:1];
    [v3 setMaxUploadFlows:1];
  }
  if ([(NPTPerformanceTestConfiguration *)self interfaceType] != 3)
  {
    v4 = [(NPTPerformanceTestConfiguration *)self interfaceName];
    [v3 setNetworkInterfaceName:v4];
  }
  if ([(NPTPerformanceTestConfiguration *)self testDuration])
  {
    objc_msgSend(v3, "setMaxRuntime:", 2 * -[NPTPerformanceTestConfiguration testDuration](self, "testDuration"));
    if (![(NPTPerformanceTestConfiguration *)self endWhenStable]) {
      objc_msgSend(v3, "setMinRuntime:", -[NPTPerformanceTestConfiguration testDuration](self, "testDuration"));
    }
  }
  if ([(NPTPerformanceTestConfiguration *)self downloadSize] != 1001
    && (![(NPTPerformanceTestConfiguration *)self testDuration]
     || [(NPTPerformanceTestConfiguration *)self stopAtFileSize]))
  {
    objc_msgSend(v3, "setMaxDownlinkData:", +[NPTFileSizeConverter getFileSizeInBytes:](NPTFileSizeConverter, "getFileSizeInBytes:", -[NPTPerformanceTestConfiguration downloadSize](self, "downloadSize")));
    if (![(NPTPerformanceTestConfiguration *)self testDuration]
      && ![(NPTPerformanceTestConfiguration *)self endWhenStable])
    {
      [v3 setMinRuntime:179];
    }
  }
  if ([(NPTPerformanceTestConfiguration *)self uploadSize] != 1001
    && (![(NPTPerformanceTestConfiguration *)self testDuration]
     || [(NPTPerformanceTestConfiguration *)self stopAtFileSize]))
  {
    objc_msgSend(v3, "setMaxUplinkData:", +[NPTFileSizeConverter getFileSizeInBytes:](NPTFileSizeConverter, "getFileSizeInBytes:", -[NPTPerformanceTestConfiguration uploadSize](self, "uploadSize")));
    if (![(NPTPerformanceTestConfiguration *)self testDuration]
      && ![(NPTPerformanceTestConfiguration *)self endWhenStable])
    {
      [v3 setMinRuntime:179];
    }
  }

  return (NetworkQualityConfiguration *)v3;
}

- (NetworkQualityConfiguration)NQDownloadConfiguration
{
  v2 = [(NPTPerformanceTestConfiguration *)self NQConfiguration];
  [v2 setParallel:0];
  [v2 setDownload:1];
  [v2 setUpload:0];

  return (NetworkQualityConfiguration *)v2;
}

- (NetworkQualityConfiguration)NQUploadConfiguration
{
  v2 = [(NPTPerformanceTestConfiguration *)self NQConfiguration];
  [v2 setParallel:0];
  [v2 setDownload:0];
  [v2 setUpload:1];

  return (NetworkQualityConfiguration *)v2;
}

- (NPTPerformanceTestConfiguration)init
{
  v5.receiver = self;
  v5.super_class = (Class)NPTPerformanceTestConfiguration;
  v2 = [(NPTPerformanceTestConfiguration *)&v5 init];
  id v3 = v2;
  if (v2)
  {
    [(NPTPerformanceTestConfiguration *)v2 setDownloadSize:1000];
    [(NPTPerformanceTestConfiguration *)v3 setUploadSize:50];
    [(NPTPerformanceTestConfiguration *)v3 setUseSecureConnection:1];
    [(NPTPerformanceTestConfiguration *)v3 setPingAddressStyle:0];
    [(NPTPerformanceTestConfiguration *)v3 setPingCount:10];
    [(NPTPerformanceTestConfiguration *)v3 setCollectMetadata:1];
    [(NPTPerformanceTestConfiguration *)v3 setInterfaceType:3];
    [(NPTPerformanceTestConfiguration *)v3 setConcurrentStreams:1];
    [(NPTPerformanceTestConfiguration *)v3 setUuid:0];
    [(NPTPerformanceTestConfiguration *)v3 setTestDuration:0];
    [(NPTPerformanceTestConfiguration *)v3 setStopAtFileSize:0];
    [(NPTPerformanceTestConfiguration *)v3 setCollectWRMMetrics:0];
    [(NPTPerformanceTestConfiguration *)v3 setMultiStream:1];
    v3->privateLegacyMode = 1;
  }
  return v3;
}

- (NSURL)uploadURL
{
  privateUploadURL = self->privateUploadURL;
  if (privateUploadURL)
  {
    id v3 = privateUploadURL;
  }
  else
  {
    id v3 = [(NPTPerformanceTestConfiguration *)self cdnUploadURL];
  }

  return v3;
}

- (id)cdnUploadURL
{
  id v3 = @"https://npt.cdn-apple.com/slurp";
  if (![(NPTPerformanceTestConfiguration *)self useSecureConnection])
  {
    uint64_t v4 = [(__CFString *)v3 stringByReplacingOccurrencesOfString:@"https://" withString:@"http://"];

    id v3 = (__CFString *)v4;
  }
  objc_super v5 = [NSURL URLWithString:v3];

  return v5;
}

- (NSURL)downloadURL
{
  privateDownloadURL = self->privateDownloadURL;
  if (privateDownloadURL)
  {
    id v3 = privateDownloadURL;
  }
  else
  {
    id v3 = [(NPTPerformanceTestConfiguration *)self cdnDownloadURL];
  }

  return v3;
}

- (id)cdnDownloadURL
{
  id v3 = @"https://npt.cdn-apple.com/salty";
  if (![(NPTPerformanceTestConfiguration *)self useSecureConnection])
  {
    uint64_t v4 = [(__CFString *)v3 stringByReplacingOccurrencesOfString:@"https://" withString:@"http://"];

    id v3 = (__CFString *)v4;
  }
  objc_super v5 = +[NPTFileSizeConverter getFileSizeAsString:[(NPTPerformanceTestConfiguration *)self downloadSize]];
  if ([(NPTPerformanceTestConfiguration *)self testDuration]
    && ![(NPTPerformanceTestConfiguration *)self stopAtFileSize]
    && [(NPTPerformanceTestConfiguration *)self downloadSize] == 1001)
  {
    uint64_t v6 = +[NPTFileSizeConverter getFileSizeAsString:1000];

    objc_super v5 = (void *)v6;
  }
  v7 = [NSString stringWithFormat:@"/%@", v5];
  v8 = [NSString stringWithFormat:@"%@%@", v3, v7];
  v9 = [NSURL URLWithString:v8];

  return v9;
}

- (NSString)pingHost
{
  if (self->privatePingHost) {
    return self->privatePingHost;
  }
  else {
    return (NSString *)@"npt.cdn-apple.com";
  }
}

- (NSString)clientName
{
  privateClientName = self->privateClientName;
  if (privateClientName)
  {
    id v3 = privateClientName;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x263F086E0] mainBundle];
    id v3 = [v4 bundleIdentifier];
  }

  return v3;
}

- (BOOL)legacyMode
{
  return [(NPTPerformanceTestConfiguration *)self customURLSet] || self->privateLegacyMode;
}

- (BOOL)forceWiFi
{
  return [(NPTPerformanceTestConfiguration *)self interfaceType] == 1;
}

- (BOOL)customURLSet
{
  return self->privateUploadURL || self->privateDownloadURL != 0;
}

+ (id)defaultConfiguration
{
  v2 = objc_alloc_init(NPTPerformanceTestConfiguration);

  return v2;
}

+ (id)defaultConfigurationWiFi
{
  v2 = objc_alloc_init(NPTPerformanceTestConfiguration);
  [(NPTPerformanceTestConfiguration *)v2 setInterfaceType:1];

  return v2;
}

+ (id)defaultConfigurationWiredEthernet
{
  v2 = objc_alloc_init(NPTPerformanceTestConfiguration);
  [(NPTPerformanceTestConfiguration *)v2 setInterfaceType:2];

  return v2;
}

+ (id)defaultConfigurationCellular
{
  v2 = objc_alloc_init(NPTPerformanceTestConfiguration);
  [(NPTPerformanceTestConfiguration *)v2 setInterfaceType:0];

  return v2;
}

+ (id)fileSizeConfigurationWithTimeout:(int)a3 timeout:(unint64_t)a4 downloadFileSize:(int)a5 uploadFileSize:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v9 = *(void *)&a3;
  v10 = objc_alloc_init(NPTPerformanceTestConfiguration);
  [(NPTPerformanceTestConfiguration *)v10 setInterfaceType:v9];
  [(NPTPerformanceTestConfiguration *)v10 setTestDuration:a4];
  [(NPTPerformanceTestConfiguration *)v10 setStopAtFileSize:1];
  [(NPTPerformanceTestConfiguration *)v10 setDownloadSize:v7];
  [(NPTPerformanceTestConfiguration *)v10 setUploadSize:v6];

  return v10;
}

- (void)setClientName:(id)a3
{
}

- (void)setDownloadURL:(id)a3
{
}

- (void)setUploadURL:(id)a3
{
}

- (void)setPingHost:(id)a3
{
}

- (void)setInterfaceType:(int)a3
{
  self->_interfaceType = a3;
  id v4 = +[NPTPerformanceTestConfiguration evaluateInterfaceName:[(NPTPerformanceTestConfiguration *)self interfaceType]];
  [(NPTPerformanceTestConfiguration *)self setInterfaceName:v4];
}

- (void)setLegacyMode:(BOOL)a3
{
  self->privateLegacyMode = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NPTPerformanceTestConfiguration allocWithZone:a3] init];
  [(NPTPerformanceTestConfiguration *)v4 setInterfaceType:[(NPTPerformanceTestConfiguration *)self interfaceType]];
  [(NPTPerformanceTestConfiguration *)v4 setDownloadSize:[(NPTPerformanceTestConfiguration *)self downloadSize]];
  [(NPTPerformanceTestConfiguration *)v4 setUploadSize:[(NPTPerformanceTestConfiguration *)self uploadSize]];
  [(NPTPerformanceTestConfiguration *)v4 setUseSecureConnection:[(NPTPerformanceTestConfiguration *)self useSecureConnection]];
  [(NPTPerformanceTestConfiguration *)v4 setPingAddressStyle:[(NPTPerformanceTestConfiguration *)self pingAddressStyle]];
  [(NPTPerformanceTestConfiguration *)v4 setPingCount:[(NPTPerformanceTestConfiguration *)self pingCount]];
  [(NPTPerformanceTestConfiguration *)v4 setCollectMetadata:[(NPTPerformanceTestConfiguration *)self collectMetadata]];
  objc_super v5 = [(NPTPerformanceTestConfiguration *)self downloadURL];
  [(NPTPerformanceTestConfiguration *)v4 setDownloadURL:v5];

  uint64_t v6 = [(NPTPerformanceTestConfiguration *)self uploadURL];
  [(NPTPerformanceTestConfiguration *)v4 setUploadURL:v6];

  uint64_t v7 = [(NPTPerformanceTestConfiguration *)self pingHost];
  [(NPTPerformanceTestConfiguration *)v4 setPingHost:v7];

  [(NPTPerformanceTestConfiguration *)v4 setConcurrentStreams:[(NPTPerformanceTestConfiguration *)self concurrentStreams]];
  v8 = [(NPTPerformanceTestConfiguration *)self uuid];
  [(NPTPerformanceTestConfiguration *)v4 setUuid:v8];

  uint64_t v9 = [(NPTPerformanceTestConfiguration *)self clientName];
  [(NPTPerformanceTestConfiguration *)v4 setClientName:v9];

  [(NPTPerformanceTestConfiguration *)v4 setTestDuration:[(NPTPerformanceTestConfiguration *)self testDuration]];
  [(NPTPerformanceTestConfiguration *)v4 setEndWhenStable:[(NPTPerformanceTestConfiguration *)self endWhenStable]];
  [(NPTPerformanceTestConfiguration *)v4 setStopAtFileSize:[(NPTPerformanceTestConfiguration *)self stopAtFileSize]];
  [(NPTPerformanceTestConfiguration *)v4 setCollectWRMMetrics:[(NPTPerformanceTestConfiguration *)self collectWRMMetrics]];
  [(NPTPerformanceTestConfiguration *)v4 setLegacyMode:[(NPTPerformanceTestConfiguration *)self legacyMode]];
  [(NPTPerformanceTestConfiguration *)v4 setMultiStream:[(NPTPerformanceTestConfiguration *)self multiStream]];
  return v4;
}

+ (id)evaluateInterfaceName:(int)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263F14410]);
  objc_super v5 = v4;
  if (a3 > 2)
  {
    uint64_t v6 = 0;
    uint64_t v9 = 0;
  }
  else
  {
    [v4 setRequiredInterfaceType:qword_219458520[a3]];
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F14420]) initWithEndpoint:0 parameters:v5];
    uint64_t v7 = [v6 path];
    v8 = [v7 interface];
    uint64_t v9 = [v8 interfaceName];
  }

  return v9;
}

+ (id)interfaceServiceName:(int)a3
{
  if (a3 > 2) {
    return @"Unspecified";
  }
  else {
    return off_2643A1D90[a3];
  }
}

- (NSDictionary)asDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v4 = [(NPTPerformanceTestConfiguration *)self clientName];
  objc_super v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = (__CFString *)v4;
  }
  else {
    uint64_t v6 = @"Unknown";
  }
  [v3 setObject:v6 forKeyedSubscript:@"calling_client"];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[NPTPerformanceTestConfiguration collectMetadata](self, "collectMetadata"));
  [v3 setObject:v7 forKeyedSubscript:@"collect_metadata"];

  v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[NPTPerformanceTestConfiguration concurrentStreams](self, "concurrentStreams"));
  [v3 setObject:v8 forKeyedSubscript:@"concurrent_stream_count"];

  uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NPTPerformanceTestConfiguration testDuration](self, "testDuration"));
  [v3 setObject:v9 forKeyedSubscript:@"duration"];

  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[NPTPerformanceTestConfiguration endWhenStable](self, "endWhenStable"));
  [v3 setObject:v10 forKeyedSubscript:@"end_when_stable"];

  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[NPTPerformanceTestConfiguration collectWRMMetrics](self, "collectWRMMetrics"));
  [v3 setObject:v11 forKeyedSubscript:@"collect_wrm_metrics"];

  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[NPTPerformanceTestConfiguration stopAtFileSize](self, "stopAtFileSize"));
  [v3 setObject:v12 forKeyedSubscript:@"stop_at_file_size"];

  uint64_t v13 = [(NPTPerformanceTestConfiguration *)self interfaceName];
  v14 = (void *)v13;
  if (v13) {
    v15 = (__CFString *)v13;
  }
  else {
    v15 = @"Unknown";
  }
  [v3 setObject:v15 forKeyedSubscript:@"interface_name"];

  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NPTPerformanceTestConfiguration interfaceType](self, "interfaceType"));
  [v3 setObject:v16 forKeyedSubscript:@"interface_type"];

  v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", +[NPTFileSizeConverter getFileSizeInBytes:](NPTFileSizeConverter, "getFileSizeInBytes:", -[NPTPerformanceTestConfiguration downloadSize](self, "downloadSize")));
  [v3 setObject:v17 forKeyedSubscript:@"download_file_size"];

  v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", +[NPTFileSizeConverter getFileSizeInBytes:](NPTFileSizeConverter, "getFileSizeInBytes:", -[NPTPerformanceTestConfiguration uploadSize](self, "uploadSize")));
  [v3 setObject:v18 forKeyedSubscript:@"upload_file_size"];

  v19 = objc_msgSend(NSNumber, "numberWithBool:", -[NPTPerformanceTestConfiguration customURLSet](self, "customURLSet"));
  [v3 setObject:v19 forKeyedSubscript:@"custom_url_set"];

  v20 = [NSNumber numberWithInt:self->privateDownloadURL != 0];
  [v3 setObject:v20 forKeyedSubscript:@"custom_download_url_set"];

  v21 = [NSNumber numberWithInt:self->privateUploadURL != 0];
  [v3 setObject:v21 forKeyedSubscript:@"custom_upload_url_set"];

  v22 = objc_msgSend(NSNumber, "numberWithBool:", -[NPTPerformanceTestConfiguration legacyMode](self, "legacyMode"));
  [v3 setObject:v22 forKeyedSubscript:@"legacy"];

  v23 = objc_msgSend(NSNumber, "numberWithBool:", -[NPTPerformanceTestConfiguration multiStream](self, "multiStream"));
  [v3 setObject:v23 forKeyedSubscript:@"multi_stream"];

  return (NSDictionary *)v3;
}

- (id)description
{
  id v3 = NSString;
  unint64_t v4 = [(NPTPerformanceTestConfiguration *)self testDuration];
  if ([(NPTPerformanceTestConfiguration *)self endWhenStable]) {
    objc_super v5 = @"YES";
  }
  else {
    objc_super v5 = @"NO";
  }
  int64_t v6 = [(NPTPerformanceTestConfiguration *)self concurrentStreams];
  if ([(NPTPerformanceTestConfiguration *)self customURLSet]) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  if ([(NPTPerformanceTestConfiguration *)self useSecureConnection]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  uint64_t v9 = +[NPTPerformanceTestConfiguration interfaceServiceName:[(NPTPerformanceTestConfiguration *)self interfaceType]];
  if ([(NPTPerformanceTestConfiguration *)self legacyMode]) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  v11 = [v3 stringWithFormat:@"Test Duration: %lu, End when stable: %@, Number of concurrent streams: %lu,\nCustom URL set: %@, Use Secure Connection: %@, Interface type: %@, Legacy Mode: %@ \n", v4, v5, v6, v7, v8, v9, v10];

  v12 = [(NPTPerformanceTestConfiguration *)self interfaceName];

  if (v12)
  {
    uint64_t v13 = NSString;
    v14 = [(NPTPerformanceTestConfiguration *)self interfaceName];
    v15 = [v13 stringWithFormat:@", interface name: %@", v14];

    uint64_t v16 = [v11 stringByAppendingString:v15];

    v11 = (void *)v16;
  }

  return v11;
}

- (BOOL)useSecureConnection
{
  return self->_useSecureConnection;
}

- (void)setUseSecureConnection:(BOOL)a3
{
  self->_useSecureConnection = a3;
}

- (int)downloadSize
{
  return self->_downloadSize;
}

- (void)setDownloadSize:(int)a3
{
  self->_downloadSize = a3;
}

- (int)uploadSize
{
  return self->_uploadSize;
}

- (void)setUploadSize:(int)a3
{
  self->_uploadSize = a3;
}

- (unint64_t)pingCount
{
  return self->_pingCount;
}

- (void)setPingCount:(unint64_t)a3
{
  self->_pingCount = a3;
}

- (int)pingAddressStyle
{
  return self->_pingAddressStyle;
}

- (void)setPingAddressStyle:(int)a3
{
  self->_pingAddressStyle = a3;
}

- (BOOL)collectMetadata
{
  return self->_collectMetadata;
}

- (void)setCollectMetadata:(BOOL)a3
{
  self->_collectMetadata = a3;
}

- (int64_t)concurrentStreams
{
  return self->_concurrentStreams;
}

- (void)setConcurrentStreams:(int64_t)a3
{
  self->_concurrentStreams = a3;
}

- (int)interfaceType
{
  return self->_interfaceType;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (unint64_t)testDuration
{
  return self->_testDuration;
}

- (void)setTestDuration:(unint64_t)a3
{
  self->_testDuration = a3;
}

- (BOOL)endWhenStable
{
  return self->_endWhenStable;
}

- (void)setEndWhenStable:(BOOL)a3
{
  self->_endWhenStable = a3;
}

- (BOOL)stopAtFileSize
{
  return self->_stopAtFileSize;
}

- (void)setStopAtFileSize:(BOOL)a3
{
  self->_stopAtFileSize = a3;
}

- (BOOL)collectWRMMetrics
{
  return self->_collectWRMMetrics;
}

- (void)setCollectWRMMetrics:(BOOL)a3
{
  self->_collectWRMMetrics = a3;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (BOOL)multiStream
{
  return self->_multiStream;
}

- (void)setMultiStream:(BOOL)a3
{
  self->_multiStream = a3;
}

- (NSString)bonjourHost
{
  return self->_bonjourHost;
}

- (void)setBonjourHost:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bonjourHost, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->privateClientName, 0);
  objc_storeStrong((id *)&self->privatePingHost, 0);
  objc_storeStrong((id *)&self->privateUploadURL, 0);

  objc_storeStrong((id *)&self->privateDownloadURL, 0);
}

@end