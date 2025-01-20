@interface MFMessageCriterion
+ (id)_criterionForDateReceivedBetween:(id)a3 endDate:(id)a4;
+ (id)_criterionForDateReceivedBetweenDateComponents:(id)a3 endDateComponents:(id)a4;
+ (id)_todayDateComponents;
+ (id)andCompoundCriterionWithCriteria:(id)a3;
+ (id)ccMeCriterion;
+ (id)criteriaFromDefaultsArray:(id)a3;
+ (id)criteriaFromDefaultsArray:(id)a3 removingRecognizedKeys:(BOOL)a4;
+ (id)criterionExcludingMailboxes:(id)a3;
+ (id)criterionForAccount:(id)a3;
+ (id)criterionForCategorizationHasUserOverride;
+ (id)criterionForCategoryType:(unint64_t)a3;
+ (id)criterionForConversationID:(int64_t)a3;
+ (id)criterionForDateReceivedNewerThanDate:(id)a3;
+ (id)criterionForDateReceivedOlderThanDate:(id)a3;
+ (id)criterionForDocumentID:(id)a3;
+ (id)criterionForFlagColor:(unint64_t)a3;
+ (id)criterionForLibraryID:(id)a3;
+ (id)criterionForMailbox:(id)a3;
+ (id)criterionForMailboxURL:(id)a3;
+ (id)criterionForNotDeletedConversationID:(int64_t)a3;
+ (id)defaultsArrayFromCriteria:(id)a3;
+ (id)defaultsDictionaryFromCriterion:(id)a3;
+ (id)expressionForDate:(id)a3;
+ (id)flaggedMessageCriterion;
+ (id)followUpMessageCriterion;
+ (id)hasAttachmentsCriterion;
+ (id)includesMeCriterion;
+ (id)lastWeekMessageCriterion;
+ (id)matchEverythingCriterion;
+ (id)matchNothingCriterion;
+ (id)messageCriterionForUnsubscribeTypeNotMatching:(int64_t)a3;
+ (id)messageIsDeletedCriterion:(BOOL)a3;
+ (id)messageIsJournaledCriterion:(BOOL)a3;
+ (id)messageIsServerSearchResultCriterion:(BOOL)a3;
+ (id)notCriterionWithCriterion:(id)a3;
+ (id)orCompoundCriterionWithCriteria:(id)a3;
+ (id)readLaterMessageCriterion;
+ (id)readMessageCriterion;
+ (id)sendLaterMessageCriterion;
+ (id)senderIsVIPCriterion:(BOOL)a3;
+ (id)stringForCriterionType:(int64_t)a3;
+ (id)threadMuteMessageCriterion;
+ (id)threadNotifyMessageCriterion;
+ (id)toMeCriterion;
+ (id)todayMessageCriterion;
+ (id)unreadMessageCriterion;
+ (id)yesterdayMessageCriterion;
+ (int64_t)criterionTypeForString:(id)a3;
- (BOOL)_containsNotCriterion;
- (BOOL)_evaluateAccountCriterion:(id)a3;
- (BOOL)_evaluateAddressBookCriterion:(id)a3;
- (BOOL)_evaluateAddressHistoryCriterion:(id)a3;
- (BOOL)_evaluateAttachmentCriterion:(id)a3;
- (BOOL)_evaluateCompoundCriterion:(id)a3;
- (BOOL)_evaluateConversationIDCriterion:(id)a3;
- (BOOL)_evaluateDateCriterion:(id)a3;
- (BOOL)_evaluateFlagColorCriterion:(id)a3;
- (BOOL)_evaluateFlagCriterion:(id)a3;
- (BOOL)_evaluateFullNameCriterion:(id)a3;
- (BOOL)_evaluateHeaderCriterion:(id)a3;
- (BOOL)_evaluateIsDigitallySignedCriterion:(id)a3;
- (BOOL)_evaluateIsEncryptedCriterion:(id)a3;
- (BOOL)_evaluateMailboxCriterion:(id)a3;
- (BOOL)_evaluateNotCriterion:(id)a3;
- (BOOL)_evaluatePartOfStructure:(id)a3;
- (BOOL)_evaluatePriorityIsHighCriterion:(id)a3;
- (BOOL)_evaluatePriorityIsLowCriterion:(id)a3;
- (BOOL)_evaluatePriorityIsNormalCriterion:(id)a3;
- (BOOL)_evaluateReadLaterCriterion:(id)a3;
- (BOOL)_evaluateSenderBucketCriterion:(id)a3;
- (BOOL)_evaluateSenderHeaderCriterion:(id)a3;
- (BOOL)allCriteriaMustBeSatisfied;
- (BOOL)canUseSearchableIndex;
- (BOOL)dateIsRelative;
- (BOOL)doesMessageSatisfyCriterion:(id)a3;
- (BOOL)expressionIsSanitized;
- (BOOL)hasLibraryIDCriterion;
- (BOOL)includeRelatedMessages;
- (BOOL)includesCriterionSatisfyingPredicate:(void *)a3 restrictive:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)preferFullTextSearch;
- (BOOL)requiresBody;
- (BOOL)useFlaggedForUnreadCount;
- (CSSuggestion)suggestion;
- (EFInt64Set)libraryIdentifiers;
- (EMSearchableIndexQueryExpression)spotlightQueryExpression;
- (MFMessageCriterion)criterionForSQL;
- (MFMessageCriterion)init;
- (MFMessageCriterion)initWithCriterion:(id)a3 expression:(id)a4;
- (MFMessageCriterion)initWithDictionary:(id)a3;
- (MFMessageCriterion)initWithDictionary:(id)a3 andRemoveRecognizedKeysIfMutable:(BOOL)a4;
- (MFMessageCriterion)initWithType:(int64_t)a3 qualifier:(int64_t)a4 expression:(id)a5;
- (NSArray)criteria;
- (NSArray)expressionLanguages;
- (NSString)criterionIdentifier;
- (NSString)description;
- (NSString)ef_publicDescription;
- (NSString)expression;
- (NSString)name;
- (id)SQLExpressionWithContext:(id)a3 depth:(unsigned int)a4;
- (id)SQLExpressionWithTables:(unsigned int *)a3 baseTable:(unsigned int)a4 protectedDataAvailable:(BOOL)a5 searchableIndexManager:(id)a6 mailboxIDs:(id)a7 propertyMapper:(id)a8;
- (id)_SQLExpressionForMailboxCriterion;
- (id)_attributesForHeaderCriterion;
- (id)_collapsedMessageNumberCriterion:(id)a3 allMustBeSatisfied:(BOOL)a4 collapsedIndexes:(id *)a5;
- (id)_comparisonOperationMatchingValue:(id)a3 qualifier:(int64_t)a4;
- (id)_criterionForSQL;
- (id)_evaluateFTSCriterionWithIndexManager:(id)a3 mailboxIDs:(id)a4;
- (id)_headersRequiredForEvaluation;
- (id)_qualifierString;
- (id)_queryWithAttributes:(id)a3 matchingValue:(id)a4;
- (id)_queryWithAttributes:(id)a3 matchingValue:(id)a4 qualifier:(int64_t)a5;
- (id)_resolveWithIndexManager:(id)a3 mailboxIDs:(id)a4;
- (id)_spotlightQuerySearchString:(id *)a3 hasSuggestion:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)criteriaForSpotlightCriteria:(id)a3;
- (id)criteriaSatisfyingPredicate:(void *)a3;
- (id)criterionByApplyingTransform:(id)a3;
- (id)daSearchPredicate;
- (id)dateFromExpression;
- (id)descriptionWithDepth:(unsigned int)a3 redacted:(BOOL)a4;
- (id)dictionaryRepresentation;
- (id)extractedDateCriterion;
- (id)extractedUnreadCriterion;
- (id)fixOnce;
- (id)simplifiedCriterion;
- (id)simplifyOnce;
- (id)stringForMessageRuleQualifier:(int64_t)a3;
- (id)unreadCountCriterion;
- (int64_t)criterionType;
- (int64_t)dateUnits;
- (int64_t)messageRuleQualifierForString:(id)a3;
- (int64_t)qualifier;
- (unint64_t)hash;
- (unsigned)bestBaseTable;
- (void)_addCriteriaSatisfyingPredicate:(void *)a3 toCollector:(id)a4;
- (void)setAllCriteriaMustBeSatisfied:(BOOL)a3;
- (void)setCriteria:(id)a3;
- (void)setCriterionIdentifier:(id)a3;
- (void)setCriterionType:(int64_t)a3;
- (void)setDateIsRelative:(BOOL)a3;
- (void)setDateUnits:(int64_t)a3;
- (void)setExpression:(id)a3;
- (void)setExpressionIsSanitized:(BOOL)a3;
- (void)setExpressionLanguages:(id)a3;
- (void)setIncludeRelatedMessages:(BOOL)a3;
- (void)setLibraryIdentifiers:(id)a3;
- (void)setName:(id)a3;
- (void)setPreferFullTextSearch:(BOOL)a3;
- (void)setQualifier:(int64_t)a3;
- (void)setSuggestion:(id)a3;
- (void)setUseFlaggedForUnreadCount:(BOOL)a3;
- (void)tokenizeUsingTokenizationHandler:(id)a3;
@end

@implementation MFMessageCriterion

- (BOOL)includesCriterionSatisfyingPredicate:(void *)a3 restrictive:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = self;
  int64_t v6 = [(MFMessageCriterion *)self criterionType];
  if (v6 == 26)
  {
    v11 = [(MFMessageCriterion *)v5 criteria];
    uint64_t v12 = [v11 count];

    if (v12 != 1)
    {
      LOBYTE(v5) = 0;
      return (char)v5;
    }
    v7 = [(MFMessageCriterion *)v5 criteria];
    v13 = [v7 firstObject];
    LOBYTE(v5) = [v13 includesCriterionSatisfyingPredicate:a3 restrictive:v4];

LABEL_15:
    return (char)v5;
  }
  if (v6 == 25)
  {
    v7 = [(MFMessageCriterion *)v5 criteria];
    uint64_t v8 = [v7 count];
    uint64_t v9 = v8;
    if (v4)
    {
      int v10 = ![(MFMessageCriterion *)v5 allCriteriaMustBeSatisfied];
      if (!v9)
      {
LABEL_5:
        LOBYTE(v5) = v10;
        goto LABEL_15;
      }
    }
    else
    {
      int v10 = 0;
      if (!v8) {
        goto LABEL_5;
      }
    }
    uint64_t v15 = v9 - 1;
    do
    {
      v16 = [v7 objectAtIndexedSubscript:v15];
      LODWORD(v5) = [v16 includesCriterionSatisfyingPredicate:a3 restrictive:v4];

      if (!v15) {
        break;
      }
      --v15;
    }
    while (((v10 ^ v5) & 1) == 0);
    goto LABEL_15;
  }
  return ((uint64_t (*)(MFMessageCriterion *))a3)(v5);
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
  expression = self->_expression;
  if (!expression)
  {
    BOOL v4 = [(EFInt64Set *)self->_libraryIdentifiers commaSeparatedString];
    v5 = self->_expression;
    self->_expression = v4;

    expression = self->_expression;
  }
  return expression;
}

+ (int64_t)criterionTypeForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Header"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"Body"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"SenderIsInAddressBook"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"SenderIsNotInAddressBook"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"SenderHeader"])
  {
    int64_t v4 = 35;
  }
  else if ([v3 isEqualToString:@"Account"])
  {
    int64_t v4 = 7;
  }
  else if ([v3 isEqualToString:@"AnyMessage"])
  {
    int64_t v4 = 8;
  }
  else if ([v3 isEqualToString:@"AnyRecipient"])
  {
    int64_t v4 = 9;
  }
  else if ([v3 isEqualToString:@"DateReceived"])
  {
    int64_t v4 = 11;
  }
  else if ([v3 isEqualToString:@"DisplayDate"])
  {
    int64_t v4 = 12;
  }
  else
  {
    if ([v3 isEqualToString:@"DateLastViewed"]) {
      goto LABEL_22;
    }
    if ([v3 isEqualToString:@"DateSent"])
    {
      int64_t v4 = 10;
      goto LABEL_97;
    }
    if ([v3 isEqualToString:@"SenderIsInAddressHistory"])
    {
      int64_t v4 = 13;
      goto LABEL_97;
    }
    if ([v3 isEqualToString:@"SenderIsNotInAddressHistory"])
    {
      int64_t v4 = 14;
      goto LABEL_97;
    }
    if ([v3 isEqualToString:@"AnyRecipientIncludesFullName"])
    {
      int64_t v4 = 15;
      goto LABEL_97;
    }
    if ([v3 isEqualToString:@"NoRecipientIncludesFullName"])
    {
      int64_t v4 = 16;
      goto LABEL_97;
    }
    if ([v3 isEqualToString:@"IsDigitallySigned"])
    {
      int64_t v4 = 17;
      goto LABEL_97;
    }
    if ([v3 isEqualToString:@"IsEncrypted"])
    {
      int64_t v4 = 18;
      goto LABEL_97;
    }
    if ([v3 isEqualToString:@"PriorityIsNormal"])
    {
      int64_t v4 = 21;
      goto LABEL_97;
    }
    if ([v3 isEqualToString:@"PriorityIsHigh"])
    {
      int64_t v4 = 20;
      goto LABEL_97;
    }
    if ([v3 isEqualToString:@"PriorityIsLow"])
    {
      int64_t v4 = 22;
      goto LABEL_97;
    }
    if ([v3 isEqualToString:@"AnyAttachment"])
    {
      int64_t v4 = 19;
      goto LABEL_97;
    }
    if ([v3 isEqualToString:@"Mailbox"])
    {
      int64_t v4 = 23;
      goto LABEL_97;
    }
    if ([v3 isEqualToString:@"MessageNumber"])
    {
      int64_t v4 = 24;
      goto LABEL_97;
    }
    if ([v3 isEqualToString:@"ExternalID"])
    {
      int64_t v4 = 36;
      goto LABEL_97;
    }
    if ([v3 isEqualToString:@"Compound"])
    {
      int64_t v4 = 25;
      goto LABEL_97;
    }
    if ([v3 isEqualToString:@"Flag"])
    {
      int64_t v4 = 27;
      goto LABEL_97;
    }
    if ([v3 isEqualToString:@"FlagColor"])
    {
      int64_t v4 = 28;
      goto LABEL_97;
    }
    if ([v3 isEqualToString:@"NotInTrashMailbox"])
    {
      int64_t v4 = 29;
      goto LABEL_97;
    }
    if ([v3 isEqualToString:@"ContainsAttachments"])
    {
      int64_t v4 = 30;
      goto LABEL_97;
    }
    if ([v3 isEqualToString:@"SpotlightSearch"])
    {
      int64_t v4 = 33;
      goto LABEL_97;
    }
    if ([v3 isEqualToString:@"ConversationID"])
    {
      int64_t v4 = 34;
      goto LABEL_97;
    }
    if ([v3 isEqualToString:@"Negation"])
    {
      int64_t v4 = 26;
      goto LABEL_97;
    }
    if ([v3 isEqualToString:@"MessageIdHash"])
    {
      int64_t v4 = 38;
      goto LABEL_97;
    }
    if ([v3 isEqualToString:@"GlobalMessageID"])
    {
      int64_t v4 = 37;
      goto LABEL_97;
    }
    if ([v3 isEqualToString:@"ListIDHash"])
    {
      int64_t v4 = 39;
      goto LABEL_97;
    }
    if ([v3 isEqualToString:@"DocumentID"])
    {
      int64_t v4 = 42;
      goto LABEL_97;
    }
    if ([v3 isEqualToString:@"ToRecipient"])
    {
      int64_t v4 = 40;
      goto LABEL_97;
    }
    if ([v3 isEqualToString:@"CcRecipient"])
    {
      int64_t v4 = 41;
      goto LABEL_97;
    }
    if ([v3 isEqualToString:@"DateLastViewed"])
    {
LABEL_22:
      int64_t v4 = 43;
    }
    else if ([v3 isEqualToString:@"CategoryType"])
    {
      int64_t v4 = 44;
    }
    else if ([v3 isEqualToString:@"CategoryUserOverrideType"])
    {
      int64_t v4 = 45;
    }
    else if ([v3 isEqualToString:@"ReadLater"])
    {
      int64_t v4 = 46;
    }
    else if ([v3 isEqualToString:@"FollowUpStartDate"])
    {
      int64_t v4 = 47;
    }
    else if ([v3 isEqualToString:@"FollowUpEndDate"])
    {
      int64_t v4 = 48;
    }
    else if ([v3 isEqualToString:@"SendLater"])
    {
      int64_t v4 = 49;
    }
    else if ([v3 isEqualToString:@"Unsubscribe"])
    {
      int64_t v4 = 50;
    }
    else if ([v3 isEqualToString:@"SenderBucket"])
    {
      int64_t v4 = 51;
    }
    else
    {
      int64_t v4 = 1;
    }
  }
LABEL_97:

  return v4;
}

+ (id)criterionForMailboxURL:(id)a3
{
  id v3 = a3;
  int64_t v4 = [[MFMessageCriterion alloc] initWithType:23 qualifier:3 expression:v3];

  return v4;
}

- (NSArray)criteria
{
  return self->_criteria;
}

+ (id)andCompoundCriterionWithCriteria:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    if ([v3 count] == 1)
    {
      int64_t v4 = [v3 lastObject];
    }
    else
    {
      int64_t v4 = objc_alloc_init(MFMessageCriterion);
      [(MFMessageCriterion *)v4 setCriterionType:25];
      [(MFMessageCriterion *)v4 setAllCriteriaMustBeSatisfied:1];
      [(MFMessageCriterion *)v4 setCriteria:v3];
    }
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)setCriteria:(id)a3
{
  id v6 = a3;
  int64_t v4 = (NSArray *)[v6 copy];
  criteria = self->_criteria;
  self->_criteria = v4;

  [(MFMessageCriterion *)self setCriterionType:25];
}

- (void)setAllCriteriaMustBeSatisfied:(BOOL)a3
{
  *((unsigned char *)self + 72) = *((unsigned char *)self + 72) & 0xFE | a3;
}

