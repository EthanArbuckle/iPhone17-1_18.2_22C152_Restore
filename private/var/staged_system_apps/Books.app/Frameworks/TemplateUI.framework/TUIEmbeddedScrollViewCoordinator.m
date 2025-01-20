@interface TUIEmbeddedScrollViewCoordinator
- (NSHashTable)embeddedScrollViews;
- (void)registerEmbeddedScrollView:(id)a3;
- (void)unregisterEmbeddedScrollView:(id)a3;
- (void)updateWithImpressionSnapshot:(id)a3;
@end

@implementation TUIEmbeddedScrollViewCoordinator

- (void)registerEmbeddedScrollView:(id)a3
{
  id v4 = a3;
  embeddedScrollViews = self->_embeddedScrollViews;
  id v8 = v4;
  if (!embeddedScrollViews)
  {
    v6 = +[NSHashTable hashTableWithOptions:512];
    v7 = self->_embeddedScrollViews;
    self->_embeddedScrollViews = v6;

    id v4 = v8;
    embeddedScrollViews = self->_embeddedScrollViews;
  }
  [(NSHashTable *)embeddedScrollViews addObject:v4];
}

- (void)unregisterEmbeddedScrollView:(id)a3
{
}

- (void)updateWithImpressionSnapshot:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_embeddedScrollViews;
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
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) updateWithImpressionSnapshot:v4 v10];
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSHashTable)embeddedScrollViews
{
  return self->_embeddedScrollViews;
}

- (void).cxx_destruct
{
}

@end