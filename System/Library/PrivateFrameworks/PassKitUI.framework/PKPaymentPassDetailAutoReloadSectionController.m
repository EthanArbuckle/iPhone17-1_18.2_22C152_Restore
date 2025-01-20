@interface PKPaymentPassDetailAutoReloadSectionController
+ (id)autoReloadAmountForPass:(id)a3 action:(id)a4;
+ (id)autoReloadThresholdForPass:(id)a3 action:(id)a4;
+ (id)autoTopUpActionForPass:(id)a3;
+ (id)enteredValueActionForPass:(id)a3;
@end

@implementation PKPaymentPassDetailAutoReloadSectionController

+ (id)autoTopUpActionForPass:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 activationState] && objc_msgSend(v3, "activationState") != 2)
  {
    id v32 = 0;
  }
  else
  {
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v4 = [v3 balanceFields];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v52 objects:v58 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v53;
      v43 = (void *)*MEMORY[0x1E4F87980];
      v40 = v4;
      id v41 = v3;
      uint64_t v34 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v53 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = objc_msgSend(*(id *)(*((void *)&v52 + 1) + 8 * i), "foreignReferenceIdentifiers", v34);
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id v10 = v9;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v48 objects:v57 count:16];
          if (v11)
          {
            uint64_t v12 = *(void *)v49;
            uint64_t v35 = i;
            uint64_t v36 = v6;
            v42 = v10;
            uint64_t v37 = *(void *)v49;
            do
            {
              uint64_t v13 = 0;
              uint64_t v38 = v11;
              do
              {
                if (*(void *)v49 != v12) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v39 = v13;
                v14 = *(void **)(*((void *)&v48 + 1) + 8 * v13);
                long long v44 = 0u;
                long long v45 = 0u;
                long long v46 = 0u;
                long long v47 = 0u;
                v15 = [v3 availableActions];
                uint64_t v16 = [v15 countByEnumeratingWithState:&v44 objects:v56 count:16];
                if (!v16) {
                  goto LABEL_41;
                }
                uint64_t v17 = v16;
                uint64_t v18 = *(void *)v45;
                if (v43) {
                  BOOL v19 = v14 == 0;
                }
                else {
                  BOOL v19 = 1;
                }
                char v20 = !v19;
                while (2)
                {
                  for (uint64_t j = 0; j != v17; ++j)
                  {
                    if (*(void *)v45 != v18) {
                      objc_enumerationMutation(v15);
                    }
                    v22 = *(void **)(*((void *)&v44 + 1) + 8 * j);
                    if ([v22 type] == 6)
                    {
                      id v23 = v14;
                      if (v43 == v14)
                      {
                        v28 = v43;
                        goto LABEL_50;
                      }
                      v24 = v23;
                      if (v20)
                      {
                        uint64_t v25 = [v43 caseInsensitiveCompare:v23];

                        if (!v25) {
                          goto LABEL_51;
                        }
                      }
                      else
                      {
                      }
                    }
                    id v26 = [v22 associatedAutoTopUpIdentifier];
                    id v27 = v14;
                    v28 = v27;
                    if (v26 == v27)
                    {

LABEL_50:
LABEL_51:
                      id v32 = v22;

                      v4 = v40;
                      id v3 = v41;
                      goto LABEL_52;
                    }
                    if (v14 && v26)
                    {
                      uint64_t v29 = [v26 caseInsensitiveCompare:v27];

                      if (!v29) {
                        goto LABEL_51;
                      }
                    }
                    else
                    {
                    }
                    if ([v22 type] == 6)
                    {
                      v30 = [v22 relevantPropertyIdentifier];
                      if (v30)
                      {
                      }
                      else
                      {
                        v31 = [v22 associatedAutoTopUpIdentifier];

                        if (!v31) {
                          goto LABEL_51;
                        }
                      }
                    }
                  }
                  uint64_t v17 = [v15 countByEnumeratingWithState:&v44 objects:v56 count:16];
                  v4 = v40;
                  id v3 = v41;
                  uint64_t v7 = v34;
                  uint64_t i = v35;
                  uint64_t v6 = v36;
                  if (v17) {
                    continue;
                  }
                  break;
                }
LABEL_41:

                uint64_t v13 = v39 + 1;
                id v10 = v42;
                uint64_t v12 = v37;
              }
              while (v39 + 1 != v38);
              uint64_t v11 = [v42 countByEnumeratingWithState:&v48 objects:v57 count:16];
            }
            while (v11);
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v52 objects:v58 count:16];
        id v32 = 0;
      }
      while (v6);
    }
    else
    {
      id v32 = 0;
    }
