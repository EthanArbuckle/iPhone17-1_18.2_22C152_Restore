@interface WFWalletTransactionTrigger(ContentInput)
- (id)contentCollectionWithEventInfo:()ContentInput;
- (id)dictionaryWithTransaction:()ContentInput transactionEvent:;
- (uint64_t)requiresEventInfoAsInput;
- (void)eventInfoForEvent:()ContentInput completion:;
@end

@implementation WFWalletTransactionTrigger(ContentInput)

- (id)contentCollectionWithEventInfo:()ContentInput
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = [a3 objectForKeyedSubscript:@"transaction"];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F5AA68] itemWithObject:v3];
    v5 = (void *)MEMORY[0x1E4F5A830];
    v9[0] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    v7 = [v5 collectionWithItems:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)dictionaryWithTransaction:()ContentInput transactionEvent:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = getWFTriggersLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[WFWalletTransactionTrigger(ContentInput) dictionaryWithTransaction:transactionEvent:]";
    __int16 v38 = 2112;
    id v39 = v5;
    _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_DEBUG, "%s Got transaction: %@", buf, 0x16u);
  }

  v8 = [v5 merchant];
  uint64_t v9 = [v8 category];

  if ((unint64_t)(v9 - 1) >= 7) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v9;
  }
  id v11 = objc_alloc(MEMORY[0x1E4F5AA58]);
  v12 = [v5 merchant];
  v13 = [v12 displayName];
  v14 = [v5 merchant];
  v15 = [v14 uniqueIdentifier];
  v16 = [v5 merchant];
  v17 = [v16 logoImageURL];
  v18 = (void *)[v11 initWithDisplayName:v13 uniqueIdentifier:v15 logoURL:v17 merchantType:v10];

  id v19 = objc_alloc(MEMORY[0x1E4F303C0]);
  v20 = [v5 amount];
  v21 = [v5 currencyCode];
  v22 = (void *)[v19 initWithAmount:v20 currencyCode:v21];

  id v23 = objc_alloc(MEMORY[0x1E4F305A8]);
  v24 = [v6 passLocalizedDescription];
  v25 = (void *)[v23 initWithType:0 name:v24 identificationHint:0 icon:0];

  id v26 = objc_alloc(MEMORY[0x1E4F5AA60]);
  v27 = [v6 transactionID];

  v28 = [v18 displayName];
  if (v28)
  {
    v29 = (void *)[v26 initWithIdentifier:v27 transactionDescription:v28 merchant:v18 currencyAmount:v22 paymentMethod:v25];
  }
  else
  {
    v30 = [v5 merchantProvidedTitle];
    v29 = (void *)[v26 initWithIdentifier:v27 transactionDescription:v30 merchant:v18 currencyAmount:v22 paymentMethod:v25];
  }
  v31 = getWFTriggersLogObject();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[WFWalletTransactionTrigger(ContentInput) dictionaryWithTransaction:transactionEvent:]";
    __int16 v38 = 2112;
    id v39 = v29;
    _os_log_impl(&dword_1C7D7E000, v31, OS_LOG_TYPE_DEBUG, "%s Finished with transactionItem: %@", buf, 0x16u);
  }

  v34 = @"transaction";
  v35 = v29;
  v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];

  return v32;
}

- (void)eventInfoForEvent:()ContentInput completion:
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 eventBody];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v9 = 0;
      goto LABEL_10;
    }
  }

  uint64_t v10 = [v6 eventBody];
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v34 = a1;
    id v11 = getWFTriggersLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v44 = "-[WFWalletTransactionTrigger(ContentInput) eventInfoForEvent:completion:]";
      _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_DEFAULT, "%s Found remote event converting to BMWalletTransaction", buf, 0xCu);
    }

    id v12 = objc_alloc(MEMORY[0x1E4F50190]);
    v13 = [v10 passUniqueID];
    v14 = [v10 passLocalizedDescription];
    uint64_t v15 = [v10 transactionType];
    v16 = [v10 transactionID];
    uint64_t v17 = [v10 merchantType];
    v18 = [v10 poiCategory];
    id v8 = (id)[v12 initWithPassUniqueID:v13 passLocalizedDescription:v14 transactionType:v15 transactionID:v16 merchantType:v17 poiCategory:v18];

    if (v8)
    {
      int v9 = 1;
      a1 = v34;
LABEL_10:
      id v19 = [v8 transactionID];

      if (v19)
      {
        if (v9)
        {
          v20 = getWFTriggersLogObject();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = [v8 passUniqueID];
            v22 = [v8 transactionID];
            *(_DWORD *)buf = 136315650;
            v44 = "-[WFWalletTransactionTrigger(ContentInput) eventInfoForEvent:completion:]";
            __int16 v45 = 2112;
            v46 = v21;
            __int16 v47 = 2112;
            v48 = v22;
            _os_log_impl(&dword_1C7D7E000, v20, OS_LOG_TYPE_DEFAULT, "%s Attempting to get remote transaction with passID: %@ transactionID: %@", buf, 0x20u);
          }
          id v23 = +[WFWalletTransactionProvider sharedProvider];
          v24 = [v8 transactionID];
          v25 = [v8 passUniqueID];
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = __73__WFWalletTransactionTrigger_ContentInput__eventInfoForEvent_completion___block_invoke;
          v38[3] = &unk_1E6542270;
          v38[4] = a1;
          id v39 = v8;
          id v40 = v7;
          id v8 = v8;
          [v23 fetchRemoteTransactionWithIdentifier:v24 passUniqueID:v25 completion:v38];

          id v26 = v39;
        }
        else
        {
          id v23 = +[WFWalletTransactionProvider sharedProvider];
          v32 = [v8 transactionID];
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = __73__WFWalletTransactionTrigger_ContentInput__eventInfoForEvent_completion___block_invoke_2;
          v35[3] = &unk_1E6542270;
          v35[4] = a1;
          id v36 = v8;
          id v37 = v7;
          id v8 = v8;
          [v23 fetchLocalTransactionWithIdentifier:v32 completion:v35];

          id v26 = v36;
        }
      }
      else
      {
        v28 = [v8 passLocalizedDescription];

        if (!v28)
        {
          v33 = getWFTriggersLogObject();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v44 = "-[WFWalletTransactionTrigger(ContentInput) eventInfoForEvent:completion:]";
            _os_log_impl(&dword_1C7D7E000, v33, OS_LOG_TYPE_ERROR, "%s No transaction identifier or pass description not creating input to trigger!", buf, 0xCu);
          }

          (*((void (**)(id, void))v7 + 2))(v7, 0);
          goto LABEL_24;
        }
        v41 = @"transaction";
        id v29 = objc_alloc(MEMORY[0x1E4F5AA60]);
        id v23 = [v8 passLocalizedDescription];
        v30 = (void *)[v29 initWithIdentifier:0 transactionDescription:v23 merchant:0 currencyAmount:0 paymentMethod:0];
        v42 = v30;
        v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
        (*((void (**)(id, void *))v7 + 2))(v7, v31);
      }
LABEL_24:

      goto LABEL_25;
    }
  }
  else
  {

    v27 = getWFTriggersLogObject();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v44 = "-[WFWalletTransactionTrigger(ContentInput) eventInfoForEvent:completion:]";
      _os_log_impl(&dword_1C7D7E000, v27, OS_LOG_TYPE_DEFAULT, "%s No wallet transaction event received for trigger; not firing.",
        buf,
        0xCu);
    }
  }
  (*((void (**)(id, void))v7 + 2))(v7, 0);
LABEL_25:
}

- (uint64_t)requiresEventInfoAsInput
{
  return 1;
}

@end