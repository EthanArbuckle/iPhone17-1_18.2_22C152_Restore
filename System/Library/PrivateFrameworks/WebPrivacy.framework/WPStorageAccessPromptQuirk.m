@interface WPStorageAccessPromptQuirk
- (BOOL)isValid;
- (NSArray)triggerPages;
- (NSDictionary)domainPairings;
- (NSDictionary)quirkDomains;
- (NSString)name;
- (WPStorageAccessPromptQuirk)initWithName:(id)a3 withDomainData:(id)a4;
- (WPStorageAccessPromptQuirk)initWithName:(id)a3 withDomainPairings:(id)a4;
- (id)describeQuirkDomains;
- (id)description;
@end

@implementation WPStorageAccessPromptQuirk

- (NSArray)triggerPages
{
  return self->_triggerPages;
}

- (NSDictionary)quirkDomains
{
  return self->_quirkDomains;
}

- (NSString)name
{
  return self->_name;
}

uint64_t __58__WPStorageAccessPromptQuirk_initWithName_withDomainData___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }

  return MEMORY[0x270F9A758]();
}

void __58__WPStorageAccessPromptQuirk_initWithName_withDomainData___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_10;
  }
  if ([v7 isEqualToString:@"quirkDomains"])
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
      v9 = *(void **)(*(void *)(a1[6] + 8) + 40);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __58__WPStorageAccessPromptQuirk_initWithName_withDomainData___block_invoke_2;
      v12[3] = &unk_2655861B8;
      v12[4] = a1[4];
      [v9 enumerateKeysAndObjectsUsingBlock:v12];
      goto LABEL_8;
    }
LABEL_10:
    *a4 = 1;
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
    goto LABEL_11;
  }
  if (![v7 isEqualToString:@"triggerPages"]) {
    goto LABEL_11;
  }
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_10;
  }
  objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), a3);
  v10 = *(void **)(*(void *)(a1[8] + 8) + 40);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__WPStorageAccessPromptQuirk_initWithName_withDomainData___block_invoke_4;
  v11[3] = &unk_265586190;
  v11[4] = a1[4];
  [v10 enumerateObjectsUsingBlock:v11];
LABEL_8:
  if (*(unsigned char *)(*(void *)(a1[4] + 8) + 24)) {
    *a4 = 1;
  }
LABEL_11:
}

void __58__WPStorageAccessPromptQuirk_initWithName_withDomainData___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__WPStorageAccessPromptQuirk_initWithName_withDomainData___block_invoke_3;
  v9[3] = &unk_265586190;
  v9[4] = *(void *)(a1 + 32);
  [v8 enumerateObjectsUsingBlock:v9];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    *a4 = 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainPairings, 0);
  objc_storeStrong((id *)&self->_triggerPages, 0);
  objc_storeStrong((id *)&self->_quirkDomains, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

uint64_t __58__WPStorageAccessPromptQuirk_initWithName_withDomainData___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }

  return MEMORY[0x270F9A758]();
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (WPStorageAccessPromptQuirk)initWithName:(id)a3 withDomainData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v39.receiver = self;
  v39.super_class = (Class)WPStorageAccessPromptQuirk;
  v9 = [(WPStorageAccessPromptQuirk *)&v39 init];
  if (v9)
  {
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2020000000;
    char v38 = 0;
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    char v34 = 0;
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 0;
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__0;
    v25 = __Block_byref_object_dispose__0;
    id v26 = 0;
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__0;
    v19 = __Block_byref_object_dispose__0;
    id v20 = 0;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __58__WPStorageAccessPromptQuirk_initWithName_withDomainData___block_invoke;
    v14[3] = &unk_2655861E0;
    v14[4] = &v35;
    v14[5] = &v31;
    v14[6] = &v21;
    v14[7] = &v27;
    v14[8] = &v15;
    [v8 enumerateKeysAndObjectsUsingBlock:v14];
    if (!*((unsigned char *)v28 + 24))
    {
      v10 = (void *)v16[5];
      v16[5] = (uint64_t)&unk_270D84D98;
    }
    if (*((unsigned char *)v36 + 24))
    {
      v9->_isValid = 0;
    }
    else
    {
      int v11 = *((unsigned __int8 *)v32 + 24);
      v9->_isValid = v11;
      if (v11)
      {
        objc_storeStrong((id *)&v9->_name, a3);
        objc_storeStrong((id *)&v9->_quirkDomains, (id)v22[5]);
        objc_storeStrong((id *)&v9->_triggerPages, (id)v16[5]);
      }
    }
    v12 = v9;
    _Block_object_dispose(&v15, 8);

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v35, 8);
  }

  return v9;
}

- (WPStorageAccessPromptQuirk)initWithName:(id)a3 withDomainPairings:(id)a4
{
  return 0;
}

- (id)describeQuirkDomains
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  int v11 = __Block_byref_object_dispose__0;
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  quirkDomains = self->_quirkDomains;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__WPStorageAccessPromptQuirk_describeQuirkDomains__block_invoke;
  v6[3] = &unk_2655861B8;
  v6[4] = &v7;
  [(NSDictionary *)quirkDomains enumerateKeysAndObjectsUsingBlock:v6];
  v4 = [(id)v8[5] componentsJoinedByString:@"; "];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __50__WPStorageAccessPromptQuirk_describeQuirkDomains__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v6 = NSString;
  uint64_t v7 = [a3 componentsJoinedByString:@", "];
  id v8 = [v6 stringWithFormat:@"%@: [%@]", v9, v7];
  [v5 addObject:v8];
}

- (id)description
{
  if ([(NSString *)self->_name length])
  {
    v3 = NSString;
    name = self->_name;
    v5 = [(WPStorageAccessPromptQuirk *)self describeQuirkDomains];
    v6 = [(NSArray *)self->_triggerPages componentsJoinedByString:@", "];
    uint64_t v7 = [v3 stringWithFormat:@"%@ - %@ - [%@]", name, v5, v6];
  }
  else
  {
    uint64_t v7 = [(WPStorageAccessPromptQuirk *)self describeQuirkDomains];
  }

  return v7;
}

- (NSDictionary)domainPairings
{
  return self->_domainPairings;
}

@end