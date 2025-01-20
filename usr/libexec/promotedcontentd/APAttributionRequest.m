@interface APAttributionRequest
- (BOOL)attributionMetadataExistsOnDevice;
- (BOOL)developmentApp;
- (NSDictionary)payloadForRequestBodyABCLog;
- (NSDictionary)payloadForRequestHeaderABCLog;
- (NSNumber)adamId;
- (NSString)adMetadata;
- (NSString)attributionKey;
- (NSString)bundleId;
- (NSString)daemonBundleId;
- (NSString)device;
- (NSString)fpdiSignature;
- (NSString)mescalSignature;
- (NSString)osBuild;
- (NSString)osPlatform;
- (NSString)osVersion;
- (NSString)purchaseTimestamp;
- (NSString)storefront;
- (NSString)timestamp;
- (NSString)userAgent;
- (NSUUID)anonymousDemandId;
- (NSUUID)toroId;
- (double)downloadClickTimestamp;
- (double)iAdConversionTimestamp;
- (double)iAdImpressionTimestamp;
- (double)searchAdClickTimestamp;
- (id)requestBody;
- (id)requestHeader;
- (int64_t)attributionDownloadType;
- (void)addCapData:(id)a3;
- (void)addMetaData:(id)a3;
- (void)loadDeviceInfo;
- (void)loadIDAccountDetails;
- (void)setAdMetadata:(id)a3;
- (void)setAdamId:(id)a3;
- (void)setAnonymousDemandId:(id)a3;
- (void)setAttributionDownloadType:(int64_t)a3;
- (void)setAttributionKey:(id)a3;
- (void)setAttributionMetadataExistsOnDevice:(BOOL)a3;
- (void)setBundleId:(id)a3;
- (void)setDaemonBundleId:(id)a3;
- (void)setDevelopmentApp:(BOOL)a3;
- (void)setDevice:(id)a3;
- (void)setDownloadClickTimestamp:(double)a3;
- (void)setFpdiSignature:(id)a3;
- (void)setIAdConversionTimestamp:(double)a3;
- (void)setIAdImpressionTimestamp:(double)a3;
- (void)setMescalSignature:(id)a3;
- (void)setOsBuild:(id)a3;
- (void)setOsPlatform:(id)a3;
- (void)setOsVersion:(id)a3;
- (void)setPurchaseTimestamp:(id)a3;
- (void)setSearchAdClickTimestamp:(double)a3;
- (void)setStorefront:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setToroId:(id)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation APAttributionRequest

- (void)loadDeviceInfo
{
  id v13 = +[NSISO8601DateFormatter apDefaultSharedFormatter];
  v3 = +[NSDate date];
  v4 = [v13 stringFromDate:v3];
  [(APAttributionRequest *)self setTimestamp:v4];

  [(APAttributionRequest *)self setDaemonBundleId:@"com.apple.ap.promotedcontentd"];
  v5 = +[APDeviceInfo current];
  v6 = +[APIDAccountProvider privateUserAccount];
  v7 = [v6 storefront];
  v8 = [v5 userAgentStringForBundleID:@"com.apple.ap.promotedcontentd" storefront:v7];
  [(APAttributionRequest *)self setUserAgent:v8];

  v9 = [v5 systemName];
  [(APAttributionRequest *)self setOsPlatform:v9];

  v10 = [v5 systemVersion];
  [(APAttributionRequest *)self setOsVersion:v10];

  v11 = [v5 buildVersion];
  [(APAttributionRequest *)self setOsBuild:v11];

  v12 = [v5 deviceModel];
  [(APAttributionRequest *)self setDevice:v12];
}

- (void)loadIDAccountDetails
{
  id v6 = +[APIDAccountProvider privateUserAccount];
  v3 = [v6 toroID];
  [(APAttributionRequest *)self setToroId:v3];

  v4 = [v6 anonymousDemandID];
  [(APAttributionRequest *)self setAnonymousDemandId:v4];

  v5 = [v6 storefront];
  [(APAttributionRequest *)self setStorefront:v5];
}

- (void)addCapData:(id)a3
{
  id v6 = a3;
  -[APAttributionRequest setAttributionDownloadType:](self, "setAttributionDownloadType:", [v6 attributionDownloadType]);
  [v6 searchAdClickTimestamp];
  -[APAttributionRequest setSearchAdClickTimestamp:](self, "setSearchAdClickTimestamp:");
  -[APAttributionRequest setAttributionDownloadType:](self, "setAttributionDownloadType:", [v6 attributionDownloadType]);
  [v6 downloadClickTimestamp];
  -[APAttributionRequest setDownloadClickTimestamp:](self, "setDownloadClickTimestamp:");
  [v6 downloadClickTimestamp];
  if (v4 != 0.0) {
    [(APAttributionRequest *)self setAttributionMetadataExistsOnDevice:1];
  }
  v5 = [v6 adMetadata];
  [(APAttributionRequest *)self setAdMetadata:v5];
}

