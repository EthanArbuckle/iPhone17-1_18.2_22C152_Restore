@interface _UICollectionViewListCellVisualProvider_tvOS
- (BOOL)canFocusProgrammatically;
- (id)accessoryManagerContainerView;
- (int64_t)defaultFocusStyle;
- (void)configureFocusedFloatingContentView:(id)a3;
- (void)configureFocusedFloatingContentView:(id)a3 useSidebarListStyle:(BOOL)a4;
@end

@implementation _UICollectionViewListCellVisualProvider_tvOS

- (int64_t)defaultFocusStyle
{
  return 1;
}

- (BOOL)canFocusProgrammatically
{
  return 1;
}

- (id)accessoryManagerContainerView
{
  v3 = [(UICollectionViewCell *)self->super._cell _focusedFloatingContentView];
  cell = [v3 contentView];
  v5 = cell;
  if (!cell) {
    cell = self->super._cell;
  }
  id v6 = cell;

  return v6;
}

- (void)configureFocusedFloatingContentView:(id)a3
{
}

- (void)configureFocusedFloatingContentView:(id)a3 useSidebarListStyle:(BOOL)a4
{
  id v15 = a3;
  id v6 = +[_UIFocusAnimationConfiguration configurationWithStyle:2];
  [v15 setFocusAnimationConfiguration:v6];

  [v15 setBackgroundColor:0 forState:0];
  [v15 setBackgroundColor:0 forState:2];
  [v15 setRoundContentWhenDeselected:0];
  [v15 setClipsContentToBounds:0];
  [v15 setUnfocusedShadowVerticalOffset:10.0];
  objc_msgSend(v15, "setContentMotionRotation:translation:", 0.0, 0.0, 0.0, 4.0);
  if (a4)
  {
    v7 = +[UIColor colorWithWhite:1.0 alpha:0.95];
    [v15 setBackgroundColor:v7 forState:8];

    v8 = +[UIColor colorWithWhite:1.0 alpha:0.95];
    [v15 setBackgroundColor:v8 forState:1];

    v9 = [v15 traitCollection];
    uint64_t v10 = [v9 userInterfaceStyle];

    if (v10 == 2)
    {
      v11 = +[UIColor colorWithRed:0.176470588 green:0.176470588 blue:0.176470588 alpha:0.4];
      uint64_t v12 = 23;
    }
    else
    {
      v11 = +[UIColor colorWithRed:0.850980392 green:0.850980392 blue:0.850980392 alpha:0.3];
      uint64_t v12 = 24;
    }
    [v15 setBackgroundColor:v11 forState:4];
    [v15 setCompositingMode:v12];
    objc_msgSend(v15, "setShadowExpansion:", 30.0, 30.0);
  }
  else
  {
    [v15 setBackgroundColor:0 forState:4];
    [v15 setBackgroundColor:0 forState:8];
    [v15 setBackgroundColor:0 forState:1];
    objc_msgSend(v15, "setShadowExpansion:", 45.0, 25.0);
  }
  v13 = [(UICollectionViewListCell *)self->super._cell _accessoryManager];
  v14 = [(_UICollectionViewListCellVisualProvider_tvOS *)self accessoryManagerContainerView];
  [v13 updateContainerView:v14];
}

@end