- (MFMessageCriterion)initWithType:(int64_t)a3 qualifier:(int64_t)a4 expression:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [(MFMessageCriterion *)self init];
  int v10 = v9;
  if (v9)
  {
    [(MFMessageCriterion *)v9 setCriterionType:a3];
    [(MFMessageCriterion *)v10 setQualifier:a4];
    [(MFMessageCriterion *)v10 setExpression:v8];
  }

  return v10;
}

- (void)setCriterionType:(int64_t)a3
{
  int64_t v4 = [(id)objc_opt_class() stringForCriterionType:a3];
  [(MFMessageCriterion *)self setCriterionIdentifier:v4];

  self->_type = -1;
}

- (void)setCriterionIdentifier:(id)a3
{
  v7 = (__CFString *)a3;
  if ([(__CFString *)v7 caseInsensitiveCompare:@"To or Cc"])
  {
    int64_t v4 = v7;
  }
  else
  {

    int64_t v4 = @"AnyRecipient";
  }
  id v8 = v4;
  v5 = (NSString *)[(__CFString *)v4 copy];
  criterionIdentifier = self->_criterionIdentifier;
  self->_criterionIdentifier = v5;

  self->_type = -1;
}

+ (id)stringForCriterionType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x32) {
    return 0;
  }
  else {
    return off_1E5D3D630[a3 - 1];
  }
}

- (MFMessageCriterion)init
{
  v7.receiver = self;
  v7.super_class = (Class)MFMessageCriterion;
  v2 = [(MFMessageCriterion *)&v7 init];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v4 = [v3 UUIDString];
    uniqueId = v2->_uniqueId;
    v2->_uniqueId = (NSString *)v4;

    v2->_type = -1;
  }
  return v2;
}

- (void)setQualifier:(int64_t)a3
{
  self->_qualifier = a3;
}

- (void)setExpression:(id)a3
{
  id v6 = a3;
  uint64_t v4 = (NSString *)[v6 copy];
  expression = self->_expression;
  self->_expression = v4;
}

- (void)setIncludeRelatedMessages:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 72) = *((unsigned char *)self + 72) & 0xFB | v3;
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
  id v6 = [(MFMessageCriterion *)v4 initWithType:27 qualifier:v5 expression:@"MessageIsDeleted"];
  return v6;
}

+ (id)followUpMessageCriterion
{
  v13[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v4 = [MFMessageCriterion alloc];
  uint64_t v5 = [a1 expressionForDate:v3];
  id v6 = [(MFMessageCriterion *)v4 initWithType:47 qualifier:5 expression:v5];

  objc_super v7 = [MFMessageCriterion alloc];
  id v8 = [a1 expressionForDate:v3];
  uint64_t v9 = [(MFMessageCriterion *)v7 initWithType:48 qualifier:6 expression:v8];

  v13[0] = v6;
  v13[1] = v9;
  int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  v11 = +[MFMessageCriterion andCompoundCriterionWithCriteria:v10];

  return v11;
}

+ (id)expressionForDate:(id)a3
{
  BOOL v3 = MFCriterionExpressionForDate(a3);
  return v3;
}

- (id)SQLExpressionWithTables:(unsigned int *)a3 baseTable:(unsigned int)a4 protectedDataAvailable:(BOOL)a5 searchableIndexManager:(id)a6 mailboxIDs:(id)a7 propertyMapper:(id)a8
{
  id v15 = a6;
  id v16 = a7;
  id v21 = a8;
  v22 = v15;
  v17 = [(MFMessageCriterion *)self _resolveWithIndexManager:v15 mailboxIDs:v16];
  LOBYTE(self) = [v17 hasLibraryIDCriterion];
  v18 = objc_alloc_init(_MFSQLGenerationContext);
  objc_storeStrong((id *)&v18->searchableIndexManager, a6);
  objc_storeStrong((id *)&v18->mailboxIDs, a7);
  v18->tables = *a3;
  v18->baseTable = a4;
  objc_storeStrong((id *)&v18->propertyMapper, a8);
  v18->usedBaseTable = 0;
  v18->haveLibraryIDCriterion = (char)self;
  v18->protectedDataAvailable = a5;
  v19 = [v17 SQLExpressionWithContext:v18 depth:0];
  *a3 = v18->tables;

  return v19;
}

- (BOOL)hasLibraryIDCriterion
{
  return [(MFMessageCriterion *)self includesCriterionSatisfyingPredicate:isLibraryIDCriterion restrictive:0];
}

- (id)_resolveWithIndexManager:(id)a3 mailboxIDs:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  id v35 = a4;
  if ([(MFMessageCriterion *)self canUseSearchableIndex])
  {
    id v6 = [(MFMessageCriterion *)self _evaluateFTSCriterionWithIndexManager:v34 mailboxIDs:v35];
    goto LABEL_49;
  }
  if ([(MFMessageCriterion *)self criterionType] != 25)
  {
    uint64_t v9 = 0;
    goto LABEL_45;
  }
  objc_super v7 = [(MFMessageCriterion *)self suggestion];
  if (v7) {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  else {
    id v8 = 0;
  }

  v31 = [(MFMessageCriterion *)self criteria];
  BOOL v32 = [(MFMessageCriterion *)self allCriteriaMustBeSatisfied];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v31;
  uint64_t v10 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  v33 = self;
  if (!v10)
  {

    goto LABEL_34;
  }
  v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = *(void *)v39;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v39 != v13) {
        objc_enumerationMutation(obj);
      }
      id v15 = *(id *)(*((void *)&v38 + 1) + 8 * i);
      int v16 = [v15 canUseSearchableIndex];
      char v17 = v16;
      if (!v16)
      {
        if ([v15 criterionType] == 25)
        {
          id v18 = [v15 _resolveWithIndexManager:v34 mailboxIDs:v35];
          v19 = v18;
          if (v18 != v15)
          {

            id v15 = v19;
            if (v8) {
              goto LABEL_27;
            }
            goto LABEL_26;
          }

          if (!v8) {
            goto LABEL_29;
          }
        }
        else if (!v8)
        {
          goto LABEL_29;
        }
LABEL_25:
        if (v8) {
          goto LABEL_27;
        }
        goto LABEL_26;
      }
      if (v11)
      {
        [v11 addObject:v15];
        goto LABEL_25;
      }
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v15, 0);
      if (v8) {
        goto LABEL_27;
      }
LABEL_26:
      v20 = (void *)MEMORY[0x1E4F1CA48];
      id v21 = objc_msgSend(obj, "subarrayWithRange:", 0, v12 + i);
      id v8 = [v20 arrayWithArray:v21];

LABEL_27:
      if ((v17 & 1) == 0) {
        [v8 addObject:v15];
      }
LABEL_29:
    }
    uint64_t v10 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    v12 += i;
  }
  while (v10);

  if (v11) {
    goto LABEL_35;
  }
LABEL_34:
  v22 = [(MFMessageCriterion *)v33 suggestion];
  BOOL v23 = v22 == 0;

  v11 = 0;
  if (!v23)
  {
LABEL_35:
    v24 = objc_alloc_init(MFMessageCriterion);
    [(MFMessageCriterion *)v24 setCriterionType:25];
    [(MFMessageCriterion *)v24 setAllCriteriaMustBeSatisfied:v32];
    [(MFMessageCriterion *)v24 setCriteria:v11];
    v25 = [(MFMessageCriterion *)v33 suggestion];
    [(MFMessageCriterion *)v24 setSuggestion:v25];

    v26 = [(MFMessageCriterion *)v24 _evaluateFTSCriterionWithIndexManager:v34 mailboxIDs:v35];
    [v8 addObject:v26];
  }
  if (v8)
  {
    id v37 = 0;
    v27 = [(MFMessageCriterion *)v33 _collapsedMessageNumberCriterion:v8 allMustBeSatisfied:v32 collapsedIndexes:&v37];
    id v28 = v37;
    if (v27)
    {
      [v8 removeObjectsAtIndexes:v28];
      [v8 insertObject:v27 atIndex:0];
    }
    if ([v8 count] == 1)
    {
      uint64_t v9 = [v8 objectAtIndex:0];
    }
    else
    {
      uint64_t v9 = objc_alloc_init(MFMessageCriterion);
      [(MFMessageCriterion *)v9 setCriterionType:25];
      [(MFMessageCriterion *)v9 setAllCriteriaMustBeSatisfied:v32];
      [(MFMessageCriterion *)v9 setCriteria:v8];
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  self = v33;
LABEL_45:
  if (v9) {
    v29 = v9;
  }
  else {
    v29 = self;
  }
  id v6 = v29;

LABEL_49:
  return v6;
}

- (BOOL)canUseSearchableIndex
{
  return ![(MFMessageCriterion *)self includesCriterionSatisfyingPredicate:_criterionCannotUseSearchableIndex restrictive:0];
}

- (MFMessageCriterion)criterionForSQL
{
  BOOL v3 = [(MFMessageCriterion *)self _criterionForSQL];
  uint64_t v4 = [(MFMessageCriterion *)self suggestion];
  [v3 setSuggestion:v4];

  return (MFMessageCriterion *)v3;
}

- (id)_criterionForSQL
{
  v2 = self;
  BOOL v3 = 0;
  if (v2)
  {
    unsigned int v4 = 0;
    while (1)
    {
      uint64_t v5 = [(MFMessageCriterion *)v2 simplifiedCriterion];

      id v6 = [v5 fixOnce];

      if (v6 == v2)
      {
        BOOL v3 = v6;
        goto LABEL_10;
      }
      BOOL v3 = v6;

      if (!v3) {
        break;
      }
      v2 = v3;
      if (v4++ >= 9) {
        goto LABEL_10;
      }
    }
    v2 = 0;
  }
LABEL_10:

  return v3;
}

- (id)simplifiedCriterion
{
  v2 = self;
  unsigned int v3 = 0;
  for (uint64_t i = 0; ; v2 = i)
  {
    uint64_t v5 = [(MFMessageCriterion *)v2 simplifyOnce];

    if (v5 == v2 || v3 > 9) {
      break;
    }
    uint64_t i = v5;

    ++v3;
  }

  return v5;
}

- (id)simplifyOnce
{
  if ([(MFMessageCriterion *)self criterionType] == 25)
  {
    BOOL v23 = [(MFMessageCriterion *)self criteria];
    uint64_t v3 = [v23 count];
    uint64_t v4 = v3;
    if (v3)
    {
      if (v3 == 1)
      {
        uint64_t v5 = [v23 lastObject];
        uint64_t v6 = [v5 simplifiedCriterion];

        objc_super v7 = (MFMessageCriterion *)v6;
        if (v6) {
          goto LABEL_24;
        }
        goto LABEL_23;
      }
      objc_super v7 = 0;
      uint64_t v9 = 0;
      id v8 = 0;
      do
      {
        uint64_t v10 = [v23 objectAtIndex:v9];
        v11 = [v10 simplifiedCriterion];
        if ([v11 criterionType] == 25
          && ((int v12 = [(MFMessageCriterion *)self allCriteriaMustBeSatisfied],
               v12 == [v11 allCriteriaMustBeSatisfied])
           || ([v11 criteria],
               uint64_t v13 = objc_claimAutoreleasedReturnValue(),
               uint64_t v14 = [v13 count],
               v13,
               !v14)))
        {
          if (!v7)
          {
            id v18 = objc_alloc_init(MFMessageCriterion);
            [(MFMessageCriterion *)v18 setCriterionType:25];
            [(MFMessageCriterion *)v18 setAllCriteriaMustBeSatisfied:[(MFMessageCriterion *)self allCriteriaMustBeSatisfied]];
            v19 = [MEMORY[0x1E4F1CA48] array];

            v20 = objc_msgSend(v23, "subarrayWithRange:", 0, v9);
            [v19 addObjectsFromArray:v20];

            id v8 = v19;
            objc_super v7 = v18;
          }
          id v21 = [v11 criteria];
          [v8 addObjectsFromArray:v21];
        }
        else
        {
          if (v11 == v10 || v7)
          {
            int v16 = v8;
            id v15 = v7;
          }
          else
          {
            id v15 = objc_alloc_init(MFMessageCriterion);
            [(MFMessageCriterion *)v15 setCriterionType:25];
            [(MFMessageCriterion *)v15 setAllCriteriaMustBeSatisfied:[(MFMessageCriterion *)self allCriteriaMustBeSatisfied]];
            int v16 = [MEMORY[0x1E4F1CA48] array];

            char v17 = objc_msgSend(v23, "subarrayWithRange:", 0, v9);
            [v16 addObjectsFromArray:v17];
          }
          id v8 = v16;
          objc_super v7 = v15;
          [v16 addObject:v11];
        }

        ++v9;
      }
      while (v4 != v9);
      if (v7)
      {
        [(MFMessageCriterion *)v7 setCriteria:v8];

        goto LABEL_24;
      }
    }
    else
    {
      id v8 = 0;
    }
  }
LABEL_23:
  objc_super v7 = self;
LABEL_24:
  return v7;
}

- (id)fixOnce
{
  v2 = self;
  if ([(MFMessageCriterion *)self criterionType] == 25)
  {
    id v15 = v2;
    uint64_t v3 = [(MFMessageCriterion *)v15 criteria];
    uint64_t v4 = [v3 count];
    if (v4)
    {
      uint64_t v14 = v2;
      uint64_t v5 = 0;
      uint64_t v6 = 0;
      objc_super v7 = 0;
      do
      {
        id v8 = objc_msgSend(v3, "objectAtIndex:", v6, v14);
        uint64_t v9 = [v8 _criterionForSQL];
        if (v9 != v8 && !v5)
        {
          uint64_t v10 = objc_alloc_init(MFMessageCriterion);
          [(MFMessageCriterion *)v10 setCriterionType:25];
          [(MFMessageCriterion *)v10 setAllCriteriaMustBeSatisfied:[(MFMessageCriterion *)v15 allCriteriaMustBeSatisfied]];
          v11 = [MEMORY[0x1E4F1CA48] array];

          int v12 = objc_msgSend(v3, "subarrayWithRange:", 0, v6);
          [v11 addObjectsFromArray:v12];

          objc_super v7 = v11;
          uint64_t v5 = v10;
        }
        [v7 addObject:v9];

        ++v6;
      }
      while (v4 != v6);
      v2 = v14;
      if (v5)
      {
        [(MFMessageCriterion *)v5 setCriteria:v7];

        goto LABEL_13;
      }
    }
    else
    {
      objc_super v7 = 0;
    }
  }
  uint64_t v5 = v2;
LABEL_13:
  return v5;
}

- (CSSuggestion)suggestion
{
  return self->_suggestion;
}

- (void)setSuggestion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryIdentifiers, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_expressionLanguages, 0);
  objc_storeStrong((id *)&self->_requiredHeaders, 0);
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_expression, 0);
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_criterionIdentifier, 0);
}

+ (id)flaggedMessageCriterion
{
  v2 = [[MFMessageCriterion alloc] initWithType:27 qualifier:3 expression:@"MessageIsFlagged"];
  [(MFMessageCriterion *)v2 setUseFlaggedForUnreadCount:1];
  [(MFMessageCriterion *)v2 setName:@"FlaggedCriterion"];
  return v2;
}

- (void)setUseFlaggedForUnreadCount:(BOOL)a3
{
  self->_useFlaggedForUnreadCount = a3;
}

+ (id)threadMuteMessageCriterion
{
  v2 = [[MFMessageCriterion alloc] initWithType:27 qualifier:3 expression:@"MessageConversationIsMuted"];
  [(MFMessageCriterion *)v2 setName:@"ThreadMuteCriterionName"];
  return v2;
}

+ (id)todayMessageCriterion
{
  v2 = [MFMessageCriterion alloc];
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  uint64_t v4 = [(MFMessageCriterion *)v2 initWithType:11 qualifier:5 expression:v3];

  [(MFMessageCriterion *)v4 setDateUnits:1];
  [(MFMessageCriterion *)v4 setDateIsRelative:1];
  [(MFMessageCriterion *)v4 setName:@"TodayCriterion"];
  return v4;
}

- (void)setDateUnits:(int64_t)a3
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
  *((unsigned char *)self + 72) = *((unsigned char *)self + 72) & 0xFD | v3;
}

+ (id)sendLaterMessageCriterion
{
  v2 = [[MFMessageCriterion alloc] initWithType:49 qualifier:7 expression:0];
  [(MFMessageCriterion *)v2 setName:@"SendLaterCriterion"];
  return v2;
}

+ (id)threadNotifyMessageCriterion
{
  v2 = [[MFMessageCriterion alloc] initWithType:27 qualifier:3 expression:@"MessageConversationIsVIP"];
  [(MFMessageCriterion *)v2 setName:@"ThreadNotifyCriterionName"];
  return v2;
}

+ (id)hasAttachmentsCriterion
{
  v2 = [[MFMessageCriterion alloc] initWithType:27 qualifier:3 expression:@"MFMessageHasAttachments"];
  [(MFMessageCriterion *)v2 setName:@"HasAttachmentsCriterion"];
  return v2;
}

+ (id)includesMeCriterion
{
  v2 = [[MFMessageCriterion alloc] initWithType:27 qualifier:3 expression:@"MessageToOrCcContainsAccountAddress"];
  [(MFMessageCriterion *)v2 setName:@"IncludesMeCriterion"];
  return v2;
}

+ (id)unreadMessageCriterion
{
  v2 = [[MFMessageCriterion alloc] initWithType:27 qualifier:7 expression:@"MessageIsRead"];
  [(MFMessageCriterion *)v2 setName:@"UnreadCriterion"];
  return v2;
}

+ (id)senderIsVIPCriterion:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [MFMessageCriterion alloc];
  if (v3) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 7;
  }
  uint64_t v6 = [(MFMessageCriterion *)v4 initWithType:27 qualifier:v5 expression:@"MessageSenderIsVIP"];
  [(MFMessageCriterion *)v6 setName:@"VIPCriterion"];
  return v6;
}

- (void)setName:(id)a3
{
}

