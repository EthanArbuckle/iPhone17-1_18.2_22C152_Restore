@interface WFEmailTrigger(CoreDuetContext)
- (id)contextStorePredicate;
- (uint64_t)contextStoreKeyPathForCurrentState;
- (uint64_t)contextStoreQualityOfService;
@end

@implementation WFEmailTrigger(CoreDuetContext)

- (uint64_t)contextStoreQualityOfService
{
  return 21;
}

- (id)contextStorePredicate
{
  v21 = [a1 contextStoreKeyPathForCurrentState];
  v16 = (void *)MEMORY[0x1E4F5B6E8];
  v15 = [a1 selectedSubject];
  v22 = [MEMORY[0x1E4F5B6B8] subjectKey];
  v14 = [a1 selectedSubject];
  v20 = [MEMORY[0x1E4F5B6B8] subjectKey];
  v19 = [a1 selectedSubject];
  v13 = [a1 selectedRecipients];
  v18 = [a1 selectedRecipients];
  v12 = [MEMORY[0x1E4F5B6B8] recipientsKey];
  v11 = [a1 selectedRecipients];
  v10 = [a1 selectedSenders];
  v2 = [a1 selectedSenders];
  v3 = [a1 selectedSenders];
  v9 = [MEMORY[0x1E4F5B6B8] senderKey];
  v4 = [a1 selectedAccountIdentifiers];
  v5 = [a1 selectedAccountIdentifiers];
  v6 = [MEMORY[0x1E4F5B6B8] accountIdentifierKey];
  v7 = [a1 selectedAccountIdentifiers];
  objc_msgSend(v16, "predicateForKeyPath:withFormat:", v21, v15, v22, v14, v20, v19, v13, v18, v12, v11, v10, v2, v3, v9, v4, v5, v6,
  v17 = v7);

  [v17 setEvaluateOnEveryKeyPathUpdate:1];
  return v17;
}

- (uint64_t)contextStoreKeyPathForCurrentState
{
  return [MEMORY[0x1E4F5B6B8] keyPathForRecentEmails];
}

@end