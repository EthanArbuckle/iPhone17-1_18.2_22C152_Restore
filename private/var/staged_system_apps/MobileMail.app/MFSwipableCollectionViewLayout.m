@interface MFSwipableCollectionViewLayout
+ (OS_os_log)log;
- (MFMessageDisplayMetrics)displayMetrics;
- (MFSwipableCollectionViewLayoutDelegate)swipeDelegate;
- (NSIndexPath)expandingIndexPath;
- (NSIndexPath)swipedIndexPath;
- (NSMutableSet)insertedIndexPaths;
- (UIEdgeInsets)swipeActionController:(id)a3 extraInsetsForItemAtIndexPath:(id)a4;
- (UISwipeActionController)swipeController;
- (id)gestureRecognizerViewForSwipeActionController:(id)a3;
- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3;
- (id)itemContainerViewForSwipeActionController:(id)a3;
- (id)swipeActionController:(id)a3 indexPathForTouchLocation:(CGPoint)a4;
- (id)swipeActionController:(id)a3 leadingSwipeConfigurationForItemAtIndexPath:(id)a4;
- (id)swipeActionController:(id)a3 trailingSwipeConfigurationForItemAtIndexPath:(id)a4;
- (id)swipeActionController:(id)a3 viewForItemAtIndexPath:(id)a4;
- (id)traitCollection;
- (int64_t)layoutDirectionForSwipeActionController:(id)a3;
- (void)finalizeCollectionViewUpdates;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)prepareForCollectionViewUpdates:(id)a3;
- (void)prepareForTransitionFromLayout:(id)a3;
- (void)prepareForTransitionToLayout:(id)a3;
- (void)setDisplayMetrics:(id)a3;
- (void)setExpandingIndexPath:(id)a3;
- (void)setInsertedIndexPaths:(id)a3;
- (void)setSwipeController:(id)a3;
- (void)setSwipeDelegate:(id)a3;
- (void)setSwipedIndexPath:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)swipeActionController:(id)a3 animateView:(id)a4 actionsView:(id)a5 forDestructiveAction:(id)a6 atIndexPath:(id)a7 withSwipeInfo:(id *)a8 completion:(id)a9;
- (void)swipeActionController:(id)a3 willBeginSwipeForItemAtIndexPath:(id)a4;
- (void)swipeActionController:(id)a3 willEndSwipeForItemAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MFSwipableCollectionViewLayout

- (void)setSwipeDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_swipeDelegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_swipeDelegate, obj);
    v6 = (UISwipeActionController *)[objc_alloc((Class)UISwipeActionController) initWithSwipeActionHost:self style:1];
    swipeController = self->_swipeController;
    self->_swipeController = v6;

    v5 = obj;
  }
}

- (id)itemContainerViewForSwipeActionController:(id)a3
{
  v3 = [(MFSwipableCollectionViewLayout *)self collectionView];

  return v3;
}

- (id)gestureRecognizerViewForSwipeActionController:(id)a3
{
  v3 = [(MFSwipableCollectionViewLayout *)self collectionView];

  return v3;
}

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001E8D68;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699D90 != -1) {
    dispatch_once(&qword_100699D90, block);
  }
  v2 = (void *)qword_100699D88;

  return (OS_os_log *)v2;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFSwipableCollectionViewLayout;
  [(MFSwipableCollectionViewLayout *)&v9 invalidateLayoutWithContext:v4];
  if ([v4 invalidateEverything])
  {
    v5 = [(MFSwipableCollectionViewLayout *)self swipeController];
    [v5 resetSwipedItemAnimated:0 completion:0];
  }
  v6 = +[MFSwipableCollectionViewLayout log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = [v4 invalidateEverything];
    unsigned int v8 = [v4 invalidateDataSourceCounts];
    *(_DWORD *)buf = 134218496;
    id v11 = v4;
    __int16 v12 = 2048;
    uint64_t v13 = v7;
    __int16 v14 = 2048;
    uint64_t v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "invalidateLayoutWithContext:%p invalidateEverything: %ld invalidateDataSourceCounts: %ld", buf, 0x20u);
  }
}

