@interface _UITableViewCellPromiseRegion
- (BOOL)_isEligibleForFocusInteraction;
- (BOOL)_isLazyFocusItemContainer;
- (BOOL)_isPromiseFocusRegion;
- (BOOL)_isTransparentFocusRegion;
- (BOOL)canBecomeFocused;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (CGRect)_focusRegionFrame;
- (CGRect)frame;
- (NSArray)preferredFocusEnvironments;
- (NSIndexPath)indexPath;
- (NSString)description;
- (UICoordinateSpace)coordinateSpace;
- (UITableView)tableView;
- (id)_childFocusRegionsInRect:(CGRect)a3 inCoordinateSpace:(id)a4;
- (id)_focusDebugOverlayParentView;
- (id)_focusRegionFocusSystem;
- (id)_focusRegionGuides;
- (id)_focusRegionView;
- (id)_fulfillPromisedFocusRegion;
- (id)_preferredFocusRegionCoordinateSpace;
- (id)focusItemsInRect:(CGRect)a3;
- (void)_searchForFocusRegionsInContext:(id)a3;
- (void)setIndexPath:(id)a3;
- (void)setNeedsFocusUpdate;
- (void)setTableView:(id)a3;
- (void)updateFocusIfNeeded;
@end

@implementation _UITableViewCellPromiseRegion

- (NSString)description
{
  v3 = [(_UITableViewCellPromiseRegion *)self tableView];
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [(_UITableViewCellPromiseRegion *)self indexPath];
  v8 = [(_UITableViewCellPromiseRegion *)self indexPath];
  [v3 _rectForRowAtIndexPath:v8 usingPresentationValues:1];
  v9 = NSStringFromCGRect(v15);
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  objc_msgSend(v4, "stringWithFormat:", @"<%@: %p; Represents index path %@ with frame %@ in %@: %p>",
    v6,
    self,
    v7,
    v9,
    v11,
  v12 = v3);

  return (NSString *)v12;
}

- (id)_focusRegionFocusSystem
{
  v2 = [(_UITableViewCellPromiseRegion *)self tableView];
  v3 = [v2 _focusSystem];

  return v3;
}

- (CGRect)_focusRegionFrame
{
  v3 = [(_UITableViewCellPromiseRegion *)self tableView];
  [(_UITableViewCellPromiseRegion *)self frame];
  objc_msgSend(v3, "convertRect:toView:", 0);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)_childFocusRegionsInRect:(CGRect)a3 inCoordinateSpace:(id)a4
{
  return 0;
}

- (BOOL)_isPromiseFocusRegion
{
  return 1;
}

- (id)_fulfillPromisedFocusRegion
{
  v3 = [(_UITableViewCellPromiseRegion *)self tableView];
  double v4 = [v3 _fulfillPromisedFocusRegionForCell:self];

  return v4;
}

- (BOOL)_isTransparentFocusRegion
{
  return 0;
}

- (id)_focusRegionView
{
  return 0;
}

- (id)_focusRegionGuides
{
  return 0;
}

- (id)_focusDebugOverlayParentView
{
  return 0;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (CGRect)frame
{
  v3 = [(_UITableViewCellPromiseRegion *)self tableView];
  double v4 = [(_UITableViewCellPromiseRegion *)self indexPath];
  [v3 _tableViewRectForRowAtIndexPath:v4 canGuess:1];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (BOOL)_isEligibleForFocusInteraction
{
  return 1;
}

- (void)setNeedsFocusUpdate
{
  id v3 = +[UIFocusSystem focusSystemForEnvironment:self];
  [v3 requestFocusUpdateToEnvironment:self];
}

- (void)updateFocusIfNeeded
{
  id v2 = +[UIFocusSystem focusSystemForEnvironment:self];
  [v2 updateFocusIfNeeded];
}

- (NSArray)preferredFocusEnvironments
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (id)focusItemsInRect:(CGRect)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(_UITableViewCellPromiseRegion *)self _fulfillPromisedFocusRegion];
  double v4 = (void *)v3;
  if (v3)
  {
    v7[0] = v3;
    double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    double v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (UICoordinateSpace)coordinateSpace
{
  id v2 = [(_UITableViewCellPromiseRegion *)self tableView];
  uint64_t v3 = [v2 coordinateSpace];

  return (UICoordinateSpace *)v3;
}

- (BOOL)_isLazyFocusItemContainer
{
  return 1;
}

- (id)_preferredFocusRegionCoordinateSpace
{
  id v2 = [(_UITableViewCellPromiseRegion *)self tableView];
  uint64_t v3 = [v2 _screen];
  double v4 = [v3 coordinateSpace];

  return v4;
}

- (void)_searchForFocusRegionsInContext:(id)a3
{
  id v4 = a3;
  double v5 = [(_UITableViewCellPromiseRegion *)self tableView];
  char v6 = dyld_program_sdk_at_least();
  double v7 = [(_UITableViewCellPromiseRegion *)self indexPath];
  if (v6) {
    [v5 _tableViewRectForRowAtIndexPath:v7 canGuess:1];
  }
  else {
    [v5 _rectForRowAtIndexPath:v7 usingPresentationValues:1];
  }
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  double v15 = v11;

  double v16 = [_UIFocusPromiseRegion alloc];
  v17 = [(_UITableViewCellPromiseRegion *)self indexPath];
  v18 = -[_UIFocusPromiseRegion initWithFrame:coordinateSpace:identifier:](v16, "initWithFrame:coordinateSpace:identifier:", v5, v17, v12, v13, v14, v15);

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __65___UITableViewCellPromiseRegion__searchForFocusRegionsInContext___block_invoke;
  v19[3] = &unk_1E52E5DB0;
  v19[4] = self;
  [(_UIFocusPromiseRegion *)v18 setContentFulfillmentHandler:v19];
  [v4 addRegion:v18];
}

- (UITableView)tableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  return (UITableView *)WeakRetained;
}

- (void)setTableView:(id)a3
{
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_destroyWeak((id *)&self->_tableView);
}

@end