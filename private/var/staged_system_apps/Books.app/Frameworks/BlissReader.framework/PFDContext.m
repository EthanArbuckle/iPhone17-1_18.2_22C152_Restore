@interface PFDContext
+ (BOOL)isBagRefetchRequiredForStatus:(int64_t)a3;
+ (void)Xj3eVHDeBoTD6fVn6fY8:(id)a3 completion:(id)a4;
- (BOOL)authorizeAVAssetForPlayback:(id)a3;
- (BOOL)authorizeAVPlayerItemForPlayback:(id)a3;
- (BOOL)kiUanAfQBD5qIUraolUj;
- (BOOL)p_canDecryptFileAtURL:(id)a3;
- (BOOL)p_isFamilyDeauthorizedError:(id)a3;
- (CGImageSource)newImageSourceWithContentsOfFile:(id)a3 error:(id *)a4;
- (CGImageSource)newImageSourceWithContentsOfURL:(id)a3 error:(id *)a4;
- (NSArray)fontObfuscation;
- (PFDContext)initWithRoot:(id)a3 pVwXvin61ocxeAjqxjwz:(id)a4 andRights:(id)a5;
- (id)ABBin6XnCd5TmAcWQlyb:(id)a3 error:(id *)a4;
- (id)MNdKOWwPKnL43Vwwhvrd;
- (id)agSuxzs6g5UyvRU64xGP:(id)a3 error:(id *)a4;
- (id)dataRepresentationForEntryName:(id)a3 error:(id *)a4;
- (id)dataRepresentationForFile:(id)a3 error:(id *)a4;
- (id)dataWithContentsOfFile:(id)a3 error:(id *)a4;
- (id)dataWithContentsOfURL:(id)a3 error:(id *)a4;
- (id)p_entryNameForPath:(id)a3;
- (id)p_sinfForEntryWithName:(id)a3;
- (void)dealloc;
- (void)teardown;
@end

@implementation PFDContext

- (PFDContext)initWithRoot:(id)a3 pVwXvin61ocxeAjqxjwz:(id)a4 andRights:(id)a5
{
  v26.receiver = self;
  v26.super_class = (Class)PFDContext;
  v8 = [(PFDContext *)&v26 init];
  if (v8)
  {
    v8->mRoot = (NSString *)[a3 stringByStandardizingPath];
    v8->mRights = (NSDictionary *)a5;
    objc_opt_class();
    [a4 objectForKey:PFDEpubEncryptionParserEncryptionInfoKey];
    v8->mEncryption = (NSDictionary *)(id)TSUDynamicCast();
    objc_opt_class();
    [a4 objectForKey:PFDEpubEncryptionParserFontObfuscationInfoKey];
    v8->mFontObfuscation = (NSArray *)(id)TSUDynamicCast();
    objc_opt_class();
    [a4 objectForKey:PFDEpubEncryptionParserFairplayInfoKey];
    v8->mFairplay = (NSDictionary *)(id)TSUDynamicCast();
    v8->mSessions = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v8->mSessionsLock._os_unfair_lock_opaque = 0;
    NSUInteger v9 = [(NSDictionary *)v8->mFairplay count];
    NSUInteger v10 = [(NSDictionary *)v8->mRights count];
    if (v10 && v9)
    {
      v11 = (char *)malloc_type_calloc(v10, 0x20uLL, 0x1050040E8CD93FDuLL);
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      v12 = [(NSDictionary *)v8->mRights allValues];
      id v13 = [(NSArray *)v12 countByEnumeratingWithState:&v22 objects:v29 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = 0;
        uint64_t v16 = *(void *)v23;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v23 != v16) {
              objc_enumerationMutation(v12);
            }
            v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            if (v18)
            {
              v19 = &v11[32 * v15];
              *(_DWORD *)v19 = [*(id *)(*((void *)&v22 + 1) + 8 * i) length];
              *((void *)v19 + 1) = [v18 bytes];
              *((_DWORD *)v19 + 4) = 0;
              *((void *)v19 + 3) = 0;
              ++v15;
            }
          }
          id v14 = [(NSArray *)v12 countByEnumeratingWithState:&v22 objects:v29 count:16];
        }
        while (v14);
      }
      int v20 = afa946271209074f393f();
      if (v20) {
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFDContext initWithRoot:pVwXvin61ocxeAjqxjwz:andRights:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/DRM/PFDContext.mm") lineNumber:111 description:@"Init failed: %ld" v20];
      }
      free(v11);
    }
    if (qword_5737D8 != -1) {
      dispatch_once(&qword_5737D8, &stru_45C2E0);
    }
    os_unfair_lock_lock((os_unfair_lock_t)&dword_5737E8);
    [(id)qword_5737E0 addObject:v8];
    if ([(id)qword_5737E0 count] == (char *)&dword_0 + 1)
    {
      v27 = sub_22A4AC;
      v28 = sub_22A4CC;
      C3DSetFileDecryptionCallbacks();
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&dword_5737E8);
  }
  return v8;
}

