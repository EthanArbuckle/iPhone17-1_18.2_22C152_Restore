@interface MTEpisode(NMSDownloadableItem)
+ (id)_sizeEstimation;
+ (id)propertiesToFetchDownloadInfo;
+ (id)relationshipKeyPathsForPrefetchingDownloadInfo;
- (NMSDownloadableItem)downloadInfo;
@end

@implementation MTEpisode(NMSDownloadableItem)

- (NMSDownloadableItem)downloadInfo
{
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__8;
  v27 = __Block_byref_object_dispose__8;
  id v28 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__8;
  v21 = __Block_byref_object_dispose__8;
  id v22 = 0;
  uint64_t v13 = 0;
  v14 = (double *)&v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v2 = [a1 managedObjectContext];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__MTEpisode_NMSDownloadableItem__downloadInfo__block_invoke;
  v8[3] = &unk_264634A50;
  v8[4] = a1;
  v8[5] = &v23;
  v8[6] = &v17;
  v8[7] = &v13;
  v8[8] = &v9;
  [v2 performBlockAndWait:v8];

  v3 = [(id)objc_opt_class() _sizeEstimation];
  uint64_t v4 = [v3 sizeForFeedURL:v18[5] duration:v10[3] feedProvidedSize:v14[3]];

  v5 = [NMSDownloadableItem alloc];
  v6 = [(NMSDownloadableItem *)v5 initWithMediaLibraryIdentifier:0 externalLibraryIdentifier:v24[5] size:v4 itemType:1 manuallyAdded:0];
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);

  return v6;
}

+ (id)propertiesToFetchDownloadInfo
{
  v3[3] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F5EA90];
  v3[0] = *MEMORY[0x263F5EB78];
  v3[1] = v0;
  v3[2] = *MEMORY[0x263F5EAA8];
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:3];

  return v1;
}

+ (id)relationshipKeyPathsForPrefetchingDownloadInfo
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F5EC98];
  v5[0] = *MEMORY[0x263F5EB38];
  v5[1] = v0;
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:2];
  v2 = [v1 componentsJoinedByString:@"."];
  v6[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];

  return v3;
}

+ (id)_sizeEstimation
{
  if (_sizeEstimation_onceToken != -1) {
    dispatch_once(&_sizeEstimation_onceToken, &__block_literal_global_11);
  }
  uint64_t v0 = (void *)_sizeEstimation_sizeEstimation;

  return v0;
}

@end