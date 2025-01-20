@interface NCNotificationListPresentableGroup
+ (NSSet)presentableTypes;
- (BOOL)_shouldAllowRestacking;
- (BOOL)actionsRevealedForNotificationListCell:(id)a3;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)isGrouped;
- (BOOL)shouldImmediatelyReveal;
- (BOOL)shouldPerformClippingForNotificationListCell:(id)a3;
- (NCNotificationListBaseComponentDelegate)delegate;
- (NCNotificationListCache)notificationListCache;
- (NCNotificationListCell)cellWithActionsRevealed;
- (NCNotificationListCoalescingControlsCell)footerView;
- (NCNotificationListCoalescingHeaderCell)headerView;
- (NCNotificationListViewProtocol)listView;
- (NSString)clearAllText;
- (NSString)headerText;
- (NSString)materialGroupNameBase;
- (double)footerViewHeight;
- (double)footerViewHeightForNotificationList:(id)a3 withWidth:(double)a4;
- (double)headerViewHeight;
- (double)headerViewHeightForNotificationList:(id)a3 withWidth:(double)a4;
- (double)notificationListView:(id)a3;
- (double)notificationListView:(id)a3 heightForItemAtIndex:(unint64_t)a4 withWidth:(double)a5;
- (id)_legibilitySettings;
- (id)containerViewForCoalescingControlsHandlerPreviewInteractionPresentedContent:(id)a3;
- (id)footerViewForNotificationList:(id)a3;
- (id)headerViewForNotificationList:(id)a3;
- (id)notificationListView:(id)a3 viewForItemAtIndex:(unint64_t)a4;
- (id)purposeWithSensitiveTextHashed:(BOOL)a3;
- (unint64_t)count;
- (void)_didSignificantInteraction;
- (void)_scrollToTopIfNecessaryAndPerformBlock:(id)a3;
- (void)adjustForLegibilitySettingsChange:(id)a3;
- (void)notificationListCell:(id)a3 didBeginHidingActionsForSwipeInteraction:(id)a4;
- (void)notificationListCell:(id)a3 didBeginRevealingActionsForSwipeInteraction:(id)a4;
- (void)notificationListCell:(id)a3 didMoveToNewXPosition:(double)a4;
- (void)notificationListCoalescingControlsHandler:(id)a3 didTransitionToClearState:(BOOL)a4;
- (void)notificationListCoalescingControlsHandlerDidBeginPreviewInteraction:(id)a3;
- (void)notificationListCoalescingControlsHandlerDidDismissPreviewInteractionPresentedContent:(id)a3;
- (void)notificationListCoalescingControlsHandlerDidPresentPreviewInteractionPresentedContent:(id)a3;
- (void)notificationListCoalescingControlsHandlerRequestsClearingAllNotifications:(id)a3;
- (void)notificationListCoalescingControlsHandlerRequestsClearingNotifications:(id)a3;
- (void)notificationListCoalescingControlsHandlerRequestsRestackingNotifications:(id)a3;
- (void)recycleView:(id)a3;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setCellWithActionsRevealed:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFooterView:(id)a3;
- (void)setFooterViewHeight:(double)a3;
- (void)setGrouped:(BOOL)a3 animated:(BOOL)a4;
- (void)setHeaderView:(id)a3;
- (void)setHeaderViewHeight:(double)a3;
- (void)setMaterialGroupNameBase:(id)a3;
- (void)setNotificationListCache:(id)a3;
- (void)setShouldImmediatelyReveal:(BOOL)a3;
@end

@implementation NCNotificationListPresentableGroup

- (NCNotificationListViewProtocol)listView
{
  listView = self->_listView;
  if (!listView)
  {
    v4 = [NCNotificationListView alloc];
    uint64_t v5 = objc_opt_class();
    v6 = [(NCNotificationListPresentableGroup *)self purposeWithSensitiveTextHashed:0];
    v7 = [(NCNotificationListPresentableGroup *)self purposeWithSensitiveTextHashed:1];
    v8 = [(NCNotificationListView *)v4 initWithModelType:v5 purpose:v6 purposeWithSensitiveTextHashed:v7];
    v9 = self->_listView;
    self->_listView = v8;

    [(NCNotificationListViewProtocol *)self->_listView setDataSource:self];
    [(NCNotificationListViewProtocol *)self->_listView setSupportsGrouping:1];
    [(NCNotificationListViewProtocol *)self->_listView setGrouped:1];
    BOOL v10 = [(NCNotificationListPresentableGroup *)self shouldImmediatelyReveal];
    listView = self->_listView;
    if (v10)
    {
      [(NCNotificationListViewProtocol *)listView setRevealed:1];
      [(NCNotificationListViewProtocol *)self->_listView setRevealPercentage:1.0];
      listView = self->_listView;
    }
  }

  return listView;
}

