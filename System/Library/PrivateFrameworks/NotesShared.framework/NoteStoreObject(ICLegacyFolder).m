@interface NoteStoreObject(ICLegacyFolder)
- (__CFString)localizedTitle;
- (uint64_t)compare:()ICLegacyFolder;
- (uint64_t)depth;
- (uint64_t)isCustomFolder;
- (uint64_t)isDefaultFolder;
- (uint64_t)isTrashFolder;
- (void)addNotesObject:()ICLegacyFolder;
- (void)newNoteInContext:()ICLegacyFolder;
@end

@implementation NoteStoreObject(ICLegacyFolder)

- (__CFString)localizedTitle
{
  v1 = [a1 titleForTableViewCell];
  v2 = v1;
  if (!v1) {
    v1 = &stru_1F1F2FFF8;
  }
  v3 = v1;

  return v3;
}

- (uint64_t)depth
{
  v2 = [a1 account];
  char v3 = [v2 isExchangeAccount];

  if (v3) {
    return 0;
  }
  v5 = (void *)MEMORY[0x1E4F1CB10];
  v6 = [a1 externalIdentifier];
  v7 = [v5 URLWithString:v6];
  v8 = [v7 pathComponents];
  uint64_t v9 = [v8 count] - 3;

  return v9 & ~(v9 >> 63);
}

- (void)newNoteInContext:()ICLegacyFolder
{
  id v4 = a3;
  objc_opt_class();
  v5 = ICCheckedDynamicCast();

  v6 = [v5 newlyAddedNote];

  [v6 setStore:a1];
  return v6;
}

- (void)addNotesObject:()ICLegacyFolder
{
  id v4 = a3;
  objc_opt_class();
  ICCheckedDynamicCast();
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  [v5 setStore:a1];
}

- (uint64_t)isDefaultFolder
{
  v2 = [a1 account];
  char v3 = [v2 defaultStore];
  uint64_t v4 = [a1 isEqual:v3];

  return v4;
}

- (uint64_t)isTrashFolder
{
  return 0;
}

- (uint64_t)isCustomFolder
{
  if ([a1 isDefaultFolder]) {
    return 0;
  }
  else {
    return [a1 isTrashFolder] ^ 1;
  }
}

- (uint64_t)compare:()ICLegacyFolder
{
  id v4 = a3;
  id v5 = ICProtocolCast();
  if (v5)
  {
    uint64_t v6 = 1;
  }
  else
  {
    v7 = ICProtocolCast();
    if (v7)
    {
      if ([a1 isDefaultFolder])
      {
        uint64_t v6 = -1;
      }
      else if ([v7 isDefaultFolder])
      {
        uint64_t v6 = 1;
      }
      else
      {
        uint64_t v9 = [a1 parentFolder];
        v10 = [v7 parentFolder];

        if (v9 == v10)
        {
          v19 = [a1 localizedTitle];
          v20 = [v7 localizedTitle];
          uint64_t v6 = [v19 localizedStandardCompare:v20];
        }
        else
        {
          id v11 = a1;
          id v12 = v7;
          unint64_t v13 = [v11 depth];
          unint64_t v14 = [v12 depth];
          unint64_t v15 = v14;
          v16 = v11;
          if (v13 <= v14)
          {
            v18 = v12;
            if (v14 > v13)
            {
              v18 = v12;
              do
              {
                v21 = v18;
                v18 = [v18 parentFolder];

                --v15;
              }
              while (v15 > v13);
              v16 = v11;
            }
          }
          else
          {
            do
            {
              v17 = v16;
              v16 = [v16 parentFolder];

              --v13;
            }
            while (v13 > v15);
            v18 = v12;
          }
          v30 = v11;
          v22 = [v16 parentFolder];
          v23 = [v18 parentFolder];

          if (v22 == v23)
          {
            v25 = v18;
            v24 = v16;
          }
          else
          {
            do
            {
              v24 = [v16 parentFolder];

              v25 = [v18 parentFolder];

              v26 = [v24 parentFolder];
              v27 = [v25 parentFolder];

              v16 = v24;
              v18 = v25;
            }
            while (v26 != v27);
          }
          if ([v24 isEqual:v25])
          {
            uint64_t v28 = [v30 depth];
            if (v28 < [v12 depth]) {
              uint64_t v6 = -1;
            }
            else {
              uint64_t v6 = 1;
            }
          }
          else
          {
            uint64_t v6 = [v24 compare:v25];
          }
        }
      }
    }
    else
    {
      v8 = os_log_create("com.apple.notes", "HTML");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        [(NoteAccountObject(ICLegacyAccount) *)(uint64_t)a1 compare:v8];
      }

      uint64_t v6 = 0;
    }
  }
  return v6;
}

@end