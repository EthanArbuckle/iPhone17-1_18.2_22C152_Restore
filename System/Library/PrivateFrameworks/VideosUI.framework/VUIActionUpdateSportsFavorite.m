@interface VUIActionUpdateSportsFavorite
+ (void)performFavoritesOperation:(BOOL)a3 teamId:(id)a4 teamName:(id)a5 confirmRemoval:(BOOL)a6 fireBackgroundEvent:(BOOL)a7 requestExecutionHandler:(id)a8;
+ (void)performFavoritesOperation:(BOOL)a3 teamId:(id)a4 teamName:(id)a5 requestExecutionHandler:(id)a6;
- (BOOL)isAccountRequired;
- (NSString)sportsTeamID;
- (NSString)sportsTeamName;
- (VUIActionUpdateSportsFavorite)initWithContextData:(id)a3;
- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4;
- (void)setSportsTeamID:(id)a3;
- (void)setSportsTeamName:(id)a3;
@end

@implementation VUIActionUpdateSportsFavorite

- (VUIActionUpdateSportsFavorite)initWithContextData:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VUIActionUpdateSportsFavorite;
  v5 = [(VUIActionUpdateSportsFavorite *)&v13 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "vui_stringForKey:", @"sportsTeamID");
    v7 = (void *)v6;
    if (v6) {
      v8 = (__CFString *)v6;
    }
    else {
      v8 = &stru_1F3E921E0;
    }
    objc_storeStrong((id *)&v5->_sportsTeamID, v8);

    uint64_t v9 = objc_msgSend(v4, "vui_stringForKey:", @"sportsTeamName");
    v10 = (void *)v9;
    if (v9) {
      v11 = (__CFString *)v9;
    }
    else {
      v11 = &stru_1F3E921E0;
    }
    objc_storeStrong((id *)&v5->_sportsTeamName, v11);

    v5->isFavorite = objc_msgSend(v4, "vui_BOOLForKey:defaultValue:", @"sportsTeamIsFavorite", 0);
    v5->confirmsRemoval = objc_msgSend(v4, "vui_BOOLForKey:defaultValue:", @"confirmsRemoval", 0);
    v5->firesBackgroundEvent = objc_msgSend(v4, "vui_BOOLForKey:defaultValue:", @"firesBackgroundEvent", 0);
  }

  return v5;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self->_sportsTeamID;
  uint64_t v9 = self->_sportsTeamName;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = v6;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;
  BOOL isFavorite = self->isFavorite;
  BOOL confirmsRemoval = self->confirmsRemoval;
  BOOL firesBackgroundEvent = self->firesBackgroundEvent;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  v21 = __78__VUIActionUpdateSportsFavorite_performWithTargetResponder_completionHandler___block_invoke;
  v22 = &unk_1E6DF9E60;
  BOOL v27 = isFavorite;
  id v23 = v11;
  v24 = v8;
  BOOL v28 = confirmsRemoval;
  BOOL v29 = firesBackgroundEvent;
  v25 = v9;
  id v26 = v7;
  v15 = (void *)MEMORY[0x1E4F29060];
  id v16 = v7;
  v17 = v9;
  v18 = v8;
  id v19 = v11;
  if ([v15 isMainThread]) {
    v21((uint64_t)block);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __78__VUIActionUpdateSportsFavorite_performWithTargetResponder_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) applySelectionImage];
  uint64_t v2 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 65);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 66);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__VUIActionUpdateSportsFavorite_performWithTargetResponder_completionHandler___block_invoke_2;
  v8[3] = &unk_1E6DF5B20;
  id v9 = *(id *)(a1 + 32);
  +[VUIActionUpdateSportsFavorite performFavoritesOperation:v2 teamId:v3 teamName:v4 confirmRemoval:v5 fireBackgroundEvent:v6 requestExecutionHandler:v8];
  uint64_t v7 = *(void *)(a1 + 56);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, 1);
  }
}

void __78__VUIActionUpdateSportsFavorite_performWithTargetResponder_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    uint64_t v3 = __78__VUIActionUpdateSportsFavorite_performWithTargetResponder_completionHandler___block_invoke_3;
    uint64_t v4 = &unk_1E6DF3D58;
    id v5 = *(id *)(a1 + 32);
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      v3((uint64_t)block);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __78__VUIActionUpdateSportsFavorite_performWithTargetResponder_completionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) restoreOriginalImage];
}

- (BOOL)isAccountRequired
{
  return 1;
}

+ (void)performFavoritesOperation:(BOOL)a3 teamId:(id)a4 teamName:(id)a5 confirmRemoval:(BOOL)a6 fireBackgroundEvent:(BOOL)a7 requestExecutionHandler:(id)a8
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a8;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __134__VUIActionUpdateSportsFavorite_performFavoritesOperation_teamId_teamName_confirmRemoval_fireBackgroundEvent_requestExecutionHandler___block_invoke;
  aBlock[3] = &unk_1E6DF9E88;
  BOOL v34 = a3;
  id v31 = v13;
  id v16 = v14;
  id v32 = v16;
  BOOL v35 = a7;
  id v17 = v15;
  id v33 = v17;
  id v18 = v13;
  id v19 = _Block_copy(aBlock);
  v20 = [MEMORY[0x1E4FB5160] defaultManager];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __134__VUIActionUpdateSportsFavorite_performFavoritesOperation_teamId_teamName_confirmRemoval_fireBackgroundEvent_requestExecutionHandler___block_invoke_2;
  v24[3] = &unk_1E6DF9F00;
  BOOL v28 = a3;
  BOOL v29 = a6;
  id v25 = v16;
  id v26 = v19;
  id v27 = v17;
  id v21 = v17;
  id v22 = v16;
  id v23 = v19;
  [v20 isOnboarded:v24];
}

