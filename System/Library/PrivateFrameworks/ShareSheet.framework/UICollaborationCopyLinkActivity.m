@interface UICollaborationCopyLinkActivity
+ (int64_t)activityCategory;
+ (unint64_t)_xpcAttributes;
- (BOOL)_activitySupportsPromiseURLs;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (BOOL)canPerformWithCollaborationItem:(id)a3 activityItems:(id)a4;
- (SFCollaborationItem)collaborationItem;
- (SFCollaborationService)collaborationService;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (id)activityViewController;
- (int64_t)_defaultSortGroup;
- (void)_prepareWithActivityItems:(id)a3 completion:(id)a4;
- (void)performActivity;
- (void)setCollaborationItem:(id)a3;
- (void)setCollaborationService:(id)a3;
@end

@implementation UICollaborationCopyLinkActivity

+ (unint64_t)_xpcAttributes
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class()) {
    return 3;
  }
  else {
    return 0;
  }
}

+ (int64_t)activityCategory
{
  return 0;
}

- (int64_t)_defaultSortGroup
{
  return 1;
}

- (id)activityType
{
  return @"com.apple.UIKit.activity.CollaborationCopyLink";
}

- (id)_systemImageName
{
  return @"link";
}

- (id)activityTitle
{
  uint64_t v2 = _ShareSheetBundle();
  v3 = [v2 localizedStringForKey:@"CopyLink[Activity]" value:@"Copy Link" table:@"Localizable"];

  return v3;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 0;
}

- (BOOL)canPerformWithCollaborationItem:(id)a3 activityItems:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 type];
  if (v6)
  {
    if (v6 == 1)
    {
      v7 = (void *)MEMORY[0x1E4F9F6B8];
      v8 = [v5 itemProvider];
      int v9 = [v7 isPostCKShareItemProvider:v8];
    }
    else
    {
      int v9 = 0;
    }
  }
  else
  {
    int v9 = [v5 isShared];
  }
  v10 = share_sheet_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = "no";
    int v13 = 138412802;
    v14 = self;
    if (v9) {
      v11 = "yes";
    }
    __int16 v15 = 2080;
    v16 = v11;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl(&dword_1A0AD8000, v10, OS_LOG_TYPE_DEFAULT, "%@: canPerform:%s collaborationItem:%@", (uint8_t *)&v13, 0x20u);
  }

  return v9;
}

- (BOOL)_activitySupportsPromiseURLs
{
  return 1;
}

- (void)_prepareWithActivityItems:(id)a3 completion:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)MEMORY[0x1E4F9F6B8];
  v7 = [(UICollaborationCopyLinkActivity *)self collaborationItem];
  v8 = [(UICollaborationCopyLinkActivity *)self collaborationService];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__UICollaborationCopyLinkActivity__prepareWithActivityItems_completion___block_invoke;
  v10[3] = &unk_1E5A221D0;
  v10[4] = self;
  id v11 = v5;
  id v9 = v5;
  [v6 requestSharedURLForCollaborationItem:v7 collaborationService:v8 completionHandler:v10];
}

void __72__UICollaborationCopyLinkActivity__prepareWithActivityItems_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__UICollaborationCopyLinkActivity__prepareWithActivityItems_completion___block_invoke_2;
  v11[3] = &unk_1E5A21DE8;
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  id v12 = v5;
  uint64_t v13 = v7;
  id v14 = v6;
  id v15 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

uint64_t __72__UICollaborationCopyLinkActivity__prepareWithActivityItems_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = share_sheet_log();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v5;
      _os_log_impl(&dword_1A0AD8000, v4, OS_LOG_TYPE_DEFAULT, "Copying Link %@", buf, 0xCu);
    }

    v4 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    uint64_t v8 = *(void *)(a1 + 32);
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
    [v4 setObjects:v6];
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __72__UICollaborationCopyLinkActivity__prepareWithActivityItems_completion___block_invoke_2_cold_1(a1, v4);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)performActivity
{
}

- (id)activityViewController
{
  return 0;
}

- (SFCollaborationItem)collaborationItem
{
  return self->_collaborationItem;
}

- (void)setCollaborationItem:(id)a3
{
}

- (SFCollaborationService)collaborationService
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collaborationService);
  return (SFCollaborationService *)WeakRetained;
}

- (void)setCollaborationService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_collaborationService);
  objc_storeStrong((id *)&self->_collaborationItem, 0);
}

void __72__UICollaborationCopyLinkActivity__prepareWithActivityItems_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v4 = [*(id *)(a1 + 40) collaborationItem];
  uint64_t v5 = *(void *)(a1 + 48);
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_1A0AD8000, a2, OS_LOG_TYPE_ERROR, "Copy Link failed: Couldn't retrieve shareURL for item:%@ %@", (uint8_t *)&v6, 0x16u);
}

@end