- (BOOL)isGrouped
{
  if ([(NCNotificationListPresentableGroup *)self count] < 2) {
    return 0;
  }
  v3 = [(NCNotificationListPresentableGroup *)self listView];
  char v4 = [v3 isGrouped];

  return v4;
}

- (void)setGrouped:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(NCNotificationListPresentableGroup *)self count] > 1
    || [(NCNotificationListPresentableGroup *)self count] == 1 && !v5)
  {
    v7 = [(NCNotificationListPresentableGroup *)self listView];
    int v8 = [v7 isGrouped];

    if (v5)
    {
      if (v8) {
        return;
      }
    }
    else if (!v8)
    {
      return;
    }
    if (v4)
    {
      objc_initWeak(&location, self);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __58__NCNotificationListPresentableGroup_setGrouped_animated___block_invoke;
      v9[3] = &unk_1E6A919A0;
      objc_copyWeak(&v10, &location);
      [(NCNotificationListPresentableGroup *)self _scrollToTopIfNecessaryAndPerformBlock:v9];
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
    else
    {
      [(NCNotificationListPresentableGroup *)self toggleGroupedState];
    }
  }
}

void __58__NCNotificationListPresentableGroup_setGrouped_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained toggleGroupedState];
}

- (BOOL)actionsRevealedForNotificationListCell:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationListPresentableGroup *)self cellWithActionsRevealed];

  return v5 == v4;
}

- (void)adjustForLegibilitySettingsChange:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationListPresentableGroup *)self headerView];
  [v5 adjustForLegibilitySettingsChange:v4];
}

- (BOOL)adjustForContentSizeCategoryChange
{
  v3 = [(NCNotificationListPresentableGroup *)self listView];
  [v3 invalidateData];

  id v4 = [(NCNotificationListPresentableGroup *)self headerView];
  [v4 adjustForContentSizeCategoryChange];

  id v5 = [(NCNotificationListPresentableGroup *)self footerView];
  [v5 adjustForContentSizeCategoryChange];

  return 1;
}

- (NSString)materialGroupNameBase
{
  materialGroupNameBase = self->_materialGroupNameBase;
  if (!materialGroupNameBase)
  {
    id v4 = [(NCNotificationListPresentableGroup *)self delegate];
    if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v5 = [v4 backgroundGroupNameBaseForNotificationListBaseComponent:self];
      v6 = self->_materialGroupNameBase;
      self->_materialGroupNameBase = v5;
    }
    materialGroupNameBase = self->_materialGroupNameBase;
  }

  return materialGroupNameBase;
}

- (unint64_t)count
{
  return 0;
}

+ (NSSet)presentableTypes
{
  return 0;
}

- (id)purposeWithSensitiveTextHashed:(BOOL)a3
{
  return 0;
}

- (id)headerViewForNotificationList:(id)a3
{
  if (!self->_headerView
    && [(NCNotificationListPresentableGroup *)self _shouldAllowRestacking])
  {
    id v4 = [(NCNotificationListPresentableGroup *)self listView];
    [v4 bounds];
    double Width = CGRectGetWidth(v17);

    v6 = [(NCNotificationListPresentableGroup *)self headerText];
    v7 = [(NCNotificationListPresentableGroup *)self clearAllText];
    int v8 = [(NCNotificationListCache *)self->_notificationListCache coalescingHeaderCellWithTitle:v6 clearAllText:v7 width:Width];
    headerView = self->_headerView;
    self->_headerView = v8;

    [(NCNotificationListCoalescingHeaderCell *)self->_headerView setTitle:v6];
    [(NCNotificationListCoalescingHeaderCell *)self->_headerView setClearAllText:v7];
    [(NCNotificationListCoalescingHeaderCell *)self->_headerView setHandlerDelegate:self];
    id v10 = self->_headerView;
    v11 = [(NCNotificationListPresentableGroup *)self materialGroupNameBase];
    [(NCNotificationListCoalescingHeaderCell *)v10 setMaterialGroupNameBase:v11];

    [(NCNotificationListCoalescingHeaderCell *)self->_headerView setAdjustsFontForContentSizeCategory:1];
    v12 = self->_headerView;
    v13 = [(NCNotificationListPresentableGroup *)self _legibilitySettings];
    [(NCNotificationListCoalescingHeaderCell *)v12 adjustForLegibilitySettingsChange:v13];

    [(NCNotificationListCoalescingHeaderCell *)self->_headerView frame];
    self->_headerViewHeight = CGRectGetHeight(v18);
  }
  v14 = self->_headerView;

  return v14;
}

