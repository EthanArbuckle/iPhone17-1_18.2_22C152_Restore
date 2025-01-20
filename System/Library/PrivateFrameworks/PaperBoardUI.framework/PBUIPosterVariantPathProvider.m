@interface PBUIPosterVariantPathProvider
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPosterVariantPathProvider:(id)a3;
- (NSURL)instanceURL;
- (NSURL)snapshotColorStatisticsURL;
- (NSURL)snapshotMetadataURL;
- (NSURL)snapshotURL;
- (PBUIPosterVariantPathProvider)initWithInstanceURL:(id)a3 variant:(int64_t)a4;
- (id)snapshotContentDirectory;
- (int64_t)variant;
@end

@implementation PBUIPosterVariantPathProvider

- (PBUIPosterVariantPathProvider)initWithInstanceURL:(id)a3 variant:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PBUIPosterVariantPathProvider;
  v8 = [(PBUIPosterVariantPathProvider *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_instanceURL, a3);
    v9->_variant = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PBUIPosterVariantPathProvider *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PBUIPosterVariantPathProvider *)self isEqualToPosterVariantPathProvider:v5];

  return v6;
}

- (BOOL)isEqualToPosterVariantPathProvider:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && (uint64_t v6 = [v4 variant], v6 == -[PBUIPosterVariantPathProvider variant](self, "variant")))
  {
    id v7 = [(PBUIPosterVariantPathProvider *)self snapshotContentDirectory];
    v8 = [v5 snapshotContentDirectory];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)snapshotContentDirectory
{
  return self->_instanceURL;
}

- (NSURL)snapshotURL
{
  v3 = +[PBUIPosterVariantViewController snapshotFormat];
  id v4 = [v3 filenameExtension];

  v5 = [(PBUIPosterVariantPathProvider *)self snapshotContentDirectory];
  uint64_t v6 = NSString;
  id v7 = PBUIStringForWallpaperVariant([(PBUIPosterVariantPathProvider *)self variant]);
  v8 = [v6 stringWithFormat:@"RuntimeSnapshot-%@", v7];
  char v9 = [v5 URLByAppendingPathComponent:v8 isDirectory:0];
  v10 = [v9 URLByAppendingPathExtension:v4];

  return (NSURL *)v10;
}

- (NSURL)snapshotMetadataURL
{
  v3 = [(PBUIPosterVariantPathProvider *)self snapshotContentDirectory];
  id v4 = NSString;
  v5 = PBUIStringForWallpaperVariant([(PBUIPosterVariantPathProvider *)self variant]);
  uint64_t v6 = [v4 stringWithFormat:@"RuntimeSnapshotMetadata-%@", v5];
  id v7 = [v3 URLByAppendingPathComponent:v6 conformingToType:*MEMORY[0x1E4F44488]];

  return (NSURL *)v7;
}

- (NSURL)snapshotColorStatisticsURL
{
  v3 = [(PBUIPosterVariantPathProvider *)self snapshotContentDirectory];
  id v4 = NSString;
  v5 = PBUIStringForWallpaperVariant([(PBUIPosterVariantPathProvider *)self variant]);
  uint64_t v6 = [v4 stringWithFormat:@"RuntimeSnapshotColorStatisticsMetadata-%@", v5];
  id v7 = [v3 URLByAppendingPathComponent:v6 conformingToType:*MEMORY[0x1E4F44488]];

  return (NSURL *)v7;
}

- (NSURL)instanceURL
{
  return self->_instanceURL;
}

- (int64_t)variant
{
  return self->_variant;
}

- (void).cxx_destruct
{
}

@end