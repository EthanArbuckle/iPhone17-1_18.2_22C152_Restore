@interface PLLocalVideoKeyFrameJobQueue
- (BOOL)addJobWithAssetObjectID:(id)a3 networkAccessAllowed:(BOOL)a4 clientBundleID:(id)a5 libraryID:(id)a6 error:(id *)a7 completionHandler:(id)a8;
- (BOOL)removeJob:(id)a3;
- (PLLocalVideoKeyFrameJobQueue)init;
- (id)popNextJobToRun;
@end

@implementation PLLocalVideoKeyFrameJobQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jobsByAssetObjectID, 0);
  objc_storeStrong((id *)&self->_queuedJobs, 0);
}

- (BOOL)removeJob:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  jobsByAssetObjectID = self->_jobsByAssetObjectID;
  v7 = [v4 assetObjectID];
  v8 = [(NSMutableDictionary *)jobsByAssetObjectID objectForKeyedSubscript:v7];

  if (v8)
  {
    if ([(NSMutableOrderedSet *)self->_queuedJobs containsObject:v4]) {
      [(NSMutableOrderedSet *)self->_queuedJobs removeObject:v4];
    }
    else {
      --self->_inflightCount;
    }
    v9 = self->_jobsByAssetObjectID;
    v10 = [v4 assetObjectID];
    [(NSMutableDictionary *)v9 setObject:0 forKeyedSubscript:v10];
  }
  os_unfair_lock_unlock(p_lock);

  return v8 != 0;
}

- (id)popNextJobToRun
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_inflightCount > 1)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [(NSMutableOrderedSet *)self->_queuedJobs firstObject];
    if (v4)
    {
      [(NSMutableOrderedSet *)self->_queuedJobs removeObjectAtIndex:0];
      ++self->_inflightCount;
    }
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)addJobWithAssetObjectID:(id)a3 networkAccessAllowed:(BOOL)a4 clientBundleID:(id)a5 libraryID:(id)a6 error:(id *)a7 completionHandler:(id)a8
{
  BOOL v12 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v19 = [(NSMutableDictionary *)self->_jobsByAssetObjectID objectForKeyedSubscript:v14];
  if (v19)
  {
    v20 = PLImageManagerGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v14;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEBUG, "[key frame] existing job found adding new completion handler for asset: %@", buf, 0xCu);
    }

    [v19 addCompletionHandler:v17];
    goto LABEL_10;
  }
  if ((unint64_t)[(NSMutableOrderedSet *)self->_queuedJobs count] < 0xC8)
  {
    v27 = objc_alloc_init(PLLocalVideoKeyFrameGenerationJob);
    [(PLLocalVideoKeyFrameGenerationJob *)v27 setAssetObjectID:v14];
    [(PLLocalVideoKeyFrameGenerationJob *)v27 setNetworkAccessAllowed:v12];
    [(PLLocalVideoKeyFrameGenerationJob *)v27 setClientBundleID:v15];
    [(PLLocalVideoKeyFrameGenerationJob *)v27 setLibraryID:v16];
    [(PLLocalVideoKeyFrameGenerationJob *)v27 addCompletionHandler:v17];
    [(NSMutableOrderedSet *)self->_queuedJobs addObject:v27];
    jobsByAssetObjectID = self->_jobsByAssetObjectID;
    v29 = [(PLLocalVideoKeyFrameGenerationJob *)v27 assetObjectID];
    [(NSMutableDictionary *)jobsByAssetObjectID setObject:v27 forKeyedSubscript:v29];

LABEL_10:
    v25 = 0;
    BOOL v26 = 1;
    goto LABEL_11;
  }
  v21 = PLImageManagerGetLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v35 = v14;
    _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "[key frame] max queued jobs reached, failing request for asset: %@", buf, 0xCu);
  }

  v31 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v22 = *MEMORY[0x1E4F8C500];
  uint64_t v32 = *MEMORY[0x1E4F28228];
  v23 = [NSString stringWithFormat:@"Max queued jobs reached"];
  v33 = v23;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
  v25 = [v31 errorWithDomain:v22 code:47001 userInfo:v24];

  BOOL v26 = 0;
LABEL_11:
  os_unfair_lock_unlock(p_lock);
  if (a7) {
    *a7 = v25;
  }

  return v26;
}

- (PLLocalVideoKeyFrameJobQueue)init
{
  v9.receiver = self;
  v9.super_class = (Class)PLLocalVideoKeyFrameJobQueue;
  v2 = [(PLLocalVideoKeyFrameJobQueue *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    id v4 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    queuedJobs = v3->_queuedJobs;
    v3->_queuedJobs = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    jobsByAssetObjectID = v3->_jobsByAssetObjectID;
    v3->_jobsByAssetObjectID = v6;
  }
  return v3;
}

@end