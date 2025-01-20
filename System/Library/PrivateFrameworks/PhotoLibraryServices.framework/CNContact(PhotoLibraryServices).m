@interface CNContact(PhotoLibraryServices)
+ (id)pl_findBestMatchingContactFromMatchingContacts:()PhotoLibraryServices firstName:lastName:contactFormatter:;
@end

@implementation CNContact(PhotoLibraryServices)

+ (id)pl_findBestMatchingContactFromMatchingContacts:()PhotoLibraryServices firstName:lastName:contactFormatter:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v9 count] == 1)
  {
    id v13 = [v9 firstObject];
    goto LABEL_26;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v24 = v9;
  id v14 = v9;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (!v12)
        {
          id v13 = v19;
          if (v13) {
            goto LABEL_25;
          }
          continue;
        }
        v20 = [v12 stringFromContact:*(void *)(*((void *)&v25 + 1) + 8 * i)];
        v21 = v20;
        if (v10)
        {
          if (![v20 containsString:v10]) {
            goto LABEL_21;
          }
          id v13 = v19;
          if (v11)
          {
LABEL_16:
            if (![v21 containsString:v11])
            {

LABEL_21:
              continue;
            }
            id v22 = v19;

            id v13 = v22;
          }
        }
        else
        {
          id v13 = 0;
          if (v11) {
            goto LABEL_16;
          }
        }

        if (v13) {
          goto LABEL_25;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v16);
  }
  id v13 = 0;
LABEL_25:

  id v9 = v24;
LABEL_26:

  return v13;
}

@end