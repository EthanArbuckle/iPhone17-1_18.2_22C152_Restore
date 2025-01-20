@interface SCUIContactParentsHelper
+ (id)urlFromAddressList:(id)a3;
+ (void)obtainChatWithParentsURLForInterventionType:(int64_t)a3 completionHandler:(id)a4;
+ (void)obtainParentsForCurrentContact:(id)a3;
+ (void)openChatWithParentsForInterventionType:(int64_t)a3;
+ (void)openChatWithURL:(id)a3;
@end

@implementation SCUIContactParentsHelper

+ (void)openChatWithParentsForInterventionType:(int64_t)a3
{
  if (a3)
  {
    if (a3 == 1) {
      dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global);
    }
  }
  else
  {
    +[SCUIContactParentsHelper obtainParentsForCurrentContact:&__block_literal_global_19];
  }
}

void __67__SCUIContactParentsHelper_openChatWithParentsForInterventionType___block_invoke()
{
  id v0 = +[SCUIContactParentsHelper urlFromAddressList:0];
  +[SCUIContactParentsHelper openChatWithURL:v0];
}

void __67__SCUIContactParentsHelper_openChatWithParentsForInterventionType___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__SCUIContactParentsHelper_openChatWithParentsForInterventionType___block_invoke_3;
  block[3] = &unk_2654AB548;
  id v5 = v2;
  id v3 = v2;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __67__SCUIContactParentsHelper_openChatWithParentsForInterventionType___block_invoke_3(uint64_t a1)
{
  id v1 = +[SCUIContactParentsHelper urlFromAddressList:*(void *)(a1 + 32)];
  +[SCUIContactParentsHelper openChatWithURL:v1];
}

+ (void)obtainChatWithParentsURLForInterventionType:(int64_t)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v6 = (void (**)(void, void))v5;
  if (a3)
  {
    if (a3 == 1)
    {
      v7 = +[SCUIContactParentsHelper urlFromAddressList:0];
      ((void (**)(void, void *))v6)[2](v6, v7);
    }
  }
  else
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __90__SCUIContactParentsHelper_obtainChatWithParentsURLForInterventionType_completionHandler___block_invoke;
    v8[3] = &unk_2654AB570;
    id v9 = v5;
    +[SCUIContactParentsHelper obtainParentsForCurrentContact:v8];
  }
}

void __90__SCUIContactParentsHelper_obtainChatWithParentsURLForInterventionType_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = +[SCUIContactParentsHelper urlFromAddressList:a2];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

+ (void)openChatWithURL:(id)a3
{
  id v3 = (void *)MEMORY[0x263F82438];
  id v4 = a3;
  id v5 = [v3 sharedApplication];
  [v5 openURL:v4 options:MEMORY[0x263EFFA78] completionHandler:0];
}

+ (id)urlFromAddressList:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [MEMORY[0x263F08BD0] queryItemWithName:@"service" value:@"iMessage"];
  [v4 addObject:v5];

  v6 = (void *)MEMORY[0x263F08BD0];
  v7 = +[SCUIResources localizedStringForKey:@"MESSAGE_GROWNUP_BODY"];
  v8 = [v6 queryItemWithName:@"body" value:v7];
  [v4 addObject:v8];

  if ([v3 count])
  {
    id v9 = (void *)MEMORY[0x263F08BD0];
    v10 = [v3 componentsJoinedByString:@","];
    v11 = [v9 queryItemWithName:@"recipients" value:v10];
    [v4 addObject:v11];

    v12 = [MEMORY[0x263F08BD0] queryItemWithName:@"best-match" value:@"1"];
    [v4 addObject:v12];
  }
  v13 = [MEMORY[0x263F08BA0] componentsWithString:@"sms://open"];
  [v13 setQueryItems:v4];
  v14 = [v13 URL];

  return v14;
}

+ (void)obtainParentsForCurrentContact:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F3BF48]);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__SCUIContactParentsHelper_obtainParentsForCurrentContact___block_invoke;
  v6[3] = &unk_2654AB598;
  id v7 = v3;
  id v5 = v3;
  [v4 startRequestWithCompletionHandler:v6];
}

