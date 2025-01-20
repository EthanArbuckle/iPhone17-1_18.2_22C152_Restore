@interface MFMessageCriterion
+ (id)VIPSenderMessageCriterion;
+ (id)andCompoundCriterionWithCriteria:(id)a3;
+ (id)ccMeCriterion;
+ (id)criteriaFromDefaultsArray:(id)a3;
+ (id)criteriaFromDefaultsArray:(id)a3 removingRecognizedKeys:(BOOL)a4;
+ (id)criterionExcludingMailboxes:(id)a3;
+ (id)criterionForAccount:(id)a3;
+ (id)criterionForConversationID:(int64_t)a3;
+ (id)criterionForDateReceivedOlderThanDate:(id)a3;
+ (id)criterionForLibraryID:(id)a3;
+ (id)criterionForMailbox:(id)a3;
+ (id)criterionForMailboxURL:(id)a3;
+ (id)criterionForNotDeletedConversationID:(int64_t)a3;
+ (id)defaultsArrayFromCriteria:(id)a3;
+ (id)expressionForDate:(id)a3;
+ (id)flaggedMessageCriterion;
+ (id)hasAttachmentsCriterion;
+ (id)includesMeCriterion;
+ (id)messageIsDeletedCriterion:(BOOL)a3;
+ (id)messageIsJournaledCriterion:(BOOL)a3;
+ (id)messageIsServerSearchResultCriterion:(BOOL)a3;
+ (id)notCriterionWithCriterion:(id)a3;
+ (id)orCompoundCriterionWithCriteria:(id)a3;
+ (id)readMessageCriterion;
+ (id)stringForCriterionType:(int64_t)a3;
+ (id)threadMuteMessageCriterion;
+ (id)threadNotifyMessageCriterion;
+ (id)toMeCriterion;
+ (id)todayMessageCriterion;
+ (id)unreadMessageCriterion;
+ (int64_t)criterionTypeForString:(id)a3;
+ (void)_updateAddressComments:(id)a3;
- (BOOL)_evaluateAccountCriterion:(id)a3;
- (BOOL)_evaluateAddressBookCriterion:(id)a3;
- (BOOL)_evaluateAddressHistoryCriterion:(id)a3;
- (BOOL)_evaluateAttachmentCriterion:(id)a3;
- (BOOL)_evaluateCompoundCriterion:(id)a3;
- (BOOL)_evaluateConversationIDCriterion:(id)a3;
- (BOOL)_evaluateDateCriterion:(id)a3;
- (BOOL)_evaluateFlagCriterion:(id)a3;
- (BOOL)_evaluateFullNameCriterion:(id)a3;
- (BOOL)_evaluateHeaderCriterion:(id)a3;
- (BOOL)_evaluateIsDigitallySignedCriterion:(id)a3;
- (BOOL)_evaluateIsEncryptedCriterion:(id)a3;
- (BOOL)_evaluateMailboxCriterion:(id)a3;
- (BOOL)_evaluatePartOfStructure:(id)a3;
- (BOOL)_evaluatePriorityIsHighCriterion:(id)a3;
- (BOOL)_evaluatePriorityIsLowCriterion:(id)a3;
- (BOOL)_evaluatePriorityIsNormalCriterion:(id)a3;
- (BOOL)_evaluateSenderHeaderCriterion:(id)a3;
- (BOOL)allCriteriaMustBeSatisfied;
- (BOOL)dateIsRelative;
- (BOOL)doesMessageSatisfyCriterion:(id)a3;
- (BOOL)expressionIsSanitized;
- (BOOL)includeRelatedMessages;
- (BOOL)includeRemoteBodyContent;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVIPCriterion;
- (BOOL)preferFullTextSearch;
- (BOOL)useFlaggedForUnreadCount;
- (MFMessageCriterion)init;
- (MFMessageCriterion)initWithCriterion:(id)a3 expression:(id)a4;
- (MFMessageCriterion)initWithDictionary:(id)a3;
- (MFMessageCriterion)initWithDictionary:(id)a3 andRemoveRecognizedKeysIfMutable:(BOOL)a4;
- (MFMessageCriterion)initWithType:(int64_t)a3 qualifier:(int)a4 expression:(id)a5;
- (NSArray)criteria;
- (NSIndexSet)libraryIdentifiers;
- (NSString)criterionIdentifier;
- (NSString)expression;
- (NSString)name;
- (id)_headersRequiredForEvaluation;
- (id)_qualifierString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dateFromExpression;
- (id)description;
- (id)descriptionWithDepth:(unsigned int)a3;
- (id)dictionaryRepresentation;
- (id)simplifiedCriterion;
- (id)simplifyOnce;
- (id)stringForMessageRuleQualifier:(int)a3;
- (int)dateUnits;
- (int)messageRuleQualifierForString:(id)a3;
- (int)qualifier;
- (int64_t)criterionType;
- (unint64_t)hash;
- (void)dealloc;
- (void)setAllCriteriaMustBeSatisfied:(BOOL)a3;
- (void)setCriteria:(id)a3;
- (void)setCriterionIdentifier:(id)a3;
- (void)setCriterionType:(int64_t)a3;
- (void)setDateIsRelative:(BOOL)a3;
- (void)setDateUnits:(int)a3;
- (void)setExpression:(id)a3;
- (void)setExpressionIsSanitized:(BOOL)a3;
- (void)setIncludeRelatedMessages:(BOOL)a3;
- (void)setIncludeRemoteBodyContent:(BOOL)a3;
- (void)setLibraryIdentifiers:(id)a3;
- (void)setName:(id)a3;
- (void)setPreferFullTextSearch:(BOOL)a3;
- (void)setQualifier:(int)a3;
- (void)setUseFlaggedForUnreadCount:(BOOL)a3;
@end

@implementation MFMessageCriterion

+ (id)VIPSenderMessageCriterion
{
  v2 = [[MFMessageCriterion alloc] initWithType:26 qualifier:3 expression:@"MessageSenderIsVIP"];
  [(MFMessageCriterion *)v2 setName:@"VIPCriterion"];
  return v2;
}

- (int64_t)criterionType
{
  int64_t result = self->_type;
  if (result == -1)
  {
    int64_t result = [(id)objc_opt_class() criterionTypeForString:self->_criterionIdentifier];
    self->_type = result;
  }
  return result;
}

- (NSString)expression
{
  int64_t result = self->_expression;
  if (!result)
  {
    int64_t result = (NSString *)[(NSIndexSet *)self->_libraryIdentifiers mf_commaSeparatedString];
    self->_expression = result;
  }
  return result;
}

+ (id)criterionForMailboxURL:(id)a3
{
  v3 = [[MFMessageCriterion alloc] initWithType:22 qualifier:3 expression:a3];
  return v3;
}

- (MFMessageCriterion)initWithType:(int64_t)a3 qualifier:(int)a4 expression:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  v8 = [(MFMessageCriterion *)self init];
  v9 = v8;
  if (v8)
  {
    [(MFMessageCriterion *)v8 setCriterionType:a3];
    [(MFMessageCriterion *)v9 setQualifier:v6];
    [(MFMessageCriterion *)v9 setExpression:a5];
  }
  return v9;
}

- (void)setCriterionType:(int64_t)a3
{
  self->_type = -1;
}

- (MFMessageCriterion)init
{
  v7.receiver = self;
  v7.super_class = (Class)MFMessageCriterion;
  v2 = [(MFMessageCriterion *)&v7 init];
  if (v2)
  {
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFUUIDRef v4 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
    CFStringRef v5 = CFUUIDCreateString(v3, v4);

    v2->_uniqueId = &v5->isa;
    v2->_type = -1;
  }
  return v2;
}

