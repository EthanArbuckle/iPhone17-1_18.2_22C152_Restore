@interface SCUIMoreHelpContextMenu
+ (id)menuActionsFromModel:(id)a3 menuInfo:(id)a4 menuDelegate:(id)a5;
+ (id)menuWithAnalysis:(id)a3 delegate:(id)a4 additionalOptions:(int64_t)a5;
+ (id)menuWithDelegate:(id)a3;
+ (id)menuWithDelegate:(id)a3 additionalOptions:(int64_t)a4;
+ (id)menuWithDelegate:(id)a3 additionalOptions:(int64_t)a4 interventionType:(int64_t)a5;
+ (id)menuWithDelegate:(id)a3 contextDictionary:(id)a4 additionalOptions:(int64_t)a5;
+ (id)menuWithDelegate:(id)a3 contextDictionary:(id)a4 additionalOptions:(int64_t)a5 interventionType:(int64_t)a6;
+ (void)didMessageSomeoneDefaultImplementationWith:(int64_t)a3;
+ (void)reportToAuthoritiesPressedForModel:(id)a3 delegate:(id)a4;
@end

@implementation SCUIMoreHelpContextMenu

+ (id)menuWithDelegate:(id)a3
{
  return +[SCUIMoreHelpContextMenu menuWithDelegate:a3 additionalOptions:0];
}

+ (id)menuWithAnalysis:(id)a3 delegate:(id)a4 additionalOptions:(int64_t)a5
{
  return 0;
}

+ (id)menuWithDelegate:(id)a3 additionalOptions:(int64_t)a4
{
  id v5 = a3;
  v6 = +[SCUIMoreHelpContextMenu menuWithDelegate:v5 additionalOptions:a4 interventionType:SCUICurrentInterventionType()];

  return v6;
}

+ (id)menuWithDelegate:(id)a3 contextDictionary:(id)a4 additionalOptions:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = +[SCUIMoreHelpContextMenu menuWithDelegate:v8 contextDictionary:v7 additionalOptions:a5 interventionType:SCUICurrentInterventionType()];

  return v9;
}

+ (id)menuWithDelegate:(id)a3 additionalOptions:(int64_t)a4 interventionType:(int64_t)a5
{
  return +[SCUIMoreHelpContextMenu menuWithDelegate:a3 contextDictionary:0 additionalOptions:a4 interventionType:a5];
}

+ (id)menuWithDelegate:(id)a3 contextDictionary:(id)a4 additionalOptions:(int64_t)a5 interventionType:(int64_t)a6
{
  v9 = (void *)MEMORY[0x263EFF960];
  id v10 = a4;
  id v11 = a3;
  v12 = [v9 currentLocale];
  v13 = +[SCUIMoreHelpMenuModel modelWithOptions:a5 contextDictionary:v10 interventionType:a6 locale:v12];

  v14 = [[SCUIMoreHelpContextMenuContainer alloc] initWithOptions:a5 contextDictionary:v10 interventionType:a6];
  v15 = +[SCUIMoreHelpContextMenu menuActionsFromModel:v13 menuInfo:v14 menuDelegate:v11];

  if (a6 == 2)
  {
    v16 = &stru_270980950;
  }
  else
  {
    v16 = [v13 title];
  }
  v17 = [MEMORY[0x263F82940] menuWithTitle:v16 children:v15];

  return v17;
}

+ (id)menuActionsFromModel:(id)a3 menuInfo:(id)a4 menuDelegate:(id)a5
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v32 = a3;
  id v7 = a4;
  id v27 = a5;
  objc_initWeak(&location, v27);
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3032000000;
  v46[3] = __Block_byref_object_copy_;
  v46[4] = __Block_byref_object_dispose_;
  id v28 = v7;
  id v47 = v28;
  v31 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v8 = [v32 actions];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v42 objects:v49 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v43;
    id obj = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v43 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v38 = 0;
        v39 = &v38;
        uint64_t v40 = 0x2020000000;
        uint64_t v41 = 0;
        uint64_t v41 = [v12 actionID];
        if (v39[3] == 9)
        {
          v13 = [v28 contextDictionary];
          v14 = [v13 objectForKeyedSubscript:@"SCUIMoreHelpContextMenuShowContentNameKey"];

          if (v14)
          {
            id v15 = [NSString alloc];
            v16 = +[SCUIResources localizedStringForKey:@"SHOW_CONTENT_NAME_TITLE %@"];
            v17 = objc_msgSend(v15, "initWithFormat:", v16, v14, v27);
            [v12 setTitle:v17];
          }
        }
        v18 = [v12 iconSystemName];
        if (v18)
        {
          v19 = (void *)MEMORY[0x263F827E8];
          v20 = [v12 iconSystemName];
          v21 = [v19 systemImageNamed:v20];
        }
        else
        {
          v21 = 0;
        }

        v22 = (void *)MEMORY[0x263F823D0];
        v23 = [v12 title];
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __70__SCUIMoreHelpContextMenu_menuActionsFromModel_menuInfo_menuDelegate___block_invoke;
        v33[3] = &unk_2654AB640;
        v35 = &v38;
        objc_copyWeak(v37, &location);
        v36 = v46;
        v37[1] = a1;
        id v34 = v32;
        v24 = [v22 actionWithTitle:v23 image:v21 identifier:0 handler:v33];

        if ([v12 destructive]) {
          [v24 setAttributes:2];
        }
        [v31 addObject:v24];

        objc_destroyWeak(v37);
        _Block_object_dispose(&v38, 8);
      }
      id v8 = obj;
      uint64_t v9 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
    }
    while (v9);
  }

  v25 = (void *)[v31 copy];
  _Block_object_dispose(v46, 8);

  objc_destroyWeak(&location);

  return v25;
}

