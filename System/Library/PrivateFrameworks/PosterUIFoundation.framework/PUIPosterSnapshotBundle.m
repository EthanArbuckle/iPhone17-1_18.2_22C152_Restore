@interface PUIPosterSnapshotBundle
+ (id)snapshotBundleAtURL:(id)a3 error:(id *)a4;
+ (id)snapshotBundleForInfoDictionary:(id)a3 levelToImage:(id)a4 colorStatistics:(id)a5 error:(id *)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSnapshotBundle:(id)a3;
- (BOOL)isValidBundle;
- (BOOL)setInfoDictionary:(id)a3 error:(id *)a4;
- (BOOL)updateInfoDictionary:(id)a3 error:(id *)a4;
- (CGSize)assetSize;
- (NSArray)snapshotLevelSets;
- (NSDate)dateCreated;
- (NSDictionary)infoDictionary;
- (NSString)bootSessionidentifier;
- (NSString)hardwareIdentifier;
- (NSString)posterProvider;
- (NSString)snapshotDefinitionIdentifier;
- (NSURL)bundleURL;
- (NSUUID)posterUUID;
- (PUIColorStatistics)colorStatistics;
- (PUIImageOnDiskFormat)ondiskFormat;
- (PUIPosterSnapshotBundle)initWithInfoDictionary:(id)a3 levelToImage:(id)a4;
- (PUIPosterSnapshotBundle)initWithInfoDictionary:(id)a3 levelToImage:(id)a4 colorStatistics:(id)a5;
- (PUIPosterSnapshotBundle)initWithURL:(id)a3;
- (UIImage)backgroundSnapshot;
- (UIImage)compositeSnapshot;
- (UIImage)floatingSnapshot;
- (UIImage)foregroundSnapshot;
- (double)snapshotScale;
- (id)URLForComponent:(int64_t)a3;
- (id)_decodeImageForComponent:(int64_t)a3 error:(id *)a4;
- (id)_decodeImageForLevelSet:(id)a3 error:(id *)a4;
- (id)description;
- (id)imageForComponent:(int64_t)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (id)snapshotForLevelSet:(id)a3;
- (int64_t)deviceOrientation;
- (int64_t)interfaceOrientation;
- (int64_t)userInterfaceStyle;
- (unint64_t)posterVersion;
- (unint64_t)snapshotBundleVersion;
- (unint64_t)snapshotEpoch;
@end

@implementation PUIPosterSnapshotBundle

+ (id)snapshotBundleAtURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = PUIPosterSnapshotBundleURLForComponent(v5, 3);
  if ([v6 checkResourceIsReachableAndReturnError:a4]) {
    v7 = [[PUIPosterSnapshotBundle alloc] initWithURL:v5];
  }
  else {
    v7 = 0;
  }

  return v7;
}

+ (id)snapshotBundleForInfoDictionary:(id)a3 levelToImage:(id)a4 colorStatistics:(id)a5 error:(id *)a6
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[PUIPosterSnapshotBundle alloc] initWithInfoDictionary:v10 levelToImage:v9 colorStatistics:v8];

  return v11;
}

- (PUIPosterSnapshotBundle)initWithURL:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self) {
    goto LABEL_3;
  }
  v6 = (NSURL *)[v4 copy];
  bundleURL = self->_bundleURL;
  self->_bundleURL = v6;

  id v8 = [(PUIPosterSnapshotBundle *)self infoDictionary];
  uint64_t v9 = [v8 count];

  if (!v9) {
    id v10 = 0;
  }
  else {
LABEL_3:
  }
    id v10 = self;

  return v10;
}

- (PUIPosterSnapshotBundle)initWithInfoDictionary:(id)a3 levelToImage:(id)a4
{
  return [(PUIPosterSnapshotBundle *)self initWithInfoDictionary:a3 levelToImage:a4 colorStatistics:0];
}

- (PUIPosterSnapshotBundle)initWithInfoDictionary:(id)a3 levelToImage:(id)a4 colorStatistics:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PUIPosterSnapshotBundle;
  v11 = [(PUIPosterSnapshotBundle *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    infoDictionary = v11->_infoDictionary;
    v11->_infoDictionary = (NSDictionary *)v12;

    uint64_t v14 = [v9 copy];
    levelToImage = v11->_levelToImage;
    v11->_levelToImage = (NSDictionary *)v14;

    uint64_t v16 = [v10 copy];
    colorStatistics = v11->_colorStatistics;
    v11->_colorStatistics = (PUIColorStatistics *)v16;
  }
  return v11;
}

