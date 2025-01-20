@interface PHPhotosHighlightChangeRequest(HighlightModelProtocol)
- (uint64_t)clearCurations;
- (void)enumerateMomentChangeRequestsForUUIDs:()HighlightModelProtocol inPhotoLibrary:usingBlock:;
@end

@implementation PHPhotosHighlightChangeRequest(HighlightModelProtocol)

- (void)enumerateMomentChangeRequestsForUUIDs:()HighlightModelProtocol inPhotoLibrary:usingBlock:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = a5;
  v9 = [a4 librarySpecificFetchOptions];
  v19 = v7;
  v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid IN %@", v7];
  [v9 setPredicate:v10];

  [MEMORY[0x1E4F38EE8] fetchMomentsWithOptions:v9];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
LABEL_3:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v22 != v14) {
        objc_enumerationMutation(v11);
      }
      v16 = *(void **)(*((void *)&v21 + 1) + 8 * v15);
      v17 = [MEMORY[0x1E4F391A8] changeRequestForMoment:v16];
      unsigned __int8 v20 = 0;
      v18 = [v16 uuid];
      v8[2](v8, v17, v18, &v20);

      LODWORD(v18) = v20;
      if (v18) {
        break;
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v13) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (uint64_t)clearCurations
{
  [a1 clearCurationWithType:1];
  return [a1 clearCurationWithType:2];
}

@end