- (void)setQualifier:(int)a3
{
  self->_qualifier = a3;
}

- (void)setCriterionIdentifier:(id)a3
{
  criterionIdentifier = self->_criterionIdentifier;
  uint64_t v6 = [a3 caseInsensitiveCompare:@"To or Cc"];
  objc_super v7 = @"AnyRecipient";
  if (v6) {
    objc_super v7 = (__CFString *)a3;
  }
  self->_criterionIdentifier = (NSString *)v7;

  self->_type = -1;
}

+ (id)stringForCriterionType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x26) {
    return 0;
  }
  else {
    return off_1E6866AF8[a3 - 1];
  }
}

- (void)setExpression:(id)a3
{
  expression = self->_expression;
  self->_expression = (NSString *)[a3 copy];
}

+ (int64_t)criterionTypeForString:(id)a3
{
  if ([a3 isEqualToString:@"Header"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"Body"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"SenderIsInAddressBook"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"SenderIsNotInAddressBook"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"SenderHeader"]) {
    return 34;
  }
  if ([a3 isEqualToString:@"Account"]) {
    return 7;
  }
  if ([a3 isEqualToString:@"AnyMessage"]) {
    return 8;
  }
  if ([a3 isEqualToString:@"AnyRecipient"]) {
    return 9;
  }
  if ([a3 isEqualToString:@"DateReceived"]) {
    return 11;
  }
  if ([a3 isEqualToString:@"DateLastViewed"]) {
    return 28;
  }
  if ([a3 isEqualToString:@"DateSent"]) {
    return 10;
  }
  if ([a3 isEqualToString:@"SenderIsInAddressHistory"]) {
    return 12;
  }
  if ([a3 isEqualToString:@"SenderIsNotInAddressHistory"]) {
    return 13;
  }
  if ([a3 isEqualToString:@"AnyRecipientIncludesFullName"]) {
    return 14;
  }
  if ([a3 isEqualToString:@"NoRecipientIncludesFullName"]) {
    return 15;
  }
  if ([a3 isEqualToString:@"IsDigitallySigned"]) {
    return 16;
  }
  if ([a3 isEqualToString:@"IsEncrypted"]) {
    return 17;
  }
  if ([a3 isEqualToString:@"PriorityIsNormal"]) {
    return 20;
  }
  if ([a3 isEqualToString:@"PriorityIsHigh"]) {
    return 19;
  }
  if ([a3 isEqualToString:@"PriorityIsLow"]) {
    return 21;
  }
  if ([a3 isEqualToString:@"AnyAttachment"]) {
    return 18;
  }
  if ([a3 isEqualToString:@"Mailbox"]) {
    return 22;
  }
  if ([a3 isEqualToString:@"MessageNumber"]) {
    return 23;
  }
  if ([a3 isEqualToString:@"ExternalID"]) {
    return 35;
  }
  if ([a3 isEqualToString:@"Compound"]) {
    return 24;
  }
  if ([a3 isEqualToString:@"Flag"]) {
    return 26;
  }
  if ([a3 isEqualToString:@"NotInTrashMailbox"]) {
    return 27;
  }
  if ([a3 isEqualToString:@"ContainsAttachments"]) {
    return 29;
  }
  if ([a3 isEqualToString:@"SpotlightSearch"]) {
    return 32;
  }
  if ([a3 isEqualToString:@"ConversationID"]) {
    return 33;
  }
  if ([a3 isEqualToString:@"Negation"]) {
    return 25;
  }
  if ([a3 isEqualToString:@"MessageIdHash"]) {
    return 36;
  }
  if ([a3 isEqualToString:@"ListIDHash"]) {
    return 37;
  }
  if ([a3 isEqualToString:@"ToRecipient"]) {
    return 38;
  }
  if ([a3 isEqualToString:@"CcRecipient"]) {
    return 39;
  }
  return 1;
}

+ (id)threadNotifyMessageCriterion
{
  v2 = [[MFMessageCriterion alloc] initWithType:26 qualifier:3 expression:@"MessageConversationIsVIP"];
  [(MFMessageCriterion *)v2 setName:@"ThreadNotifyCriterionName"];
  return v2;
}

+ (id)includesMeCriterion
{
  v2 = [[MFMessageCriterion alloc] initWithType:26 qualifier:3 expression:@"MessageToOrCcContainsAccountAddress"];
  [(MFMessageCriterion *)v2 setName:@"IncludesMeCriterion"];
  return v2;
}

+ (id)threadMuteMessageCriterion
{
  v2 = [[MFMessageCriterion alloc] initWithType:26 qualifier:3 expression:@"MessageConversationIsMuted"];
  [(MFMessageCriterion *)v2 setName:@"ThreadMuteCriterionName"];
  return v2;
}

+ (id)todayMessageCriterion
{
  v2 = [MFMessageCriterion alloc];
  CFAllocatorRef v3 = -[MFMessageCriterion initWithType:qualifier:expression:](v2, "initWithType:qualifier:expression:", 11, 5, objc_msgSend(NSString, "stringWithFormat:", @"%d", 1));
  [(MFMessageCriterion *)v3 setDateUnits:1];
  [(MFMessageCriterion *)v3 setDateIsRelative:1];
  [(MFMessageCriterion *)v3 setName:@"TodayCriterion"];
  return v3;
}

+ (id)flaggedMessageCriterion
{
  v2 = [[MFMessageCriterion alloc] initWithType:26 qualifier:3 expression:@"MessageIsFlagged"];
  [(MFMessageCriterion *)v2 setUseFlaggedForUnreadCount:1];
  [(MFMessageCriterion *)v2 setName:@"FlaggedCriterion"];
  return v2;
}

+ (id)hasAttachmentsCriterion
{
  v2 = [[MFMessageCriterion alloc] initWithType:26 qualifier:3 expression:@"MFMessageHasAttachments"];
  [(MFMessageCriterion *)v2 setName:@"HasAttachmentsCriterion"];
  return v2;
}

- (void)setName:(id)a3
{
}

- (void)setUseFlaggedForUnreadCount:(BOOL)a3
{
  self->_useFlaggedForUnreadCount = a3;
}

- (void)setDateUnits:(int)a3
{
  self->_dateUnitType = a3;
}

- (void)setDateIsRelative:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 68) = *((unsigned char *)self + 68) & 0xFD | v3;
}

+ (id)criteriaFromDefaultsArray:(id)a3
{
  return (id)[a1 criteriaFromDefaultsArray:a3 removingRecognizedKeys:1];
}

+ (id)criteriaFromDefaultsArray:(id)a3 removingRecognizedKeys:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  v9 = 0;
  uint64_t v10 = *(void *)v16;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v16 != v10) {
        objc_enumerationMutation(a3);
      }
      uint64_t v12 = [objc_alloc((Class)a1) initWithDictionary:*(void *)(*((void *)&v15 + 1) + 8 * i) andRemoveRecognizedKeysIfMutable:v4];
      if (v12)
      {
        v13 = (void *)v12;
        if (!v9) {
          v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a3, "count"));
        }
        [v9 addObject:v13];
      }
    }
    uint64_t v8 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  }
  while (v8);
  return v9;
}

+ (id)defaultsArrayFromCriteria:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  uint64_t v6 = 0;
  uint64_t v7 = *(void *)v13;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(a3);
      }
      uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) dictionaryRepresentation];
      if (v9)
      {
        uint64_t v10 = v9;
        if (!v6) {
          uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a3, "count"));
        }
        [v6 addObject:v10];
      }
    }
    uint64_t v5 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  }
  while (v5);
  return v6;
}

