@interface ICWindowStateArchive
+ (ICWindowStateArchive)windowStateArchiveWithEmptyState;
+ (id)windowStateArchiveFromDictionary:(id)a3;
- (BOOL)isActiveEditorInEditMode;
- (BOOL)isAttachmentBrowserOpen;
- (BOOL)isAuxiliaryWindow;
- (BOOL)isPrimaryContentVisible;
- (BOOL)isSupplementaryContentVisible;
- (BOOL)isSystemPaper;
- (BOOL)isTrailingContentVisible;
- (BOOL)shouldStartEditing;
- (ICActivityStreamSelection)currentActivityStreamSelection;
- (ICVirtualSmartFolderItemIdentifier)currentVirtualSmartFolderIdentifier;
- (ICWindowStateArchive)init;
- (ICWindowStateArchive)initWithDictionary:(id)a3;
- (NSArray)currentContainerObjectIDURLs;
- (NSArray)currentTagIdentifiers;
- (NSArray)initialSystemPaperImageData;
- (NSData)selectionState;
- (NSDate)currentNoteLastViewedDate;
- (NSDictionary)archiveDictionary;
- (NSDictionary)currentFirstVisibleObjectIDURLForContainerObjectIDURL;
- (NSDictionary)expansionState;
- (NSDictionary)stateDictionary;
- (NSNumber)mainSplitViewPrimaryColumnWidth;
- (NSNumber)mainSplitViewSupplementaryColumnWidth;
- (NSString)currentSearchTerm;
- (NSString)currentVirtualSmartFolderType;
- (NSString)hostApplicationIdentifier;
- (NSString)toolPickerIdentifier;
- (NSString)windowIdentifier;
- (NSURL)currentInvitationObjectIDURL;
- (NSURL)currentNoteObjectIDURL;
- (NSURL)currentObjectIDURL;
- (NSURL)currentVirtualSmartFolderAccountObjectIDURL;
- (NSURL)focusedNoteObjectIDURL;
- (SYContentItem)initialSystemPaperLink;
- (id)description;
- (id)scrollStateForNote:(id)a3;
- (int64_t)currentActivityStreamViewMode;
- (int64_t)currentNoteContainerViewMode;
- (int64_t)noteCreationApproach;
- (int64_t)preferredNoteContainerViewMode;
- (void)setActiveEditorInEditMode:(BOOL)a3;
- (void)setAttachmentBrowserOpen:(BOOL)a3;
- (void)setCurrentActivityStreamSelection:(id)a3;
- (void)setCurrentActivityStreamViewMode:(int64_t)a3;
- (void)setCurrentContainerObjectIDURLs:(id)a3;
- (void)setCurrentFirstVisibleObjectIDURLForContainerObjectIDURL:(id)a3;
- (void)setCurrentInvitationObjectIDURL:(id)a3;
- (void)setCurrentNoteContainerViewMode:(int64_t)a3;
- (void)setCurrentNoteLastViewedDate:(id)a3;
- (void)setCurrentNoteObjectIDURL:(id)a3;
- (void)setCurrentObjectIDURL:(id)a3;
- (void)setCurrentSearchTerm:(id)a3;
- (void)setCurrentTagIdentifiers:(id)a3;
- (void)setCurrentVirtualSmartFolderAccountObjectIDURL:(id)a3;
- (void)setCurrentVirtualSmartFolderIdentifier:(id)a3;
- (void)setCurrentVirtualSmartFolderType:(id)a3;
- (void)setExpansionState:(id)a3;
- (void)setFocusedNoteObjectIDURL:(id)a3;
- (void)setHostApplicationIdentifier:(id)a3;
- (void)setInitialSystemPaperImageData:(id)a3;
- (void)setInitialSystemPaperLink:(id)a3;
- (void)setIsAuxiliaryWindow:(BOOL)a3;
- (void)setIsPrimaryContentVisible:(BOOL)a3;
- (void)setIsSupplementaryContentVisible:(BOOL)a3;
- (void)setIsTrailingContentVisible:(BOOL)a3;
- (void)setMainSplitViewPrimaryColumnWidth:(id)a3;
- (void)setMainSplitViewSupplementaryColumnWidth:(id)a3;
- (void)setNoteCreationApproach:(int64_t)a3;
- (void)setPreferredNoteContainerViewMode:(int64_t)a3;
- (void)setScrollState:(id)a3;
- (void)setSelectionState:(id)a3;
- (void)setShouldStartEditing:(BOOL)a3;
- (void)setStateDictionary:(id)a3;
- (void)setSystemPaper:(BOOL)a3;
- (void)setToolPickerIdentifier:(id)a3;
- (void)setWindowIdentifier:(id)a3;
@end

