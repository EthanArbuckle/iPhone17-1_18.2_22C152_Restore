@interface ICSkypeCallContentMapping
- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5;
- (void)getStringRepresentationWithoutContact:(id)a3 withInput:(id)a4 parameters:(id)a5;
@end

@implementation ICSkypeCallContentMapping

- (void)getStringRepresentationWithoutContact:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __88__ICSkypeCallContentMapping_getStringRepresentationWithoutContact_withInput_parameters___block_invoke;
  v14[3] = &unk_1E6558FA8;
  v16 = self;
  id v17 = v8;
  id v15 = v9;
  id v12 = v9;
  id v13 = v8;
  [v10 generateCollectionByCoercingToItemClasses:v11 completionHandler:v14];
}

id __88__ICSkypeCallContentMapping_getStringRepresentationWithoutContact_withInput_parameters___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 32);
  v5.receiver = *(id *)(a1 + 40);
  v5.super_class = (Class)ICSkypeCallContentMapping;
  return objc_msgSendSuper2(&v5, sel_getStringRepresentation_withInput_parameters_, v2, a2, v3);
}

- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__ICSkypeCallContentMapping_getStringRepresentation_withInput_parameters___block_invoke;
  v14[3] = &unk_1E65565E0;
  void v14[4] = self;
  id v15 = v9;
  id v16 = v10;
  id v17 = v8;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(ICContentMapping *)self getContentCollection:v14 withInput:v12 parameters:v11];
}

void __74__ICSkypeCallContentMapping_getStringRepresentation_withInput_parameters___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v61[2] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v41 = a3;
  id v43 = a4;
  v40 = v7;
  if ([v7 numberOfItems])
  {
    uint64_t v38 = a1;
    v42 = [v7 collectionByFilteringToItemClass:objc_opt_class() excludedItems:0];
    if ([v42 numberOfItems])
    {
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id obj = [v42 items];
      uint64_t v37 = [obj countByEnumeratingWithState:&v49 objects:v59 count:16];
      if (v37)
      {
        uint64_t v8 = *(void *)v50;
        uint64_t v35 = *(void *)v50;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v50 != v8)
            {
              uint64_t v10 = v9;
              objc_enumerationMutation(obj);
              uint64_t v9 = v10;
            }
            uint64_t v36 = v9;
            id v11 = *(void **)(*((void *)&v49 + 1) + 8 * v9);
            long long v45 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            id v12 = [v11 contact];
            id v44 = [v12 instantMessageAddresses];

            uint64_t v13 = [v44 countByEnumeratingWithState:&v45 objects:v58 count:16];
            if (v13)
            {
              uint64_t v14 = *(void *)v46;
              do
              {
                for (uint64_t i = 0; i != v13; ++i)
                {
                  if (*(void *)v46 != v14) {
                    objc_enumerationMutation(v44);
                  }
                  id v16 = *(void **)(*((void *)&v45 + 1) + 8 * i);
                  id v17 = [v16 value];
                  v18 = [v17 service];
                  uint64_t v54 = 0;
                  v55 = &v54;
                  uint64_t v56 = 0x2020000000;
                  v19 = (id *)getCNInstantMessageServiceSkypeSymbolLoc_ptr;
                  uint64_t v57 = getCNInstantMessageServiceSkypeSymbolLoc_ptr;
                  if (!getCNInstantMessageServiceSkypeSymbolLoc_ptr)
                  {
                    v53[0] = MEMORY[0x1E4F143A8];
                    v53[1] = 3221225472;
                    v53[2] = __getCNInstantMessageServiceSkypeSymbolLoc_block_invoke;
                    v53[3] = &unk_1E6558B78;
                    v53[4] = &v54;
                    __getCNInstantMessageServiceSkypeSymbolLoc_block_invoke(v53);
                    v19 = (id *)v55[3];
                  }
                  _Block_object_dispose(&v54, 8);
                  if (!v19)
                  {
                    v33 = [MEMORY[0x1E4F28B00] currentHandler];
                    v34 = [NSString stringWithUTF8String:"NSString *getCNInstantMessageServiceSkype(void)"];
                    objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, @"ICSkypeCallContentMapping.m", 14, @"%s", dlerror());

                    __break(1u);
                  }
                  id v20 = *v19;
                  if ([v18 isEqualToString:v20])
                  {
                    v21 = [v16 value];
                    v22 = [v21 username];
                    BOOL v23 = [v22 length] == 0;

                    if (!v23)
                    {
                      uint64_t v30 = *(void *)(v38 + 56);
                      v31 = [v16 value];
                      v32 = [v31 username];
                      (*(void (**)(uint64_t, void *, void))(v30 + 16))(v30, v32, 0);

                      goto LABEL_30;
                    }
                  }
                  else
                  {
                  }
                }
                uint64_t v13 = [v44 countByEnumeratingWithState:&v45 objects:v58 count:16];
              }
              while (v13);
            }

            uint64_t v9 = v36 + 1;
            uint64_t v8 = v35;
          }
          while (v36 + 1 != v37);
          uint64_t v37 = [obj countByEnumeratingWithState:&v49 objects:v59 count:16];
          uint64_t v8 = v35;
        }
        while (v37);
      }
    }
    [*(id *)(v38 + 32) getStringRepresentationWithoutContact:*(void *)(v38 + 56) withInput:*(void *)(v38 + 40) parameters:*(void *)(v38 + 48)];
LABEL_30:
  }
  else
  {
    v24 = [*(id *)(a1 + 32) destinationType];
    char v25 = [v24 isEqualToString:@"URLQueryValue"];

    if (!v43 && (v25 & 1) == 0)
    {
      v26 = (void *)MEMORY[0x1E4F28C58];
      v60[0] = *MEMORY[0x1E4F28588];
      v27 = WFLocalizedString(@"Error");
      v61[0] = v27;
      v60[1] = *MEMORY[0x1E4F28568];
      v28 = WFLocalizedString(@"No phone numbers or Skype usernames were passed into this action.");
      v61[1] = v28;
      v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:2];
      id v43 = [v26 errorWithDomain:*MEMORY[0x1E4F281F8] code:260 userInfo:v29];
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

@end