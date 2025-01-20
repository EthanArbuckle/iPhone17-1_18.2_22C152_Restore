@interface NSDictionary(PBFPosterSnapshotProvidingAdditions)
- (id)posterSnapshotForRequest:()PBFPosterSnapshotProvidingAdditions definition:error:;
- (uint64_t)prewarmSnapshotsForRequests:()PBFPosterSnapshotProvidingAdditions completion:;
- (void)fetchPosterSnapshotForRequest:()PBFPosterSnapshotProvidingAdditions definition:completion:;
- (void)purgeSnapshotsForRequest:()PBFPosterSnapshotProvidingAdditions;
@end

@implementation NSDictionary(PBFPosterSnapshotProvidingAdditions)

- (id)posterSnapshotForRequest:()PBFPosterSnapshotProvidingAdditions definition:error:
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  uint64_t v11 = 0;
  if (v8 && v9)
  {
    v12 = [a1 objectForKey:v9];
    uint64_t v11 = [v12 image];
    uint64_t v13 = [v12 error];
    if (!(v11 | v13))
    {
      v14 = (void *)MEMORY[0x1E4F28C58];
      v17[0] = @"definition";
      v17[1] = @"request";
      v18[0] = v10;
      v18[1] = v8;
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
      uint64_t v13 = objc_msgSend(v14, "pbf_generalErrorWithCode:userInfo:", 7, v15);
    }
    if (a5 && v13) {
      *a5 = (id) v13;
    }
  }
  return (id)v11;
}

- (void)purgeSnapshotsForRequest:()PBFPosterSnapshotProvidingAdditions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = objc_msgSend(a3, "definitions", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [a1 objectForKey:*(void *)(*((void *)&v10 + 1) + 8 * v8)];
        [v9 cancel];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)fetchPosterSnapshotForRequest:()PBFPosterSnapshotProvidingAdditions definition:completion:
{
  if (a5)
  {
    uint64_t v10 = 0;
    uint64_t v8 = a5;
    id v9 = [a1 posterSnapshotForRequest:a3 definition:a4 error:&v10];
    v8[2](v8, v9, v10);
  }
}

- (uint64_t)prewarmSnapshotsForRequests:()PBFPosterSnapshotProvidingAdditions completion:
{
  if (a4) {
    return (*(uint64_t (**)(uint64_t, void))(a4 + 16))(a4, 0);
  }
  return result;
}

@end