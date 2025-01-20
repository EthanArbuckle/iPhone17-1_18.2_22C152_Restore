@interface NFSignatureInfo
+ (BOOL)supportsSecureCoding;
- (NFSignatureInfo)initWithCoder:(id)a3;
- (NFSignatureInfo)initWithDictionary:(id)a3;
- (NSString)eccCert;
- (NSString)eckaCert;
- (NSString)jsblCounter;
- (NSString)platformId;
- (NSString)rsaCert;
- (NSString)seid;
- (id)description;
- (unint64_t)certificateVersion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NFSignatureInfo

- (NFSignatureInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NFSignatureInfo;
  v5 = [(NFSignatureInfo *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"rsa"];
    rsaCert = v5->_rsaCert;
    v5->_rsaCert = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"ecc"];
    eccCert = v5->_eccCert;
    v5->_eccCert = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"ecka"];
    eckaCert = v5->_eckaCert;
    v5->_eckaCert = (NSString *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"seid"];
    seid = v5->_seid;
    v5->_seid = (NSString *)v12;

    uint64_t v14 = [v4 objectForKeyedSubscript:@"platformid"];
    platformId = v5->_platformId;
    v5->_platformId = (NSString *)v14;

    uint64_t v16 = [v4 objectForKeyedSubscript:@"jsblCounter"];
    jsblCounter = v5->_jsblCounter;
    v5->_jsblCounter = (NSString *)v16;

    v18 = [v4 objectForKeyedSubscript:@"certVersion"];
    v5->_certificateVersion = (unint64_t)[v18 unsignedIntegerValue];
  }
  return v5;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  v11.receiver = self;
  v11.super_class = (Class)NFSignatureInfo;
  uint64_t v4 = [(NFSignatureInfo *)&v11 description];
  v5 = (void *)v4;
  CFStringRef jsblCounter = &stru_100309C40;
  CFStringRef seid = (const __CFString *)self->_seid;
  CFStringRef platformId = (const __CFString *)self->_platformId;
  if (!seid) {
    CFStringRef seid = &stru_100309C40;
  }
  if (!platformId) {
    CFStringRef platformId = &stru_100309C40;
  }
  if (self->_jsblCounter) {
    CFStringRef jsblCounter = (const __CFString *)self->_jsblCounter;
  }
  id v9 = [v3 initWithFormat:@"%@ { seid=%@ platformId=%@ jsblCounter=%@ certificateVersion=%lu }", v4, seid, platformId, jsblCounter, self->_certificateVersion];

  return v9;
}

- (NFSignatureInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NFSignatureInfo;
  v5 = [(NFSignatureInfo *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rsa"];
    rsaCert = v5->_rsaCert;
    v5->_rsaCert = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ecc"];
    eccCert = v5->_eccCert;
    v5->_eccCert = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ecka"];
    eckaCert = v5->_eckaCert;
    v5->_eckaCert = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"seid"];
    CFStringRef seid = v5->_seid;
    v5->_CFStringRef seid = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"platformid"];
    CFStringRef platformId = v5->_platformId;
    v5->_CFStringRef platformId = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"jsblCounter"];
    CFStringRef jsblCounter = v5->_jsblCounter;
    v5->_CFStringRef jsblCounter = (NSString *)v16;

    v5->_certificateVersion = (unint64_t)[v4 decodeIntegerForKey:@"certVersion"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  rsaCert = self->_rsaCert;
  id v5 = a3;
  [v5 encodeObject:rsaCert forKey:@"rsa"];
  [v5 encodeObject:self->_eccCert forKey:@"ecc"];
  [v5 encodeObject:self->_eckaCert forKey:@"ecka"];
  [v5 encodeObject:self->_seid forKey:@"seid"];
  [v5 encodeObject:self->_platformId forKey:@"platformid"];
  [v5 encodeObject:self->_jsblCounter forKey:@"jsblCounter"];
  [v5 encodeInteger:self->_certificateVersion forKey:@"certVersion"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)rsaCert
{
  return self->_rsaCert;
}

- (NSString)eccCert
{
  return self->_eccCert;
}

- (NSString)eckaCert
{
  return self->_eckaCert;
}

- (NSString)seid
{
  return self->_seid;
}

- (NSString)platformId
{
  return self->_platformId;
}

- (NSString)jsblCounter
{
  return self->_jsblCounter;
}

- (unint64_t)certificateVersion
{
  return self->_certificateVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsblCounter, 0);
  objc_storeStrong((id *)&self->_platformId, 0);
  objc_storeStrong((id *)&self->_seid, 0);
  objc_storeStrong((id *)&self->_eckaCert, 0);
  objc_storeStrong((id *)&self->_eccCert, 0);

  objc_storeStrong((id *)&self->_rsaCert, 0);
}

@end