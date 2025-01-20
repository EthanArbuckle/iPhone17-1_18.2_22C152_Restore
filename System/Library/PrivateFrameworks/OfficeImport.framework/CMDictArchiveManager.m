@interface CMDictArchiveManager
- (CMDictArchiveManager)initWithName:(id)a3 resourcePathPrefix:(id)a4;
- (id)copyDictionaryWithSizeInfos:(BOOL)a3;
- (id)copyResourceWithName:(id)a3 type:(int)a4;
- (id)name;
- (id)resourceUrlProtocol;
- (unint64_t)resourceCount;
- (void)pushCssToPath:(id)a3;
- (void)pushData:(id)a3 toPath:(id)a4;
- (void)pushText:(id)a3 toPath:(id)a4;
- (void)setIsFrameset;
@end

@implementation CMDictArchiveManager

- (CMDictArchiveManager)initWithName:(id)a3 resourcePathPrefix:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CMDictArchiveManager;
  v9 = [(CMStylingArchiveManager *)&v15 init];
  if (v9)
  {
    v10 = (NSMutableString *)objc_alloc_init(MEMORY[0x263F089D8]);
    mMainHtml = v9->mMainHtml;
    v9->mMainHtml = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mResources = v9->mResources;
    v9->mResources = v12;

    objc_storeStrong((id *)&v9->mPrefix, a4);
    objc_storeStrong((id *)&v9->mResourceUrlProtocol, a4);
    objc_storeStrong((id *)&v9->mName, a3);
    v9->mIsFrameset = 0;
    v9->super.super.mIsThumbnail = 0;
  }

  return v9;
}

- (void)setIsFrameset
{
  self->mIsFrameset = 1;
}

- (id)name
{
  return self->mName;
}

- (id)copyResourceWithName:(id)a3 type:(int)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263EFF990]);
  [(NSMutableDictionary *)self->mResources setObject:v6 forKey:v5];
  uint64_t v7 = 3;
  if (!self->mIsFrameset) {
    uint64_t v7 = 2;
  }
  id v8 = [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CMDictArchiveManager_mMainHtml[v7]) stringByAppendingString:v5];

  return v8;
}

- (void)pushData:(id)a3 toPath:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (![(CMArchiveManager *)self progressiveMappingIsPausedOnPath:v6])
  {
    id v7 = v6;
    uint64_t v8 = 3;
    if (!self->mIsFrameset) {
      uint64_t v8 = 2;
    }
    id v9 = *(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CMDictArchiveManager_mMainHtml[v8]);
    if ([v7 hasPrefix:v9])
    {
      uint64_t v10 = objc_msgSend(v7, "substringFromIndex:", objc_msgSend(v9, "length"));

      id v7 = (id)v10;
    }
    v11 = [(NSMutableDictionary *)self->mResources objectForKey:v7];
    [v11 appendData:v12];
  }
}

- (void)pushText:(id)a3 toPath:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (![(CMArchiveManager *)self progressiveMappingIsPausedOnPath:v6])
  {
    if (v6)
    {
      id v7 = [v8 dataUsingEncoding:4];
      [(CMDictArchiveManager *)self pushData:v7 toPath:v6];
    }
    else
    {
      [(NSMutableString *)self->mMainHtml appendString:v8];
    }
  }
}

- (id)copyDictionaryWithSizeInfos:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc(NSDictionary);
  mMainHtml = self->mMainHtml;
  mResources = self->mResources;
  id v8 = HTMLMainContent;
  id v9 = HTMLResources;
  if (v3)
  {
    uint64_t v10 = [NSNumber numberWithInt:self->super.super.mHeight];
    v16 = HTMLHeight;
    v11 = [NSNumber numberWithInt:self->super.super.mWidth];
    id v12 = HTMLWidth;
    v13 = [NSNumber numberWithInteger:self->super.super.mPageCount];
    v14 = objc_msgSend(v5, "initWithObjectsAndKeys:", mMainHtml, v8, mResources, v9, v10, v16, v11, v12, v13, HTMLPageCount, 0);
  }
  else
  {
    uint64_t v10 = [NSNumber numberWithInteger:self->super.super.mPageCount];
    v14 = objc_msgSend(v5, "initWithObjectsAndKeys:", mMainHtml, v8, mResources, v9, v10, HTMLPageCount, 0);
  }

  return v14;
}

- (unint64_t)resourceCount
{
  return [(NSMutableDictionary *)self->mResources count];
}

- (id)resourceUrlProtocol
{
  return self->mResourceUrlProtocol;
}

- (void)pushCssToPath:(id)a3
{
  id v5 = a3;
  if (!-[CMArchiveManager progressiveMappingIsPausedOnPath:](self, "progressiveMappingIsPausedOnPath:"))
  {
    v4 = [(CMStylingArchiveManager *)self commitStylesheet];
    if (v4) {
      [(CMDictArchiveManager *)self pushText:v4 toPath:v5];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mName, 0);
  objc_storeStrong((id *)&self->mMainHtml, 0);
  objc_storeStrong((id *)&self->mResourceUrlProtocol, 0);
  objc_storeStrong((id *)&self->mPrefix, 0);
  objc_storeStrong((id *)&self->mResources, 0);
}

@end