- (BOOL)isValidBundle
{
  v2 = [(PUIPosterSnapshotBundle *)self infoDictionary];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PUIPosterSnapshotBundle *)a3;
  id v5 = v4;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else if (v4)
  {
    BOOL v6 = [(PUIPosterSnapshotBundle *)self isEqualToSnapshotBundle:v4];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isEqualToSnapshotBundle:(id)a3
{
  id v4 = (PUIPosterSnapshotBundle *)a3;
  id v5 = v4;
  if (self == v4) {
    goto LABEL_11;
  }
  if (!v4) {
    goto LABEL_12;
  }
  BOOL v6 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_12;
  }
  id v8 = [(PUIPosterSnapshotBundle *)v5 infoDictionary];
  id v9 = [(PUIPosterSnapshotBundle *)self infoDictionary];
  int v10 = [v8 isEqualToDictionary:v9];

  if (!v10) {
    goto LABEL_12;
  }
  uint64_t v11 = [(PUIPosterSnapshotBundle *)v5 bundleURL];
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    v13 = [(PUIPosterSnapshotBundle *)self bundleURL];

    if (v13)
    {
      uint64_t v14 = [(PUIPosterSnapshotBundle *)v5 bundleURL];
      v15 = [(PUIPosterSnapshotBundle *)self bundleURL];
      int v16 = [v14 isEqual:v15];

      if (!v16) {
        goto LABEL_12;
      }
    }
  }
  uint64_t v17 = [(PUIPosterSnapshotBundle *)self colorStatistics];
  if (!v17) {
    goto LABEL_11;
  }
  v18 = (void *)v17;
  objc_super v19 = [(PUIPosterSnapshotBundle *)v5 colorStatistics];

  if (!v19
    || ([(PUIPosterSnapshotBundle *)self colorStatistics],
        v20 = objc_claimAutoreleasedReturnValue(),
        [(PUIPosterSnapshotBundle *)v5 colorStatistics],
        v21 = objc_claimAutoreleasedReturnValue(),
        int v22 = [v20 isEqual:v21],
        v21,
        v20,
        v22))
  {
LABEL_11:
    BOOL v23 = 1;
  }
  else
  {
LABEL_12:
    BOOL v23 = 0;
  }

  return v23;
}

- (id)description
{
  BOOL v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(PUIPosterSnapshotBundle *)self bundleURL];
  id v5 = (id)[v3 appendObject:v4 withName:@"bundleURL"];

  BOOL v6 = [(PUIPosterSnapshotBundle *)self infoDictionary];
  [v3 appendDictionarySection:v6 withName:@"infoDictionary" skipIfEmpty:1];

  v7 = [v3 build];

  return v7;
}

- (id)URLForComponent:(int64_t)a3
{
  return PUIPosterSnapshotBundleURLForComponent(self->_bundleURL, a3);
}

- (NSDictionary)infoDictionary
{
  v2 = self;
  objc_sync_enter(v2);
  infoDictionary = v2->_infoDictionary;
  if (infoDictionary)
  {
    id v4 = infoDictionary;
  }
  else
  {
    id v5 = PUIPosterSnapshotBundleURLForComponent(v2->_bundleURL, 3);
    id v11 = 0;
    BOOL v6 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v5 options:1 error:&v11];
    id v7 = v11;
    if ([v6 length])
    {
      uint64_t v8 = [MEMORY[0x263F08AC0] propertyListWithData:v6 options:0 format:0 error:0];
    }
    else
    {
      uint64_t v8 = MEMORY[0x263EFFA78];
    }
    id v9 = v2->_infoDictionary;
    v2->_infoDictionary = (NSDictionary *)v8;

    id v4 = v2->_infoDictionary;
  }
  objc_sync_exit(v2);

  return v4;
}

