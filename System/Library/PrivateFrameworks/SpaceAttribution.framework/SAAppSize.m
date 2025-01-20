@interface SAAppSize
+ (BOOL)supportsSecureCoding;
+ (id)newWithFixedSize:(unint64_t)a3 andDataSize:(unint64_t)a4;
+ (id)newWithFixedSize:(unint64_t)a3 dataSize:(unint64_t)a4 cloneSize:(unint64_t)a5 purgeableSize:(unint64_t)a6 FSPurgeableSize:(unint64_t)a7 physicalSize:(unint64_t)a8 appCacheSize:(unint64_t)a9 CDPluginSize:(unint64_t)a10;
- (NSString)vendorName;
- (SAAppSize)init;
- (SAAppSize)initWithCoder:(id)a3;
- (SAAppSize)initWithFixedSize:(unint64_t)a3 dataSize:(unint64_t)a4 cloneSize:(unint64_t)a5 purgeableSize:(unint64_t)a6 FSPurgeableSize:(unint64_t)a7 physicalSize:(unint64_t)a8 appCacheSize:(unint64_t)a9 CDPluginSize:(unint64_t)a10;
- (id)copy;
- (id)description;
- (unint64_t)FSPurgeableSize;
- (unint64_t)appCacheSize;
- (unint64_t)cacheDeletePluginSize;
- (unint64_t)cloneSize;
- (unint64_t)dataSize;
- (unint64_t)fixedSize;
- (unint64_t)physicalSize;
- (unint64_t)purgeableSize;
- (void)encodeWithCoder:(id)a3;
- (void)setAppCacheSize:(unint64_t)a3;
- (void)setCacheDeletePluginSize:(unint64_t)a3;
- (void)setCloneSize:(unint64_t)a3;
- (void)setDataSize:(unint64_t)a3;
- (void)setFSPurgeableSize:(unint64_t)a3;
- (void)setFixedSize:(unint64_t)a3;
- (void)setPhysicalSize:(unint64_t)a3;
- (void)setPurgeableSize:(unint64_t)a3;
- (void)setVendorName:(id)a3;
@end

@implementation SAAppSize

