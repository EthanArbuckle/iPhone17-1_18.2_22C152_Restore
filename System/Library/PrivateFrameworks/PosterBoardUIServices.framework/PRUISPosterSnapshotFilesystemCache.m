@interface PRUISPosterSnapshotFilesystemCache
+ (id)_defaultCacheLocationURL;
+ (id)incomingCallSnapshotCache;
- (BOOL)cacheSnapshotBundle:(id)a3 forRequest:(id)a4;
- (BOOL)cacheSnapshotBundle:(id)a3 forRequest:(id)a4 completion:(id)a5;
- (BOOL)checkCacheIsReachable:(id *)a3;
- (NSURL)cacheURL;
- (PRUISPosterSnapshotFilesystemCache)initWithURL:(id)a3;
- (PUIPosterSnapshotFilesystemCache)underlyingCache;
- (id)latestSnapshotBundleForRequest:(id)a3 error:(id *)a4;
- (id)puirequestForPRUISRequest:(id)a3 error:(id *)a4;
- (void)cleanup;
- (void)discardSnapshotsForPostersMatchingPredicate:(id)a3;
- (void)invalidate;
@end

@implementation PRUISPosterSnapshotFilesystemCache

- (PRUISPosterSnapshotFilesystemCache)initWithURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRUISPosterSnapshotFilesystemCache;
  v5 = [(PRUISPosterSnapshotFilesystemCache *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F5F5B8]) initWithURL:v4];
    underlyingCache = v5->_underlyingCache;
    v5->_underlyingCache = (PUIPosterSnapshotFilesystemCache *)v6;
  }
  return v5;
}

- (BOOL)checkCacheIsReachable:(id *)a3
{
  return [(PUIPosterSnapshotFilesystemCache *)self->_underlyingCache checkCacheIsReachable:a3];
}

- (id)latestSnapshotBundleForRequest:(id)a3 error:(id *)a4
{
  uint64_t v6 = -[PRUISPosterSnapshotFilesystemCache puirequestForPRUISRequest:error:](self, "puirequestForPRUISRequest:error:", a3);
  if (v6)
  {
    v7 = [(PUIPosterSnapshotFilesystemCache *)self->_underlyingCache latestSnapshotBundleForRequest:v6 error:a4];
    v8 = +[PRUISPosterSnapshotBundle snapshotBundleWithPUIPosterSnapshotBundle:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)cacheSnapshotBundle:(id)a3 forRequest:(id)a4
{
  id v6 = a3;
  v7 = [(PRUISPosterSnapshotFilesystemCache *)self puirequestForPRUISRequest:a4 error:0];
  if (v7)
  {
    v8 = [v6 underlyingSnapshotBundle];
    char v9 = [(PUIPosterSnapshotFilesystemCache *)self->_underlyingCache cacheSnapshotBundle:v8 forRequest:v7];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)cacheSnapshotBundle:(id)a3 forRequest:(id)a4 completion:(id)a5
{
  id v8 = a3;
  char v9 = (void (**)(id, id))a5;
  id v16 = 0;
  v10 = [(PRUISPosterSnapshotFilesystemCache *)self puirequestForPRUISRequest:a4 error:&v16];
  id v11 = v16;
  v12 = v11;
  if (!v10 || v11)
  {
    if (v9) {
      v9[2](v9, v11);
    }
    char v14 = 0;
  }
  else
  {
    v13 = [v8 underlyingSnapshotBundle];
    char v14 = [(PUIPosterSnapshotFilesystemCache *)self->_underlyingCache cacheSnapshotBundle:v13 forRequest:v10 completion:v9];
  }
  return v14;
}

- (void)discardSnapshotsForPostersMatchingPredicate:(id)a3
{
}

- (void)cleanup
{
}

- (void)invalidate
{
}

- (id)puirequestForPRUISRequest:(id)a3 error:(id *)a4
{
  return (id)[a3 buildPosterKitSnapshotRequestForOutput:1 priority:0 sceneAttachments:0 error:a4];
}

- (PUIPosterSnapshotFilesystemCache)underlyingCache
{
  return self->_underlyingCache;
}

- (NSURL)cacheURL
{
  return self->_cacheURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheURL, 0);

  objc_storeStrong((id *)&self->_underlyingCache, 0);
}

+ (id)_defaultCacheLocationURL
{
  v2 = [MEMORY[0x263F08850] defaultManager];
  v3 = [v2 URLsForDirectory:13 inDomains:1];
  id v4 = [v3 firstObject];
  v5 = [v4 URLByAppendingPathComponent:@"com.apple.ShareNameAndPhoto" isDirectory:1];

  return v5;
}

+ (id)incomingCallSnapshotCache
{
  v2 = [a1 _defaultCacheLocationURL];
  v3 = [MEMORY[0x263F08850] defaultManager];
  id v4 = PFFileProtectionNoneAttributes();
  id v10 = 0;
  char v5 = [v3 createDirectoryAtURL:v2 withIntermediateDirectories:1 attributes:v4 error:&v10];
  id v6 = v10;

  if (v5)
  {
    v7 = [[PRUISPosterSnapshotFilesystemCache alloc] initWithURL:v2];
  }
  else
  {
    id v8 = PRUISLogSnapshotting();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[PRUISPosterSnapshotFilesystemCache(IncomingCallAdditions) incomingCallSnapshotCache];
    }

    v7 = 0;
  }

  return v7;
}

@end