void __59__SCUIContactParentsHelper_obtainParentsForCurrentContact___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v40 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  if (!v5)
  {
    v35 = [MEMORY[0x263F17660] clientUI];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      __59__SCUIContactParentsHelper_obtainParentsForCurrentContact___block_invoke_cold_1((uint64_t)v6, v35);
    }

LABEL_31:
    uint64_t v34 = *(void *)(a1 + 32);
LABEL_32:
    (*(void (**)(uint64_t, void))(v34 + 16))(v34, 0);
    goto LABEL_33;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v7 = [v5 members];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (!v8)
  {

    goto LABEL_31;
  }
  uint64_t v9 = v8;
  uint64_t v37 = a1;
  id v38 = v6;
  id v39 = v5;
  BOOL v10 = 0;
  uint64_t v11 = *(void *)v43;
  unint64_t v12 = 0x263F17000uLL;
  uint64_t v41 = *(void *)v43;
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v43 != v11) {
        objc_enumerationMutation(v7);
      }
      v14 = *(void **)(*((void *)&v42 + 1) + 8 * v13);
      if (![v14 isMe])
      {
        if (![v14 isParent]) {
          goto LABEL_20;
        }
        BOOL v18 = v10;
        v19 = v7;
        v20 = [*(id *)(v12 + 1632) clientUI];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v47[0] = v14;
          _os_log_impl(&dword_25C01A000, v20, OS_LOG_TYPE_DEFAULT, "Found parent: %@", buf, 0xCu);
        }

        v21 = [v14 contact];
        v22 = [v21 phoneNumbers];
        v23 = [v22 firstObject];
        v24 = [v23 value];
        v25 = [v24 stringValue];

        v26 = [v14 contact];
        v27 = [v26 emailAddresses];
        v28 = [v27 firstObject];
        v29 = [v28 value];

        if ([v25 length])
        {
          [v40 addObject:v25];
          id v7 = v19;
          goto LABEL_18;
        }
        id v7 = v19;
        if ([v29 length])
        {
          [v40 addObject:v29];
LABEL_18:
          BOOL v10 = v18;
        }
        else
        {
          v30 = [v14 appleID];
          uint64_t v31 = [v30 length];

          BOOL v10 = v18;
          if (v31)
          {
            v32 = [v14 appleID];
            [v40 addObject:v32];
          }
        }

        unint64_t v12 = 0x263F17000;
        uint64_t v11 = v41;
        goto LABEL_20;
      }
      v15 = [*(id *)(v12 + 1632) clientUI];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = [v14 memberType];
        uint64_t v17 = [v14 age];
        *(_DWORD *)buf = 67109376;
        LODWORD(v47[0]) = v16;
        WORD2(v47[0]) = 2048;
        *(void *)((char *)v47 + 6) = v17;
        _os_log_impl(&dword_25C01A000, v15, OS_LOG_TYPE_DEFAULT, "Found current member of type: %d (%lu)", buf, 0x12u);
      }

      BOOL v10 = [v14 memberType] != -1;
LABEL_20:
      ++v13;
    }
    while (v9 != v13);
    uint64_t v33 = [v7 countByEnumeratingWithState:&v42 objects:v48 count:16];
    uint64_t v9 = v33;
  }
  while (v33);

  uint64_t v34 = *(void *)(v37 + 32);
  if (!v10)
  {
    id v6 = v38;
    id v5 = v39;
    goto LABEL_32;
  }
  v36 = (void *)[v40 copy];
  (*(void (**)(uint64_t, void *))(v34 + 16))(v34, v36);

  id v6 = v38;
  id v5 = v39;
LABEL_33:
}

void __59__SCUIContactParentsHelper_obtainParentsForCurrentContact___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25C01A000, a2, OS_LOG_TYPE_ERROR, "Error fetching FamilyCircle: %@", (uint8_t *)&v2, 0xCu);
}

@end