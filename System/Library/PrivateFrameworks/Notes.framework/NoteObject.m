@interface NoteObject
- (BOOL)belongsToCollection:(id)a3;
- (BOOL)containsAttachments;
- (BOOL)hasUnreadChanges;
- (BOOL)hasValidServerIntId;
- (BOOL)isBeingMarkedForDeletion;
- (BOOL)isDeletable;
- (BOOL)isHiddenFromIndexing;
- (BOOL)isMarkedForDeletion;
- (BOOL)isModernNote;
- (BOOL)isMovable;
- (BOOL)isPasswordProtected;
- (BOOL)isPinnable;
- (BOOL)isPinned;
- (BOOL)isPlainText;
- (BOOL)isSearchIndexableNote;
- (BOOL)isSharedReadOnly;
- (BOOL)isSharedViaICloud;
- (BOOL)isSharedViaICloudFolder;
- (BOOL)isUnsupported;
- (BOOL)searchResultCanBeDeletedFromNoteContext;
- (CSSearchableItemAttributeSet)searchableItemAttributeSet;
- (CSSearchableItemAttributeSet)userActivityContentAttributeSet;
- (NSArray)authorsExcludingCurrentUser;
- (NSAttributedString)attributedContentInfoText;
- (NSAttributedString)attributedTitle;
- (NSAttributedString)noteWithoutTitle;
- (NSAttributedString)trimmedAttributedTitle;
- (NSData)externalRepresentation;
- (NSSet)noteCellKeyPaths;
- (NSString)accountName;
- (NSString)content;
- (NSString)contentAsPlainText;
- (NSString)contentAsPlainTextPreservingNewlines;
- (NSString)contentInfoText;
- (NSString)dataSourceIdentifier;
- (NSString)externalContentRef;
- (NSString)folderManagedIdentifier;
- (NSString)folderName;
- (NSString)noteAsPlainTextWithoutTitle;
- (NSString)searchDomainIdentifier;
- (NSString)searchIndexingIdentifier;
- (NSString)trimmedTitle;
- (NSString)widgetInfoText;
- (NSURL)noteId;
- (id)dataForTypeIdentifier:(id)a3;
- (id)defaultTitleForEmptyNote;
- (int64_t)currentStatus;
- (int64_t)serverIntId;
- (int64_t)visibilityTestingType;
- (unint64_t)flags;
- (unint64_t)searchResultType;
- (unint64_t)searchResultsSection;
- (unint64_t)sequenceNumber;
- (void)markForDeletion;
- (void)setContent:(id)a3;
- (void)setExternalContentRef:(id)a3;
- (void)setExternalRepresentation:(id)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setIsPlainText:(BOOL)a3;
- (void)setSequenceNumber:(unint64_t)a3;
- (void)setServerIntId:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation NoteObject

- (void)setContent:(id)a3
{
  id v5 = a3;
  v4 = [(NoteObject *)self body];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setContent:v5];
  }
  else {
    NSLog(&cfstr_TheBodyObjectI.isa, self, v4);
  }
}

- (id)defaultTitleForEmptyNote
{
  return (id)[MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"NEW_NOTE" value:@"New Note" table:0 allowSiri:1];
}

- (void)setTitle:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NoteObject *)self title];
  char v6 = [v5 isEqualToString:v4];

  if ((v6 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1E4F837D8];
    v8 = ICCheckedProtocolCast();
    v9 = [v7 userActivityPersistentIdentifierForNote:v8];

    if (v9)
    {
      v10 = (void *)MEMORY[0x1E4F22488];
      v16[0] = v9;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
      [v10 deleteSavedUserActivitiesWithPersistentIdentifiers:v11 completionHandler:&__block_literal_global_1];
    }
  }
  if (!v4
    || ([MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet],
        v12 = objc_claimAutoreleasedReturnValue(),
        [v4 stringByTrimmingCharactersInSet:v12],
        v13 = objc_claimAutoreleasedReturnValue(),
        uint64_t v14 = [v13 length],
        v13,
        v12,
        !v14))
  {
    uint64_t v15 = [(NoteObject *)self defaultTitleForEmptyNote];

    id v4 = (id)v15;
  }
  [(NoteObject *)self willChangeValueForKey:@"title"];
  [(NoteObject *)self setPrimitiveValue:v4 forKey:@"title"];
  [(NoteObject *)self didChangeValueForKey:@"title"];
}

- (NSString)content
{
  v2 = [(NoteObject *)self body];
  v3 = [v2 content];

  return (NSString *)v3;
}

- (NSString)contentAsPlainText
{
  v2 = [(NoteObject *)self body];
  v3 = [v2 contentAsPlainText];

  return (NSString *)v3;
}