- (BOOL)updateInfoDictionary:(id)a3 error:(id *)a4
{
  if (!a3) {
    return 1;
  }
  id v6 = a3;
  id v7 = [(PUIPosterSnapshotBundle *)self infoDictionary];
  uint64_t v8 = (void *)[v7 mutableCopy];

  [v8 addEntriesFromDictionary:v6];
  LOBYTE(a4) = [(PUIPosterSnapshotBundle *)self setInfoDictionary:v8 error:a4];

  return (char)a4;
}

- (BOOL)setInfoDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = self;
  objc_sync_enter(v7);
  uint64_t v8 = [(PUIPosterSnapshotBundle *)v7 URLForComponent:3];
  id v16 = 0;
  id v9 = [MEMORY[0x263F08AC0] dataWithPropertyList:v6 format:100 options:0 error:&v16];
  id v10 = v16;
  id v11 = v10;
  if (!v10)
  {
    if ([v9 writeToURL:v8 options:1 error:a4])
    {
      [v8 setResourceValue:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263EFF6B0] error:0];
      uint64_t v13 = [v6 copy];
      infoDictionary = v7->_infoDictionary;
      v7->_infoDictionary = (NSDictionary *)v13;

      BOOL v12 = 1;
      goto LABEL_7;
    }
LABEL_6:
    BOOL v12 = 0;
    goto LABEL_7;
  }
  if (!a4) {
    goto LABEL_6;
  }
  BOOL v12 = 0;
  *a4 = v10;
LABEL_7:

  objc_sync_exit(v7);
  return v12;
}

- (NSDate)dateCreated
{
  v2 = [(PUIPosterSnapshotBundle *)self infoDictionary];
  BOOL v3 = self;
  id v4 = objc_msgSend(v2, "bs_safeObjectForKey:ofType:", @"PUIPosterSnapshotBundleInfoKeyDateCreated", v3);

  if (v4)
  {
    id v5 = PUIPosterSnapshotBundleSharedDateFormatter();
    id v6 = [v5 dateFromString:v4];
  }
  else
  {
    id v6 = 0;
  }

  return (NSDate *)v6;
}

