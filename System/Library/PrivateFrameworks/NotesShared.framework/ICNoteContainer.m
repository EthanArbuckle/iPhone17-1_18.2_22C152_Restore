@interface ICNoteContainer
+ (id)keyPathsForValuesAffectingCloudAccount;
- (BOOL)canBeSharedViaICloud;
- (BOOL)isAllNotesContainer;
- (BOOL)isModernCustomFolder;
- (BOOL)isSharedReadOnly;
- (BOOL)isSharedViaICloud;
- (BOOL)isShowingDateHeaders;
- (BOOL)isSubFolderOrderMergeableDataDirty;
- (BOOL)isTrashFolder;
- (BOOL)mergeWithSubFolderMergeableData:(id)a3;
- (BOOL)noteIsVisible:(id)a3;
- (BOOL)supportsDateHeaders;
- (BOOL)supportsEditingNotes;
- (BOOL)supportsVisibilityTestingType:(int64_t)a3;
- (ICCROrderedSet)subFolderIdentifiersOrderedSet;
- (ICFolderCustomNoteSortType)customNoteSortType;
- (ICTTOrderedSetVersionedDocument)subFolderIdentifiersOrderedSetDocument;
- (NSArray)visibleNotes;
- (NSArray)visibleSubFolders;
- (NSData)subFolderOrderMergeableData;
- (NSString)accountName;
- (NSString)cacheKey;
- (NSString)containerIdentifier;
- (NSString)titleForNavigationBar;
- (NSString)titleForTableViewCell;
- (id)predicateForPinnedNotes;
- (id)predicateForSearchableAttachments;
- (id)predicateForSearchableNotes;
- (id)predicateForVisibleNotes;
- (unint64_t)visibleNotesCount;
- (void)applyDateHeadersType:(int)a3;
- (void)saveSubFolderMergeableDataIfNeeded;
- (void)setSubFolderIdentifiersOrderedSetDocument:(id)a3;
- (void)setSubFolderOrderMergeableDataDirty:(BOOL)a3;
- (void)updateSubFolderMergeableDataChangeCount;
- (void)willRefresh:(BOOL)a3;
- (void)willSave;
- (void)willTurnIntoFault;
- (void)writeSubFolderMergeableData;
@end

@implementation ICNoteContainer

- (void).cxx_destruct
{
}

- (BOOL)isSharedViaICloud
{
  v3.receiver = self;
  v3.super_class = (Class)ICNoteContainer;
  return [(ICCloudSyncingObject *)&v3 isSharedViaICloud];
}

- (ICCROrderedSet)subFolderIdentifiersOrderedSet
{
  objc_opt_class();
  objc_super v3 = [(ICNoteContainer *)self subFolderIdentifiersOrderedSetDocument];
  v4 = [v3 orderedSet];
  v5 = ICCheckedDynamicCast();

  return (ICCROrderedSet *)v5;
}

- (ICTTOrderedSetVersionedDocument)subFolderIdentifiersOrderedSetDocument
{
  subFolderIdentifiersOrderedSetDocument = self->_subFolderIdentifiersOrderedSetDocument;
  if (!subFolderIdentifiersOrderedSetDocument)
  {
    v4 = [ICTTOrderedSetVersionedDocument alloc];
    v5 = [(ICNoteContainer *)self subFolderOrderMergeableData];
    v6 = [(ICCloudSyncingObject *)self currentReplicaID];
    v7 = [(ICTTVersionedDocument *)v4 initWithData:v5 replicaID:v6];
    v8 = self->_subFolderIdentifiersOrderedSetDocument;
    self->_subFolderIdentifiersOrderedSetDocument = v7;

    subFolderIdentifiersOrderedSetDocument = self->_subFolderIdentifiersOrderedSetDocument;
  }
  return subFolderIdentifiersOrderedSetDocument;
}

- (BOOL)isTrashFolder
{
  return 0;
}

- (ICFolderCustomNoteSortType)customNoteSortType
{
  return 0;
}

- (BOOL)isSharedReadOnly
{
  v3.receiver = self;
  v3.super_class = (Class)ICNoteContainer;
  return [(ICCloudSyncingObject *)&v3 isSharedReadOnly];
}

- (void)willRefresh:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(ICNoteContainer *)self isSubFolderOrderMergeableDataDirty])
  {
    subFolderIdentifiersOrderedSetDocument = self->_subFolderIdentifiersOrderedSetDocument;
    self->_subFolderIdentifiersOrderedSetDocument = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)ICNoteContainer;
  [(ICNoteContainer *)&v6 willRefresh:v3];
}

