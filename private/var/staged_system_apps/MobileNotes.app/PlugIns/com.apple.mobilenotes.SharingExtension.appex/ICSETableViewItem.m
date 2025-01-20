@interface ICSETableViewItem
+ (id)tableViewItemFromObject:(id)a3 selectedNote:(id)a4 selectedFolder:(id)a5 isSearchResult:(BOOL)a6 isAccountPicker:(BOOL)a7;
+ (id)tableViewItemsForObjects:(id)a3 selectedNote:(id)a4 selectedFolder:(id)a5 isSearchResult:(BOOL)a6 noteContainer:(id)a7 isAccountPicker:(BOOL)a8;
+ (void)configureTableViewNibs:(id)a3;
- (BOOL)isAccountFolder;
- (BOOL)isAccountHeader;
- (BOOL)isAccountPicker;
- (BOOL)isChecked;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInFolderList;
- (BOOL)isSearchResult;
- (BOOL)isSelectable;
- (BOOL)isSystemPaperFolder;
- (ICAccount)account;
- (ICFolder)folder;
- (ICFolder)selectedFolder;
- (ICNote)note;
- (ICNote)selectedNote;
- (ICNoteContainer)noteContainer;
- (ICSEFolderListItem)folderListItem;
- (NSString)cellIdentifier;
- (NSString)secondaryTitle;
- (NSString)title;
- (UIEdgeInsets)seperatorInsets;
- (UIImage)image;
- (double)cellHeight;
- (unint64_t)hash;
- (void)setAccount:(id)a3;
- (void)setFolder:(id)a3;
- (void)setFolderListItem:(id)a3;
- (void)setIsAccountFolder:(BOOL)a3;
- (void)setIsAccountHeader:(BOOL)a3;
- (void)setIsAccountPicker:(BOOL)a3;
- (void)setIsHeader:(BOOL)a3;
- (void)setIsInFolderList:(BOOL)a3;
- (void)setIsSearchResult:(BOOL)a3;
- (void)setIsSystemPaperFolder:(BOOL)a3;
- (void)setNote:(id)a3;
- (void)setNoteContainer:(id)a3;
- (void)setSecondaryTitle:(id)a3;
- (void)setSelectedFolder:(id)a3;
- (void)setSelectedNote:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation ICSETableViewItem

- (double)cellHeight
{
  double v3 = sub_1000051CC();
  if ([(ICSETableViewItem *)self isSearchResult]
    || ICAccessibilityAccessibilityLargerTextSizesEnabled())
  {
    return UITableViewAutomaticDimension;
  }
  return v3;
}

- (UIEdgeInsets)seperatorInsets
{
  if ([(ICSETableViewItem *)self isSearchResult])
  {
    double v3 = 52.0;
  }
  else if ([(ICSETableViewItem *)self isInFolderList] {
         && ([(ICSETableViewItem *)self folderListItem],
  }
             v4 = objc_claimAutoreleasedReturnValue(),
             v4,
             v4))
  {
    v5 = [(ICSETableViewItem *)self folderListItem];
    v6 = (char *)[v5 level] - 1;

    double v3 = (double)(unint64_t)v6 * 33.0 + 53.0;
  }
  else
  {
    v7 = [(ICSETableViewItem *)self folder];
    if (v7)
    {

      double v3 = 53.0;
    }
    else
    {
      unsigned int v8 = [(ICSETableViewItem *)self isAccountFolder];
      double v3 = 53.0;
      if (!v8) {
        double v3 = 41.0;
      }
    }
  }
  double v9 = 0.0;
  double v10 = 0.0;
  double v11 = 0.0;
  result.right = v11;
  result.bottom = v10;
  result.left = v3;
  result.top = v9;
  return result;
}