@implementation ICWindowStateArchive

- (NSString)hostApplicationIdentifier
{
  v2 = [(ICWindowStateArchive *)self stateDictionary];
  v3 = [v2 objectForKeyedSubscript:@"hostApplicationIdentifier"];

  return (NSString *)v3;
}

- (NSString)toolPickerIdentifier
{
  v2 = [(ICWindowStateArchive *)self stateDictionary];
  v3 = [v2 objectForKeyedSubscript:@"toolPickerIdentifier"];

  return (NSString *)v3;
}

- (NSString)currentSearchTerm
{
  v2 = [(ICWindowStateArchive *)self stateDictionary];
  v3 = [v2 objectForKeyedSubscript:@"currentSearchTerm"];

  return (NSString *)v3;
}

- (NSData)selectionState
{
  v2 = [(ICWindowStateArchive *)self stateDictionary];
  v3 = [v2 objectForKeyedSubscript:@"kICWindowStateSelectionState"];

  return (NSData *)v3;
}

- (ICWindowStateArchive)init
{
  v6[0] = @"isPrimaryContentVisible";
  v6[1] = @"isSupplementaryContentVisible";
  v7[0] = &__kCFBooleanFalse;
  v7[1] = &__kCFBooleanTrue;
  v6[2] = @"isTrailingContentVisible";
  v7[2] = &__kCFBooleanFalse;
  v3 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];
  v4 = [(ICWindowStateArchive *)self initWithDictionary:v3];

  return v4;
}

- (NSDictionary)expansionState
{
  v2 = [(ICWindowStateArchive *)self stateDictionary];
  v3 = [v2 objectForKeyedSubscript:@"kICWindowStateExpansionState"];

  return (NSDictionary *)v3;
}

- (int64_t)preferredNoteContainerViewMode
{
  v2 = [(ICWindowStateArchive *)self stateDictionary];
  v3 = [v2 objectForKeyedSubscript:@"kICWindowStatePreferredNoteContainerViewMode"];

  if (v3) {
    int64_t v4 = (int64_t)[v3 integerValue];
  }
  else {
    int64_t v4 = -1;
  }

  return v4;
}

- (ICWindowStateArchive)initWithDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICWindowStateArchive;
  v5 = [(ICWindowStateArchive *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ICWindowStateArchive *)v5 setStateDictionary:v4];
  }

  return v6;
}

