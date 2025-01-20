@interface ICDragSessionContext
- (ICDragSessionContext)initWithModernManagedObjectContext:(id)a3 legacyManagedObjectContext:(id)a4;
- (NSArray)currentDropTargetCells;
- (NSArray)currentDropTargetItemIDs;
- (NSArray)currentSourceObjectIDs;
- (NSManagedObjectContext)legacyManagedObjectContext;
- (NSManagedObjectContext)modernManagedObjectContext;
- (NSManagedObjectID)autoCollapsedFolderObjectID;
- (id)addItemIdentifierIfAppropriate:(id)a3 isEditingCollectionView:(BOOL)a4;
- (id)debugDescription;
- (int64_t)dragSessionType;
- (void)setAutoCollapsedFolderObjectID:(id)a3;
- (void)setCurrentDropTargetCells:(id)a3;
- (void)setCurrentDropTargetItemIDs:(id)a3;
- (void)setDragSessionType:(int64_t)a3;
- (void)updateDropTargetCellsForPinNoteDrop:(BOOL)a3;
@end

@implementation ICDragSessionContext

- (ICDragSessionContext)initWithModernManagedObjectContext:(id)a3 legacyManagedObjectContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ICDragSessionContext;
  v9 = [(ICDragSessionContext *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_modernManagedObjectContext, a3);
    objc_storeStrong((id *)&v10->_legacyManagedObjectContext, a4);
    currentSourceObjectIDs = v10->_currentSourceObjectIDs;
    v10->_currentSourceObjectIDs = (NSArray *)&__NSArray0__struct;
  }
  return v10;
}

- (id)addItemIdentifierIfAppropriate:(id)a3 isEditingCollectionView:(BOOL)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    id v8 = [v7 object];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v6 = v7;
    if (isKindOfClass)
    {
      v10 = [v7 object];
      id v6 = [v10 objectID];
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_38;
  }
  if (objc_msgSend(v6, "ic_isEntityOfClass:", objc_opt_class()))
  {
    if ((id)[(ICDragSessionContext *)self dragSessionType] == (id)1
      || ![(ICDragSessionContext *)self dragSessionType])
    {
      [(ICDragSessionContext *)self setDragSessionType:1];
      v11 = [(ICDragSessionContext *)self modernManagedObjectContext];
      v12 = [v11 objectWithID:v6];

      id v13 = v6;
      v14 = +[ICAppURLUtilities appURLForNote:v12];
      id v15 = v12;
      v16 = [v15 title];
      if ([v15 canBeSharedViaICloud]) {
        id v17 = v15;
      }
      else {
        id v17 = 0;
      }

      if (v6) {
        goto LABEL_23;
      }
      goto LABEL_46;
    }
LABEL_38:
    v34 = 0;
    v14 = 0;
    v16 = 0;
    id v15 = 0;
    id v17 = 0;
LABEL_39:
    id v33 = 0;
    goto LABEL_40;
  }
  if (objc_msgSend(v6, "ic_isEntityOfClass:", objc_opt_class()))
  {
    if ((id)[(ICDragSessionContext *)self dragSessionType] != (id)1
      && [(ICDragSessionContext *)self dragSessionType])
    {
      goto LABEL_38;
    }
    [(ICDragSessionContext *)self setDragSessionType:1];
    v18 = [(ICDragSessionContext *)self legacyManagedObjectContext];
    id v15 = [v18 objectWithID:v6];

    id v19 = v6;
    uint64_t v20 = +[ICAppURLUtilities appURLForHTMLNote:v15];
LABEL_15:
    v14 = (void *)v20;
    v16 = [v15 title];
    id v17 = 0;
    if (!v6) {
      goto LABEL_46;
    }
    goto LABEL_23;
  }
  if (objc_msgSend(v6, "ic_isEntityOfClass:", objc_opt_class()))
  {
    if ([(ICDragSessionContext *)self dragSessionType]) {
      goto LABEL_38;
    }
    [(ICDragSessionContext *)self setDragSessionType:2];
    v21 = [(ICDragSessionContext *)self modernManagedObjectContext];
    v22 = [v21 objectWithID:v6];

    id v23 = v6;
    v14 = +[ICAppURLUtilities appURLForFolder:v22];
    v16 = [v22 titleForTableViewCell];
    if ([v22 canBeSharedViaICloud]) {
      id v17 = v22;
    }
    else {
      id v17 = 0;
    }
  }
  else
  {
    if (!objc_msgSend(v6, "ic_isEntityOfClass:", objc_opt_class()))
    {
      if (!objc_msgSend(v6, "ic_isEntityOfClass:", objc_opt_class())
        || [(ICDragSessionContext *)self dragSessionType])
      {
        goto LABEL_38;
      }
      [(ICDragSessionContext *)self setDragSessionType:3];
      v39 = [(ICDragSessionContext *)self modernManagedObjectContext];
      id v15 = [v39 objectWithID:v6];

      id v40 = v6;
      uint64_t v20 = [v15 shareURL];
      goto LABEL_15;
    }
    if ([(ICDragSessionContext *)self dragSessionType]) {
      goto LABEL_38;
    }
    [(ICDragSessionContext *)self setDragSessionType:2];
    v35 = [(ICDragSessionContext *)self legacyManagedObjectContext];
    v36 = [v35 objectWithID:v6];

    id v37 = v6;
    v14 = +[ICAppURLUtilities appURLForHTMLFolder:v36];
    v16 = [v36 titleForTableViewCell];

    id v17 = 0;
  }
  id v15 = 0;
  if (!v6)
  {
LABEL_46:
    v34 = 0;
    goto LABEL_39;
  }