- (void)willTurnIntoFault
{
  if (![(ICNoteContainer *)self isSubFolderOrderMergeableDataDirty])
  {
    subFolderIdentifiersOrderedSetDocument = self->_subFolderIdentifiersOrderedSetDocument;
    self->_subFolderIdentifiersOrderedSetDocument = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ICNoteContainer;
  [(ICNoteContainer *)&v4 willTurnIntoFault];
}

- (BOOL)isSubFolderOrderMergeableDataDirty
{
  return self->_subFolderOrderMergeableDataDirty;
}

- (NSString)cacheKey
{
  return (NSString *)&stru_1F1F2FFF8;
}

- (BOOL)supportsVisibilityTestingType:(int64_t)a3
{
  return a3 == 1;
}

- (id)predicateForVisibleNotes
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithValue:0];
}

- (id)predicateForPinnedNotes
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithValue:0];
}

- (id)predicateForSearchableNotes
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithValue:0];
}

- (id)predicateForSearchableAttachments
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithValue:0];
}

- (BOOL)canBeSharedViaICloud
{
  v3.receiver = self;
  v3.super_class = (Class)ICNoteContainer;
  return [(ICCloudSyncingObject *)&v3 canBeSharedViaICloud];
}

- (BOOL)isAllNotesContainer
{
  return 0;
}

- (NSArray)visibleNotes
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (unint64_t)visibleNotesCount
{
  return 0;
}

- (BOOL)noteIsVisible:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  v5 = [(ICNoteContainer *)self predicateForVisibleNotes];
  char v6 = [v5 evaluateWithObject:v4];

  return v6;
}

- (NSString)titleForNavigationBar
{
  return (NSString *)&stru_1F1F2FFF8;
}

- (NSString)titleForTableViewCell
{
  return (NSString *)&stru_1F1F2FFF8;
}

+ (id)keyPathsForValuesAffectingCloudAccount
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"owner"];
}

- (NSString)accountName
{
  return 0;
}

- (NSString)containerIdentifier
{
  return 0;
}

- (BOOL)supportsEditingNotes
{
  return 0;
}

- (BOOL)isModernCustomFolder
{
  return 0;
}

- (NSArray)visibleSubFolders
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (NSData)subFolderOrderMergeableData
{
  return 0;
}

- (void)willSave
{
  [(ICNoteContainer *)self saveSubFolderMergeableDataIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)ICNoteContainer;
  [(ICCloudSyncingObject *)&v3 willSave];
}

- (void)saveSubFolderMergeableDataIfNeeded
{
  if ([(ICNoteContainer *)self isSubFolderOrderMergeableDataDirty])
  {
    [(ICNoteContainer *)self writeSubFolderMergeableData];
  }
}

- (BOOL)mergeWithSubFolderMergeableData:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  v5 = [ICTTOrderedSetVersionedDocument alloc];
  char v6 = [(ICCloudSyncingObject *)self currentReplicaID];
  v7 = [(ICTTVersionedDocument *)v5 initWithData:v4 replicaID:v6];

  v8 = [(ICNoteContainer *)self subFolderIdentifiersOrderedSetDocument];
  uint64_t v9 = [v8 mergeWithOrderedSetVersionedDocument:v7];

  BOOL v10 = v9 == 2;
  if (v9 == 2) {
    [(ICNoteContainer *)self setSubFolderOrderMergeableDataDirty:1];
  }

  return v10;
}

- (void)writeSubFolderMergeableData
{
  if ([(ICNoteContainer *)self isSubFolderOrderMergeableDataDirty]) {
    [(ICNoteContainer *)self setSubFolderOrderMergeableDataDirty:0];
  }
  id v4 = [(ICNoteContainer *)self subFolderIdentifiersOrderedSetDocument];
  objc_super v3 = [v4 serialize];
  [(ICNoteContainer *)self setSubFolderOrderMergeableData:v3];
}

- (void)updateSubFolderMergeableDataChangeCount
{
}

- (BOOL)supportsDateHeaders
{
  return 0;
}

- (void)applyDateHeadersType:(int)a3
{
  if (a3 <= 2) {
    -[ICNoteContainer setDateHeadersType:](self, "setDateHeadersType:");
  }
}

- (BOOL)isShowingDateHeaders
{
  return 0;
}

- (void)setSubFolderIdentifiersOrderedSetDocument:(id)a3
{
}

- (void)setSubFolderOrderMergeableDataDirty:(BOOL)a3
{
  self->_subFolderOrderMergeableDataDirty = a3;
}

@end