- (BOOL)isAttachmentBrowserOpen
{
  v2 = [(ICWindowStateArchive *)self stateDictionary];
  v3 = [v2 objectForKeyedSubscript:@"attachmentBrowserOpen"];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (int64_t)noteCreationApproach
{
  v2 = [(ICWindowStateArchive *)self stateDictionary];
  v3 = [v2 objectForKeyedSubscript:@"createNewNoteApproach"];
  id v4 = [v3 integerValue];

  return (int64_t)v4;
}

- (NSURL)currentNoteObjectIDURL
{
  v2 = [(ICWindowStateArchive *)self stateDictionary];
  v3 = [v2 objectForKeyedSubscript:@"currentNoteObjectID"];

  if (v3)
  {
    id v4 = +[NSURL URLWithString:v3];
  }
  else
  {
    id v4 = 0;
  }

  return (NSURL *)v4;
}

- (NSArray)currentContainerObjectIDURLs
{
  v2 = [(ICWindowStateArchive *)self stateDictionary];
  v3 = [v2 objectForKeyedSubscript:@"currentContainerObjectIDURLs"];

  id v4 = [v3 ic_compactMap:&stru_100626CC8];

  return (NSArray *)v4;
}

- (NSURL)currentObjectIDURL
{
  v2 = [(ICWindowStateArchive *)self stateDictionary];
  v3 = [v2 objectForKeyedSubscript:@"currentObjectID"];

  if (v3)
  {
    id v4 = +[NSURL URLWithString:v3];
  }
  else
  {
    id v4 = 0;
  }

  return (NSURL *)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateDictionary, 0);
  objc_storeStrong((id *)&self->_currentVirtualSmartFolderIdentifier, 0);
  objc_storeStrong((id *)&self->_initialSystemPaperImageData, 0);
  objc_storeStrong((id *)&self->_initialSystemPaperLink, 0);

  objc_storeStrong((id *)&self->_archiveDictionary, 0);
}

- (void)setCurrentContainerObjectIDURLs:(id)a3
{
  [a3 ic_compactMap:&stru_100626D08];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [(ICWindowStateArchive *)self stateDictionary];
  id v5 = [v4 mutableCopy];

  [v5 setObject:v7 forKeyedSubscript:@"currentContainerObjectIDURLs"];
  id v6 = [v5 copy];
  [(ICWindowStateArchive *)self setStateDictionary:v6];
}

- (NSString)windowIdentifier
{
  v2 = [(ICWindowStateArchive *)self stateDictionary];
  v3 = [v2 objectForKeyedSubscript:@"windowIdentifier"];

  if (!v3)
  {
    id v4 = +[NSUUID UUID];
    v3 = [v4 UUIDString];
  }

  return (NSString *)v3;
}

- (void)setCurrentNoteContainerViewMode:(int64_t)a3
{
  id v5 = [(ICWindowStateArchive *)self stateDictionary];
  id v8 = [v5 mutableCopy];

  id v6 = +[NSNumber numberWithInteger:a3];
  [v8 setObject:v6 forKeyedSubscript:@"currentNoteContainerViewMode"];

  id v7 = [v8 copy];
  [(ICWindowStateArchive *)self setStateDictionary:v7];
}

- (void)setIsAuxiliaryWindow:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ICWindowStateArchive *)self stateDictionary];
  id v8 = [v5 mutableCopy];

  id v6 = +[NSNumber numberWithBool:v3];
  [v8 setObject:v6 forKeyedSubscript:@"isAuxiliaryWindow"];

  id v7 = [v8 copy];
  [(ICWindowStateArchive *)self setStateDictionary:v7];
}

- (void)setIsPrimaryContentVisible:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ICWindowStateArchive *)self stateDictionary];
  id v8 = [v5 mutableCopy];

  id v6 = +[NSNumber numberWithBool:v3];
  [v8 setObject:v6 forKeyedSubscript:@"isPrimaryContentVisible"];

  id v7 = [v8 copy];
  [(ICWindowStateArchive *)self setStateDictionary:v7];
}

- (void)setIsSupplementaryContentVisible:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ICWindowStateArchive *)self stateDictionary];
  id v8 = [v5 mutableCopy];

  id v6 = +[NSNumber numberWithBool:v3];
  [v8 setObject:v6 forKeyedSubscript:@"isSupplementaryContentVisible"];

  id v7 = [v8 copy];
  [(ICWindowStateArchive *)self setStateDictionary:v7];
}