- (SAAppSize)init
{
  v3.receiver = self;
  v3.super_class = (Class)SAAppSize;
  result = [(SAAppSize *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_purgeableSize = 0u;
    *(_OWORD *)&result->_fixedSize = 0u;
    *(_OWORD *)&result->_physicalSize = 0u;
    *(_OWORD *)&result->_appCacheSize = 0u;
  }
  return result;
}

- (SAAppSize)initWithFixedSize:(unint64_t)a3 dataSize:(unint64_t)a4 cloneSize:(unint64_t)a5 purgeableSize:(unint64_t)a6 FSPurgeableSize:(unint64_t)a7 physicalSize:(unint64_t)a8 appCacheSize:(unint64_t)a9 CDPluginSize:(unint64_t)a10
{
  v17.receiver = self;
  v17.super_class = (Class)SAAppSize;
  result = [(SAAppSize *)&v17 init];
  if (result)
  {
    result->_fixedSize = a3;
    result->_dataSize = a4;
    result->_purgeableSize = a6;
    result->_cloneSize = a5;
    result->_physicalSize = a8;
    result->_FSPurgeableSize = a7;
    result->_appCacheSize = a9;
    result->_cacheDeletePluginSize = a10;
  }
  return result;
}

+ (id)newWithFixedSize:(unint64_t)a3 andDataSize:(unint64_t)a4
{
  return [[SAAppSize alloc] initWithFixedSize:a3 dataSize:a4 cloneSize:0 purgeableSize:0 FSPurgeableSize:0 physicalSize:0 appCacheSize:0 CDPluginSize:0];
}

+ (id)newWithFixedSize:(unint64_t)a3 dataSize:(unint64_t)a4 cloneSize:(unint64_t)a5 purgeableSize:(unint64_t)a6 FSPurgeableSize:(unint64_t)a7 physicalSize:(unint64_t)a8 appCacheSize:(unint64_t)a9 CDPluginSize:(unint64_t)a10
{
  v16 = [SAAppSize alloc];
  return -[SAAppSize initWithFixedSize:dataSize:cloneSize:purgeableSize:FSPurgeableSize:physicalSize:appCacheSize:CDPluginSize:](v16, "initWithFixedSize:dataSize:cloneSize:purgeableSize:FSPurgeableSize:physicalSize:appCacheSize:CDPluginSize:", a3, a4, a5, a6, a7, a8);
}

- (id)copy
{
  objc_super v3 = objc_opt_new();
  [v3 setFixedSize:self->_fixedSize];
  [v3 setDataSize:self->_dataSize];
  [v3 setCloneSize:self->_cloneSize];
  [v3 setPurgeableSize:self->_purgeableSize];
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t fixedSize = self->_fixedSize;
  id v5 = a3;
  [v5 encodeInt64:fixedSize forKey:@"fixedSize"];
  [v5 encodeInt64:self->_dataSize forKey:@"dataSize"];
  [v5 encodeInt64:self->_purgeableSize forKey:@"purgeableSize"];
  [v5 encodeInt64:self->_cloneSize forKey:@"cloneSize"];
  [v5 encodeInt64:self->_physicalSize forKey:@"physicalSize"];
  [v5 encodeInt64:self->_FSPurgeableSize forKey:@"FSPurgeableSize"];
  [v5 encodeInt64:self->_cacheDeletePluginSize forKey:@"CDPluginSize"];
  [v5 encodeInt64:self->_appCacheSize forKey:@"appCacheSizeSize"];
  [v5 encodeObject:self->_vendorName forKey:@"vendorName"];
}

- (SAAppSize)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SAAppSize;
  id v5 = [(SAAppSize *)&v9 init];
  if (v5)
  {
    v5->_unint64_t fixedSize = [v4 decodeInt64ForKey:@"fixedSize"];
    v5->_dataSize = [v4 decodeInt64ForKey:@"dataSize"];
    v5->_purgeableSize = [v4 decodeInt64ForKey:@"purgeableSize"];
    v5->_cloneSize = [v4 decodeInt64ForKey:@"cloneSize"];
    v5->_physicalSize = [v4 decodeInt64ForKey:@"physicalSize"];
    v5->_FSPurgeableSize = [v4 decodeInt64ForKey:@"FSPurgeableSize"];
    v5->_cacheDeletePluginSize = [v4 decodeInt64ForKey:@"CDPluginSize"];
    v5->_appCacheSize = [v4 decodeInt64ForKey:@"appCacheSizeSize"];
    uint64_t v6 = [v4 decodeObjectForKey:@"vendorName"];
    vendorName = v5->_vendorName;
    v5->_vendorName = (NSString *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ unint64_t fixedSize = %llu, dataSize = %llu, cloneSize = %llu, purgeableSize = %llu>", objc_opt_class(), -[SAAppSize fixedSize](self, "fixedSize"), -[SAAppSize dataSize](self, "dataSize"), -[SAAppSize cloneSize](self, "cloneSize"), -[SAAppSize purgeableSize](self, "purgeableSize")];
}

- (unint64_t)fixedSize
{
  return self->_fixedSize;
}

- (void)setFixedSize:(unint64_t)a3
{
  self->_unint64_t fixedSize = a3;
}

- (unint64_t)dataSize
{
  return self->_dataSize;
}

- (void)setDataSize:(unint64_t)a3
{
  self->_dataSize = a3;
}

- (unint64_t)purgeableSize
{
  return self->_purgeableSize;
}

- (void)setPurgeableSize:(unint64_t)a3
{
  self->_purgeableSize = a3;
}

- (unint64_t)cloneSize
{
  return self->_cloneSize;
}

- (void)setCloneSize:(unint64_t)a3
{
  self->_cloneSize = a3;
}

- (NSString)vendorName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setVendorName:(id)a3
{
}

- (unint64_t)physicalSize
{
  return self->_physicalSize;
}

- (void)setPhysicalSize:(unint64_t)a3
{
  self->_physicalSize = a3;
}

- (unint64_t)FSPurgeableSize
{
  return self->_FSPurgeableSize;
}

- (void)setFSPurgeableSize:(unint64_t)a3
{
  self->_FSPurgeableSize = a3;
}

- (unint64_t)appCacheSize
{
  return self->_appCacheSize;
}

- (void)setAppCacheSize:(unint64_t)a3
{
  self->_appCacheSize = a3;
}

- (unint64_t)cacheDeletePluginSize
{
  return self->_cacheDeletePluginSize;
}

- (void)setCacheDeletePluginSize:(unint64_t)a3
{
  self->_cacheDeletePluginSize = a3;
}

- (void).cxx_destruct
{
}

@end