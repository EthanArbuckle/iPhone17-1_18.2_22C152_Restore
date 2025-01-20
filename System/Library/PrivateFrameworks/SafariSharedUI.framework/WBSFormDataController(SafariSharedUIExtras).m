@interface WBSFormDataController(SafariSharedUIExtras)
- (void)bestUsernameSuggestionForUsernamePromptOnURL:()SafariSharedUIExtras inContext:completionHandler:;
@end

@implementation WBSFormDataController(SafariSharedUIExtras)

- (void)bestUsernameSuggestionForUsernamePromptOnURL:()SafariSharedUIExtras inContext:completionHandler:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[WBSHideMyEmailManager sharedManager];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __120__WBSFormDataController_SafariSharedUIExtras__bestUsernameSuggestionForUsernamePromptOnURL_inContext_completionHandler___block_invoke;
  v15[3] = &unk_1E5E425F8;
  v15[4] = a1;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 getRecordForURL:v14 completionHandler:v15];
}

@end