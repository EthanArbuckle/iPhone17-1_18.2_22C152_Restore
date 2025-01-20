@interface _UIStatusBarCellularExpandedItem
+ (_UIStatusBarIdentifier)badgeDisplayIdentifier;
+ (id)groupWithHighPriority:(int64_t)a3 lowPriority:(int64_t)a4 typeClass:(Class)a5 allowDualNetwork:(BOOL)a6;
- (_UIStatusBarBadgeView)badgeView;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (id)viewForIdentifier:(id)a3;
- (void)_create_badgeView;
- (void)setBadgeView:(id)a3;
@end

@implementation _UIStatusBarCellularExpandedItem

+ (_UIStatusBarIdentifier)badgeDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"badgeDisplayIdentifier"];
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_UIStatusBarCellularExpandedItem;
  v7 = [(_UIStatusBarCellularItem *)&v16 applyUpdate:a3 toDisplayItem:v6];
  v8 = [v6 identifier];
  v9 = [(_UIStatusBarCellularItem *)self entryForDisplayItemWithIdentifier:v8];

  v10 = [v6 identifier];
  v11 = [(id)objc_opt_class() badgeDisplayIdentifier];

  if (v10 == v11)
  {
    v12 = [v9 badgeString];
    if ([v6 isEnabled]) {
      BOOL v13 = [v12 length] != 0;
    }
    else {
      BOOL v13 = 0;
    }
    [v6 setEnabled:v13];
    if ([v6 isEnabled])
    {
      v14 = [(_UIStatusBarCellularExpandedItem *)self badgeView];
      [v14 setText:v12];
    }
  }

  return v7;
}

- (_UIStatusBarBadgeView)badgeView
{
  badgeView = self->_badgeView;
  if (!badgeView)
  {
    [(_UIStatusBarCellularExpandedItem *)self _create_badgeView];
    badgeView = self->_badgeView;
  }
  return badgeView;
}

- (void)_create_badgeView
{
  v3 = [_UIStatusBarBadgeView alloc];
  v4 = -[_UIStatusBarBadgeView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  badgeView = self->_badgeView;
  self->_badgeView = v4;
}

- (id)viewForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() badgeDisplayIdentifier];

  if (v5 == v4)
  {
    uint64_t v6 = [(_UIStatusBarCellularExpandedItem *)self badgeView];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_UIStatusBarCellularExpandedItem;
    uint64_t v6 = [(_UIStatusBarCellularItem *)&v9 viewForIdentifier:v4];
  }
  v7 = (void *)v6;

  return v7;
}

- (void)setBadgeView:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)groupWithHighPriority:(int64_t)a3 lowPriority:(int64_t)a4 typeClass:(Class)a5 allowDualNetwork:(BOOL)a6
{
  v20[7] = *MEMORY[0x1E4F143B8];
  v19.receiver = a1;
  v19.super_class = (Class)&OBJC_METACLASS____UIStatusBarCellularExpandedItem;
  v8 = objc_msgSendSuper2(&v19, sel_groupWithHighPriority_lowPriority_typeClass_allowDualNetwork_, a3, a4, a5, a6);
  objc_super v9 = [a1 badgeDisplayIdentifier];
  v10 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v9 priority:a3 + 1];

  [v8 setBadgePlacement:v10];
  v11 = [v8 signalStrengthPlacement];
  v20[0] = v11;
  v12 = [v8 warningPlacement];
  v20[1] = v12;
  BOOL v13 = [v8 rawPlacement];
  v20[2] = v13;
  v20[3] = v10;
  v14 = [v8 namePlacement];
  v20[4] = v14;
  v15 = [v8 typePlacement];
  v20[5] = v15;
  objc_super v16 = [v8 callForwardingPlacement];
  v20[6] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:7];
  [v8 setPlacements:v17];

  return v8;
}

@end