- (MFMessageCriterion)initWithCriterion:(id)a3 expression:(id)a4
{
  uint64_t v6 = [(MFMessageCriterion *)self init];
  uint64_t v7 = v6;
  if (v6)
  {
    [(MFMessageCriterion *)v6 setCriterionIdentifier:a3];
    [(MFMessageCriterion *)v7 setExpression:a4];
  }
  return v7;
}

- (MFMessageCriterion)initWithDictionary:(id)a3
{
  return [(MFMessageCriterion *)self initWithDictionary:a3 andRemoveRecognizedKeysIfMutable:1];
}

- (MFMessageCriterion)initWithDictionary:(id)a3 andRemoveRecognizedKeysIfMutable:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [a3 objectForKey:@"Qualifier"];
  uint64_t v8 = -[MFMessageCriterion initWithCriterion:expression:](self, "initWithCriterion:expression:", [a3 objectForKey:@"Header"], objc_msgSend(a3, "objectForKey:", @"Expression"));
  if (v8)
  {
    uint64_t v9 = [a3 objectForKey:@"CriterionUniqueId"];
    if (v9)
    {
      uint64_t v10 = (void *)v9;

      v8->_uniqueId = (NSString *)v10;
    }
    [(MFMessageCriterion *)v8 setQualifier:[(MFMessageCriterion *)v8 messageRuleQualifierForString:v7]];
    -[MFMessageCriterion setAllCriteriaMustBeSatisfied:](v8, "setAllCriteriaMustBeSatisfied:", objc_msgSend(a3, "mf_BOOLForKey:", @"AllCriteriaMustBeSatisfied"));
    if ([(MFMessageCriterion *)v8 criterionType] == 7
      && !+[MailAccount accountWithPath:v8->_expression])
    {
      uint64_t v21 = [a3 objectForKey:@"AccountURL"];
      if (v21)
      {
        v22 = objc_msgSend(+[MailAccount infoForURL:](MailAccount, "infoForURL:", objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:", v21)), "objectForKey:", @"Account");
        if (v22) {
          -[MFMessageCriterion setExpression:](v8, "setExpression:", [v22 tildeAbbreviatedPath]);
        }
      }
    }
    uint64_t v11 = [a3 objectForKey:@"Name"];
    if (v11) {
      [(MFMessageCriterion *)v8 setName:v11];
    }
    if ([(MFMessageCriterion *)v8 criterionType] == 24)
    {
      long long v12 = (void *)[a3 objectForKey:@"Criteria"];
      long long v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v12, "count"));
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v24 != v16) {
              objc_enumerationMutation(v12);
            }
            long long v18 = [[MFMessageCriterion alloc] initWithDictionary:*(void *)(*((void *)&v23 + 1) + 8 * i) andRemoveRecognizedKeysIfMutable:v4];
            [v13 addObject:v18];
          }
          uint64_t v15 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v15);
      }
      [(MFMessageCriterion *)v8 setCriteria:v13];
    }
    else if ([(MFMessageCriterion *)v8 criterionType] == 11 {
           || [(MFMessageCriterion *)v8 criterionType] == 28)
    }
    {
      v8->_dateUnitType = objc_msgSend(a3, "mf_integerForKey:", @"DateUnitType");
      if (objc_msgSend(a3, "mf_BOOLForKey:", @"DateIsRelative")) {
        char v19 = 2;
      }
      else {
        char v19 = 0;
      }
      *((unsigned char *)v8 + 68) = *((unsigned char *)v8 + 68) & 0xFD | v19;
    }
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [a3 removeObjectForKey:@"Qualifier"];
        [a3 removeObjectForKey:@"Header"];
        [a3 removeObjectForKey:@"Expression"];
      }
    }
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFMessageCriterion;
  [(MFMessageCriterion *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_8:
      LOBYTE(v5) = 0;
      return v5;
    }
    BOOL v5 = -[NSString isEqualToString:](-[MFMessageCriterion criterionIdentifier](self, "criterionIdentifier"), "isEqualToString:", [a3 criterionIdentifier]);
    if (v5)
    {
      int v6 = [(MFMessageCriterion *)self qualifier];
      if (v6 != [a3 qualifier]) {
        goto LABEL_8;
      }
      int v7 = [(MFMessageCriterion *)self includeRemoteBodyContent];
      if (v7 != [a3 includeRemoteBodyContent]) {
        goto LABEL_8;
      }
      if ([(MFMessageCriterion *)self criterionType] == 24)
      {
        if (!-[NSArray isEqualToArray:](-[MFMessageCriterion criteria](self, "criteria"), "isEqualToArray:", [a3 criteria]))goto LABEL_8; {
      }
        }
      else
      {
        BOOL v5 = -[NSString isEqualToString:](-[MFMessageCriterion expression](self, "expression"), "isEqualToString:", [a3 expression]);
        if (!v5) {
          return v5;
        }
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ([(MFMessageCriterion *)self criterionType] == 24) {
    objc_super v3 = [(MFMessageCriterion *)self criteria];
  }
  else {
    objc_super v3 = [(MFMessageCriterion *)self expression];
  }
  return [(NSArray *)v3 hash];
}

- (id)descriptionWithDepth:(unsigned int)a3
{
  BOOL v5 = (__CFString *)[MEMORY[0x1E4F28E78] stringWithCapacity:4 * a3];
  if (a3)
  {
    unsigned int v6 = a3;
    do
    {
      --v6;
      [(__CFString *)v5 appendString:@"    "];
    }
    while (v6);
  }
  if ([(MFMessageCriterion *)self criterionType] == 24)
  {
    int v7 = [(MFMessageCriterion *)self criteria];
    uint64_t v8 = (__CFString *)[MEMORY[0x1E4F28E78] string];
    uint64_t v9 = [(NSArray *)v7 count];
    if (v9)
    {
      uint64_t v10 = v9;
      [(__CFString *)v8 appendString:@"\n"];
      uint64_t v11 = a3 + 1;
      uint64_t v12 = v10 - 1;
      do
        -[__CFString appendString:](v8, "appendString:", objc_msgSend(-[NSArray objectAtIndex:](v7, "objectAtIndex:", v12--), "descriptionWithDepth:", v11));
      while (v12 != -1);
    }
    else
    {
      [(__CFString *)v8 appendString:@"(none)"];
    }
    char v19 = NSString;
    uint64_t v20 = [(MFMessageCriterion *)self criterionIdentifier];
    if ([(MFMessageCriterion *)self name]) {
      uint64_t v21 = (__CFString *)[NSString stringWithFormat:@"%@  Name: %@\n", v5, -[MFMessageCriterion name](self, "name")];
    }
    else {
      uint64_t v21 = &stru_1F265CF90;
    }
    BOOL v22 = [(MFMessageCriterion *)self allCriteriaMustBeSatisfied];
    long long v23 = @"No";
    if (v22) {
      long long v23 = @"Yes";
    }
    p_isa = &v5->isa;
    v33 = v8;
    id v30 = v5;
    v31 = v23;
    uint64_t v28 = v20;
    v29 = v21;
    long long v24 = @"%@Criterion: %@\n%@%@  All criteria must be satisfied: %@\n%@  Criteria: %@";
    v27 = v5;
LABEL_23:
    long long v25 = v19;
    return (id)objc_msgSend(v25, "stringWithFormat:", v24, v27, v28, v29, v30, v31, p_isa, v33);
  }
  if ([(MFMessageCriterion *)self criterionType] == 25)
  {
    if ([(NSArray *)[(MFMessageCriterion *)self criteria] count]) {
      uint64_t v13 = objc_msgSend(-[NSArray firstObject](-[MFMessageCriterion criteria](self, "criteria"), "firstObject"), "descriptionWithDepth:", a3 + 1);
    }
    else {
      uint64_t v13 = 0;
    }
    char v19 = NSString;
    v29 = v5;
    id v30 = (id)v13;
    v27 = v5;
    uint64_t v28 = [(MFMessageCriterion *)self criterionIdentifier];
    long long v24 = @"%@Criterion: %@\n%@ Sub-Criterion: \n%@";
    goto LABEL_23;
  }
  uint64_t v14 = NSString;
  uint64_t v15 = [(MFMessageCriterion *)self criterionIdentifier];
  id v16 = [(MFMessageCriterion *)self _qualifierString];
  uint64_t v17 = [(MFMessageCriterion *)self expression];
  if ([(MFMessageCriterion *)self name]) {
    long long v18 = (__CFString *)[NSString stringWithFormat:@"%@  Name: %@\n", v5, -[MFMessageCriterion name](self, "name")];
  }
  else {
    long long v18 = &stru_1F265CF90;
  }
  p_isa = v17;
  v33 = v18;
  id v30 = v16;
  v31 = v5;
  uint64_t v28 = v15;
  v29 = v5;
  long long v24 = @"%@Criterion: %@\n%@  Qualifier: %@\n%@  Expression: %@\n%@";
  v27 = v5;
  long long v25 = v14;
  return (id)objc_msgSend(v25, "stringWithFormat:", v24, v27, v28, v29, v30, v31, p_isa, v33);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p> %@", objc_opt_class(), self, -[MFMessageCriterion descriptionWithDepth:](self, "descriptionWithDepth:", 0)];
}

- (id)dictionaryRepresentation
{
  v22[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
  id v4 = [(MFMessageCriterion *)self _qualifierString];
  [v3 setObject:self->_uniqueId forKey:@"CriterionUniqueId"];
  criterionIdentifier = self->_criterionIdentifier;
  if (criterionIdentifier && ![(NSString *)criterionIdentifier isEqualToString:&stru_1F265CF90]) {
    [v3 setObject:self->_criterionIdentifier forKey:@"Header"];
  }
  expression = self->_expression;
  if (expression && ![(NSString *)expression isEqualToString:&stru_1F265CF90]) {
    [v3 setObject:self->_expression forKey:@"Expression"];
  }
  if (v4 && ([v4 isEqualToString:&stru_1F265CF90] & 1) == 0) {
    [v3 setObject:v4 forKey:@"Qualifier"];
  }
  if ([(MFMessageCriterion *)self criterionType] == 7)
  {
    int v7 = +[MailAccount accountWithPath:self->_expression];
    if (v7)
    {
      uint64_t v21 = @"Account";
      v22[0] = v7;
      objc_msgSend(v3, "setObject:forKey:", objc_msgSend(+[MailAccount URLForInfo:](MailAccount, "URLForInfo:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1)), "absoluteString"), @"AccountURL");
    }
  }
  name = self->_name;
  if (name && ![(NSString *)name isEqualToString:&stru_1F265CF90]) {
    [v3 setObject:self->_name forKey:@"Name"];
  }
  if ([(MFMessageCriterion *)self criterionType] == 24)
  {
    if ([(NSArray *)self->_criteria count])
    {
      uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_criteria, "count"));
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      criteria = self->_criteria;
      uint64_t v11 = [(NSArray *)criteria countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v17 != v13) {
              objc_enumerationMutation(criteria);
            }
            objc_msgSend(v9, "addObject:", objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation"));
          }
          uint64_t v12 = [(NSArray *)criteria countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v12);
      }
      [v3 setObject:v9 forKey:@"Criteria"];
    }
    objc_msgSend(v3, "mf_setBool:forKey:", *((unsigned char *)self + 68) & 1, @"AllCriteriaMustBeSatisfied");
  }
  else if ([(MFMessageCriterion *)self criterionType] == 11 {
         || [(MFMessageCriterion *)self criterionType] == 28)
  }
  {
    objc_msgSend(v3, "mf_setBool:forKey:", (*((unsigned __int8 *)self + 68) >> 1) & 1, @"DateIsRelative");
    [v3 setObject:objc_msgSend(NSString, "stringWithFormat:", @"%d", self->_dateUnitType), @"DateUnitType" forKey];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:qualifier:expression:", -[MFMessageCriterion criterionType](self, "criterionType"), -[MFMessageCriterion qualifier](self, "qualifier"), -[MFMessageCriterion expression](self, "expression"));
  *(void *)(v5 + 8) = [(NSString *)self->_criterionIdentifier copyWithZone:a3];
  *(void *)(v5 + 32) = [(NSString *)self->_name copyWithZone:a3];
  *(void *)(v5 + 40) = [(NSString *)self->_uniqueId copyWithZone:a3];
  *(void *)(v5 + 56) = [(NSArray *)self->_criteria copyWithZone:a3];
  *(void *)(v5 + 72) = [(NSArray *)self->_requiredHeaders copyWithZone:a3];
  *(_DWORD *)(v5 + 64) = self->_dateUnitType;
  int v6 = *(unsigned char *)(v5 + 68) & 0xFE | *((unsigned char *)self + 68) & 1;
  *(unsigned char *)(v5 + 68) = v6;
  unsigned int v7 = v6 & 0xFFFFFFFD | (2 * ((*((unsigned __int8 *)self + 68) >> 1) & 1));
  *(unsigned char *)(v5 + 68) = v7;
  *(void *)(v5 + 88) = self->_libraryIdentifiers;
  *(unsigned char *)(v5 + 80) = self->_preferFullTextSearch;
  *(unsigned char *)(v5 + 81) = self->_useFlaggedForUnreadCount;
  *(unsigned char *)(v5 + 68) = *((unsigned char *)self + 68) & 4 | v7 & 0xFB;
  *(unsigned char *)(v5 + 82) = self->_expressionIsSanitized;
  *(unsigned char *)(v5 + 83) = self->_includeRemoteBodyContent;
  return (id)v5;
}

- (NSString)criterionIdentifier
{
  if (self->_criterionIdentifier) {
    return self->_criterionIdentifier;
  }
  else {
    return (NSString *)@"From";
  }
}

- (id)_qualifierString
{
  return [(MFMessageCriterion *)self stringForMessageRuleQualifier:self->_qualifier];
}

- (id)_headersRequiredForEvaluation
{
  v25[5] = *MEMORY[0x1E4F143B8];
  id result = self->_requiredHeaders;
  if (!result)
  {
    _MFLockGlobalLock();
    if (self->_requiredHeaders)
    {
LABEL_26:
      _MFUnlockGlobalLock();
      return self->_requiredHeaders;
    }
    uint64_t v4 = [(MFMessageCriterion *)self criterionType];
    if (v4 <= 18)
    {
      if ((unint64_t)(v4 - 14) < 2 || v4 == 9)
      {
        uint64_t v7 = *MEMORY[0x1E4F60660];
        v25[0] = *MEMORY[0x1E4F60740];
        v25[1] = v7;
        uint64_t v8 = *MEMORY[0x1E4F60718];
        v25[2] = *MEMORY[0x1E4F60730];
        v25[3] = v8;
        v25[4] = *MEMORY[0x1E4F60650];
        uint64_t v5 = (void *)MEMORY[0x1E4F1C978];
        int v6 = v25;
        uint64_t v9 = 5;
LABEL_24:
        uint64_t v11 = (void *)[v5 arrayWithObjects:v6 count:v9];
LABEL_25:
        self->_requiredHeaders = (NSArray *)v11;
        goto LABEL_26;
      }
    }
    else
    {
      if ((unint64_t)(v4 - 19) < 3)
      {
        uint64_t v22 = *MEMORY[0x1E4F60770];
        uint64_t v5 = (void *)MEMORY[0x1E4F1C978];
        int v6 = &v22;
LABEL_23:
        uint64_t v9 = 1;
        goto LABEL_24;
      }
      if (v4 == 38)
      {
        uint64_t v24 = *MEMORY[0x1E4F60740];
        uint64_t v5 = (void *)MEMORY[0x1E4F1C978];
        int v6 = &v24;
        goto LABEL_23;
      }
      if (v4 == 39)
      {
        uint64_t v23 = *MEMORY[0x1E4F60660];
        uint64_t v5 = (void *)MEMORY[0x1E4F1C978];
        int v6 = &v23;
        goto LABEL_23;
      }
    }
    uint64_t v10 = [(NSString *)[(MFMessageCriterion *)self criterionIdentifier] componentsSeparatedByString:@" or "];
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](v10, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v10);
          }
          uint64_t v16 = [MEMORY[0x1E4F73508] uniqueHeaderKeyStringForString:*(void *)(*((void *)&v17 + 1) + 8 * i)];
          if (v16) {
            [v11 addObject:v16];
          }
        }
        uint64_t v13 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v13);
    }
    goto LABEL_25;
  }
  return result;
}

