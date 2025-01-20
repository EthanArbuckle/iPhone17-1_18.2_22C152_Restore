@interface PKAMSMediaItemsService
- (PKAMSMediaItemsService)init;
- (id)fetchItemsWithRequest:(id)a3 completion:(id)a4;
@end

@implementation PKAMSMediaItemsService

- (PKAMSMediaItemsService)init
{
  v9.receiver = self;
  v9.super_class = (Class)PKAMSMediaItemsService;
  v2 = [(PKAMSMediaItemsService *)&v9 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F4DBD8];
    v4 = [MEMORY[0x1E4F4DD40] bagSubProfile];
    v5 = [MEMORY[0x1E4F4DD40] bagSubProfileVersion];
    uint64_t v6 = [v3 bagForProfile:v4 profileVersion:v5];
    bag = v2->_bag;
    v2->_bag = (AMSBag *)v6;
  }
  return v2;
}

- (id)fetchItemsWithRequest:(id)a3 completion:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v7)
  {
    v20 = 0;
    goto LABEL_21;
  }
  v33 = v7;
  objc_super v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [v6 description];
    *(_DWORD *)buf = 138412290;
    v44 = v10;
    _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "PKAMSMediaItemsService: Looking up item(s) from AppleMediaServices with request: %@.", buf, 0xCu);
  }
  unint64_t v11 = [v6 type];
  if (v11 == 1) {
    uint64_t v12 = 202;
  }
  else {
    uint64_t v12 = 200;
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v14 = [v6 artworkConfiguration];
  BOOL v15 = v14 != 0;
  uint64_t v16 = [v14 animatedArtworkType];
  BOOL v32 = v16 != 0;
  if (v11 == 2) {
    uint64_t v17 = 205;
  }
  else {
    uint64_t v17 = v12;
  }
  if (v11 < 2) {
    goto LABEL_13;
  }
  if (v11 == 2)
  {
    [v13 addObject:@"artistBio"];
LABEL_13:
    v18 = [v6 musicRequest];
    v19 = [v18 musicIDs];

    if (v16) {
      [v13 addObject:@"editorialVideo"];
    }
    BOOL v15 = v14 != 0;
    goto LABEL_18;
  }
  v19 = 0;
LABEL_18:
  v21 = (void *)[objc_alloc(MEMORY[0x1E4F4DD40]) initWithType:v17 clientIdentifier:@"com.apple.Passbook" clientVersion:@"1" bag:self->_bag];
  v22 = v21;
  if (v19) {
    [v21 setItemIdentifiers:v19];
  }
  v41 = @"extend";
  v23 = v13;
  v24 = [v13 componentsJoinedByString:@","];
  v42 = v24;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
  [v22 setAdditionalQueryParams:v25];

  v26 = [v22 perform];
  v27 = [[PKAMSPromiseWrapper alloc] initWithAMSPromise:v26];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __59__PKAMSMediaItemsService_fetchItemsWithRequest_completion___block_invoke;
  v34[3] = &unk_1E59E0018;
  v28 = v27;
  BOOL v39 = v15;
  v35 = v28;
  id v36 = v14;
  BOOL v40 = v32;
  unint64_t v38 = v11;
  v8 = v33;
  id v37 = v33;
  id v29 = v14;
  [v26 addFinishBlock:v34];
  v30 = v37;
  v20 = v28;

LABEL_21:

  return v20;
}

