@interface TabBarItemLayoutInfo
- (BOOL)_requiresViews;
- (BOOL)canClose;
- (BOOL)hasViews;
- (BOOL)hidesTitleText;
- (BOOL)isLeadingEdgeVisible;
- (BOOL)isRemovedFromTabBar;
- (BOOL)isReordering;
- (BOOL)isTrailingActiveItem;
- (BOOL)isTrailingEdgeVisible;
- (BOOL)isVisibleInTabBar;
- (BOOL)tabEntityIsPrimaryForView:(id)a3;
- (CGRect)frame;
- (TabBar)tabBar;
- (TabBarItem)tabBarItem;
- (TabBarItemLayoutInfo)init;
- (TabBarItemLayoutInfo)initWithTabBar:(id)a3 item:(id)a4;
- (TabBarItemView)tabBarItemPreviewView;
- (TabBarItemView)tabBarItemView;
- (TabBarItemView)viewForDragPreview;
- (double)contentOffset;
- (double)titleAnchorAdditionalOffset;
- (double)titleLayoutWidth;
- (id)_reusableView;
- (id)tabEntityUUIDForView:(id)a3;
- (int64_t)_visibleEdge;
- (unint64_t)activeAnimationCount;
- (void)_clearView:(id)a3;
- (void)_clearViews;
- (void)_clearViewsIfNeeded;
- (void)_updateHidesTitleText;
- (void)clearPreviewView;
- (void)closeButtonTapped:(id)a3;
- (void)dealloc;
- (void)itemDidUpdateIcon;
- (void)itemDidUpdateIsActive;
- (void)itemDidUpdateIsPinned;
- (void)itemDidUpdateIsPlaceholder;
- (void)itemDidUpdateIsUnread;
- (void)itemDidUpdateMediaState;
- (void)itemDidUpdateShareParticipants;
- (void)itemDidUpdateTitle;
- (void)mediaStateMuteButtonTapped:(id)a3;
- (void)setActiveAnimationCount:(unint64_t)a3;
- (void)setCanClose:(BOOL)a3;
- (void)setContentOffset:(double)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHidesTitleText:(BOOL)a3;
- (void)setLeadingEdgeVisible:(BOOL)a3;
- (void)setRemovedFromTabBar:(BOOL)a3;
- (void)setReordering:(BOOL)a3;
- (void)setTitleAnchorAdditionalOffset:(double)a3;
- (void)setTitleLayoutWidth:(double)a3;
- (void)setTrailingActiveItem:(BOOL)a3;
- (void)setTrailingEdgeVisible:(BOOL)a3;
- (void)setVisibleInTabBar:(BOOL)a3;
- (void)updateTabBarStyle;
- (void)updateTitleTruncation;
@end

@implementation TabBarItemLayoutInfo

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
  -[TabBarItemView setFrame:](self->_tabBarItemView, "setFrame:");
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  itemSnapshotView = self->_itemSnapshotView;
  -[UIView setFrame:](itemSnapshotView, "setFrame:", x, y, width, height);
}

- (int64_t)_visibleEdge
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarItem);
  if ([WeakRetained isPinned])
  {
    BOOL trailingEdgeVisible = self->_trailingEdgeVisible;

    if (trailingEdgeVisible) {
      return 2;
    }
  }
  else
  {
  }
  if (self->_trailingActiveItem)
  {
    if (self->_trailingEdgeVisible) {
      return 2;
    }
  }
  else if (self->_leadingEdgeVisible)
  {
    return 1;
  }
  return 0;
}

void __37__TabBarItemLayoutInfo__reusableView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  id v2 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  uint64_t v3 = [v2 _requestReusableTabBarItemView];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setActive:", objc_msgSend(WeakRetained, "isActive"));
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setIsPlaceholder:", objc_msgSend(WeakRetained, "isPlaceholder"));
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setFrame:", *(double *)(*(void *)(a1 + 32) + 88), *(double *)(*(void *)(a1 + 32) + 96), *(double *)(*(void *)(a1 + 32) + 104), *(double *)(*(void *)(a1 + 32) + 112));
  if (*(unsigned char *)(*(void *)(a1 + 32) + 37)) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isPlaceholder];
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setHidesTitleText:v6];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setReordering:*(unsigned __int8 *)(*(void *)(a1 + 32) + 33)];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setTitleAnchorAdditionalOffset:*(double *)(*(void *)(a1 + 32) + 64)];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 36)) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setTitleAnchorEdge:v7];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setTitleLayoutWidth:*(double *)(*(void *)(a1 + 32) + 56)];
  v8 = [WeakRetained title];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setTitleText:v8];

  v9 = [WeakRetained icon];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setIcon:v9];

  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setHidesTitleText:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "hidesTitleText"));
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setVisibleEdge:", objc_msgSend(*(id *)(a1 + 32), "_visibleEdge"));
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setMediaStateIcon:", objc_msgSend(WeakRetained, "mediaStateIcon"));
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setPinned:", objc_msgSend(WeakRetained, "isPinned"));
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setUnread:", objc_msgSend(WeakRetained, "isUnread"));
  v10 = [WeakRetained shareParticipants];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setShareParticipants:v10];

  v11 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) mediaStateMuteButton];
  [v11 addTarget:*(void *)(a1 + 32) action:sel_mediaStateMuteButtonTapped_ forControlEvents:0x2000];

  v12 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) closeButton];
  [v12 setHidden:*(unsigned char *)(*(void *)(a1 + 32) + 32) == 0];
  [v12 addTarget:*(void *)(a1 + 32) action:sel_closeButtonTapped_ forControlEvents:64];
}