+ (void)_updateAddressComments:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (_allAddressComments) {
    objc_msgSend((id)_allAddressComments, "removeAllObjects", a3);
  }
  else {
    _allAddressComments = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  id v3 = +[MailAccount allEmailAddressesIncludingFullUserName:1 includeReceiveAliases:1];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "mf_addressComment"), "lowercaseString");
        if (v8)
        {
          uint64_t v9 = v8;
          if (!+[MailAccount accountContainingEmailAddress:](MailAccount, "accountContainingEmailAddress:", v8))[(id)_allAddressComments addObject:v9]; {
        }
          }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (BOOL)_evaluateCompoundCriterion:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v5 = [(MFMessageCriterion *)self allCriteriaMustBeSatisfied];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [(MFMessageCriterion *)self criteria];
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v6);
      }
      int v11 = [*(id *)(*((void *)&v13 + 1) + 8 * v10) doesMessageSatisfyCriterion:a3];
      if (v5 != v11) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          goto LABEL_3;
        }
        return v11;
      }
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }
  return v11;
}

- (BOOL)_evaluateFlagCriterion:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = [(MFMessageCriterion *)self expression];
  v9[0] = &unk_1F26754C0;
  unint64_t v5 = MFMessageFlagsByApplyingDictionary(0, (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1]);
  uint64_t v6 = [a3 messageFlags];
  if ([(MFMessageCriterion *)self qualifier] == 3) {
    return (v6 & v5) != 0;
  }
  else {
    return (v6 & v5) == 0;
  }
}