- (void)dealloc
{
  [(PFDContext *)self teardown];
  v3.receiver = self;
  v3.super_class = (Class)PFDContext;
  [(PFDContext *)&v3 dealloc];
}

- (void)teardown
{
  if (self->mFPContext)
  {
    int v3 = c12668d1789a8d63d19a();
    if (v3) {
      [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[PFDContext teardown]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/DRM/PFDContext.mm"] lineNumber:135 description:@"Destroy failed: %ld" v3];
    }
    self->mFPContext = 0;
  }

  self->mRoot = 0;
  self->mFairplay = 0;

  self->mEncryption = 0;
  self->mRights = 0;

  self->mFontObfuscation = 0;
  os_unfair_lock_lock(&self->mSessionsLock);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  mSessions = self->mSessions;
  id v5 = [(NSMutableDictionary *)mSessions countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(mSessions);
        }
        [self->mSessions objectForKey:[v9 objectForKey:EXC6L9VofSI7ZuGjFga5qXiB]];
      }
      id v6 = [(NSMutableDictionary *)mSessions countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  self->mSessions = 0;
  os_unfair_lock_unlock(&self->mSessionsLock);
  os_unfair_lock_lock((os_unfair_lock_t)&dword_5737E8);
  [(id)qword_5737E0 removeObject:self];
  if (![(id)qword_5737E0 count]) {
    C3DSetFileDecryptionCallbacks();
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_5737E8);
}

- (BOOL)kiUanAfQBD5qIUraolUj
{
  return self->mFairplay && self->mRights != 0;
}

- (id)dataWithContentsOfFile:(id)a3 error:(id *)a4
{
  id v6 = [a3 stringByStandardizingPath];
  id v7 = +[NSMutableData data];
  [self dataRepresentationForFile:v6 error:a4].readIntoData:v7
  return v7;
}

- (id)dataWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v6 = [a3 path];

  return [(PFDContext *)self dataWithContentsOfFile:v6 error:a4];
}

- (id)dataRepresentationForEntryName:(id)a3 error:(id *)a4
{
  id v6 = [(NSString *)self->mRoot stringByAppendingPathComponent:a3];

  return [(PFDContext *)self dataRepresentationForFile:v6 error:a4];
}

- (BOOL)p_isFamilyDeauthorizedError:(id)a3
{
  id v4 = [a3 domain];
  unint64_t v5 = (unint64_t)[a3 code];
  unsigned int v6 = [v4 isEqualToString:@"ibookserrors"];
  BOOL v8 = v5 == -42597 || v5 >> 1 == 0x7FFFFFFFFFFFACCELL;
  return v6 && v8;
}

- (id)dataRepresentationForFile:(id)a3 error:(id *)a4
{
  id v6 = [a3 stringByStandardizingPath];
  long long v10 = 0;
  id v7 = [(PFDContext *)self agSuxzs6g5UyvRU64xGP:v6 error:&v10];
  if (v7)
  {
    BOOL v8 = [[PFDFileDataRepresentation alloc] initWithPath:v6 J00oNrNGGvbpr5VY2bUB:v7];
    goto LABEL_7;
  }
  if (![(PFDContext *)self p_isFamilyDeauthorizedError:v10])
  {
    BOOL v8 = (PFDFileDataRepresentation *)[objc_alloc((Class)SFUFileDataRepresentation) initWithPath:v6];
LABEL_7:
    id result = v8;
    if (!a4) {
      return result;
    }
    goto LABEL_8;
  }
  id result = 0;
  if (a4) {
LABEL_8:
  }
    *a4 = v10;
  return result;
}

- (CGImageSource)newImageSourceWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v6 = [a3 path];

  return [(PFDContext *)self newImageSourceWithContentsOfFile:v6 error:a4];
}

