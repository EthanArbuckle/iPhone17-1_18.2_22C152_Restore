@interface MCMontage
- (MCMontage)init;
- (MCMontage)initWithData:(id)a3 error:(id *)a4;
- (MCPlug)rootPlug;
- (NSArray)layouts;
- (NSString)basePath;
- (double)audioFadeOutDuration;
- (double)fadeInDuration;
- (double)fadeOutDuration;
- (id)assetForObjectID:(id)a3;
- (id)assets;
- (id)audioAssetForFileAtPath:(id)a3;
- (id)audioAssetForObjectID:(id)a3;
- (id)audioAssets;
- (id)containerForObjectID:(id)a3;
- (id)createEffectContainer;
- (id)createNavigatorContainer;
- (id)createParallelizerContainer;
- (id)createSerializerContainer;
- (id)data;
- (id)imprint;
- (id)initFromScratch;
- (id)videoAssetForFileAtPath:(id)a3;
- (id)videoAssetForObjectID:(id)a3;
- (id)videoAssets;
- (unint64_t)uuidSeed;
- (unsigned)styleHint;
- (void)dealloc;
- (void)demolish;
- (void)forgetAboutContainer:(id)a3;
- (void)lock;
- (void)registerContainer:(id)a3;
- (void)setAudioFadeOutDuration:(double)a3;
- (void)setBasePath:(id)a3;
- (void)setFadeInDuration:(double)a3;
- (void)setFadeOutDuration:(double)a3;
- (void)setLayouts:(id)a3;
- (void)setStyleHint:(unsigned __int8)a3;
- (void)unlock;
@end

@implementation MCMontage

- (MCMontage)init
{
  v5.receiver = self;
  v5.super_class = (Class)MCMontage;
  v2 = [(MCMontage *)&v5 init];
  if (v2)
  {
    v2->mVideoAssetsForFilePaths = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->mVideoAssetsForObjectIDs = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->mAudioAssetsForFilePaths = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->mAudioAssetsForObjectIDs = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->mContainersForObjectIDs = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v3 = (NSRecursiveLock *)objc_alloc_init((Class)NSRecursiveLock);
    v2->mLock = v3;
    [(NSRecursiveLock *)v3 setName:@"MCMontage.lock"];
  }
  return v2;
}

- (id)initFromScratch
{
  v2 = [(MCMontage *)self init];
  if (v2)
  {
    v2->mRootPlug = (MCPlug *)[(MCObject *)[MCPlug alloc] initFromScratchWithMontage:v2];
    [(MCPlug *)v2->mRootPlug setContainer:[(MCMontage *)v2 createParallelizerContainer]];
  }
  return v2;
}