void __59__PKAMSMediaItemsService_fetchItemsWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) invalidate];
  id v41 = v6;
  v43 = v5;
  if (v6)
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(v6, "localizedDescription", v6, v5);
      *(_DWORD *)buf = 138412290;
      uint64_t v65 = (uint64_t)v8;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "PKAMSMediaItemsService: Received error: %@.", buf, 0xCu);
    }
    objc_super v9 = 0;
  }
  else
  {
    objc_super v9 = objc_msgSend(v5, "responseDataItems", 0, v5);
    uint64_t v10 = [v9 count];
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v65 = v10;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "PKAMSMediaItemsService: Received %ld results from AppleMediaServices", buf, 0xCu);
    }
  }

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v12 = objc_alloc_init(MEMORY[0x1E4F84518]);
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v13 = v9;
  uint64_t v46 = [v13 countByEnumeratingWithState:&v59 objects:v63 count:16];
  if (v46)
  {
    uint64_t v14 = *(void *)v60;
    uint64_t v44 = a1;
    uint64_t v45 = *(void *)v60;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v60 != v14) {
          objc_enumerationMutation(v13);
        }
        uint64_t v16 = *(void **)(*((void *)&v59 + 1) + 8 * v15);
        if (v16)
        {
          id v17 = v16;
          int v18 = PKIsPad();
          v19 = @"ios";
          if (v18) {
            v19 = @"ipados";
          }
          v20 = v19;
          v21 = [v17 PKDictionaryForKey:@"attributes"];

          uint64_t v22 = objc_opt_class();
          v23 = [v21 PKDictionaryOfKeyClass:v22 valueClass:objc_opt_class() ForKey:@"platformAttributes"];
          v24 = v23;
          if (v23)
          {
            v25 = [v23 objectForKeyedSubscript:v20];
            v26 = (void *)[v25 mutableCopy];

            if (v26) {
              goto LABEL_18;
            }
            v27 = [v24 allValues];
            [v27 firstObject];
            id v28 = v11;
            id v29 = v13;
            v31 = id v30 = v12;
            v26 = (void *)[v31 mutableCopy];

            id v12 = v30;
            id v13 = v29;
            id v11 = v28;
            a1 = v44;

            if (v26)
            {
LABEL_18:
              objc_msgSend(v26, "addEntriesFromDictionary:", v21, v41);
              BOOL v32 = (void *)[objc_alloc(MEMORY[0x1E4F4DCF8]) initWithLookupDictionary:v26];
            }
            else
            {
              BOOL v32 = 0;
            }
            uint64_t v14 = v45;
          }
          else if (v21)
          {
            BOOL v32 = (void *)[objc_alloc(MEMORY[0x1E4F4DCF8]) initWithLookupDictionary:v21];
          }
          else
          {
            BOOL v32 = 0;
          }
        }
        else
        {
          BOOL v32 = 0;
        }
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __59__PKAMSMediaItemsService_fetchItemsWithRequest_completion___block_invoke_101;
        v52[3] = &unk_1E59DFFC8;
        id v53 = v32;
        char v57 = *(unsigned char *)(a1 + 64);
        id v33 = *(id *)(a1 + 40);
        char v58 = *(unsigned char *)(a1 + 65);
        uint64_t v34 = *(void *)(a1 + 56);
        id v54 = v33;
        uint64_t v56 = v34;
        id v55 = v11;
        id v35 = v32;
        [v12 addOperation:v52];

        ++v15;
      }
      while (v46 != v15);
      uint64_t v36 = [v13 countByEnumeratingWithState:&v59 objects:v63 count:16];
      uint64_t v46 = v36;
    }
    while (v36);
  }

  if (*(unsigned char *)(a1 + 64))
  {
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __59__PKAMSMediaItemsService_fetchItemsWithRequest_completion___block_invoke_2;
    v50[3] = &unk_1E59CFB08;
    id v51 = v11;
    [v12 addOperation:v50];
  }
  id v37 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v41);
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __59__PKAMSMediaItemsService_fetchItemsWithRequest_completion___block_invoke_4;
  v47[3] = &unk_1E59DFFF0;
  id v38 = *(id *)(a1 + 48);
  id v48 = v11;
  id v49 = v38;
  id v39 = v11;
  id v40 = (id)[v12 evaluateWithInput:v37 completion:v47];
}

