@interface WBSSavedAccountStore(SafariSharedExtras)
- (uint64_t)numberOfSavedAccountsToBeExported;
- (void)_test_writeContentsOfAccountStoreToWriter:()SafariSharedExtras;
- (void)_writeContentsOfAccounts:()SafariSharedExtras toWriter:;
- (void)exportContentsOfAccountStoreToCSVFileWithPath:()SafariSharedExtras;
- (void)exportContentsOfSavedAccounts:()SafariSharedExtras toCSVFileWithPath:;
@end

@implementation WBSSavedAccountStore(SafariSharedExtras)

- (void)exportContentsOfSavedAccounts:()SafariSharedExtras toCSVFileWithPath:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[CHCSVWriter alloc] initForWritingToCSVFile:v6];

  [a1 _writeContentsOfAccounts:v7 toWriter:v8];
}

- (void)exportContentsOfAccountStoreToCSVFileWithPath:()SafariSharedExtras
{
  id v4 = a3;
  id v6 = [[CHCSVWriter alloc] initForWritingToCSVFile:v4];

  v5 = [a1 savedAccounts];
  [a1 _writeContentsOfAccounts:v5 toWriter:v6];
}

- (uint64_t)numberOfSavedAccountsToBeExported
{
  v1 = [a1 savedAccounts];
  v2 = objc_msgSend(v1, "safari_filterObjectsUsingBlock:", &__block_literal_global_103);
  uint64_t v3 = [v2 count];

  return v3;
}

- (void)_writeContentsOfAccounts:()SafariSharedExtras toWriter:
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v44 = a4;
  [v44 writeLineOfFields:&unk_1EFC222B0];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v55;
    uint64_t v39 = *(void *)v55;
    do
    {
      uint64_t v9 = 0;
      uint64_t v40 = v7;
      do
      {
        if (*(void *)v55 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v54 + 1) + 8 * v9);
        if ([v10 canBeExportedToPasswordsCSVFile])
        {
          uint64_t v42 = v9;
          int v47 = [v10 hasValidWebsite];
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          id v43 = [v10 protectionSpaces];
          uint64_t v46 = [v43 countByEnumeratingWithState:&v50 objects:v59 count:16];
          if (!v46) {
            goto LABEL_45;
          }
          uint64_t v45 = *(void *)v51;
          while (1)
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v51 != v45) {
                objc_enumerationMutation(v43);
              }
              v12 = *(void **)(*((void *)&v50 + 1) + 8 * v11);
              v13 = objc_msgSend(v12, "safari_URL");
              v14 = [v10 user];
              v15 = [v10 customTitle];
              uint64_t v16 = [v15 length];

              if (v16)
              {
                uint64_t v17 = [v10 customTitle];
LABEL_14:
                v18 = (__CFString *)v17;
                goto LABEL_15;
              }
              if (v47 && [(__CFString *)v14 length])
              {
                v20 = NSString;
                v21 = [v13 host];
                v18 = [v20 stringWithFormat:@"%@ (%@)", v21, v14];

LABEL_20:
                v22 = [v13 absoluteURL];
                v19 = [v22 absoluteString];

                goto LABEL_21;
              }
              if (![(__CFString *)v14 length])
              {
                uint64_t v17 = [v13 host];
                goto LABEL_14;
              }
              v18 = 0;
LABEL_15:
              v19 = &stru_1EFBE3CF8;
              if (v47) {
                goto LABEL_20;
              }
LABEL_21:
              if (v18) {
                v23 = v18;
              }
              else {
                v23 = &stru_1EFBE3CF8;
              }
              if (v19) {
                v24 = v19;
              }
              else {
                v24 = &stru_1EFBE3CF8;
              }
              v58[0] = v23;
              v58[1] = v24;
              if (v14) {
                v25 = v14;
              }
              else {
                v25 = &stru_1EFBE3CF8;
              }
              v58[2] = v25;
              uint64_t v26 = [v10 password];
              v49 = v13;
              v27 = (void *)v26;
              if (v26) {
                v28 = (__CFString *)v26;
              }
              else {
                v28 = &stru_1EFBE3CF8;
              }
              v58[3] = v28;
              uint64_t v29 = [v10 notesEntry];
              v30 = (void *)v29;
              if (v29) {
                v31 = (__CFString *)v29;
              }
              else {
                v31 = &stru_1EFBE3CF8;
              }
              v58[4] = v31;
              v32 = [v12 host];
              [v10 totpGeneratorForSite:v32];
              v33 = v48 = v14;
              uint64_t v34 = [v33 exportableURL];
              v35 = (void *)v34;
              if (v34) {
                v36 = (__CFString *)v34;
              }
              else {
                v36 = &stru_1EFBE3CF8;
              }
              v58[5] = v36;
              v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:6];
              [v44 writeLineOfFields:v37];

              ++v11;
            }
            while (v46 != v11);
            uint64_t v38 = [v43 countByEnumeratingWithState:&v50 objects:v59 count:16];
            uint64_t v46 = v38;
            if (!v38)
            {
LABEL_45:

              uint64_t v8 = v39;
              uint64_t v7 = v40;
              uint64_t v9 = v42;
              break;
            }
          }
        }
        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
    }
    while (v7);
  }

  [v44 closeStream];
}

- (void)_test_writeContentsOfAccountStoreToWriter:()SafariSharedExtras
{
  id v4 = a3;
  id v5 = [a1 savedAccounts];
  [a1 _writeContentsOfAccounts:v5 toWriter:v4];
}

@end