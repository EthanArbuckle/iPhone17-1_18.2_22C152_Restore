@interface THAnnotationUndoGroup
- (BOOL)hasActions;
- (NSDictionary)context;
- (id)redoWithAnnotationHost:(id)a3 moc:(id)a4;
- (id)undoWithAnnotationHost:(id)a3 moc:(id)a4;
- (void)addAction:(id)a3;
- (void)dealloc;
- (void)setContext:(id)a3;
@end

@implementation THAnnotationUndoGroup

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THAnnotationUndoGroup;
  [(THAnnotationUndoGroup *)&v3 dealloc];
}

- (BOOL)hasActions
{
  return [(NSMutableArray *)self->_actions count] != 0;
}

- (void)addAction:(id)a3
{
  if (a3)
  {
    actions = self->_actions;
    if (!actions)
    {
      actions = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      self->_actions = actions;
    }
    [(NSMutableArray *)actions addObject:a3];
  }
  else
  {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THAnnotationUndoGroup addAction:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationUndoGroup.m"] lineNumber:41 description:[NSString stringWithFormat:@"invalid nil value for '%s'", "action"];
  }
}

- (id)undoWithAnnotationHost:(id)a3 moc:(id)a4
{
  v7 = objc_alloc_init(THAnnotationChangeList);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = [(NSMutableArray *)self->_actions reverseObjectEnumerator];
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * (void)v12) undoWithChangeList:v7 annotationHost:a3 moc:a4];
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
  return v7;
}

- (id)redoWithAnnotationHost:(id)a3 moc:(id)a4
{
  v7 = objc_alloc_init(THAnnotationChangeList);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  actions = self->_actions;
  id v9 = [(NSMutableArray *)actions countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(actions);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * (void)v12) redoWithChangeList:v7 annotationHost:a3 moc:a4];
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableArray *)actions countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
  return v7;
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

@end