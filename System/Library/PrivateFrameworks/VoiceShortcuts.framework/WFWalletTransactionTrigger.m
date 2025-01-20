@interface WFWalletTransactionTrigger
@end

@implementation WFWalletTransactionTrigger

void __101__WFWalletTransactionTrigger_BiomeContext__shouldFireInResponseToEvent_triggerIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [a2 objectForKeyedSubscript:@"transaction"];
  if (v3)
  {
    if (*(unsigned char *)(a1 + 65))
    {
      v4 = [*(id *)(a1 + 32) selectedMerchantTypes];
      v5 = NSNumber;
      v6 = [v3 merchant];
      v7 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "merchantType"));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v4 containsObject:v7];
    }
    if (*(unsigned char *)(a1 + 66))
    {
      v8 = [*(id *)(a1 + 32) selectedMerchants];
      v9 = [v3 merchant];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v8 containsObject:v9];
    }
    v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    v11 = getWFTriggersLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315138;
      v13 = "-[WFWalletTransactionTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]_block_invoke";
      _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_ERROR, "%s Could not fetch transaction for wallet transaction event, ignoring merchant filtering.", (uint8_t *)&v12, 0xCu);
    }

    v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v10();
}

void __73__WFWalletTransactionTrigger_ContentInput__eventInfoForEvent_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) dictionaryWithTransaction:a2 transactionEvent:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __73__WFWalletTransactionTrigger_ContentInput__eventInfoForEvent_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) dictionaryWithTransaction:a2 transactionEvent:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

@end