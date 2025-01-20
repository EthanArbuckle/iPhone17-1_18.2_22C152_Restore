@interface ViewReuseManager
- (BOOL)alwaysSendPrepareForReuse;
- (Class)reusableViewClass;
- (NSArray)trackedViews;
- (ViewReuseManager)init;
- (ViewReuseManager)initWithReusableViewClass:(Class)a3;
- (ViewReuseManagerDelegate)delegate;
- (id)makeView;
- (void)_addTrackedViewForRepresentedObjectAtIndex:(unint64_t)a3;
- (void)_didReceiveMemoryWarning:(id)a3;
- (void)_recycleView:(id)a3;
- (void)_recycleViewsInCollection:(id)a3;
- (void)dealloc;
- (void)insertView:(id)a3 inTrackedViewsAtIndex:(int64_t)a4;
- (void)recycleView:(id)a3;
- (void)removeViewFromTrackedViews:(id)a3;
- (void)setAlwaysSendPrepareForReuse:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)updateTrackedViewsForRepresentedObjectsInRange:(_NSRange)a3;
@end

@implementation ViewReuseManager

- (ViewReuseManager)init
{
  return 0;
}

- (ViewReuseManager)initWithReusableViewClass:(Class)a3
{
  v11.receiver = self;
  v11.super_class = (Class)ViewReuseManager;
  v4 = [(ViewReuseManager *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_reusableViewClass = a3;
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    reusableViews = v5->_reusableViews;
    v5->_reusableViews = v6;

    v5->_firstPreviouslyVisibleRepresentedObjectIndex = 0x7FFFFFFFFFFFFFFFLL;
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v5 selector:sel__didReceiveMemoryWarning_ name:*MEMORY[0x1E4FB2650] object:0];

    v9 = v5;
  }

  return v5;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v4 = self->_reusableViews;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v8++) removeFromSuperview];
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)ViewReuseManager;
  [(ViewReuseManager *)&v9 dealloc];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  uint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    uint64_t v5 = obj;
    if (obj)
    {
      if (!self->_trackedViews)
      {
        uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        trackedViews = self->_trackedViews;
        self->_trackedViews = v6;

        uint64_t v5 = obj;
      }
      if (!self->_viewsPendingRecycling)
      {
        uint64_t v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
        viewsPendingRecycling = self->_viewsPendingRecycling;
        self->_viewsPendingRecycling = v8;

        uint64_t v5 = obj;
      }
    }
  }
}

- (void)insertView:(id)a3 inTrackedViewsAtIndex:(int64_t)a4
{
  trackedViews = self->_trackedViews;
  id v7 = a3;
  [(NSMutableArray *)trackedViews insertObject:v7 atIndex:a4];
  [(NSMutableSet *)self->_viewsPendingRecycling removeObject:v7];
}

- (void)removeViewFromTrackedViews:(id)a3
{
  viewsPendingRecycling = self->_viewsPendingRecycling;
  id v5 = a3;
  [(NSMutableSet *)viewsPendingRecycling addObject:v5];
  [(NSMutableArray *)self->_trackedViews removeObject:v5];
}

- (id)makeView
{
  uint64_t v3 = [(NSMutableSet *)self->_reusableViews anyObject];
  if (v3)
  {
    id v4 = (id)v3;
    [(NSMutableSet *)self->_reusableViews removeObject:v3];
    [v4 setHidden:0];
  }
  else
  {
    id v4 = objc_alloc_init(self->_reusableViewClass);
  }
  return v4;
}

- (void)recycleView:(id)a3
{
  reusableViews = self->_reusableViews;
  id v4 = a3;
  [(NSMutableSet *)reusableViews addObject:v4];
  [v4 setHidden:1];
}