- (MCMontage)initWithData:(id)a3 error:(id *)a4
{
  v6 = [(MCMontage *)self init];
  if (v6)
  {
    v7 = v6;
    v8 = +[NSPropertyListSerialization propertyListWithData:a3 options:0 format:0 error:a4];
    v7->mImprintWhileLoading = v8;
    if (v8)
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id obj = [(NSDictionary *)v8 objectForKey:@"videoAssets"];
      id v9 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v33;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v33 != v11) {
              objc_enumerationMutation(obj);
            }
            v13 = +[MCObject objectWithImprint:*(void *)(*((void *)&v32 + 1) + 8 * i) andMontage:v7];
            v14 = [+[NSBundle mainBundle] pathForResource:@"Assets" ofType:0];
            if (dword_1EFE48 <= 34) {
              uint64_t v15 = (dword_1EFE48 + 1);
            }
            else {
              uint64_t v15 = 1;
            }
            dword_1EFE48 = v15;
            if ((int)v15 >= 10) {
              CFStringRef v16 = @"LARGE_PIC_%d.jpg";
            }
            else {
              CFStringRef v16 = @"LARGE_PIC_0%d.jpg";
            }
            [(MCObject *)v13 setPath:[(NSString *)v14 stringByAppendingPathComponent:+[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v15)]];
            [(NSMutableDictionary *)v7->mVideoAssetsForFilePaths setObject:v13 forKey:[(MCObject *)v13 path]];
            [(NSMutableDictionary *)v7->mVideoAssetsForObjectIDs setObject:v13 forKey:[(MCObject *)v13 objectID]];
          }
          id v10 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
        }
        while (v10);
      }
      id v17 = [(NSDictionary *)v7->mImprintWhileLoading objectForKey:@"audioAssets"];
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v18 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v29;
        do
        {
          for (j = 0; j != v19; j = (char *)j + 1)
          {
            if (*(void *)v29 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = +[MCObject objectWithImprint:*(void *)(*((void *)&v28 + 1) + 8 * (void)j) andMontage:v7];
            [(NSMutableDictionary *)v7->mAudioAssetsForFilePaths setObject:v22 forKey:[(MCObject *)v22 path]];
            [(NSMutableDictionary *)v7->mAudioAssetsForObjectIDs setObject:v22 forKey:[(MCObject *)v22 objectID]];
          }
          id v19 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
        }
        while (v19);
      }
      v7->mRootPlug = (MCPlug *)+[MCObject objectWithImprint:[(NSDictionary *)v7->mImprintWhileLoading objectForKey:@"rootPlug"] andMontage:v7];
      objc_msgSend(-[NSDictionary objectForKey:](v7->mImprintWhileLoading, "objectForKey:", @"fadeInDuration"), "doubleValue");
      v7->mFadeInDuration = v23;
      objc_msgSend(-[NSDictionary objectForKey:](v7->mImprintWhileLoading, "objectForKey:", @"fadeOutDuration"), "doubleValue");
      v7->mFadeOutDuration = v24;
      objc_msgSend(-[NSDictionary objectForKey:](v7->mImprintWhileLoading, "objectForKey:", @"audioFadeOutDuration"), "doubleValue");
      v7->mAudioFadeOutDuration = v25;
      v7->mUUIDSeed = (unint64_t)objc_msgSend(-[NSDictionary objectForKey:](v7->mImprintWhileLoading, "objectForKey:", @"uuidSeed"), "unsignedIntegerValue");
      v7->_styleHint = objc_msgSend(-[NSDictionary objectForKey:](v7->mImprintWhileLoading, "objectForKey:", @"styleHint"), "intValue");
      v7->mImprintWhileLoading = 0;
    }
    if (!v7->mRootPlug) {
  }
    }
  return 0;
}

- (void)dealloc
{
  if (self->mRootPlug) {
    [(MCMontage *)self demolish];
  }

  self->mLock = 0;
  v3.receiver = self;
  v3.super_class = (Class)MCMontage;
  [(MCMontage *)&v3 dealloc];
}

- (void)demolish
{
  [(MCPlug *)self->mRootPlug demolish];
  [(MCMontage *)self willChangeValueForKey:@"rootPlug"];

  self->mRootPlug = 0;
  [(MCMontage *)self didChangeValueForKey:@"rootPlug"];

  self->mRootPlug = 0;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  mVideoAssetsForObjectIDs = self->mVideoAssetsForObjectIDs;
  id v5 = [(NSMutableDictionary *)mVideoAssetsForObjectIDs countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v26;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(mVideoAssetsForObjectIDs);
        }
        objc_msgSend(-[NSMutableDictionary objectForKey:](self->mVideoAssetsForObjectIDs, "objectForKey:", *(void *)(*((void *)&v25 + 1) + 8 * i)), "demolish");
      }
      id v5 = [(NSMutableDictionary *)mVideoAssetsForObjectIDs countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v5);
  }

  self->mVideoAssetsForFilePaths = 0;
  self->mVideoAssetsForObjectIDs = 0;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  mAudioAssetsForObjectIDs = self->mAudioAssetsForObjectIDs;
  id v9 = [(NSMutableDictionary *)mAudioAssetsForObjectIDs countByEnumeratingWithState:&v21 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v22;
    do
    {
      for (j = 0; j != v9; j = (char *)j + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(mAudioAssetsForObjectIDs);
        }
        objc_msgSend(-[NSMutableDictionary objectForKey:](self->mAudioAssetsForObjectIDs, "objectForKey:", *(void *)(*((void *)&v21 + 1) + 8 * (void)j)), "demolish");
      }
      id v9 = [(NSMutableDictionary *)mAudioAssetsForObjectIDs countByEnumeratingWithState:&v21 objects:v30 count:16];
    }
    while (v9);
  }

  self->mAudioAssetsForFilePaths = 0;
  self->mAudioAssetsForObjectIDs = 0;
  mContainersForObjectIDs = self->mContainersForObjectIDs;
  objc_sync_enter(mContainersForObjectIDs);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v13 = [(NSMutableDictionary *)self->mContainersForObjectIDs allKeys];
  id v14 = [v13 countByEnumeratingWithState:&v17 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v18;
    do
    {
      for (k = 0; k != v14; k = (char *)k + 1)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(-[NSMutableDictionary objectForKey:](self->mContainersForObjectIDs, "objectForKey:", *(void *)(*((void *)&v17 + 1) + 8 * (void)k)), "demolish");
      }
      id v14 = [v13 countByEnumeratingWithState:&v17 objects:v29 count:16];
    }
    while (v14);
  }

  self->mContainersForObjectIDs = 0;
  objc_sync_exit(mContainersForObjectIDs);
}