- (id)criterionByApplyingTransform:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, MFMessageCriterion *))a3;
  if (!v4)
  {
    char v17 = self;
LABEL_22:
    int v16 = v17;
    goto LABEL_26;
  }
  v19 = self;
  if ([(MFMessageCriterion *)self criterionType] != 25)
  {
    v4[2](v4, self);
    char v17 = (MFMessageCriterion *)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [(MFMessageCriterion *)self criteria];
  uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = 0;
    objc_super v7 = 0;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v11 = [v10 criterionByApplyingTransform:v4];
        int v12 = v11;
        if (!v7)
        {
          if ([v11 isEqual:v10])
          {
            objc_super v7 = 0;
          }
          else
          {
            uint64_t v13 = (void *)MEMORY[0x1E4F1CA48];
            uint64_t v14 = [(MFMessageCriterion *)v19 criteria];
            id v15 = objc_msgSend(v14, "subarrayWithRange:", 0, v6 + i);
            objc_super v7 = [v13 arrayWithArray:v15];
          }
        }
        if (v12 && ([v7 containsObject:v12] & 1) == 0) {
          [v7 addObject:v12];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      v6 += i;
    }
    while (v5);

    if (v7)
    {
      if ([v7 count] == 1)
      {
        int v16 = [v7 lastObject];
      }
      else if ([v7 count])
      {
        int v16 = objc_alloc_init(MFMessageCriterion);
        [(MFMessageCriterion *)v16 setCriterionType:25];
        [(MFMessageCriterion *)v16 setAllCriteriaMustBeSatisfied:[(MFMessageCriterion *)v19 allCriteriaMustBeSatisfied]];
        [(MFMessageCriterion *)v16 setCriteria:v7];
      }
      else
      {
        int v16 = 0;
      }
      goto LABEL_25;
    }
  }
  else
  {
  }
  int v16 = v19;
  objc_super v7 = 0;
LABEL_25:

LABEL_26:
  return v16;
}

- (unsigned)bestBaseTable
{
  v22[1] = *MEMORY[0x1E4F143B8];
  if ([(MFMessageCriterion *)self criterionType] == 25
    && ([(MFMessageCriterion *)self allCriteriaMustBeSatisfied]
     || ([(MFMessageCriterion *)self criteria],
         BOOL v3 = objc_claimAutoreleasedReturnValue(),
         uint64_t v4 = [v3 count],
         v3,
         v4 == 1)))
  {
    uint64_t v5 = [(MFMessageCriterion *)self criteria];
  }
  else
  {
    v22[0] = self;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  }
  uint64_t v6 = v5;
  unsigned int v7 = 0;
  uint64_t v8 = [v5 count];
  if (v8)
  {
    while (1)
    {
      uint64_t v9 = [v6 objectAtIndex:--v8];
      uint64_t v10 = [(MFMessageCriterion *)v9 qualifier];
      unint64_t v11 = [(MFMessageCriterion *)v9 criterionType];
      int v12 = [(MFMessageCriterion *)v9 expression];
      if (v11 > 0x33) {
        goto LABEL_14;
      }
      if (v11 != 27) {
        break;
      }
      if (([@"MFMessageHasAttachments" isEqual:v12] & 1) != 0
        || ([@"MessageIsRead" isEqual:v12] & 1) != 0
        || ([@"MessageIsFlagged" isEqual:v12] & 1) != 0)
      {
LABEL_37:

        unsigned int v7 = 32;
        goto LABEL_38;
      }
LABEL_35:

      if (!v8) {
        goto LABEL_38;
      }
    }
    if (((1 << v11) & 0x9881401001800) != 0) {
      goto LABEL_37;
    }
LABEL_14:
    if (v11 != 23 || v10 != 3)
    {
      if (v11 == 25)
      {
        if (v9 == self)
        {
          uint64_t v14 = [(MFMessageCriterion *)self criteria];
          uint64_t v15 = [v14 count];
          if (!v15) {
            goto LABEL_33;
          }
          uint64_t v16 = v15 - 1;
          do
          {
            char v17 = [v14 objectAtIndex:v16];
            unsigned int v18 = [v17 bestBaseTable];

            if (v18 >= 0x20) {
              unsigned int v19 = 32;
            }
            else {
              unsigned int v19 = v18;
            }
            BOOL v20 = v16-- != 0;
          }
          while (v20 && v19 > 0x1F);
          if (v19 >= 0x20) {
LABEL_33:
          }
            unsigned int v7 = 32;
        }
        else
        {
          unsigned int v13 = [(MFMessageCriterion *)v9 bestBaseTable];
          if (v13 > v7) {
            unsigned int v7 = v13;
          }
        }
      }
      else if (v11 == 5 && v7 <= 8)
      {
        unsigned int v7 = 8;
      }
    }
    goto LABEL_35;
  }
LABEL_38:

  return v7;
}

- (id)SQLExpressionWithContext:(id)a3 depth:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v196[2] = *MEMORY[0x1E4F143B8];
  v191 = (id *)a3;
  unint64_t v7 = [(MFMessageCriterion *)self qualifier];
  int64_t v8 = [(MFMessageCriterion *)self criterionType];
  id v190 = v191[4];
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  unint64_t v11 = 0;
  switch(v8)
  {
    case 1:
      v45 = [(MFMessageCriterion *)self criterionIdentifier];
      v46 = [v45 lowercaseString];

      if ([v46 isEqual:*MEMORY[0x1E4F60738]])
      {
        if (*((unsigned char *)v191 + 42))
        {
          if (v7 - 1 > 3) {
            uint64_t v47 = 0;
          }
          else {
            uint64_t v47 = dword_1A8AC62B0[v7 - 1];
          }
          v122 = NSString;
          v123 = [(MFMessageCriterion *)self expression];
          v124 = objc_msgSend(v123, "ef_SQLEscapedString");
          unsigned int v18 = [v122 stringWithFormat:@"cpsearch(subject, '%@', %d)", v124, v47];

          uint64_t v9 = 0;
          uint64_t v10 = 0;
          *((_DWORD *)v191 + 6) |= 0x200u;
          goto LABEL_127;
        }
      }
      else
      {
        if ([v46 isEqual:*MEMORY[0x1E4F606F0]])
        {
          uint64_t v9 = @"messages.message_id";
          expressionForOperator(v7);
          uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v83 = NSString;
          v84 = [(MFMessageCriterion *)self expression];
          unsigned int v18 = [v83 stringWithFormat:@"%@ %@ %lld", @"messages.message_id", v10, MFStringHashForMessageIDHeader()];

LABEL_127:
          goto LABEL_146;
        }
        v121 = MFLogGeneral();
        if (os_log_type_enabled(v121, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v195 = v46;
          _os_log_impl(&dword_1A7EFF000, v121, OS_LOG_TYPE_INFO, "Unsupported header criterion %@", buf, 0xCu);
        }
      }
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      unsigned int v18 = 0;
      goto LABEL_127;
    case 9:
      if (!*((unsigned char *)v191 + 42)) {
        goto LABEL_59;
      }
      v50 = [(MFMessageCriterion *)self expression];
      uint64_t v43 = objc_msgSend(v50, "ef_SQLEscapedString");

      uint64_t v51 = 4;
      switch(v7)
      {
        case 1uLL:
          uint64_t v51 = 2;
          goto LABEL_140;
        case 2uLL:
          uint64_t v51 = 3;
          goto LABEL_140;
        case 3uLL:
          goto LABEL_140;
        case 4uLL:
          unint64_t v7 = 0;
          goto LABEL_139;
        case 8uLL:
          unsigned int v18 = [NSString stringWithFormat:@"(_to LIKE '%%%@%%' OR cc LIKE '%%%@%%')", v43, v43];
          unint64_t v7 = 8;
          goto LABEL_142;
        default:
LABEL_139:
          uint64_t v51 = 0;
LABEL_140:
          uint64_t v126 = [NSString stringWithFormat:@"cpsearch(IFNULL(_to, '') || ' ' || IFNULL(cc, ''), '%@', %d)", v43, v51];
          break;
      }
      goto LABEL_141;
    case 11:
    case 12:
    case 43:
    case 44:
    case 46:
    case 47:
    case 48:
    case 49:
      int v12 = [MEMORY[0x1E4F28ED0] numberWithInteger:v8];
      uint64_t v9 = [v190 columnNameForLookupKey:@"MFPropertyMapperLookupKeyCriterionType" value:v12];

      unsigned int v13 = [(MFMessageCriterion *)self expression];
      if (v13)
      {
      }
      else if ((v7 | 4) == 7)
      {
        uint64_t v10 = 0;
        char v17 = @"IS NOT";
        if (v7 == 3) {
          char v17 = @"IS";
        }
        unsigned int v18 = [NSString stringWithFormat:@"%@ %@ NULL", v9, v17];
        unsigned int v19 = 0;
        goto LABEL_147;
      }
      uint64_t v14 = [(MFMessageCriterion *)self expression];
      char v15 = [v14 isEqualToString:*MEMORY[0x1E4F5FEF8]];

      if (v15)
      {
        uint64_t v16 = &unk_1EFF50B20;
LABEL_79:
        uint64_t v10 = 0;
        unint64_t v11 = [v190 columnNameForLookupKey:@"MFPropertyMapperLookupKeyCriterionType" value:v16];
        goto LABEL_205;
      }
      BOOL v20 = [(MFMessageCriterion *)self expression];
      char v21 = [v20 isEqualToString:*MEMORY[0x1E4F5FE68]];

      if (v21)
      {
        uint64_t v16 = &unk_1EFF50B38;
        goto LABEL_79;
      }
      long long v22 = [(MFMessageCriterion *)self expression];
      char v23 = [v22 isEqualToString:*MEMORY[0x1E4F5FE58]];

      if (v23)
      {
        uint64_t v16 = &unk_1EFF50B50;
        goto LABEL_79;
      }
      v75 = [(MFMessageCriterion *)self expression];
      int v76 = [v75 isEqualToString:*MEMORY[0x1E4F5FE00]];

      if (v76)
      {
        uint64_t v16 = &unk_1EFF50B68;
        goto LABEL_79;
      }
      if (![(MFMessageCriterion *)self dateIsRelative])
      {
LABEL_60:
        uint64_t v10 = 0;
        unint64_t v11 = 0;
        goto LABEL_205;
      }
      if (v7 == 6)
      {
        unint64_t v7 = 5;
LABEL_157:
        v188 = [MEMORY[0x1E4F1C9C8] date];
        v186 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        switch([(MFMessageCriterion *)self dateUnits])
        {
          case 0:
            v128 = [(MFMessageCriterion *)self expression];
            v129 = 0;
            int v130 = 0;
            int v131 = 0;
            int v132 = 0;
            int v133 = -(int)[v128 intValue];
            goto LABEL_202;
          case 1:
            v165 = [(MFMessageCriterion *)self expression];
            int v166 = [v165 intValue];

            v129 = [v186 components:224 fromDate:v188];
            [v129 setDay:v7 == 6];
            objc_msgSend(v129, "setHour:", -objc_msgSend(v129, "hour"));
            objc_msgSend(v129, "setMinute:", -objc_msgSend(v129, "minute"));
            objc_msgSend(v129, "setSecond:", -objc_msgSend(v129, "second"));
            uint64_t v156 = [v186 dateByAddingComponents:v129 toDate:v188 options:0];
            int v133 = 0;
            int v131 = 0;
            int v132 = 0;
            int v130 = -v166;
            goto LABEL_196;
          case 2:
            v157 = [(MFMessageCriterion *)self expression];
            int v158 = [v157 intValue];

            if (v7 == 6)
            {
              v159 = [v186 components:16 fromDate:v188];
              [v159 setDay:7];
              uint64_t v160 = [v186 dateByAddingComponents:v159 toDate:v188 options:0];

              v161 = (void *)v160;
              v162 = v159;
            }
            else
            {
              v162 = 0;
              v161 = v188;
            }
            v189 = v161;
            v129 = objc_msgSend(v186, "components:fromDate:", 736);

            objc_msgSend(v129, "setDay:", -objc_msgSend(v129, "weekday"));
            objc_msgSend(v129, "setHour:", -objc_msgSend(v129, "hour"));
            objc_msgSend(v129, "setMinute:", -objc_msgSend(v129, "minute"));
            objc_msgSend(v129, "setSecond:", -objc_msgSend(v129, "second"));
            [v186 dateByAddingComponents:v129 toDate:v189 options:0];
            int v133 = 0;
            int v131 = 0;
            int v132 = 0;
            v188 = v128 = v189;
            int v130 = -7 * v158;
            goto LABEL_202;
          case 3:
            v163 = [(MFMessageCriterion *)self expression];
            int v164 = [v163 intValue];

            v129 = [v186 components:240 fromDate:v188];
            [v129 setMonth:v7 == 6];
            objc_msgSend(v129, "setDay:", 1 - objc_msgSend(v129, "day"));
            objc_msgSend(v129, "setHour:", -objc_msgSend(v129, "hour"));
            objc_msgSend(v129, "setMinute:", -objc_msgSend(v129, "minute"));
            objc_msgSend(v129, "setSecond:", -objc_msgSend(v129, "second"));
            uint64_t v156 = [v186 dateByAddingComponents:v129 toDate:v188 options:0];
            int v133 = 0;
            int v130 = 0;
            int v132 = 0;
            int v131 = -v164;
            goto LABEL_196;
          case 4:
            v154 = [(MFMessageCriterion *)self expression];
            int v155 = [v154 intValue];

            v129 = [v186 components:248 fromDate:v188];
            [v129 setYear:v7 == 6];
            objc_msgSend(v129, "setMonth:", 1 - objc_msgSend(v129, "month"));
            objc_msgSend(v129, "setDay:", 1 - objc_msgSend(v129, "day"));
            objc_msgSend(v129, "setHour:", -objc_msgSend(v129, "hour"));
            objc_msgSend(v129, "setMinute:", -objc_msgSend(v129, "minute"));
            objc_msgSend(v129, "setSecond:", -objc_msgSend(v129, "second"));
            uint64_t v156 = [v186 dateByAddingComponents:v129 toDate:v188 options:0];
            int v133 = 0;
            int v130 = 0;
            int v131 = 0;
            int v132 = -v155;
LABEL_196:
            v128 = v188;
            v188 = (void *)v156;
LABEL_202:

            v167 = v129;
            break;
          default:
            v167 = 0;
            int v133 = 0;
            int v130 = 0;
            int v131 = 0;
            int v132 = 0;
            break;
        }
        id v169 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);

        [v169 setYear:v132];
        [v169 setMonth:v131];
        [v169 setDay:v130];
        [v169 setSecond:v133];
        v170 = [v186 dateByAddingComponents:v169 toDate:v188 options:0];

        v171 = NSString;
        [v170 timeIntervalSince1970];
        unsigned int v19 = objc_msgSend(v171, "stringWithFormat:", @"%d", (int)v172);

        uint64_t v10 = 0;
        goto LABEL_204;
      }
      if (v7 != 3)
      {
        if (v7 == 5) {
          unint64_t v7 = 6;
        }
        goto LABEL_157;
      }
      v85 = [(MFMessageCriterion *)self expression];
      int v86 = [v85 intValue];

      v87 = [MFMessageCriterion alloc];
      v88 = objc_msgSend(NSString, "stringWithFormat:", @"%d", (v86 + 1));
      v89 = [(MFMessageCriterion *)v87 initWithType:v8 qualifier:5 expression:v88];

      [(MFMessageCriterion *)v89 setDateUnits:[(MFMessageCriterion *)self dateUnits]];
      [(MFMessageCriterion *)v89 setDateIsRelative:1];
      v90 = [MFMessageCriterion alloc];
      v91 = objc_msgSend(NSString, "stringWithFormat:", @"%d", (v86 - 1));
      v92 = [(MFMessageCriterion *)v90 initWithType:v8 qualifier:6 expression:v91];

      [(MFMessageCriterion *)v92 setDateUnits:[(MFMessageCriterion *)self dateUnits]];
      [(MFMessageCriterion *)v92 setDateIsRelative:1];
      v196[0] = v89;
      v196[1] = v92;
      v93 = [MEMORY[0x1E4F1C978] arrayWithObjects:v196 count:2];
      v94 = +[MFMessageCriterion andCompoundCriterionWithCriteria:v93];

      unsigned int v18 = [v94 SQLExpressionWithContext:v191 depth:(v4 + 1)];

LABEL_73:
      uint64_t v10 = 0;
      unsigned int v19 = 0;
      unint64_t v7 = 3;
LABEL_147:
      if (v18)
      {
        unint64_t v11 = 0;
      }
      else
      {
LABEL_204:
        unint64_t v11 = 0;
        if (!v19)
        {
LABEL_205:
          unsigned int v19 = [(MFMessageCriterion *)self expression];
        }
        uint64_t v173 = (uint64_t)v10;
        if (!v10)
        {
          uint64_t v173 = expressionForOperator(v7);
        }
        v174 = NSString;
        v175 = v11;
        if (!v11)
        {
          id v176 = v19;
          v177 = objc_msgSend(v176, "ef_SQLEscapedString");
          if (v7 >= 8)
          {
            id v178 = v176;
          }
          else
          {
            objc_msgSend(NSString, "stringWithFormat:", off_1E5D3B470[v7], v177);
            id v178 = (id)objc_claimAutoreleasedReturnValue();
          }
          v175 = v178;
        }
        unsigned int v18 = [v174 stringWithFormat:@"%@ %@ %@", v9, v173, v175];
        if (!v11)
        {

          unint64_t v11 = 0;
        }
        uint64_t v10 = (__CFString *)v173;
      }
      v179 = v18;

      return v179;
    case 23:
      uint64_t v9 = 0;
      unsigned int v18 = [(MFMessageCriterion *)self _SQLExpressionForMailboxCriterion];
      uint64_t v10 = 0;
      unsigned int v19 = 0;
      goto LABEL_147;
    case 24:
      if (v7 == 7)
      {
        v104 = NSString;
        uint64_t v105 = [(MFMessageCriterion *)self expression];
        v97 = (void *)v105;
        v106 = &stru_1EFF11268;
        if (v105) {
          v106 = (__CFString *)v105;
        }
        uint64_t v99 = [v104 stringWithFormat:@"messages.ROWID NOT IN (%@)", v106];
        goto LABEL_106;
      }
      if (v7 != 3)
      {
        uint64_t v10 = 0;
        unint64_t v11 = 0;
        uint64_t v9 = @"messages.ROWID";
        goto LABEL_205;
      }
      id v35 = NSString;
      uint64_t v36 = [(MFMessageCriterion *)self expression];
      v27 = (void *)v36;
      id v37 = &stru_1EFF11268;
      if (v36) {
        id v37 = (__CFString *)v36;
      }
      uint64_t v29 = [v35 stringWithFormat:@"messages.ROWID IN (%@)", v37];
      goto LABEL_72;
    case 25:
      v52 = [(MFMessageCriterion *)self criteria];
      if ((unint64_t)[v52 count] < 2)
      {
        if ([v52 count] == 1)
        {
          v80 = [v52 lastObject];
          unsigned int v18 = [v80 SQLExpressionWithContext:v191 depth:v4];
        }
        else
        {
          unsigned int v18 = @"NULL";
        }
        goto LABEL_188;
      }
      BOOL v53 = [(MFMessageCriterion *)self allCriteriaMustBeSatisfied];
      char v54 = v4 > 1 || v53;
      BOOL v185 = v53;
      if (v54)
      {
        unsigned int v18 = 0;
        goto LABEL_164;
      }
      v187 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v112 = [v52 count];
      v113 = v52;
      if (!v112) {
        goto LABEL_160;
      }
      uint64_t v114 = v112 - 1;
      while (1)
      {
        v115 = [v113 objectAtIndex:v114];
        if ([v115 criterionType] == 25) {
          break;
        }
        *(_DWORD *)buf = -1431655766;
        uint64_t v116 = [v115 bestBaseTable];
        *(_DWORD *)buf = v116;
        if (v116 <= *((_DWORD *)v191 + 7)) {
          break;
        }
        v117 = [v115 SQLExpressionWithTables:buf baseTable:v116 protectedDataAvailable:*((unsigned __int8 *)v191 + 42) searchableIndexManager:v191[1] mailboxIDs:v191[2] propertyMapper:v190];
        v118 = NSString;
        v119 = tablesForBaseTableAndOtherTables(*(int *)buf, 0);
        v120 = [v118 stringWithFormat:@"SELECT messages.ROWID FROM %@ WHERE %@", v119, v117];

        [v187 addObject:v120];
        if (--v114 == -1) {
          goto LABEL_160;
        }
      }
      [v187 removeAllObjects];

LABEL_160:
      if ([v187 count])
      {
        v134 = NSString;
        v135 = [v187 componentsJoinedByString:@" UNION "];
        unsigned int v18 = [v134 stringWithFormat:@"messages.ROWID IN (%@)", v135];
      }
      else
      {
        unsigned int v18 = 0;
      }

      v52 = v113;
      BOOL v53 = v185;
LABEL_164:
      if (v18) {
        char v136 = 1;
      }
      else {
        char v136 = v53;
      }
      if ((v136 & 1) == 0)
      {
        v137 = [MEMORY[0x1E4F1CA48] array];
        uint64_t v138 = [v52 count];
        v139 = v52;
        if (v138)
        {
          uint64_t v140 = 0;
          while (1)
          {
            v141 = [v139 objectAtIndex:v140];
            if ([v141 criterionType] != 23 || objc_msgSend(v141, "qualifier") != 3) {
              break;
            }
            v142 = [v141 expression];
            v143 = objc_msgSend(v142, "ef_SQLExpression");
            [v137 addObject:v143];

            if (v138 == ++v140) {
              goto LABEL_175;
            }
          }
          [v137 removeAllObjects];
        }
LABEL_175:
        if ([v137 count])
        {
          v144 = NSString;
          v145 = [v137 componentsJoinedByString:@", "];
          unsigned int v18 = [v144 stringWithFormat:@"mailbox IN (SELECT rowid FROM mailboxes WHERE url IN (%@))", v145];
        }
        else
        {
          unsigned int v18 = 0;
        }

        v52 = v139;
        BOOL v53 = v185;
      }
      if (!v18)
      {
        v146 = @" OR ";
        if (v53) {
          v146 = @" AND ";
        }
        v147 = v146;
        objc_msgSend(MEMORY[0x1E4F28E78], "stringWithUTF8String:", "(");
        unsigned int v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v148 = v52;
        uint64_t v149 = [v52 count];
        if (v149)
        {
          uint64_t v150 = 0;
          uint64_t v151 = (v4 + 1);
          do
          {
            v152 = [v148 objectAtIndex:v150];
            if (v150) {
              [(__CFString *)v18 appendString:v147];
            }
            v153 = [v152 SQLExpressionWithContext:v191 depth:v151];
            [(__CFString *)v18 appendString:v153];

            ++v150;
          }
          while (v149 != v150);
        }
        [(__CFString *)v18 appendString:@""]);

        v52 = v148;
      }