- (void)updateTrackedViewsForRepresentedObjectsInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ([(NSMutableSet *)self->_viewsPendingRecycling count])
  {
    [(ViewReuseManager *)self _recycleViewsInCollection:self->_viewsPendingRecycling];
    [(ViewReuseManager *)self _recycleViewsInCollection:self->_trackedViews];
  }
  NSUInteger v7 = [(NSMutableArray *)self->_trackedViews count];
  if (v7)
  {
    v8.NSUInteger length = v7;
    v8.NSUInteger location = self->_firstPreviouslyVisibleRepresentedObjectIndex;
    if (!self->_alwaysSendPrepareForReuse && v8.location == location && v7 == length)
    {
      long long v13 = 0;
      goto LABEL_11;
    }
    v33.NSUInteger location = location;
    v33.NSUInteger length = length;
    NSRange v9 = NSIntersectionRange(v33, v8);
    NSUInteger v10 = v9.location;
    NSUInteger v11 = v9.length;
    if (v9.length)
    {
      NSUInteger v12 = v9.location - self->_firstPreviouslyVisibleRepresentedObjectIndex;
      long long v13 = -[NSMutableArray subarrayWithRange:](self->_trackedViews, "subarrayWithRange:", v12, v9.length);
      -[NSMutableArray removeObjectsInRange:](self->_trackedViews, "removeObjectsInRange:", v12, v9.length);
    }
    else
    {
      long long v13 = 0;
    }
  }
  else
  {
    long long v13 = 0;
    NSUInteger v11 = 0;
    NSUInteger v10 = 0;
  }
  if (v11) {
    NSUInteger v14 = v10;
  }
  else {
    NSUInteger v14 = location;
  }
  self->_firstPreviouslyVisibleRepresentedObjectIndex = location;
  [(ViewReuseManager *)self _recycleViewsInCollection:self->_trackedViews];
  if (location < v14)
  {
    NSUInteger v15 = location;
    do
      [(ViewReuseManager *)self _addTrackedViewForRepresentedObjectAtIndex:v15++];
    while (v14 != v15);
  }
  if (v11)
  {
    NSUInteger v25 = location;
    NSUInteger v26 = length;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v24 = v13;
    id v16 = v13;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          if (self->_alwaysSendPrepareForReuse) {
            [WeakRetained viewReuseManager:self prepareView:*(void *)(*((void *)&v27 + 1) + 8 * i) toRepresentObjectAtIndex:v10 + i];
          }
          [(NSMutableArray *)self->_trackedViews addObject:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
        v10 += i;
      }
      while (v18);
    }

    NSUInteger location = v25;
    NSUInteger length = v26;
    long long v13 = v24;
  }
  NSUInteger v22 = location + length;
  for (NSUInteger j = v14 + v11; j < v22; ++j)
    [(ViewReuseManager *)self _addTrackedViewForRepresentedObjectAtIndex:j];
LABEL_11:
}

- (void)_didReceiveMemoryWarning:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_reusableViews;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "removeFromSuperview", (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(NSMutableSet *)self->_reusableViews removeAllObjects];
}

- (void)_recycleViewsInCollection:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(ViewReuseManager *)self _recycleView:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
  [v4 removeAllObjects];
}

- (void)_recycleView:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained viewReuseManager:self willRecycleView:v5];
  [(ViewReuseManager *)self recycleView:v5];
}

- (void)_addTrackedViewForRepresentedObjectAtIndex:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = [(ViewReuseManager *)self makeView];
  [WeakRetained viewReuseManager:self prepareView:v5 toRepresentObjectAtIndex:a3];
  [(NSMutableArray *)self->_trackedViews addObject:v5];
}

- (Class)reusableViewClass
{
  return self->_reusableViewClass;
}

- (ViewReuseManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ViewReuseManagerDelegate *)WeakRetained;
}

- (BOOL)alwaysSendPrepareForReuse
{
  return self->_alwaysSendPrepareForReuse;
}

- (void)setAlwaysSendPrepareForReuse:(BOOL)a3
{
  self->_alwaysSendPrepareForReuse = a3;
}

- (NSArray)trackedViews
{
  return &self->_trackedViews->super;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewsPendingRecycling, 0);
  objc_storeStrong((id *)&self->_reusableViews, 0);
  objc_storeStrong((id *)&self->_trackedViews, 0);
}

@end