LABEL_52:
  }

  return v32;
}

+ (id)enteredValueActionForPass:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 activationState])
  {
    id v4 = 0;
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v5 = objc_msgSend(v3, "availableActions", 0);
    id v4 = (id)[v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v6 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v5);
          }
          v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          if ([v8 type] == 1
            && [v8 isActionAvailable]
            && ([v8 unavailableActionBehavior] & 2) == 0)
          {
            id v4 = v8;
            goto LABEL_15;
          }
        }
        id v4 = (id)[v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }

  return v4;
}

+ (id)autoReloadThresholdForPass:(id)a3 action:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v6 = [a3 autoTopUpFields];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    uint64_t v10 = *MEMORY[0x1E4F87500];
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v13 = [v12 key];
        int v14 = [v13 isEqualToString:v10];

        if (v14)
        {
          uint64_t v16 = NSNumber;
          [v12 threshold];
          uint64_t v17 = objc_msgSend(v16, "numberWithDouble:");
          uint64_t v18 = [v5 autoTopUpItem];
          BOOL v19 = [v18 currency];

          if (v19)
          {
            id v20 = objc_alloc(MEMORY[0x1E4F84610]);
            v21 = (void *)MEMORY[0x1E4F28C28];
            if (v17)
            {
              [v17 decimalValue];
            }
            else
            {
              v25[0] = 0;
              v25[1] = 0;
              int v26 = 0;
            }
            v22 = [v21 decimalNumberWithDecimal:v25];
            id v23 = (void *)[v20 initWithAmount:v22 currency:v19 exponent:0];

            uint64_t v15 = [v23 formattedStringValue];
          }
          else
          {
            uint64_t v15 = PKFormattedStringMinimalFractionDigitsFromNumber();
          }

          goto LABEL_17;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  uint64_t v15 = 0;
LABEL_17:

  return v15;
}

+ (id)autoReloadAmountForPass:(id)a3 action:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v6 = [a3 autoTopUpFields];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    uint64_t v10 = *MEMORY[0x1E4F87500];
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v13 = [v12 key];
        int v14 = [v13 isEqualToString:v10];

        if (v14)
        {
          uint64_t v16 = NSNumber;
          [v12 amount];
          uint64_t v17 = objc_msgSend(v16, "numberWithDouble:");
          uint64_t v18 = [v5 autoTopUpItem];
          BOOL v19 = [v18 currency];

          if (v19)
          {
            id v20 = objc_alloc(MEMORY[0x1E4F84610]);
            v21 = (void *)MEMORY[0x1E4F28C28];
            if (v17)
            {
              [v17 decimalValue];
            }
            else
            {
              v25[0] = 0;
              v25[1] = 0;
              int v26 = 0;
            }
            v22 = [v21 decimalNumberWithDecimal:v25];
            id v23 = (void *)[v20 initWithAmount:v22 currency:v19 exponent:0];

            uint64_t v15 = [v23 formattedStringValue];
          }
          else
          {
            uint64_t v15 = PKFormattedStringMinimalFractionDigitsFromNumber();
          }

          goto LABEL_17;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  uint64_t v15 = 0;
LABEL_17:

  return v15;
}

@end