- (void)addMetaData:(id)a3
{
  id v15 = a3;
  -[APAttributionRequest setAttributionMetadataExistsOnDevice:](self, "setAttributionMetadataExistsOnDevice:", [v15 isAttributed]);
  double v4 = +[NSISO8601DateFormatter apDefaultSharedFormatter];
  v5 = [v15 purchaseDate];
  [(APAttributionRequest *)self setPurchaseTimestamp:v5];

  id v6 = [v15 impressionDate];
  v7 = [v4 dateFromString:v6];
  [v7 timeIntervalSince1970];
  double v9 = v8;

  if (v9 > 0.0) {
    [(APAttributionRequest *)self setIAdImpressionTimestamp:v9];
  }
  v10 = [v15 conversionDate];
  v11 = [v4 dateFromString:v10];
  [v11 timeIntervalSince1970];
  double v13 = v12;

  if (v13 > 0.0) {
    [(APAttributionRequest *)self setIAdConversionTimestamp:v13];
  }
  v14 = [v15 adamID];
  [(APAttributionRequest *)self setAdamId:v14];
}

- (id)requestHeader
{
  uint64_t v3 = [(APAttributionRequest *)self timestamp];
  if (!v3) {
    goto LABEL_19;
  }
  double v4 = (void *)v3;
  uint64_t v5 = [(APAttributionRequest *)self osBuild];
  if (!v5) {
    goto LABEL_18;
  }
  id v6 = (void *)v5;
  uint64_t v7 = [(APAttributionRequest *)self osPlatform];
  if (!v7)
  {
LABEL_17:

LABEL_18:
LABEL_19:
    id v22 = 0;
    goto LABEL_20;
  }
  double v8 = (void *)v7;
  uint64_t v9 = [(APAttributionRequest *)self osVersion];
  if (!v9)
  {
LABEL_16:

    goto LABEL_17;
  }
  v10 = (void *)v9;
  uint64_t v11 = [(APAttributionRequest *)self storefront];
  if (!v11)
  {
LABEL_15:

    goto LABEL_16;
  }
  double v12 = (void *)v11;
  uint64_t v13 = [(APAttributionRequest *)self daemonBundleId];
  if (!v13)
  {
LABEL_14:

    goto LABEL_15;
  }
  v14 = (void *)v13;
  uint64_t v15 = [(APAttributionRequest *)self userAgent];
  if (!v15)
  {

    goto LABEL_14;
  }
  v16 = (void *)v15;
  v17 = [(APAttributionRequest *)self mescalSignature];
  if (v17
    || ([(APAttributionRequest *)self fpdiSignature],
        (v37 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v18 = [(APAttributionRequest *)self mescalSignature];
    if (v18)
    {
      v19 = (void *)v18;
      v20 = [(APAttributionRequest *)self fpdiSignature];
      BOOL v38 = v20 != 0;

      char v21 = v38;
      if (v17) {
        goto LABEL_28;
      }
    }
    else
    {
      if (v17)
      {

        goto LABEL_29;
      }
      char v21 = 0;
    }
  }
  else
  {
    char v21 = 1;
  }
LABEL_28:

  if (v21) {
    goto LABEL_19;
  }
LABEL_29:
  v39[0] = @"timestamp";
  v24 = [(APAttributionRequest *)self timestamp];
  v40[0] = v24;
  v39[1] = @"osPlatform";
  v25 = [(APAttributionRequest *)self osPlatform];
  v40[1] = v25;
  v39[2] = @"osVersion";
  v26 = [(APAttributionRequest *)self osVersion];
  v40[2] = v26;
  v39[3] = @"osBuild";
  v27 = [(APAttributionRequest *)self osBuild];
  v40[3] = v27;
  v39[4] = @"storefront";
  v28 = [(APAttributionRequest *)self storefront];
  v40[4] = v28;
  v39[5] = @"bundleId";
  v29 = [(APAttributionRequest *)self daemonBundleId];
  v40[5] = v29;
  v39[6] = @"User-Agent";
  v30 = [(APAttributionRequest *)self userAgent];
  v40[6] = v30;
  v31 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:7];
  v32 = +[NSMutableDictionary dictionaryWithDictionary:v31];

  v33 = [(APAttributionRequest *)self mescalSignature];

  if (v33)
  {
    v34 = [(APAttributionRequest *)self mescalSignature];
    CFStringRef v35 = @"X-Apple-ActionSignature";
LABEL_33:
    [v32 setObject:v34 forKey:v35];

    goto LABEL_34;
  }
  v36 = [(APAttributionRequest *)self fpdiSignature];

  if (v36)
  {
    v34 = [(APAttributionRequest *)self fpdiSignature];
    CFStringRef v35 = @"X-Apple-ActionSignature2";
    goto LABEL_33;
  }
LABEL_34:
  id v22 = [v32 copy];

LABEL_20:

  return v22;
}

- (NSDictionary)payloadForRequestHeaderABCLog
{
  v32[0] = @"timestamp";
  uint64_t v3 = [(APAttributionRequest *)self timestamp];
  v31 = (void *)v3;
  if (v3) {
    CFStringRef v4 = (const __CFString *)v3;
  }
  else {
    CFStringRef v4 = @"ERROR This property is nil";
  }
  v33[0] = v4;
  v32[1] = @"osPlatform";
  uint64_t v5 = [(APAttributionRequest *)self osPlatform];
  id v6 = (void *)v5;
  if (v5) {
    CFStringRef v7 = (const __CFString *)v5;
  }
  else {
    CFStringRef v7 = @"ERROR This property is nil";
  }
  v33[1] = v7;
  v32[2] = @"osVersion";
  uint64_t v8 = [(APAttributionRequest *)self osVersion];
  uint64_t v9 = (void *)v8;
  if (v8) {
    CFStringRef v10 = (const __CFString *)v8;
  }
  else {
    CFStringRef v10 = @"ERROR This property is nil";
  }
  v33[2] = v10;
  v32[3] = @"osBuild";
  uint64_t v11 = [(APAttributionRequest *)self osBuild];
  double v12 = (void *)v11;
  if (v11) {
    CFStringRef v13 = (const __CFString *)v11;
  }
  else {
    CFStringRef v13 = @"ERROR This property is nil";
  }
  v33[3] = v13;
  v32[4] = @"storefront";
  uint64_t v14 = [(APAttributionRequest *)self storefront];
  uint64_t v15 = (void *)v14;
  if (v14) {
    CFStringRef v16 = (const __CFString *)v14;
  }
  else {
    CFStringRef v16 = @"ERROR This property is nil";
  }
  v33[4] = v16;
  v32[5] = @"bundleId";
  uint64_t v17 = [(APAttributionRequest *)self daemonBundleId];
  uint64_t v18 = (void *)v17;
  if (v17) {
    CFStringRef v19 = (const __CFString *)v17;
  }
  else {
    CFStringRef v19 = @"ERROR This property is nil";
  }
  v33[5] = v19;
  v32[6] = @"User-Agent";
  uint64_t v20 = [(APAttributionRequest *)self userAgent];
  char v21 = (void *)v20;
  if (v20) {
    CFStringRef v22 = (const __CFString *)v20;
  }
  else {
    CFStringRef v22 = @"ERROR This property is nil";
  }
  v33[6] = v22;
  v32[7] = @"X-Apple-ActionSignature";
  uint64_t v23 = [(APAttributionRequest *)self mescalSignature];
  v24 = (void *)v23;
  if (v23) {
    CFStringRef v25 = (const __CFString *)v23;
  }
  else {
    CFStringRef v25 = @"This property is nil";
  }
  v33[7] = v25;
  v32[8] = @"X-Apple-ActionSignature2";
  uint64_t v26 = [(APAttributionRequest *)self fpdiSignature];
  v27 = (void *)v26;
  if (v26) {
    CFStringRef v28 = (const __CFString *)v26;
  }
  else {
    CFStringRef v28 = @"This property is nil";
  }
  v33[8] = v28;
  v29 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:9];

  return (NSDictionary *)v29;
}

