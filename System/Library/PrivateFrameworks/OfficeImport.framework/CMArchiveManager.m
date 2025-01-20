@interface CMArchiveManager
+ (id)resourceTypeToExtension:(int)a3;
+ (id)resourceTypeToMIME:(int)a3;
+ (int)blipTypeToResourceType:(int)a3;
- (BOOL)isCancelled;
- (BOOL)isOnPhone;
- (BOOL)isProgressive;
- (BOOL)isThumbnail;
- (BOOL)noDecorations;
- (BOOL)progressiveMappingIsPausedOnPath:(id)a3;
- (CMArchiveManager)init;
- (NSString)passphrase;
- (id)_validateData:(id)a3 withType:(int *)a4;
- (id)addCssStyle:(id)a3;
- (id)addResource:(id)a3 withName:(id)a4 type:(int)a5;
- (id)addResource:(id)a3 withType:(int)a4;
- (id)addResourceForDrawable:(id)a3 withType:(int)a4 drawable:(id)a5;
- (id)addStyle:(id)a3;
- (id)appendResourcePathToName:(id)a3;
- (id)cachedPathForDrawable:(id)a3;
- (id)copyResourceWithName:(id)a3 type:(int)a4;
- (id)copyResourceWithType:(int)a3;
- (id)cssStylesheetString;
- (id)resourcePathPrefix;
- (unint64_t)pageCount;
- (unint64_t)resourceCount;
- (void)pauseProgressiveMappingOnPath:(id)a3;
- (void)restartProgressiveMappingOnPath:(id)a3;
- (void)setAutoCommit:(BOOL)a3;
- (void)setCommitInterval:(double)a3;
- (void)setHTMLHeight:(int)a3;
- (void)setHTMLWidth:(int)a3;
- (void)setIsOnPhone:(BOOL)a3;
- (void)setIsThumbnail:(BOOL)a3;
- (void)setNoDecorations:(BOOL)a3;
- (void)setPageCount:(unint64_t)a3;
- (void)setPassphrase:(id)a3;
- (void)setResourcePathPrefix:(id)a3;
@end

@implementation CMArchiveManager

- (CMArchiveManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)CMArchiveManager;
  v2 = [(CMArchiveManager *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    mDrawableCache = v2->mDrawableCache;
    v2->mDrawableCache = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    mPausedPaths = v2->mPausedPaths;
    v2->mPausedPaths = (NSMutableSet *)v5;

    v7 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    mStyleObjectCache = v2->mStyleObjectCache;
    v2->mStyleObjectCache = v7;

    [(NSCache *)v2->mStyleObjectCache setCountLimit:128];
    [(NSCache *)v2->mStyleObjectCache setName:@"CMArchiveManager cache"];
  }
  return v2;
}

- (void)setIsOnPhone:(BOOL)a3
{
  self->mIsOnPhone = a3;
}

- (void)setPassphrase:(id)a3
{
}

- (void)setAutoCommit:(BOOL)a3
{
  self->mAutoCommit = a3;
}

- (BOOL)isThumbnail
{
  return self->mIsThumbnail;
}

- (void)setPageCount:(unint64_t)a3
{
  self->mPageCount = a3;
}

- (void)setHTMLWidth:(int)a3
{
  self->mWidth = a3;
}

- (void)setHTMLHeight:(int)a3
{
  self->mHeight = a3;
}

- (BOOL)progressiveMappingIsPausedOnPath:(id)a3
{
  v4 = (__CFString *)a3;
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = @"##main##";
  }
  char v6 = [(NSMutableSet *)self->mPausedPaths containsObject:v5];

  return v6;
}

- (id)cachedPathForDrawable:(id)a3
{
  v4 = [MEMORY[0x263F08D40] valueWithNonretainedObject:a3];
  uint64_t v5 = [(NSMutableDictionary *)self->mDrawableCache objectForKey:v4];

  return v5;
}

+ (int)blipTypeToResourceType:(int)a3
{
  if (a3 > 9) {
    return -1;
  }
  else {
    return dword_238EF1450[a3];
  }
}

