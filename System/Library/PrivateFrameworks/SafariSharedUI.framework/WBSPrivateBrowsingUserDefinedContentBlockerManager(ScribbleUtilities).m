@interface WBSPrivateBrowsingUserDefinedContentBlockerManager(ScribbleUtilities)
- (void)clearAllEditsForContentBlocker:()ScribbleUtilities;
- (void)getAllPaintingAvoidanceSelectorsThatApplyToHost:()ScribbleUtilities completionHandler:;
@end

@implementation WBSPrivateBrowsingUserDefinedContentBlockerManager(ScribbleUtilities)

- (void)getAllPaintingAvoidanceSelectorsThatApplyToHost:()ScribbleUtilities completionHandler:
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __139__WBSPrivateBrowsingUserDefinedContentBlockerManager_ScribbleUtilities__getAllPaintingAvoidanceSelectorsThatApplyToHost_completionHandler___block_invoke;
  v24[3] = &unk_1E5E43B20;
  id v10 = v8;
  id v25 = v10;
  v11 = v9;
  v26 = v11;
  v23.receiver = a1;
  v23.super_class = (Class)&off_1F0382228;
  objc_msgSendSuper2(&v23, sel_getAllPaintingAvoidanceSelectorsThatApplyToHost_completionHandler_, v7, v24);
  v12 = [a1 normalBrowsingUserDefinedContentBlockerManager];
  dispatch_group_enter(v11);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __139__WBSPrivateBrowsingUserDefinedContentBlockerManager_ScribbleUtilities__getAllPaintingAvoidanceSelectorsThatApplyToHost_completionHandler___block_invoke_2;
  v20[3] = &unk_1E5E43B20;
  id v13 = v10;
  id v21 = v13;
  v22 = v11;
  v14 = v11;
  [v12 getAllPaintingAvoidanceSelectorsThatApplyToHost:v7 completionHandler:v20];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __139__WBSPrivateBrowsingUserDefinedContentBlockerManager_ScribbleUtilities__getAllPaintingAvoidanceSelectorsThatApplyToHost_completionHandler___block_invoke_3;
  v17[3] = &unk_1E5E423E8;
  id v18 = v13;
  id v19 = v6;
  id v15 = v13;
  id v16 = v6;
  dispatch_group_notify(v14, MEMORY[0x1E4F14428], v17);
}

- (void)clearAllEditsForContentBlocker:()ScribbleUtilities
{
  v10.receiver = a1;
  v10.super_class = (Class)&off_1F0382228;
  id v4 = a3;
  objc_msgSendSuper2(&v10, sel_clearAllEditsForContentBlocker_, v4);
  v5 = [a1 normalBrowsingUserDefinedContentBlockerManager];
  id v6 = [v4 host];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __104__WBSPrivateBrowsingUserDefinedContentBlockerManager_ScribbleUtilities__clearAllEditsForContentBlocker___block_invoke;
  v8[3] = &unk_1E5E43290;
  id v9 = v5;
  id v7 = v5;
  [v7 contentBlockerForHost:v6 createIfNeeded:0 completionHandler:v8];
}

@end