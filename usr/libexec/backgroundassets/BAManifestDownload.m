@interface BAManifestDownload
+ (BOOL)supportsSecureCoding;
- (BAManifestDownload)init;
- (BAManifestDownload)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BAManifestDownload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BAManifestDownload)init
{
  return 0;
}

- (BAManifestDownload)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BAManifestDownload;
  v5 = [(BAURLDownload *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_applicationEvent = (int64_t)[v4 decodeIntegerForKey:@"applicationEvent"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  if (self) {
    int64_t applicationEvent = self->_applicationEvent;
  }
  else {
    int64_t applicationEvent = 0;
  }
  id v5 = a3;
  [v5 encodeInteger:applicationEvent forKey:@"applicationEvent"];
  v6.receiver = self;
  v6.super_class = (Class)BAManifestDownload;
  [(BAURLDownload *)&v6 encodeWithCoder:v5];
}

- (id)debugDescription
{
  v5.receiver = self;
  v5.super_class = (Class)BAManifestDownload;
  v2 = [(BAURLDownload *)&v5 debugDescription];
  id v3 = [v2 mutableCopy];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BAManifestDownload;
  id result = [(BAURLDownload *)&v6 copyWithZone:a3];
  if (self) {
    int64_t applicationEvent = self->_applicationEvent;
  }
  else {
    int64_t applicationEvent = 0;
  }
  *((void *)result + 24) = applicationEvent;
  return result;
}

@end