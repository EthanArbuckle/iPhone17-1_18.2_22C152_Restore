@interface KPFGingerDocument
- (BOOL)isLegacy;
- (BOOL)isLooping;
- (CGSize)showSize;
- (KPFGingerDocument)initWithKPFBundle:(id)a3 kpfDictionary:(id)a4 drmContext:(id)a5;
- (NSArray)slideList;
- (NSMutableDictionary)slidesDictionary;
- (NSString)documentPath;
- (NSString)soundtrackPath;
- (PFDContext)drmContext;
- (double)soundtrackVolume;
- (unint64_t)soundtrackMode;
- (void)dealloc;
- (void)setIsLegacy:(BOOL)a3;
@end

@implementation KPFGingerDocument

- (KPFGingerDocument)initWithKPFBundle:(id)a3 kpfDictionary:(id)a4 drmContext:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)KPFGingerDocument;
  v8 = [(KPFGingerDocument *)&v11 init];
  if (v8)
  {
    v8->mKPFBundle = (NSBundle *)a3;
    v8->mDrmContext = (PFDContext *)a5;
    v9 = (NSDictionary *)a4;
    v8->mKPFDictionary = v9;
    v8->mSlideList = (NSArray *)[(NSDictionary *)v9 objectForKey:@"slideList"];
    v8->mSoundtrackDict = (NSDictionary *)[(NSDictionary *)v8->mKPFDictionary objectForKey:@"soundtrack"];
    v8->mIsLooping = [[v8->mKPFDictionary objectForKey:@"loopSlideshow"] boolValue];
    v8->mSlideHeight = (NSNumber *)[(NSDictionary *)v8->mKPFDictionary objectForKey:@"slideHeight"];
    v8->mSlideWidth = (NSNumber *)[(NSDictionary *)v8->mKPFDictionary objectForKey:@"slideWidth"];
  }
  return v8;
}

- (void)dealloc
{
  self->mKPFBundle = 0;
  self->mSlideList = 0;

  self->mSlidesDictionary = 0;
  v3.receiver = self;
  v3.super_class = (Class)KPFGingerDocument;
  [(KPFGingerDocument *)&v3 dealloc];
}

- (NSString)soundtrackPath
{
  mSoundtrackDict = self->mSoundtrackDict;
  if (!mSoundtrackDict) {
    return 0;
  }
  id v4 = [(NSDictionary *)mSoundtrackDict objectForKey:@"tracks"];
  if (!v4) {
    return 0;
  }
  v5 = v4;
  v6 = [(KPFGingerDocument *)self documentPath];
  id v7 = [v5 objectAtIndex:0];

  return [(NSString *)v6 stringByAppendingPathComponent:v7];
}

- (double)soundtrackVolume
{
  mSoundtrackDict = self->mSoundtrackDict;
  if (!mSoundtrackDict) {
    return 0.0;
  }
  [mSoundtrackDict objectForKey:@"volume"] floatValue;
  return v3;
}

- (unint64_t)soundtrackMode
{
  unint64_t result = (unint64_t)self->mSoundtrackDict;
  if (result)
  {
    id v3 = [(id)result objectForKey:@"mode"];
    return (unint64_t)[v3 unsignedIntegerValue];
  }
  return result;
}

- (CGSize)showSize
{
  mSlideWidth = self->mSlideWidth;
  if (mSlideWidth && self->mSlideHeight)
  {
    [(NSNumber *)mSlideWidth floatValue];
    double v5 = v4;
    [(NSNumber *)self->mSlideHeight floatValue];
    double v7 = v6;
  }
  else
  {
    double v5 = 0.0;
    double v7 = 0.0;
  }
  double v8 = v5;
  result.height = v7;
  result.width = v8;
  return result;
}

- (NSMutableDictionary)slidesDictionary
{
  if (self->mSlidesDictionary) {
    return self->mSlidesDictionary;
  }
  self->mSlidesDictionary = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  mSlideList = self->mSlideList;
  id v5 = [(NSArray *)mSlideList countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v5) {
    return self->mSlidesDictionary;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v15;
LABEL_6:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v15 != v7) {
      objc_enumerationMutation(mSlideList);
    }
    uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * v8);
    CGSize result = [(NSBundle *)self->mKPFBundle pathForResource:&stru_46D7E8 ofType:@"json" inDirectory:v9];
    if (!result) {
      return result;
    }
    v10 = result;
    mDrmContext = self->mDrmContext;
    if (mDrmContext) {
      v12 = [(PFDContext *)mDrmContext dataWithContentsOfFile:v10 error:0];
    }
    else {
      v12 = +[NSData dataWithContentsOfFile:v10];
    }
    if (!v12) {
      return 0;
    }
    CGSize result = (NSMutableDictionary *)+[NSJSONSerialization JSONObjectWithData:v12 options:0 error:0];
    if (!result) {
      return result;
    }
    v13 = result;
    [(NSMutableDictionary *)self->mSlidesDictionary setObject:result forKey:v9];

    if (v6 == (id)++v8)
    {
      id v6 = [(NSArray *)mSlideList countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        goto LABEL_6;
      }
      return self->mSlidesDictionary;
    }
  }
}

- (NSString)documentPath
{
  CGSize result = (NSString *)&self->mKPFBundle->super.isa;
  if (result) {
    return (NSString *)[(NSString *)result bundlePath];
  }
  return result;
}

- (BOOL)isLegacy
{
  return self->isLegacy;
}

- (void)setIsLegacy:(BOOL)a3
{
  self->isLegacy = a3;
}

- (BOOL)isLooping
{
  return self->mIsLooping;
}

- (NSArray)slideList
{
  return self->mSlideList;
}

- (PFDContext)drmContext
{
  return self->mDrmContext;
}

@end