@interface WFEmailTrigger
@end

@implementation WFEmailTrigger

id __63__WFEmailTrigger_ContentInput__contentCollectionWithEventInfo___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F5A8D8];
  id v3 = a2;
  id v18 = [v2 alloc];
  v19 = [MEMORY[0x1E4F5B6B8] identifierKey];
  v4 = [v3 objectForKey:v19];
  v5 = [MEMORY[0x1E4F5B6B8] accountIdentifierKey];
  v6 = [v3 objectForKey:v5];
  v7 = [MEMORY[0x1E4F5B6B8] subjectKey];
  v8 = [v3 objectForKey:v7];
  v9 = [MEMORY[0x1E4F5B6B8] senderKey];
  v10 = [v3 objectForKey:v9];
  v11 = [MEMORY[0x1E4F5B6B8] recipientsKey];
  v12 = [v3 objectForKey:v11];

  v13 = (void *)[v18 initWithIdentifier:v4 accountIdentifier:v6 subject:v8 sender:v10 recipients:v12];
  v14 = (void *)MEMORY[0x1E4F5A8F0];
  v15 = [v13 subject];
  v16 = [v14 itemWithObject:v13 named:v15];

  return v16;
}

@end