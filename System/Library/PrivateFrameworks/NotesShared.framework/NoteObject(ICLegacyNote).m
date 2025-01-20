@interface NoteObject(ICLegacyNote)
+ (uint64_t)predicateForVisibleNotes;
- (id)account;
- (id)createAttachmentWithName:()ICLegacyNote;
@end

@implementation NoteObject(ICLegacyNote)

- (id)account
{
  v1 = [a1 folder];
  v2 = [v1 account];

  return v2;
}

- (id)createAttachmentWithName:()ICLegacyNote
{
  v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a3;
  v6 = [v4 UUID];
  v7 = [v6 UUIDString];
  v8 = [v7 stringByAppendingString:@"@mobilenotes.apple.com"];

  v9 = (void *)MEMORY[0x1E4F82D78];
  v10 = [a1 managedObjectContext];
  v11 = [v9 newlyAddedAttachmentInContext:v10];

  [v11 setNote:a1];
  [v11 setFilename:v5];

  [v11 setContentID:v8];
  return v11;
}

+ (uint64_t)predicateForVisibleNotes
{
  return [MEMORY[0x1E4F82D78] visibleNotesPredicate];
}

@end