LABEL_23:
  v24 = [(NSArray *)self->_currentSourceObjectIDs arrayByAddingObject:v6];
  currentSourceObjectIDs = self->_currentSourceObjectIDs;
  self->_currentSourceObjectIDs = v24;

  v26 = [v6 URIRepresentation];
  id v27 = objc_alloc((Class)NSItemProvider);
  if (v15) {
    id v28 = [v27 initWithObject:v15];
  }
  else {
    id v28 = [v27 initWithItem:v26 typeIdentifier:@"com.apple.mobilenotes.managed.object.id.url"];
  }
  v29 = v28;
  [v28 setSuggestedName:v16];
  if (!a4)
  {
    id v30 = [objc_alloc((Class)NSUserActivity) initWithActivityType:@"com.apple.notes.open.object"];
    [v30 setTitle:v16];
    v31 = [v14 absoluteString];
    [v30 setTargetContentIdentifier:v31];

    [v30 setUserInfo:&off_10064B638];
    [v29 registerObject:v30 visibility:0];
  }
  if (v29
    && [v17 canBeSharedViaICloud]
    && [v17 canCurrentUserShare])
  {
    v32 = +[ICCollaborationController sharedInstance];
    [v32 registerShareForObject:v17 itemProvider:v29 generateThumbnails:1];
  }
  id v33 = [objc_alloc((Class)UIDragItem) initWithItemProvider:v29];
  [v33 setLocalObject:v6];

  v34 = v6;
LABEL_40:

  return v33;
}

- (void)updateDropTargetCellsForPinNoteDrop:(BOOL)a3
{
  BOOL v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [(ICDragSessionContext *)self currentDropTargetCells];
  v5 = (char *)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_opt_class();
        v9 = ICDynamicCast();
        [v9 setPinDropTarget:v3];

        ++v8;
      }
      while (v6 != v8);
      id v6 = (char *)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (id)debugDescription
{
  uint64_t v3 = objc_opt_class();
  v4 = (char *)[(ICDragSessionContext *)self dragSessionType] - 1;
  if ((unint64_t)v4 > 2) {
    CFStringRef v5 = @"ICDragSessionContextTypeUndefined";
  }
  else {
    CFStringRef v5 = *(&off_100626C00 + (void)v4);
  }
  id v6 = [(ICDragSessionContext *)self currentSourceObjectIDs];
  uint64_t v7 = [(ICDragSessionContext *)self currentDropTargetItemIDs];
  id v8 = +[NSString stringWithFormat:@"<%@: %p> dragSessionType: %@, currentSourceObjectIDs: %@, currentDropTargetItemIDs: %@", v3, self, v5, v6, v7];

  return v8;
}

- (int64_t)dragSessionType
{
  return self->_dragSessionType;
}

- (void)setDragSessionType:(int64_t)a3
{
  self->_dragSessionType = a3;
}

- (NSArray)currentDropTargetCells
{
  return self->_currentDropTargetCells;
}

- (void)setCurrentDropTargetCells:(id)a3
{
}

- (NSArray)currentDropTargetItemIDs
{
  return self->_currentDropTargetItemIDs;
}

- (void)setCurrentDropTargetItemIDs:(id)a3
{
}

- (NSArray)currentSourceObjectIDs
{
  return self->_currentSourceObjectIDs;
}

- (NSManagedObjectID)autoCollapsedFolderObjectID
{
  return self->_autoCollapsedFolderObjectID;
}

- (void)setAutoCollapsedFolderObjectID:(id)a3
{
}

- (NSManagedObjectContext)modernManagedObjectContext
{
  return self->_modernManagedObjectContext;
}

- (NSManagedObjectContext)legacyManagedObjectContext
{
  return self->_legacyManagedObjectContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyManagedObjectContext, 0);
  objc_storeStrong((id *)&self->_modernManagedObjectContext, 0);
  objc_storeStrong((id *)&self->_autoCollapsedFolderObjectID, 0);
  objc_storeStrong((id *)&self->_currentSourceObjectIDs, 0);
  objc_storeStrong((id *)&self->_currentDropTargetItemIDs, 0);

  objc_storeStrong((id *)&self->_currentDropTargetCells, 0);
}

@end