- (BOOL)_evaluateHeaderCriterion:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(MFMessageCriterion *)self expression];
  int v6 = [(MFMessageCriterion *)self qualifier];
  if (v6 == 3 || v5 && [(NSString *)v5 length])
  {
    long long v25 = (void *)[a3 headers];
    long long v31 = 0u;
    long long v32 = 0u;
    int v7 = v6 == 4;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = [(MFMessageCriterion *)self _headersRequiredForEvaluation];
    uint64_t v27 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v27)
    {
      uint64_t v26 = *(void *)v32;
      LOBYTE(v8) = 1;
      v29 = v5;
LABEL_6:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v32 != v26) {
          objc_enumerationMutation(obj);
        }
        if ((v8 & 1) == 0) {
          break;
        }
        uint64_t v10 = *(void *)(*((void *)&v31 + 1) + 8 * v9);
        int v11 = (void *)[v25 copyHeadersForKey:v10];
        char v30 = [MEMORY[0x1E4F73508] isStructuredHeaderKey:v10];
        uint64_t v12 = [v11 count];
        unint64_t v13 = v12;
        uint64_t v28 = v9;
        if (v6 != 3 || v12)
        {
          if (v12)
          {
            uint64_t v14 = 0;
            while (1)
            {
              uint64_t v15 = [v11 objectAtIndex:v14];
              if (v15 && (uint64_t v16 = v15, [(NSString *)v5 length]))
              {
                if (v30) {
                  id v17 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F73508], "addressListFromEncodedString:", v16), "ef_flatMap:", &__block_literal_global_7);
                }
                else {
                  id v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v16, 0);
                }
                uint64_t v18 = v17;
                uint64_t v19 = [v17 count];
                if (v19)
                {
                  unint64_t v20 = v19;
                  unint64_t v21 = 1;
                  do
                  {
                    BOOL v22 = -[MFMessageCriterion _evaluatePartOfStructure:](self, "_evaluatePartOfStructure:", [v18 objectAtIndex:v21 - 1]);
                    if (v6 == 4) {
                      v7 &= v22;
                    }
                    else {
                      int v7 = v22;
                    }
                    if (v6 == 4) {
                      int v8 = v22;
                    }
                    else {
                      int v8 = !v22;
                    }
                    if (v21 >= v20) {
                      break;
                    }
                    ++v21;
                  }
                  while ((v8 & 1) != 0);
                }
                else
                {
                  int v8 = 1;
                }

                unint64_t v5 = v29;
                if (!v8) {
                  goto LABEL_37;
                }
              }
              else
              {
                LOBYTE(v8) = 1;
              }
              if (++v14 >= v13) {
                goto LABEL_37;
              }
            }
          }
        }
        else
        {
          v7 |= [(NSString *)v5 length] == 0;
        }
        LOBYTE(v8) = 1;
LABEL_37:

        uint64_t v9 = v28 + 1;
        if (v28 + 1 == v27)
        {
          uint64_t v27 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
          if (v27) {
            goto LABEL_6;
          }
          return v7 & 1;
        }
      }
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7 & 1;
}

uint64_t __47__MFMessageCriterion__evaluateHeaderCriterion___block_invoke(uint64_t a1, void *a2)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(a2, "mf_addressComment");
  uint64_t v4 = objc_msgSend(a2, "mf_uncommentedAddress");
  if (v4 && v3)
  {
    v11[0] = v4;
    v11[1] = v3;
    unint64_t v5 = (void *)MEMORY[0x1E4F1C978];
    int v6 = v11;
    uint64_t v7 = 2;
  }
  else
  {
    if (v4)
    {
      uint64_t v10 = v4;
      unint64_t v5 = (void *)MEMORY[0x1E4F1C978];
      int v6 = &v10;
    }
    else
    {
      if (!v3) {
        return MEMORY[0x1E4F1CBF0];
      }
      uint64_t v9 = v3;
      unint64_t v5 = (void *)MEMORY[0x1E4F1C978];
      int v6 = &v9;
    }
    uint64_t v7 = 1;
  }
  return [v5 arrayWithObjects:v6 count:v7];
}

- (BOOL)_evaluateSenderHeaderCriterion:(id)a3
{
  uint64_t v4 = (void *)[a3 firstSender];
  uint64_t v5 = objc_msgSend(v4, "mf_addressComment");
  if (-[MFMessageCriterion _evaluatePartOfStructure:](self, "_evaluatePartOfStructure:", objc_msgSend(v4, "mf_uncommentedAddress")))
  {
    return 1;
  }
  return [(MFMessageCriterion *)self _evaluatePartOfStructure:v5];
}

