@interface MFMailMessageRelationshipAnalyzer
+ (BOOL)isMessage:(id)a3 addressedToMailingListForMessage:(id)a4;
+ (BOOL)isMessage:(id)a3 addressedToPreviousSender:(id)a4;
+ (BOOL)isMessage:(id)a3 forwardOfMessage:(id)a4 myEmailAddresses:(id)a5;
+ (BOOL)isMessage:(id)a3 responseToMessage:(id)a4 previousSenders:(id)a5 myEmailAddresses:(id)a6;
+ (BOOL)isMessage:(id)a3 sentByAddress:(id)a4;
+ (BOOL)isMessageDraft:(id)a3;
+ (id)analysisOfConversation:(id)a3;
+ (id)analyzeMessages:(id)a3 myEmailAddresses:(id)a4;
+ (id)myEmailAddresses;
+ (id)recipientsOfMessage:(id)a3;
+ (id)sendersOfMessage:(id)a3;
+ (unint64_t)relationOfMessage:(id)a3 toMessage:(id)a4;
+ (unint64_t)relationOfMessage:(id)a3 toMessage:(id)a4 previousSenders:(id)a5 myEmailAddresses:(id)a6;
- (MFMailMessageRelationshipAnalyzer)initWithMessages:(id)a3 relationships:(id)a4;
- (unint64_t)relationOfMessage:(id)a3;
- (void)dealloc;
@end

@implementation MFMailMessageRelationshipAnalyzer

+ (id)analysisOfConversation:(id)a3
{
  v3 = objc_msgSend(objc_alloc((Class)a1), "initWithMessages:relationships:", a3, objc_msgSend(a1, "analyzeMessages:myEmailAddresses:", a3, objc_msgSend(a1, "myEmailAddresses")));
  return v3;
}

- (MFMailMessageRelationshipAnalyzer)initWithMessages:(id)a3 relationships:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MFMailMessageRelationshipAnalyzer;
  v6 = [(MFMailMessageRelationshipAnalyzer *)&v8 init];
  if (v6)
  {
    v6->_messages = (NSArray *)[a3 copy];
    v6->_relationships = (NSArray *)[a4 copy];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFMailMessageRelationshipAnalyzer;
  [(MFMailMessageRelationshipAnalyzer *)&v3 dealloc];
}

- (unint64_t)relationOfMessage:(id)a3
{
  NSUInteger v4 = [(NSArray *)self->_messages indexOfObject:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  id v6 = [(NSArray *)self->_relationships objectAtIndex:v4];
  return [v6 unsignedIntegerValue];
}

+ (id)analyzeMessages:(id)a3 myEmailAddresses:(id)a4
{
  uint64_t v7 = [a3 firstObject];
  objc_super v8 = (void *)[MEMORY[0x1E4F1CA70] orderedSet];
  objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(a1, "sendersOfMessage:", v7));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__MFMailMessageRelationshipAnalyzer_analyzeMessages_myEmailAddresses___block_invoke;
  v10[3] = &unk_1E68674A8;
  v10[4] = a1;
  v10[5] = v7;
  v10[6] = v8;
  v10[7] = a4;
  return (id)objc_msgSend(a3, "ef_map:", v10);
}

uint64_t __70__MFMailMessageRelationshipAnalyzer_analyzeMessages_myEmailAddresses___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) relationOfMessage:a2 toMessage:*(void *)(a1 + 40) previousSenders:*(void *)(a1 + 48) myEmailAddresses:*(void *)(a1 + 56)];
  objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", objc_msgSend(*(id *)(a1 + 32), "sendersOfMessage:", a2));
  v5 = NSNumber;
  return [v5 numberWithUnsignedInteger:v4];
}

+ (id)sendersOfMessage:(id)a3
{
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  objc_msgSend(v4, "addObjectsFromArray:", objc_msgSend(a3, "senders"));
  return (id)objc_msgSend(v4, "ef_map:", &__block_literal_global_14);
}

uint64_t __54__MFMailMessageRelationshipAnalyzer_sendersOfMessage___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mf_uncommentedAddress");
}

+ (unint64_t)relationOfMessage:(id)a3 toMessage:(id)a4
{
  uint64_t v7 = [a1 myEmailAddresses];
  return [a1 relationOfMessage:a3 toMessage:a4 previousSenders:0 myEmailAddresses:v7];
}