- (void)setCurrentNoteObjectIDURL:(id)a3
{
  id v4 = a3;
  id v5 = [(ICWindowStateArchive *)self stateDictionary];
  id v8 = [v5 mutableCopy];

  id v6 = [v4 absoluteString];

  [v8 setObject:v6 forKeyedSubscript:@"currentNoteObjectID"];
  id v7 = [v8 copy];
  [(ICWindowStateArchive *)self setStateDictionary:v7];
}

- (id)scrollStateForNote:(id)a3
{
  id v4 = a3;
  id v5 = [(ICWindowStateArchive *)self stateDictionary];
  id v6 = [v5 objectForKeyedSubscript:@"scrollState"];

  objc_opt_class();
  id v7 = ICDynamicCast();

  if (v7) {
    id v8 = [objc_alloc((Class)ICTextViewScrollState) initWithDictionary:v7 note:v4];
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (void)setCurrentObjectIDURL:(id)a3
{
  id v4 = a3;
  id v5 = [(ICWindowStateArchive *)self stateDictionary];
  id v8 = [v5 mutableCopy];

  id v6 = [v4 absoluteString];

  [v8 setObject:v6 forKeyedSubscript:@"currentObjectID"];
  id v7 = [v8 copy];
  [(ICWindowStateArchive *)self setStateDictionary:v7];
}

- (void)setStateDictionary:(id)a3
{
}

- (int64_t)currentNoteContainerViewMode
{
  v2 = [(ICWindowStateArchive *)self stateDictionary];
  BOOL v3 = [v2 objectForKeyedSubscript:@"currentNoteContainerViewMode"];

  if (v3) {
    id v4 = [v3 integerValue];
  }
  else {
    id v4 = 0;
  }

  return (int64_t)v4;
}

- (BOOL)isSystemPaper
{
  v2 = [(ICWindowStateArchive *)self stateDictionary];
  BOOL v3 = [v2 objectForKeyedSubscript:@"isSystemPaper"];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isAuxiliaryWindow
{
  v2 = [(ICWindowStateArchive *)self stateDictionary];
  BOOL v3 = [v2 objectForKeyedSubscript:@"isAuxiliaryWindow"];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (NSDictionary)stateDictionary
{
  return self->_stateDictionary;
}

- (ICVirtualSmartFolderItemIdentifier)currentVirtualSmartFolderIdentifier
{
  return self->_currentVirtualSmartFolderIdentifier;
}

- (NSArray)currentTagIdentifiers
{
  v2 = [(ICWindowStateArchive *)self stateDictionary];
  BOOL v3 = [v2 objectForKeyedSubscript:@"currentTagIdentifiers"];

  return (NSArray *)v3;
}

- (void)setCurrentTagIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(ICWindowStateArchive *)self stateDictionary];
  id v7 = [v5 mutableCopy];

  [v7 setObject:v4 forKeyedSubscript:@"currentTagIdentifiers"];
  id v6 = [v7 copy];
  [(ICWindowStateArchive *)self setStateDictionary:v6];
}

- (NSString)currentVirtualSmartFolderType
{
  v2 = [(ICWindowStateArchive *)self stateDictionary];
  BOOL v3 = [v2 objectForKeyedSubscript:@"currentVirtualSmartFolderType"];

  return (NSString *)v3;
}

- (void)setCurrentVirtualSmartFolderType:(id)a3
{
  id v4 = a3;
  id v5 = [(ICWindowStateArchive *)self stateDictionary];
  id v7 = [v5 mutableCopy];

  [v7 setObject:v4 forKeyedSubscript:@"currentVirtualSmartFolderType"];
  id v6 = [v7 copy];
  [(ICWindowStateArchive *)self setStateDictionary:v6];
}

- (NSURL)currentVirtualSmartFolderAccountObjectIDURL
{
  v2 = [(ICWindowStateArchive *)self stateDictionary];
  BOOL v3 = [v2 objectForKeyedSubscript:@"currentVirtualSmartFolderAccountObjectIDURL"];

  if (v3)
  {
    id v4 = +[NSURL URLWithString:v3];
  }
  else
  {
    id v4 = 0;
  }

  return (NSURL *)v4;
}

- (void)setCurrentVirtualSmartFolderAccountObjectIDURL:(id)a3
{
  id v4 = a3;
  id v5 = [(ICWindowStateArchive *)self stateDictionary];
  id v8 = [v5 mutableCopy];

  id v6 = [v4 absoluteString];

  [v8 setObject:v6 forKeyedSubscript:@"currentVirtualSmartFolderAccountObjectIDURL"];
  id v7 = [v8 copy];
  [(ICWindowStateArchive *)self setStateDictionary:v7];
}

- (NSDictionary)currentFirstVisibleObjectIDURLForContainerObjectIDURL
{
  v2 = [(ICWindowStateArchive *)self stateDictionary];
  BOOL v3 = [v2 objectForKeyedSubscript:@"firstVisibleIdentifierForContainerIdentifier"];

  id v4 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v3 count]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v11 = [v5 objectForKeyedSubscript:v10];
        v12 = +[NSURL URLWithString:v11];
        v13 = +[NSURL URLWithString:v10];
        [v4 setObject:v12 forKeyedSubscript:v13];
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return (NSDictionary *)v4;
}

- (void)setCurrentFirstVisibleObjectIDURLForContainerObjectIDURL:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v12 = [v6 objectForKeyedSubscript:v11];
        v13 = [v12 absoluteString];
        v14 = [v11 absoluteString];
        [v5 setObject:v13 forKeyedSubscript:v14];
      }
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  long long v15 = [(ICWindowStateArchive *)self stateDictionary];
  id v16 = [v15 mutableCopy];

  id v17 = [v5 copy];
  [v16 setObject:v17 forKeyedSubscript:@"firstVisibleIdentifierForContainerIdentifier"];

  id v18 = [v16 copy];
  [(ICWindowStateArchive *)self setStateDictionary:v18];
}