- (id)requestBody
{
  uint64_t v3 = +[NSMutableDictionary dictionary];
  uint64_t v4 = [(APAttributionRequest *)self toroId];
  if (!v4) {
    goto LABEL_22;
  }
  uint64_t v5 = (void *)v4;
  uint64_t v6 = [(APAttributionRequest *)self anonymousDemandId];
  if (v6)
  {
    CFStringRef v7 = (void *)v6;
    uint64_t v8 = [(APAttributionRequest *)self bundleId];
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      CFStringRef v10 = [(APAttributionRequest *)self attributionKey];

      if (v10)
      {
        uint64_t v5 = +[NSISO8601DateFormatter apDefaultSharedFormatter];
        uint64_t v11 = [(APAttributionRequest *)self toroId];
        double v12 = [v11 UUIDString];
        [v3 setObject:v12 forKey:@"toroId"];

        CFStringRef v13 = [(APAttributionRequest *)self anonymousDemandId];
        uint64_t v14 = [v13 UUIDString];
        [v3 setObject:v14 forKey:@"anonymousDemandId"];

        uint64_t v15 = [(APAttributionRequest *)self bundleId];
        [v3 setObject:v15 forKey:@"bundleId"];

        CFStringRef v16 = [(APAttributionRequest *)self attributionKey];
        [v3 setObject:v16 forKey:@"attributionKey"];

        uint64_t v17 = +[NSNumber numberWithBool:[(APAttributionRequest *)self attributionMetadataExistsOnDevice]];
        [v3 setObject:v17 forKey:@"attributionMetadataExistsOnDevice"];

        uint64_t v18 = +[NSNumber numberWithInteger:[(APAttributionRequest *)self attributionDownloadType]];
        [v3 setObject:v18 forKey:@"attributionDownloadType"];

        CFStringRef v19 = +[NSNumber numberWithBool:[(APAttributionRequest *)self developmentApp]];
        [v3 setObject:v19 forKey:@"developmentApp"];

        uint64_t v20 = [(APAttributionRequest *)self purchaseTimestamp];

        if (v20)
        {
          char v21 = [(APAttributionRequest *)self purchaseTimestamp];
          [v3 setObject:v21 forKey:@"purchaseTimestamp"];
        }
        CFStringRef v22 = [(APAttributionRequest *)self adamId];

        if (v22)
        {
          uint64_t v23 = [(APAttributionRequest *)self adamId];
          [v3 setObject:v23 forKey:@"adamId"];
        }
        v24 = [(APAttributionRequest *)self adMetadata];

        if (v24)
        {
          CFStringRef v25 = [(APAttributionRequest *)self adMetadata];
          [v3 setObject:v25 forKey:@"adMetadata"];
        }
        [(APAttributionRequest *)self iAdConversionTimestamp];
        if (v26 > 0.0)
        {
          [(APAttributionRequest *)self iAdConversionTimestamp];
          v27 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
          CFStringRef v28 = [v5 stringFromDate:v27];
          [v3 setObject:v28 forKey:@"iAdConversionTimestamp"];
        }
        [(APAttributionRequest *)self iAdImpressionTimestamp];
        if (v29 > 0.0)
        {
          [(APAttributionRequest *)self iAdImpressionTimestamp];
          v30 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
          v31 = [v5 stringFromDate:v30];
          [v3 setObject:v31 forKey:@"iAdImpressionTimestamp"];
        }
        [(APAttributionRequest *)self searchAdClickTimestamp];
        if (v32 > 0.0)
        {
          [(APAttributionRequest *)self searchAdClickTimestamp];
          v33 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
          v34 = [v5 stringFromDate:v33];
          [v3 setObject:v34 forKey:@"searchAdClickTimestamp"];
        }
        [(APAttributionRequest *)self downloadClickTimestamp];
        if (v35 > 0.0)
        {
          [(APAttributionRequest *)self downloadClickTimestamp];
          v36 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
          v37 = [v5 stringFromDate:v36];
          [v3 setObject:v37 forKey:@"downloadClickTimestamp"];
        }
        if ([(APAttributionRequest *)self developmentApp]) {
          [v3 setObject:@"2020-10-17T05:08:49Z" forKey:@"purchaseTimestamp"];
        }
        id v38 = v3;
        goto LABEL_25;
      }
LABEL_22:
      id v38 = 0;
      goto LABEL_26;
    }
  }
  id v38 = 0;