- (id)imprint
{
  id v3 = +[NSMutableDictionary dictionary];
  objc_msgSend(v3, "setObject:forKey:", -[MCPlug imprint](self->mRootPlug, "imprint"), @"rootPlug");
  id v4 = +[NSMutableArray array];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v5 = [(NSMutableDictionary *)self->mVideoAssetsForObjectIDs objectEnumerator];
  id v6 = [v5 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v33;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if ([v9 isInUse]) {
          objc_msgSend(v4, "addObject:", objc_msgSend(v9, "imprint"));
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v6);
  }
  [v3 setObject:v4 forKey:@"videoAssets"];
  id v10 = +[NSMutableArray array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v11 = [(NSMutableDictionary *)self->mAudioAssetsForObjectIDs objectEnumerator];
  id v12 = [v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v29;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void **)(*((void *)&v28 + 1) + 8 * (void)j);
        if ([v15 isInUse]) {
          objc_msgSend(v10, "addObject:", objc_msgSend(v15, "imprint"));
        }
      }
      id v12 = [v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v12);
  }
  [v3 setObject:v10 forKey:@"audioAssets"];
  mContainersForObjectIDs = self->mContainersForObjectIDs;
  objc_sync_enter(mContainersForObjectIDs);
  id v17 = +[NSMutableDictionary dictionary];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v18 = [(NSMutableDictionary *)self->mContainersForObjectIDs objectEnumerator];
  id v19 = [v18 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v25;
    do
    {
      for (k = 0; k != v19; k = (char *)k + 1)
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v18);
        }
        long long v22 = *(void **)(*((void *)&v24 + 1) + 8 * (void)k);
        if ([v22 referencingPlug]) {
          objc_msgSend(v17, "setObject:forKey:", objc_msgSend(v22, "imprint"), objc_msgSend(v22, "objectID"));
        }
      }
      id v19 = [v18 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v19);
  }
  [v3 setObject:v17 forKey:@"containers"];
  objc_sync_exit(mContainersForObjectIDs);
  if (self->mFadeInDuration > 0.0) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"fadeInDuration");
  }
  if (self->mFadeOutDuration > 0.0) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"fadeOutDuration");
  }
  if (self->mAudioFadeOutDuration > 0.0) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"audioFadeOutDuration");
  }
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->mUUIDSeed), @"uuidSeed");
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_styleHint), @"styleHint");
  return v3;
}

- (id)data
{
  uint64_t v4 = 0;
  v2 = +[NSPropertyListSerialization dataWithPropertyList:[(MCMontage *)self imprint] format:200 options:0 error:&v4];
  if (!v2) {
    NSLog(@"Error converting MCMontage imprint to NSData, '%@'\n", v4);
  }
  return v2;
}

- (void)lock
{
}

- (void)unlock
{
}

- (unint64_t)uuidSeed
{
  unint64_t v2 = self->mUUIDSeed + 1;
  self->mUUIDSeed = v2;
  return v2;
}

- (id)createSerializerContainer
{
  id v3 = [(MCObject *)[MCContainerSerializer alloc] initFromScratchWithMontage:self];
  mContainersForObjectIDs = self->mContainersForObjectIDs;
  objc_sync_enter(mContainersForObjectIDs);
  -[NSMutableDictionary setObject:forKey:](self->mContainersForObjectIDs, "setObject:forKey:", v3, [v3 objectID]);
  objc_sync_exit(mContainersForObjectIDs);
  return v3;
}

- (id)createParallelizerContainer
{
  id v3 = [(MCObject *)[MCContainerParallelizer alloc] initFromScratchWithMontage:self];
  mContainersForObjectIDs = self->mContainersForObjectIDs;
  objc_sync_enter(mContainersForObjectIDs);
  -[NSMutableDictionary setObject:forKey:](self->mContainersForObjectIDs, "setObject:forKey:", v3, [v3 objectID]);
  objc_sync_exit(mContainersForObjectIDs);
  return v3;
}

