@interface NSUserDefaults(SingleUseToken)
- (id)workflowIdentifierConsumingSingleUseToken:()SingleUseToken;
- (void)setWorkflowIdentifier:()SingleUseToken forToken:;
@end

@implementation NSUserDefaults(SingleUseToken)

- (id)workflowIdentifierConsumingSingleUseToken:()SingleUseToken
{
  id v4 = a3;
  v5 = [a1 dictionaryForKey:@"WFWorkflowSingleUseTokenMap"];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 objectForKeyedSubscript:v4];
    if (v7) {
      [a1 setWorkflowIdentifier:0 forToken:v4];
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setWorkflowIdentifier:()SingleUseToken forToken:
{
  unint64_t v9 = a3;
  id v6 = a4;
  v7 = [a1 dictionaryForKey:@"WFWorkflowSingleUseTokenMap"];
  uint64_t v8 = [v7 mutableCopy];

  if (v9 | v8)
  {
    if (!v8) {
      uint64_t v8 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    if (v9) {
      [(id)v8 setObject:v9 forKeyedSubscript:v6];
    }
    else {
      [(id)v8 removeObjectForKey:v6];
    }
    [a1 setObject:v8 forKey:@"WFWorkflowSingleUseTokenMap"];
  }
}

@end