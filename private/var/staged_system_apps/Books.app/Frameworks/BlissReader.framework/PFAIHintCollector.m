@interface PFAIHintCollector
- (PFAIHintCollector)initWithStorage:(id)a3;
- (id)lineBreaksForIdref:(id)a3 presentationId:(id)a4;
- (id)pHintCollectorForPresentationId:(id)a3;
- (void)addHintCollection:(id)a3 idref:(id)a4 presentationId:(id)a5;
- (void)addLineBreakHintWithPresentationId:(id)a3;
- (void)addStartHintWithIdref:(id)a3 presentationId:(id)a4;
- (void)dealloc;
- (void)processHintCollections;
- (void)updateLastLineBreakHint;
@end

@implementation PFAIHintCollector

- (PFAIHintCollector)initWithStorage:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PFAIHintCollector;
  v4 = [(PFAIHintCollector *)&v6 init];
  if (v4)
  {
    v4->mStorage = (TSWPStorage *)a3;
    v4->mPresentations = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFAIHintCollector;
  [(PFAIHintCollector *)&v3 dealloc];
}

- (id)pHintCollectorForPresentationId:(id)a3
{
  v5 = (PFAIPresentationHintCollector *)-[NSMutableDictionary objectForKey:](self->mPresentations, "objectForKey:");
  if (!v5)
  {
    v5 = objc_alloc_init(PFAIPresentationHintCollector);
    [(NSMutableDictionary *)self->mPresentations setObject:v5 forKey:a3];
    objc_super v6 = v5;
  }
  return v5;
}

- (void)addStartHintWithIdref:(id)a3 presentationId:(id)a4
{
  id v7 = [(TSWPStorage *)self->mStorage length];
  id v8 = [(PFAIHintCollector *)self pHintCollectorForPresentationId:a4];
  mStorage = self->mStorage;

  [v8 addStartHint:v7 withIdref:a3 textStorage:mStorage];
}

- (void)addLineBreakHintWithPresentationId:(id)a3
{
  id v5 = [(TSWPStorage *)self->mStorage length];
  id v6 = [(PFAIHintCollector *)self pHintCollectorForPresentationId:a3];
  mStorage = self->mStorage;

  [v6 addLineBreakHint:v5 textStorage:mStorage];
}

- (id)lineBreaksForIdref:(id)a3 presentationId:(id)a4
{
  id v5 = [(NSMutableDictionary *)self->mPresentations objectForKey:a4];

  return [v5 lineBreaksForIdref:a3];
}

- (void)addHintCollection:(id)a3 idref:(id)a4 presentationId:(id)a5
{
  id v7 = [(NSMutableDictionary *)self->mPresentations objectForKey:a5];

  [v7 addHintCollection:a3 idref:a4];
}

- (void)processHintCollections
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(NSMutableDictionary *)self->mPresentations objectEnumerator];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) processHintCollectionsWithStorage:self->mStorage];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)updateLastLineBreakHint
{
  id v3 = [(TSWPStorage *)self->mStorage length];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(NSMutableDictionary *)self->mPresentations objectEnumerator];
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      long long v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) updateLastLineBreakHintWithIndex:v3 textStorage:self->mStorage];
        long long v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

@end