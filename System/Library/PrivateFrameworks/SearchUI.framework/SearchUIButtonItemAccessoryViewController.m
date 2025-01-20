@interface SearchUIButtonItemAccessoryViewController
+ (BOOL)supportsRowModel:(id)a3;
- (id)buttonTypes;
- (id)setupView;
- (unint64_t)type;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUIButtonItemAccessoryViewController

+ (BOOL)supportsRowModel:(id)a3
{
  id v3 = a3;
  v4 = [v3 action];
  v5 = [v3 buttonItems];
  if ([v5 count] && (objc_msgSend(v3, "buttonItemsAreTrailing") & 1) != 0)
  {
    BOOL v6 = 1;
  }
  else
  {
    v7 = [v4 contactIdentifier];
    if (v7)
    {
      BOOL v6 = 1;
    }
    else
    {
      v8 = [v4 phoneNumber];
      if (v8)
      {
        BOOL v6 = 1;
      }
      else
      {
        v9 = [v4 email];
        if (v9)
        {
          BOOL v6 = 1;
        }
        else
        {
          v10 = [v4 mapsData];
          if (v10)
          {
            BOOL v6 = 1;
          }
          else
          {
            v11 = [v4 location];
            if (v11)
            {
              BOOL v6 = 1;
            }
            else
            {
              v12 = [v4 customDirectionsPunchout];
              if (v12)
              {
                BOOL v6 = 1;
              }
              else
              {
                v13 = [v4 messageURL];
                if (v13)
                {
                  BOOL v6 = 1;
                }
                else
                {
                  v16 = [v4 label];
                  if ([v16 length])
                  {
                    v15 = [v4 storeIdentifiers];
                    BOOL v6 = [v15 count] == 0;
                  }
                  else
                  {
                    BOOL v6 = 0;
                  }

                  v13 = 0;
                }
              }
            }
          }
        }
      }
    }
  }
  return v6;
}

- (id)setupView
{
  v2 = objc_opt_new();
  return v2;
}

- (void)updateWithRowModel:(id)a3
{
  v31 = self;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v32 = a3;
  id v3 = [v32 buttonItems];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (!v4) {
    goto LABEL_26;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v36;
  v7 = &selRef_tableRowModel;
  unint64_t v8 = 0x1E4F99000uLL;
  uint64_t v33 = 1;
  do
  {
    uint64_t v9 = 0;
    v10 = v7[63];
    uint64_t v34 = v5;
    do
    {
      if (*(void *)v36 != v6) {
        objc_enumerationMutation(v3);
      }
      v11 = *(void **)(*((void *)&v35 + 1) + 8 * v9);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = [v11 image];
        BOOL v13 = v12 != 0;

        v14 = [v11 title];
        BOOL v15 = [v14 length] != 0;
      }
      else
      {
        BOOL v15 = 0;
        BOOL v13 = 0;
      }
      if (objc_opt_respondsToSelector())
      {
        v16 = [v11 performSelector:v10];
        v17 = v16;
        if (v13)
        {
          BOOL v13 = 1;
          if (!v15) {
            goto LABEL_12;
          }
LABEL_20:
          BOOL v15 = 1;
        }
        else
        {
          v19 = [v16 toggledImage];
          if (v19)
          {
            BOOL v13 = 1;
          }
          else
          {
            v24 = [v17 untoggledImage];
            BOOL v13 = v24 != 0;
          }
          if (v15) {
            goto LABEL_20;
          }
LABEL_12:
          v18 = objc_msgSend(v17, "toggledTitle", v31);
          if ([v18 length])
          {
            BOOL v15 = 1;
          }
          else
          {
            [v17 untoggledTitle];
            uint64_t v20 = v6;
            v21 = v3;
            v23 = unint64_t v22 = v8;
            BOOL v15 = [v23 length] != 0;

            unint64_t v8 = v22;
            id v3 = v21;
            uint64_t v6 = v20;
            uint64_t v5 = v34;
          }
        }
      }
      if (!v15 || v13) {
        goto LABEL_27;
      }
      ++v9;
    }
    while (v5 != v9);
    uint64_t v5 = [v3 countByEnumeratingWithState:&v35 objects:v39 count:16];
    v7 = &selRef_tableRowModel;
  }
  while (v5);
LABEL_26:
  uint64_t v33 = 3;
LABEL_27:

  uint64_t v25 = [v32 useCompactVersionOfUI];
  v26 = [(SearchUIAccessoryViewController *)v31 view];
  [v26 setIsCompact:v25];

  v27 = [(SearchUIAccessoryViewController *)v31 view];
  v28 = [v32 buttonItems];
  if ([MEMORY[0x1E4FAE198] isMacOS]) {
    uint64_t v29 = 4;
  }
  else {
    uint64_t v29 = 3;
  }
  v30 = [(SearchUIAccessoryViewController *)v31 feedbackDelegate];
  [v27 updateWithButtonItems:v28 maxButtonItems:v29 buttonItemViewType:v33 rowModel:v32 feedbackDelegate:v30];
}

- (unint64_t)type
{
  return 9;
}

- (id)buttonTypes
{
  v2 = [(SearchUIAccessoryViewController *)self view];
  id v3 = [v2 buttonTypes];

  return v3;
}

@end