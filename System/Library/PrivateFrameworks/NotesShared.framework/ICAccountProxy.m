@interface ICAccountProxy
+ (id)accountProxyWithAccount:(id)a3;
+ (id)keyPathsForValuesAffectingVisibleNotesCount;
- (BOOL)canBeSharedViaICloud;
- (BOOL)isAllNotesContainer;
- (BOOL)isDeleted;
- (BOOL)isLeaf;
- (BOOL)isModernCustomFolder;
- (BOOL)isSharedReadOnly;
- (BOOL)isSharedViaICloud;
- (BOOL)isShowingDateHeaders;
- (BOOL)isTrashFolder;
- (BOOL)mergeWithSubFolderMergeableData:(id)a3;
- (BOOL)noteIsVisible:(id)a3;
- (BOOL)supportsDateHeaders;
- (BOOL)supportsEditingNotes;
- (BOOL)supportsVisibilityTestingType:(int64_t)a3;
- (ICAccount)account;
- (ICAccountProxy)initWithAccount:(id)a3;
- (ICFolderCustomNoteSortType)customNoteSortType;
- (NSArray)visibleNotes;
- (NSArray)visibleSubFolders;
- (NSData)subFolderOrderMergeableData;
- (NSManagedObjectContext)managedObjectContext;
- (NSString)accountName;
- (NSString)containerIdentifier;
- (NSString)titleForNavigationBar;
- (NSString)titleForTableViewCell;
- (id)customNoteSortTypeValue;
- (id)objectID;
- (id)predicateForPinnedNotes;
- (id)predicateForSearchableAttachments;
- (id)predicateForSearchableNotes;
- (id)predicateForVisibleNotes;
- (id)visibleNoteContainerChildren;
- (int)dateHeadersType;
- (int64_t)compare:(id)a3;
- (unint64_t)visibleNotesCount;
- (void)setAccount:(id)a3;
@end

@implementation ICAccountProxy

- (ICAccountProxy)initWithAccount:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICAccountProxy;
  v5 = [(ICAccountProxy *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ICAccountProxy *)v5 setAccount:v4];
  }

  return v6;
}

+ (id)accountProxyWithAccount:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithAccount:v4];

  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = [(ICAccountProxy *)self account];
  int64_t v6 = [v5 compare:v4];

  return v6;
}

- (BOOL)isLeaf
{
  return 1;
}

- (id)objectID
{
  v2 = [(ICAccountProxy *)self account];
  v3 = [v2 objectID];

  return v3;
}

- (NSManagedObjectContext)managedObjectContext
{
  v2 = [(ICAccountProxy *)self account];
  v3 = [v2 managedObjectContext];

  return (NSManagedObjectContext *)v3;
}

- (NSString)accountName
{
  v2 = [(ICAccountProxy *)self account];
  v3 = [v2 localizedName];

  return (NSString *)v3;
}

- (BOOL)supportsVisibilityTestingType:(int64_t)a3
{
  id v4 = [(ICAccountProxy *)self account];
  LOBYTE(a3) = [v4 supportsVisibilityTestingType:a3];

  return a3;
}

- (id)predicateForVisibleNotes
{
  v2 = [(ICAccountProxy *)self account];
  v3 = [v2 predicateForVisibleNotes];

  return v3;
}

- (id)predicateForPinnedNotes
{
  v2 = [(ICAccountProxy *)self account];
  v3 = [v2 predicateForPinnedNotes];

  return v3;
}

- (id)predicateForSearchableNotes
{
  v2 = [(ICAccountProxy *)self account];
  v3 = [v2 predicateForSearchableNotes];

  return v3;
}

- (id)predicateForSearchableAttachments
{
  v2 = [(ICAccountProxy *)self account];
  v3 = [v2 predicateForSearchableAttachments];

  return v3;
}

- (ICFolderCustomNoteSortType)customNoteSortType
{
  return 0;
}

- (NSArray)visibleNotes
{
  v2 = [(ICAccountProxy *)self account];
  v3 = [v2 visibleNotes];

  return (NSArray *)v3;
}

+ (id)keyPathsForValuesAffectingVisibleNotesCount
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"account.visibleNotesCount"];
}

- (unint64_t)visibleNotesCount
{
  v2 = [(ICAccountProxy *)self account];
  unint64_t v3 = [v2 visibleNotesCount];

  return v3;
}

- (BOOL)noteIsVisible:(id)a3
{
  id v4 = a3;
  v5 = [(ICAccountProxy *)self account];
  char v6 = [v5 noteIsVisible:v4];

  return v6;
}

- (NSString)titleForNavigationBar
{
  v2 = [(ICAccountProxy *)self account];
  unint64_t v3 = [v2 titleForNavigationBar];

  return (NSString *)v3;
}

- (NSString)titleForTableViewCell
{
  v2 = [(ICAccountProxy *)self account];
  unint64_t v3 = [v2 titleForTableViewCell];

  return (NSString *)v3;
}

- (id)visibleNoteContainerChildren
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)supportsEditingNotes
{
  return 1;
}

- (BOOL)isDeleted
{
  v2 = [(ICAccountProxy *)self account];
  char v3 = [v2 isDeleted];

  return v3;
}

- (BOOL)isSharedViaICloud
{
  return 0;
}

- (BOOL)isSharedReadOnly
{
  return 0;
}

- (BOOL)canBeSharedViaICloud
{
  return 0;
}

- (BOOL)isAllNotesContainer
{
  return 1;
}

- (BOOL)isModernCustomFolder
{
  return 0;
}

- (BOOL)isTrashFolder
{
  return 0;
}

- (NSString)containerIdentifier
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

- (BOOL)mergeWithSubFolderMergeableData:(id)a3
{
  return 0;
}

- (id)customNoteSortTypeValue
{
  return 0;
}

- (BOOL)supportsDateHeaders
{
  return 0;
}

- (int)dateHeadersType
{
  return 1;
}

- (BOOL)isShowingDateHeaders
{
  return 0;
}

- (ICAccount)account
{
  return (ICAccount *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end