@interface WBSTabGroupTouchIconProvider
- (BOOL)canHandleRequest:(id)a3;
- (BOOL)canProvideUpdatesForRequest:(id)a3;
- (id)backgroundColor;
- (id)configuration;
- (id)defaultFolderIconForRequest:(id)a3;
- (id)folderUUIDForRequest:(id)a3;
- (id)iconForTabGroup:(id)a3;
- (id)subrequestsForRequest:(id)a3 maximumNumberOfSubrequests:(unint64_t)a4;
- (void)tabGroupManager:(id)a3 didRemoveTabGroupWithUUID:(id)a4;
- (void)tabGroupManager:(id)a3 didUpdateTabsInTabGroupWithUUID:(id)a4;
@end

@implementation WBSTabGroupTouchIconProvider

- (BOOL)canHandleRequest:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)iconForTabGroup:(id)a3
{
  v4 = [a3 uuid];
  v5 = [(WBSBookmarkFolderTouchIconProvider *)self cachedImageForFolderUUID:v4];

  return v5;
}

- (id)configuration
{
  if (defaultConfiguration_onceToken_0 != -1) {
    dispatch_once(&defaultConfiguration_onceToken_0, &__block_literal_global_43);
  }
  v2 = (void *)defaultConfiguration_configuration_0;
  return v2;
}

- (id)defaultFolderIconForRequest:(id)a3
{
  return 0;
}

- (id)backgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E4F428B8], "safari_colorWithRGBColorComponents:", &unk_1F0341FF0);
}

- (BOOL)canProvideUpdatesForRequest:(id)a3
{
  id v3 = [a3 tabGroupUUID];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (id)folderUUIDForRequest:(id)a3
{
  return (id)[a3 tabGroupUUID];
}

- (id)subrequestsForRequest:(id)a3 maximumNumberOfSubrequests:(unint64_t)a4
{
  id v5 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  v6 = [v5 tabs];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__WBSTabGroupTouchIconProvider_subrequestsForRequest_maximumNumberOfSubrequests___block_invoke;
  v9[3] = &unk_1E5E451A8;
  v9[4] = v10;
  v9[5] = a4;
  v7 = objc_msgSend(v6, "safari_mapAndFilterObjectsWithOptions:usingBlock:", 0, v9);

  _Block_object_dispose(v10, 8);
  return v7;
}

id __81__WBSTabGroupTouchIconProvider_subrequestsForRequest_maximumNumberOfSubrequests___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  v7 = [v6 url];
  v8 = [v7 host];

  if (v8)
  {
    if (++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) >= *(void *)(a1 + 40)) {
      *a4 = 1;
    }
    v9 = [v6 bookmark];
    v10 = [v9 title];
    v11 = (void *)MEMORY[0x1E4F1CB10];
    v12 = [v9 address];
    v13 = objc_msgSend(v11, "safari_URLWithUserTypedString:", v12);
    v14 = +[WBSTouchIconRequest requestWithTitle:url:minimumIconSize:maximumIconSize:](WBSTouchIconRequest, "requestWithTitle:url:minimumIconSize:maximumIconSize:", v10, v13, 32.0, 32.0, 64.0, 64.0);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)tabGroupManager:(id)a3 didUpdateTabsInTabGroupWithUUID:(id)a4
{
}

- (void)tabGroupManager:(id)a3 didRemoveTabGroupWithUUID:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a4;
  v7 = [v5 arrayWithObjects:&v8 count:1];

  -[WBSBookmarkFolderTouchIconProvider requestsWithFolderUUIDsDidBecomeInvalid:](self, "requestsWithFolderUUIDsDidBecomeInvalid:", v7, v8, v9);
}

@end