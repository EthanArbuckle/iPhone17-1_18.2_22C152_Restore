@interface PassMeetsFilterRequirements
@end

@implementation PassMeetsFilterRequirements

void ___PassMeetsFilterRequirements_block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  id v5 = a2;
  v6 = [v5 passUniqueIdentifier];
  v7 = [*(id *)(a1 + 32) uniqueID];
  id v8 = v6;
  id v9 = v7;
  if (v8 == v9)
  {
  }
  else
  {
    v10 = v9;
    if (!v8 || !v9)
    {

      goto LABEL_14;
    }
    char v11 = [v8 isEqualToString:v9];

    if ((v11 & 1) == 0) {
      goto LABEL_14;
    }
  }
  if ([v5 isNFCExpressEnabled])
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    v12 = [v5 passInformation];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = ___PassMeetsFilterRequirements_block_invoke_2;
    v14[3] = &unk_1E56F0410;
    v14[4] = &v15;
    [v12 enumerateCredentialsWithHandler:v14];
    if (*((unsigned char *)v16 + 24)) {
      BOOL v13 = 0;
    }
    else {
      BOOL v13 = [v12 cardType] == 3;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = !v13;
    *a3 = v13;

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    *a3 = 1;
  }
LABEL_14:
}

void ___PassMeetsFilterRequirements_block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * v10) supportsInSessionExpress])
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
          *a4 = 1;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

@end