- (void)_clearViewsIfNeeded
{
  if (![(TabBarItemLayoutInfo *)self _requiresViews])
  {
    [(TabBarItemLayoutInfo *)self _clearViews];
  }
}

- (BOOL)_requiresViews
{
  if (self->_removedFromTabBar) {
    return 0;
  }
  if (self->_visibleInTabBar) {
    return 1;
  }
  return self->_activeAnimationCount != 0;
}

- (BOOL)isVisibleInTabBar
{
  return self->_visibleInTabBar;
}

- (TabBarItemView)tabBarItemView
{
  if (!self->_tabBarItemView && [(TabBarItemLayoutInfo *)self _requiresViews])
  {
    uint64_t v3 = [(TabBarItemLayoutInfo *)self _reusableView];
    tabBarItemView = self->_tabBarItemView;
    self->_tabBarItemView = v3;

    [(TabBarItemView *)self->_tabBarItemView safari_setTabEntityProviderWithInfoProvider:self];
  }
  v5 = self->_tabBarItemView;
  return v5;
}

- (void)setVisibleInTabBar:(BOOL)a3
{
  self->_visibleInTabBar = a3;
  [(TabBarItemLayoutInfo *)self _clearViewsIfNeeded];
}

- (void)setTrailingEdgeVisible:(BOOL)a3
{
  self->_BOOL trailingEdgeVisible = a3;
  int64_t v4 = [(TabBarItemLayoutInfo *)self _visibleEdge];
  tabBarItemView = self->_tabBarItemView;
  [(TabBarItemView *)tabBarItemView setVisibleEdge:v4];
}

- (void)setTrailingActiveItem:(BOOL)a3
{
  if (self->_trailingActiveItem != a3)
  {
    self->_trailingActiveItem = a3;
    [(TabBarItemView *)self->_tabBarItemView setVisibleEdge:[(TabBarItemLayoutInfo *)self _visibleEdge]];
    if (self->_trailingActiveItem) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 1;
    }
    [(TabBarItemView *)self->_tabBarItemView setTitleAnchorEdge:v4];
    if (self->_activeAnimationCount)
    {
      [(UIView *)self->_itemSnapshotView removeFromSuperview];
      v5 = [(TabBarItemView *)self->_tabBarItemView snapshotViewAfterScreenUpdates:0];
      itemSnapshotView = self->_itemSnapshotView;
      self->_itemSnapshotView = v5;

      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __46__TabBarItemLayoutInfo_setTrailingActiveItem___block_invoke;
      v7[3] = &unk_1E6D77E20;
      v7[4] = self;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v7];
    }
  }
}

- (void)setTitleLayoutWidth:(double)a3
{
  self->_titleLayoutWidth = a3;
  [(TabBarItemView *)self->_tabBarItemView setTitleLayoutWidth:"setTitleLayoutWidth:"];
}

- (void)setTitleAnchorAdditionalOffset:(double)a3
{
  self->_titleAnchorAdditionalOffset = a3;
  -[TabBarItemView setTitleAnchorAdditionalOffset:](self->_tabBarItemView, "setTitleAnchorAdditionalOffset:");
}

- (void)setLeadingEdgeVisible:(BOOL)a3
{
  self->_leadingEdgeVisible = a3;
  int64_t v4 = [(TabBarItemLayoutInfo *)self _visibleEdge];
  tabBarItemView = self->_tabBarItemView;
  [(TabBarItemView *)tabBarItemView setVisibleEdge:v4];
}

- (void)setHidesTitleText:(BOOL)a3
{
  self->_hidesTitleText = a3;
  [(TabBarItemLayoutInfo *)self _updateHidesTitleText];
}

- (void)setContentOffset:(double)a3
{
  self->_contentOffset = a3;
  -[TabBarItemView setContentOffset:](self->_tabBarItemView, "setContentOffset:");
}