- (void)recycleView:(id)a3
{
  id v10 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = (NCNotificationListCoalescingHeaderCell *)v10;
    if (self->_headerView == v4)
    {
      id v5 = v4;
      self->_headerView = 0;

      v6 = [(NCNotificationListPresentableGroup *)self notificationListCache];
      [v6 recycleNotificationListCoalescingHeaderCell:v5];
LABEL_7:
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_9;
    }
    v7 = (NCNotificationListCoalescingControlsCell *)v10;
    if (self->_footerView == v7)
    {
      int v8 = v7;
      [(NCNotificationListCoalescingControlsCell *)v7 setFooterCell:0];
      footerView = self->_footerView;
      self->_footerView = 0;

      v6 = [(NCNotificationListPresentableGroup *)self notificationListCache];
      [v6 recycleNotificationListCoalescingControlsCell:v8];
      goto LABEL_7;
    }
  }

LABEL_9:
}

- (id)footerViewForNotificationList:(id)a3
{
  id v4 = a3;
  if (!self->_footerView
    && [(NCNotificationListPresentableGroup *)self _shouldAllowRestacking])
  {
    id v5 = [(NCNotificationListPresentableGroup *)self listView];
    [v5 bounds];
    double Width = CGRectGetWidth(v18);

    v7 = [(NCNotificationListPresentableGroup *)self notificationListCache];
    int v8 = [v7 coalescingControlsCellWithWidth:Width];
    footerView = self->_footerView;
    self->_footerView = v8;

    [(NCNotificationListCoalescingControlsCell *)self->_footerView setFooterCell:1];
    [(NCNotificationListCoalescingControlsCell *)self->_footerView setHandlerDelegate:self];
    id v10 = [(NCNotificationListPresentableGroup *)self clearAllText];
    [(NCNotificationListCoalescingControlsCell *)self->_footerView setClearAllText:v10];
    [v4 frame];
    double Height = CGRectGetHeight(v19);
    v12 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v12 bounds];
    BOOL v13 = Height > CGRectGetHeight(v20) * 0.8;

    [(NCNotificationListCoalescingControlsCell *)self->_footerView setShouldShowCoalescingControls:v13];
    v14 = self->_footerView;
    v15 = [(NCNotificationListPresentableGroup *)self materialGroupNameBase];
    [(NCNotificationListCoalescingControlsCell *)v14 setMaterialGroupNameBase:v15];

    [(NCNotificationListCoalescingControlsCell *)self->_footerView setAdjustsFontForContentSizeCategory:1];
    [(NCNotificationListCoalescingControlsCell *)self->_footerView frame];
    self->_footerViewdouble Height = CGRectGetHeight(v21);
  }
  v16 = self->_footerView;

  return v16;
}

- (double)headerViewHeightForNotificationList:(id)a3 withWidth:(double)a4
{
  if (![(NCNotificationListPresentableGroup *)self _shouldAllowRestacking]) {
    return 0.0;
  }

  [(NCNotificationListPresentableGroup *)self headerViewHeight];
  return result;
}

- (double)footerViewHeightForNotificationList:(id)a3 withWidth:(double)a4
{
  if (![(NCNotificationListPresentableGroup *)self _shouldAllowRestacking]) {
    return 0.0;
  }

  [(NCNotificationListPresentableGroup *)self footerViewHeight];
  return result;
}

- (double)notificationListView:(id)a3
{
  return 0.0;
}

