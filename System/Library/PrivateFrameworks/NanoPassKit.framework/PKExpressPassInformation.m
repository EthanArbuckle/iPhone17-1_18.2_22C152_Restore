@interface PKExpressPassInformation
@end

@implementation PKExpressPassInformation

void __84__PKExpressPassInformation_NanoPassKit__npk_hasImmediateAutomaticSelectionCriterion__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "type", (void)v13);
        int v12 = [v11 isEqualToString:@"generic_immediate.type_a"];

        if (v12)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

void __69__PKExpressPassInformation_NanoPassKit__npk_expressAppletIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = 0;
  [MEMORY[0x263F5BE68] extractApplicationIdentifier:&v3 subcredentialIdentifier:0 fromIdentifiers:a2];
  objc_msgSend(*(id *)(a1 + 32), "pk_safelyAddObject:", v3);
}

@end