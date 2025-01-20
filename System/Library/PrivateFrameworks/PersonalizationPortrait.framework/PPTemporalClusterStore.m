@interface PPTemporalClusterStore
- (BOOL)iterRankedTemporalClustersForStartDate:(id)a3 endDate:(id)a4 error:(id *)a5 block:(id)a6;
- (PPTemporalClusterStore)init;
@end

@implementation PPTemporalClusterStore

- (BOOL)iterRankedTemporalClustersForStartDate:(id)a3 endDate:(id)a4 error:(id *)a5 block:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  v12 = +[PPTemporalClusterClient sharedInstance];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__PPTemporalClusterStore_iterRankedTemporalClustersForStartDate_endDate_error_block___block_invoke;
  v15[3] = &unk_1E550F880;
  id v16 = v9;
  id v13 = v9;
  LOBYTE(a5) = [v12 rankedTemporalClustersForStartDate:v11 endDate:v10 error:a5 handleBatch:v15];

  return (char)a5;
}

void __85__PPTemporalClusterStore_iterRankedTemporalClustersForStartDate_endDate_error_block___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = v5;
  if (!*a3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
        if (*a3) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v9) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (PPTemporalClusterStore)init
{
  v3.receiver = self;
  v3.super_class = (Class)PPTemporalClusterStore;
  return [(PPTemporalClusterStore *)&v3 init];
}

@end