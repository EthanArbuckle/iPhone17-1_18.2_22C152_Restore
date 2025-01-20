@interface _UIStatusBarNavigationItem
- (_UIStatusBarStringView)nameView;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (id)createDisplayItemForIdentifier:(id)a3;
- (id)dependentEntryKeys;
- (void)_create_nameView;
- (void)setNameView:(id)a3;
@end

@implementation _UIStatusBarNavigationItem

- (id)dependentEntryKeys
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"backNavigationEntry"];
}

- (id)createDisplayItemForIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarNavigationItem;
  v3 = [(_UIStatusBarItem *)&v6 createDisplayItemForIdentifier:a3];
  v4 = +[_UIStatusBarSystemNavigationAction backNavigationAction];
  [v3 setAction:v4];

  objc_msgSend(v3, "setActionInsets:", -100.0, -20.0, -10.0, -20.0);
  return v3;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_UIStatusBarNavigationItem;
  v7 = [(_UIStatusBarItem *)&v19 applyUpdate:v6 toDisplayItem:a4];
  if (([v6 dataChanged] & 1) != 0 || objc_msgSend(v6, "styleAttributesChanged"))
  {
    v8 = [v6 styleAttributes];
    uint64_t v9 = [v8 effectiveLayoutDirection];
    v10 = @"\u200E◀︎ %@";
    if (v9 == 1) {
      v10 = @"\u200F▶︎ %@";
    }
    v11 = v10;

    v12 = NSString;
    v13 = [v6 data];
    v14 = [v13 backNavigationEntry];
    v15 = [v14 stringValue];
    v16 = objc_msgSend(v12, "localizedStringWithFormat:", v11, v15);

    v17 = [(_UIStatusBarNavigationItem *)self nameView];
    [v17 setText:v16];
  }
  return v7;
}

- (_UIStatusBarStringView)nameView
{
  nameView = self->_nameView;
  if (!nameView)
  {
    [(_UIStatusBarNavigationItem *)self _create_nameView];
    nameView = self->_nameView;
  }
  return nameView;
}

- (void)_create_nameView
{
  v3 = [_UIStatusBarStringView alloc];
  v4 = -[_UIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  nameView = self->_nameView;
  self->_nameView = v4;

  LODWORD(v6) = 1132068864;
  [(UIView *)self->_nameView setContentCompressionResistancePriority:0 forAxis:v6];
  v7 = self->_nameView;
  [v7 setAccessibilityIdentifier:@"breadcrumb"];
}

- (void)setNameView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end