- (id)createEffectContainer
{
  id v3 = [(MCObject *)[MCContainerEffect alloc] initFromScratchWithMontage:self];
  mContainersForObjectIDs = self->mContainersForObjectIDs;
  objc_sync_enter(mContainersForObjectIDs);
  -[NSMutableDictionary setObject:forKey:](self->mContainersForObjectIDs, "setObject:forKey:", v3, [v3 objectID]);
  objc_sync_exit(mContainersForObjectIDs);
  return v3;
}

- (id)createNavigatorContainer
{
  id v3 = [(MCObject *)[MCContainerNavigator alloc] initFromScratchWithMontage:self];
  mContainersForObjectIDs = self->mContainersForObjectIDs;
  objc_sync_enter(mContainersForObjectIDs);
  -[NSMutableDictionary setObject:forKey:](self->mContainersForObjectIDs, "setObject:forKey:", v3, [v3 objectID]);
  objc_sync_exit(mContainersForObjectIDs);
  return v3;
}

- (id)videoAssetForFileAtPath:(id)a3
{
  if (a3) {
    CFStringRef v5 = (const __CFString *)a3;
  }
  else {
    CFStringRef v5 = @"DummyVideoAsset";
  }
  mVideoAssetsForFilePaths = self->mVideoAssetsForFilePaths;
  objc_sync_enter(mVideoAssetsForFilePaths);
  id v7 = [(NSMutableDictionary *)self->mVideoAssetsForFilePaths objectForKey:v5];
  if (!v7)
  {
    id v7 = [(MCObject *)[MCAssetVideo alloc] initFromScratchWithMontage:self];
    [v7 setPath:a3];
    [(NSMutableDictionary *)self->mVideoAssetsForFilePaths setObject:v7 forKey:v5];
    -[NSMutableDictionary setObject:forKey:](self->mVideoAssetsForObjectIDs, "setObject:forKey:", v7, [v7 objectID]);
  }
  objc_sync_exit(mVideoAssetsForFilePaths);
  return v7;
}

- (id)audioAssetForFileAtPath:(id)a3
{
  if (a3) {
    CFStringRef v5 = (const __CFString *)a3;
  }
  else {
    CFStringRef v5 = @"DummyAudioAsset";
  }
  mAudioAssetsForFilePaths = self->mAudioAssetsForFilePaths;
  objc_sync_enter(mAudioAssetsForFilePaths);
  id v7 = [(NSMutableDictionary *)self->mAudioAssetsForFilePaths objectForKey:v5];
  if (!v7)
  {
    id v7 = [(MCObject *)[MCAssetAudio alloc] initFromScratchWithMontage:self];
    [v7 setPath:a3];
    [(NSMutableDictionary *)self->mAudioAssetsForFilePaths setObject:v7 forKey:v5];
    -[NSMutableDictionary setObject:forKey:](self->mAudioAssetsForObjectIDs, "setObject:forKey:", v7, [v7 objectID]);
  }
  objc_sync_exit(mAudioAssetsForFilePaths);
  return v7;
}

- (id)assetForObjectID:(id)a3
{
  id result = -[MCMontage videoAssetForObjectID:](self, "videoAssetForObjectID:");
  if (!result)
  {
    return [(MCMontage *)self audioAssetForObjectID:a3];
  }
  return result;
}

- (id)videoAssetForObjectID:(id)a3
{
  return [(NSMutableDictionary *)self->mVideoAssetsForObjectIDs objectForKey:a3];
}

- (id)audioAssetForObjectID:(id)a3
{
  return [(NSMutableDictionary *)self->mAudioAssetsForObjectIDs objectForKey:a3];
}

- (id)assets
{
  id v3 = +[NSMutableArray array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  mVideoAssetsForFilePaths = self->mVideoAssetsForFilePaths;
  id v5 = [(NSMutableDictionary *)mVideoAssetsForFilePaths countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(mVideoAssetsForFilePaths);
        }
        id v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v10 = [(NSMutableDictionary *)self->mVideoAssetsForFilePaths objectForKey:v9];
        if (([v9 isEqualToString:@"DummyVideoAsset"] & 1) == 0
          && [v10 isInUse])
        {
          [v3 addObject:v10];
        }
      }
      id v6 = [(NSMutableDictionary *)mVideoAssetsForFilePaths countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v6);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  mAudioAssetsForFilePaths = self->mAudioAssetsForFilePaths;
  id v12 = [(NSMutableDictionary *)mAudioAssetsForFilePaths countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(mAudioAssetsForFilePaths);
        }
        CFStringRef v16 = *(void **)(*((void *)&v19 + 1) + 8 * (void)j);
        id v17 = [(NSMutableDictionary *)self->mAudioAssetsForFilePaths objectForKey:v16];
        if (([v16 isEqualToString:@"DummyVideoAsset"] & 1) == 0
          && [v17 isInUse])
        {
          [v3 addObject:v17];
        }
      }
      id v13 = [(NSMutableDictionary *)mAudioAssetsForFilePaths countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v13);
  }
  return v3;
}

