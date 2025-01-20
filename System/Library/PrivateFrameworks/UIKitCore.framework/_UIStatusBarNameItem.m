@interface _UIStatusBarNameItem
- (NSString)nameEntryKey;
- (_UIStatusBarStringView)nameView;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (id)dependentEntryKeys;
- (void)_create_nameView;
- (void)setNameView:(id)a3;
@end

@implementation _UIStatusBarNameItem

- (id)dependentEntryKeys
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(_UIStatusBarNameItem *)self nameEntryKey];
  v4 = [v2 setWithObject:v3];

  return v4;
}

- (_UIStatusBarStringView)nameView
{
  nameView = self->_nameView;
  if (!nameView)
  {
    [(_UIStatusBarNameItem *)self _create_nameView];
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
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_UIStatusBarNameItem;
  v8 = [(_UIStatusBarItem *)&v16 applyUpdate:v6 toDisplayItem:v7];
  if ([v6 dataChanged])
  {
    v9 = [v6 data];
    v10 = [(_UIStatusBarNameItem *)self nameEntryKey];
    v11 = [v9 valueForKey:v10];

    if ([v7 isEnabled]) {
      uint64_t v12 = [v11 isEnabled];
    }
    else {
      uint64_t v12 = 0;
    }
    [v7 setEnabled:v12];
    if ([v7 isEnabled])
    {
      v13 = [v11 stringValue];
      v14 = [(_UIStatusBarNameItem *)self nameView];
      [v14 setText:v13];
    }
  }

  return v8;
}

- (NSString)nameEntryKey
{
  return self->_nameEntryKey;
}

- (void)setNameView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameView, 0);
  objc_storeStrong((id *)&self->_nameEntryKey, 0);
}

@end