- (CGImageSource)newImageSourceWithContentsOfFile:(id)a3 error:(id *)a4
{
  id result = [self dataRepresentationForFile:a3 error:a4].cgDataProvider;
  if (result)
  {
    unint64_t v5 = result;
    id v6 = CGImageSourceCreateWithDataProvider(result, 0);
    CGDataProviderRelease(v5);
    return v6;
  }
  return result;
}

- (id)ABBin6XnCd5TmAcWQlyb:(id)a3 error:(id *)a4
{
  id v6 = [(PFDContext *)self p_sinfForEntryWithName:a3];
  if (!v6) {
    return 0;
  }
  id v7 = v6;
  os_unfair_lock_lock(&self->mSessionsLock);
  BOOL v8 = (BuLr3rwnVU31zt9OioJ56 *)[(NSMutableDictionary *)self->mSessions objectForKey:v7];
  if (!v8)
  {
    long long v10 = objc_alloc_init(BuLr3rwnVU31zt9OioJ56);
    BOOL v8 = v10;
    if (v10)
    {
      id v11 = [(BuLr3rwnVU31zt9OioJ56 *)v10 setupWithSinfData:v7];
      if (v11)
      {
        BOOL v8 = 0;
        if (a4) {
          *a4 = v11;
        }
      }
      else
      {
        [(NSMutableDictionary *)self->mSessions setObject:v8 forKey:v7];
      }
    }
  }
  os_unfair_lock_unlock(&self->mSessionsLock);
  return v8;
}

- (id)agSuxzs6g5UyvRU64xGP:(id)a3 error:(id *)a4
{
  id result = [(PFDContext *)self p_entryNameForPath:a3];
  if (result)
  {
    return [(PFDContext *)self ABBin6XnCd5TmAcWQlyb:result error:a4];
  }
  return result;
}

- (BOOL)authorizeAVAssetForPlayback:(id)a3
{
  id v4 = +[AVPlayerItem playerItemWithAsset:a3];

  return [(PFDContext *)self authorizeAVPlayerItemForPlayback:v4];
}

- (BOOL)authorizeAVPlayerItemForPlayback:(id)a3
{
  return 1;
}

- (BOOL)p_canDecryptFileAtURL:(id)a3
{
  id v4 = objc_msgSend(objc_msgSend(a3, "URLByStandardizingPath"), "path");
  if (self->mRoot)
  {
    id v5 = v4;
    unsigned int v6 = [v4 hasPrefix:];
    if (v6) {
      LOBYTE(v6) = [(PFDContext *)self p_sinfForEntryWithName:[(PFDContext *)self p_entryNameForPath:v5]] != 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (id)p_entryNameForPath:(id)a3
{
  id v4 = [a3 stringByStandardizingPath];
  if (!self->mRoot) {
    return 0;
  }
  id v5 = v4;
  if (!objc_msgSend(v4, "hasPrefix:")) {
    return 0;
  }
  NSUInteger v6 = [(NSString *)self->mRoot length];

  return [v5 substringFromIndex:v6];
}

- (id)p_sinfForEntryWithName:(id)a3
{
  id v3 = a3;
  if ([a3 hasPrefix:@"/"]) {
    id v3 = [v3 substringFromIndex:1];
  }
  objc_sync_enter(self);
  id v5 = [(NSDictionary *)self->mFairplay objectForKey:v3];
  if (v5) {
    id v6 = [(NSDictionary *)self->mRights objectForKey:v5];
  }
  else {
    id v6 = 0;
  }
  objc_sync_exit(self);
  if (v5) {
    return v6;
  }
  else {
    return 0;
  }
}

- (id)MNdKOWwPKnL43Vwwhvrd
{
  objc_sync_enter(self);
  memset(v6, 0, sizeof(v6));
  if ([(NSDictionary *)self->mFairplay countByEnumeratingWithState:v6 objects:v7 count:16]&& (id v3 = [(NSDictionary *)self->mFairplay objectForKey:**((void **)&v6[0] + 1)]) != 0)
  {
    id v4 = [(NSDictionary *)self->mRights objectForKey:v3];
  }
  else
  {
    id v4 = 0;
  }
  objc_sync_exit(self);
  return v4;
}

+ (void)Xj3eVHDeBoTD6fVn6fY8:(id)a3 completion:(id)a4
{
}

+ (BOOL)isBagRefetchRequiredForStatus:(int64_t)a3
{
  return +[BuLr3rwnVU31zt9OioJ56 XNRYWdSZWZldGNoUmxdWlyWQ:a3];
}

- (NSArray)fontObfuscation
{
  return self->mFontObfuscation;
}

@end