- (id)videoAssets
{
  id v3 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  mVideoAssetsForFilePaths = self->mVideoAssetsForFilePaths;
  id v5 = [(NSMutableDictionary *)mVideoAssetsForFilePaths countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(mVideoAssetsForFilePaths);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v10 = [(NSMutableDictionary *)self->mVideoAssetsForFilePaths objectForKey:v9];
        if (([v9 isEqualToString:@"DummyVideoAsset"] & 1) == 0
          && [v10 isInUse])
        {
          [v3 addObject:v10];
        }
      }
      id v6 = [(NSMutableDictionary *)mVideoAssetsForFilePaths countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)audioAssets
{
  id v3 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  mAudioAssetsForFilePaths = self->mAudioAssetsForFilePaths;
  id v5 = [(NSMutableDictionary *)mAudioAssetsForFilePaths countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(mAudioAssetsForFilePaths);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v10 = [(NSMutableDictionary *)self->mAudioAssetsForFilePaths objectForKey:v9];
        if (([v9 isEqualToString:@"DummyVideoAsset"] & 1) == 0
          && [v10 isInUse])
        {
          [v3 addObject:v10];
        }
      }
      id v6 = [(NSMutableDictionary *)mAudioAssetsForFilePaths countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)containerForObjectID:(id)a3
{
  mContainersForObjectIDs = self->mContainersForObjectIDs;
  objc_sync_enter(mContainersForObjectIDs);
  id v6 = (MCObject *)[(NSMutableDictionary *)self->mContainersForObjectIDs objectForKey:a3];
  if (!v6)
  {
    mImprintWhileLoading = self->mImprintWhileLoading;
    if (mImprintWhileLoading
      && (id v8 = objc_msgSend(-[NSDictionary objectForKey:](mImprintWhileLoading, "objectForKey:", @"containers"), "objectForKey:", a3)) != 0)
    {
      id v6 = +[MCObject objectWithImprint:v8 andMontage:self];
      [(NSMutableDictionary *)self->mContainersForObjectIDs setObject:v6 forKey:[(MCObject *)v6 objectID]];
    }
    else
    {
      id v6 = 0;
    }
  }
  id v9 = v6;
  objc_sync_exit(mContainersForObjectIDs);
  return v6;
}

- (void)registerContainer:(id)a3
{
  mContainersForObjectIDs = self->mContainersForObjectIDs;
  objc_sync_enter(mContainersForObjectIDs);
  -[NSMutableDictionary setObject:forKey:](self->mContainersForObjectIDs, "setObject:forKey:", a3, [a3 objectID]);
  objc_sync_exit(mContainersForObjectIDs);
}

- (void)forgetAboutContainer:(id)a3
{
  mContainersForObjectIDs = self->mContainersForObjectIDs;
  objc_sync_enter(mContainersForObjectIDs);
  -[NSMutableDictionary removeObjectForKey:](self->mContainersForObjectIDs, "removeObjectForKey:", [a3 objectID]);
  objc_sync_exit(mContainersForObjectIDs);
}

- (MCPlug)rootPlug
{
  return self->mRootPlug;
}

- (double)fadeInDuration
{
  return self->mFadeInDuration;
}

- (void)setFadeInDuration:(double)a3
{
  self->mFadeInDuration = a3;
}

- (double)fadeOutDuration
{
  return self->mFadeOutDuration;
}

- (void)setFadeOutDuration:(double)a3
{
  self->mFadeOutDuration = a3;
}

- (double)audioFadeOutDuration
{
  return self->mAudioFadeOutDuration;
}

- (void)setAudioFadeOutDuration:(double)a3
{
  self->mAudioFadeOutDuration = a3;
}

- (NSString)basePath
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setBasePath:(id)a3
{
}

- (NSArray)layouts
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setLayouts:(id)a3
{
}

- (unsigned)styleHint
{
  return self->_styleHint;
}

- (void)setStyleHint:(unsigned __int8)a3
{
  self->_styleHint = a3;
}

@end