LABEL_188:

LABEL_144:
      uint64_t v9 = 0;
LABEL_145:
      uint64_t v10 = 0;
LABEL_146:
      unsigned int v19 = 0;
      goto LABEL_147;
    case 26:
      v62 = [(MFMessageCriterion *)self criteria];
      uint64_t v63 = [v62 count];

      if (v63 != 1) {
        goto LABEL_59;
      }
      v64 = [(MFMessageCriterion *)self criteria];
      v65 = [v64 firstObject];
      v31 = [v65 SQLExpressionWithContext:v191 depth:(v4 + 1)];

      uint64_t v32 = [NSString stringWithFormat:@"NOT (%@)", v31];
LABEL_58:
      unsigned int v18 = (__CFString *)v32;

      goto LABEL_144;
    case 27:
      long long v38 = [(MFMessageCriterion *)self expression];
      if ([v38 isEqual:@"MessageIsServerSearchResult"])
      {
        v192 = v38;
        uint64_t v193 = MEMORY[0x1E4F1CC38];
        long long v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v193 forKeys:&v192 count:1];
        MFMessageFlagsByApplyingDictionary(0, v39);

        EFStringWithInt64();
        long long v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
        long long v41 = @"0";
        if (v7 == 3) {
          long long v41 = v40;
        }
        [NSString stringWithFormat:@"(messages.flags & %@) = %@", v40, v41];
        unsigned int v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        uint64_t v10 = 0;
        unsigned int v19 = 0;
        goto LABEL_33;
      }
      if ([v38 isEqual:@"MessageIsRead"])
      {
        v79 = @"read = %d";
LABEL_111:
        uint64_t v111 = objc_msgSend(NSString, "stringWithFormat:", v79, v7 == 3);
        goto LABEL_112;
      }
      if ([v38 isEqual:@"MessageIsFlagged"])
      {
        v79 = @"flagged = %d";
        goto LABEL_111;
      }
      if ([v38 isEqual:@"MessageIsDeleted"])
      {
        v125 = @"likely";
        if (v7 == 3) {
          v125 = @"unlikely";
        }
        uint64_t v111 = [NSString stringWithFormat:@"%@(deleted = %d)", v125, v7 == 3];
        goto LABEL_112;
      }
      if ([v38 isEqual:@"MessageIsJournaled"])
      {
        v127 = @"likely";
        if (v7 == 3) {
          v127 = @"unlikely";
        }
        uint64_t v111 = [NSString stringWithFormat:@"%@(journaled = %d)", v127, v7 == 3];
LABEL_112:
        unsigned int v18 = (__CFString *)v111;
        uint64_t v10 = 0;
        unsigned int v19 = 0;
LABEL_113:

        uint64_t v9 = 0;
        goto LABEL_147;
      }
      if ([v38 isEqual:@"MessageSenderIsVIP"])
      {
        uint64_t v111 = objc_msgSend(NSString, "stringWithFormat:", @"sender_vip = %d", v7 == 3);
        goto LABEL_112;
      }
      if ([v38 isEqual:@"MessageConversationIsVIP"])
      {
        v168 = @"messages.conversation_id in (select rowid from conversations where flags = 1)";
LABEL_227:
        uint64_t v111 = [NSString stringWithFormat:v168];
        goto LABEL_112;
      }
      if ([v38 isEqual:@"MessageConversationIsMuted"])
      {
        v168 = @"messages.conversation_id in (select rowid from conversations where flags = 4)";
        goto LABEL_227;
      }
      if ([v38 isEqual:@"MFMessageHasAttachments"])
      {
        v168 = @"((messages.flags&(63<<10))>>10) BETWEEN 1 AND 62";
        goto LABEL_227;
      }
      if ([v38 isEqual:@"MessageToContainsAccountAddress"])
      {
        v168 = @"(messages.flags&(1<<39)) > 0";
        goto LABEL_227;
      }
      if ([v38 isEqual:@"MessageCcContainsAccountAddress"])
      {
        v168 = @"(messages.flags&(1<<40)) > 0";
        goto LABEL_227;
      }
      if ([v38 isEqual:@"MessageToOrCcContainsAccountAddress"])
      {
        v168 = @"(messages.flags&(3<<39)) > 0";
        goto LABEL_227;
      }
      objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"YES", v38, 0);
      long long v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
      MFMessageFlagsByApplyingDictionary(0, v40);
      uint64_t v183 = EFStringWithInt64();
      unsigned int v19 = (void *)v183;
      if (v7 == 3)
      {
        uint64_t v10 = @"and64";
      }
      else
      {
        if (v7 != 7)
        {
          v184 = MFLogGeneral();
          if (os_log_type_enabled(v184, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v195) = v7;
            _os_log_impl(&dword_1A7EFF000, v184, OS_LOG_TYPE_DEFAULT, "#Warning unsupported qualifier %d in flag criterion", buf, 8u);
          }

          uint64_t v10 = 0;
          goto LABEL_237;
        }
        uint64_t v10 = @"not and64";
      }
      if (v183)
      {
        unsigned int v18 = [NSString stringWithFormat:@"%@(messages.flags, %@)", v10, v183];
LABEL_33:

        goto LABEL_113;
      }
LABEL_237:
      unsigned int v18 = 0;
      goto LABEL_33;
    case 28:
      v30 = NSString;
      v31 = [(MFMessageCriterion *)self expression];
      uint64_t v32 = objc_msgSend(v30, "stringWithFormat:", @"flag_color = %d", objc_msgSend(v31, "intValue"));
      goto LABEL_58;
    case 33:
      unint64_t v48 = v7 - 1;
      if (v7 - 1 >= 4)
      {
        uint64_t v49 = 0;
      }
      else
      {
        unint64_t v7 = qword_1A8AC62C0[v48];
        uint64_t v49 = qword_1A8AC62E0[v48];
      }
      v77 = NSString;
      uint64_t v43 = [(MFMessageCriterion *)self expression];
      v78 = objc_msgSend(v43, "ef_SQLEscapedString");
      unsigned int v18 = [v77 stringWithFormat:@"cpsearch(IFNULL(sender, '') || ' ' || IFNULL(subject, '') || ' ' || IFNULL(_to, '') || ' ' || IFNULL(cc, ''), '%@', %d)", v78, v49];

      goto LABEL_143;
    case 34:
      if (v7 == 3) {
        v66 = @"messages.conversation_id IN (%@)";
      }
      else {
        v66 = @"messages.conversation_id NOT IN (%@)";
      }
      BOOL v67 = [(MFMessageCriterion *)self expressionIsSanitized];
      v68 = NSString;
      if (v67)
      {
        uint64_t v43 = [(MFMessageCriterion *)self expression];
        objc_msgSend(v68, "stringWithFormat:", v66, v43);
        unsigned int v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v43 = [(MFMessageCriterion *)self expression];
        v73 = objc_msgSend(v43, "ef_SQLEscapedString");
        uint64_t v74 = objc_msgSend(v68, "stringWithFormat:", v66, v73);
LABEL_83:
        unsigned int v18 = (__CFString *)v74;
      }
      goto LABEL_143;
    case 35:
      if (!*((unsigned char *)v191 + 42)) {
        goto LABEL_59;
      }
      v42 = [(MFMessageCriterion *)self expression];
      uint64_t v43 = objc_msgSend(v42, "ef_SQLEscapedString");

      uint64_t v44 = 4;
      switch(v7)
      {
        case 1uLL:
          uint64_t v44 = 2;
          goto LABEL_136;
        case 2uLL:
          uint64_t v44 = 3;
          goto LABEL_136;
        case 3uLL:
          goto LABEL_136;
        case 4uLL:
          uint64_t v44 = 1;
          goto LABEL_136;
        case 8uLL:
          uint64_t v126 = [NSString stringWithFormat:@"sender LIKE '%%%@%%'", v43];
          break;
        default:
          uint64_t v44 = 0;
LABEL_136:
          uint64_t v126 = [NSString stringWithFormat:@"cpsearch(sender, '%@', %d)", v43, v44];
          break;
      }
LABEL_141:
      unsigned int v18 = (__CFString *)v126;
LABEL_142:
      *((_DWORD *)v191 + 6) |= 0x200u;
LABEL_143:

      goto LABEL_144;
    case 36:
      uint64_t v10 = 0;
      unint64_t v11 = 0;
      uint64_t v9 = @"messages.external_id";
      goto LABEL_205;
    case 37:
      if (v7 == 7)
      {
        v95 = NSString;
        uint64_t v96 = [(MFMessageCriterion *)self expression];
        v97 = (void *)v96;
        v98 = &stru_1EFF11268;
        if (v96) {
          v98 = (__CFString *)v96;
        }
        uint64_t v99 = [v95 stringWithFormat:@"messages.global_message_id NOT IN (%@)", v98];
        goto LABEL_106;
      }
      if (v7 != 3)
      {
        uint64_t v9 = @"messages.global_message_id";
        uint64_t v100 = expressionForOperator(v7);
        v101 = NSString;
        v102 = [(MFMessageCriterion *)self expression];
        uint64_t v103 = [v101 stringWithFormat:@"%@ %@ %@", @"messages.global_message_id", v100, v102];
        goto LABEL_108;
      }
      v25 = NSString;
      uint64_t v26 = [(MFMessageCriterion *)self expression];
      v27 = (void *)v26;
      id v28 = &stru_1EFF11268;
      if (v26) {
        id v28 = (__CFString *)v26;
      }
      uint64_t v29 = [v25 stringWithFormat:@"messages.global_message_id IN (%@)", v28];
      goto LABEL_72;
    case 38:
      if (v7 == 7)
      {
        v107 = NSString;
        uint64_t v108 = [(MFMessageCriterion *)self expression];
        v97 = (void *)v108;
        v109 = &stru_1EFF11268;
        if (v108) {
          v109 = (__CFString *)v108;
        }
        uint64_t v99 = [v107 stringWithFormat:@"messages.message_id NOT IN (%@)", v109];
LABEL_106:
        unsigned int v18 = (__CFString *)v99;

        uint64_t v9 = 0;
        uint64_t v10 = 0;
        unsigned int v19 = 0;
        unint64_t v7 = 7;
        goto LABEL_147;
      }
      if (v7 != 3)
      {
        uint64_t v9 = @"messages.message_id";
        uint64_t v100 = expressionForOperator(v7);
        v110 = NSString;
        v102 = [(MFMessageCriterion *)self expression];
        uint64_t v103 = [v110 stringWithFormat:@"%@ %@ %@", @"messages.message_id", v100, v102];
LABEL_108:
        unsigned int v18 = (__CFString *)v103;

        unsigned int v19 = 0;
        uint64_t v10 = (__CFString *)v100;
        goto LABEL_147;
      }
      v69 = NSString;
      uint64_t v70 = [(MFMessageCriterion *)self expression];
      v27 = (void *)v70;
      v71 = &stru_1EFF11268;
      if (v70) {
        v71 = (__CFString *)v70;
      }
      uint64_t v29 = [v69 stringWithFormat:@"messages.message_id IN (%@)", v71];
LABEL_72:
      unsigned int v18 = (__CFString *)v29;

      uint64_t v9 = 0;
      goto LABEL_73;
    case 39:
      if (v7 != 3)
      {
        v181 = [MEMORY[0x1E4F28B00] currentHandler];
        [v181 handleFailureInMethod:a2 object:self file:@"CriterionAdditions.m" lineNumber:816 description:@"Only MessageRuleIsEqualTo is supported for ListIDHashCriterionType"];
      }
      v33 = [(MFMessageCriterion *)self expression];
      uint64_t v34 = [v33 longLongValue];

      objc_msgSend(NSString, "stringWithFormat:", @"messages.list_id_hash = %lld", v34);
      unsigned int v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_144;
    case 40:
    case 41:
      goto LABEL_205;
    case 42:
      if (v7 != 3)
      {
        v182 = [MEMORY[0x1E4F28B00] currentHandler];
        [v182 handleFailureInMethod:a2 object:self file:@"CriterionAdditions.m" lineNumber:822 description:@"Only MessageRuleIsEqualTo is supported for DocumentIDCriterionType"];
      }
      uint64_t v43 = [(MFMessageCriterion *)self expression];
      v72 = NSString;
      v73 = objc_msgSend(v43, "ef_SQLEscapedString");
      uint64_t v74 = [v72 stringWithFormat:@"messages.document_id = '%@'", v73];
      goto LABEL_83;
    case 50:
      v58 = [MEMORY[0x1E4F28ED0] numberWithInteger:50];
      uint64_t v9 = [v190 columnNameForLookupKey:@"MFPropertyMapperLookupKeyCriterionType" value:v58];

      v59 = NSString;
      v60 = expressionForOperator(v7);
      v61 = [(MFMessageCriterion *)self expression];
      unsigned int v18 = [v59 stringWithFormat:@"%@ %@ %@", v9, v60, v61];

      goto LABEL_145;
    case 51:
      v55 = [MEMORY[0x1E4F28ED0] numberWithInteger:51];
      uint64_t v9 = [v190 columnNameForLookupKey:@"MFPropertyMapperLookupKeyCriterionType" value:v55];

      v56 = NSString;
      if (v7 == 8)
      {
        v57 = [(MFMessageCriterion *)self expression];
        unsigned int v18 = [v56 stringWithFormat:@"ifnull(%@, %ld) IN (%@)", v9, 0, v57];

        uint64_t v10 = 0;
        unsigned int v19 = 0;
        unint64_t v7 = 8;
        goto LABEL_147;
      }
      v81 = expressionForOperator(v7);
      v82 = [(MFMessageCriterion *)self expression];
      unsigned int v18 = [v56 stringWithFormat:@"ifnull(%@, %ld) %@ %@", v9, 0, v81, v82];

      goto LABEL_145;
    default:
      long long v24 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CriterionAdditions.m", 953, @"unsupported criterion type %ld", v8);