- (void)_updateHidesTitleText
{
  if (self->_hidesTitleText)
  {
    uint64_t v3 = 1;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarItem);
    uint64_t v3 = [WeakRetained isPlaceholder];
  }
  tabBarItemView = self->_tabBarItemView;
  [(TabBarItemView *)tabBarItemView setHidesTitleText:v3];
}

- (void)setActiveAnimationCount:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_activeAnimationCount != a3)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v5 = [(TabBarItemView *)self->_tabBarItemView closeButton];
    uint64_t v6 = [v5 interactions];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v11 invalidate];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  self->_activeAnimationCount = a3;
  [(TabBarItemLayoutInfo *)self _clearViewsIfNeeded];
  if (self->_activeAnimationCount)
  {
    [(UIView *)self->_itemSnapshotView removeFromSuperview];
    itemSnapshotView = self->_itemSnapshotView;
    self->_itemSnapshotView = 0;
  }
}

- (void)setCanClose:(BOOL)a3
{
  self->_canClose = a3;
  BOOL v3 = !a3;
  id v4 = [(TabBarItemView *)self->_tabBarItemView closeButton];
  [v4 setHidden:v3];
}

- (TabBarItemLayoutInfo)initWithTabBar:(id)a3 item:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TabBarItemLayoutInfo;
  uint64_t v8 = [(TabBarItemLayoutInfo *)&v12 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_tabBar, v6);
    objc_storeWeak((id *)&v9->_tabBarItem, v7);
    uint64_t v10 = v9;
  }

  return v9;
}

- (id)_reusableView
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__7;
  uint64_t v9 = __Block_byref_object_dispose__7;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__TabBarItemLayoutInfo__reusableView__block_invoke;
  v4[3] = &unk_1E6D78BA0;
  v4[4] = self;
  v4[5] = &v5;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (unint64_t)activeAnimationCount
{
  return self->_activeAnimationCount;
}

uint64_t __45__TabBarItemLayoutInfo_itemDidUpdateIsActive__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setActive:*(unsigned __int8 *)(a1 + 40)];
}

- (void)itemDidUpdateIsActive
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarItem);
  char v4 = [WeakRetained isActive];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__TabBarItemLayoutInfo_itemDidUpdateIsActive__block_invoke;
  v6[3] = &unk_1E6D781E8;
  v6[4] = self;
  char v7 = v4;
  [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:2 animations:v6 completion:0];
  if ([(TabBarItemLayoutInfo *)self hasViews])
  {
    id v5 = objc_loadWeakRetained((id *)&self->_tabBar);
    [v5 setNeedsLayout];
  }
}

- (BOOL)hasViews
{
  return self->_tabBarItemView != 0;
}

- (void)itemDidUpdateIcon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarItem);
  id v4 = [WeakRetained icon];

  [(TabBarItemView *)self->_tabBarItemView setIcon:v4];
}

- (TabBarItemLayoutInfo)init
{
  return 0;
}

- (void)dealloc
{
  [(TabBarItemLayoutInfo *)self _clearViews];
  [(TabBarItemLayoutInfo *)self clearPreviewView];
  v3.receiver = self;
  v3.super_class = (Class)TabBarItemLayoutInfo;
  [(TabBarItemLayoutInfo *)&v3 dealloc];
}

- (void)itemDidUpdateTitle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarItem);
  objc_super v3 = [WeakRetained title];
  [(TabBarItemView *)self->_tabBarItemView setTitleText:v3];
}

- (void)itemDidUpdateIsPlaceholder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarItem);
  uint64_t v4 = [WeakRetained isPlaceholder];

  [(TabBarItemView *)self->_tabBarItemView setIsPlaceholder:v4];
  [(TabBarItemLayoutInfo *)self _updateHidesTitleText];
}

- (void)itemDidUpdateMediaState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarItem);
  uint64_t v4 = [WeakRetained mediaStateIcon];

  tabBarItemView = self->_tabBarItemView;
  [(TabBarItemView *)tabBarItemView setMediaStateIcon:v4];
}

- (void)itemDidUpdateIsPinned
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarItem);
  -[TabBarItemView setPinned:](self->_tabBarItemView, "setPinned:", [WeakRetained isPinned]);

  int64_t v4 = [(TabBarItemLayoutInfo *)self _visibleEdge];
  tabBarItemView = self->_tabBarItemView;
  [(TabBarItemView *)tabBarItemView setVisibleEdge:v4];
}

- (void)itemDidUpdateIsUnread
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarItem);
  -[TabBarItemView setUnread:](self->_tabBarItemView, "setUnread:", [WeakRetained isUnread]);
}

- (void)itemDidUpdateShareParticipants
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarItem);
  objc_super v3 = [WeakRetained shareParticipants];
  [(TabBarItemView *)self->_tabBarItemView setShareParticipants:v3];
}

