@interface PXRemoveAssetsFromFeaturedPhotosAction
- (PXFastEnumeration)suggestions;
- (id)actionIdentifier;
- (id)localizedActionName;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
@end

@implementation PXRemoveAssetsFromFeaturedPhotosAction

- (void).cxx_destruct
{
}

- (void)performUndo:(id)a3
{
  id v4 = a3;
  v5 = [(PXRemoveAssetsFromFeaturedPhotosAction *)self suggestions];
  v6 = [(PXPhotosAction *)self photoLibrary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__PXRemoveAssetsFromFeaturedPhotosAction_performUndo___block_invoke;
  v8[3] = &unk_1E5DD36F8;
  id v9 = v5;
  id v7 = v5;
  [v6 performChanges:v8 completionHandler:v4];
}

void __54__PXRemoveAssetsFromFeaturedPhotosAction_performUndo___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        v6 = objc_msgSend(MEMORY[0x1E4F39318], "changeRequestForSuggestion:", *(void *)(*((void *)&v7 + 1) + 8 * v5), (void)v7);
        [v6 markReactivated];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)performAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXRemoveAssetsFromFeaturedPhotosAction *)self suggestions];
  v6 = [(PXPhotosAction *)self photoLibrary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__PXRemoveAssetsFromFeaturedPhotosAction_performAction___block_invoke;
  v8[3] = &unk_1E5DD36F8;
  id v9 = v5;
  id v7 = v5;
  [v6 performChanges:v8 completionHandler:v4];
}

void __56__PXRemoveAssetsFromFeaturedPhotosAction_performAction___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        v6 = objc_msgSend(MEMORY[0x1E4F39318], "changeRequestForSuggestion:", *(void *)(*((void *)&v7 + 1) + 8 * v5), (void)v7);
        [v6 markDeclined];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (id)localizedActionName
{
  return PXLocalizedStringFromTable(@"PXForYouRecentInterestSuggestionRemoveActionTitle", @"PhotosUICore");
}

- (id)actionIdentifier
{
  return @"RemoveAssetsFromFeaturedPhotos";
}

- (PXFastEnumeration)suggestions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  suggestions = self->_suggestions;
  if (!suggestions)
  {
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[PXPhotosAction assetCount](self, "assetCount"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v5 = [(PXAssetsAction *)self assets];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = [MEMORY[0x1E4F39310] fetchRecentInterestSuggestionsForAsset:*(void *)(*((void *)&v15 + 1) + 8 * v9)];
          v11 = [v10 fetchedObjects];
          [v4 addObjectsFromArray:v11];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    uint64_t v12 = (NSArray *)[v4 copy];
    v13 = self->_suggestions;
    self->_suggestions = v12;

    suggestions = self->_suggestions;
  }
  return (PXFastEnumeration *)suggestions;
}

@end