@interface TraceBookmarkSelector
- (BOOL)_canShowWhileLocked;
- (MNTraceBookmarkSelectorDelegate)delegate;
- (MNTracePlayer)tracePlayer;
- (TraceBookmarkSelector)initWithStyle:(int64_t)a3;
- (UITableViewCell)_noBookmarksCell;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_done;
- (void)dealloc;
- (void)reloadBookmarks;
- (void)setDelegate:(id)a3;
- (void)setTracePlayer:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation TraceBookmarkSelector

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (TraceBookmarkSelector)initWithStyle:(int64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)TraceBookmarkSelector;
  v3 = [(TraceBookmarkSelector *)&v11 initWithStyle:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(TraceBookmarkSelector *)v3 navigationItem];
    [v5 setTitle:@"Bookmarks"];

    v6 = (NSCache *)objc_alloc_init((Class)NSCache);
    bookmarkImageCache = v4->_bookmarkImageCache;
    v4->_bookmarkImageCache = v6;

    [(NSCache *)v4->_bookmarkImageCache setCountLimit:10];
    id v8 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:v4 action:"_done"];
    v9 = [(TraceBookmarkSelector *)v4 navigationItem];
    [v9 setRightBarButtonItem:v8];
  }
  return v4;
}

- (void)dealloc
{
  [(TraceBookmarkSelector *)self setTracePlayer:0];
  bookmarkImageCache = self->_bookmarkImageCache;
  self->_bookmarkImageCache = 0;

  v4.receiver = self;
  v4.super_class = (Class)TraceBookmarkSelector;
  [(TraceBookmarkSelector *)&v4 dealloc];
}

- (void)reloadBookmarks
{
  v2 = +[NSMutableArray array];
  +[MNNavigationService sharedService];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v15 = long long v20 = 0u;
  v3 = [v15 traceBookmarks];
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v18;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v8);
        v10 = [TraceNavBookmarkRow alloc];
        [v9 timestamp];
        objc_super v11 = -[TraceNavBookmarkRow initWithBookmarkIndex:time:](v10, "initWithBookmarkIndex:time:", (char *)v8 + v6);
        [(NSArray *)v2 addObject:v11];

        id v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      id v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      v6 += (uint64_t)v8;
    }
    while (v5);
  }

  if (![(NSArray *)v2 count])
  {
    v12 = [(TraceBookmarkRow *)[TraceNoBookmarksRow alloc] initWithName:@"No bookmarks." detail:&stru_101324E70];
    [(NSArray *)v2 addObject:v12];
  }
  bookmarks = self->_bookmarks;
  self->_bookmarks = v2;

  v14 = [(TraceBookmarkSelector *)self tableView];
  [v14 reloadData];
}

- (void)setTracePlayer:(id)a3
{
  id v5 = (MNTracePlayer *)a3;
  if (self->_tracePlayer != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_tracePlayer, a3);
    [(NSCache *)self->_bookmarkImageCache removeAllObjects];
    [(TraceBookmarkSelector *)self reloadBookmarks];
    id v5 = v6;
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_bookmarks count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  uint64_t v7 = -[NSArray objectAtIndexedSubscript:](self->_bookmarks, "objectAtIndexedSubscript:", [a4 row]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [v6 dequeueReusableCellWithIdentifier:@"TraceGuideMeBookmarkCell"];
      if (v8)
      {
LABEL_12:
        [v7 configureCell:v8];
        goto LABEL_17;
      }
      id v13 = [objc_alloc((Class)UITableViewCell) initWithStyle:3 reuseIdentifier:@"TraceGuideMeBookmarkCell"];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v8 = 0;
        goto LABEL_17;
      }
      id v13 = [(TraceBookmarkSelector *)self _noBookmarksCell];
    }
    id v8 = v13;
    goto LABEL_12;
  }
  id v8 = [v6 dequeueReusableCellWithIdentifier:@"TraceNavBookmarkCell"];
  if (!v8) {
    id v8 = [objc_alloc((Class)UITableViewCell) initWithStyle:3 reuseIdentifier:@"TraceNavBookmarkCell"];
  }
  id v9 = [v7 bookmarkIndex];
  [v7 configureCell:v8];
  v10 = [(NSCache *)self->_bookmarkImageCache objectForKey:v7];

  if (v10)
  {
    objc_super v11 = [(NSCache *)self->_bookmarkImageCache objectForKey:v7];
    v12 = [v8 imageView];
    [v12 setImage:v11];
  }
  else
  {
    v14 = +[MNNavigationService sharedService];
    v15 = [v14 traceBookmarks];
    v16 = [v15 objectAtIndexedSubscript:v9];

    long long v17 = [v16 imageData];
    if ([v17 length])
    {
      long long v18 = +[UIImage imageWithData:v17];
      [(NSCache *)self->_bookmarkImageCache setObject:v18 forKey:v7];
      long long v19 = [v8 imageView];
      [v19 setImage:v18];
    }
  }
LABEL_17:

  return v8;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[NSArray objectAtIndexedSubscript:](self->_bookmarks, "objectAtIndexedSubscript:", [v7 row]);
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    double v9 = 100.0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)TraceBookmarkSelector;
    [(TraceBookmarkSelector *)&v12 tableView:v6 heightForRowAtIndexPath:v7];
    double v9 = v10;
  }

  return v9;
}

- (UITableViewCell)_noBookmarksCell
{
  noBookmarksCell = self->_noBookmarksCell;
  if (!noBookmarksCell)
  {
    id v4 = (UITableViewCell *)[objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:0];
    id v5 = self->_noBookmarksCell;
    self->_noBookmarksCell = v4;

    noBookmarksCell = self->_noBookmarksCell;
  }

  return noBookmarksCell;
}

- (void)_done
{
  id v2 = [(TraceBookmarkSelector *)self presentingViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  -[NSArray objectAtIndexedSubscript:](self->_bookmarks, "objectAtIndexedSubscript:", objc_msgSend(a4, "row", a3));
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v10;
    id v6 = +[MNNavigationService sharedService];
    id v7 = [v6 traceBookmarks];
    id v8 = [v5 bookmarkIndex];

    double v9 = [v7 objectAtIndexedSubscript:v8];

    [v9 timestamp];
    [v6 setTracePosition:];
  }
  [(TraceBookmarkSelector *)self _done];
}

- (MNTracePlayer)tracePlayer
{
  return self->_tracePlayer;
}

- (MNTraceBookmarkSelectorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MNTraceBookmarkSelectorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmarks, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bookmarkImageCache, 0);
  objc_storeStrong((id *)&self->_noBookmarksCell, 0);

  objc_storeStrong((id *)&self->_tracePlayer, 0);
}

@end