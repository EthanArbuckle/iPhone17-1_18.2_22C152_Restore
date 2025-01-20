@interface ICMentionsFilterTypeSelection
- (NSString)currentUserID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)emptySummary;
- (id)emptySummaryTitle;
- (id)filterName;
- (id)shortEmptySummary;
- (id)summaryWithJoinOperatorMenu;
- (int64_t)filterType;
@end

@implementation ICMentionsFilterTypeSelection

- (NSString)currentUserID
{
  v3 = [(ICFilterTypeSelection *)self accountObjectID];

  if (v3)
  {
    uint64_t v8 = 0;
    v9 = &v8;
    uint64_t v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__61;
    v12 = __Block_byref_object_dispose__61;
    id v13 = 0;
    v4 = [(ICParticipantsFilterTypeSelection *)self managedObjectContext];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46__ICMentionsFilterTypeSelection_currentUserID__block_invoke;
    v7[3] = &unk_1E64A44A8;
    v7[4] = self;
    v7[5] = &v8;
    [v4 performBlockAndWait:v7];

    id v5 = (id)v9[5];
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    id v5 = 0;
  }
  return (NSString *)v5;
}

void __46__ICMentionsFilterTypeSelection_currentUserID__block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  v3 = [*(id *)(a1 + 32) accountObjectID];
  v4 = objc_msgSend(v2, "ic_existingObjectWithID:", v3);
  ICDynamicCast();
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v5 = [v8 userRecordName];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)summaryWithJoinOperatorMenu
{
  return (id)[MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Show notes mentioning INLINE_MENU_PLEASE_READ_COMMENTS selected people." value:@"Show notes mentioning INLINE_MENU_PLEASE_READ_COMMENTS selected people." table:0 allowSiri:1];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = +[ICMentionsFilterTypeSelection allocWithZone:](ICMentionsFilterTypeSelection, "allocWithZone:");
  uint64_t v6 = [(ICParticipantsFilterTypeSelection *)self managedObjectContext];
  v7 = [(ICFilterTypeSelection *)self accountObjectID];
  id v8 = [(ICParticipantsFilterTypeSelection *)v5 initWithManagedObjectContext:v6 accountObjectID:v7];

  [(ICParticipantsFilterTypeSelection *)v8 setSelectionType:[(ICParticipantsFilterTypeSelection *)self selectionType]];
  [(ICParticipantsFilterTypeSelection *)v8 setJoinOperator:[(ICParticipantsFilterTypeSelection *)self joinOperator]];
  v9 = [(ICParticipantsFilterTypeSelection *)self participantUserIDs];
  uint64_t v10 = (void *)[v9 copyWithZone:a3];
  [(ICParticipantsFilterTypeSelection *)v8 setParticipantUserIDs:v10];

  return v8;
}

- (int64_t)filterType
{
  return 4;
}

- (id)filterName
{
  return (id)[MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Mentions" value:@"Mentions" table:0 allowSiri:1];
}

- (id)emptySummaryTitle
{
  if ([(ICParticipantsFilterTypeSelection *)self isEmpty])
  {
    v2 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Mentions Filter Incomplete" value:@"Mentions Filter Incomplete" table:0 allowSiri:1];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)emptySummary
{
  if ([(ICParticipantsFilterTypeSelection *)self isEmpty])
  {
    v2 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"You must select at least one person that you share a note with for the Mentions filter." value:@"You must select at least one person that you share a note with for the Mentions filter." table:0 allowSiri:1];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)shortEmptySummary
{
  if ([(ICParticipantsFilterTypeSelection *)self isEmpty])
  {
    v2 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Person for the Mentions filter" value:@"Person for the Mentions filter" table:0 allowSiri:1];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

@end