- (BOOL)_evaluatePartOfStructure:(id)a3
{
  if (a3)
  {
    uint64_t v5 = [(MFMessageCriterion *)self expression];
    int v6 = [(MFMessageCriterion *)self qualifier] - 1;
    int v7 = 0;
    uint64_t v8 = 393;
    switch(v6)
    {
      case 0:
        goto LABEL_12;
      case 1:
        int v7 = 0;
        uint64_t v8 = 397;
        goto LABEL_12;
      case 2:
        return [a3 localizedCaseInsensitiveCompare:v5] == 0;
      case 3:
        int v7 = 1;
        goto LABEL_11;
      case 6:
        return [a3 localizedCaseInsensitiveCompare:v5] != 0;
      default:
        int v7 = 0;
LABEL_11:
        uint64_t v8 = 385;
LABEL_12:
        uint64_t v11 = [a3 length];
        uint64_t v12 = objc_msgSend(a3, "rangeOfString:options:range:locale:", v5, v8, 0, v11, objc_msgSend(MEMORY[0x1E4F1CA20], "currentLocale"));
        if (v7) {
          BOOL result = v12 == 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          BOOL result = v12 != 0x7FFFFFFFFFFFFFFFLL;
        }
        break;
    }
  }
  else
  {
    return [(MFMessageCriterion *)self qualifier] == 4;
  }
  return result;
}

- (BOOL)_evaluateAddressBookCriterion:(id)a3
{
  return 0;
}

- (BOOL)_evaluateFullNameCriterion:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[a3 headers];
  int v6 = (void *)[MEMORY[0x1E4F1CA48] array];
  int v7 = (void *)[v5 copyAddressListForTo];
  if ([v7 count]) {
    [v6 addObjectsFromArray:v7];
  }

  uint64_t v8 = (void *)[v5 copyAddressListForCc];
  if ([v8 count]) {
    [v6 addObjectsFromArray:v8];
  }

  uint64_t v9 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v10 = [v6 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(v6);
        }
        uint64_t v14 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend((id)objc_msgSend(v14, "mf_addressComment"), "lowercaseString");
        if (v15)
        {
          uint64_t v16 = v15;
          if ([v14 caseInsensitiveCompare:v15]) {
            [v9 addObject:v16];
          }
        }
      }
      uint64_t v11 = [v6 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v11);
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v17 = (void *)_allAddressComments;
  uint64_t v18 = [(id)_allAddressComments countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v33;
    while (2)
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(v17);
        }
        BOOL v22 = *(void **)(*((void *)&v32 + 1) + 8 * j);
        uint64_t v23 = [v9 count];
        if (v23)
        {
          uint64_t v24 = v23 - 1;
          while (!objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", v24), "isEqualToString:", v22))
          {
            if (v24-- == 0) {
              goto LABEL_27;
            }
          }
          uint64_t v28 = MFLogGeneral();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v30 = objc_msgSend((id)objc_msgSend(a3, "subject"), "ef_publicDescription");
            uint64_t v31 = [v22 UTF8String];
            *(_DWORD *)buf = 138543618;
            uint64_t v41 = v30;
            __int16 v42 = 2080;
            uint64_t v43 = v31;
            _os_log_debug_impl(&dword_1CFCFE000, v28, OS_LOG_TYPE_DEBUG, "[LogJunkMailActivity] '%{public}@' is addressed to known full name '%s'", buf, 0x16u);
          }
          char v27 = 1;
          return v27 ^ ([(MFMessageCriterion *)self criterionType] != 14);
        }
LABEL_27:
        ;
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v32 objects:v44 count:16];
      char v27 = 0;
      if (v19) {
        continue;
      }
      break;
    }
  }
  else
  {
    char v27 = 0;
  }
  return v27 ^ ([(MFMessageCriterion *)self criterionType] != 14);
}

- (BOOL)_evaluateIsDigitallySignedCriterion:(id)a3
{
  return ((unint64_t)[a3 messageFlags] >> 23) & 1;
}

- (BOOL)_evaluateIsEncryptedCriterion:(id)a3
{
  return ((unint64_t)[a3 messageFlags] >> 3) & 1;
}

- (BOOL)_evaluatePriorityIsNormalCriterion:(id)a3
{
  return [a3 priority] == 3;
}

- (BOOL)_evaluatePriorityIsHighCriterion:(id)a3
{
  return [a3 priority] < 3;
}

- (BOOL)_evaluatePriorityIsLowCriterion:(id)a3
{
  return [a3 priority] > 3;
}

- (BOOL)_evaluateAttachmentCriterion:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(MFMessageCriterion *)self expression];
  if (v5)
  {
    int v6 = v5;
    if ([(NSString *)v5 isEqualToString:&stru_1F265CF90])
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      int v7 = (void *)[a3 messageBodyUpdatingFlags:0];
      id v8 = +[MFActivityMonitor currentMonitor];
      uint64_t v9 = [v8 error];
      [v8 setError:0];
      [a3 calculateAttachmentInfoFromBody:v7];
      uint64_t v10 = objc_msgSend((id)objc_msgSend(v8, "error"), "code");
      [v8 setError:v9];
      LOBYTE(v5) = 0;
      if ((unint64_t)(v10 - 1037) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        uint64_t v5 = (NSString *)[a3 numberOfAttachments];
        if (v5)
        {
          int v11 = [(MFMessageCriterion *)self qualifier];
          uint64_t v12 = (void *)[v7 attachments];
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          uint64_t v5 = (NSString *)[v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v5)
          {
            uint64_t v13 = (uint64_t)v5;
            uint64_t v14 = *(void *)v19;
            while (2)
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v19 != v14) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v16 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "mimePart"), "attachmentFilename");
                switch(v11)
                {
                  case 3:
                    if ([v16 isEqualToString:v6]) {
                      goto LABEL_22;
                    }
                    break;
                  case 2:
                    if ([v16 hasSuffix:v6])
                    {
LABEL_22:
                      LOBYTE(v5) = 1;
                      return (char)v5;
                    }
                    break;
                  case 1:
                    if ([v16 hasPrefix:v6]) {
                      goto LABEL_22;
                    }
                    break;
                  default:
                    LOBYTE(v5) = v11 == 4
                                      * ([v16 rangeOfString:v6 options:1] == 0x7FFFFFFFFFFFFFFFLL);
                    return (char)v5;
                }
              }
              uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
              LOBYTE(v5) = 0;
              if (v13) {
                continue;
              }
              break;
            }
          }
        }
      }
    }
  }
  return (char)v5;
}

- (BOOL)_evaluateAccountCriterion:(id)a3
{
  uint64_t v4 = +[MailAccount accountWithPath:[(MFMessageCriterion *)self expression]];
  return [a3 account] == (void)v4;
}

- (BOOL)_evaluateAddressHistoryCriterion:(id)a3
{
  return 0;
}

- (BOOL)_evaluateDateCriterion:(id)a3
{
  uint64_t v5 = [(MFMessageCriterion *)self expression];
  int v6 = [(MFMessageCriterion *)self qualifier];
  int64_t v7 = [(MFMessageCriterion *)self criterionType];
  if (!v5) {
    return 0;
  }
  int64_t v8 = v7;
  if ([(NSString *)v5 intValue] < 1) {
    return 0;
  }
  if (v8 == 11)
  {
    uint64_t v9 = (void *)[a3 dateReceived];
  }
  else
  {
    if (v8 != 10) {
      return 0;
    }
    uint64_t v9 = (void *)[a3 dateSent];
  }
  [v9 timeIntervalSince1970];
  double v11 = v10;
  [(NSString *)v5 doubleValue];
  if (v6 == 6) {
    return v11 >= v12;
  }
  return v6 == 5 && v11 <= v12;
}

- (BOOL)_evaluateConversationIDCriterion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(NSString *)[(MFMessageCriterion *)self expression] longLongValue];
  if ([(MFMessageCriterion *)self qualifier] == 3) {
    return [a3 conversationID] == v5;
  }
  if ([(MFMessageCriterion *)self qualifier] == 7) {
    return [a3 conversationID] != v5;
  }
  int64_t v7 = MFLogGeneral();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v8)
  {
    int v9 = 134218240;
    uint64_t v10 = [(MFMessageCriterion *)self qualifier];
    __int16 v11 = 2048;
    int64_t v12 = [(MFMessageCriterion *)self criterionType];
    _os_log_impl(&dword_1CFCFE000, v7, OS_LOG_TYPE_DEFAULT, "#Warning Unhandled qualifier %ld for type %ld", (uint8_t *)&v9, 0x16u);
    return 0;
  }
  return result;
}

