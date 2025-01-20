@interface CuratedCollectionActionManager
- (BOOL)collectionIsSaved;
- (BOOL)hasHomePage;
- (CuratedCollectionActionDelegate)delegate;
- (id)_glyphColor;
- (id)_savedItemWithSaveTitle:(id)a3 unsaveTitle:(id)a4;
- (id)createRowActionsWithStyle:(unint64_t)a3;
- (void)performAction:(id)a3 options:(id)a4 completion:(id)a5;
- (void)setCollectionIsSaved:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setHasHomePage:(BOOL)a3;
@end

@implementation CuratedCollectionActionManager

- (id)createRowActionsWithStyle:(unint64_t)a3
{
  id v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = [(CuratedCollectionActionManager *)self _glyphColor];
  if (self->_hasHomePage)
  {
    v6 = +[UIDevice currentDevice];
    id v7 = [v6 userInterfaceIdiom];

    if (v7 != (id)5)
    {
      id v8 = objc_alloc((Class)MKPlaceCardActionItem);
      v9 = +[NSBundle mainBundle];
      v10 = [v9 localizedStringForKey:@"Open_Website_Collection_Action_Row" value:@"localized string not found" table:0];
      id v11 = [v8 initWithType:13 displayString:v10 glyph:@"safari.fill" enabled:1];

      [v4 addObject:v11];
    }
  }
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    v12 = +[NSBundle mainBundle];
    v13 = [v12 localizedStringForKey:@"Remove_Saved_Curated_Collection_from_Library_Action_Row" value:@"localized string not found" table:0];

    v14 = +[NSBundle mainBundle];
    v15 = v14;
    CFStringRef v16 = @"Save_Curated_Collection__from_Library__Action_Row";
  }
  else
  {
    v17 = +[UIDevice currentDevice];
    id v18 = [v17 userInterfaceIdiom];

    v19 = +[NSBundle mainBundle];
    v20 = v19;
    if (v18 == (id)5)
    {
      v13 = [v19 localizedStringForKey:@"Remove_Saved_Curated_Collection_Mac_Action_Row" value:@"localized string not found" table:0];

      v14 = +[NSBundle mainBundle];
      v15 = v14;
      CFStringRef v16 = @"Save_Curated_Collection_Mac_Action_Row";
    }
    else
    {
      v13 = [v19 localizedStringForKey:@"Remove_Saved_Curated_Collection_Action_Row" value:@"localized string not found" table:0];

      v14 = +[NSBundle mainBundle];
      v15 = v14;
      CFStringRef v16 = @"Save_Curated_Collection_Action_Row";
    }
  }
  v21 = [v14 localizedStringForKey:v16 value:@"localized string not found" table:0];

  v22 = [(CuratedCollectionActionManager *)self _savedItemWithSaveTitle:v21 unsaveTitle:v13];
  saveItem = self->_saveItem;
  self->_saveItem = v22;

  [v4 addObject:self->_saveItem];
  id v24 = objc_alloc((Class)MKPlaceCardActionItem);
  v25 = +[NSBundle mainBundle];
  v26 = [v25 localizedStringForKey:@"Share_Collection_Action_Row" value:@"localized string not found" table:0];
  id v27 = [v24 initWithType:16 displayString:v26 glyph:@"square.and.arrow.up" enabled:1];

  if (v5) {
    [v27 setGlyphColor:v5];
  }
  [v4 addObject:v27];

  return v4;
}

- (id)_savedItemWithSaveTitle:(id)a3 unsaveTitle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CuratedCollectionActionManager *)self _glyphColor];
  id v9 = [objc_alloc((Class)MKPlaceCardActionItem) initWithType:6 displayString:v6 glyph:@"checkmark" enabled:1];

  if (v8) {
    [v9 setGlyphColor:v8];
  }
  unsigned int v10 = +[LibraryUIUtilities isMyPlacesEnabled];
  id v11 = @"square.and.arrow.down.fill";
  if (v10) {
    id v11 = @"plus";
  }
  v12 = v11;
  id v13 = [objc_alloc((Class)MKPlaceCardActionItem) initWithType:5 displayString:v7 glyph:v12 enabled:1];

  [v13 setSelectedItem:v9];
  [v13 setSelected:[self collectionIsSaved]];
  if (v8) {
    [v13 setGlyphColor:v8];
  }

  return v13;
}

- (void)performAction:(id)a3 options:(id)a4 completion:(id)a5
{
  id v10 = a4;
  uint64_t v7 = (uint64_t)[a3 type];
  if (v7 > 12)
  {
    if (v7 == 13)
    {
      id v8 = [(CuratedCollectionActionManager *)self delegate];
      [v8 didSelectOpenHomePage];
    }
    else
    {
      if (v7 != 16) {
        goto LABEL_11;
      }
      id v8 = [v10 objectForKeyedSubscript:@"view"];
      id v9 = [(CuratedCollectionActionManager *)self delegate];
      [v9 didSelectShareFromView:v8];
    }
  }
  else if (v7 == 5)
  {
    id v8 = [(CuratedCollectionActionManager *)self delegate];
    [v8 didSelectSaveCollection];
  }
  else
  {
    if (v7 != 6) {
      goto LABEL_11;
    }
    id v8 = [(CuratedCollectionActionManager *)self delegate];
    [v8 didSelectRemoveFromSavedCollection];
  }

LABEL_11:
}

- (void)setCollectionIsSaved:(BOOL)a3
{
  self->_collectionIsSaved = a3;
  -[MKPlaceCardActionItem setSelected:](self->_saveItem, "setSelected:");
  saveItem = self->_saveItem;

  [(MKPlaceCardActionItem *)saveItem setEnabled:1];
}

- (id)_glyphColor
{
  v2 = +[UIDevice currentDevice];
  id v3 = [v2 userInterfaceIdiom];

  if (v3 == (id)5)
  {
    id v4 = +[UIColor lightTextColor];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (CuratedCollectionActionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CuratedCollectionActionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)collectionIsSaved
{
  return self->_collectionIsSaved;
}

- (BOOL)hasHomePage
{
  return self->_hasHomePage;
}

- (void)setHasHomePage:(BOOL)a3
{
  self->_hasHomePage = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_saveItem, 0);
}

@end