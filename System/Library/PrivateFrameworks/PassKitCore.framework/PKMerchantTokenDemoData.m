@interface PKMerchantTokenDemoData
+ (id)_generateTokensWithIdsUsing:(id)a3;
+ (id)responseForPageNumber:(id)a3;
+ (id)responseForSingleAMPMerchantToken;
+ (id)responseForSingleCashMerchantToken;
+ (id)responseForSingleMerchantToken;
+ (id)responseForSinglePage;
@end

@implementation PKMerchantTokenDemoData

+ (id)responseForSingleMerchantToken
{
  v2 = +[PKMerchantTokenDemoData _generateTokensWithIdsUsing:&unk_1EE22ADD8];
  v3 = [[PKRetrieveMerchantTokensResponse alloc] initWithMerchantTokens:v2 totalMerchantTokens:&unk_1EE22BAF8 pageSize:&unk_1EE22BB10 totalPages:&unk_1EE22BAF8 pageNumber:&unk_1EE22BAF8];

  return v3;
}

+ (id)responseForSingleAMPMerchantToken
{
  v2 = +[PKMerchantTokenDemoData _generateTokensWithIdsUsing:&unk_1EE22ADF0];
  v3 = [[PKRetrieveMerchantTokensResponse alloc] initWithMerchantTokens:v2 totalMerchantTokens:&unk_1EE22BAF8 pageSize:&unk_1EE22BB10 totalPages:&unk_1EE22BAF8 pageNumber:&unk_1EE22BAF8];

  return v3;
}

+ (id)responseForSingleCashMerchantToken
{
  v2 = +[PKMerchantTokenDemoData _generateTokensWithIdsUsing:&unk_1EE22AE08];
  v3 = [[PKRetrieveMerchantTokensResponse alloc] initWithMerchantTokens:v2 totalMerchantTokens:&unk_1EE22BAF8 pageSize:&unk_1EE22BB10 totalPages:&unk_1EE22BAF8 pageNumber:&unk_1EE22BAF8];

  return v3;
}

+ (id)responseForSinglePage
{
  v2 = +[PKMerchantTokenDemoData _generateTokensWithIdsUsing:MEMORY[0x1E4F1CBF0]];
  v3 = [PKRetrieveMerchantTokensResponse alloc];
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v2, "count"));
  v5 = [(PKRetrieveMerchantTokensResponse *)v3 initWithMerchantTokens:v2 totalMerchantTokens:v4 pageSize:&unk_1EE22BB10 totalPages:&unk_1EE22BAF8 pageNumber:&unk_1EE22BAF8];

  return v5;
}

+ (id)responseForPageNumber:(id)a3
{
  v36[5] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = MEMORY[0x1E4F1CBF0];
  v5 = +[PKMerchantTokenDemoData _generateTokensWithIdsUsing:MEMORY[0x1E4F1CBF0]];
  uint64_t v6 = +[PKMerchantTokenDemoData _generateTokensWithIdsUsing:v4];
  v7 = +[PKMerchantTokenDemoData _generateTokensWithIdsUsing:v4];
  v8 = +[PKMerchantTokenDemoData _generateTokensWithIdsUsing:v4];
  v9 = (void *)v6;
  v10 = +[PKMerchantTokenDemoData _generateTokensWithIdsUsing:v4];
  v36[0] = v5;
  v36[1] = v9;
  v36[2] = v7;
  v36[3] = v8;
  v36[4] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:5];
  uint64_t v12 = [v3 integerValue];
  unint64_t v13 = v12 - 1;
  if (v12 < 1 || v13 >= [v11 count])
  {
    v20 = [PKRetrieveMerchantTokensResponse alloc];
    v21 = [(PKRetrieveMerchantTokensResponse *)v20 initWithMerchantTokens:MEMORY[0x1E4F1CBF0] totalMerchantTokens:&unk_1EE22BB28 pageSize:&unk_1EE22BB10 totalPages:&unk_1EE22BAF8 pageNumber:&unk_1EE22BAF8];
  }
  else
  {
    v28 = v9;
    v29 = v5;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v14 = v11;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
    id v30 = v3;
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = 0;
      uint64_t v18 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v32 != v18) {
            objc_enumerationMutation(v14);
          }
          v17 += [*(id *)(*((void *)&v31 + 1) + 8 * i) count];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v16);
    }
    else
    {
      uint64_t v17 = 0;
    }

    v22 = [v14 objectAtIndexedSubscript:v13];
    v23 = [PKRetrieveMerchantTokensResponse alloc];
    v24 = [NSNumber numberWithInteger:v17];
    v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v22, "count"));
    v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
    v21 = [(PKRetrieveMerchantTokensResponse *)v23 initWithMerchantTokens:v22 totalMerchantTokens:v24 pageSize:v25 totalPages:v26 pageNumber:v30];

    id v3 = v30;
    v9 = v28;
    v5 = v29;
  }

  return v21;
}

+ (id)_generateTokensWithIdsUsing:(id)a3
{
  return (id)objc_msgSend(a3, "pk_arrayByApplyingBlock:", &__block_literal_global_67);
}

PKMerchantToken *__55__PKMerchantTokenDemoData__generateTokensWithIdsUsing___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 mutableCopy];
  id v3 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v4 = [v3 UUIDString];
  [v2 setObject:v4 forKeyedSubscript:@"merchantTokenId"];

  v5 = [[PKMerchantToken alloc] initWithDictionary:v2];
  return v5;
}

@end