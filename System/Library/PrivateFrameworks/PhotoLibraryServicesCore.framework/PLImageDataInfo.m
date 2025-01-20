@interface PLImageDataInfo
- (BOOL)canDownloadFromCloud;
- (BOOL)deliveredPlaceholder;
- (NSString)UTI;
- (NSString)sandboxExtensionToken;
- (NSURL)URL;
- (id)description;
- (int64_t)EXIFOrientation;
- (int64_t)deliveredFormat;
- (void)setCanDownloadFromCloud:(BOOL)a3;
- (void)setDeliveredFormat:(int64_t)a3;
- (void)setDeliveredPlaceholder:(BOOL)a3;
- (void)setEXIFOrientation:(int64_t)a3;
- (void)setSandboxExtensionToken:(id)a3;
- (void)setURL:(id)a3;
- (void)setUTI:(id)a3;
@end

@implementation PLImageDataInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UTI, 0);
  objc_storeStrong((id *)&self->_sandboxExtensionToken, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

- (void)setEXIFOrientation:(int64_t)a3
{
  self->_EXIFOrientation = a3;
}

- (int64_t)EXIFOrientation
{
  return self->_EXIFOrientation;
}

- (void)setUTI:(id)a3
{
}

- (NSString)UTI
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSandboxExtensionToken:(id)a3
{
}

- (NSString)sandboxExtensionToken
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setURL:(id)a3
{
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCanDownloadFromCloud:(BOOL)a3
{
  self->_canDownloadFromCloud = a3;
}

- (BOOL)canDownloadFromCloud
{
  return self->_canDownloadFromCloud;
}

- (void)setDeliveredPlaceholder:(BOOL)a3
{
  self->_deliveredPlaceholder = a3;
}

- (BOOL)deliveredPlaceholder
{
  return self->_deliveredPlaceholder;
}

- (void)setDeliveredFormat:(int64_t)a3
{
  self->_deliveredFormat = a3;
}

- (int64_t)deliveredFormat
{
  return self->_deliveredFormat;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)PLImageDataInfo;
  v3 = [(PLImageDataInfo *)&v8 description];
  v4 = v3;
  v5 = @"YES";
  if (!self->_deliveredPlaceholder) {
    v5 = @"NO";
  }
  v6 = [v3 stringByAppendingFormat:@" - deliveredFormat: %ld, deliveredPlaceholder: %@, URL: %@, UTI: %@", self->_deliveredFormat, v5, self->_URL, self->_UTI];

  return v6;
}

@end