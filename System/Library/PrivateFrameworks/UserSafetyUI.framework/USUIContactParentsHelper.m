@interface USUIContactParentsHelper
+ (id)urlFromAddressList:(id)a3;
+ (void)obtainChatWithParentsURLForInterventionType:(int64_t)a3 completionHandler:(id)a4;
+ (void)obtainParentsForCurrentContact:(id)a3;
+ (void)openChatWithParentsForInterventionType:(int64_t)a3;
+ (void)openChatWithURL:(id)a3;
@end

@implementation USUIContactParentsHelper

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
    +[USUIContactParentsHelper obtainParentsForCurrentContact:&__block_literal_global_19];
  }
}

void __67__USUIContactParentsHelper_openChatWithParentsForInterventionType___block_invoke()
{
  id v0 = +[USUIContactParentsHelper urlFromAddressList:0];
  +[USUIContactParentsHelper openChatWithURL:v0];
}

void __67__USUIContactParentsHelper_openChatWithParentsForInterventionType___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__USUIContactParentsHelper_openChatWithParentsForInterventionType___block_invoke_3;
  block[3] = &unk_26556E6B0;
  id v5 = v2;
  id v3 = v2;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __67__USUIContactParentsHelper_openChatWithParentsForInterventionType___block_invoke_3(uint64_t a1)
{
  id v1 = +[USUIContactParentsHelper urlFromAddressList:*(void *)(a1 + 32)];
  +[USUIContactParentsHelper openChatWithURL:v1];
}

+ (void)obtainChatWithParentsURLForInterventionType:(int64_t)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v6 = (void (**)(void, void))v5;
  if (a3)
  {
    if (a3 == 1)
    {
      v7 = +[USUIContactParentsHelper urlFromAddressList:0];
      ((void (**)(void, void *))v6)[2](v6, v7);
    }
  }
  else
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __90__USUIContactParentsHelper_obtainChatWithParentsURLForInterventionType_completionHandler___block_invoke;
    v8[3] = &unk_26556E6D8;
    id v9 = v5;
    +[USUIContactParentsHelper obtainParentsForCurrentContact:v8];
  }
}

void __90__USUIContactParentsHelper_obtainChatWithParentsURLForInterventionType_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = +[USUIContactParentsHelper urlFromAddressList:a2];
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
  v7 = [MEMORY[0x263F67DD8] localizedStringForKey:@"MESSAGE_GROWNUP_BODY"];
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
  v6[2] = __59__USUIContactParentsHelper_obtainParentsForCurrentContact___block_invoke;
  v6[3] = &unk_26556E700;
  id v7 = v3;
  id v5 = v3;
  [v4 startRequestWithCompletionHandler:v6];
}

void __59__USUIContactParentsHelper_obtainParentsForCurrentContact___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v37 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  if (!v5)
  {
    v32 = [MEMORY[0x263F845D8] clientUI];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      __59__USUIContactParentsHelper_obtainParentsForCurrentContact___block_invoke_cold_1((uint64_t)v6, v32);
    }

    goto LABEL_26;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v7 = [v5 members];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (!v8)
  {

LABEL_26:
    uint64_t v31 = *(void *)(a1 + 32);
    goto LABEL_27;
  }
  uint64_t v9 = v8;
  uint64_t v34 = a1;
  id v35 = v6;
  id v36 = v5;
  BOOL v10 = 0;
  uint64_t v11 = *(void *)v40;
  unint64_t v12 = 0x263F84000uLL;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v40 != v11) {
        objc_enumerationMutation(v7);
      }
      v14 = *(void **)(*((void *)&v39 + 1) + 8 * i);
      if ([v14 isMe])
      {
        v15 = [*(id *)(v12 + 1496) clientUI];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = [v14 memberType];
          uint64_t v17 = [v14 age];
          *(_DWORD *)buf = 67109376;
          LODWORD(v44[0]) = v16;
          WORD2(v44[0]) = 2048;
          *(void *)((char *)v44 + 6) = v17;
          _os_log_impl(&dword_260B37000, v15, OS_LOG_TYPE_DEFAULT, "Found current member of type: %d (%lu)", buf, 0x12u);
        }

        BOOL v10 = [v14 memberType] != -1;
      }
      else if ([v14 isParent])
      {
        BOOL v38 = v10;
        v18 = [*(id *)(v12 + 1496) clientUI];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v44[0] = v14;
          _os_log_impl(&dword_260B37000, v18, OS_LOG_TYPE_DEFAULT, "Found parent: %@", buf, 0xCu);
        }

        v19 = [v14 contact];
        v20 = [v19 phoneNumbers];
        v21 = [v20 firstObject];
        v22 = [v21 value];
        v23 = [v22 stringValue];

        v24 = [v14 contact];
        v25 = [v24 emailAddresses];
        v26 = [v25 firstObject];
        v27 = [v26 value];

        uint64_t v28 = [v23 length];
        v29 = v23;
        if (v28 || (uint64_t v30 = objc_msgSend(v27, "length", v23), v29 = v27, v30)) {
          [v37 addObject:v29];
        }

        unint64_t v12 = 0x263F84000;
        BOOL v10 = v38;
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v39 objects:v45 count:16];
  }
  while (v9);

  uint64_t v31 = *(void *)(v34 + 32);
  if (v10)
  {
    v33 = (void *)[v37 copy];
    (*(void (**)(uint64_t, void *))(v31 + 16))(v31, v33);

    id v6 = v35;
    id v5 = v36;
    goto LABEL_28;
  }
  id v6 = v35;
  id v5 = v36;
LABEL_27:
  (*(void (**)(uint64_t, void))(v31 + 16))(v31, 0);
LABEL_28:
}

void __59__USUIContactParentsHelper_obtainParentsForCurrentContact___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_260B37000, a2, OS_LOG_TYPE_ERROR, "Error fetching FamilyCircle: %@", (uint8_t *)&v2, 0xCu);
}

@end