void __59__PKAMSMediaItemsService_fetchItemsWithRequest_completion___block_invoke_101(uint64_t a1, void *a2, void *a3, void *a4)
{
  v65[2] = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  uint64_t v10 = a4;
  id v11 = *(void **)(a1 + 32);
  if (v11)
  {
    if (*(unsigned char *)(a1 + 64))
    {
      id v12 = [v11 artwork];
      id v13 = [v12 firstObject];
    }
    else
    {
      id v13 = 0;
    }
    [*(id *)(a1 + 40) artworkSize];
    uint64_t v15 = (uint64_t)v14;
    uint64_t v17 = (uint64_t)v16;
    unint64_t v18 = [*(id *)(a1 + 40) cropType];
    if (v18 <= 7) {
      id v4 = **((id **)&unk_1E59E0060 + v18);
    }
    v19 = [v13 URLWithHeight:v15 width:v17 cropStyle:v4 format:*MEMORY[0x1E4F4DA80]];

    if (*(unsigned char *)(a1 + 65))
    {
      v20 = [*(id *)(a1 + 32) itemDictionary];
      v21 = [v20 objectForKeyedSubscript:@"editorialVideo"];
      unint64_t v22 = [*(id *)(a1 + 40) animatedArtworkType] - 1;
      if (v22 > 3) {
        v23 = 0;
      }
      else {
        v23 = off_1E59E00A0[v22];
      }
      v25 = [v21 objectForKeyedSubscript:v23];
      v26 = [v25 objectForKeyedSubscript:@"video"];

      if (v26)
      {
        v24 = [MEMORY[0x1E4F1CB10] URLWithString:v26];
      }
      else
      {
        v24 = 0;
      }
    }
    else
    {
      v24 = 0;
    }
    if (*(void *)(a1 + 56) > 2uLL)
    {
      BOOL v32 = 0;
    }
    else
    {
      v27 = [*(id *)(a1 + 32) itemDictionary];
      id v28 = [v27 objectForKeyedSubscript:@"curatorName"];

      id v29 = [*(id *)(a1 + 32) itemDictionary];
      id v30 = [v29 objectForKeyedSubscript:@"playlistType"];

      long long v62 = v30;
      if ([v30 isEqualToString:@"editorial"]) {
        char v31 = [v28 containsString:@"Apple Music"];
      }
      else {
        char v31 = 0;
      }
      v63 = v19;
      id v33 = [PKAMSMediaLookupItemMusic alloc];
      uint64_t v58 = *(void *)(a1 + 56);
      long long v59 = v33;
      [*(id *)(a1 + 32) displayName];
      v61 = id v60 = v9;
      uint64_t v34 = *(void **)(a1 + 32);
      if (v34)
      {
        char v54 = v31;
        id v55 = v28;
        uint64_t v56 = v13;
        id v57 = v8;
        uint64_t v35 = *(void *)(a1 + 56);
        uint64_t v36 = [v34 itemDictionary];
        id v37 = [v36 objectForKeyedSubscript:*MEMORY[0x1E4F4DAA0]];
        id v38 = [v37 objectForKeyedSubscript:*MEMORY[0x1E4F4DAA8]];

        if (!v38)
        {
          if (v35 != 2
            || ([v36 objectForKeyedSubscript:@"artistBio"],
                (id v38 = objc_claimAutoreleasedReturnValue()) == 0))
          {
            id v39 = [v36 objectForKeyedSubscript:@"editorialNotes"];
            id v40 = [v39 objectForKeyedSubscript:@"short"];
            id v41 = v40;
            if (v40)
            {
              id v42 = v40;
            }
            else
            {
              id v42 = [v39 objectForKeyedSubscript:@"standardNote"];
            }
            id v38 = v42;
          }
        }
        id v44 = objc_alloc(MEMORY[0x1E4F28B18]);
        uint64_t v45 = [v38 dataUsingEncoding:4];
        uint64_t v46 = *MEMORY[0x1E4FB0708];
        uint64_t v47 = *MEMORY[0x1E4FB06D0];
        v64[0] = *MEMORY[0x1E4FB06D8];
        v64[1] = v47;
        v65[0] = v46;
        id v48 = [NSNumber numberWithInt:4];
        v65[1] = v48;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:2];
        v50 = id v49 = v36;
        id v51 = (void *)[v44 initWithData:v45 options:v50 documentAttributes:0 error:0];
        v43 = [v51 string];

        uint64_t v34 = *(void **)(a1 + 32);
        id v13 = v56;
        id v8 = v57;
        id v28 = v55;
        char v31 = v54;
      }
      else
      {
        v43 = 0;
      }
      v52 = [v34 productPageURL];
      LOBYTE(v53) = v31;
      BOOL v32 = [(PKAMSMediaLookupItemMusic *)v59 initWithType:v58 artwork:0 animatedArtworkURL:v24 displayName:v61 itemDescription:v43 musicURL:v52 appleCurated:v53];

      v19 = v63;
      [(PKAMSMediaLookupItemMusic *)v32 setArtworkURL:v63];

      id v9 = v60;
    }
    [*(id *)(a1 + 48) safelyAddObject:v32];
  }
  v10[2](v10, v9, 0);
}

void __59__PKAMSMediaItemsService_fetchItemsWithRequest_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = *(void **)(a1 + 32);
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  v27 = __59__PKAMSMediaItemsService_fetchItemsWithRequest_completion___block_invoke_3;
  id v28 = &unk_1E59CAD68;
  id v24 = v7;
  id v30 = v24;
  id v23 = v6;
  id v29 = v23;
  id v9 = v8;
  unint64_t v22 = &v25;
  id v10 = objc_alloc_init(MEMORY[0x1E4F84518]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v37 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if ((unint64_t)objc_msgSend(v16, "type", v22, v23, v24, v25, v26, v27, v28, v29, v30) > 2)
        {
          v19 = 0;
          id v18 = 0;
        }
        else
        {
          uint64_t v17 = [v16 musicItem];
          id v18 = [v17 artworkURL];
          v19 = [v17 animatedArtworkURL];

          if (v18)
          {
            v33[0] = MEMORY[0x1E4F143A8];
            v33[1] = 3221225472;
            v33[2] = ___PopulateArtworkForItems_block_invoke;
            v33[3] = &unk_1E59CE708;
            id v18 = v18;
            id v34 = v18;
            uint64_t v35 = v16;
            [v10 addOperation:v33];
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v13);
  }

  v20 = [MEMORY[0x1E4F1CA98] null];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = ___PopulateArtworkForItems_block_invoke_2_173;
  v31[3] = &unk_1E59CEC00;
  BOOL v32 = v22;
  v21 = [v10 evaluateWithInput:v20 completion:v31];
}

uint64_t __59__PKAMSMediaItemsService_fetchItemsWithRequest_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __59__PKAMSMediaItemsService_fetchItemsWithRequest_completion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  [a4 isCanceled];
  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v5();
}

- (void).cxx_destruct
{
}

@end