- (BOOL)_evaluateMailboxCriterion:(id)a3
{
  if ([(MFMessageCriterion *)self qualifier] != 3) {
    return 0;
  }
  uint64_t v5 = [(MFMessageCriterion *)self expression];
  uint64_t v6 = [a3 originalMailboxURL];
  return [(NSString *)v5 isEqualToString:v6];
}

- (BOOL)doesMessageSatisfyCriterion:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int64_t v5 = [(MFMessageCriterion *)self criterionType] - 1;
  BOOL result = 1;
  switch(v5)
  {
    case 0:
    case 8:
    case 37:
    case 38:
      BOOL result = [(MFMessageCriterion *)self _evaluateHeaderCriterion:a3];
      break;
    case 2:
    case 3:
      BOOL result = [(MFMessageCriterion *)self _evaluateAddressBookCriterion:a3];
      break;
    case 6:
      BOOL result = [(MFMessageCriterion *)self _evaluateAccountCriterion:a3];
      break;
    case 7:
      return result;
    case 9:
    case 10:
      BOOL result = [(MFMessageCriterion *)self _evaluateDateCriterion:a3];
      break;
    case 11:
    case 12:
      BOOL result = [(MFMessageCriterion *)self _evaluateAddressHistoryCriterion:a3];
      break;
    case 13:
    case 14:
      BOOL result = [(MFMessageCriterion *)self _evaluateFullNameCriterion:a3];
      break;
    case 15:
      BOOL result = [(MFMessageCriterion *)self _evaluateIsDigitallySignedCriterion:a3];
      break;
    case 16:
      BOOL result = [(MFMessageCriterion *)self _evaluateIsEncryptedCriterion:a3];
      break;
    case 17:
      BOOL result = [(MFMessageCriterion *)self _evaluateAttachmentCriterion:a3];
      break;
    case 18:
      BOOL result = [(MFMessageCriterion *)self _evaluatePriorityIsHighCriterion:a3];
      break;
    case 19:
      BOOL result = [(MFMessageCriterion *)self _evaluatePriorityIsNormalCriterion:a3];
      break;
    case 20:
      BOOL result = [(MFMessageCriterion *)self _evaluatePriorityIsLowCriterion:a3];
      break;
    case 21:
      BOOL result = [(MFMessageCriterion *)self _evaluateMailboxCriterion:a3];
      break;
    case 23:
      BOOL result = [(MFMessageCriterion *)self _evaluateCompoundCriterion:a3];
      break;
    case 25:
      BOOL result = [(MFMessageCriterion *)self _evaluateFlagCriterion:a3];
      break;
    case 32:
      BOOL result = [(MFMessageCriterion *)self _evaluateConversationIDCriterion:a3];
      break;
    case 33:
      BOOL result = [(MFMessageCriterion *)self _evaluateSenderHeaderCriterion:a3];
      break;
    default:
      int64_t v7 = MFLogGeneral();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (v8)
      {
        int v9 = 134217984;
        int64_t v10 = [(MFMessageCriterion *)self criterionType];
        _os_log_impl(&dword_1CFCFE000, v7, OS_LOG_TYPE_DEFAULT, "#Warning Unhandled criterion type %ld", (uint8_t *)&v9, 0xCu);
        BOOL result = 0;
      }
      break;
  }
  return result;
}

- (int)messageRuleQualifierForString:(id)a3
{
  if ([a3 isEqualToString:@"BeginsWith"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"EndsWith"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"IsEqualTo"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"IsNotEqualTo"]) {
    return 7;
  }
  if ([a3 isEqualToString:@"DoesNotContain"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"IsLessThan"]) {
    return 5;
  }
  if ([a3 isEqualToString:@"IsGreaterThan"]) {
    return 6;
  }
  if ([a3 isEqualToString:@"ASCIIContains"]) {
    return 8;
  }
  return 0;
}

- (id)stringForMessageRuleQualifier:(int)a3
{
  if (a3 > 8) {
    return 0;
  }
  else {
    return off_1E6866AB0[a3];
  }
}

- (NSArray)criteria
{
  v2 = self->_criteria;
  return v2;
}

- (void)setCriteria:(id)a3
{
  criteria = self->_criteria;
  if (criteria != a3)
  {

    self->_criteria = (NSArray *)[a3 copy];
  }
  [(MFMessageCriterion *)self setCriterionType:24];
}

- (BOOL)allCriteriaMustBeSatisfied
{
  return *((unsigned char *)self + 68) & 1;
}

- (void)setAllCriteriaMustBeSatisfied:(BOOL)a3
{
  *((unsigned char *)self + 68) = *((unsigned char *)self + 68) & 0xFE | a3;
}

- (int)dateUnits
{
  return self->_dateUnitType;
}

- (BOOL)dateIsRelative
{
  return (*((unsigned __int8 *)self + 68) >> 1) & 1;
}

- (id)dateFromExpression
{
  v2 = (void *)MEMORY[0x1E4F1C9C8];
  [(NSString *)[(MFMessageCriterion *)self expression] doubleValue];
  return (id)objc_msgSend(v2, "dateWithTimeIntervalSince1970:");
}

+ (id)expressionForDate:(id)a3
{
  uint64_t v3 = NSString;
  [a3 timeIntervalSince1970];
  return (id)objc_msgSend(v3, "stringWithFormat:", @"%f", v4);
}

- (id)simplifyOnce
{
  if ([(MFMessageCriterion *)self criterionType] == 24
    && (uint64_t v3 = [(MFMessageCriterion *)self criteria], (v4 = [(NSArray *)v3 count]) != 0))
  {
    uint64_t v5 = v4;
    if (v4 == 1)
    {
      uint64_t v6 = (MFMessageCriterion *)objc_msgSend(-[NSArray lastObject](v3, "lastObject"), "simplifiedCriterion");
    }
    else
    {
      uint64_t v6 = 0;
      BOOL v8 = 0;
      for (uint64_t i = 0; i != v5; ++i)
      {
        id v10 = [(NSArray *)v3 objectAtIndex:i];
        id v11 = (id)[v10 simplifiedCriterion];
        if ([v11 criterionType] == 24
          && ((int v12 = [(MFMessageCriterion *)self allCriteriaMustBeSatisfied],
               v12 == [v11 allCriteriaMustBeSatisfied])
           || !objc_msgSend((id)objc_msgSend(v11, "criteria"), "count")))
        {
          if (!v6)
          {
            uint64_t v6 = objc_alloc_init(MFMessageCriterion);
            [(MFMessageCriterion *)v6 setCriterionType:24];
            [(MFMessageCriterion *)v6 setAllCriteriaMustBeSatisfied:[(MFMessageCriterion *)self allCriteriaMustBeSatisfied]];
            BOOL v8 = (void *)[MEMORY[0x1E4F1CA48] array];
            objc_msgSend(v8, "addObjectsFromArray:", -[NSArray subarrayWithRange:](v3, "subarrayWithRange:", 0, i));
          }
          objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(v11, "criteria"));
        }
        else
        {
          if (v11 != v10 && !v6)
          {
            uint64_t v6 = objc_alloc_init(MFMessageCriterion);
            [(MFMessageCriterion *)v6 setCriterionType:24];
            [(MFMessageCriterion *)v6 setAllCriteriaMustBeSatisfied:[(MFMessageCriterion *)self allCriteriaMustBeSatisfied]];
            BOOL v8 = (void *)[MEMORY[0x1E4F1CA48] array];
            objc_msgSend(v8, "addObjectsFromArray:", -[NSArray subarrayWithRange:](v3, "subarrayWithRange:", 0, i));
          }
          [v8 addObject:v11];
        }
      }
      if (v6) {
        [(MFMessageCriterion *)v6 setCriteria:v8];
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  if (v6) {
    return v6;
  }
  else {
    return self;
  }
}

- (id)simplifiedCriterion
{
  unsigned int v2 = 0;
  do
  {
    uint64_t v3 = self;
    self = [(MFMessageCriterion *)self simplifyOnce];
    if (self == v3) {
      break;
    }
  }
  while (v2++ < 0xA);
  uint64_t v5 = self;
  return v5;
}

+ (id)criterionForMailbox:(id)a3
{
  uint64_t v4 = [a3 URLString];
  return (id)[a1 criterionForMailboxURL:v4];
}

+ (id)criterionForAccount:(id)a3
{
  uint64_t v3 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 22, 1, [a3 URLString]);
  return v3;
}

+ (id)criterionExcludingMailboxes:(id)a3
{
  id result = (id)[a3 count];
  if (result)
  {
    id v5 = +[MFMessageCriterion orCompoundCriterionWithCriteria:](MFMessageCriterion, "orCompoundCriterionWithCriteria:", objc_msgSend(a3, "ef_map:", &__block_literal_global_265));
    return +[MFMessageCriterion notCriterionWithCriterion:v5];
  }
  return result;
}

id __50__MFMessageCriterion_criterionExcludingMailboxes___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[MFMessageCriterion criterionForMailbox:a2];
}