- (BOOL)isSelectable
{
  if ([(ICSETableViewItem *)self isHeader]) {
    return 0;
  }
  double v3 = [(ICSETableViewItem *)self note];
  unsigned __int8 v4 = [v3 isPasswordProtected];

  if (v4) {
    return 0;
  }
  uint64_t v5 = [(ICSETableViewItem *)self note];
  if (!v5) {
    goto LABEL_5;
  }
  v6 = (void *)v5;
  v7 = [(ICSETableViewItem *)self note];
  unsigned int v8 = [v7 isEditable];

  if (!v8) {
    return 0;
  }
LABEL_5:
  uint64_t v9 = [(ICSETableViewItem *)self folder];
  if (!v9) {
    return 1;
  }
  double v10 = (void *)v9;
  double v11 = [(ICSETableViewItem *)self folder];
  if ([v11 canMoveAddOrDeleteContents])
  {
    unsigned __int8 v12 = 1;
  }
  else
  {
    v14 = [(ICSETableViewItem *)self folder];
    unsigned __int8 v12 = [v14 isSystemFolder];
  }
  return v12;
}

- (BOOL)isChecked
{
  double v3 = [(ICSETableViewItem *)self note];
  unsigned __int8 v4 = [(ICSETableViewItem *)self selectedNote];
  uint64_t v5 = [(ICSETableViewItem *)self selectedFolder];
  v6 = [(ICSETableViewItem *)self account];
  if (v4) {
    v7 = v4;
  }
  else {
    v7 = v5;
  }
  unsigned int v8 = [v7 account];
  uint64_t v9 = [(ICSETableViewItem *)self note];

  if (v9)
  {
    double v10 = v3;
    double v11 = v4;
LABEL_6:
    LOBYTE(v12) = [v10 isEqual:v11];
    goto LABEL_7;
  }
  uint64_t v14 = [(ICSETableViewItem *)self account];
  if (!v14)
  {
    LOBYTE(v12) = 0;
    goto LABEL_7;
  }
  v15 = (void *)v14;
  unsigned int v12 = [(ICSETableViewItem *)self isAccountPicker];

  if (v12)
  {
    double v10 = v8;
    double v11 = v6;
    goto LABEL_6;
  }
LABEL_7:

  return v12;
}

- (UIImage)image
{
  if ([(ICSETableViewItem *)self isHeader]) {
    goto LABEL_2;
  }
  if ([(ICSETableViewItem *)self isChecked])
  {
    uint64_t v4 = +[UIImage systemImageNamed:@"checkmark"];
    goto LABEL_11;
  }
  uint64_t v5 = [(ICSETableViewItem *)self note];
  unsigned int v6 = [v5 isPasswordProtected];

  if (v6)
  {
    CFStringRef v7 = @"lock.fill";
LABEL_10:
    uint64_t v4 = +[UIImage ic_smallSystemImageNamed:v7];
    goto LABEL_11;
  }
  unsigned int v8 = [(ICSETableViewItem *)self note];
  if ([v8 isSharedViaICloud])
  {
    uint64_t v9 = [(ICSETableViewItem *)self noteContainer];
    unsigned __int8 v10 = [v9 isSharedViaICloud];

    if ((v10 & 1) == 0)
    {
      CFStringRef v7 = @"person.crop.circle";
      goto LABEL_10;
    }
  }
  else
  {
  }
  unsigned int v12 = [(ICSETableViewItem *)self folder];
  if (v12)
  {

LABEL_19:
    v13 = [(ICSETableViewItem *)self folder];
    uint64_t v14 = [v13 systemImageName];
    v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      id v16 = +[ICFolder defaultSystemImageName];
    }
    v17 = v16;

    double v3 = +[UIImage ic_systemImageNamed:v17];

    goto LABEL_12;
  }
  if ([(ICSETableViewItem *)self isAccountFolder]) {
    goto LABEL_19;
  }
  if (![(ICSETableViewItem *)self isSystemPaperFolder])
  {
LABEL_2:
    double v3 = 0;
    goto LABEL_12;
  }
  uint64_t v4 = +[UIImage ic_systemImageNamed:@"quicknote"];
LABEL_11:
  double v3 = (void *)v4;
LABEL_12:

  return (UIImage *)v3;
}

