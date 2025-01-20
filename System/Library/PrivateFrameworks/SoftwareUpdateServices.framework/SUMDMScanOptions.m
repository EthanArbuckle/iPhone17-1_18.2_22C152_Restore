@interface SUMDMScanOptions
+ (BOOL)supportsSecureCoding;
- (NSString)requestedBuildVersion;
- (NSString)requestedProductMarketingVersion;
- (SUMDMScanOptions)init;
- (SUMDMScanOptions)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)allowSplat;
- (int64_t)useDelayPeriod;
- (unint64_t)MDMSoftwareUpdatePath;
- (unint64_t)delayPeriodSeconds;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowSplat:(int64_t)a3;
- (void)setDelayPeriodSeconds:(unint64_t)a3;
- (void)setMDMSoftwareUpdatePath:(unint64_t)a3;
- (void)setRequestedBuildVersion:(id)a3;
- (void)setRequestedProductMarketingVersion:(id)a3;
- (void)setUseDelayPeriod:(int64_t)a3;
@end

@implementation SUMDMScanOptions

- (SUMDMScanOptions)init
{
  v7.receiver = self;
  v7.super_class = (Class)SUMDMScanOptions;
  v2 = [(SUOptionsBase *)&v7 init];
  v3 = v2;
  if (v2)
  {
    requestedProductMarketingVersion = v2->_requestedProductMarketingVersion;
    v2->_requestedProductMarketingVersion = 0;

    requestedBuildVersion = v3->_requestedBuildVersion;
    v3->_requestedBuildVersion = 0;

    v3->_useDelayPeriod = 2;
    v3->_delayPeriodSeconds = 0;
    v3->_MDMSoftwareUpdatePath = 3;
    v3->_allowSplat = 2;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUMDMScanOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUMDMScanOptions;
  v5 = [(SUOptionsBase *)&v9 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RequestedProductMarketingVersion"];
    [(SUMDMScanOptions *)v5 setRequestedProductMarketingVersion:v6];

    objc_super v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RequestedBuildVersion"];
    [(SUMDMScanOptions *)v5 setRequestedBuildVersion:v7];

    -[SUMDMScanOptions setUseDelayPeriod:](v5, "setUseDelayPeriod:", [v4 decodeInt64ForKey:@"UseDelayPeriod"]);
    -[SUMDMScanOptions setDelayPeriodSeconds:](v5, "setDelayPeriodSeconds:", [v4 decodeInt64ForKey:@"DelayPeriodSeconds"]);
    -[SUMDMScanOptions setMDMSoftwareUpdatePath:](v5, "setMDMSoftwareUpdatePath:", [v4 decodeInt64ForKey:@"MDMSoftwareUpdatePath"]);
    -[SUMDMScanOptions setAllowSplat:](v5, "setAllowSplat:", [v4 decodeInt64ForKey:@"AllowSplat"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  requestedProductMarketingVersion = self->_requestedProductMarketingVersion;
  id v5 = a3;
  [v5 encodeObject:requestedProductMarketingVersion forKey:@"RequestedProductMarketingVersion"];
  [v5 encodeObject:self->_requestedBuildVersion forKey:@"RequestedBuildVersion"];
  [v5 encodeInt64:self->_useDelayPeriod forKey:@"UseDelayPeriod"];
  [v5 encodeInt64:self->_delayPeriodSeconds forKey:@"DelayPeriodSeconds"];
  [v5 encodeInt64:self->_MDMSoftwareUpdatePath forKey:@"MDMSoftwareUpdatePath"];
  [v5 encodeInt64:self->_allowSplat forKey:@"AllowSplat"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setRequestedProductMarketingVersion:self->_requestedProductMarketingVersion];
  [v4 setRequestedBuildVersion:self->_requestedBuildVersion];
  [v4 setUseDelayPeriod:self->_useDelayPeriod];
  [v4 setDelayPeriodSeconds:self->_delayPeriodSeconds];
  [v4 setMDMSoftwareUpdatePath:self->_MDMSoftwareUpdatePath];
  [v4 setAllowSplat:self->_allowSplat];
  return v4;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SUMDMScanOptions *)self requestedProductMarketingVersion];
  id v5 = [(SUMDMScanOptions *)self requestedBuildVersion];
  v6 = objc_msgSend(MEMORY[0x263F77D80], "stringFromTriState:", -[SUMDMScanOptions useDelayPeriod](self, "useDelayPeriod"));
  unint64_t v7 = [(SUMDMScanOptions *)self delayPeriodSeconds];
  v8 = SUStringFromMDMSUPath([(SUMDMScanOptions *)self MDMSoftwareUpdatePath]);
  objc_super v9 = objc_msgSend(MEMORY[0x263F77D80], "stringFromTriState:", -[SUMDMScanOptions allowSplat](self, "allowSplat"));
  v10 = [v3 stringWithFormat:@"\n            RequestedProductMarketingVersion: %@\n            RequestedBuildVersion: %@\n            UseDelayPeriod: %@\n            DelayPeriodSeconds: %lu\n            MDMSoftwareUpdatePath: %@\n            AllowSplat: %@", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (NSString)requestedProductMarketingVersion
{
  return self->_requestedProductMarketingVersion;
}

- (void)setRequestedProductMarketingVersion:(id)a3
{
}

- (NSString)requestedBuildVersion
{
  return self->_requestedBuildVersion;
}

- (void)setRequestedBuildVersion:(id)a3
{
}

- (int64_t)useDelayPeriod
{
  return self->_useDelayPeriod;
}

- (void)setUseDelayPeriod:(int64_t)a3
{
  self->_useDelayPeriod = a3;
}

- (unint64_t)delayPeriodSeconds
{
  return self->_delayPeriodSeconds;
}

- (void)setDelayPeriodSeconds:(unint64_t)a3
{
  self->_delayPeriodSeconds = a3;
}

- (unint64_t)MDMSoftwareUpdatePath
{
  return self->_MDMSoftwareUpdatePath;
}

- (void)setMDMSoftwareUpdatePath:(unint64_t)a3
{
  self->_MDMSoftwareUpdatePath = a3;
}

- (int64_t)allowSplat
{
  return self->_allowSplat;
}

- (void)setAllowSplat:(int64_t)a3
{
  self->_allowSplat = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedBuildVersion, 0);
  objc_storeStrong((id *)&self->_requestedProductMarketingVersion, 0);
}

@end