LABEL_25:

LABEL_26:

  return v38;
}

- (NSDictionary)payloadForRequestBodyABCLog
{
  v17[0] = @"toroId";
  uint64_t v3 = [(APAttributionRequest *)self toroId];
  uint64_t v4 = (void *)v3;
  if (v3) {
    CFStringRef v5 = (const __CFString *)v3;
  }
  else {
    CFStringRef v5 = @"ERROR This property is nil";
  }
  v18[0] = v5;
  v17[1] = @"anonymousDemandId";
  uint64_t v6 = [(APAttributionRequest *)self anonymousDemandId];
  CFStringRef v7 = (void *)v6;
  if (v6) {
    CFStringRef v8 = (const __CFString *)v6;
  }
  else {
    CFStringRef v8 = @"ERROR This property is nil";
  }
  v18[1] = v8;
  v17[2] = @"osPlatform";
  uint64_t v9 = [(APAttributionRequest *)self bundleId];
  CFStringRef v10 = (void *)v9;
  if (v9) {
    CFStringRef v11 = (const __CFString *)v9;
  }
  else {
    CFStringRef v11 = @"ERROR This property is nil";
  }
  v18[2] = v11;
  v17[3] = @"osVersion";
  uint64_t v12 = [(APAttributionRequest *)self attributionKey];
  CFStringRef v13 = (void *)v12;
  if (v12) {
    CFStringRef v14 = (const __CFString *)v12;
  }
  else {
    CFStringRef v14 = @"ERROR This property is nil";
  }
  v18[3] = v14;
  uint64_t v15 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];

  return (NSDictionary *)v15;
}