+ (id)messageIsDeletedCriterion:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [MFMessageCriterion alloc];
  if (v3) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 7;
  }
  uint64_t v6 = [(MFMessageCriterion *)v4 initWithType:26 qualifier:v5 expression:@"MessageIsDeleted"];
  return v6;
}

+ (id)messageIsJournaledCriterion:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [MFMessageCriterion alloc];
  if (v3) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 7;
  }
  uint64_t v6 = [(MFMessageCriterion *)v4 initWithType:26 qualifier:v5 expression:@"MessageIsJournaled"];
  return v6;
}

+ (id)criterionForNotDeletedConversationID:(int64_t)a3
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v5[0] = +[MFMessageCriterion messageIsDeletedCriterion:0];
  v5[1] = +[MFMessageCriterion criterionForConversationID:a3];
  return +[MFMessageCriterion andCompoundCriterionWithCriteria:](MFMessageCriterion, "andCompoundCriterionWithCriteria:", [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2]);
}

+ (id)criterionForConversationID:(int64_t)a3
{
  BOOL v3 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 33, 3, objc_msgSend(NSString, "stringWithFormat:", @"%lld", a3));
  return v3;
}

+ (id)criterionForLibraryID:(id)a3
{
  BOOL v3 = [[MFMessageCriterion alloc] initWithType:23 qualifier:3 expression:a3];
  return v3;
}

+ (id)messageIsServerSearchResultCriterion:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [MFMessageCriterion alloc];
  if (v3) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 7;
  }
  uint64_t v6 = [(MFMessageCriterion *)v4 initWithType:26 qualifier:v5 expression:@"MessageIsServerSearchResult"];
  return v6;
}

- (BOOL)isVIPCriterion
{
  if ([(MFMessageCriterion *)self criterionType] != 26) {
    return 0;
  }
  BOOL v3 = [(MFMessageCriterion *)self expression];
  return [(NSString *)v3 isEqualToString:@"MessageSenderIsVIP"];
}

+ (id)unreadMessageCriterion
{
  unsigned int v2 = [[MFMessageCriterion alloc] initWithType:26 qualifier:7 expression:@"MessageIsRead"];
  [(MFMessageCriterion *)v2 setName:@"UnreadCriterion"];
  return v2;
}

+ (id)readMessageCriterion
{
  unsigned int v2 = [[MFMessageCriterion alloc] initWithType:26 qualifier:3 expression:@"MessageIsRead"];
  [(MFMessageCriterion *)v2 setName:@"ReadCriterion"];
  return v2;
}

+ (id)toMeCriterion
{
  unsigned int v2 = [[MFMessageCriterion alloc] initWithType:26 qualifier:3 expression:@"MessageToContainsAccountAddress"];
  [(MFMessageCriterion *)v2 setName:@"ToMeCriterionName"];
  return v2;
}

+ (id)ccMeCriterion
{
  unsigned int v2 = [[MFMessageCriterion alloc] initWithType:26 qualifier:3 expression:@"MessageCcContainsAccountAddress"];
  [(MFMessageCriterion *)v2 setName:@"CcMeCriterionName"];
  return v2;
}

+ (id)criterionForDateReceivedOlderThanDate:(id)a3
{
  BOOL v3 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 11, 5, [a1 expressionForDate:a3]);
  return v3;
}

+ (id)notCriterionWithCriterion:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  uint64_t v4 = objc_alloc_init(MFMessageCriterion);
  v6[0] = a3;
  -[MFMessageCriterion setCriteria:](v4, "setCriteria:", [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1]);
  [(MFMessageCriterion *)v4 setCriterionType:25];
  return v4;
}

+ (id)andCompoundCriterionWithCriteria:(id)a3
{
  id result = (id)[a3 count];
  if (result)
  {
    if ([a3 count] == 1)
    {
      uint64_t v5 = (MFMessageCriterion *)(id)[a3 lastObject];
    }
    else
    {
      uint64_t v5 = objc_alloc_init(MFMessageCriterion);
      [(MFMessageCriterion *)v5 setCriterionType:24];
      [(MFMessageCriterion *)v5 setAllCriteriaMustBeSatisfied:1];
      [(MFMessageCriterion *)v5 setCriteria:a3];
    }
    return v5;
  }
  return result;
}

+ (id)orCompoundCriterionWithCriteria:(id)a3
{
  id result = (id)[a3 count];
  if (result)
  {
    if ([a3 count] == 1)
    {
      uint64_t v5 = (MFMessageCriterion *)(id)[a3 lastObject];
    }
    else
    {
      uint64_t v5 = objc_alloc_init(MFMessageCriterion);
      [(MFMessageCriterion *)v5 setCriterionType:24];
      [(MFMessageCriterion *)v5 setAllCriteriaMustBeSatisfied:0];
      [(MFMessageCriterion *)v5 setCriteria:a3];
    }
    return v5;
  }
  return result;
}

- (int)qualifier
{
  return self->_qualifier;
}

- (NSIndexSet)libraryIdentifiers
{
  return self->_libraryIdentifiers;
}

- (void)setLibraryIdentifiers:(id)a3
{
}

- (BOOL)preferFullTextSearch
{
  return self->_preferFullTextSearch;
}

- (void)setPreferFullTextSearch:(BOOL)a3
{
  self->_preferFullTextSearch = a3;
}

- (BOOL)useFlaggedForUnreadCount
{
  return self->_useFlaggedForUnreadCount;
}

- (BOOL)includeRelatedMessages
{
  return (*((unsigned __int8 *)self + 68) >> 2) & 1;
}

- (void)setIncludeRelatedMessages:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 68) = *((unsigned char *)self + 68) & 0xFB | v3;
}

- (BOOL)expressionIsSanitized
{
  return self->_expressionIsSanitized;
}

- (void)setExpressionIsSanitized:(BOOL)a3
{
  self->_expressionIsSanitized = a3;
}

- (BOOL)includeRemoteBodyContent
{
  return self->_includeRemoteBodyContent;
}

- (void)setIncludeRemoteBodyContent:(BOOL)a3
{
  self->_includeRemoteBodyContent = a3;
}

- (NSString)name
{
  return self->_name;
}

@end