@interface NMSAlternatingMediaItemGroupIterator
- (unint64_t)iteratingOrder;
- (void)_continueToNextContainer;
- (void)_continueToNextIdentifier;
- (void)_generateItemListAndSizesDictIfNecessary;
- (void)_resetMaxItemListSize;
- (void)markAllRemainingContainersAsSkipped;
- (void)resetToIterateOverQuotaIdentifiers;
@end

@implementation NMSAlternatingMediaItemGroupIterator

- (unint64_t)iteratingOrder
{
  return 1;
}

- (void)_generateItemListAndSizesDictIfNecessary
{
  v3 = [(NMSMediaItemGroupIterator *)self remainingItemLists];

  if (!v3)
  {
    v4.receiver = self;
    v4.super_class = (Class)NMSAlternatingMediaItemGroupIterator;
    [(NMSMediaItemGroupIterator *)&v4 _generateItemListAndSizesDictIfNecessary];
    [(NMSAlternatingMediaItemGroupIterator *)self _resetMaxItemListSize];
  }
}

- (void)_continueToNextIdentifier
{
  [(NMSAlternatingMediaItemGroupIterator *)self _generateItemListAndSizesDictIfNecessary];
  do
  {
    if ([(NMSMediaItemGroupIterator *)self currentItemIndex] >= self->_maxItemListSize) {
      break;
    }
    unint64_t v3 = [(NMSMediaItemGroupIterator *)self currentContainerIndex] + 1;
    objc_super v4 = [(NMSMediaItemGroupIterator *)self remainingItemLists];
    unint64_t v5 = [v4 count];

    if (v3 >= v5)
    {
      [(NMSMediaItemGroupIterator *)self setCurrentContainerIndex:0];
      [(NMSMediaItemGroupIterator *)self setCurrentItemIndex:[(NMSMediaItemGroupIterator *)self currentItemIndex] + 1];
    }
    else
    {
      [(NMSMediaItemGroupIterator *)self setCurrentContainerIndex:[(NMSMediaItemGroupIterator *)self currentContainerIndex] + 1];
    }
    v6 = [(NMSMediaItemGroupIterator *)self currentItem];
  }
  while (!v6);
}

- (void)_continueToNextContainer
{
  [(NMSAlternatingMediaItemGroupIterator *)self _generateItemListAndSizesDictIfNecessary];
  unint64_t v3 = [(NMSMediaItemGroupIterator *)self currentContainerIndex] + 1;

  [(NMSMediaItemGroupIterator *)self setCurrentContainerIndex:v3];
}

- (void)markAllRemainingContainersAsSkipped
{
  [(NMSAlternatingMediaItemGroupIterator *)self _generateItemListAndSizesDictIfNecessary];
  unint64_t v3 = [(NMSMediaItemGroupIterator *)self currentContainerIndex];
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  objc_super v4 = [(NMSMediaItemGroupIterator *)self remainingItemLists];
  uint64_t v5 = [v4 count];

  uint64_t v11 = v5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__NMSAlternatingMediaItemGroupIterator_markAllRemainingContainersAsSkipped__block_invoke;
  v7[3] = &unk_264634248;
  v7[4] = self;
  v7[5] = &v8;
  v6 = (void (**)(void))MEMORY[0x223CA14E0](v7);
  v6[2]();
  [(NMSMediaItemGroupIterator *)self setCurrentContainerIndex:0];
  [(NMSMediaItemGroupIterator *)self setCurrentItemIndex:[(NMSMediaItemGroupIterator *)self currentItemIndex] + 1];
  v9[3] = v3;
  ((void (*)(void (**)(void)))v6[2])(v6);

  _Block_object_dispose(&v8, 8);
}

unint64_t __75__NMSAlternatingMediaItemGroupIterator_markAllRemainingContainersAsSkipped__block_invoke(uint64_t a1)
{
  for (i = *(void **)(a1 + 32); ; i = *(void **)(a1 + 32))
  {
    unint64_t result = [i currentContainerIndex];
    if (result >= *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      break;
    }
    objc_super v4 = [*(id *)(a1 + 32) currentItem];

    if (v4)
    {
      uint64_t v5 = [*(id *)(a1 + 32) remainingContainers];
      v6 = objc_msgSend(v5, "objectAtIndex:", objc_msgSend(*(id *)(a1 + 32), "currentContainerIndex"));
      v7 = [v6 quotaData];
      [v7 setHasSkippedItems:1];
    }
    [*(id *)(a1 + 32) _continueToNextContainer];
  }
  return result;
}

- (void)resetToIterateOverQuotaIdentifiers
{
  v3.receiver = self;
  v3.super_class = (Class)NMSAlternatingMediaItemGroupIterator;
  [(NMSMediaItemGroupIterator *)&v3 resetToIterateOverQuotaIdentifiers];
  [(NMSAlternatingMediaItemGroupIterator *)self _resetMaxItemListSize];
}

- (void)_resetMaxItemListSize
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  self->_unint64_t maxItemListSize = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v3 = [(NMSMediaItemGroupIterator *)self remainingItemLists];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t maxItemListSize = self->_maxItemListSize;
        unint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * v7) count];
        if (maxItemListSize <= v9) {
          unint64_t v10 = v9;
        }
        else {
          unint64_t v10 = maxItemListSize;
        }
        self->_unint64_t maxItemListSize = v10;
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

@end