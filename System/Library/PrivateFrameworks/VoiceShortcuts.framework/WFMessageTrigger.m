@interface WFMessageTrigger
@end

@implementation WFMessageTrigger

id __65__WFMessageTrigger_ContentInput__contentCollectionWithEventInfo___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F5A980];
  id v3 = a2;
  id v16 = [v2 alloc];
  v19 = [MEMORY[0x1E4F5B6B8] contentKey];
  v4 = [v3 objectForKey:v19];
  v18 = [MEMORY[0x1E4F5B6B8] conversationIdentifierKey];
  v5 = [v3 objectForKey:v18];
  v17 = [MEMORY[0x1E4F5B6B8] recipientContactIDsKey];
  v6 = [v3 objectForKey:v17];
  v7 = [MEMORY[0x1E4F5B6B8] recipientsKey];
  v8 = [v3 objectForKey:v7];
  v9 = [MEMORY[0x1E4F5B6B8] senderContactIDKey];
  v10 = [v3 objectForKey:v9];
  v11 = [MEMORY[0x1E4F5B6B8] senderHandlesKey];
  v12 = [v3 objectForKey:v11];

  v13 = (void *)[v16 initWithContent:v4 conversationID:v5 recipientContactIDs:v6 recipients:v8 senderContactID:v10 senderHandles:v12];
  v14 = [MEMORY[0x1E4F5A988] itemWithObject:v13];

  return v14;
}

@end