- (NSURL)currentInvitationObjectIDURL
{
  v2 = [(ICWindowStateArchive *)self stateDictionary];
  BOOL v3 = [v2 objectForKeyedSubscript:@"currentInvitationObjectID"];

  if (v3)
  {
    id v4 = +[NSURL URLWithString:v3];
  }
  else
  {
    id v4 = 0;
  }

  return (NSURL *)v4;
}

- (void)setCurrentInvitationObjectIDURL:(id)a3
{
  id v4 = a3;
  id v5 = [(ICWindowStateArchive *)self stateDictionary];
  id v8 = [v5 mutableCopy];

  id v6 = [v4 absoluteString];

  [v8 setObject:v6 forKeyedSubscript:@"currentInvitationObjectID"];
  id v7 = [v8 copy];
  [(ICWindowStateArchive *)self setStateDictionary:v7];
}

- (NSURL)focusedNoteObjectIDURL
{
  v2 = [(ICWindowStateArchive *)self stateDictionary];
  BOOL v3 = [v2 objectForKeyedSubscript:@"focusedNoteObjectIDURL"];

  if (v3)
  {
    id v4 = +[NSURL URLWithString:v3];
  }
  else
  {
    id v4 = 0;
  }

  return (NSURL *)v4;
}

- (void)setFocusedNoteObjectIDURL:(id)a3
{
  id v4 = a3;
  id v5 = [(ICWindowStateArchive *)self stateDictionary];
  id v8 = [v5 mutableCopy];

  id v6 = [v4 absoluteString];

  [v8 setObject:v6 forKeyedSubscript:@"focusedNoteObjectIDURL"];
  id v7 = [v8 copy];
  [(ICWindowStateArchive *)self setStateDictionary:v7];
}