- (NSString)contentAsPlainTextPreservingNewlines
{
  BOOL v3 = [(NoteObject *)self isPlainText];
  id v4 = [(NoteObject *)self body];
  id v5 = v4;
  if (v3) {
    [v4 content];
  }
  else {
  char v6 = [v4 contentAsPlainTextPreservingNewlines];
  }

  return (NSString *)v6;
}

- (void)setIsPlainText:(BOOL)a3
{
  id v4 = [NSNumber numberWithInt:a3];
  [(NoteObject *)self setContentType:v4];
}

- (BOOL)isPlainText
{
  v2 = [(NoteObject *)self contentType];
  BOOL v3 = [v2 intValue] == 1;

  return v3;
}

- (void)markForDeletion
{
  id v3 = [NSNumber numberWithBool:1];
  [(NoteObject *)self setDeletedFlag:v3];
}

- (BOOL)isMarkedForDeletion
{
  v2 = [(NoteObject *)self deletedFlag];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isBeingMarkedForDeletion
{
  if ([(NoteObject *)self isMarkedForDeletion])
  {
    char v3 = [(NoteObject *)self committedValuesForKeys:&unk_1F2679910];
    id v4 = [v3 objectForKeyedSubscript:@"deletedFlag"];
    int v5 = [v4 BOOLValue] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (NSURL)noteId
{
  v2 = [(NoteObject *)self objectID];
  char v3 = [v2 URIRepresentation];

  return (NSURL *)v3;
}

- (void)setFlags:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedLongLong:a3];
  [(NoteObject *)self setExternalFlags:v4];
}

- (unint64_t)flags
{
  v2 = [(NoteObject *)self externalFlags];
  unint64_t v3 = [v2 unsignedLongLongValue];

  return v3;
}

- (void)setServerIntId:(int64_t)a3
{
  id v4 = [NSNumber numberWithLongLong:a3];
  [(NoteObject *)self setExternalServerIntId:v4];
}

- (int64_t)serverIntId
{
  v2 = [(NoteObject *)self externalServerIntId];
  int64_t v3 = [v2 longLongValue];

  return v3;
}

- (BOOL)hasValidServerIntId
{
  v2 = [(NoteObject *)self externalServerIntId];
  uint64_t v3 = [v2 longLongValue];

  return (unint64_t)(v3 + 0xFFFFFFFFLL) < 0x1FFFFFFFFLL;
}

- (NSData)externalRepresentation
{
  v2 = [(NoteObject *)self body];
  uint64_t v3 = [v2 externalRepresentation];

  return (NSData *)v3;
}

- (void)setExternalRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = [(NoteObject *)self body];
  [v5 setExternalRepresentation:v4];
}

- (NSString)externalContentRef
{
  v2 = [(NoteObject *)self body];
  uint64_t v3 = [v2 externalContentRef];

  return (NSString *)v3;
}

- (void)setExternalContentRef:(id)a3
{
  id v4 = a3;
  id v5 = [(NoteObject *)self body];
  [v5 setExternalContentRef:v4];
}

- (BOOL)containsAttachments
{
  v2 = [(NoteObject *)self attachments];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedLongLong:a3];
  [(NoteObject *)self setExternalSequenceNumber:v4];
}

- (unint64_t)sequenceNumber
{
  v2 = [(NoteObject *)self externalSequenceNumber];
  unint64_t v3 = [v2 unsignedLongLongValue];

  return v3;
}

- (BOOL)belongsToCollection:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(NoteObject *)self store],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 isEqual:v4],
        v5,
        (v6 & 1) != 0))
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [(NoteObject *)self store];
      v9 = [v8 account];
      char v7 = [v9 isEqual:v4];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isSearchIndexableNote
{
  return 1;
}

- (BOOL)isPasswordProtected
{
  return 0;
}

- (BOOL)isModernNote
{
  return 0;
}

- (BOOL)isSharedViaICloud
{
  return 0;
}

- (BOOL)isSharedViaICloudFolder
{
  return 0;
}

- (BOOL)isSharedReadOnly
{
  return 0;
}

- (BOOL)isUnsupported
{
  return 0;
}

- (BOOL)isMovable
{
  return 1;
}

- (BOOL)isPinnable
{
  return 0;
}

- (BOOL)isDeletable
{
  return 1;
}

- (NSAttributedString)attributedTitle
{
  return 0;
}