- (id)traitCollection
{
  v2 = [(MFSwipableCollectionViewLayout *)self collectionView];
  v3 = [v2 traitCollection];

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v4 = [(MFSwipableCollectionViewLayout *)self collectionView];
  [v4 traitCollectionDidChange:v5];
}

- (void)prepareForTransitionFromLayout:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MFSwipableCollectionViewLayout;
  [(MFSwipableCollectionViewLayout *)&v6 prepareForTransitionFromLayout:v4];
  id v5 = [(MFSwipableCollectionViewLayout *)self swipeController];
  [v5 setSwipeEnabled:1];
}

- (void)prepareForTransitionToLayout:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MFSwipableCollectionViewLayout;
  [(MFSwipableCollectionViewLayout *)&v6 prepareForTransitionToLayout:v4];
  id v5 = [(MFSwipableCollectionViewLayout *)self swipeController];
  [v5 setSwipeEnabled:0];
}

- (NSIndexPath)swipedIndexPath
{
  v2 = [(MFSwipableCollectionViewLayout *)self swipeController];
  v3 = [v2 swipedIndexPath];

  return (NSIndexPath *)v3;
}

- (UIEdgeInsets)swipeActionController:(id)a3 extraInsetsForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  objc_super v6 = [(MFSwipableCollectionViewLayout *)self collectionView];
  unsigned int v7 = [v6 cellForItemAtIndexPath:v5];

  [v7 safeAreaInsets];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (id)swipeActionController:(id)a3 leadingSwipeConfigurationForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  objc_super v6 = [(MFSwipableCollectionViewLayout *)self swipeDelegate];
  if (objc_opt_respondsToSelector())
  {
    unsigned int v7 = [v6 swipableCollectionViewLayout:self leadingSwipeActionsConfigurationForItemAtIndexPath:v5];
  }
  else
  {
    unsigned int v7 = 0;
  }

  return v7;
}

- (id)swipeActionController:(id)a3 trailingSwipeConfigurationForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  objc_super v6 = [(MFSwipableCollectionViewLayout *)self swipeDelegate];
  if (objc_opt_respondsToSelector())
  {
    unsigned int v7 = [v6 swipableCollectionViewLayout:self trailingSwipeActionsConfigurationForItemAtIndexPath:v5];
  }
  else
  {
    unsigned int v7 = 0;
  }

  return v7;
}

- (id)swipeActionController:(id)a3 indexPathForTouchLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  objc_super v6 = [(MFSwipableCollectionViewLayout *)self collectionView];
  unsigned int v7 = [v6 indexPathForItemAtPoint:x, y];

  return v7;
}

- (id)swipeActionController:(id)a3 viewForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  objc_super v6 = [(MFSwipableCollectionViewLayout *)self collectionView];
  unsigned int v7 = [v6 cellForItemAtIndexPath:v5];
  double v8 = [v7 contentWrapperView];

  return v8;
}

- (void)setSwipedIndexPath:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v13 = a3;
  id v8 = a5;
  [(MFSwipableCollectionViewLayout *)self swipeController];
  if (v13) {
    double v9 = {;
  }
    double v10 = [(MFSwipableCollectionViewLayout *)self swipeActionController:v9 trailingSwipeConfigurationForItemAtIndexPath:v13];

    double v11 = [(MFSwipableCollectionViewLayout *)self swipeController];
    double v12 = [(MFSwipableCollectionViewLayout *)self collectionView];
    [v11 swipeItemAtIndexPath:v13 configuration:v10 direction:sub_1001F9D1C(0, v12) animated:v6 completion:v8];
  }
  else {
    double v10 = {;
  }
    [v10 resetSwipedItemAnimated:v6 completion:v8];
  }
}

- (void)swipeActionController:(id)a3 animateView:(id)a4 actionsView:(id)a5 forDestructiveAction:(id)a6 atIndexPath:(id)a7 withSwipeInfo:(id *)a8 completion:(id)a9
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a9;
  double v15 = [(MFSwipableCollectionViewLayout *)self collectionView];
  [v15 frame];
  double v17 = v16;
  _UIDirectionalMultiplierForSwipeDirection();
  double v19 = v17 * 1.5 * v18;

  double var4 = a8->var4;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1001E9834;
  v26[3] = &unk_100604E58;
  id v21 = v12;
  id v27 = v21;
  double v29 = v19;
  id v22 = v13;
  id v28 = v22;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1001E98F8;
  v24[3] = &unk_100607840;
  v24[4] = self;
  id v23 = v14;
  id v25 = v23;
  +[UIView animateWithDuration:0 delay:v26 usingSpringWithDamping:v24 initialSpringVelocity:0.400000006 options:0.0 animations:1.0 completion:var4];
}