LABEL_59:
      uint64_t v9 = 0;
      goto LABEL_60;
  }
}

- (int64_t)qualifier
{
  return self->_qualifier;
}

- (id)_SQLExpressionForMailboxCriterion
{
  uint64_t v4 = [(MFMessageCriterion *)self expression];
  unint64_t v5 = [(MFMessageCriterion *)self qualifier];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F60E78]) initWithName:@"url"];
  unint64_t v7 = v6;
  switch(v5)
  {
    case 0uLL:
    case 8uLL:
      uint64_t v8 = [v6 contains:v4 caseSensitive:0];
      goto LABEL_7;
    case 1uLL:
      uint64_t v8 = [v6 beginsWith:v4 caseSensitive:0];
      goto LABEL_7;
    case 2uLL:
      uint64_t v8 = [v6 endsWith:v4 caseSensitive:0];
      goto LABEL_7;
    case 3uLL:
    case 7uLL:
      uint64_t v9 = [v6 equalTo:v4];
      goto LABEL_13;
    case 4uLL:
      uint64_t v8 = [v6 doesNotContain:v4 caseSensitive:0];
LABEL_7:
      uint64_t v9 = (void *)v8;
LABEL_8:
      uint64_t v10 = NSString;
      unint64_t v11 = objc_msgSend(v9, "ef_SQLExpression");
      int v12 = [v10 stringWithFormat:@"mailbox IN (SELECT ROWID FROM mailboxes WHERE %@)", v11];
      break;
    default:
      uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2 object:self file:@"CriterionAdditions.m" lineNumber:989 description:@"Qualifier not supported"];

      uint64_t v9 = 0;
LABEL_13:
      switch(v5)
      {
        case 3uLL:
        case 7uLL:
          unint64_t v11 = expressionForOperator(v5);
          char v15 = NSString;
          uint64_t v16 = objc_msgSend(v9, "ef_SQLExpression");
          int v12 = [v15 stringWithFormat:@"mailbox %@ IFNULL((SELECT ROWID FROM mailboxes WHERE %@), -1)", v11, v16];

          break;
        case 4uLL:
        case 8uLL:
          goto LABEL_8;
        default:
          unint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
          [v11 handleFailureInMethod:a2 object:self file:@"CriterionAdditions.m" lineNumber:1012 description:@"Qualifier not supported"];
          int v12 = 0;
          break;
      }
      break;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MFMessageCriterion *)a3;
  if (self == v4)
  {
    char v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      uint64_t v6 = [(MFMessageCriterion *)self criterionIdentifier];
      unint64_t v7 = [(MFMessageCriterion *)v5 criterionIdentifier];
      char v8 = [v6 isEqualToString:v7];

      if ((v8 & 1) == 0) {
        goto LABEL_10;
      }
      int64_t v9 = [(MFMessageCriterion *)self qualifier];
      if (v9 != [(MFMessageCriterion *)v5 qualifier]) {
        goto LABEL_10;
      }
      uint64_t v10 = [(MFMessageCriterion *)self suggestion];
      unint64_t v11 = [(MFMessageCriterion *)v5 suggestion];
      char v12 = EFObjectsAreEqual();

      if (v12)
      {
        if ([(MFMessageCriterion *)self criterionType] == 25)
        {
          unsigned int v13 = [(MFMessageCriterion *)self criteria];
          uint64_t v14 = [(MFMessageCriterion *)v5 criteria];
          char v15 = [v13 isEqualToArray:v14];
        }
        else
        {
          unsigned int v13 = [(MFMessageCriterion *)self expression];
          uint64_t v14 = [(MFMessageCriterion *)v5 expression];
          if (v13 == v14)
          {
            char v15 = 1;
          }
          else
          {
            char v17 = [(MFMessageCriterion *)self expression];
            unsigned int v18 = [(MFMessageCriterion *)v5 expression];
            char v15 = [v17 isEqualToString:v18];
          }
        }
      }
      else
      {
LABEL_10:
        char v15 = 0;
      }
    }
    else
    {
      char v15 = 0;
    }
  }

  return v15;
}

- (BOOL)allCriteriaMustBeSatisfied
{
  return *((unsigned char *)self + 72) & 1;
}

+ (id)criteriaFromDefaultsArray:(id)a3 removingRecognizedKeys:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = a3;
  unint64_t v7 = 0;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v12 = objc_alloc((Class)a1);
        unsigned int v13 = objc_msgSend(v12, "initWithDictionary:andRemoveRecognizedKeysIfMutable:", v11, v4, (void)v15);
        if (v13)
        {
          if (!v7)
          {
            unint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
          }
          [v7 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v7;
}

- (BOOL)_containsNotCriterion
{
  int64_t v3 = [(MFMessageCriterion *)self criterionType];
  if (v3 == 26) {
    return 1;
  }
  if (v3 != 25) {
    return 0;
  }
  BOOL v4 = [(MFMessageCriterion *)self criteria];
  char v5 = objc_msgSend(v4, "ef_any:", &__block_literal_global_2);

  return v5;
}

uint64_t __61__MFMessageCriterion_LibraryAdditions___containsNotCriterion__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _containsNotCriterion];
}

- (id)_evaluateFTSCriterionWithIndexManager:(id)a3 mailboxIDs:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(MFMessageCriterion *)self criterionType];
  if (v8 == 25)
  {
    if ([(MFMessageCriterion *)self _containsNotCriterion])
    {
      unsigned int v13 = [(MFMessageCriterion *)self criteria];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __89__MFMessageCriterion_LibraryAdditions___evaluateFTSCriterionWithIndexManager_mailboxIDs___block_invoke;
      v28[3] = &unk_1E5D3B410;
      id v29 = v6;
      id v30 = v7;
      uint64_t v14 = objc_msgSend(v13, "ef_map:", v28);

      id v12 = objc_alloc_init(MFMessageCriterion);
      [(MFMessageCriterion *)v12 setCriterionType:25];
      [(MFMessageCriterion *)v12 setAllCriteriaMustBeSatisfied:[(MFMessageCriterion *)self allCriteriaMustBeSatisfied]];
      [(MFMessageCriterion *)v12 setCriteria:v14];

      goto LABEL_14;
    }
  }
  else if (v8 == 26)
  {
    uint64_t v9 = [(MFMessageCriterion *)self criteria];
    uint64_t v10 = [v9 firstObject];

    uint64_t v11 = [v10 _evaluateFTSCriterionWithIndexManager:v6 mailboxIDs:v7];
    id v12 = +[MFMessageCriterion notCriterionWithCriterion:v11];

    goto LABEL_14;
  }
  long long v15 = objc_opt_class();
  long long v16 = [(MFMessageCriterion *)self spotlightQueryExpression];
  long long v17 = [v15 searchableItemResultForExpression:v16];

  long long v18 = [MEMORY[0x1E4F60DB8] indexSet];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  unsigned int v19 = objc_msgSend(v17, "identifiers", 0);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v31 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(v19);
        }
        objc_msgSend(v18, "addIndex:", objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "integerValue"));
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v31 count:16];
    }
    while (v20);
  }

  id v12 = [[MFMessageCriterion alloc] initWithType:24 qualifier:3 expression:0];
  [(MFMessageCriterion *)v12 setLibraryIdentifiers:v18];

LABEL_14:
  return v12;
}

id __89__MFMessageCriterion_LibraryAdditions___evaluateFTSCriterionWithIndexManager_mailboxIDs___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _evaluateFTSCriterionWithIndexManager:*(void *)(a1 + 32) mailboxIDs:*(void *)(a1 + 40)];
  return v2;
}

- (id)_collapsedMessageNumberCriterion:(id)a3 allMustBeSatisfied:(BOOL)a4 collapsedIndexes:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = a3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v5)
  {
    id v6 = 0;
    id v7 = 0;
    int64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v13 = [v12 criterionType];
        uint64_t v14 = [v12 libraryIdentifiers];
        uint64_t v15 = [v12 qualifier];
        if (v13 == 24 && v15 == 3 && v14 != 0)
        {
          uint64_t v18 = v9 + i;
          if (v6)
          {
            [v7 addIndex:v18];
            if (!v8)
            {
              unsigned int v19 = [v6 libraryIdentifiers];
              int64_t v8 = (void *)[v19 mutableCopy];
            }
            if (a4) {
              [v8 intersectIndexes:v14];
            }
            else {
              [v8 addIndexes:v14];
            }
          }
          else
          {
            uint64_t v20 = [MEMORY[0x1E4F28E60] indexSetWithIndex:v18];

            id v6 = v12;
            id v7 = (id)v20;
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      v9 += i;
    }
    while (v5);

    if (v8)
    {
      uint64_t v21 = [[MFMessageCriterion alloc] initWithType:24 qualifier:3 expression:0];
      [(MFMessageCriterion *)v21 setLibraryIdentifiers:v8];
      if (a5 && v21)
      {
        id v7 = v7;
        *a5 = v7;
      }
    }
    else
    {
      uint64_t v21 = 0;
    }
  }
  else
  {

    uint64_t v21 = 0;
    id v6 = 0;
    id v7 = 0;
    int64_t v8 = 0;
  }
  long long v22 = v21;

  return v22;
}

- (void)_addCriteriaSatisfyingPredicate:(void *)a3 toCollector:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (((unsigned int (*)(MFMessageCriterion *))a3)(self))
  {
    [v6 addObject:self];
  }
  else if ([(MFMessageCriterion *)self criterionType] == 25)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v7 = [(MFMessageCriterion *)self criteria];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v10++) _addCriteriaSatisfyingPredicate:a3 toCollector:v6];
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (id)criteriaSatisfyingPredicate:(void *)a3
{
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  [(MFMessageCriterion *)self _addCriteriaSatisfyingPredicate:a3 toCollector:v5];
  return v5;
}

- (id)extractedDateCriterion
{
  v2 = [(MFMessageCriterion *)self criteriaSatisfyingPredicate:_isDateCriterion];
  if ([v2 count])
  {
    int64_t v3 = +[MFMessageCriterion orCompoundCriterionWithCriteria:v2];
  }
  else
  {
    int64_t v3 = 0;
  }

  return v3;
}

- (id)extractedUnreadCriterion
{
  v2 = [(MFMessageCriterion *)self criteriaSatisfyingPredicate:_isUnreadCriterion];
  if ([v2 count])
  {
    int64_t v3 = +[MFMessageCriterion unreadMessageCriterion];
  }
  else
  {
    int64_t v3 = 0;
  }

  return v3;
}

- (EMSearchableIndexQueryExpression)spotlightQueryExpression
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  int64_t v3 = [(MFMessageCriterion *)self suggestion];
  BOOL v4 = [(MFMessageCriterion *)self _spotlightQuerySearchString:&v19 hasSuggestion:v3 != 0];
  id v5 = v19;

  id v6 = [NSString stringWithFormat:@"%@ = %@", *MEMORY[0x1E4F22C60], *MEMORY[0x1E4F443A8]];
  if (v5)
  {
    id v7 = [NSString alloc];
    uint64_t v8 = (void *)[v7 initWithFormat:@"%@ == '*'", *MEMORY[0x1E4F234E0]];
    uint64_t v9 = (void *)MEMORY[0x1E4F60468];
    v21[0] = v6;
    v21[1] = v8;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    uint64_t v11 = [v9 queryStringByJoiningQueries:v10 withOperand:2];

    id v6 = (void *)v11;
  }
  if (v4)
  {
    long long v12 = (void *)MEMORY[0x1E4F60468];
    v20[0] = v6;
    v20[1] = v4;
    long long v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    id v14 = [v12 queryStringByJoiningQueries:v13 withOperand:1];
  }
  else
  {
    id v14 = v6;
  }
  uint64_t v15 = (void *)MEMORY[0x1E4F60470];
  uint64_t v16 = [(MFMessageCriterion *)self suggestion];
  long long v17 = [v15 expressionWithQueryString:v14 searchString:v5 updatedSuggestion:v16];

  return (EMSearchableIndexQueryExpression *)v17;
}

- (id)_attributesForHeaderCriterion
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([(MFMessageCriterion *)self criterionType] != 1)
  {
    id v5 = 0;
    goto LABEL_10;
  }
  int64_t v3 = [(MFMessageCriterion *)self criterionIdentifier];
  if ([(id)*MEMORY[0x1E4F60738] isEqual:v3])
  {
    v8[0] = *MEMORY[0x1E4F235C0];
    BOOL v4 = v8;
  }
  else
  {
    if (([(id)*MEMORY[0x1E4F60740] isEqual:v3] & 1) == 0
      && ![(id)*MEMORY[0x1E4F60660] isEqual:v3])
    {
      id v5 = 0;
      goto LABEL_9;
    }
    uint64_t v7 = *MEMORY[0x1E4F234B0];
    BOOL v4 = &v7;
  }
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
LABEL_9:

LABEL_10:
  return v5;
}

- (id)_comparisonOperationMatchingValue:(id)a3 qualifier:(int64_t)a4
{
  id v5 = a3;
  id v6 = objc_msgSend(v5, "em_stringForQuotingWithCharacter:", 39);
  if ((unint64_t)a4 >= 9) {
    __assert_rtn("-[MFMessageCriterion(MFLibrarySearchableIndexAdditions) _comparisonOperationMatchingValue:qualifier:]", "LibrarySearchableIndex.m", 107, "0 && \"unexpected qualifier type\"");
  }
  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", off_1E5D3BE98[a4], v6);

  return v7;
}

- (id)_queryWithAttributes:(id)a3 matchingValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MFMessageCriterion *)self _queryWithAttributes:v6 matchingValue:v7 qualifier:[(MFMessageCriterion *)self qualifier]];

  return v8;
}

- (id)_queryWithAttributes:(id)a3 matchingValue:(id)a4 qualifier:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(MFMessageCriterion *)self _comparisonOperationMatchingValue:v9 qualifier:a5];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __102__MFMessageCriterion_MFLibrarySearchableIndexAdditions___queryWithAttributes_matchingValue_qualifier___block_invoke;
  v16[3] = &unk_1E5D3BDC0;
  id v11 = v10;
  id v17 = v11;
  long long v12 = objc_msgSend(v8, "ef_map:", v16);
  if (a5 == 7) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = 2;
  }
  id v14 = [MEMORY[0x1E4F60468] queryStringByJoiningQueries:v12 withOperand:v13];

  return v14;
}

id __102__MFMessageCriterion_MFLibrarySearchableIndexAdditions___queryWithAttributes_matchingValue_qualifier___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [NSString stringWithFormat:@"%@ %@", a2, *(void *)(a1 + 32)];
  return v2;
}

- (id)criteriaForSpotlightCriteria:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __86__MFMessageCriterion_MFLibrarySearchableIndexAdditions__criteriaForSpotlightCriteria___block_invoke;
  v20[3] = &unk_1E5D3BDE8;
  id v6 = v4;
  id v21 = v6;
  id v7 = v5;
  id v22 = v7;
  [v3 enumerateObjectsUsingBlock:v20];
  if ([v7 count])
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __86__MFMessageCriterion_MFLibrarySearchableIndexAdditions__criteriaForSpotlightCriteria___block_invoke_2;
    id v17 = &unk_1E5D3BE30;
    id v9 = v8;
    id v18 = v9;
    id v10 = v6;
    id v19 = v10;
    [v7 enumerateKeysAndObjectsUsingBlock:&v14];
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", &__block_literal_global_60, v14, v15, v16, v17);
    [v10 addObjectsFromArray:v9];
  }
  id v11 = v22;
  id v12 = v6;

  return v12;
}

void __86__MFMessageCriterion_MFLibrarySearchableIndexAdditions__criteriaForSpotlightCriteria___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (_criterionCannotUseSearchableIndex(v7))
  {
    [*(id *)(a1 + 32) addObject:v7];
  }
  else
  {
    id v3 = [v7 expression];
    id v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:v3];

    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v3];
    }
    id v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:v3];
    [v6 addObject:v7];
  }
}

void __86__MFMessageCriterion_MFLibrarySearchableIndexAdditions__criteriaForSpotlightCriteria___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id v4 = objc_msgSend(v7, "ef_map:", &__block_literal_global_11);
  if ([v4 containsObject:&unk_1EFF50B98]
    && [v4 containsObject:&unk_1EFF50BB0]
    && [v4 containsObject:&unk_1EFF50BC8]
    && [v4 containsObject:&unk_1EFF50BE0]
    && [v4 containsObject:&unk_1EFF50BF8])
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v7 firstObject];
    [v5 addObject:v6];
  }
  else
  {
    [*(id *)(a1 + 40) addObjectsFromArray:v7];
  }
}

id __86__MFMessageCriterion_MFLibrarySearchableIndexAdditions__criteriaForSpotlightCriteria___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v2, "criterionType"));

  return v3;
}

uint64_t __86__MFMessageCriterion_MFLibrarySearchableIndexAdditions__criteriaForSpotlightCriteria___block_invoke_58(uint64_t a1, void *a2)
{
  return [a2 setCriterionType:33];
}

