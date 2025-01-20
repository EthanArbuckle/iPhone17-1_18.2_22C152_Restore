@interface ICBaseAttachment
+ (id)attachmentWithIdentifier:(id)a3 context:(id)a4;
+ (id)attachmentWithIdentifier:(id)a3 includeDeleted:(BOOL)a4 context:(id)a5;
+ (id)newAttachmentWithIdentifier:(id)a3 note:(id)a4;
+ (id)notDeletedPredicate;
+ (id)predicateForUnsupportedAttachmentsInContext:(id)a3;
+ (id)predicateForVisibleAttachmentsInContext:(id)a3;
+ (id)predicateForVisibleAttachmentsIncludingTrash:(BOOL)a3 inContext:(id)a4;
+ (id)predicateForVisibleAttachmentsIncludingTrashInContext:(id)a3;
+ (id)predicateForVisibleObjects;
+ (void)deleteAttachment:(id)a3;
+ (void)undeleteAttachment:(id)a3;
- (BOOL)isUsed;
- (BOOL)isVisible;
- (ICBaseAttachment)rootParentAttachment;
- (_NSRange)rangeInNote;
- (id)cloudAccount;
- (id)parentCloudObjectForMinimumSupportedVersionPropagation;
- (void)setParentAttachment:(id)a3;
@end

@implementation ICBaseAttachment

- (id)parentCloudObjectForMinimumSupportedVersionPropagation
{
  v3 = [(ICBaseAttachment *)self parentAttachment];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(ICBaseAttachment *)self note];
  }
  v6 = v5;

  return v6;
}

+ (id)predicateForVisibleObjects
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28BA0];
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___ICBaseAttachment;
  v3 = objc_msgSendSuper2(&v8, sel_predicateForVisibleObjects);
  v9[0] = v3;
  v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"note.needsInitialFetchFromCloud == NO"];
  v9[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  v6 = [v2 andPredicateWithSubpredicates:v5];

  return v6;
}

- (_NSRange)rangeInNote
{
  v3 = [(ICBaseAttachment *)self note];

  if (v3)
  {
    v4 = [(ICBaseAttachment *)self note];
    uint64_t v5 = [v4 rangeForAttachment:self];
    NSUInteger v7 = v6;

    NSUInteger v8 = v5;
    NSUInteger v9 = v7;
  }
  else
  {
    NSUInteger v8 = 0x7FFFFFFFFFFFFFFFLL;
    NSUInteger v9 = 0;
  }
  result.length = v9;
  result.location = v8;
  return result;
}

- (BOOL)isUsed
{
  if ([(ICBaseAttachment *)self markedForDeletion]) {
    return 0;
  }
  v4 = [(ICBaseAttachment *)self parentAttachment];

  if (!v4) {
    return [(ICBaseAttachment *)self rangeInNote] != 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v5 = [(ICBaseAttachment *)self parentAttachment];
  if ([v5 isUsed])
  {
    NSUInteger v6 = [(ICBaseAttachment *)self parentAttachment];
    NSUInteger v7 = [v6 attachmentModel];
    char v3 = [v7 usesChildAttachment:self];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

+ (id)newAttachmentWithIdentifier:(id)a3 note:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  NSUInteger v8 = [v6 managedObjectContext];
  NSUInteger v9 = (void *)[a1 newObjectWithIdentifier:v7 context:v8];

  v10 = [v6 account];
  [v9 setAccount:v10];

  [v9 setNote:v6];
  v11 = [v6 account];

  v12 = [v11 persistentStore];
  [v9 assignToPersistentStore:v12];

  return v9;
}

+ (void)deleteAttachment:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  char v3 = ICDynamicCast();

  if (v3)
  {
    v4 = [v5 media];
    +[ICMedia deleteMedia:v4];
  }
  [v5 markForDeletion];
}

+ (void)undeleteAttachment:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  char v3 = ICDynamicCast();

  if (v3)
  {
    v4 = [v5 media];
    +[ICMedia undeleteMedia:v4];
  }
  [v5 unmarkForDeletion];
}

