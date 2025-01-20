@interface PFXArchive
- (BOOL)copyEntry:(id)a3 toFile:(id)a4;
- (BOOL)isDirectory;
- (BOOL)isEPUB;
- (BOOL)isValid;
- (BOOL)preventUseOfEncryptionCache;
- (NSError)drmContextCheckError;
- (NSString)perUserRootFolder;
- (NSString)rootFolder;
- (NSString)rootPath;
- (PFDContext)drmContext;
- (PFXArchive)initWithPath:(id)a3;
- (PFXArchive)initWithPath:(id)a3 allowArchive:(BOOL)a4;
- (THAsset)asset;
- (THBookVersion)bookVersion;
- (id)createDataWithName:(id)a3 error:(id *)a4;
- (id)decryptEntryWithName:(id)a3 error:(id *)a4;
- (id)entries;
- (id)entriesWithinFolder:(id)a3;
- (id)entryWithName:(id)a3;
- (id)fontObfuscationInfo;
- (void)checkEncryption;
- (void)dealloc;
- (void)setAsset:(id)a3;
- (void)setBookVersion:(id)a3;
- (void)setDrmContext:(id)a3;
- (void)setDrmContextCheckError:(id)a3;
- (void)setPreventUseOfEncryptionCache:(BOOL)a3;
@end

@implementation PFXArchive

- (PFXArchive)initWithPath:(id)a3
{
  return [(PFXArchive *)self initWithPath:a3 allowArchive:0];
}

- (PFXArchive)initWithPath:(id)a3 allowArchive:(BOOL)a4
{
  BOOL v4 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PFXArchive;
  v6 = [(PFXArchive *)&v11 init];
  if (v6)
  {
    char v10 = 0;
    if ([+[NSFileManager defaultManager] fileExistsAtPath:a3 isDirectory:&v10])
    {
      if (v10)
      {
        v7 = (objc_class *)a3;
        uint64_t v8 = 8;
LABEL_5:
        *(Class *)((char *)&v6->super.isa + v8) = v7;
        v6->mRootPath = (NSString *)a3;
        return v6;
      }
      if (v4
        && +[SFUZipArchive isZipArchiveAtPath:a3])
      {
        v7 = (objc_class *)[objc_alloc((Class)SFUZipArchive) initWithPath:a3 collapseCommonRootDirectory:0];
        uint64_t v8 = 24;
        goto LABEL_5;
      }
    }
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFXArchive;
  [(PFXArchive *)&v3 dealloc];
}

- (BOOL)isDirectory
{
  return self->mFolderRoot != 0;
}

- (BOOL)isEPUB
{
  v2 = [[(NSString *)self->mRootPath pathExtension] lowercaseString];

  return [@"epub" isEqualToString:v2];
}

- (NSString)rootFolder
{
  if (![(PFXArchive *)self isDirectory]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXArchive rootFolder]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/PFXArchive.mm") lineNumber:92 description:@"only call when directory"];
  }
  return self->mFolderRoot;
}