- (id)_spotlightQuerySearchString:(id *)a3 hasSuggestion:(BOOL)a4
{
  v47[2] = *MEMORY[0x1E4F143B8];
  if ([(MFMessageCriterion *)self criterionType] == 25)
  {
    id v7 = [(MFMessageCriterion *)self criteria];
    id v8 = [(MFMessageCriterion *)self criteriaForSpotlightCriteria:v7];
    [(MFMessageCriterion *)self setCriteria:v8];
  }
  uint64_t v9 = [(MFMessageCriterion *)self criterionType];
  id v10 = 0;
  if (v9 > 24)
  {
    if (v9 > 39)
    {
      if ((unint64_t)(v9 - 40) >= 2) {
        goto LABEL_30;
      }
      goto LABEL_19;
    }
    switch(v9)
    {
      case 25:
        uint64_t v37 = 0;
        long long v38 = &v37;
        uint64_t v39 = 0x3032000000;
        long long v40 = __Block_byref_object_copy__3;
        long long v41 = __Block_byref_object_dispose__3;
        id v42 = 0;
        long long v28 = [(MFMessageCriterion *)self criteria];
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __99__MFMessageCriterion_MFLibrarySearchableIndexAdditions___spotlightQuerySearchString_hasSuggestion___block_invoke;
        v35[3] = &unk_1E5D3BE78;
        v35[4] = &v37;
        BOOL v36 = a4;
        long long v29 = objc_msgSend(v28, "ef_compactMap:", v35);

        if ([(MFMessageCriterion *)self allCriteriaMustBeSatisfied]) {
          uint64_t v30 = 1;
        }
        else {
          uint64_t v30 = 2;
        }
        id v10 = [MEMORY[0x1E4F60468] queryStringByJoiningQueries:v29 withOperand:v30];
        *a3 = (id) v38[5];

        _Block_object_dispose(&v37, 8);
        break;
      case 33:
        [(MFMessageCriterion *)self expression];
        id v10 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        break;
      case 35:
        if (!a4)
        {
          uint64_t v13 = *MEMORY[0x1E4F22B18];
          v46[0] = *MEMORY[0x1E4F22B30];
          v46[1] = v13;
          uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
          uint64_t v15 = [(MFMessageCriterion *)self expression];
          id v10 = [(MFMessageCriterion *)self _queryWithAttributes:v14 matchingValue:v15];

          break;
        }
        goto LABEL_29;
    }
  }
  else
  {
    if (v9 > 8)
    {
      if (v9 != 9)
      {
        if (v9 != 11)
        {
          if (v9 == 23)
          {
            uint64_t v44 = *MEMORY[0x1E4F23140];
            id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
            id v12 = [(MFMessageCriterion *)self expression];
            id v10 = [(MFMessageCriterion *)self _queryWithAttributes:v11 matchingValue:v12];
          }
          goto LABEL_30;
        }
        if (!a4)
        {
          id v21 = (void *)MEMORY[0x1E4F1C9C8];
          id v22 = [(MFMessageCriterion *)self expression];
          [v22 doubleValue];
          char v23 = objc_msgSend(v21, "dateWithTimeIntervalSince1970:");
          [v23 timeIntervalSinceReferenceDate];
          uint64_t v25 = v24;

          long long v26 = objc_msgSend(NSString, "stringWithFormat:", @"$time.absolute(%f)", v25);
          uint64_t v43 = *MEMORY[0x1E4F23700];
          long long v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
          id v10 = [(MFMessageCriterion *)self _queryWithAttributes:v27 matchingValue:v26];

          goto LABEL_30;
        }
LABEL_29:
        id v10 = 0;
        goto LABEL_30;
      }
LABEL_19:
      if (!a4)
      {
        uint64_t v18 = *MEMORY[0x1E4F234A8];
        v47[0] = *MEMORY[0x1E4F234B0];
        v47[1] = v18;
        id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
        uint64_t v20 = [(MFMessageCriterion *)self expression];
        id v10 = [(MFMessageCriterion *)self _queryWithAttributes:v19 matchingValue:v20];

        goto LABEL_30;
      }
      goto LABEL_29;
    }
    if (v9 == 1)
    {
      if (!a4)
      {
        v33 = [(MFMessageCriterion *)self _attributesForHeaderCriterion];
        if ([v33 count])
        {
          uint64_t v34 = [(MFMessageCriterion *)self expression];
          id v10 = [(MFMessageCriterion *)self _queryWithAttributes:v33 matchingValue:v34];
        }
        else
        {
          id v10 = 0;
        }

        goto LABEL_30;
      }
      goto LABEL_29;
    }
    if (v9 == 2)
    {
      uint64_t v45 = *MEMORY[0x1E4F235F8];
      uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
      id v17 = [(MFMessageCriterion *)self expression];
      id v10 = [(MFMessageCriterion *)self _queryWithAttributes:v16 matchingValue:v17];
    }
  }
LABEL_30:
  if ([v10 length] && -[MFMessageCriterion qualifier](self, "qualifier") == 4)
  {
    uint64_t v31 = [NSString stringWithFormat:@"!(%@)", v10];

    id v10 = (void *)v31;
  }
  return v10;
}

id __99__MFMessageCriterion_MFLibrarySearchableIndexAdditions___spotlightQuerySearchString_hasSuggestion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v2 + 40);
  id v3 = [a2 _spotlightQuerySearchString:&obj hasSuggestion:*(unsigned __int8 *)(a1 + 40)];
  objc_storeStrong((id *)(v2 + 40), obj);
  return v3;
}

- (NSString)ef_publicDescription
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(MFMessageCriterion *)self descriptionWithDepth:0 redacted:1];
  id v6 = [v3 stringWithFormat:@"<%@: %p> %@", v4, self, v5];

  return (NSString *)v6;
}

- (id)unreadCountCriterion
{
  BOOL v2 = [(MFMessageCriterion *)self useFlaggedForUnreadCount];
  id v3 = [MFMessageCriterion alloc];
  if (v2) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 7;
  }
  id v5 = MFMessageIsFlagged;
  if (!v2) {
    id v5 = MessageIsRead;
  }
  id v6 = [(MFMessageCriterion *)v3 initWithType:27 qualifier:v4 expression:*v5];
  return v6;
}

+ (id)criteriaFromDefaultsArray:(id)a3
{
  id v3 = [a1 criteriaFromDefaultsArray:a3 removingRecognizedKeys:1];
  return v3;
}

+ (id)defaultsArrayFromCriteria:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  uint64_t v4 = 0;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "dictionaryRepresentation", (void)v10);
        if (v8)
        {
          if (!v4)
          {
            uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
          }
          [v4 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v4;
}

+ (id)defaultsDictionaryFromCriterion:(id)a3
{
  id v3 = [a3 dictionaryRepresentation];
  return v3;
}

- (MFMessageCriterion)initWithCriterion:(id)a3 expression:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MFMessageCriterion *)self init];
  uint64_t v9 = v8;
  if (v8)
  {
    [(MFMessageCriterion *)v8 setCriterionIdentifier:v6];
    [(MFMessageCriterion *)v9 setExpression:v7];
  }

  return v9;
}

- (MFMessageCriterion)initWithDictionary:(id)a3
{
  return [(MFMessageCriterion *)self initWithDictionary:a3 andRemoveRecognizedKeysIfMutable:1];
}

- (MFMessageCriterion)initWithDictionary:(id)a3 andRemoveRecognizedKeysIfMutable:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  uint64_t v30 = [v32 objectForKeyedSubscript:@"Qualifier"];
  uint64_t v31 = [v32 objectForKeyedSubscript:@"Header"];
  id v6 = [v32 objectForKeyedSubscript:@"Expression"];
  id v7 = [(MFMessageCriterion *)self initWithCriterion:v31 expression:v6];

  if (v7)
  {
    id obj = [v32 objectForKeyedSubscript:@"CriterionUniqueId"];
    if (obj) {
      objc_storeStrong((id *)&v7->_uniqueId, obj);
    }
    [(MFMessageCriterion *)v7 setQualifier:[(MFMessageCriterion *)v7 messageRuleQualifierForString:v30]];
    -[MFMessageCriterion setAllCriteriaMustBeSatisfied:](v7, "setAllCriteriaMustBeSatisfied:", objc_msgSend(v32, "mf_BOOLForKey:", @"AllCriteriaMustBeSatisfied"));
    if ([(MFMessageCriterion *)v7 criterionType] == 7)
    {
      id v8 = +[MailAccount accountWithPath:v7->_expression];

      if (!v8)
      {
        uint64_t v9 = [v32 objectForKey:@"AccountURL"];
        if (v9)
        {
          long long v10 = [MEMORY[0x1E4F1CB10] URLWithString:v9];
          long long v11 = +[MailAccount infoForURL:v10];

          long long v12 = [v11 objectForKey:@"Account"];
          long long v13 = v12;
          if (v12)
          {
            uint64_t v14 = [v12 path];
            [(MFMessageCriterion *)v7 setExpression:v14];
          }
        }
      }
    }
    long long v29 = [v32 objectForKey:@"Name"];
    if (v29) {
      [(MFMessageCriterion *)v7 setName:v29];
    }
    if ([(MFMessageCriterion *)v7 criterionType] == 25)
    {
      long long v27 = [v32 objectForKey:@"Criteria"];
      uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v27, "count"));
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v16 = v27;
      id v17 = 0;
      uint64_t v18 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v34;
        do
        {
          uint64_t v20 = 0;
          id v21 = v17;
          do
          {
            if (*(void *)v34 != v19) {
              objc_enumerationMutation(v16);
            }
            id v17 = [[MFMessageCriterion alloc] initWithDictionary:*(void *)(*((void *)&v33 + 1) + 8 * v20) andRemoveRecognizedKeysIfMutable:v4];

            [v15 addObject:v17];
            ++v20;
            id v21 = v17;
          }
          while (v18 != v20);
          uint64_t v18 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
        }
        while (v18);
      }

      [(MFMessageCriterion *)v7 setCriteria:v15];
    }
    else
    {
      unint64_t v22 = [(MFMessageCriterion *)v7 criterionType];
      if (v22 <= 0x30 && ((1 << v22) & 0x1880000001C00) != 0)
      {
        v7->_dateUnitType = (int)objc_msgSend(v32, "mf_integerForKey:", @"DateUnitType");
        if (objc_msgSend(v32, "mf_BOOLForKey:", @"DateIsRelative")) {
          char v23 = 2;
        }
        else {
          char v23 = 0;
        }
        *((unsigned char *)v7 + 72) = *((unsigned char *)v7 + 72) & 0xFD | v23;
      }
    }
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v24 = v32;
        [v24 removeObjectForKey:@"Qualifier"];
        [v24 removeObjectForKey:@"Header"];
        [v24 removeObjectForKey:@"Expression"];
      }
    }
    uint64_t v25 = v7;
  }
  return v7;
}

- (unint64_t)hash
{
  if ([(MFMessageCriterion *)self criterionType] == 25) {
    [(MFMessageCriterion *)self criteria];
  }
  else {
  id v3 = [(MFMessageCriterion *)self expression];
  }
  unint64_t v4 = [v3 hash];

  return v4;
}

- (id)descriptionWithDepth:(unsigned int)a3 redacted:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [MEMORY[0x1E4F28E78] stringWithCapacity:4 * a3];
  unsigned int v8 = a3 + 1;
  while (--v8)
    [v7 appendString:@"    "];
  if ([(MFMessageCriterion *)self criterionType] == 25)
  {
    uint64_t v9 = [(MFMessageCriterion *)self criteria];
    long long v10 = [MEMORY[0x1E4F28E78] string];
    uint64_t v11 = [v9 count];
    if (v11)
    {
      [v10 appendString:@"\n"];
      uint64_t v12 = a3 + 1;
      uint64_t v13 = v11 - 1;
      do
      {
        uint64_t v14 = [v9 objectAtIndex:v13];
        uint64_t v15 = [v14 descriptionWithDepth:v12 redacted:v4];
        [v10 appendString:v15];

        --v13;
      }
      while (v13 != -1);
    }
    else
    {
      [v10 appendString:@"(none)"];
    }
    uint64_t v25 = (void *)0x1E4F29000;
    long long v26 = NSString;
    char v23 = [(MFMessageCriterion *)self criterionIdentifier];
    id v24 = [(MFMessageCriterion *)self name];
    if (v24)
    {
      long long v27 = NSString;
      uint64_t v25 = [(MFMessageCriterion *)self name];
      long long v28 = [v27 stringWithFormat:@"%@  Name: %@\n", v7, v25];
    }
    else
    {
      long long v28 = &stru_1EFF11268;
    }
    BOOL v29 = [(MFMessageCriterion *)self allCriteriaMustBeSatisfied];
    uint64_t v30 = @"No";
    if (v29) {
      uint64_t v30 = @"Yes";
    }
    uint64_t v20 = [v26 stringWithFormat:@"%@Criterion: %@\n%@%@  All criteria must be satisfied: %@\n%@  Criteria: %@", v7, v23, v28, v7, v30, v7, v10];
    if (v24)
    {
    }
LABEL_30:

LABEL_31:
    goto LABEL_32;
  }
  if ([(MFMessageCriterion *)self criterionType] != 26)
  {
    id v21 = NSString;
    uint64_t v9 = [(MFMessageCriterion *)self criterionIdentifier];
    long long v10 = [(MFMessageCriterion *)self _qualifierString];
    if (v4)
    {
      unint64_t v22 = (void *)MEMORY[0x1E4F60E00];
      char v23 = [(MFMessageCriterion *)self expression];
      id v24 = [v22 partiallyRedactedStringForString:v23];
    }
    else
    {
      id v24 = [(MFMessageCriterion *)self expression];
      char v23 = v24;
    }
    uint64_t v31 = [(MFMessageCriterion *)self name];
    if (v31)
    {
      id v32 = NSString;
      long long v35 = [(MFMessageCriterion *)self name];
      long long v33 = [v32 stringWithFormat:@"%@  Name: %@\n", v7, v35];
    }
    else
    {
      long long v33 = &stru_1EFF11268;
    }
    uint64_t v20 = [v21 stringWithFormat:@"%@Criterion: %@\n%@  Qualifier: %@\n%@  Expression: %@\n%@", v7, v9, v7, v10, v7, v24, v33];
    if (v31)
    {
    }
    if (!v4) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  id v16 = [(MFMessageCriterion *)self criteria];
  uint64_t v9 = (void *)[v16 count];

  if (v9)
  {
    id v17 = [(MFMessageCriterion *)self criteria];
    uint64_t v18 = [v17 firstObject];
    uint64_t v9 = [v18 descriptionWithDepth:a3 + 1 redacted:v4];
  }
  uint64_t v19 = NSString;
  long long v10 = [(MFMessageCriterion *)self criterionIdentifier];
  uint64_t v20 = [v19 stringWithFormat:@"%@Criterion: %@\n%@ Sub-Criterion: \n%@", v7, v10, v7, v9];
LABEL_32:

  return v20;
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(MFMessageCriterion *)self descriptionWithDepth:0 redacted:0];
  id v6 = [v3 stringWithFormat:@"<%@: %p> %@", v4, self, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
  uint64_t v4 = [(MFMessageCriterion *)self _qualifierString];
  [v3 setObject:self->_uniqueId forKey:@"CriterionUniqueId"];
  criterionIdentifier = self->_criterionIdentifier;
  if (criterionIdentifier && ![(NSString *)criterionIdentifier isEqualToString:&stru_1EFF11268]) {
    [v3 setObject:self->_criterionIdentifier forKey:@"Header"];
  }
  expression = self->_expression;
  if (expression && ![(NSString *)expression isEqualToString:&stru_1EFF11268]) {
    [v3 setObject:self->_expression forKey:@"Expression"];
  }
  if (v4 && ([v4 isEqualToString:&stru_1EFF11268] & 1) == 0) {
    [v3 setObject:v4 forKey:@"Qualifier"];
  }
  if ([(MFMessageCriterion *)self criterionType] == 7)
  {
    uint64_t v7 = +[MailAccount accountWithPath:self->_expression];
    unsigned int v8 = (void *)v7;
    if (v7)
    {
      long long v27 = @"Account";
      v28[0] = v7;
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
      long long v10 = +[MailAccount URLForInfo:v9];

      uint64_t v11 = [v10 absoluteString];
      [v3 setObject:v11 forKey:@"AccountURL"];
    }
  }
  name = self->_name;
  if (name && ![(NSString *)name isEqualToString:&stru_1EFF11268]) {
    [v3 setObject:self->_name forKey:@"Name"];
  }
  if ([(MFMessageCriterion *)self criterionType] == 25)
  {
    if ([(NSArray *)self->_criteria count])
    {
      uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_criteria, "count"));
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      uint64_t v14 = self->_criteria;
      uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v23 != v16) {
              objc_enumerationMutation(v14);
            }
            uint64_t v18 = [*(id *)(*((void *)&v22 + 1) + 8 * i) dictionaryRepresentation];
            [v13 addObject:v18];
          }
          uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v15);
      }

      [v3 setObject:v13 forKey:@"Criteria"];
    }
    objc_msgSend(v3, "mf_setBool:forKey:", *((unsigned char *)self + 72) & 1, @"AllCriteriaMustBeSatisfied");
  }
  else
  {
    unint64_t v19 = [(MFMessageCriterion *)self criterionType];
    if (v19 <= 0x30 && ((1 << v19) & 0x1880000001C00) != 0)
    {
      objc_msgSend(v3, "mf_setBool:forKey:", (*((unsigned __int8 *)self + 72) >> 1) & 1, @"DateIsRelative");
      uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"%d", self->_dateUnitType);
      [v3 setObject:v20 forKey:@"DateUnitType"];
    }
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  int64_t v6 = [(MFMessageCriterion *)self criterionType];
  int64_t v7 = [(MFMessageCriterion *)self qualifier];
  unsigned int v8 = [(MFMessageCriterion *)self expression];
  uint64_t v9 = [v5 initWithType:v6 qualifier:v7 expression:v8];

  uint64_t v10 = [(NSString *)self->_criterionIdentifier copyWithZone:a3];
  uint64_t v11 = *(void **)(v9 + 8);
  *(void *)(v9 + 8) = v10;

  uint64_t v12 = [(NSString *)self->_name copyWithZone:a3];
  uint64_t v13 = *(void **)(v9 + 32);
  *(void *)(v9 + 32) = v12;

  uint64_t v14 = [(NSString *)self->_uniqueId copyWithZone:a3];
  uint64_t v15 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v14;

  uint64_t v16 = [(NSArray *)self->_criteria copyWithZone:a3];
  id v17 = *(void **)(v9 + 56);
  *(void *)(v9 + 56) = v16;

  uint64_t v18 = [(NSArray *)self->_requiredHeaders copyWithZone:a3];
  unint64_t v19 = *(void **)(v9 + 80);
  *(void *)(v9 + 80) = v18;

  *(void *)(v9 + 64) = self->_dateUnitType;
  char v20 = *(unsigned char *)(v9 + 72) & 0xFE | *((unsigned char *)self + 72) & 1;
  *(unsigned char *)(v9 + 72) = v20;
  *(unsigned char *)(v9 + 72) = v20 & 0xFD | *((unsigned char *)self + 72) & 2;
  objc_storeStrong((id *)(v9 + 112), self->_libraryIdentifiers);
  *(unsigned char *)(v9 + 88) = self->_preferFullTextSearch;
  *(unsigned char *)(v9 + 89) = self->_useFlaggedForUnreadCount;
  *(unsigned char *)(v9 + 72) = *(unsigned char *)(v9 + 72) & 0xFB | *((unsigned char *)self + 72) & 4;
  *(unsigned char *)(v9 + 90) = self->_expressionIsSanitized;
  return (id)v9;
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
  v26[5] = *MEMORY[0x1E4F143B8];
  requiredHeaders = self->_requiredHeaders;
  if (!requiredHeaders)
  {
    _MFLockGlobalLock();
    if (self->_requiredHeaders)
    {
LABEL_25:
      _MFUnlockGlobalLock();
      requiredHeaders = self->_requiredHeaders;
      goto LABEL_26;
    }
    uint64_t v4 = [(MFMessageCriterion *)self criterionType];
    if (v4 <= 19)
    {
      if ((unint64_t)(v4 - 15) < 2 || v4 == 9)
      {
        uint64_t v6 = *MEMORY[0x1E4F60660];
        v26[0] = *MEMORY[0x1E4F60740];
        v26[1] = v6;
        uint64_t v7 = *MEMORY[0x1E4F60718];
        v26[2] = *MEMORY[0x1E4F60730];
        v26[3] = v7;
        v26[4] = *MEMORY[0x1E4F60650];
        uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:5];
        goto LABEL_23;
      }
    }
    else
    {
      if ((unint64_t)(v4 - 20) < 3)
      {
        uint64_t v23 = *MEMORY[0x1E4F60770];
        uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
LABEL_23:
        uint64_t v10 = (NSArray *)v5;
LABEL_24:
        uint64_t v16 = self->_requiredHeaders;
        self->_requiredHeaders = v10;

        goto LABEL_25;
      }
      if (v4 == 40)
      {
        uint64_t v25 = *MEMORY[0x1E4F60740];
        uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
        goto LABEL_23;
      }
      if (v4 == 41)
      {
        uint64_t v24 = *MEMORY[0x1E4F60660];
        uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
        goto LABEL_23;
      }
    }
    unsigned int v8 = [(MFMessageCriterion *)self criterionIdentifier];
    uint64_t v9 = [v8 componentsSeparatedByString:@" or "];

    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    uint64_t v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v19;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = objc_msgSend(MEMORY[0x1E4F73508], "uniqueHeaderKeyStringForString:", *(void *)(*((void *)&v18 + 1) + 8 * v14), (void)v18);
          if (v15) {
            [(NSArray *)v10 addObject:v15];
          }

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    goto LABEL_24;
  }