+ (unint64_t)relationOfMessage:(id)a3 toMessage:(id)a4 previousSenders:(id)a5 myEmailAddresses:(id)a6
{
  if (objc_msgSend(a4, "isEqual:")) {
    return 0;
  }
  if ([a1 isMessage:a3 responseToMessage:a4 previousSenders:a5 myEmailAddresses:a6])
  {
    if ([a1 isMessageDraft:a3]) {
      return 2;
    }
    else {
      return 1;
    }
  }
  else if ([a1 isMessage:a3 forwardOfMessage:a4 myEmailAddresses:a6])
  {
    return 3;
  }
  else
  {
    return 0;
  }
}

+ (BOOL)isMessage:(id)a3 responseToMessage:(id)a4 previousSenders:(id)a5 myEmailAddresses:(id)a6
{
  int v10 = [a1 isMessage:a3 sentByAddress:a6];
  if (v10)
  {
    if ([a1 isMessage:a3 addressedToPreviousSender:a5])
    {
      LOBYTE(v10) = 1;
    }
    else
    {
      LOBYTE(v10) = [a1 isMessage:a3 addressedToMailingListForMessage:a4];
    }
  }
  return v10;
}

+ (BOOL)isMessage:(id)a3 addressedToPreviousSender:(id)a4
{
  v5 = (void *)[a1 recipientsOfMessage:a3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__MFMailMessageRelationshipAnalyzer_isMessage_addressedToPreviousSender___block_invoke;
  v7[3] = &unk_1E68674F0;
  v7[4] = a4;
  return objc_msgSend(v5, "ef_any:", v7);
}

uint64_t __73__MFMailMessageRelationshipAnalyzer_isMessage_addressedToPreviousSender___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_msgSend(a2, "mf_uncommentedAddress");
  return [v2 containsObject:v3];
}

+ (BOOL)isMessage:(id)a3 addressedToMailingListForMessage:(id)a4
{
  id v6 = (void *)[a4 headersIfAvailable];
  uint64_t v7 = objc_msgSend((id)objc_msgSend(v6, "firstHeaderForKey:", *MEMORY[0x1E4F606D0]), "mf_uncommentedAddress");
  uint64_t v8 = [v7 length];
  if (v8)
  {
    v9 = (void *)[a1 recipientsOfMessage:a3];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __80__MFMailMessageRelationshipAnalyzer_isMessage_addressedToMailingListForMessage___block_invoke;
    v11[3] = &unk_1E68674F0;
    v11[4] = v7;
    LOBYTE(v8) = objc_msgSend(v9, "ef_any:", v11);
  }
  return v8;
}

uint64_t __80__MFMailMessageRelationshipAnalyzer_isMessage_addressedToMailingListForMessage___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mf_containsSubstring:options:", *(void *)(a1 + 32), 1);
}

+ (id)recipientsOfMessage:(id)a3
{
  uint64_t v3 = (void *)[a3 to];
  return (id)objc_msgSend(v3, "ef_map:", &__block_literal_global_8);
}

uint64_t __57__MFMailMessageRelationshipAnalyzer_recipientsOfMessage___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mf_uncommentedAddress");
}

+ (BOOL)isMessageDraft:(id)a3
{
  return objc_msgSend((id)objc_msgSend(a3, "mailbox"), "type") == 5;
}

+ (BOOL)isMessage:(id)a3 forwardOfMessage:(id)a4 myEmailAddresses:(id)a5
{
  return [a1 isMessage:a3 sentByAddress:a5];
}

+ (id)myEmailAddresses
{
  v2 = objc_msgSend(+[MailAccount activeAccounts](MailAccount, "activeAccounts"), "ef_map:", &__block_literal_global_12);
  uint64_t v3 = objc_msgSend(v2, "ef_filter:", *MEMORY[0x1E4F60CE8]);
  return (id)objc_msgSend(v3, "ef_flatten");
}

uint64_t __53__MFMailMessageRelationshipAnalyzer_myEmailAddresses__block_invoke(uint64_t a1, void *a2)
{
  return [a2 emailAddressesAndAliasesList];
}

+ (BOOL)isMessage:(id)a3 sentByAddress:(id)a4
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "firstSender"), "mf_uncommentedAddress");
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__MFMailMessageRelationshipAnalyzer_isMessage_sentByAddress___block_invoke;
  v7[3] = &unk_1E68674F0;
  v7[4] = v5;
  return objc_msgSend(a4, "ef_any:", v7);
}

uint64_t __61__MFMailMessageRelationshipAnalyzer_isMessage_sentByAddress___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_msgSend(a2, "mf_uncommentedAddress");
  return objc_msgSend(v2, "mf_caseInsensitiveIsEqualToString:", v3);
}

@end