- (NSString)cellIdentifier
{
  if ([(ICSETableViewItem *)self isSearchResult])
  {
    double v3 = [(ICSETableViewItem *)self note];

    if (v3) {
      return (NSString *)@"SearchResultNoteCell";
    }
    uint64_t v5 = [(ICSETableViewItem *)self folder];
    if (v5 || [(ICSETableViewItem *)self isSystemPaperFolder])
    {

      return (NSString *)@"SearchResultFolderCell";
    }
    if ([(ICSETableViewItem *)self isAccountFolder]) {
      return (NSString *)@"SearchResultFolderCell";
    }
    unsigned int v6 = os_log_create("com.apple.notes", "SharingExtension");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000B5D14(v6);
    }
  }
  return (NSString *)@"NoteCell";
}

+ (id)tableViewItemFromObject:(id)a3 selectedNote:(id)a4 selectedFolder:(id)a5 isSearchResult:(BOOL)a6 isAccountPicker:(BOOL)a7
{
  uint64_t v7 = a7;
  BOOL v41 = a6;
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  objc_opt_class();
  v13 = ICDynamicCast();
  objc_opt_class();
  uint64_t v14 = ICDynamicCast();
  objc_opt_class();
  v15 = ICDynamicCast();
  objc_opt_class();
  id v16 = ICDynamicCast();

  if (v16)
  {
    if ([v16 isAccount])
    {
      objc_opt_class();
      v17 = [v16 noteContainer];
      uint64_t v18 = ICDynamicCast();
      v19 = v15;
      v15 = (void *)v18;
    }
    else
    {
      objc_opt_class();
      v17 = [v16 noteContainer];
      uint64_t v20 = ICDynamicCast();
      v19 = v14;
      uint64_t v14 = (void *)v20;
    }
  }
  if ([v13 isDeletedOrInTrash])
  {

    v13 = 0;
  }
  if ([v14 isTrashFolder])
  {

    uint64_t v14 = 0;
  }
  if (v16 || v13 || v14 || v15)
  {
    v21 = objc_alloc_init(ICSETableViewItem);
    [(ICSETableViewItem *)v21 setNote:v13];
    [(ICSETableViewItem *)v21 setFolder:v14];
    [(ICSETableViewItem *)v21 setAccount:v15];
    [(ICSETableViewItem *)v21 setFolderListItem:v16];
    [(ICSETableViewItem *)v21 setSelectedNote:v10];
    [(ICSETableViewItem *)v21 setSelectedFolder:v11];
    v22 = [v13 title];
    if (v14)
    {
      v23 = [v14 localizedTitle];
      id v24 = [v23 copy];
      v25 = v22;
      v26 = v15;
      id v27 = v11;
      id v28 = v10;
      uint64_t v29 = v7;
      id v30 = v24;

      v31 = v30;
      uint64_t v7 = v29;
      id v10 = v28;
      id v11 = v27;
      v15 = v26;
      v22 = v31;
    }
    [(ICSETableViewItem *)v21 setTitle:v22];
    [(ICSETableViewItem *)v21 setIsSearchResult:v41];
    [(ICSETableViewItem *)v21 setIsAccountPicker:v7];
    if (v15)
    {
      v32 = [v15 accountName];
      v33 = v32;
      if (v7)
      {
        [(ICSETableViewItem *)v21 setTitle:v32];
      }
      else
      {
        [v32 localizedUppercaseString];
        v42 = v22;
        v34 = v15;
        id v35 = v11;
        id v36 = v10;
        uint64_t v7 = v37 = v7;
        [(ICSETableViewItem *)v21 setTitle:v7];

        LODWORD(v7) = v37;
        id v10 = v36;
        id v11 = v35;
        v15 = v34;
        v22 = v42;
      }

      [(ICSETableViewItem *)v21 setIsAccountHeader:v7 ^ 1];
    }
    if (v13)
    {
      v38 = [v13 modificationDate];
      v39 = [v38 ic_briefFormattedDate];
      [(ICSETableViewItem *)v21 setSecondaryTitle:v39];
    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (id)tableViewItemsForObjects:(id)a3 selectedNote:(id)a4 selectedFolder:(id)a5 isSearchResult:(BOOL)a6 noteContainer:(id)a7 isAccountPicker:(BOOL)a8
{
  BOOL v25 = a8;
  BOOL v9 = a6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v13, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v13;
  id v18 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(obj);
        }
        v22 = [a1 tableViewItemFromObject:*(void *)(*((void *)&v26 + 1) + 8 * i) selectedNote:v14 selectedFolder:v15 isSearchResult:v9 isAccountPicker:v25];
        [v22 setNoteContainer:v16];
        [v17 ic_addNonNilObject:v22];
      }
      id v19 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v19);
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unsigned int v6 = [v5 note];
    uint64_t v7 = [(ICSETableViewItem *)self note];
    if (v6 == v7)
    {
      BOOL v10 = 1;
    }
    else
    {
      unsigned int v8 = [v5 folder];
      BOOL v9 = [(ICSETableViewItem *)self folder];
      BOOL v10 = v8 == v9;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  double v3 = [(ICSETableViewItem *)self note];
  id v4 = [v3 hash];
  id v5 = [(ICSETableViewItem *)self folder];
  char v6 = [v5 hash];
  unint64_t v14 = sub_10001302C((uint64_t)v4, v7, v8, v9, v10, v11, v12, v13, v6);

  return v14;
}

+ (void)configureTableViewNibs:(id)a3
{
  id v3 = a3;
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = +[UINib nibWithNibName:@"ICSETableViewCell" bundle:v4];

  [v3 registerNib:v5 forCellReuseIdentifier:@"NoteCell"];
  char v6 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v7 = +[UINib nibWithNibName:@"ICSEFolderSearchResultTableViewCell" bundle:v6];

  [v3 registerNib:v7 forCellReuseIdentifier:@"SearchResultFolderCell"];
  uint64_t v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = +[UINib nibWithNibName:@"ICSENoteSearchResultTableViewCell" bundle:v8];

  [v3 registerNib:v9 forCellReuseIdentifier:@"SearchResultNoteCell"];
}

- (BOOL)isSearchResult
{
  return self->_isSearchResult;
}

- (void)setIsSearchResult:(BOOL)a3
{
  self->_isSearchResult = a3;
}

- (void)setIsHeader:(BOOL)a3
{
  self->_isHeader = a3;
}

- (BOOL)isAccountPicker
{
  return self->_isAccountPicker;
}

- (void)setIsAccountPicker:(BOOL)a3
{
  self->_isAccountPicker = a3;
}

- (BOOL)isInFolderList
{
  return self->_isInFolderList;
}

- (void)setIsInFolderList:(BOOL)a3
{
  self->_isInFolderList = a3;
}

- (BOOL)isAccountHeader
{
  return self->_isAccountHeader;
}

- (void)setIsAccountHeader:(BOOL)a3
{
  self->_isAccountHeader = a3;
}

- (ICFolder)folder
{
  return self->_folder;
}

- (void)setFolder:(id)a3
{
}

- (ICNote)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
}