- (void)swipeActionController:(id)a3 willBeginSwipeForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v5 = [(MFSwipableCollectionViewLayout *)self swipeDelegate];
  if (objc_opt_respondsToSelector()) {
    [v5 swipableCollectionViewLayout:self willBeginSwipeAtIndexPath:v6];
  }
}

- (void)swipeActionController:(id)a3 willEndSwipeForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v5 = [(MFSwipableCollectionViewLayout *)self swipeDelegate];
  if (objc_opt_respondsToSelector()) {
    [v5 swipableCollectionViewLayout:self willEndSwipeForItemAtIndexPath:v6];
  }
}

- (int64_t)layoutDirectionForSwipeActionController:(id)a3
{
  v3 = [(MFSwipableCollectionViewLayout *)self collectionView];
  id v4 = [v3 traitCollection];
  id v5 = [v4 layoutDirection];

  return (int64_t)v5;
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MFSwipableCollectionViewLayout;
  [(MFSwipableCollectionViewLayout *)&v7 prepareForCollectionViewUpdates:v4];
  id v5 = objc_opt_new();
  [(MFSwipableCollectionViewLayout *)self setInsertedIndexPaths:v5];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001E9BF0;
  v6[3] = &unk_10060D3D0;
  v6[4] = self;
  [v4 enumerateObjectsUsingBlock:v6];
}

- (void)finalizeCollectionViewUpdates
{
  v3.receiver = self;
  v3.super_class = (Class)MFSwipableCollectionViewLayout;
  [(MFSwipableCollectionViewLayout *)&v3 finalizeCollectionViewUpdates];
  [(MFSwipableCollectionViewLayout *)self setInsertedIndexPaths:0];
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MFSwipableCollectionViewLayout;
  id v5 = [(MFSwipableCollectionViewLayout *)&v12 initialLayoutAttributesForAppearingItemAtIndexPath:v4];
  id v6 = [(MFSwipableCollectionViewLayout *)self swipeDelegate];
  objc_super v7 = [(MFSwipableCollectionViewLayout *)self insertedIndexPaths];
  unsigned int v8 = [v7 containsObject:v4];

  LODWORD(self) = [v6 swipableCollectionViewLayout:self shouldAnimateAppearingItemAtIndexPath:v4];
  if ((_os_feature_enabled_impl() & v8 & self) == 1)
  {
    [v5 setAlpha:1.0];
    double v9 = +[MFSwipableCollectionViewLayout log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[Quick Reply][Send Animation] Will use quick-reply send animation", v11, 2u);
    }
  }

  return v5;
}

- (NSIndexPath)expandingIndexPath
{
  return self->_expandingIndexPath;
}

- (void)setExpandingIndexPath:(id)a3
{
}

- (MFMessageDisplayMetrics)displayMetrics
{
  return self->_displayMetrics;
}

- (void)setDisplayMetrics:(id)a3
{
}

- (MFSwipableCollectionViewLayoutDelegate)swipeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_swipeDelegate);

  return (MFSwipableCollectionViewLayoutDelegate *)WeakRetained;
}

- (UISwipeActionController)swipeController
{
  return self->_swipeController;
}

- (void)setSwipeController:(id)a3
{
}

- (NSMutableSet)insertedIndexPaths
{
  return self->_insertedIndexPaths;
}

- (void)setInsertedIndexPaths:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insertedIndexPaths, 0);
  objc_storeStrong((id *)&self->_swipeController, 0);
  objc_destroyWeak((id *)&self->_swipeDelegate);
  objc_storeStrong((id *)&self->_displayMetrics, 0);

  objc_storeStrong((id *)&self->_expandingIndexPath, 0);
}

@end