void __70__SCUIMoreHelpContextMenu_menuActionsFromModel_menuInfo_menuDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v23 = a2;
  switch(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    case 1:
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      char v4 = objc_opt_respondsToSelector();

      if (v4)
      {
        id v5 = objc_loadWeakRetained((id *)(a1 + 56));
        [v5 didMessageSomeone:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
        goto LABEL_19;
      }
      +[SCUIMoreHelpContextMenu didMessageSomeoneDefaultImplementationWith:](SCUIMoreHelpContextMenu, "didMessageSomeoneDefaultImplementationWith:", [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) interventionType]);
      break;
    case 2:
      id v6 = objc_loadWeakRetained((id *)(a1 + 56));
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        id v5 = objc_loadWeakRetained((id *)(a1 + 56));
        [v5 didAskForMoreHelp:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
        goto LABEL_19;
      }
      break;
    case 3:
      id v8 = objc_loadWeakRetained((id *)(a1 + 56));
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        id v5 = objc_loadWeakRetained((id *)(a1 + 56));
        [v5 didLeaveConversation:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
        goto LABEL_19;
      }
      break;
    case 4:
      id v10 = objc_loadWeakRetained((id *)(a1 + 56));
      char v11 = objc_opt_respondsToSelector();

      if (v11)
      {
        id v5 = objc_loadWeakRetained((id *)(a1 + 56));
        [v5 didBlockContact:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
        goto LABEL_19;
      }
      break;
    case 5:
      id v12 = objc_loadWeakRetained((id *)(a1 + 56));
      char v13 = objc_opt_respondsToSelector();

      if (v13)
      {
        id v5 = objc_loadWeakRetained((id *)(a1 + 56));
        [v5 didBlockContacts:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
        goto LABEL_19;
      }
      break;
    case 6:
      id v14 = objc_loadWeakRetained((id *)(a1 + 56));
      char v15 = objc_opt_respondsToSelector();

      if (v15)
      {
        id v5 = objc_loadWeakRetained((id *)(a1 + 56));
        [v5 didDeleteItem:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
        goto LABEL_19;
      }
      break;
    case 7:
      id v16 = objc_loadWeakRetained((id *)(a1 + 56));
      char v17 = objc_opt_respondsToSelector();

      if (v17)
      {
        id v5 = objc_loadWeakRetained((id *)(a1 + 56));
        [v5 didHidePhoto:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
        goto LABEL_19;
      }
      break;
    case 8:
      v18 = *(void **)(a1 + 64);
      uint64_t v19 = *(void *)(a1 + 32);
      id v20 = objc_loadWeakRetained((id *)(a1 + 56));
      [v18 reportToAuthoritiesPressedForModel:v19 delegate:v20];

      break;
    case 9:
      id v21 = objc_loadWeakRetained((id *)(a1 + 56));
      char v22 = objc_opt_respondsToSelector();

      if (v22)
      {
        id v5 = objc_loadWeakRetained((id *)(a1 + 56));
        [v5 didShowContent:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
LABEL_19:
      }
      break;
    default:
      break;
  }
}

+ (void)didMessageSomeoneDefaultImplementationWith:(int64_t)a3
{
}

+ (void)reportToAuthoritiesPressedForModel:(id)a3 delegate:(id)a4
{
  id v16 = a3;
  id v5 = a4;
  if ([v5 conformsToProtocol:&unk_2709974E0])
  {
    id v6 = [MEMORY[0x263F82438] sharedApplication];
    char v7 = [v6 connectedScenes];
    id v8 = [v7 allObjects];
    char v9 = [v8 firstObject];
    id v10 = [v9 windows];
    char v11 = [v10 firstObject];
    id v12 = [v11 rootViewController];

    char v13 = [v16 authority];
    uint64_t v14 = [v16 interventionType];
    char v15 = [v16 contextDictionary];
    +[SCUIReportToAuthorities presentFlowFromController:v12 authority:v13 interventionType:v14 delegate:v5 contextDictionary:v15];
  }
}

@end