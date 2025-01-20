@interface MSDOperationContext
+ (BOOL)downloadOnly;
+ (void)setDownloadOnly:(BOOL)a3;
- (BOOL)restored;
- (BOOL)skipped;
- (NSNumber)diskSpacedRequired;
- (NSString)identifier;
- (NSString)secondaryStagingRootPath;
- (NSString)stagingRootPath;
- (NSString)stashedStagingRootPath;
- (NSString)uniqueName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setDiskSpacedRequired:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setRestored:(BOOL)a3;
- (void)setSkipped:(BOOL)a3;
@end

@implementation MSDOperationContext

+ (BOOL)downloadOnly
{
  return byte_100189A20;
}

+ (void)setDownloadOnly:(BOOL)a3
{
  byte_100189A20 = a3;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(MSDOperationContext *)self uniqueName];
  v6 = +[NSString stringWithFormat:@"<%@[%p]: %@>", v4, self, v5];

  return v6;
}

- (NSString)uniqueName
{
  uniqueName = self->_uniqueName;
  if (!uniqueName)
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    v6 = [(MSDOperationContext *)self identifier];
    v7 = +[NSString stringWithFormat:@"%@.%@", v5, v6];
    v8 = self->_uniqueName;
    self->_uniqueName = v7;

    uniqueName = self->_uniqueName;
  }

  return uniqueName;
}

- (NSString)stagingRootPath
{
  if (!self->_stagingRootPath)
  {
    unsigned int v3 = +[MSDOperationContext downloadOnly];
    v4 = [(MSDOperationContext *)self uniqueName];
    if (v3) {
      v5 = @"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer/MSD_staging";
    }
    else {
      v5 = @"/var/MSDWorkContainer/MSD_staging";
    }
    v6 = [(__CFString *)v5 stringByAppendingPathComponent:v4];
    stagingRootPath = self->_stagingRootPath;
    self->_stagingRootPath = v6;
  }
  v8 = self->_stagingRootPath;

  return v8;
}

- (NSString)secondaryStagingRootPath
{
  return 0;
}

- (NSString)stashedStagingRootPath
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_opt_class() allocWithZone:a3] init];
  [v4 setIdentifier:self->_identifier];
  [v4 setDiskSpacedRequired:self->_diskSpacedRequired];
  [v4 setSkipped:self->_skipped];
  [v4 setRestored:self->_restored];
  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSNumber)diskSpacedRequired
{
  return self->_diskSpacedRequired;
}

- (void)setDiskSpacedRequired:(id)a3
{
}

- (BOOL)skipped
{
  return self->_skipped;
}

- (void)setSkipped:(BOOL)a3
{
  self->_skipped = a3;
}

- (BOOL)restored
{
  return self->_restored;
}

- (void)setRestored:(BOOL)a3
{
  self->_restored = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diskSpacedRequired, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_stagingRootPath, 0);

  objc_storeStrong((id *)&self->_uniqueName, 0);
}

@end