- (void)setCurrentSearchTerm:(id)a3
{
  id v4 = a3;
  id v5 = [(ICWindowStateArchive *)self stateDictionary];
  id v7 = [v5 mutableCopy];

  [v7 setObject:v4 forKeyedSubscript:@"currentSearchTerm"];
  id v6 = [v7 copy];
  [(ICWindowStateArchive *)self setStateDictionary:v6];
}

- (void)setPreferredNoteContainerViewMode:(int64_t)a3
{
  id v5 = [(ICWindowStateArchive *)self stateDictionary];
  id v8 = [v5 mutableCopy];

  id v6 = +[NSNumber numberWithInteger:a3];
  [v8 setObject:v6 forKeyedSubscript:@"kICWindowStatePreferredNoteContainerViewMode"];

  id v7 = [v8 copy];
  [(ICWindowStateArchive *)self setStateDictionary:v7];
}

- (ICActivityStreamSelection)currentActivityStreamSelection
{
  v2 = [(ICWindowStateArchive *)self stateDictionary];
  BOOL v3 = [v2 objectForKeyedSubscript:@"currentActivityStreamSelection"];

  if (v3)
  {
    id v4 = +[ICActivityStreamSelection selectionFromData:v3];
  }
  else
  {
    id v4 = 0;
  }

  return (ICActivityStreamSelection *)v4;
}

- (void)setCurrentActivityStreamSelection:(id)a3
{
  id v4 = a3;
  id v5 = [(ICWindowStateArchive *)self stateDictionary];
  id v8 = [v5 mutableCopy];

  id v6 = [v4 encodedData];

  [v8 setObject:v6 forKeyedSubscript:@"currentActivityStreamSelection"];
  id v7 = [v8 copy];
  [(ICWindowStateArchive *)self setStateDictionary:v7];
}

- (int64_t)currentActivityStreamViewMode
{
  v2 = [(ICWindowStateArchive *)self stateDictionary];
  BOOL v3 = [v2 objectForKeyedSubscript:@"currentActivityStreamViewMode"];

  if (v3) {
    id v4 = [v3 integerValue];
  }
  else {
    id v4 = 0;
  }

  return (int64_t)v4;
}

- (void)setCurrentActivityStreamViewMode:(int64_t)a3
{
  id v5 = [(ICWindowStateArchive *)self stateDictionary];
  id v8 = [v5 mutableCopy];

  id v6 = +[NSNumber numberWithInteger:a3];
  [v8 setObject:v6 forKeyedSubscript:@"currentActivityStreamViewMode"];

  id v7 = [v8 copy];
  [(ICWindowStateArchive *)self setStateDictionary:v7];
}

- (BOOL)isPrimaryContentVisible
{
  v2 = [(ICWindowStateArchive *)self stateDictionary];
  BOOL v3 = [v2 objectForKeyedSubscript:@"isPrimaryContentVisible"];

  LOBYTE(v2) = [v3 BOOLValue];
  return (char)v2;
}

- (BOOL)isSupplementaryContentVisible
{
  v2 = [(ICWindowStateArchive *)self stateDictionary];
  BOOL v3 = [v2 objectForKeyedSubscript:@"isSupplementaryContentVisible"];

  LOBYTE(v2) = [v3 BOOLValue];
  return (char)v2;
}

- (BOOL)isTrailingContentVisible
{
  v2 = [(ICWindowStateArchive *)self stateDictionary];
  BOOL v3 = [v2 objectForKeyedSubscript:@"isTrailingContentVisible"];

  LOBYTE(v2) = [v3 BOOLValue];
  return (char)v2;
}

- (void)setIsTrailingContentVisible:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ICWindowStateArchive *)self stateDictionary];
  id v8 = [v5 mutableCopy];

  id v6 = +[NSNumber numberWithBool:v3];
  [v8 setObject:v6 forKeyedSubscript:@"isTrailingContentVisible"];

  id v7 = [v8 copy];
  [(ICWindowStateArchive *)self setStateDictionary:v7];
}