- (ICAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (ICSEFolderListItem)folderListItem
{
  return self->_folderListItem;
}

- (void)setFolderListItem:(id)a3
{
}

- (BOOL)isAccountFolder
{
  return self->_isAccountFolder;
}

- (void)setIsAccountFolder:(BOOL)a3
{
  self->_isAccountFolder = a3;
}

- (BOOL)isSystemPaperFolder
{
  return self->_isSystemPaperFolder;
}

- (void)setIsSystemPaperFolder:(BOOL)a3
{
  self->_isSystemPaperFolder = a3;
}

- (ICNote)selectedNote
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectedNote);

  return (ICNote *)WeakRetained;
}

- (void)setSelectedNote:(id)a3
{
}

- (ICFolder)selectedFolder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectedFolder);

  return (ICFolder *)WeakRetained;
}

- (void)setSelectedFolder:(id)a3
{
}

- (ICNoteContainer)noteContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_noteContainer);

  return (ICNoteContainer *)WeakRetained;
}

- (void)setNoteContainer:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)secondaryTitle
{
  return self->_secondaryTitle;
}

- (void)setSecondaryTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_noteContainer);
  objc_destroyWeak((id *)&self->_selectedFolder);
  objc_destroyWeak((id *)&self->_selectedNote);
  objc_storeStrong((id *)&self->_folderListItem, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_note, 0);

  objc_storeStrong((id *)&self->_folder, 0);
}

@end