- (id)notificationListView:(id)a3 viewForItemAtIndex:(unint64_t)a4
{
  return 0;
}

- (double)notificationListView:(id)a3 heightForItemAtIndex:(unint64_t)a4 withWidth:(double)a5
{
  return 0.0;
}

- (BOOL)shouldPerformClippingForNotificationListCell:(id)a3
{
  v3 = [(NCNotificationListPresentableGroup *)self listView];
  char v4 = [v3 isGrouped] ^ 1;

  return v4;
}

- (void)notificationListCell:(id)a3 didBeginHidingActionsForSwipeInteraction:(id)a4
{
  id v6 = a4;
  id v5 = [(NCNotificationListPresentableGroup *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 notificationListBaseComponent:self didTransitionActionsForSwipeInteraction:v6 revealed:0];
  }
  [(NCNotificationListPresentableGroup *)self setCellWithActionsRevealed:0];
}

- (void)notificationListCell:(id)a3 didBeginRevealingActionsForSwipeInteraction:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [(NCNotificationListPresentableGroup *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 notificationListBaseComponent:self didTransitionActionsForSwipeInteraction:v6 revealed:1];
  }
  [(NCNotificationListPresentableGroup *)self setCellWithActionsRevealed:v8];
}

- (void)notificationListCell:(id)a3 didMoveToNewXPosition:(double)a4
{
  id v8 = a3;
  id v6 = [(NCNotificationListPresentableGroup *)self listView];
  [v6 updateSubviewTranslation:a4];

  v7 = [(NCNotificationListPresentableGroup *)self delegate];
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v7 notificationListPresentableGroup:self didReceivedHorizontalTranslation:v8 forCell:a4];
  }
}

- (void)notificationListCoalescingControlsHandlerRequestsRestackingNotifications:(id)a3
{
  id v4 = a3;
  [(NCNotificationListPresentableGroup *)self _didSignificantInteraction];
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __111__NCNotificationListPresentableGroup_notificationListCoalescingControlsHandlerRequestsRestackingNotifications___block_invoke;
  v5[3] = &unk_1E6A919A0;
  objc_copyWeak(&v6, &location);
  [(NCNotificationListPresentableGroup *)self _scrollToTopIfNecessaryAndPerformBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __111__NCNotificationListPresentableGroup_notificationListCoalescingControlsHandlerRequestsRestackingNotifications___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained toggleGroupedState];
}

- (void)notificationListCoalescingControlsHandlerRequestsClearingNotifications:(id)a3
{
  id v4 = a3;
  [(NCNotificationListPresentableGroup *)self _didSignificantInteraction];
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __109__NCNotificationListPresentableGroup_notificationListCoalescingControlsHandlerRequestsClearingNotifications___block_invoke;
  v5[3] = &unk_1E6A92FE0;
  objc_copyWeak(&v6, &location);
  void v5[4] = self;
  [(NCNotificationListPresentableGroup *)self _scrollToTopIfNecessaryAndPerformBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __109__NCNotificationListPresentableGroup_notificationListCoalescingControlsHandlerRequestsClearingNotifications___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    v3 = [WeakRetained listView];
    [v3 setGrouped:1];

    [*(id *)(a1 + 32) clearAll];
    id WeakRetained = v4;
  }
}

- (void)notificationListCoalescingControlsHandlerRequestsClearingAllNotifications:(id)a3
{
  id v4 = a3;
  id v5 = *MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D7C04000, v5, OS_LOG_TYPE_DEFAULT, "Requests clearing all", v7, 2u);
  }
  [(NCNotificationListPresentableGroup *)self _didSignificantInteraction];
  id v6 = [(NCNotificationListPresentableGroup *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 notificationListBaseComponentRequestsClearingAll:self];
  }
  if (objc_opt_respondsToSelector()) {
    [v6 notificationListBaseComponent:self didEndUserInteractionWithViewController:0];
  }
}