- (NSString)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (void)setOsVersion:(id)a3
{
}

- (NSString)osPlatform
{
  return self->_osPlatform;
}

- (void)setOsPlatform:(id)a3
{
}

- (NSString)osBuild
{
  return self->_osBuild;
}

- (void)setOsBuild:(id)a3
{
}

- (NSString)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSString)daemonBundleId
{
  return self->_daemonBundleId;
}

- (void)setDaemonBundleId:(id)a3
{
}

- (NSString)storefront
{
  return self->_storefront;
}

- (void)setStorefront:(id)a3
{
}

- (NSString)mescalSignature
{
  return self->_mescalSignature;
}

- (void)setMescalSignature:(id)a3
{
}

- (NSString)fpdiSignature
{
  return self->_fpdiSignature;
}

- (void)setFpdiSignature:(id)a3
{
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
}

- (NSUUID)toroId
{
  return self->_toroId;
}

- (void)setToroId:(id)a3
{
}

- (NSUUID)anonymousDemandId
{
  return self->_anonymousDemandId;
}

- (void)setAnonymousDemandId:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)attributionKey
{
  return self->_attributionKey;
}

- (void)setAttributionKey:(id)a3
{
}

- (BOOL)attributionMetadataExistsOnDevice
{
  return self->_attributionMetadataExistsOnDevice;
}

- (void)setAttributionMetadataExistsOnDevice:(BOOL)a3
{
  self->_attributionMetadataExistsOnDevice = a3;
}

- (NSString)purchaseTimestamp
{
  return self->_purchaseTimestamp;
}

- (void)setPurchaseTimestamp:(id)a3
{
}

- (int64_t)attributionDownloadType
{
  return self->_attributionDownloadType;
}

- (void)setAttributionDownloadType:(int64_t)a3
{
  self->_attributionDownloadType = a3;
}

- (NSNumber)adamId
{
  return self->adamId;
}

- (void)setAdamId:(id)a3
{
}

- (NSString)adMetadata
{
  return self->adMetadata;
}

- (void)setAdMetadata:(id)a3
{
}

- (double)downloadClickTimestamp
{
  return self->_downloadClickTimestamp;
}

- (void)setDownloadClickTimestamp:(double)a3
{
  self->_downloadClickTimestamp = a3;
}

- (double)searchAdClickTimestamp
{
  return self->_searchAdClickTimestamp;
}

- (void)setSearchAdClickTimestamp:(double)a3
{
  self->_searchAdClickTimestamp = a3;
}

- (double)iAdConversionTimestamp
{
  return self->_iAdConversionTimestamp;
}

- (void)setIAdConversionTimestamp:(double)a3
{
  self->_iAdConversionTimestamp = a3;
}

- (double)iAdImpressionTimestamp
{
  return self->_iAdImpressionTimestamp;
}

- (void)setIAdImpressionTimestamp:(double)a3
{
  self->_iAdImpressionTimestamp = a3;
}

- (BOOL)developmentApp
{
  return self->_developmentApp;
}

- (void)setDevelopmentApp:(BOOL)a3
{
  self->_developmentApp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->adMetadata, 0);
  objc_storeStrong((id *)&self->adamId, 0);
  objc_storeStrong((id *)&self->_purchaseTimestamp, 0);
  objc_storeStrong((id *)&self->_attributionKey, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_anonymousDemandId, 0);
  objc_storeStrong((id *)&self->_toroId, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_fpdiSignature, 0);
  objc_storeStrong((id *)&self->_mescalSignature, 0);
  objc_storeStrong((id *)&self->_storefront, 0);
  objc_storeStrong((id *)&self->_daemonBundleId, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_osBuild, 0);
  objc_storeStrong((id *)&self->_osPlatform, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end