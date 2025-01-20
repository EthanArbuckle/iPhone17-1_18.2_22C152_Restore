@interface SBDisplayIdentityRecord
@end

@implementation SBDisplayIdentityRecord

id __57___SBDisplayIdentityRecord_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:0];
  id v3 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 16) withName:@"connectedAtInit"];
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isValid"), @"isValid");
}

@end