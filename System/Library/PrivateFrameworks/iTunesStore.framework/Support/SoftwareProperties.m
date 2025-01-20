@interface SoftwareProperties
- (BOOL)isFromStore;
- (NSData)appReceiptData;
- (NSData)artworkData;
- (NSData)newsstandArtworkData;
- (NSData)sinfData;
- (NSData)transitMapData;
- (NSDictionary)ITunesMetadata;
- (NSNumber)installType;
- (NSString)bundleIdentifier;
- (NSString)bundleVersion;
- (NSString)packagePath;
- (NSString)scratchDirectory;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)downloadIdentifier;
- (void)dealloc;
- (void)setAppReceiptData:(id)a3;
- (void)setArtworkData:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setDownloadIdentifier:(int64_t)a3;
- (void)setITunesMetadata:(id)a3;
- (void)setInstallType:(id)a3;
- (void)setIsFromStore:(BOOL)a3;
- (void)setNewsstandArtworkData:(id)a3;
- (void)setPackagePath:(id)a3;
- (void)setScratchDirectory:(id)a3;
- (void)setSinfData:(id)a3;
- (void)setTransitMapData:(id)a3;
@end

@implementation SoftwareProperties

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SoftwareProperties;
  [(SoftwareProperties *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = [(NSData *)self->_appReceiptData copyWithZone:a3];
  v5[2] = [(NSData *)self->_artworkData copyWithZone:a3];
  v5[3] = [(NSString *)self->_bundleIdentifier copyWithZone:a3];
  v5[4] = [(NSString *)self->_bundleVersion copyWithZone:a3];
  v5[12] = self->_downloadIdentifier;
  v5[5] = [(NSNumber *)self->_installType copyWithZone:a3];
  *((unsigned char *)v5 + 48) = self->_isFromStore;
  v5[7] = [(NSDictionary *)self->_iTunesMetadata copyWithZone:a3];
  v5[8] = [(NSData *)self->_newsstandArtworkData copyWithZone:a3];
  v5[9] = [(NSString *)self->_packagePath copyWithZone:a3];
  v5[10] = [(NSData *)self->_sinfData copyWithZone:a3];
  v5[11] = [(NSData *)self->_transitMapData copyWithZone:a3];
  return v5;
}

- (NSData)appReceiptData
{
  return self->_appReceiptData;
}

- (void)setAppReceiptData:(id)a3
{
}

- (NSData)artworkData
{
  return self->_artworkData;
}

- (void)setArtworkData:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
}

- (NSNumber)installType
{
  return self->_installType;
}

- (void)setInstallType:(id)a3
{
}

- (BOOL)isFromStore
{
  return self->_isFromStore;
}

- (void)setIsFromStore:(BOOL)a3
{
  self->_isFromStore = a3;
}

- (NSDictionary)ITunesMetadata
{
  return self->_iTunesMetadata;
}

- (void)setITunesMetadata:(id)a3
{
}

- (NSData)newsstandArtworkData
{
  return self->_newsstandArtworkData;
}

- (void)setNewsstandArtworkData:(id)a3
{
}

- (NSString)packagePath
{
  return self->_packagePath;
}

- (void)setPackagePath:(id)a3
{
}

- (NSData)sinfData
{
  return self->_sinfData;
}

- (void)setSinfData:(id)a3
{
}

- (NSData)transitMapData
{
  return self->_transitMapData;
}

- (void)setTransitMapData:(id)a3
{
}

- (int64_t)downloadIdentifier
{
  return self->_downloadIdentifier;
}

- (void)setDownloadIdentifier:(int64_t)a3
{
  self->_downloadIdentifier = a3;
}

- (NSString)scratchDirectory
{
  return self->_scratchDirectory;
}

- (void)setScratchDirectory:(id)a3
{
}

@end