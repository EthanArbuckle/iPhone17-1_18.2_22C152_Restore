@interface ICSharedFilterTypeSelection
- (id)copyWithZone:(_NSZone *)a3;
- (id)emptySummary;
- (id)emptySummaryTitle;
- (id)filterName;
- (id)shortEmptySummary;
- (int64_t)filterType;
@end

@implementation ICSharedFilterTypeSelection

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = +[ICSharedFilterTypeSelection allocWithZone:](ICSharedFilterTypeSelection, "allocWithZone:");
  v6 = [(ICParticipantsFilterTypeSelection *)self managedObjectContext];
  v7 = [(ICFilterTypeSelection *)self accountObjectID];
  v8 = [(ICParticipantsFilterTypeSelection *)v5 initWithManagedObjectContext:v6 accountObjectID:v7];

  [(ICParticipantsFilterTypeSelection *)v8 setSelectionType:[(ICParticipantsFilterTypeSelection *)self selectionType]];
  [(ICParticipantsFilterTypeSelection *)v8 setJoinOperator:[(ICParticipantsFilterTypeSelection *)self joinOperator]];
  v9 = [(ICParticipantsFilterTypeSelection *)self participantUserIDs];
  v10 = (void *)[v9 copyWithZone:a3];
  [(ICParticipantsFilterTypeSelection *)v8 setParticipantUserIDs:v10];

  return v8;
}

- (int64_t)filterType
{
  return 3;
}

- (id)filterName
{
  return (id)[MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Shared" value:@"Shared" table:0 allowSiri:1];
}

- (id)emptySummaryTitle
{
  if ([(ICParticipantsFilterTypeSelection *)self isEmpty])
  {
    v2 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Shared Filter Incomplete" value:@"Shared Filter Incomplete" table:0 allowSiri:1];
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
    v2 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"You must select at least one person that you share a note with for the Shared filter." value:@"You must select at least one person that you share a note with for the Shared filter." table:0 allowSiri:1];
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
    v2 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Person for the Shared filter" value:@"Person for the Shared filter" table:0 allowSiri:1];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

@end