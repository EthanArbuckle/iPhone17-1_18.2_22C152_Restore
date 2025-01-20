@interface SESExpress
+ (id)getUWBExpressKeyIdentifiers:(id)a3 appletIdentifiers:(id)a4;
+ (id)processConfigurationChange:(id)a3 newConfiguration:(id)a4;
@end

@implementation SESExpress

+ (id)processConfigurationChange:(id)a3 newConfiguration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x263EFFA08];
  if (v5)
  {
    v8 = +[SESExpress getUWBExpressKeyIdentifiers:v5 appletIdentifiers:&unk_26C56DC00];
    v9 = [v7 setWithArray:v8];
  }
  else
  {
    v9 = objc_opt_new();
  }
  v10 = (void *)MEMORY[0x263EFFA08];
  if (v6)
  {
    v11 = +[SESExpress getUWBExpressKeyIdentifiers:v6 appletIdentifiers:&unk_26C56DC18];
    v12 = [v10 setWithArray:v11];
  }
  else
  {
    v12 = objc_opt_new();
  }
  if ([v9 isEqualToSet:v12])
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __58__SESExpress_processConfigurationChange_newConfiguration___block_invoke;
    v16[3] = &unk_2642195F0;
    id v17 = v12;
    v18 = &v19;
    [v9 enumerateObjectsUsingBlock:v16];
    if (*((unsigned char *)v20 + 24)) {
      v13 = &unk_26C56DC48;
    }
    else {
      v13 = (void *)MEMORY[0x263EFFA68];
    }
    id v14 = v13;

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    id v14 = &unk_26C56DC30;
  }

  return v14;
}

void __58__SESExpress_processConfigurationChange_newConfiguration___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = [v5 appletIdentifier];
  int v7 = [v6 isEqualToString:@"A000000909ACCE5501"];

  if (v7)
  {
    v8 = [*(id *)(a1 + 32) allObjects];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __58__SESExpress_processConfigurationChange_newConfiguration___block_invoke_2;
    v21[3] = &unk_2642195C8;
    id v9 = v5;
    id v22 = v9;
    v10 = [v8 find:v21];

    v11 = [v9 configuration];
    v12 = [v11 objectForKeyedSubscript:@"aliroGroupResolvingKeys"];

    v13 = [v10 configuration];
    id v14 = [v13 objectForKeyedSubscript:@"aliroGroupResolvingKeys"];

    if ((v12 == 0) == (v14 != 0) || v12 && ([v12 isEqual:v14] & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a3 = 1;
    }
    else
    {
      v15 = [v9 configuration];
      v16 = [v15 objectForKeyedSubscript:@"ECP2Info"];
      id v17 = [v16 objectForKeyedSubscript:@"associatedReaderIdentifiers"];

      v18 = [v10 configuration];
      uint64_t v19 = [v18 objectForKeyedSubscript:@"ECP2Info"];
      v20 = [v19 objectForKeyedSubscript:@"associatedReaderIdentifiers"];

      if ((v17 == 0) == (v20 != 0) || v17 && ([v17 isEqual:v20] & 1) == 0)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        *a3 = 1;
      }
    }
  }
}

uint64_t __58__SESExpress_processConfigurationChange_newConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 appletIdentifier];
  v4 = [*(id *)(a1 + 32) appletIdentifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

+ (id)getUWBExpressKeyIdentifiers:(id)a3 appletIdentifiers:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__SESExpress_getUWBExpressKeyIdentifiers_appletIdentifiers___block_invoke;
  v9[3] = &unk_264219618;
  id v10 = v5;
  id v6 = v5;
  int v7 = [a3 filterMap:v9];

  return v7;
}

id __60__SESExpress_getUWBExpressKeyIdentifiers_appletIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"appletIdentifier"];
  if (!v4
    || (id v5 = (void *)v4,
        [v3 objectForKeyedSubscript:@"appletIdentifier"],
        id v6 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        v5,
        (isKindOfClass & 1) == 0))
  {
    v8 = SESDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v20 = 138412290;
      id v21 = v3;
      _os_log_impl(&dword_2146ED000, v8, OS_LOG_TYPE_ERROR, "Missing or invalid appletIdentifier %@", (uint8_t *)&v20, 0xCu);
    }
    goto LABEL_12;
  }
  v8 = [v3 objectForKeyedSubscript:@"appletIdentifier"];
  if ([*(id *)(a1 + 32) containsObject:v8])
  {
    id v9 = [v3 objectForKeyedSubscript:@"keyIdentifier"];

    if (!v9) {
      goto LABEL_13;
    }
    id v10 = [v3 objectForKeyedSubscript:@"keyIdentifier"];
    objc_opt_class();
    char v11 = objc_opt_isKindOfClass();

    if (v11)
    {
      id v9 = [v3 objectForKeyedSubscript:@"UWBExpressEnabled"];

      if (!v9) {
        goto LABEL_13;
      }
      v12 = [v3 objectForKeyedSubscript:@"UWBExpressEnabled"];
      objc_opt_class();
      char v13 = objc_opt_isKindOfClass();

      if (v13)
      {
        id v14 = [v3 objectForKeyedSubscript:@"UWBExpressEnabled"];
        int v15 = [v14 BOOLValue];

        if (v15)
        {
          v16 = [v3 objectForKeyedSubscript:@"keyIdentifier"];
          id v9 = +[SESExpressKey withKeyIdentifier:v16 appletIdentifier:v8 configuration:v3];

          goto LABEL_13;
        }
        goto LABEL_12;
      }
      v18 = SESDefaultLogObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v20 = 138412290;
        id v21 = v3;
        uint64_t v19 = "Invalid UWBExpressEnabled %@";
        goto LABEL_20;
      }
    }
    else
    {
      v18 = SESDefaultLogObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v20 = 138412290;
        id v21 = v3;
        uint64_t v19 = "Invalid keyIdentifier %@";
LABEL_20:
        _os_log_impl(&dword_2146ED000, v18, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v20, 0xCu);
      }
    }
  }
LABEL_12:
  id v9 = 0;
LABEL_13:

  return v9;
}

@end