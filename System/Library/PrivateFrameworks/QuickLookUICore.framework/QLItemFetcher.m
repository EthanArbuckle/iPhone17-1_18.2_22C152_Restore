@interface QLItemFetcher
+ (BOOL)supportsSecureCoding;
- (BOOL)canBeCanceled;
- (BOOL)isLongFetchOperation;
- (NSNumber)itemSize;
- (QLItemFetcher)init;
- (QLItemFetcher)initWithCoder:(id)a3;
- (id)fetchedContent;
- (id)newItemProvider;
- (id)shareableItem;
- (id)urlForThumbnail;
- (int64_t)fetchingState;
- (void)_notifyObservers;
- (void)encodeWithCoder:(id)a3;
- (void)prepareShareableItem:(id)a3;
- (void)registerObserver:(id)a3 withBlock:(id)a4;
- (void)setFetchingState:(int64_t)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation QLItemFetcher

- (QLItemFetcher)init
{
  v6.receiver = self;
  v6.super_class = (Class)QLItemFetcher;
  v2 = [(QLItemFetcher *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    observersToBlocks = v2->_observersToBlocks;
    v2->_observersToBlocks = (NSMapTable *)v3;

    [(QLItemFetcher *)v2 setFetchingState:0];
  }
  return v2;
}

- (void)registerObserver:(id)a3 withBlock:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(NSMapTable *)self->_observersToBlocks objectForKey:v9];
  if (!v7)
  {
    v7 = objc_opt_new();
    [(NSMapTable *)self->_observersToBlocks setObject:v7 forKey:v9];
  }
  v8 = (void *)MEMORY[0x1E4E5A320](v6);
  [v7 addObject:v8];
}

- (void)unregisterObserver:(id)a3
{
}

- (void)setFetchingState:(int64_t)a3
{
  self->_fetchingState = a3;
  [(QLItemFetcher *)self _notifyObservers];
}

- (void)_notifyObservers
{
  uint64_t v3 = [(NSMapTable *)self->_observersToBlocks keyEnumerator];
  v4 = [v3 allObjects];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__QLItemFetcher__notifyObservers__block_invoke;
  v5[3] = &unk_1E6DD3CD8;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
}

void __33__QLItemFetcher__notifyObservers__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:a2];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v7 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)shareableItem
{
  return 0;
}

- (void)prepareShareableItem:(id)a3
{
}

- (id)fetchedContent
{
  return 0;
}

- (BOOL)isLongFetchOperation
{
  return 0;
}

- (BOOL)canBeCanceled
{
  return 0;
}

- (id)urlForThumbnail
{
  return 0;
}

- (NSNumber)itemSize
{
  return 0;
}

- (id)newItemProvider
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[QLItemFetcher fetchingState](self, "fetchingState"), @"fetchingState");
}

- (QLItemFetcher)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(QLItemFetcher *)self init];
  if (v5)
  {
    -[QLItemFetcher setFetchingState:](v5, "setFetchingState:", [v4 decodeIntegerForKey:@"fetchingState"]);
    uint64_t v6 = v5;
  }

  return v5;
}

- (int64_t)fetchingState
{
  return self->_fetchingState;
}

- (void).cxx_destruct
{
}

@end