LABEL_26:
  return requiredHeaders;
}

- (BOOL)_evaluateCompoundCriterion:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(MFMessageCriterion *)self allCriteriaMustBeSatisfied];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [(MFMessageCriterion *)self criteria];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v6);
      }
      int v10 = [*(id *)(*((void *)&v12 + 1) + 8 * v9) doesMessageSatisfyCriterion:v4];
      if (v5 != v10) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)_evaluateNotCriterion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v5 = [(MFMessageCriterion *)self criteria];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * i) doesMessageSatisfyCriterion:v4])
        {
          BOOL v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (BOOL)_evaluateFlagCriterion:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(MFMessageCriterion *)self expression];
  long long v11 = v5;
  v12[0] = &unk_1EFF50D48;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

  unint64_t v7 = MFMessageFlagsByApplyingDictionary(0, v6);
  uint64_t v8 = [v4 messageFlags];
  if ([(MFMessageCriterion *)self qualifier] == 3) {
    BOOL v9 = (v8 & v7) != 0;
  }
  else {
    BOOL v9 = (v8 & v7) == 0;
  }

  return v9;
}

- (BOOL)_evaluateFlagColorCriterion:(id)a3
{
  id v4 = a3;
  int v5 = [(MFMessageCriterion *)self expression];
  uint64_t v6 = [v5 integerValue];

  unint64_t v7 = [v4 messageFlags];
  LOBYTE(self) = (((v7 >> 41) & 7) == v6) & (v7 >> 4) ^ ([(MFMessageCriterion *)self qualifier] != 3);

  return (char)self;
}

- (BOOL)_evaluateHeaderCriterion:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v21 = v4;
  int v5 = [(MFMessageCriterion *)self expression];
  long long v28 = v5;
  int64_t v31 = [(MFMessageCriterion *)self qualifier];
  if (v31 == 3 || v5 && [v5 length])
  {
    uint64_t v6 = [v4 headers];
    [(MFMessageCriterion *)self _headersRequiredForEvaluation];
    uint64_t v25 = (void *)v6;
    int v7 = v31 == 4;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v8)
    {
      uint64_t v24 = *(void *)v33;
      LOBYTE(v9) = 1;
LABEL_6:
      uint64_t v23 = v8;
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v33 != v24) {
          objc_enumerationMutation(obj);
        }
        if (!v9) {
          break;
        }
        uint64_t v11 = *(void *)(*((void *)&v32 + 1) + 8 * v10);
        uint64_t v30 = (void *)[v25 copyHeadersForKey:v11];
        char v27 = [MEMORY[0x1E4F73508] isStructuredHeaderKey:v11];
        unint64_t v29 = [v30 count];
        uint64_t v26 = v10;
        if (v31 != 3 || v29)
        {
          if (v29)
          {
            uint64_t v12 = 0;
            do
            {
              long long v13 = [v30 objectAtIndex:v12];
              if (v13 && [v28 length])
              {
                if (v27)
                {
                  long long v14 = [MEMORY[0x1E4F73508] addressListFromEncodedString:v13];
                  long long v15 = objc_msgSend(v14, "ef_flatMap:", &__block_literal_global_16);
                }
                else
                {
                  long long v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v13, 0);
                }
                unint64_t v16 = [v15 count];
                if (v16)
                {
                  unint64_t v17 = 1;
                  do
                  {
                    long long v18 = [v15 objectAtIndex:v17 - 1];
                    BOOL v9 = [(MFMessageCriterion *)self _evaluatePartOfStructure:v18];

                    if (v31 == 4) {
                      v7 &= v9;
                    }
                    else {
                      int v7 = v9;
                    }
                    if (v31 != 4) {
                      LOBYTE(v9) = !v9;
                    }
                    if (v17 >= v16) {
                      break;
                    }
                    ++v17;
                  }
                  while (v9);
                }
                else
                {
                  LOBYTE(v9) = 1;
                }
              }
              else
              {
                LOBYTE(v9) = 1;
              }
            }
            while (++v12 < v29 && v9);
            goto LABEL_39;
          }
        }
        else
        {
          v7 |= [v28 length] == 0;
        }
        LOBYTE(v9) = 1;
LABEL_39:

        uint64_t v10 = v26 + 1;
        if (v26 + 1 == v23)
        {
          uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
          if (v8) {
            goto LABEL_6;
          }
          break;
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

id __47__MFMessageCriterion__evaluateHeaderCriterion___block_invoke(uint64_t a1, void *a2)
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = [v2 emailAddressValue];
  id v4 = [v3 displayName];
  int v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v2 stringValue];
  }
  int v7 = v6;

  id v8 = v2;
  BOOL v9 = [v8 emailAddressValue];
  uint64_t v10 = [v9 simpleAddress];
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [v8 stringValue];
  }
  long long v13 = v12;

  if (v13 && v7)
  {
    v20[0] = v13;
    v20[1] = v7;
    long long v14 = (void **)v20;
    uint64_t v15 = 2;
LABEL_15:
    unint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:v15];
    goto LABEL_16;
  }
  if (v13)
  {
    long long v19 = v13;
    long long v14 = &v19;
LABEL_14:
    uint64_t v15 = 1;
    goto LABEL_15;
  }
  if (v7)
  {
    long long v18 = v7;
    long long v14 = &v18;
    goto LABEL_14;
  }
  unint64_t v16 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_16:

  return v16;
}

- (BOOL)_evaluateSenderHeaderCriterion:(id)a3
{
  id v4 = [a3 firstSender];
  int v5 = [v4 emailAddressValue];
  id v6 = [v5 displayName];
  int v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [v4 stringValue];
  }
  BOOL v9 = v8;

  id v10 = v4;
  uint64_t v11 = [v10 emailAddressValue];
  id v12 = [v11 simpleAddress];
  long long v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [v10 stringValue];
  }
  uint64_t v15 = v14;

  BOOL v16 = [(MFMessageCriterion *)self _evaluatePartOfStructure:v15]
     || [(MFMessageCriterion *)self _evaluatePartOfStructure:v9];

  return v16;
}

- (BOOL)_evaluatePartOfStructure:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int v5 = [(MFMessageCriterion *)self expression];
    int64_t v6 = [(MFMessageCriterion *)self qualifier];
    int v7 = 0;
    uint64_t v8 = 393;
    switch(v6)
    {
      case 1:
        goto LABEL_9;
      case 2:
        int v7 = 0;
        uint64_t v8 = 397;
        goto LABEL_9;
      case 3:
        BOOL v9 = [v4 localizedCaseInsensitiveCompare:v5] == 0;
        goto LABEL_13;
      case 4:
        int v7 = 1;
        goto LABEL_8;
      case 7:
        BOOL v9 = [v4 localizedCaseInsensitiveCompare:v5] != 0;
        goto LABEL_13;
      default:
        int v7 = 0;
LABEL_8:
        uint64_t v8 = 385;
LABEL_9:
        uint64_t v10 = [v4 length];
        uint64_t v11 = [MEMORY[0x1E4F1CA20] currentLocale];
        uint64_t v12 = objc_msgSend(v4, "rangeOfString:options:range:locale:", v5, v8, 0, v10, v11);

        if (v7) {
          BOOL v9 = v12 == 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          BOOL v9 = v12 != 0x7FFFFFFFFFFFFFFFLL;
        }
LABEL_13:

        break;
    }
  }
  else
  {
    BOOL v9 = [(MFMessageCriterion *)self qualifier] == 4;
  }

  return v9;
}

- (BOOL)_evaluateAddressBookCriterion:(id)a3
{
  return 0;
}

- (BOOL)_evaluateFullNameCriterion:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v22 = [a3 headers];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = objc_msgSend(v22, "copyAddressListForTo", v3);
  long long v21 = v4;
  if ([v4 count]) {
    [v3 addObjectsFromArray:v4];
  }
  int v5 = (void *)[v22 copyAddressListForCc];
  if ([v5 count]) {
    [v3 addObjectsFromArray:v5];
  }
  int64_t v6 = [MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(id *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v12 = [v11 emailAddressValue];
        long long v13 = [v12 displayName];
        id v14 = v13;
        if (v13)
        {
          id v15 = v13;
        }
        else
        {
          id v15 = [v11 stringValue];
        }
        BOOL v16 = v15;

        unint64_t v17 = [v16 lowercaseString];

        if (v17 && [v11 caseInsensitiveCompare:v17]) {
          [v6 addObject:v17];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }

  BOOL v18 = [(MFMessageCriterion *)self criterionType] != 15;
  return v18;
}

- (BOOL)_evaluateIsDigitallySignedCriterion:(id)a3
{
  id v3 = a3;
  id v4 = [v3 messageBodyUpdatingFlags:0];
  [v3 calculateAttachmentInfoFromBody:v4];

  unint64_t v5 = ((unint64_t)[v3 messageFlags] >> 23) & 1;
  return v5;
}

- (BOOL)_evaluateIsEncryptedCriterion:(id)a3
{
  id v3 = a3;
  id v4 = [v3 messageBodyUpdatingFlags:0];
  [v3 calculateAttachmentInfoFromBody:v4];

  unint64_t v5 = ((unint64_t)[v3 messageFlags] >> 3) & 1;
  return v5;
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
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(MFMessageCriterion *)self expression];
  int64_t v6 = v5;
  if (v5 && ([v5 isEqualToString:&stru_1EFF11268] & 1) == 0)
  {
    long long v21 = [v4 messageBodyUpdatingFlags:0];
    uint64_t v8 = +[MFActivityMonitor currentMonitor];
    long long v20 = [v8 error];
    [v8 setError:0];
    [v4 calculateAttachmentInfoFromBody:v21];
    uint64_t v9 = [v8 error];
    uint64_t v10 = [v9 code];

    [v8 setError:v20];
    if ((unint64_t)(v10 - 1037) <= 0xFFFFFFFFFFFFFFFDLL && [v4 numberOfAttachments])
    {
      int64_t v11 = [(MFMessageCriterion *)self qualifier];
      [v21 attachments];
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v23;
LABEL_8:
        uint64_t v15 = 0;
        while (1)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v12);
          }
          BOOL v16 = [*(id *)(*((void *)&v22 + 1) + 8 * v15) mimePart];
          unint64_t v17 = [v16 attachmentFilename];

          switch(v11)
          {
            case 1:
              char v18 = [v17 hasPrefix:v6];
              break;
            case 2:
              char v18 = [v17 hasSuffix:v6];
              break;
            case 3:
              char v18 = [v17 isEqualToString:v6];
              break;
            default:
              BOOL v7 = v11 == 4 * ([v17 rangeOfString:v6 options:1] == 0x7FFFFFFFFFFFFFFFLL);
              goto LABEL_24;
          }
          if (v18)
          {
            BOOL v7 = 1;
LABEL_24:

            goto LABEL_25;
          }

          if (v13 == ++v15)
          {
            uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
            if (v13) {
              goto LABEL_8;
            }
            break;
          }
        }
      }
      BOOL v7 = 0;
LABEL_25:
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_evaluateAccountCriterion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(MFMessageCriterion *)self expression];
  int64_t v6 = +[MailAccount accountWithPath:v5];
  BOOL v7 = [v4 account];
  BOOL v8 = v7 == v6;

  return v8;
}

- (BOOL)_evaluateAddressHistoryCriterion:(id)a3
{
  return 0;
}

- (BOOL)_evaluateDateCriterion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(MFMessageCriterion *)self expression];
  int64_t v6 = [(MFMessageCriterion *)self qualifier];
  int64_t v7 = [(MFMessageCriterion *)self criterionType];
  if (!v5) {
    goto LABEL_25;
  }
  uint64_t v8 = v7;
  if ((int)[v5 intValue] < 1) {
    goto LABEL_25;
  }
  uint64_t v9 = 0;
  BOOL v10 = 0;
  if (v8 > 46)
  {
    switch(v8)
    {
      case '/':
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_25;
        }
        id v12 = [v4 followUp];
        uint64_t v13 = [v12 startDate];
        break;
      case '0':
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_25;
        }
        id v12 = [v4 followUp];
        uint64_t v13 = [v12 endDate];
        break;
      case '1':
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = [v4 sendLaterDate];
          goto LABEL_16;
        }
LABEL_25:
        BOOL v10 = 0;
        uint64_t v9 = 0;
        goto LABEL_26;
      default:
        goto LABEL_26;
    }
    uint64_t v9 = (void *)v13;

LABEL_22:
    [v9 timeIntervalSince1970];
    double v15 = v14;
    [v5 doubleValue];
    double v17 = v16;
    if ([(MFMessageCriterion *)self dateIsRelative])
    {
      uint64_t v18 = [v5 integerValue];
      long long v19 = objc_opt_new();
      int64_t v20 = [(MFMessageCriterion *)self dateUnits];
      uint64_t v21 = -v18;
      switch(v20)
      {
        case 0:
          [v19 setSecond:v21];
          break;
        case 1:
          [v19 setDay:v21];
          break;
        case 2:
          [v19 setWeekOfYear:v21];
          break;
        case 3:
          [v19 setMonth:v21];
          break;
        case 4:
          [v19 setYear:v21];
          break;
        default:
          break;
      }
      long long v23 = objc_msgSend(MEMORY[0x1E4F1C9A8], "currentCalendar", v21);
      long long v24 = objc_opt_new();
      long long v25 = [v23 dateByAddingComponents:v19 toDate:v24 options:0];

      [v25 timeIntervalSince1970];
      double v17 = v26;
    }
    else if (v6 != 6)
    {
      if (v6 != 5 || v15 > v17) {
        goto LABEL_37;
      }
LABEL_30:
      BOOL v10 = 1;
      goto LABEL_26;
    }
    if (v15 < v17)
    {
LABEL_37:
      BOOL v10 = 0;
      goto LABEL_26;
    }
    goto LABEL_30;
  }
  switch(v8)
  {
    case 10:
      uint64_t v11 = [v4 dateSent];
      goto LABEL_16;
    case 11:
      goto LABEL_14;
    case 12:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = [v4 displayDate];
LABEL_16:
        uint64_t v9 = (void *)v11;
        goto LABEL_22;
      }
LABEL_14:
      uint64_t v11 = [v4 dateReceived];
      goto LABEL_16;
  }
LABEL_26:

  return v10;
}

- (BOOL)_evaluateConversationIDCriterion:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(MFMessageCriterion *)self expression];
  uint64_t v6 = [v5 longLongValue];

  if ([(MFMessageCriterion *)self qualifier] == 3)
  {
    BOOL v7 = [v4 conversationID] == v6;
  }
  else if ([(MFMessageCriterion *)self qualifier] == 7)
  {
    BOOL v7 = [v4 conversationID] != v6;
  }
  else
  {
    uint64_t v8 = MFLogGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218240;
      int64_t v11 = [(MFMessageCriterion *)self qualifier];
      __int16 v12 = 2048;
      int64_t v13 = [(MFMessageCriterion *)self criterionType];
      _os_log_impl(&dword_1A7EFF000, v8, OS_LOG_TYPE_DEFAULT, "#Warning Unhandled qualifier %ld for type %ld", (uint8_t *)&v10, 0x16u);
    }

    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_evaluateMailboxCriterion:(id)a3
{
  id v4 = a3;
  if ([(MFMessageCriterion *)self qualifier] == 3)
  {
    unint64_t v5 = [(MFMessageCriterion *)self expression];
    uint64_t v6 = [v4 originalMailboxURL];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)_evaluateReadLaterCriterion:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 readLater];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_evaluateSenderBucketCriterion:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v4, "senderBucket"));
    uint64_t v6 = [v5 stringValue];

    if ([(MFMessageCriterion *)self qualifier] == 8)
    {
      char v7 = [(MFMessageCriterion *)self expression];
      uint64_t v8 = [v7 componentsSeparatedByString:@", "];

      char v9 = [v8 containsObject:v6];
    }
    else
    {
      if ([(MFMessageCriterion *)self qualifier] != 3)
      {
        BOOL v10 = 0;
        goto LABEL_9;
      }
      uint64_t v8 = [(MFMessageCriterion *)self expression];
      char v9 = [v8 isEqualToString:v6];
    }
    BOOL v10 = v9;