- (id)containerViewForCoalescingControlsHandlerPreviewInteractionPresentedContent:(id)a3
{
  id v4 = [(NCNotificationListPresentableGroup *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 containerViewForPreviewInteractionPresentedContentForNotificationListBaseComponent:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)notificationListCoalescingControlsHandlerDidBeginPreviewInteraction:(id)a3
{
  id v4 = [(NCNotificationListPresentableGroup *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 notificationListBaseComponent:self didBeginUserInteractionWithViewController:0];
  }
}

- (void)notificationListCoalescingControlsHandlerDidPresentPreviewInteractionPresentedContent:(id)a3
{
  id v5 = a3;
  id v4 = [(NCNotificationListPresentableGroup *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 notificationListBaseComponent:self didPresentCoalescingControlsHandler:v5 inForceTouchState:1];
  }
}

- (void)notificationListCoalescingControlsHandlerDidDismissPreviewInteractionPresentedContent:(id)a3
{
  id v5 = a3;
  id v4 = [(NCNotificationListPresentableGroup *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 notificationListBaseComponent:self didPresentCoalescingControlsHandler:v5 inForceTouchState:0];
  }
  if (objc_opt_respondsToSelector()) {
    [v4 notificationListBaseComponent:self didEndUserInteractionWithViewController:0];
  }
}

- (void)notificationListCoalescingControlsHandler:(id)a3 didTransitionToClearState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(NCNotificationListPresentableGroup *)self delegate];
  [v7 notificationListBaseComponent:self didTransitionCoalescingControlsHandler:v6 toClearState:v4];

  [(NCNotificationListPresentableGroup *)self _didSignificantInteraction];
}

- (void)_didSignificantInteraction
{
  id v3 = [(NCNotificationListPresentableGroup *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 notificationListBaseComponentDidSignificantUserInteraction:self];
  }
}

- (BOOL)_shouldAllowRestacking
{
  id v3 = [(NCNotificationListPresentableGroup *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 shouldAllowRestackingForNotificationListPresentableGroup:self];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)_scrollToTopIfNecessaryAndPerformBlock:(id)a3
{
  id v8 = (void (**)(void))a3;
  char v4 = [(NCNotificationListPresentableGroup *)self delegate];
  if (objc_opt_respondsToSelector()) {
    int v5 = [v4 shouldScrollToTopForNotificationListBaseComponent:self];
  }
  else {
    int v5 = 0;
  }
  id v6 = [(NCNotificationListPresentableGroup *)self listView];
  int v7 = [v6 isVisibleForViewAtIndex:0];

  if (!v7 || v5)
  {
    if (objc_opt_respondsToSelector()) {
      [v4 notificationListPresentableGroup:self requestsScrollToTopOfCollectionWithCompletion:v8];
    }
  }
  else if (v8)
  {
    v8[2]();
  }
}

- (id)_legibilitySettings
{
  id v3 = [(NCNotificationListPresentableGroup *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    char v4 = [v3 legibilitySettingsForNotificationListBaseComponent:self];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (NCNotificationListBaseComponentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCNotificationListBaseComponentDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NCNotificationListCache)notificationListCache
{
  return self->_notificationListCache;
}

- (void)setNotificationListCache:(id)a3
{
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategory = a3;
}

- (void)setMaterialGroupNameBase:(id)a3
{
}

- (NSString)headerText
{
  return self->_headerText;
}

- (NSString)clearAllText
{
  return self->_clearAllText;
}

- (BOOL)shouldImmediatelyReveal
{
  return self->_shouldImmediatelyReveal;
}

- (void)setShouldImmediatelyReveal:(BOOL)a3
{
  self->_shouldImmediatelyReveal = a3;
}

- (NCNotificationListCoalescingHeaderCell)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (NCNotificationListCoalescingControlsCell)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
}

- (double)headerViewHeight
{
  return self->_headerViewHeight;
}

- (void)setHeaderViewHeight:(double)a3
{
  self->_headerViewdouble Height = a3;
}

- (double)footerViewHeight
{
  return self->_footerViewHeight;
}

- (void)setFooterViewHeight:(double)a3
{
  self->_footerViewdouble Height = a3;
}

- (NCNotificationListCell)cellWithActionsRevealed
{
  return self->_cellWithActionsRevealed;
}

- (void)setCellWithActionsRevealed:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellWithActionsRevealed, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_clearAllText, 0);
  objc_storeStrong((id *)&self->_headerText, 0);
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
  objc_storeStrong((id *)&self->_notificationListCache, 0);
  objc_storeStrong((id *)&self->_listView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end