- (BOOL)isVisible
{
  char v3 = [(ICBaseAttachment *)self note];
  if ([v3 isVisible])
  {
    v6.receiver = self;
    v6.super_class = (Class)ICBaseAttachment;
    BOOL v4 = [(ICCloudSyncingObject *)&v6 isVisible];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

+ (id)attachmentWithIdentifier:(id)a3 context:(id)a4
{
  return (id)[a1 attachmentWithIdentifier:a3 includeDeleted:1 context:a4];
}

+ (id)attachmentWithIdentifier:(id)a3 includeDeleted:(BOOL)a4 context:(id)a5
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  [MEMORY[0x1E4F28F60] predicateWithFormat:@"identifier == %@", a3];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = v9;
  if (!a4)
  {
    v12 = (void *)MEMORY[0x1E4F28BA0];
    v18[0] = v9;
    v13 = [a1 predicateForVisibleAttachmentsInContext:v8];
    v18[1] = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    v11 = [v12 andPredicateWithSubpredicates:v14];
  }
  v15 = objc_msgSend(a1, "ic_objectsMatchingPredicate:context:", v11, v8);
  v16 = [v15 firstObject];

  return v16;
}

+ (id)predicateForVisibleAttachmentsIncludingTrash:(BOOL)a3 inContext:(id)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  objc_super v6 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v7 = a4;
  id v8 = objc_alloc_init(v6);
  id v9 = [a1 predicateForVisibleObjects];
  [v8 addObject:v9];

  if (!a3)
  {
    v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"note.folder.folderType != %d", 1);
    [v8 addObject:v10];
  }
  v11 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v8];
  v12 = (void *)MEMORY[0x1E4F28BA0];
  v17[0] = v11;
  v13 = +[ICUnsupportedObjectPredicateHelper predicateForSupportedAttachmentsInContext:v7];

  v17[1] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v15 = [v12 andPredicateWithSubpredicates:v14];

  return v15;
}

+ (id)predicateForUnsupportedAttachmentsInContext:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithValue:0];
}

+ (id)predicateForVisibleAttachmentsInContext:(id)a3
{
  return (id)[a1 predicateForVisibleAttachmentsIncludingTrash:0 inContext:a3];
}

+ (id)predicateForVisibleAttachmentsIncludingTrashInContext:(id)a3
{
  return (id)[a1 predicateForVisibleAttachmentsIncludingTrash:1 inContext:a3];
}

+ (id)notDeletedPredicate
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"markedForDeletion == NO"];
}

- (id)cloudAccount
{
  char v3 = [(ICBaseAttachment *)self account];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    objc_super v6 = [(ICBaseAttachment *)self note];
    id v5 = [v6 cloudAccount];
  }
  return v5;
}

- (void)setParentAttachment:(id)a3
{
  id v5 = a3;
  id v4 = [(ICBaseAttachment *)self parentAttachment];

  if (v4 != v5)
  {
    [(ICBaseAttachment *)self willChangeValueForKey:@"parentAttachment"];
    [(ICBaseAttachment *)self willChangeValueForKey:@"parentCloudObject"];
    [(ICBaseAttachment *)self setPrimitiveValue:v5 forKey:@"parentAttachment"];
    [(ICBaseAttachment *)self didChangeValueForKey:@"parentAttachment"];
    [(ICBaseAttachment *)self didChangeValueForKey:@"parentCloudObject"];
    [v5 resetToIntrinsicNotesVersionAndPropagateToChildObjects];
  }
}

- (ICBaseAttachment)rootParentAttachment
{
  char v3 = [(ICBaseAttachment *)self parentAttachment];
  if (v3)
  {
    id v4 = [(ICBaseAttachment *)self parentAttachment];
    id v5 = [v4 rootParentAttachment];
  }
  else
  {
    id v5 = self;
  }

  return v5;
}

@end