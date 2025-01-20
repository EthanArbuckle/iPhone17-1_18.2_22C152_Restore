@interface _UITabSidebarCell
- (void)_updateDisabledStateIfNeeded;
- (void)prepareForReuse;
- (void)pushCurrentStateIntoSidebarItem;
- (void)setEditing:(BOOL)a3;
- (void)setSidebarItem:(uint64_t)a1;
@end

@implementation _UITabSidebarCell

- (void)pushCurrentStateIntoSidebarItem
{
  if (a1)
  {
    v2 = (void *)a1[109];
    if (v2)
    {
      id v3 = v2;
      v4 = [a1 configurationState];
      [v3 setConfigurationState:v4];

      v5 = [a1 contentConfiguration];
      [v3 setContentConfiguration:v5];

      id v6 = [a1 backgroundConfiguration];
      [v3 setBackgroundConfiguration:v6];
    }
  }
}

- (void)setSidebarItem:(uint64_t)a1
{
  id v13 = a2;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 868))
    {
      id v3 = *(void **)(a1 + 872);
      id v4 = v13;
      id v5 = v3;
      if (v5 == v4)
      {

        goto LABEL_13;
      }
      id v6 = v5;
      if (v4 && v5)
      {
        char v7 = [v4 isEqual:v5];

        if (v7) {
          goto LABEL_13;
        }
      }
      else
      {
      }
    }
    uint64_t v8 = [v13 copy];
    v9 = *(void **)(a1 + 872);
    *(void *)(a1 + 872) = v8;

    if (v13) {
      *(unsigned char *)(a1 + 868) |= 1u;
    }
    v10 = [v13 contentConfiguration];
    [(id)a1 setContentConfiguration:v10];

    v11 = [v13 backgroundConfiguration];
    [(id)a1 setBackgroundConfiguration:v11];

    v12 = [v13 _resolvedAccessories];
    [(id)a1 setAccessories:v12];

    -[_UITabSidebarCell _updateDisabledStateIfNeeded](a1);
  }
LABEL_13:
}

- (void)_updateDisabledStateIfNeeded
{
  if (!a1) {
    return;
  }
  id v2 = *(id *)(a1 + 872);
  id v8 = v2;
  if (!v2 || (*(unsigned char *)(a1 + 868) & 1) == 0) {
    goto LABEL_4;
  }
  id v4 = [v2 action];
  if (v4)
  {

LABEL_11:
    if ([(id)a1 isEditing])
    {
      int v3 = 1;
      goto LABEL_5;
    }
    char v7 = [v8 action];
    int v3 = [v7 attributes] & 1;
LABEL_14:

    goto LABEL_5;
  }
  id v5 = [v8 tab];
  int v6 = [v5 _isAction];

  if (v6) {
    goto LABEL_11;
  }
  if (([(id)a1 isEditing] & 1) == 0)
  {
    char v7 = [v8 tab];
    int v3 = [v7 isDisabled];
    goto LABEL_14;
  }
LABEL_4:
  int v3 = 0;
LABEL_5:
  [(id)a1 setUserInteractionEnabled:v3 ^ 1u];
}

- (void)setEditing:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UITabSidebarCell;
  [(UICollectionViewListCell *)&v4 setEditing:a3];
  -[_UITabSidebarCell _updateDisabledStateIfNeeded]((uint64_t)self);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)_UITabSidebarCell;
  [(UICollectionViewListCell *)&v3 prepareForReuse];
  if (self) {
    *((unsigned char *)&self->_sidebarCellFlags + 4) &= ~1u;
  }
}

- (void).cxx_destruct
{
}

@end