- (NSNumber)mainSplitViewPrimaryColumnWidth
{
  v2 = [(ICWindowStateArchive *)self stateDictionary];
  BOOL v3 = [v2 objectForKeyedSubscript:@"mainSplitViewPrimaryColumnWidth"];

  return (NSNumber *)v3;
}

- (void)setMainSplitViewPrimaryColumnWidth:(id)a3
{
  id v4 = a3;
  id v5 = [(ICWindowStateArchive *)self stateDictionary];
  id v7 = [v5 mutableCopy];

  [v7 setObject:v4 forKeyedSubscript:@"mainSplitViewPrimaryColumnWidth"];
  id v6 = [v7 copy];
  [(ICWindowStateArchive *)self setStateDictionary:v6];
}

- (NSNumber)mainSplitViewSupplementaryColumnWidth
{
  v2 = [(ICWindowStateArchive *)self stateDictionary];
  BOOL v3 = [v2 objectForKeyedSubscript:@"mainSplitViewSupplementaryColumnWidth"];

  return (NSNumber *)v3;
}

- (void)setMainSplitViewSupplementaryColumnWidth:(id)a3
{
  id v4 = a3;
  id v5 = [(ICWindowStateArchive *)self stateDictionary];
  id v7 = [v5 mutableCopy];

  [v7 setObject:v4 forKeyedSubscript:@"mainSplitViewSupplementaryColumnWidth"];
  id v6 = [v7 copy];
  [(ICWindowStateArchive *)self setStateDictionary:v6];
}

- (void)setExpansionState:(id)a3
{
  id v4 = a3;
  id v5 = [(ICWindowStateArchive *)self stateDictionary];
  id v7 = [v5 mutableCopy];

  [v7 setObject:v4 forKeyedSubscript:@"kICWindowStateExpansionState"];
  id v6 = [v7 copy];
  [(ICWindowStateArchive *)self setStateDictionary:v6];
}

- (NSDate)currentNoteLastViewedDate
{
  v2 = [(ICWindowStateArchive *)self stateDictionary];
  BOOL v3 = [v2 objectForKeyedSubscript:@"currentNoteLastViewedDate"];

  return (NSDate *)v3;
}

- (void)setCurrentNoteLastViewedDate:(id)a3
{
  id v4 = a3;
  id v5 = [(ICWindowStateArchive *)self stateDictionary];
  id v8 = [v5 mutableCopy];

  id v6 = [v4 copy];
  [v8 setObject:v6 forKeyedSubscript:@"currentNoteLastViewedDate"];

  id v7 = [v8 copy];
  [(ICWindowStateArchive *)self setStateDictionary:v7];
}

- (void)setWindowIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(ICWindowStateArchive *)self stateDictionary];
  id v7 = [v5 mutableCopy];

  [v7 setObject:v4 forKeyedSubscript:@"windowIdentifier"];
  id v6 = [v7 copy];
  [(ICWindowStateArchive *)self setStateDictionary:v6];
}

- (void)setNoteCreationApproach:(int64_t)a3
{
  id v5 = [(ICWindowStateArchive *)self stateDictionary];
  id v8 = [v5 mutableCopy];

  id v6 = +[NSNumber numberWithInteger:a3];
  [v8 setObject:v6 forKeyedSubscript:@"createNewNoteApproach"];

  id v7 = [v8 copy];
  [(ICWindowStateArchive *)self setStateDictionary:v7];
}

- (void)setToolPickerIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(ICWindowStateArchive *)self stateDictionary];
  id v8 = [v5 mutableCopy];

  id v6 = [v4 copy];
  [v8 setObject:v6 forKeyedSubscript:@"toolPickerIdentifier"];

  id v7 = [v8 copy];
  [(ICWindowStateArchive *)self setStateDictionary:v7];
}

