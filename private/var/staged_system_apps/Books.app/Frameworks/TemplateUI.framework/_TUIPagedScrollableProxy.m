@interface _TUIPagedScrollableProxy
- (TUIPagedScrollableAction)action;
- (_TUIPagedScrollableProxy)init;
- (unint64_t)pageCount;
- (unint64_t)pageIndex;
- (void)addObserver:(id)a3;
- (void)pagedScrollableActionChangeToPageIndex:(unint64_t)a3;
- (void)removeObserver:(id)a3;
- (void)setAction:(id)a3;
- (void)updateWithPageIndex:(unint64_t)a3 pageCount:(unint64_t)a4;
@end

@implementation _TUIPagedScrollableProxy

- (_TUIPagedScrollableProxy)init
{
  v6.receiver = self;
  v6.super_class = (Class)_TUIPagedScrollableProxy;
  v2 = [(_TUIPagedScrollableProxy *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSHashTable hashTableWithOptions:517];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;
  }
  return v2;
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)updateWithPageIndex:(unint64_t)a3 pageCount:(unint64_t)a4
{
  if (self->_pageIndex != a3 || self->_pageCount != a4)
  {
    self->_pageIndex = a3;
    self->_pageCount = a4;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v5 = self->_observers;
    id v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) pagedScrollableDidChange:self v10];
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)pagedScrollableActionChangeToPageIndex:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_action);
  [WeakRetained pagedScrollableActionChangeToPageIndex:a3];
}

- (unint64_t)pageIndex
{
  return self->_pageIndex;
}

- (unint64_t)pageCount
{
  return self->_pageCount;
}

- (TUIPagedScrollableAction)action
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_action);

  return (TUIPagedScrollableAction *)WeakRetained;
}

- (void)setAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_action);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end