- (void)closeButtonTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  id v4 = objc_loadWeakRetained((id *)&self->_tabBarItem);
  if (WeakRetained && v4) {
    [WeakRetained _itemDidPressCloseButton:v4];
  }
}

- (void)mediaStateMuteButtonTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  id v4 = objc_loadWeakRetained((id *)&self->_tabBarItem);
  uint64_t v5 = [v4 mediaStateIcon];
  if (WeakRetained && v5) {
    [WeakRetained _toggleMediaStateMutedForItem:v4];
  }
}

- (void)setReordering:(BOOL)a3
{
  self->_reordering = a3;
  -[TabBarItemView setReordering:](self->_tabBarItemView, "setReordering:");
}

void __46__TabBarItemLayoutInfo_setTrailingActiveItem___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) frame];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setFrame:");
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) superview];
  [v2 insertSubview:*(void *)(*(void *)(a1 + 32) + 24) belowSubview:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)updateTitleTruncation
{
}

- (void)updateTabBarStyle
{
}

- (TabBarItemView)viewForDragPreview
{
  id v2 = [(TabBarItemLayoutInfo *)self _reusableView];
  [v2 removeFromSuperview];
  [v2 configureForDragPreview];
  return (TabBarItemView *)v2;
}

- (TabBarItemView)tabBarItemPreviewView
{
  tabBarItemPreviewView = self->_tabBarItemPreviewView;
  if (!tabBarItemPreviewView)
  {
    id v4 = [(TabBarItemLayoutInfo *)self viewForDragPreview];
    uint64_t v5 = self->_tabBarItemPreviewView;
    self->_tabBarItemPreviewView = v4;

    tabBarItemPreviewView = self->_tabBarItemPreviewView;
  }
  return tabBarItemPreviewView;
}

- (void)_clearView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 closeButton];
  [v5 removeTarget:self action:sel_closeButtonTapped_ forControlEvents:64];

  id v6 = [v4 mediaStateMuteButton];
  [v6 removeTarget:self action:sel_mediaStateMuteButtonTapped_ forControlEvents:0x2000];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  [WeakRetained _relinquishReusableTabBarItemView:v4];
}

- (void)_clearViews
{
  [(TabBarItemLayoutInfo *)self _clearView:self->_tabBarItemView];
  tabBarItemView = self->_tabBarItemView;
  self->_tabBarItemView = 0;

  [(UIView *)self->_itemSnapshotView removeFromSuperview];
  itemSnapshotView = self->_itemSnapshotView;
  self->_itemSnapshotView = 0;
}

- (void)clearPreviewView
{
  [(TabBarItemLayoutInfo *)self _clearView:self->_tabBarItemPreviewView];
  [(TabBarItemView *)self->_tabBarItemPreviewView removeFromSuperview];
  tabBarItemPreviewView = self->_tabBarItemPreviewView;
  self->_tabBarItemPreviewView = 0;
}

- (void)setRemovedFromTabBar:(BOOL)a3
{
  self->_removedFromTabBar = a3;
  if (a3) {
    [(TabBarItemLayoutInfo *)self _clearViewsIfNeeded];
  }
}

- (id)tabEntityUUIDForView:(id)a3
{
  if (self->_tabBarItemView == a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarItem);
    objc_super v3 = [WeakRetained UUID];
  }
  else
  {
    objc_super v3 = 0;
  }
  return v3;
}

- (BOOL)tabEntityIsPrimaryForView:(id)a3
{
  return 0;
}

- (TabBar)tabBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  return (TabBar *)WeakRetained;
}

- (TabBarItem)tabBarItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarItem);
  return (TabBarItem *)WeakRetained;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)canClose
{
  return self->_canClose;
}

- (BOOL)isReordering
{
  return self->_reordering;
}

- (BOOL)isLeadingEdgeVisible
{
  return self->_leadingEdgeVisible;
}

- (BOOL)isTrailingEdgeVisible
{
  return self->_trailingEdgeVisible;
}

- (BOOL)isTrailingActiveItem
{
  return self->_trailingActiveItem;
}

- (double)titleLayoutWidth
{
  return self->_titleLayoutWidth;
}

- (BOOL)hidesTitleText
{
  return self->_hidesTitleText;
}

- (double)titleAnchorAdditionalOffset
{
  return self->_titleAnchorAdditionalOffset;
}

- (double)contentOffset
{
  return self->_contentOffset;
}

- (BOOL)isRemovedFromTabBar
{
  return self->_removedFromTabBar;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tabBarItem);
  objc_destroyWeak((id *)&self->_tabBar);
  objc_storeStrong((id *)&self->_itemSnapshotView, 0);
  objc_storeStrong((id *)&self->_tabBarItemPreviewView, 0);
  objc_storeStrong((id *)&self->_tabBarItemView, 0);
}

@end