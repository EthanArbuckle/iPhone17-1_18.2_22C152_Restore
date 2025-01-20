@interface UNCNContactResolverResult
@end

@implementation UNCNContactResolverResult

void __68___UNCNContactResolverResult_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) cnContactIdentifier];
  id v4 = (id)[v2 appendObject:v3 withName:@"cnContactIdentifier"];

  v5 = *(void **)(a1 + 32);
  v6 = [*(id *)(a1 + 40) cnContactFullname];
  v7 = objc_msgSend(v6, "un_logDigest");
  id v8 = (id)[v5 appendObject:v7 withName:@"cnContactFullname"];

  id v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isSuggestedContact"), @"isSuggestedContact");
  v10 = *(void **)(a1 + 32);
  v11 = objc_msgSend(*(id *)(a1 + 40), "_stringForMatchType:", objc_msgSend(*(id *)(a1 + 40), "matchType"));
  [v10 appendString:v11 withName:@"matchType"];

  id v12 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isMatchTypeSuggested"), @"matchTypeSuggested");
  v13 = *(void **)(a1 + 32);
  id v15 = [*(id *)(a1 + 40) identifierOfMatchLabel];
  id v14 = (id)[v13 appendBool:v15 != 0 withName:@"identifierOfMatchLabelExists"];
}

@end