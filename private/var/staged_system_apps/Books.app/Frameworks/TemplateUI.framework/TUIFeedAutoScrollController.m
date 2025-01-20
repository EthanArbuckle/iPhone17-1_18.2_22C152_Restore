@interface TUIFeedAutoScrollController
- (NSHashTable)pendingQueries;
- (NSMapTable)animated;
- (NSMapTable)skipVoiceOverFocus;
- (TUIFeedAutoScrollController)initWithDelegate:(id)a3;
- (TUIFeedAutoScrollDelegate)delegate;
- (void)addScrollQuery:(id)a3 animated:(BOOL)a4 skipVoiceOverFocus:(BOOL)a5;
- (void)attemptPendingScrolls;
- (void)invalidatePendingScrolls;
- (void)invalidateQuery:(id)a3;
- (void)setAnimated:(id)a3;
- (void)setPendingQueries:(id)a3;
- (void)setSkipVoiceOverFocus:(id)a3;
@end

@implementation TUIFeedAutoScrollController

- (TUIFeedAutoScrollController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TUIFeedAutoScrollController;
  v5 = [(TUIFeedAutoScrollController *)&v14 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = +[NSHashTable hashTableWithOptions:512];
    pendingQueries = v6->_pendingQueries;
    v6->_pendingQueries = (NSHashTable *)v7;

    uint64_t v9 = +[NSMapTable mapTableWithKeyOptions:512 valueOptions:5];
    animated = v6->_animated;
    v6->_animated = (NSMapTable *)v9;

    uint64_t v11 = +[NSMapTable mapTableWithKeyOptions:0 valueOptions:5];
    skipVoiceOverFocus = v6->_skipVoiceOverFocus;
    v6->_skipVoiceOverFocus = (NSMapTable *)v11;
  }
  return v6;
}

- (void)addScrollQuery:(id)a3 animated:(BOOL)a4 skipVoiceOverFocus:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  pendingQueries = self->_pendingQueries;
  id v9 = a3;
  [(NSHashTable *)pendingQueries addObject:v9];
  animated = self->_animated;
  uint64_t v11 = +[NSNumber numberWithBool:v6];
  [(NSMapTable *)animated setObject:v11 forKey:v9];

  skipVoiceOverFocus = self->_skipVoiceOverFocus;
  id v13 = +[NSNumber numberWithBool:v5];
  [(NSMapTable *)skipVoiceOverFocus setObject:v13 forKey:v9];
}

- (void)invalidateQuery:(id)a3
{
  pendingQueries = self->_pendingQueries;
  id v5 = a3;
  [(NSHashTable *)pendingQueries removeObject:v5];
  [(NSMapTable *)self->_animated removeObjectForKey:v5];
  [(NSMapTable *)self->_skipVoiceOverFocus removeObjectForKey:v5];
}

- (void)attemptPendingScrolls
{
  v3 = [(NSHashTable *)self->_pendingQueries allObjects];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_7D984;
  v4[3] = &unk_253F10;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];
}

- (void)invalidatePendingScrolls
{
  [(NSHashTable *)self->_pendingQueries removeAllObjects];
  animated = self->_animated;

  [(NSMapTable *)animated removeAllObjects];
}

- (TUIFeedAutoScrollDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TUIFeedAutoScrollDelegate *)WeakRetained;
}

- (NSHashTable)pendingQueries
{
  return self->_pendingQueries;
}

- (void)setPendingQueries:(id)a3
{
}

- (NSMapTable)animated
{
  return self->_animated;
}

- (void)setAnimated:(id)a3
{
}

- (NSMapTable)skipVoiceOverFocus
{
  return self->_skipVoiceOverFocus;
}

- (void)setSkipVoiceOverFocus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skipVoiceOverFocus, 0);
  objc_storeStrong((id *)&self->_animated, 0);
  objc_storeStrong((id *)&self->_pendingQueries, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end