- (NSString)trimmedTitle
{
  uint64_t v2 = [(NoteObject *)self title];
  unint64_t v3 = (void *)v2;
  id v4 = &stru_1F2675F20;
  if (v2) {
    id v4 = (__CFString *)v2;
  }
  id v5 = v4;

  if ([(__CFString *)v5 length])
  {
    char v6 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    char v7 = [(__CFString *)v5 stringByTrimmingCharactersInSet:v6];

    objc_msgSend(v7, "ic_whitespaceAndNewlineCoalescedString");
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (NSAttributedString)trimmedAttributedTitle
{
  return 0;
}

- (NSString)folderName
{
  unint64_t v3 = [(NoteObject *)self store];
  id v4 = [(NoteObject *)self store];
  id v5 = [v4 account];
  char v6 = [v5 defaultStore];

  if (v3 == v6)
  {
    v8 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Notes" value:@"Notes" table:0 allowSiri:1];
  }
  else
  {
    char v7 = [(NoteObject *)self store];
    v8 = [v7 name];
  }
  return (NSString *)v8;
}

- (NSString)folderManagedIdentifier
{
  uint64_t v2 = [(NoteObject *)self store];
  unint64_t v3 = [v2 externalIdentifier];

  return (NSString *)v3;
}

- (NSString)accountName
{
  uint64_t v2 = [(NoteObject *)self store];
  unint64_t v3 = [v2 account];
  id v4 = [v3 name];

  return (NSString *)v4;
}

- (int64_t)visibilityTestingType
{
  return 2;
}

- (NSString)dataSourceIdentifier
{
  return (NSString *)@"Legacy";
}

- (unint64_t)searchResultsSection
{
  return 1;
}

- (unint64_t)searchResultType
{
  return 0;
}

- (BOOL)searchResultCanBeDeletedFromNoteContext
{
  return 1;
}

- (BOOL)isHiddenFromIndexing
{
  unint64_t v3 = [(NoteObject *)self store];
  id v4 = [v3 account];

  if (!v4) {
    return 1;
  }
  if ([(NoteObject *)self isDeleted]) {
    return 1;
  }
  if ([(NoteObject *)self isMarkedForDeletion]) {
    return 1;
  }
  id v5 = [(NoteObject *)self store];
  char v6 = [v5 account];
  char v7 = [v6 didChooseToMigrate];

  if (v7) {
    return 1;
  }
  v9 = (void *)MEMORY[0x1E4F83700];
  v10 = [(NoteObject *)self store];
  v11 = [v10 account];
  v12 = [v11 accountIdentifier];
  LOBYTE(v9) = [v9 isAccountReindexedForMigration:v12];

  return (char)v9;
}

- (NSArray)authorsExcludingCurrentUser
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (NSSet)noteCellKeyPaths
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"title", @"modificationDate", @"body.content", 0);
}

- (NSString)noteAsPlainTextWithoutTitle
{
  unint64_t v3 = (void *)MEMORY[0x1E4F83798];
  id v4 = [(NoteObject *)self title];
  id v5 = [(NoteObject *)self contentAsPlainTextPreservingNewlines];
  char v6 = [v3 stringByRemovingTitle:v4 fromString:v5];

  return (NSString *)v6;
}

- (NSAttributedString)noteWithoutTitle
{
  return 0;
}

- (NSString)contentInfoText
{
  unint64_t v3 = (void *)MEMORY[0x1E4F83798];
  id v4 = [(NoteObject *)self noteAsPlainTextWithoutTitle];
  id v5 = [v3 snippetForContent:v4];

  if (![v5 length])
  {
    char v6 = NSString;
    char v7 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"NOTE_LIST_ATTACHMENTS_%lu" value:@"NOTE_LIST_ATTACHMENTS_%lu" table:0 allowSiri:1];
    v8 = [(NoteObject *)self attachments];
    uint64_t v9 = objc_msgSend(v6, "localizedStringWithFormat:", v7, objc_msgSend(v8, "count"));

    id v5 = (void *)v9;
  }
  return (NSString *)v5;
}

- (NSAttributedString)attributedContentInfoText
{
  id v3 = objc_alloc(MEMORY[0x1E4F28B18]);
  id v4 = [(NoteObject *)self contentInfoText];
  id v5 = (void *)[v3 initWithString:v4];

  return (NSAttributedString *)v5;
}

- (NSString)widgetInfoText
{
  id v3 = (void *)MEMORY[0x1E4F83798];
  id v4 = [(NoteObject *)self noteAsPlainTextWithoutTitle];
  id v5 = [v3 widgetSnippetForContent:v4];

  if (![v5 length])
  {
    char v6 = NSString;
    char v7 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"NOTE_LIST_ATTACHMENTS_%lu" value:@"NOTE_LIST_ATTACHMENTS_%lu" table:0 allowSiri:1];
    v8 = [(NoteObject *)self attachments];
    uint64_t v9 = objc_msgSend(v6, "localizedStringWithFormat:", v7, objc_msgSend(v8, "count"));

    id v5 = (void *)v9;
  }
  return (NSString *)v5;
}

- (NSString)searchIndexingIdentifier
{
  uint64_t v2 = [(NoteObject *)self objectID];
  id v3 = [v2 URIRepresentation];
  id v4 = [v3 absoluteString];

  return (NSString *)v4;
}