LABEL_9:
    goto LABEL_10;
  }
  BOOL v10 = 0;
LABEL_10:

  return v10;
}

- (BOOL)doesMessageSatisfyCriterion:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = 1;
  switch([(MFMessageCriterion *)self criterionType])
  {
    case 1:
    case 9:
    case 40:
    case 41:
      BOOL v6 = [(MFMessageCriterion *)self _evaluateHeaderCriterion:v4];
      goto LABEL_23;
    case 3:
    case 4:
      BOOL v6 = [(MFMessageCriterion *)self _evaluateAddressBookCriterion:v4];
      goto LABEL_23;
    case 7:
      BOOL v6 = [(MFMessageCriterion *)self _evaluateAccountCriterion:v4];
      goto LABEL_23;
    case 8:
      break;
    case 10:
    case 11:
    case 12:
    case 47:
    case 48:
    case 49:
      BOOL v6 = [(MFMessageCriterion *)self _evaluateDateCriterion:v4];
      goto LABEL_23;
    case 13:
    case 14:
      BOOL v6 = [(MFMessageCriterion *)self _evaluateAddressHistoryCriterion:v4];
      goto LABEL_23;
    case 15:
    case 16:
      BOOL v6 = [(MFMessageCriterion *)self _evaluateFullNameCriterion:v4];
      goto LABEL_23;
    case 17:
      BOOL v6 = [(MFMessageCriterion *)self _evaluateIsDigitallySignedCriterion:v4];
      goto LABEL_23;
    case 18:
      BOOL v6 = [(MFMessageCriterion *)self _evaluateIsEncryptedCriterion:v4];
      goto LABEL_23;
    case 19:
      BOOL v6 = [(MFMessageCriterion *)self _evaluateAttachmentCriterion:v4];
      goto LABEL_23;
    case 20:
      BOOL v6 = [(MFMessageCriterion *)self _evaluatePriorityIsHighCriterion:v4];
      goto LABEL_23;
    case 21:
      BOOL v6 = [(MFMessageCriterion *)self _evaluatePriorityIsNormalCriterion:v4];
      goto LABEL_23;
    case 22:
      BOOL v6 = [(MFMessageCriterion *)self _evaluatePriorityIsLowCriterion:v4];
      goto LABEL_23;
    case 23:
      BOOL v6 = [(MFMessageCriterion *)self _evaluateMailboxCriterion:v4];
      goto LABEL_23;
    case 25:
      BOOL v6 = [(MFMessageCriterion *)self _evaluateCompoundCriterion:v4];
      goto LABEL_23;
    case 26:
      BOOL v6 = [(MFMessageCriterion *)self _evaluateNotCriterion:v4];
      goto LABEL_23;
    case 27:
      BOOL v6 = [(MFMessageCriterion *)self _evaluateFlagCriterion:v4];
      goto LABEL_23;
    case 28:
      BOOL v6 = [(MFMessageCriterion *)self _evaluateFlagColorCriterion:v4];
      goto LABEL_23;
    case 34:
      BOOL v6 = [(MFMessageCriterion *)self _evaluateConversationIDCriterion:v4];
      goto LABEL_23;
    case 35:
      BOOL v6 = [(MFMessageCriterion *)self _evaluateSenderHeaderCriterion:v4];
      goto LABEL_23;
    case 46:
      BOOL v6 = [(MFMessageCriterion *)self _evaluateReadLaterCriterion:v4];
      goto LABEL_23;
    case 51:
      BOOL v6 = [(MFMessageCriterion *)self _evaluateSenderBucketCriterion:v4];
LABEL_23:
      BOOL v5 = v6;
      break;
    default:
      uint64_t v8 = MFLogGeneral();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 134217984;
        int64_t v10 = [(MFMessageCriterion *)self criterionType];
        _os_log_impl(&dword_1A7EFF000, v8, OS_LOG_TYPE_DEFAULT, "#Warning Unhandled criterion type %ld", (uint8_t *)&v9, 0xCu);
      }

      BOOL v5 = 0;
      break;
  }

  return v5;
}

- (int64_t)messageRuleQualifierForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"BeginsWith"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"EndsWith"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"IsEqualTo"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"IsNotEqualTo"])
  {
    int64_t v4 = 7;
  }
  else if ([v3 isEqualToString:@"DoesNotContain"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"IsLessThan"])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"IsGreaterThan"])
  {
    int64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"ASCIIContains"])
  {
    int64_t v4 = 8;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)stringForMessageRuleQualifier:(int64_t)a3
{
  if ((unint64_t)a3 > 8) {
    return 0;
  }
  else {
    return off_1E5D3D5E8[a3];
  }
}

- (int64_t)dateUnits
{
  return self->_dateUnitType;
}

- (BOOL)dateIsRelative
{
  return (*((unsigned __int8 *)self + 72) >> 1) & 1;
}

- (id)dateFromExpression
{
  id v2 = (void *)MEMORY[0x1E4F1C9C8];
  id v3 = [(MFMessageCriterion *)self expression];
  [v3 doubleValue];
  int64_t v4 = objc_msgSend(v2, "dateWithTimeIntervalSince1970:");

  return v4;
}

+ (id)criterionForMailbox:(id)a3
{
  int64_t v4 = [a3 URLString];
  BOOL v5 = [a1 criterionForMailboxURL:v4];

  return v5;
}

+ (id)criterionForAccount:(id)a3
{
  id v3 = a3;
  int64_t v4 = [MFMessageCriterion alloc];
  BOOL v5 = [v3 URLString];
  BOOL v6 = [(MFMessageCriterion *)v4 initWithType:23 qualifier:1 expression:v5];

  return v6;
}

+ (id)criterionExcludingMailboxes:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    int64_t v4 = objc_msgSend(v3, "ef_map:", &__block_literal_global_338);
    BOOL v5 = +[MFMessageCriterion orCompoundCriterionWithCriteria:v4];
    BOOL v6 = +[MFMessageCriterion notCriterionWithCriterion:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

id __50__MFMessageCriterion_criterionExcludingMailboxes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = +[MFMessageCriterion criterionForMailbox:a2];
  return v2;
}

+ (id)messageIsJournaledCriterion:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v4 = [MFMessageCriterion alloc];
  if (v3) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 7;
  }
  BOOL v6 = [(MFMessageCriterion *)v4 initWithType:27 qualifier:v5 expression:@"MessageIsJournaled"];
  return v6;
}

+ (id)criterionForNotDeletedConversationID:(int64_t)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  int64_t v4 = +[MFMessageCriterion messageIsDeletedCriterion:0];
  v9[0] = v4;
  uint64_t v5 = +[MFMessageCriterion criterionForConversationID:a3];
  v9[1] = v5;
  BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  char v7 = +[MFMessageCriterion andCompoundCriterionWithCriteria:v6];

  return v7;
}

+ (id)criterionForConversationID:(int64_t)a3
{
  BOOL v3 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", a3);
  int64_t v4 = [[MFMessageCriterion alloc] initWithType:34 qualifier:3 expression:v3];

  return v4;
}

+ (id)criterionForLibraryID:(id)a3
{
  id v3 = a3;
  int64_t v4 = [[MFMessageCriterion alloc] initWithType:24 qualifier:3 expression:v3];

  return v4;
}

+ (id)criterionForDocumentID:(id)a3
{
  id v3 = a3;
  int64_t v4 = [[MFMessageCriterion alloc] initWithType:42 qualifier:3 expression:v3];

  return v4;
}

+ (id)messageIsServerSearchResultCriterion:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v4 = [MFMessageCriterion alloc];
  if (v3) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 7;
  }
  BOOL v6 = [(MFMessageCriterion *)v4 initWithType:27 qualifier:v5 expression:@"MessageIsServerSearchResult"];
  return v6;
}

+ (id)criterionForFlagColor:(unint64_t)a3
{
  int64_t v4 = [MFMessageCriterion alloc];
  uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  BOOL v6 = [v5 stringValue];
  char v7 = [(MFMessageCriterion *)v4 initWithType:28 qualifier:3 expression:v6];

  [(MFMessageCriterion *)v7 setName:@"FlagColorCriterion"];
  return v7;
}

+ (id)readMessageCriterion
{
  id v2 = [[MFMessageCriterion alloc] initWithType:27 qualifier:3 expression:@"MessageIsRead"];
  [(MFMessageCriterion *)v2 setName:@"ReadCriterion"];
  return v2;
}

+ (id)toMeCriterion
{
  id v2 = [[MFMessageCriterion alloc] initWithType:27 qualifier:3 expression:@"MessageToContainsAccountAddress"];
  [(MFMessageCriterion *)v2 setName:@"ToMeCriterionName"];
  return v2;
}

+ (id)ccMeCriterion
{
  id v2 = [[MFMessageCriterion alloc] initWithType:27 qualifier:3 expression:@"MessageCcContainsAccountAddress"];
  [(MFMessageCriterion *)v2 setName:@"CcMeCriterionName"];
  return v2;
}

+ (id)yesterdayMessageCriterion
{
  id v2 = objc_opt_new();
  [v2 setDay:-1];
  BOOL v3 = +[MFMessageCriterion _todayDateComponents];
  int64_t v4 = +[MFMessageCriterion _criterionForDateReceivedBetweenDateComponents:v2 endDateComponents:v3];

  [v4 setName:@"YesterdayCriterion"];
  return v4;
}

+ (id)lastWeekMessageCriterion
{
  id v2 = objc_opt_new();
  [v2 setWeekOfYear:-1];
  BOOL v3 = +[MFMessageCriterion _todayDateComponents];
  int64_t v4 = +[MFMessageCriterion _criterionForDateReceivedBetweenDateComponents:v2 endDateComponents:v3];

  [v4 setName:@"LastWeekCriterion"];
  return v4;
}

+ (id)readLaterMessageCriterion
{
  id v2 = [[MFMessageCriterion alloc] initWithType:46 qualifier:7 expression:0];
  [(MFMessageCriterion *)v2 setName:@"ReadLaterCriterion"];
  return v2;
}

+ (id)messageCriterionForUnsubscribeTypeNotMatching:(int64_t)a3
{
  int64_t v4 = [MFMessageCriterion alloc];
  uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  BOOL v6 = [v5 stringValue];
  char v7 = [(MFMessageCriterion *)v4 initWithType:50 qualifier:7 expression:v6];

  [(MFMessageCriterion *)v7 setName:@"UnsubscribeCriterion"];
  return v7;
}

+ (id)_todayDateComponents
{
  id v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  BOOL v3 = objc_opt_new();
  int64_t v4 = [v2 components:542 fromDate:v3];

  return v4;
}

+ (id)_criterionForDateReceivedBetweenDateComponents:(id)a3 endDateComponents:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v8 = [v7 dateFromComponents:v6];
  int v9 = [v7 dateByAddingComponents:v5 toDate:v8 options:0];
  int64_t v10 = +[MFMessageCriterion _criterionForDateReceivedBetween:v9 endDate:v8];

  return v10;
}

+ (id)_criterionForDateReceivedBetween:(id)a3 endDate:(id)a4
{
  void v12[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  char v7 = +[MFMessageCriterion criterionForDateReceivedNewerThanDate:v5];
  uint64_t v8 = +[MFMessageCriterion criterionForDateReceivedOlderThanDate:v6];
  v12[0] = v7;
  v12[1] = v8;
  int v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  int64_t v10 = +[MFMessageCriterion andCompoundCriterionWithCriteria:v9];

  return v10;
}

+ (id)criterionForDateReceivedOlderThanDate:(id)a3
{
  id v4 = a3;
  id v5 = [MFMessageCriterion alloc];
  id v6 = [a1 expressionForDate:v4];
  char v7 = [(MFMessageCriterion *)v5 initWithType:11 qualifier:5 expression:v6];

  return v7;
}

+ (id)criterionForDateReceivedNewerThanDate:(id)a3
{
  id v4 = a3;
  id v5 = [MFMessageCriterion alloc];
  id v6 = [a1 expressionForDate:v4];
  char v7 = [(MFMessageCriterion *)v5 initWithType:11 qualifier:6 expression:v6];

  return v7;
}

+ (id)notCriterionWithCriterion:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MFMessageCriterion);
    v7[0] = v3;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [(MFMessageCriterion *)v4 setCriteria:v5];

    [(MFMessageCriterion *)v4 setCriterionType:26];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)orCompoundCriterionWithCriteria:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    if ([v3 count] == 1)
    {
      id v4 = [v3 lastObject];
    }
    else
    {
      id v4 = objc_alloc_init(MFMessageCriterion);
      [(MFMessageCriterion *)v4 setCriterionType:25];
      [(MFMessageCriterion *)v4 setAllCriteriaMustBeSatisfied:0];
      [(MFMessageCriterion *)v4 setCriteria:v3];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)matchEverythingCriterion
{
  id v2 = [NSString alloc];
  id v3 = objc_msgSend(v2, "initWithFormat:", @"%lld", *MEMORY[0x1E4F5FCC8]);
  id v4 = [[MFMessageCriterion alloc] initWithType:24 qualifier:7 expression:v3];

  return v4;
}

+ (id)matchNothingCriterion
{
  id v2 = [NSString alloc];
  id v3 = objc_msgSend(v2, "initWithFormat:", @"%lld", *MEMORY[0x1E4F5FCC8]);
  id v4 = [[MFMessageCriterion alloc] initWithType:24 qualifier:3 expression:v3];

  return v4;
}

+ (id)criterionForCategoryType:(unint64_t)a3
{
  id v3 = [MFMessageCriterion alloc];
  id v4 = EMStringFromCategoryType();
  id v5 = [(MFMessageCriterion *)v3 initWithType:44 qualifier:0 expression:v4];

  return v5;
}

+ (id)criterionForCategorizationHasUserOverride
{
  id v2 = [[MFMessageCriterion alloc] initWithType:45 qualifier:3 expression:@"1"];
  return v2;
}

- (BOOL)requiresBody
{
  int64_t v3 = [(MFMessageCriterion *)self criterionType];
  char v4 = 1;
  char v5 = v3 + 1;
  if ((unint64_t)(v3 + 1) <= 0x34)
  {
    if (((1 << v5) & 0x1FFFFBF3FFFFF5) != 0)
    {
      return 0;
    }
    else if (((1 << v5) & 0xC000000) != 0)
    {
      char v7 = [(MFMessageCriterion *)self criteria];
      char v4 = objc_msgSend(v7, "ef_any:", &__block_literal_global_347);
    }
  }
  return v4;
}

uint64_t __34__MFMessageCriterion_requiresBody__block_invoke(uint64_t a1, void *a2)
{
  return [a2 requiresBody];
}

- (void)tokenizeUsingTokenizationHandler:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  char v4 = (void (**)(id, void *))a3;
  char v5 = [(MFMessageCriterion *)self expression];
  id v6 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  char v7 = [v5 stringByTrimmingCharactersInSet:v6];
  uint64_t v8 = [v7 length];

  if (!v8) {
    goto LABEL_5;
  }
  if ([(MFMessageCriterion *)self qualifier] == 8
    || (int v9 = (void *)[objc_alloc(MEMORY[0x1E4F607F8]) initWithString:v5], v9, v9))
  {
    v4[2](v4, v5);
LABEL_5:
    int64_t v10 = v5;
    goto LABEL_6;
  }
  uint64_t v11 = (void *)MEMORY[0x1E4F1CA20];
  __int16 v12 = [(MFMessageCriterion *)self expressionLanguages];
  int64_t v13 = objc_msgSend(v11, "ef_localesFromLanguages:", v12);

  uint64_t v14 = objc_msgSend(v5, "ef_stringByRemovingQuotedSubstringsForLocales:tokenizationHandler:", v13, v4);

  if ([v14 length])
  {
    int64_t v10 = objc_msgSend(v14, "ef_stringByRemovingTokenizedLinksUsingTokenizationHandler:", v4);

    if ([v10 length])
    {
      double v15 = [v13 firstObject];
      double v16 = objc_msgSend(v10, "ef_wordComponentsForLocale:minimumWordLength:", v15, 2);

      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v22;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v22 != v19) {
              objc_enumerationMutation(v17);
            }
            v4[2](v4, *(void **)(*((void *)&v21 + 1) + 8 * v20++));
          }
          while (v18 != v20);
          uint64_t v18 = [v17 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v18);
      }
    }
  }
  else
  {
    int64_t v10 = v14;
  }

LABEL_6:
}

- (NSArray)expressionLanguages
{
  return self->_expressionLanguages;
}

- (void)setExpressionLanguages:(id)a3
{
}

- (EFInt64Set)libraryIdentifiers
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
  return (*((unsigned __int8 *)self + 72) >> 2) & 1;
}

- (BOOL)expressionIsSanitized
{
  return self->_expressionIsSanitized;
}

- (void)setExpressionIsSanitized:(BOOL)a3
{
  self->_expressionIsSanitized = a3;
}

- (NSString)name
{
  return self->_name;
}

- (id)daSearchPredicate
{
  if (daSearchPredicate_onceToken != -1) {
    dispatch_once(&daSearchPredicate_onceToken, &__block_literal_global_87);
  }
  int64_t v3 = (void *)daSearchPredicate_criterionConverter;
  return (id)[v3 predicateFromMessageCriterion:self];
}

uint64_t __49__MFMessageCriterion_DASearch__daSearchPredicate__block_invoke()
{
  v0 = objc_alloc_init(_MFDASearchCriterionConverterDelegate);
  v1 = (void *)daSearchPredicate_converterDelegate;
  daSearchPredicate_converterDelegate = (uint64_t)v0;

  id v2 = objc_alloc_init(MFMessageCriterionConverter);
  int64_t v3 = (void *)daSearchPredicate_criterionConverter;
  daSearchPredicate_criterionConverter = (uint64_t)v2;

  uint64_t v4 = daSearchPredicate_converterDelegate;
  char v5 = (void *)daSearchPredicate_criterionConverter;
  return [v5 setDelegate:v4];
}

@end