- (NSString)perUserRootFolder
{
  if (![(PFXArchive *)self isDirectory]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXArchive perUserRootFolder]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/PFXArchive.mm") lineNumber:98 description:@"only call when directory"];
  }
  result = self->mPerUserRoot;
  if (!result)
  {
    if (self->mFolderRoot)
    {
      result = [[[+[BLLibrary defaultBookLibrary](BLLibrary, "defaultBookLibrary") _perUserBookURLForBookURL:+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", self->mFolderRoot)] path];
      self->mPerUserRoot = result;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)checkEncryption
{
  objc_super v3 = [+[PFDContextManager sharedInstance] contextForArchive:self->mFolderRoot];
  if (!v3)
  {
    BOOL v4 = +[PFAXPackage rightsInfoForArchive:self];
    id v5 = +[PFAXPackage newAllEncryptionInfoForArchive:self];
    v6 = v5;
    if (v4 || objc_msgSend(objc_msgSend(v5, "allKeys"), "count"))
    {
      objc_super v3 = [[PFDContext alloc] initWithRoot:self->mFolderRoot pVwXvin61ocxeAjqxjwz:v6 andRights:v4];
      if ([+[PFDContextManager sharedInstance] setContext:v3 forArchive:self->mFolderRoot])
      {
      }
      else
      {
        v7 = v3;
      }
    }
    else
    {
      objc_super v3 = 0;
    }
  }
  [(PFXArchive *)self setDrmContext:v3];
  self->mEncryptionChecked = 1;
}

- (id)fontObfuscationInfo
{
  if (!self->mEncryptionChecked) {
    [(PFXArchive *)self checkEncryption];
  }
  mDrmContext = self->mDrmContext;

  return [(PFDContext *)mDrmContext fontObfuscation];
}

- (id)decryptEntryWithName:(id)a3 error:(id *)a4
{
  if (!self->mEncryptionChecked) {
    [(PFXArchive *)self checkEncryption];
  }
  mDrmContext = self->mDrmContext;
  if (mDrmContext)
  {
    return [(PFDContext *)mDrmContext dataRepresentationForEntryName:a3 error:a4];
  }
  else
  {
    if (([a3 hasPrefix:@"/"] & 1) == 0) {
      a3 = [@"/" stringByAppendingString:a3];
    }
    return [(PFXArchive *)self entryWithName:a3];
  }
}

- (id)entryWithName:(id)a3
{
  id v3 = a3;
  mFolderRoot = self->mFolderRoot;
  if (!mFolderRoot)
  {
    if (self->mZipArchive)
    {
      if ([a3 hasPrefix:@"/"]) {
        id v3 = [v3 substringFromIndex:1];
      }
      id v8 = [(SFUZipArchive *)self->mZipArchive entryWithName:v3];
      if (v8)
      {
        id v9 = [v8 data];
        if (v9)
        {
          id v7 = [objc_alloc((Class)SFUMemoryDataRepresentation) initWithDataNoCopy:v9];
          goto LABEL_10;
        }
      }
    }
    return 0;
  }
  v6 = [(NSString *)mFolderRoot stringByAppendingPathComponent:a3];
  if (![+[NSFileManager defaultManager] fileExistsAtPath:v6])return 0; {
  id v7 = [objc_alloc((Class)SFUFileDataRepresentation) initWithPath:v6];
  }
LABEL_10:

  return v7;
}

- (id)createDataWithName:(id)a3 error:(id *)a4
{
  if (!self->mFolderRoot) {
    return 0;
  }
  id v4 = [(PFXArchive *)self decryptEntryWithName:a3 error:a4];
  if (v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableData);
    if ([v4 readIntoData:v5]) {
      id v4 = v5;
    }
    else {
      id v4 = 0;
    }
  }
  return v4;
}

- (BOOL)copyEntry:(id)a3 toFile:(id)a4
{
  if (!self->mFolderRoot) {
    return 0;
  }
  id v5 = [(PFXArchive *)self entryWithName:a3];
  v6 = +[NSFileManager defaultManager];
  if (!-[NSFileManager fileExistsAtPath:](v6, "fileExistsAtPath:", [v5 path])) {
    return 0;
  }
  id v7 = [v5 path];

  return [(NSFileManager *)v6 copyItemAtPath:v7 toPath:a4 error:0];
}

- (id)entries
{
  if (self->mFolderRoot)
  {
    v2 = +[NSFileManager defaultManager];
    return -[NSFileManager contentsOfDirectoryAtPath:error:](v2, "contentsOfDirectoryAtPath:error:");
  }
  else
  {
    id result = self->mZipArchive;
    if (result)
    {
      return [result allEntryNames];
    }
  }
  return result;
}

- (id)entriesWithinFolder:(id)a3
{
  id v4 = [(PFXArchive *)self entries];
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        char v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (![v10 rangeOfString:a3]) {
          [v5 addObject:v10];
        }
      }
      id v7 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  return v5;
}

- (BOOL)isValid
{
  return self->mFolderRoot || self->mZipArchive != 0;
}

- (PFDContext)drmContext
{
  return self->mDrmContext;
}

- (void)setDrmContext:(id)a3
{
}

- (NSError)drmContextCheckError
{
  return self->mDrmContextCheckError;
}

- (void)setDrmContextCheckError:(id)a3
{
}

- (THAsset)asset
{
  return self->mAsset;
}

- (void)setAsset:(id)a3
{
}

- (THBookVersion)bookVersion
{
  return self->mBookVersion;
}

- (void)setBookVersion:(id)a3
{
}

- (BOOL)preventUseOfEncryptionCache
{
  return self->mPreventUseOfEncryptionCache;
}

- (void)setPreventUseOfEncryptionCache:(BOOL)a3
{
  self->mPreventUseOfEncryptionCache = a3;
}

- (NSString)rootPath
{
  return self->mRootPath;
}

@end