- (int64_t)currentStatus
{
  return 0;
}

- (BOOL)hasUnreadChanges
{
  return 0;
}

- (BOOL)isPinned
{
  return 0;
}

- (NSString)searchDomainIdentifier
{
  id v3 = +[AccountUtilities sharedAccountUtilities];
  id v4 = [v3 accountStore];

  id v5 = [(NoteObject *)self store];
  char v6 = [v5 account];
  char v7 = [v6 accountIdentifier];
  v8 = [v4 accountWithIdentifier:v7];

  uint64_t v9 = [v8 parentAccount];
  v10 = v9;
  if (!v9) {
    uint64_t v9 = v8;
  }
  v11 = [v9 identifier];

  return (NSString *)v11;
}

- (CSSearchableItemAttributeSet)userActivityContentAttributeSet
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F23850]) initWithItemContentType:@"com.apple.notes.spotlightrecord"];
  id v4 = [(NoteObject *)self creationDate];
  [v3 setContentCreationDate:v4];

  id v5 = [(NoteObject *)self modificationDate];
  [v3 setContentModificationDate:v5];

  char v6 = [(NoteObject *)self title];
  [v3 setDisplayName:v6];

  return (CSSearchableItemAttributeSet *)v3;
}

- (CSSearchableItemAttributeSet)searchableItemAttributeSet
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v3 = [(NoteObject *)self userActivityContentAttributeSet];
  id v4 = (void *)MEMORY[0x1E4F83798];
  id v5 = [(NoteObject *)self noteAsPlainTextWithoutTitle];
  char v6 = [v4 snippetForContent:v5];
  [v3 setContentDescription:v6];

  char v7 = [(NoteObject *)self noteAsPlainTextWithoutTitle];
  [v3 setTextContent:v7];

  objc_msgSend(v3, "setIc_searchResultType:", 0);
  v8 = [(NoteObject *)self store];
  uint64_t v9 = [v8 account];
  if ([v9 preventMovingNotesToOtherAccounts]) {
    v10 = &unk_1F26799E8;
  }
  else {
    v10 = &unk_1F2679A00;
  }
  [v3 setDataOwnerType:v10];

  objc_msgSend(v3, "ic_populateValuesForSpecializedFields");
  if (objc_opt_respondsToSelector())
  {
    v11 = [(NoteObject *)self searchableItemViewAttributeSet];
    [v3 addAttributesFromAttributeSet:v11];
  }
  if (objc_opt_respondsToSelector()) {
    [(NoteObject *)self associateAppEntityWithSearchableItemAttributeSet:v3];
  }
  v12 = [(id)*MEMORY[0x1E4F44510] identifier];
  v13 = objc_msgSend((id)*MEMORY[0x1E4F443F0], "identifier", v12);
  v16[1] = v13;
  void v16[2] = @"com.apple.notes.htmlnoteitemprovider";
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
  [v3 setProviderDataTypes:v14];

  return (CSSearchableItemAttributeSet *)v3;
}

- (id)dataForTypeIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  id v18 = 0;
  id v5 = [(NoteObject *)self managedObjectContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__NoteObject_SearchIndexableNote__dataForTypeIdentifier___block_invoke;
  v9[3] = &unk_1E686E150;
  id v6 = v4;
  v11 = self;
  v12 = &v13;
  id v10 = v6;
  [v5 performBlockAndWait:v9];

  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __57__NoteObject_SearchIndexableNote__dataForTypeIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [(id)*MEMORY[0x1E4F44510] identifier];
  LODWORD(v2) = [v2 isEqualToString:v3];

  if (v2)
  {
    id v4 = [*(id *)(a1 + 40) contentAsPlainText];
LABEL_5:
    id v13 = v4;
    uint64_t v7 = [v4 dataUsingEncoding:4];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    return;
  }
  id v5 = *(void **)(a1 + 32);
  id v6 = [(id)*MEMORY[0x1E4F443F0] identifier];
  LODWORD(v5) = [v5 isEqualToString:v6];

  if (v5)
  {
    id v4 = [*(id *)(a1 + 40) content];
    goto LABEL_5;
  }
  if ([*(id *)(a1 + 32) isEqualToString:@"com.apple.notes.htmlnoteitemprovider"])
  {
    id v10 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __57__NoteObject_SearchIndexableNote__dataForTypeIdentifier___block_invoke_cold_1(v10);
    }

    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = 0;
  }
}

void __57__NoteObject_SearchIndexableNote__dataForTypeIdentifier___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CFDA4000, log, OS_LOG_TYPE_ERROR, "The NoteObjectItemProviderUTI should never be requested", v1, 2u);
}

@end