@interface PRPosterSnapshotBundle
+ (id)snapshotBundleAtURL:(id)a3 error:(id *)a4;
+ (id)snapshotBundleWithPUIPosterSnapshotBundle:(id)a3;
- (BOOL)isValidBundle;
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
- (PRPosterSnapshotBundle)initWithURL:(id)a3;
- (PRPosterSnapshotBundle)initWithUnderlyingSnapshotBundle:(id)a3;
- (PUIPosterSnapshotBundle)underlyingSnapshotBundle;
- (UIImage)backgroundSnapshot;
- (UIImage)compositeSnapshot;
- (UIImage)floatingSnapshot;
- (UIImage)foregroundSnapshot;
- (double)snapshotScale;
- (id)objectForKeyedSubscript:(id)a3;
- (id)snapshotForLevelSet:(id)a3;
- (int64_t)deviceOrientation;
- (int64_t)interfaceOrientation;
- (int64_t)userInterfaceStyle;
- (unint64_t)posterVersion;
- (unint64_t)snapshotBundleVersion;
- (unint64_t)snapshotEpoch;
@end

@implementation PRPosterSnapshotBundle

+ (id)snapshotBundleWithPUIPosterSnapshotBundle:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithUnderlyingSnapshotBundle:v4];

  return v5;
}

- (PRPosterSnapshotBundle)initWithUnderlyingSnapshotBundle:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)PRPosterSnapshotBundle;
    v6 = [(PRPosterSnapshotBundle *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_underlyingSnapshotBundle, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (PRPosterSnapshotBundle)initWithURL:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F92818];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithURL:v5];

  v7 = [(PRPosterSnapshotBundle *)self initWithUnderlyingSnapshotBundle:v6];
  return v7;
}

+ (id)snapshotBundleAtURL:(id)a3 error:(id *)a4
{
  id v5 = [MEMORY[0x1E4F92818] snapshotBundleAtURL:a3 error:a4];
  if (v5) {
    v6 = (void *)[objc_alloc((Class)a1) initWithUnderlyingSnapshotBundle:v5];
  }
  else {
    v6 = 0;
  }

  return v6;
}

- (NSURL)bundleURL
{
  return (NSURL *)[(PUIPosterSnapshotBundle *)self->_underlyingSnapshotBundle bundleURL];
}

- (NSDictionary)infoDictionary
{
  return (NSDictionary *)[(PUIPosterSnapshotBundle *)self->_underlyingSnapshotBundle infoDictionary];
}

- (BOOL)isValidBundle
{
  return [(PUIPosterSnapshotBundle *)self->_underlyingSnapshotBundle isValidBundle];
}

- (NSDate)dateCreated
{
  return (NSDate *)[(PUIPosterSnapshotBundle *)self->_underlyingSnapshotBundle dateCreated];
}

- (NSUUID)posterUUID
{
  return (NSUUID *)[(PUIPosterSnapshotBundle *)self->_underlyingSnapshotBundle posterUUID];
}

- (NSString)posterProvider
{
  return (NSString *)[(PUIPosterSnapshotBundle *)self->_underlyingSnapshotBundle posterProvider];
}

- (NSString)hardwareIdentifier
{
  return (NSString *)[(PUIPosterSnapshotBundle *)self->_underlyingSnapshotBundle hardwareIdentifier];
}

- (NSString)snapshotDefinitionIdentifier
{
  return (NSString *)[(PUIPosterSnapshotBundle *)self->_underlyingSnapshotBundle snapshotDefinitionIdentifier];
}

- (NSString)bootSessionidentifier
{
  return (NSString *)[(PUIPosterSnapshotBundle *)self->_underlyingSnapshotBundle bootSessionidentifier];
}

- (NSArray)snapshotLevelSets
{
  v2 = [(PUIPosterSnapshotBundle *)self->_underlyingSnapshotBundle snapshotLevelSets];
  v3 = objc_msgSend(v2, "bs_mapNoNulls:", &__block_literal_global_8);

  return (NSArray *)v3;
}

PRPosterLevelSet *__43__PRPosterSnapshotBundle_snapshotLevelSets__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [PRPosterLevelSet alloc];
  id v4 = [v2 levels];

  id v5 = [(PRPosterLevelSet *)v3 initWithLevels:v4];
  return v5;
}

- (unint64_t)snapshotEpoch
{
  return [(PUIPosterSnapshotBundle *)self->_underlyingSnapshotBundle snapshotEpoch];
}

- (unint64_t)snapshotBundleVersion
{
  return [(PUIPosterSnapshotBundle *)self->_underlyingSnapshotBundle snapshotBundleVersion];
}

- (unint64_t)posterVersion
{
  return [(PUIPosterSnapshotBundle *)self->_underlyingSnapshotBundle posterVersion];
}

- (CGSize)assetSize
{
  [(PUIPosterSnapshotBundle *)self->_underlyingSnapshotBundle assetSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)interfaceOrientation
{
  return [(PUIPosterSnapshotBundle *)self->_underlyingSnapshotBundle interfaceOrientation];
}

- (int64_t)deviceOrientation
{
  return [(PUIPosterSnapshotBundle *)self->_underlyingSnapshotBundle deviceOrientation];
}

- (int64_t)userInterfaceStyle
{
  return [(PUIPosterSnapshotBundle *)self->_underlyingSnapshotBundle userInterfaceStyle];
}

- (double)snapshotScale
{
  [(PUIPosterSnapshotBundle *)self->_underlyingSnapshotBundle snapshotScale];
  return result;
}

- (id)objectForKeyedSubscript:(id)a3
{
  return (id)[(PUIPosterSnapshotBundle *)self->_underlyingSnapshotBundle objectForKeyedSubscript:a3];
}

- (UIImage)foregroundSnapshot
{
  return (UIImage *)[(PUIPosterSnapshotBundle *)self->_underlyingSnapshotBundle foregroundSnapshot];
}

- (UIImage)floatingSnapshot
{
  return (UIImage *)[(PUIPosterSnapshotBundle *)self->_underlyingSnapshotBundle floatingSnapshot];
}

- (UIImage)backgroundSnapshot
{
  return (UIImage *)[(PUIPosterSnapshotBundle *)self->_underlyingSnapshotBundle backgroundSnapshot];
}

- (UIImage)compositeSnapshot
{
  return (UIImage *)[(PUIPosterSnapshotBundle *)self->_underlyingSnapshotBundle compositeSnapshot];
}

- (id)snapshotForLevelSet:(id)a3
{
  underlyingSnapshotBundle = self->_underlyingSnapshotBundle;
  id v4 = (objc_class *)MEMORY[0x1E4F927F8];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [v5 levels];

  v8 = (void *)[v6 initWithSet:v7];
  v9 = [(PUIPosterSnapshotBundle *)underlyingSnapshotBundle snapshotForLevelSet:v8];

  return v9;
}

- (PUIPosterSnapshotBundle)underlyingSnapshotBundle
{
  return self->_underlyingSnapshotBundle;
}

- (void).cxx_destruct
{
}

@end