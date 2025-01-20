@interface PXSettingsSearchResult
- (NSString)subtitle;
- (NSString)title;
- (PXSettingsSearchResult)init;
- (_PXSettingsIndexEntry)entry;
- (id)_initWithEntry:(id)a3;
- (void)revealInSettingsController:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation PXSettingsSearchResult

- (void).cxx_destruct
{
}

- (_PXSettingsIndexEntry)entry
{
  return self->_entry;
}

- (void)revealInSettingsController:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(PXSettingsSearchResult *)self entry];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__PXSettingsSearchResult_revealInSettingsController_withCompletionHandler___block_invoke;
  v10[3] = &unk_1E5DCCA98;
  id v11 = v6;
  id v9 = v6;
  [v8 revealInSettingsController:v7 withCompletionHandler:v10];
}

uint64_t __75__PXSettingsSearchResult_revealInSettingsController_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (NSString)subtitle
{
  v2 = [(PXSettingsSearchResult *)self entry];
  v3 = [v2 subtitle];

  return (NSString *)v3;
}

- (NSString)title
{
  v2 = [(PXSettingsSearchResult *)self entry];
  v3 = [v2 title];

  return (NSString *)v3;
}

- (id)_initWithEntry:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXSettingsSearchResult;
  id v6 = [(PXSettingsSearchResult *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_entry, a3);
  }

  return v7;
}

- (PXSettingsSearchResult)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSettingsIndex.m", 223, @"%s is not available as initializer", "-[PXSettingsSearchResult init]");

  abort();
}

@end