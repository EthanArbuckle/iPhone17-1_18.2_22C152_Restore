@interface NoteCollectionObject
- (BOOL)isAllNotesContainer;
- (BOOL)isTitleValid:(id)a3 error:(id *)a4;
- (BOOL)supportsVisibilityTestingType:(int64_t)a3;
- (id)basicAccountIdentifier;
- (id)cacheKey;
- (id)collectionInfo;
- (id)predicateForNotes;
- (id)predicateForSearchableAttachments;
- (id)predicateForSearchableNotes;
- (id)searchDomainIdentifier;
- (id)titleForTableViewCell;
@end

@implementation NoteCollectionObject

- (id)predicateForNotes
{
  return 0;
}

- (id)collectionInfo
{
  return 0;
}

- (id)basicAccountIdentifier
{
  return 0;
}

- (id)searchDomainIdentifier
{
  return 0;
}

- (BOOL)isAllNotesContainer
{
  return 0;
}

- (id)titleForTableViewCell
{
  return @"Note Collection";
}

- (BOOL)isTitleValid:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)cacheKey
{
  return &stru_1F2675F20;
}

- (BOOL)supportsVisibilityTestingType:(int64_t)a3
{
  return a3 == 2;
}

- (id)predicateForSearchableNotes
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28F60];
  v4 = [NSNumber numberWithBool:0];
  v5 = [NSNumber numberWithBool:0];
  v6 = [v3 predicateWithFormat:@"((deletedFlag == %@) AND (body.content != nil) AND (isBookkeepingEntry == %@))", v4, v5];

  v7 = [(NoteCollectionObject *)self predicateForNotes];
  v11[0] = v7;
  v11[1] = v6;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  v9 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v8];

  return v9;
}

- (id)predicateForSearchableAttachments
{
  return 0;
}

@end