- (id)addResourceForDrawable:(id)a3 withType:(int)a4 drawable:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    objc_super v10 = [MEMORY[0x263F08D40] valueWithNonretainedObject:v9];
    v11 = [(NSMutableDictionary *)self->mDrawableCache objectForKey:v10];
    if (!v11)
    {
      v11 = [(CMArchiveManager *)self addResource:v8 withType:v6];
      [(NSMutableDictionary *)self->mDrawableCache setObject:v11 forKey:v10];
    }
    id v12 = v11;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)addResource:(id)a3 withType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [(CMArchiveManager *)self copyResourceWithType:v4];
  [(CMArchiveManager *)self pushData:v6 toPath:v7];
  [(CMArchiveManager *)self commitDataAtPath:v7];
  [(CMArchiveManager *)self closeResourceAtPath:v7];

  return v7;
}

- (id)_validateData:(id)a3 withType:(int *)a4
{
  id v4 = a3;
  return v4;
}

- (id)copyResourceWithType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = +[CMArchiveManager resourceTypeToExtension:](CMArchiveManager, "resourceTypeToExtension:");
  id v6 = +[CMFileManager uniqueFileName:v5];

  id v7 = [(CMArchiveManager *)self copyResourceWithName:v6 type:v3];
  return v7;
}

+ (id)resourceTypeToExtension:(int)a3
{
  if (a3 > 0xA) {
    return &stru_26EBF24D8;
  }
  else {
    return off_264D68778[a3];
  }
}

- (BOOL)isOnPhone
{
  return self->mIsOnPhone;
}

- (void)pauseProgressiveMappingOnPath:(id)a3
{
  id v4 = (__CFString *)a3;
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = @"##main##";
  }
  id v6 = v5;
  -[NSMutableSet addObject:](self->mPausedPaths, "addObject:");
}

- (void)restartProgressiveMappingOnPath:(id)a3
{
  id v4 = (__CFString *)a3;
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = @"##main##";
  }
  id v6 = v5;
  -[NSMutableSet removeObject:](self->mPausedPaths, "removeObject:");
}

- (id)copyResourceWithName:(id)a3 type:(int)a4
{
  return 0;
}

- (void)setCommitInterval:(double)a3
{
  self->mCommitInterval = a3;
}

- (id)addResource:(id)a3 withName:(id)a4 type:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = [(CMArchiveManager *)self copyResourceWithName:a4 type:v5];
  [(CMArchiveManager *)self pushData:v8 toPath:v9];
  [(CMArchiveManager *)self commitDataAtPath:v9];
  [(CMArchiveManager *)self closeResourceAtPath:v9];

  return v9;
}

- (unint64_t)resourceCount
{
  return 0;
}

- (id)addStyle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSCache *)self->mStyleObjectCache objectForKey:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = [v4 cacheFriendlyCSSStyleString];
    id v7 = [(CMArchiveManager *)self addCssStyle:v8];
    if (v7) {
      [(NSCache *)self->mStyleObjectCache setObject:v7 forKey:v4];
    }
  }
  return v7;
}

- (id)addCssStyle:(id)a3
{
  return 0;
}

- (id)cssStylesheetString
{
  return 0;
}

- (void)setResourcePathPrefix:(id)a3
{
}

- (id)resourcePathPrefix
{
  return self->mResourcePathPrefix;
}

- (id)appendResourcePathToName:(id)a3
{
  id v4 = a3;
  mResourcePathPrefix = self->mResourcePathPrefix;
  if (mResourcePathPrefix)
  {
    id v6 = [(NSString *)mResourcePathPrefix stringByAppendingPathComponent:v4];
  }
  else
  {
    id v6 = v4;
  }
  id v7 = v6;

  return v7;
}

- (void)setIsThumbnail:(BOOL)a3
{
  self->mIsThumbnail = a3;
}

- (unint64_t)pageCount
{
  return self->mPageCount;
}

- (BOOL)isProgressive
{
  return 1;
}

- (BOOL)isCancelled
{
  return 0;
}

+ (id)resourceTypeToMIME:(int)a3
{
  if ((a3 + 1) > 0xB) {
    return @"text";
  }
  else {
    return (id)qword_264D68718[a3 + 1];
  }
}

- (NSString)passphrase
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)noDecorations
{
  return self->_noDecorations;
}

- (void)setNoDecorations:(BOOL)a3
{
  self->_noDecorations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mStyleObjectCache, 0);
  objc_storeStrong((id *)&self->mPausedPaths, 0);
  objc_storeStrong((id *)&self->mResourcePathPrefix, 0);
  objc_storeStrong((id *)&self->mDrawableCache, 0);
  objc_storeStrong((id *)&self->mPassphrase, 0);
}

@end