uint64_t __134__VUIActionUpdateSportsFavorite_performFavoritesOperation_teamId_teamName_confirmRemoval_fireBackgroundEvent_requestExecutionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v3 = +[VUIFavoritesRequestManager sharedInstance];
  [v3 sendRequestForEntityID:*(void *)(a1 + 32) teamName:*(void *)(a1 + 40) action:v2 fireBackgroundEvent:*(unsigned __int8 *)(a1 + 57)];

  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __134__VUIActionUpdateSportsFavorite_performFavoritesOperation_teamId_teamName_confirmRemoval_fireBackgroundEvent_requestExecutionHandler___block_invoke_2(uint64_t a1, char a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  id v5 = __134__VUIActionUpdateSportsFavorite_performFavoritesOperation_teamId_teamName_confirmRemoval_fireBackgroundEvent_requestExecutionHandler___block_invoke_3;
  uint64_t v6 = &unk_1E6DF9ED8;
  char v10 = *(unsigned char *)(a1 + 56);
  id v8 = *(id *)(a1 + 40);
  char v11 = *(unsigned char *)(a1 + 57);
  id v7 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 48);
  char v12 = a2;
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v4[0], 3221225472)) {
    v5((uint64_t)v4);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v4);
  }
}

void __134__VUIActionUpdateSportsFavorite_performFavoritesOperation_teamId_teamName_confirmRemoval_fireBackgroundEvent_requestExecutionHandler___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    if (+[VUIUtilities isSUIEnabled]) {
      goto LABEL_7;
    }
    if (*(unsigned char *)(a1 + 56))
    {
      if (*(unsigned char *)(a1 + 57))
      {
        uint64_t v2 = NSString;
        uint64_t v3 = +[VUILocalizationManager sharedInstance];
        uint64_t v4 = [v3 localizedStringForKey:@"FAVORITES_REMOVE_TEAM"];
        id v5 = [v2 stringWithValidatedFormat:v4, @"%@", 0, *(void *)(a1 + 32) validFormatSpecifiers error];

        uint64_t v6 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v5 message:0 preferredStyle:1];
        id v7 = (void *)MEMORY[0x1E4FB1410];
        id v8 = +[VUILocalizationManager sharedInstance];
        id v9 = [v8 localizedStringForKey:@"CANCEL"];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __134__VUIActionUpdateSportsFavorite_performFavoritesOperation_teamId_teamName_confirmRemoval_fireBackgroundEvent_requestExecutionHandler___block_invoke_4;
        v22[3] = &unk_1E6DF4DA0;
        id v23 = *(id *)(a1 + 48);
        char v10 = [v7 actionWithTitle:v9 style:1 handler:v22];

        [v6 addAction:v10];
        char v11 = (void *)MEMORY[0x1E4FB1410];
        char v12 = +[VUILocalizationManager sharedInstance];
        id v13 = [v12 localizedStringForKey:@"FAVORITES_REMOVE_TEAM_BUTTON"];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __134__VUIActionUpdateSportsFavorite_performFavoritesOperation_teamId_teamName_confirmRemoval_fireBackgroundEvent_requestExecutionHandler___block_invoke_5;
        v20[3] = &unk_1E6DF4DA0;
        id v21 = *(id *)(a1 + 40);
        id v14 = [v11 actionWithTitle:v13 style:2 handler:v20];

        [v6 addAction:v14];
        id v15 = +[VUIApplicationRouter topPresentedViewController];
        [v15 presentViewController:v6 animated:1 completion:0];

        return;
      }
      goto LABEL_7;
    }
  }
  if (!*(unsigned char *)(a1 + 58))
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __134__VUIActionUpdateSportsFavorite_performFavoritesOperation_teamId_teamName_confirmRemoval_fireBackgroundEvent_requestExecutionHandler___block_invoke_6;
    v17[3] = &unk_1E6DF9EB0;
    id v18 = *(id *)(a1 + 40);
    id v19 = *(id *)(a1 + 48);
    +[VideosUI presentSportsFavoriteSyncSheetWithCompletion:v17];

    return;
  }
LABEL_7:
  id v16 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  v16();
}

uint64_t __134__VUIActionUpdateSportsFavorite_performFavoritesOperation_teamId_teamName_confirmRemoval_fireBackgroundEvent_requestExecutionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __134__VUIActionUpdateSportsFavorite_performFavoritesOperation_teamId_teamName_confirmRemoval_fireBackgroundEvent_requestExecutionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __134__VUIActionUpdateSportsFavorite_performFavoritesOperation_teamId_teamName_confirmRemoval_fireBackgroundEvent_requestExecutionHandler___block_invoke_6(uint64_t a1, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

+ (void)performFavoritesOperation:(BOOL)a3 teamId:(id)a4 teamName:(id)a5 requestExecutionHandler:(id)a6
{
}

- (NSString)sportsTeamID
{
  return self->_sportsTeamID;
}

- (void)setSportsTeamID:(id)a3
{
}

- (NSString)sportsTeamName
{
  return self->_sportsTeamName;
}

- (void)setSportsTeamName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sportsTeamName, 0);
  objc_storeStrong((id *)&self->_sportsTeamID, 0);
}

@end