- (void)setSystemPaper:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ICWindowStateArchive *)self stateDictionary];
  id v8 = [v5 mutableCopy];

  id v6 = +[NSNumber numberWithBool:v3];
  [v8 setObject:v6 forKeyedSubscript:@"isSystemPaper"];

  id v7 = [v8 copy];
  [(ICWindowStateArchive *)self setStateDictionary:v7];
}

- (void)setHostApplicationIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(ICWindowStateArchive *)self stateDictionary];
  id v8 = [v5 mutableCopy];

  id v6 = [v4 copy];
  [v8 setObject:v6 forKeyedSubscript:@"hostApplicationIdentifier"];

  id v7 = [v8 copy];
  [(ICWindowStateArchive *)self setStateDictionary:v7];
}

- (void)setAttachmentBrowserOpen:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ICWindowStateArchive *)self stateDictionary];
  id v8 = [v5 mutableCopy];

  id v6 = +[NSNumber numberWithBool:v3];
  [v8 setObject:v6 forKeyedSubscript:@"attachmentBrowserOpen"];

  id v7 = [v8 copy];
  [(ICWindowStateArchive *)self setStateDictionary:v7];
}

- (BOOL)isActiveEditorInEditMode
{
  v2 = [(ICWindowStateArchive *)self stateDictionary];
  BOOL v3 = [v2 objectForKeyedSubscript:@"activeEditorInEditMode"];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setActiveEditorInEditMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ICWindowStateArchive *)self stateDictionary];
  id v8 = [v5 mutableCopy];

  id v6 = +[NSNumber numberWithBool:v3];
  [v8 setObject:v6 forKeyedSubscript:@"activeEditorInEditMode"];

  id v7 = [v8 copy];
  [(ICWindowStateArchive *)self setStateDictionary:v7];
}

- (void)setScrollState:(id)a3
{
  id v7 = [a3 dictionaryRepresentation];
  if (v7)
  {
    unsigned __int8 v4 = [(ICWindowStateArchive *)self stateDictionary];
    id v5 = [v4 mutableCopy];

    [v5 setObject:v7 forKeyedSubscript:@"scrollState"];
    id v6 = [v5 copy];
    [(ICWindowStateArchive *)self setStateDictionary:v6];
  }
}

- (void)setSelectionState:(id)a3
{
  id v4 = a3;
  id v5 = [(ICWindowStateArchive *)self stateDictionary];
  id v7 = [v5 mutableCopy];

  [v7 ic_setNonNilObject:v4 forNonNilKey:@"kICWindowStateSelectionState"];
  id v6 = [v7 copy];
  [(ICWindowStateArchive *)self setStateDictionary:v6];
}

+ (id)windowStateArchiveFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [[ICWindowStateArchive alloc] initWithDictionary:v3];

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ICWindowStateArchive;
  id v3 = [(ICWindowStateArchive *)&v7 description];
  id v4 = [(ICWindowStateArchive *)self stateDictionary];
  id v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

+ (ICWindowStateArchive)windowStateArchiveWithEmptyState
{
  id v2 = [objc_alloc((Class)a1) initWithDictionary:&__NSDictionary0__struct];

  return (ICWindowStateArchive *)v2;
}

- (NSDictionary)archiveDictionary
{
  return self->_archiveDictionary;
}

- (SYContentItem)initialSystemPaperLink
{
  return self->_initialSystemPaperLink;
}

- (void)setInitialSystemPaperLink:(id)a3
{
}

- (NSArray)initialSystemPaperImageData
{
  return self->_initialSystemPaperImageData;
}

- (void)setInitialSystemPaperImageData:(id)a3
{
}

- (BOOL)shouldStartEditing
{
  return self->_shouldStartEditing;
}

- (void)setShouldStartEditing:(BOOL)a3
{
  self->_shouldStartEditing = a3;
}

- (void)setCurrentVirtualSmartFolderIdentifier:(id)a3
{
}

@end