- (unint64_t)snapshotEpoch
{
  v2 = [(PUIPosterSnapshotBundle *)self infoDictionary];
  BOOL v3 = [v2 objectForKey:@"PUIPosterSnapshotBundleInfoKeySnapshotEpoch"];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (unint64_t)snapshotBundleVersion
{
  v2 = [(PUIPosterSnapshotBundle *)self infoDictionary];
  BOOL v3 = [v2 objectForKey:@"PUIPosterSnapshotBundleInfoKeySnapshotBundleVersion"];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (unint64_t)posterVersion
{
  v2 = [(PUIPosterSnapshotBundle *)self infoDictionary];
  BOOL v3 = [v2 objectForKey:@"PUIPosterSnapshotBundleInfoKeyPosterVersion"];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (int64_t)interfaceOrientation
{
  v2 = [(PUIPosterSnapshotBundle *)self infoDictionary];
  BOOL v3 = [v2 objectForKey:@"PUIPosterSnapshotBundleInfoKeyInterfaceOrientation"];
  int64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (int64_t)deviceOrientation
{
  v2 = [(PUIPosterSnapshotBundle *)self infoDictionary];
  BOOL v3 = [v2 objectForKey:@"PUIPosterSnapshotBundleInfoKeyDeviceInterfaceOrientation"];
  int64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (NSString)hardwareIdentifier
{
  v2 = [(PUIPosterSnapshotBundle *)self infoDictionary];
  BOOL v3 = [v2 objectForKey:@"PUIPosterSnapshotBundleInfoKeyHardwareIdentifier"];

  return (NSString *)v3;
}

- (NSArray)snapshotLevelSets
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = [(PUIPosterSnapshotBundle *)self infoDictionary];
  BOOL v3 = [v2 objectForKey:@"PUIPosterSnapshotBundleInfoKeySnapshotLevels"];

  int64_t v4 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v11 = (void *)MEMORY[0x263F08928];
        BOOL v12 = self;
        uint64_t v13 = objc_msgSend(v11, "unarchivedObjectOfClass:fromData:error:", v12, v10, 0, (void)v16);
        objc_msgSend(v4, "bs_safeAddObject:", v13);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  uint64_t v14 = (void *)[v4 copy];
  return (NSArray *)v14;
}

- (CGSize)assetSize
{
  v2 = [(PUIPosterSnapshotBundle *)self infoDictionary];
  BOOL v3 = [v2 objectForKey:@"PUIPosterSnapshotBundleInfoKeyAssetSize"];

  if (v3)
  {
    CGSize v4 = CGSizeFromString(v3);
    CGFloat width = v4.width;
    CGFloat height = v4.height;
  }
  else
  {
    CGFloat width = *(double *)(MEMORY[0x263F00190] + 16);
    CGFloat height = *(double *)(MEMORY[0x263F00190] + 24);
  }

  double v7 = width;
  double v8 = height;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (double)snapshotScale
{
  v2 = [(PUIPosterSnapshotBundle *)self infoDictionary];
  BOOL v3 = [v2 objectForKey:@"PUIPosterSnapshotBundleInfoKeyScale"];
  CGSize v4 = v3;
  if (!v3) {
    BOOL v3 = &unk_27081B290;
  }
  [v3 doubleValue];
  double v6 = v5;

  return v6;
}

- (int64_t)userInterfaceStyle
{
  v2 = [(PUIPosterSnapshotBundle *)self infoDictionary];
  BOOL v3 = [v2 objectForKey:@"PUIPosterSnapshotBundleInfoKeyUserInterfaceStyle"];
  int64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (NSUUID)posterUUID
{
  v2 = [(PUIPosterSnapshotBundle *)self infoDictionary];
  BOOL v3 = self;
  int64_t v4 = objc_msgSend(v2, "bs_safeObjectForKey:ofType:", @"PUIPosterSnapshotBundleInfoKeyPosterUUID", v3);

  if (v4) {
    double v5 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v4];
  }
  else {
    double v5 = 0;
  }

  return (NSUUID *)v5;
}

- (NSString)posterProvider
{
  v2 = [(PUIPosterSnapshotBundle *)self infoDictionary];
  BOOL v3 = [v2 objectForKey:@"PUIPosterSnapshotBundleInfoKeyPosterProvider"];

  return (NSString *)v3;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  double v5 = [(PUIPosterSnapshotBundle *)self infoDictionary];
  double v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (UIImage)foregroundSnapshot
{
  return (UIImage *)[(PUIPosterSnapshotBundle *)self _decodeImageForComponent:5 error:0];
}

- (UIImage)floatingSnapshot
{
  return (UIImage *)[(PUIPosterSnapshotBundle *)self _decodeImageForComponent:7 error:0];
}

- (UIImage)backgroundSnapshot
{
  return (UIImage *)[(PUIPosterSnapshotBundle *)self _decodeImageForComponent:6 error:0];
}

- (UIImage)compositeSnapshot
{
  return (UIImage *)[(PUIPosterSnapshotBundle *)self _decodeImageForComponent:8 error:0];
}

- (NSString)snapshotDefinitionIdentifier
{
  v2 = [(PUIPosterSnapshotBundle *)self infoDictionary];
  BOOL v3 = [v2 objectForKey:@"PUIPosterSnapshotBundleInfoKeySnapshotDefinitionIdentifier"];

  return (NSString *)v3;
}

- (id)_decodeImageForComponent:(int64_t)a3 error:(id *)a4
{
  if ((unint64_t)(a3 - 5) > 4)
  {
    id v10 = 0;
    goto LABEL_14;
  }
  double v7 = (void *)MEMORY[0x25A2F5E70](self, a2);
  if (!self->_levelToImage) {
    goto LABEL_7;
  }
  double v8 = _posterLevelSetForComponent(a3);
  id v9 = [(NSDictionary *)self->_levelToImage objectForKey:v8];
  if (!v9)
  {

LABEL_7:
    if (self->_bundleURL)
    {
      [(PUIPosterSnapshotBundle *)self interfaceOrientation];
      [(PUIPosterSnapshotBundle *)self deviceOrientation];
      [(PUIPosterSnapshotBundle *)self snapshotScale];
      double v12 = v11;
      uint64_t v13 = PUIPosterSnapshotBundleURLForComponent(self->_bundleURL, a3);
      uint64_t v14 = [(PUIPosterSnapshotBundle *)self ondiskFormat];
      v15 = [[PUIImageEncoder alloc] initWithURL:v13 format:v14];
      id v19 = 0;
      long long v16 = [(PUIImageEncoder *)v15 createUIImageWithOrientation:PUIImageOrientationForImageCapturedInInterfaceOrientationToBeDisplayedInInterfaceOrientation() scale:&v19 error:v12];
      id v17 = v19;

      if (a4 && v17)
      {
        id v17 = v17;
        *a4 = v17;
      }
    }
    else
    {
      long long v16 = 0;
      id v17 = 0;
    }
    id v10 = v16;

    goto LABEL_13;
  }
  id v10 = v9;

LABEL_13:

LABEL_14:
  return v10;
}

- (id)_decodeImageForLevelSet:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = _componentForLevelSet(v6);
  if (v7)
  {
    id v8 = [(PUIPosterSnapshotBundle *)self _decodeImageForComponent:v7 error:a4];
  }
  else
  {
    id v9 = [(NSDictionary *)self->_levelToImage objectForKey:v6];
    id v10 = v9;
    if (v9)
    {
      id v8 = v9;
    }
    else if (self->_bundleURL)
    {
      [(PUIPosterSnapshotBundle *)self interfaceOrientation];
      [(PUIPosterSnapshotBundle *)self deviceOrientation];
      [(PUIPosterSnapshotBundle *)self snapshotScale];
      double v12 = v11;
      uint64_t v13 = PUIPosterSnapshotBundleURLForPosterLevelSet(self->_bundleURL, v6);
      uint64_t v14 = [(PUIPosterSnapshotBundle *)self ondiskFormat];
      v15 = [[PUIImageEncoder alloc] initWithURL:v13 format:v14];
      id v8 = [(PUIImageEncoder *)v15 createUIImageWithOrientation:PUIImageOrientationForImageCapturedInInterfaceOrientationToBeDisplayedInInterfaceOrientation() scale:a4 error:v12];
    }
    else
    {
      id v8 = 0;
    }
  }
  return v8;
}

- (id)imageForComponent:(int64_t)a3
{
  return [(PUIPosterSnapshotBundle *)self _decodeImageForComponent:a3 error:0];
}

- (id)snapshotForLevelSet:(id)a3
{
  return [(PUIPosterSnapshotBundle *)self _decodeImageForLevelSet:a3 error:0];
}

- (PUIImageOnDiskFormat)ondiskFormat
{
  v2 = [(PUIPosterSnapshotBundle *)self objectForKeyedSubscript:@"PUIPosterSnapshotBundleInfoKeySnapshotImageFormat"];
  if ([v2 caseInsensitiveCompare:@"atx"])
  {
    if ([v2 caseInsensitiveCompare:@"png"]) {
      +[PUIImageOnDiskFormat defaultFormat];
    }
    else {
    uint64_t v3 = +[PUIImageOnDiskFormat png];
    }
  }
  else
  {
    uint64_t v3 = +[PUIImageOnDiskFormat defaultATX];
  }
  id v4 = (void *)v3;

  return (PUIImageOnDiskFormat *)v4;
}

- (PUIColorStatistics)colorStatistics
{
  v2 = self;
  objc_sync_enter(v2);
  colorStatistics = v2->_colorStatistics;
  if (colorStatistics)
  {
    id v4 = colorStatistics;
  }
  else
  {
    double v5 = [(PUIPosterSnapshotBundle *)v2 infoDictionary];
    id v6 = [v5 objectForKey:@"PUIPosterSnapshotBundleInfoKeyContainsColorStatistics"];
    char v7 = [v6 BOOLValue];

    if (v7)
    {
      id v8 = PUIPosterSnapshotBundleURLForComponent(v2->_bundleURL, 4);
      id v9 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v8 options:1 error:0];
      id v10 = (void *)MEMORY[0x263F08928];
      double v11 = self;
      uint64_t v12 = [v10 unarchivedObjectOfClass:v11 fromData:v9 error:0];
      uint64_t v13 = v2->_colorStatistics;
      v2->_colorStatistics = (PUIColorStatistics *)v12;

      id v4 = v2->_colorStatistics;
    }
    else
    {
      id v4 = 0;
    }
  }
  objc_sync_exit(v2);

  return v4;
}

- (NSURL)bundleURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)bootSessionidentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bootSessionidentifier, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_infoDictionary, 0);
  objc_storeStrong((id *)&self->_levelToImage, 0);
  objc_storeStrong((id *)&self->_colorStatistics, 0);
}

@end