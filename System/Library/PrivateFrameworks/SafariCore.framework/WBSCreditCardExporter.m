@interface WBSCreditCardExporter
+ (id)dataType;
+ (unint64_t)schemaVersion;
- (WBSCreditCardExporter)initWithJSONWriter:(id)a3 error:(id *)a4;
- (void)addEntryWithCardNumber:(id)a3 cardName:(id)a4 cardholderName:(id)a5 cardExpirationMonth:(id)a6 cardExpirationYear:(id)a7 lastUsedDate:(id)a8;
- (void)finishWithCompletionHandler:(id)a3;
@end

@implementation WBSCreditCardExporter

+ (id)dataType
{
  return @"payment_cards";
}

+ (unint64_t)schemaVersion
{
  return 1;
}

- (WBSCreditCardExporter)initWithJSONWriter:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSCreditCardExporter;
  v7 = [(WBSJSONExporter *)&v10 initWithJSONWriter:v6 error:a4];
  if (v7 && [v6 beginArrayForKey:@"payment_cards" error:a4]) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }

  return v8;
}

- (void)addEntryWithCardNumber:(id)a3 cardName:(id)a4 cardholderName:(id)a5 cardExpirationMonth:(id)a6 cardExpirationYear:(id)a7 lastUsedDate:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a3;
  v20 = [(WBSJSONExporter *)self jsonWriter];
  id v47 = 0;
  [v20 appendAndBeginObjectWithError:&v47];
  id v21 = v47;

  v22 = [(WBSJSONExporter *)self jsonWriter];
  id v46 = v21;
  [v22 addEntry:v19 forKey:@"card_number" error:&v46];

  id v23 = v46;
  if ([v14 length])
  {
    v24 = [(WBSJSONExporter *)self jsonWriter];
    id v45 = v23;
    [v24 addEntry:v14 forKey:@"card_name" error:&v45];
    id v25 = v45;

    id v23 = v25;
  }
  if ([v15 length])
  {
    v26 = [(WBSJSONExporter *)self jsonWriter];
    id v44 = v23;
    [v26 addEntry:v15 forKey:@"cardholder_name" error:&v44];
    id v27 = v44;

    id v23 = v27;
  }
  if (v16 && [v16 intValue])
  {
    v28 = [(WBSJSONExporter *)self jsonWriter];
    id v43 = v23;
    [v28 addEntry:v16 forKey:@"card_expiration_month" error:&v43];
    id v29 = v43;

    id v23 = v29;
  }
  if (v17 && [v17 intValue])
  {
    v30 = [(WBSJSONExporter *)self jsonWriter];
    id v42 = v23;
    [v30 addEntry:v17 forKey:@"card_expiration_year" error:&v42];
    id v31 = v42;

    id v23 = v31;
  }
  if (v18)
  {
    [v18 timeIntervalSince1970];
    double v33 = v32 * 1000000.0;
    v34 = [(WBSJSONExporter *)self jsonWriter];
    v35 = [NSNumber numberWithDouble:v33];
    id v41 = v23;
    [v34 addEntry:v35 forKey:@"card_last_used_time_usec" error:&v41];
    id v36 = v41;

    id v23 = v36;
  }
  v37 = [(WBSJSONExporter *)self jsonWriter];
  id v40 = v23;
  [v37 closeCurrentEntryWithError:&v40];
  id v38 = v40;

  if (v38)
  {
    v39 = WBS_LOG_CHANNEL_PREFIXExport();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      -[WBSCreditCardExporter addEntryWithCardNumber:cardName:cardholderName:cardExpirationMonth:cardExpirationYear:lastUsedDate:](v39, v38);
    }
  }
}

- (void)finishWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__WBSCreditCardExporter_finishWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E615BAF0;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)WBSCreditCardExporter;
  id v5 = v4;
  [(WBSJSONExporter *)&v6 finishWithCompletionHandler:v7];
}

void __53__WBSCreditCardExporter_finishWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = WBS_LOG_CHANNEL_PREFIXExport();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __53__WBSCreditCardExporter_finishWithCompletionHandler___block_invoke_cold_1(v4, v3);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)addEntryWithCardNumber:(void *)a1 cardName:(void *)a2 cardholderName:cardExpirationMonth:cardExpirationYear:lastUsedDate:.cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_3(&dword_1B728F000, v5, v6, "Failed to serialize credit card entry: %{public}@", v7, v8, v9, v10, 2u);
}

void __53__WBSCreditCardExporter_finishWithCompletionHandler___block_invoke_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_3(&dword_1B728F000, v5, v6, "Failed to finalize saved credit cards export: %{public}@", v7, v8, v9, v10, 2u);
}

@end