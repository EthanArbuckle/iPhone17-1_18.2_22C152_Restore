@interface PLSpotlightQueryUtilities
+ (id)countAssetsQueryStringForLibraryIdentifier:(int64_t)a3;
+ (id)searchQueryForLibrary:(id)a3 queryString:(id)a4;
+ (id)searchQueryForLibraryIdentifier:(int64_t)a3 pathManager:(id)a4 queryString:(id)a5;
+ (void)countForSearchQuery:(id)a3 timedDispatchGroup:(id)a4 completion:(id)a5;
@end

@implementation PLSpotlightQueryUtilities

+ (void)countForSearchQuery:(id)a3 timedDispatchGroup:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = [v9 enterWithName:@"CSSearchQuery"];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __79__PLSpotlightQueryUtilities_countForSearchQuery_timedDispatchGroup_completion___block_invoke;
  v19[3] = &unk_1E5873440;
  id v11 = v10;
  id v20 = v11;
  [v7 setCompletionHandler:v19];
  [v7 start];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__PLSpotlightQueryUtilities_countForSearchQuery_timedDispatchGroup_completion___block_invoke_2;
  v15[3] = &unk_1E5874868;
  id v16 = v11;
  id v17 = v7;
  id v18 = v8;
  id v12 = v8;
  id v13 = v7;
  id v14 = v11;
  [v9 notify:v15];
}

void __79__PLSpotlightQueryUtilities_countForSearchQuery_timedDispatchGroup_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E4F8B9B8];
  if (a2)
  {
    uint64_t v4 = [MEMORY[0x1E4F8B9B8] failureWithError:a2];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
    id v6 = [v3 successWithResult:v5];

    uint64_t v4 = (uint64_t)v6;
  }
  id v7 = (id)v4;
  [v2 leaveWithResult:v4];
}

void __79__PLSpotlightQueryUtilities_countForSearchQuery_timedDispatchGroup_completion___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) result];
  int v3 = [v2 isFailure];

  if (v3)
  {
    id v6 = [*(id *)(a1 + 32) result];
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F8B9B8];
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "foundItemCount"));
    id v6 = [v4 successWithResult:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (id)searchQueryForLibraryIdentifier:(int64_t)a3 pathManager:(id)a4 queryString:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F23830]);
  [v9 setDisableBlockingOnIndex:1];
  if ((unint64_t)a3 <= 1) {
    [v9 setBundleIDs:&unk_1EEBF23D8];
  }
  if (+[PLSpotlightDonationUtilities shouldUseSpotlightPrivateIndexForLibraryIdentifier:a3])
  {
    v10 = [v7 spotlightSearchIndexPath];
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F237F0]) initWithPath:v10 queryString:v8 context:v9];
  }
  else
  {
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F23828]) initWithQueryString:v8 queryContext:v9];
  }

  return v11;
}

+ (id)searchQueryForLibrary:(id)a3 queryString:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [v8 libraryServicesManager];

  if (!v9)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"PLSpotlightQueryUtilities.m", 52, @"Invalid parameter not satisfying: %@", @"library.libraryServicesManager != nil" object file lineNumber description];
  }
  v10 = [v8 libraryServicesManager];
  uint64_t v11 = [v10 wellKnownPhotoLibraryIdentifier];
  id v12 = [v8 pathManager];

  id v13 = [a1 searchQueryForLibraryIdentifier:v11 pathManager:v12 queryString:v7];

  return v13;
}

+ (id)countAssetsQueryStringForLibraryIdentifier:(int64_t)a3
{
  BOOL v3 = a3 == 3;
  if (a3 == 3) {
    uint64_t v4 = @"%@ > 0 && %@ > 0";
  }
  else {
    uint64_t v4 = @"%@ == %@";
  }
  v5 = (uint64_t *)MEMORY[0x1E4F22D40];
  if (!v3) {
    v5 = (uint64_t *)MEMORY[0x1E4F23318];
  }
  uint64_t v6 = *v5;
  id v7 = (__CFString *)*MEMORY[0x1E4F23268];
  if (!v3) {
    id v7 = @"com.apple.photos.search.result.collection.asset";
  }
  id v8 = objc_msgSend(NSString, "stringWithFormat:", v4, v6, v7);
  return v8;
}

@end