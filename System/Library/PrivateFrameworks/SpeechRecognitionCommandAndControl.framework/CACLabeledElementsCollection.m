@interface CACLabeledElementsCollection
+ (BOOL)canShowElementActionsForElement:(id)a3;
+ (id)_elementActionManager;
+ (id)labeledElementsFromTextMarkerRanges:(id)a3 axElement:(id)a4;
- (BOOL)areElementsNumbered;
- (BOOL)isCollecting;
- (BOOL)isEmpty;
- (CACLabeledElementsCollection)init;
- (NSArray)axElements;
- (double)cachedCollectionTransactionID;
- (double)finishedTime;
- (id)_initWithCollection:(id)a3;
- (id)_keyFromTrait:(unint64_t)a3;
- (id)collectedElements;
- (id)collectedElementsWithTitle:(id)a3;
- (id)collectedElementsWithTrait:(unint64_t)a3;
- (id)copyListOfCollectedElementsSorted;
- (id)copyTableOfCollectedElementsByTitle;
- (id)copyTableOfCollectedElementsByTrait;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newlyCollectedElements;
- (unint64_t)collectionCount;
- (void)addLabeledElementWithItemElement:(id)a3 elementsByTitle:(id)a4 elementsByTrait:(id)a5 elementsSorted:(id)a6;
- (void)cancelCollecting;
- (void)resetCollectedFlagForAllElements;
- (void)setAreElementsNumbered:(BOOL)a3;
- (void)setAxElements:(id)a3;
- (void)updateWithAXElements:(id)a3;
@end

@implementation CACLabeledElementsCollection

+ (id)labeledElementsFromTextMarkerRanges:(id)a3 axElement:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v34;
    CGFloat v12 = *MEMORY[0x263F001A8];
    CGFloat v13 = *(double *)(MEMORY[0x263F001A8] + 8);
    CGFloat v14 = *(double *)(MEMORY[0x263F001A8] + 16);
    CGFloat v15 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v16 = 1;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v8);
        }
        v18 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v19 = [v18 nsRange];
        objc_msgSend(v6, "rectForRange:", v19, v20);
        double x = v40.origin.x;
        double y = v40.origin.y;
        double width = v40.size.width;
        double height = v40.size.height;
        v42.origin.double x = v12;
        v42.origin.double y = v13;
        v42.size.double width = v14;
        v42.size.double height = v15;
        if (!CGRectEqualToRect(v40, v42))
        {
          [v6 visibleFrame];
          v43.origin.double x = v25;
          v43.origin.double y = v26;
          v43.size.double width = v27;
          v43.size.double height = v28;
          v41.origin.double x = x;
          v41.origin.double y = y;
          v41.size.double width = width;
          v41.size.double height = height;
          if (CGRectIntersectsRect(v41, v43))
          {
            v29 = -[CACLabeledElement initWithElement:recognitionStrings:rectangle:]([CACLabeledElement alloc], "initWithElement:recognitionStrings:rectangle:", v6, 0, x, y, width, height);
            v30 = v29;
            if (v29)
            {
              [(CACLabeledElement *)v29 setTextMarkerRange:v18];
              v31 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v16);
              [(CACLabeledElement *)v30 setNumberedLabel:v31];

              [v7 addObject:v30];
              ++v16;
            }
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (id)_elementActionManager
{
  if (_elementActionManager_onceToken_1 != -1) {
    dispatch_once(&_elementActionManager_onceToken_1, &__block_literal_global_44);
  }
  v2 = (void *)_elementActionManager_sElementActionManager_1;
  return v2;
}

void __53__CACLabeledElementsCollection__elementActionManager__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263F22250]);
  id v3 = +[CACAXDragManager sharedManager];
  uint64_t v1 = [v0 initWithDragManager:v3];
  v2 = (void *)_elementActionManager_sElementActionManager_1;
  _elementActionManager_sElementActionManager_1 = v1;
}

+ (BOOL)canShowElementActionsForElement:(id)a3
{
  id v4 = a3;
  id v5 = +[CACDisplayManager sharedManager];
  char v6 = [v5 carPlayConnected];

  if (v6)
  {
    char v7 = 0;
  }
  else
  {
    id v8 = [a1 _elementActionManager];
    char v7 = [v8 canShowActionsForElement:v4];
  }
  return v7;
}

- (CACLabeledElementsCollection)init
{
  v11.receiver = self;
  v11.super_class = (Class)CACLabeledElementsCollection;
  v2 = [(CACLabeledElementsCollection *)&v11 init];
  id v3 = v2;
  if (v2)
  {
    v2->_currentCollectionTransactionID = 0.0;
    v2->_cachedCollectionTransactionID = 0.0;
    uint64_t v4 = objc_opt_new();
    cachedElementsByTitle = v3->_cachedElementsByTitle;
    v3->_cachedElementsByTitle = (NSMutableDictionary *)v4;

    uint64_t v6 = objc_opt_new();
    cachedElementsByTrait = v3->_cachedElementsByTrait;
    v3->_cachedElementsByTrait = (NSMutableDictionary *)v6;

    uint64_t v8 = [MEMORY[0x263EFF980] array];
    cachedElementsSorted = v3->_cachedElementsSorted;
    v3->_cachedElementsSorted = (NSMutableArray *)v8;
  }
  return v3;
}

- (id)_initWithCollection:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CACLabeledElementsCollection;
  id v5 = [(CACLabeledElementsCollection *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 axElements];
    uint64_t v7 = [v6 copy];
    axElements = v5->_axElements;
    v5->_axElements = (NSArray *)v7;

    uint64_t v9 = [v4 copyTableOfCollectedElementsByTitle];
    cachedElementsByTitle = v5->_cachedElementsByTitle;
    v5->_cachedElementsByTitle = (NSMutableDictionary *)v9;

    uint64_t v11 = [v4 copyTableOfCollectedElementsByTrait];
    cachedElementsByTrait = v5->_cachedElementsByTrait;
    v5->_cachedElementsByTrait = (NSMutableDictionary *)v11;

    uint64_t v13 = [v4 copyListOfCollectedElementsSorted];
    cachedElementsSorted = v5->_cachedElementsSorted;
    v5->_cachedElementsSorted = (NSMutableArray *)v13;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 _initWithCollection:self];
}

- (void)cancelCollecting
{
  obj = self;
  objc_sync_enter(obj);
  obj->_currentCollectionTransactionID = 0.0;
  obj->_cachedCollectionTransactionID = 0.0;
  [(NSMutableDictionary *)obj->_cachedElementsByTitle removeAllObjects];
  [(NSMutableDictionary *)obj->_cachedElementsByTrait removeAllObjects];
  [(NSMutableArray *)obj->_cachedElementsSorted removeAllObjects];
  objc_sync_exit(obj);
}

- (BOOL)isCollecting
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_currentCollectionTransactionID != 0.0;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isEmpty
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(NSMutableDictionary *)v2->_cachedElementsByTitle count] == 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)updateWithAXElements:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v24 = a3;
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  double v6 = v5;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  v7->_currentCollectionTransactionID = v6;
  v7->_cachedCollectionTransactionID = v6;
  objc_storeStrong((id *)&v7->_axElements, a3);
  v7->_areElementsNumbered = 0;
  objc_sync_exit(v7);

  CGFloat v28 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v8 = [v24 firstObject];
  uint64_t v9 = [v8 application];
  uint64_t v10 = [v9 bundleId];

  if (![(__CFString *)v10 length])
  {

    uint64_t v10 = @"UnknownAppIdentifier";
  }
  objc_msgSend(v28, "setObject:forKey:", v24, v10, v10);
  uint64_t v11 = objc_opt_new();
  CGFloat v12 = objc_opt_new();
  uint64_t v13 = objc_opt_new();
  if (v7->_currentCollectionTransactionID != v6)
  {
    objc_sync_enter(v7);
LABEL_25:
    [(NSMutableDictionary *)v7->_cachedElementsByTitle removeAllObjects];
    [(NSMutableDictionary *)v7->_cachedElementsByTitle addEntriesFromDictionary:v11];
    [(NSMutableDictionary *)v7->_cachedElementsByTrait removeAllObjects];
    [(NSMutableDictionary *)v7->_cachedElementsByTrait addEntriesFromDictionary:v12];
    [(NSMutableArray *)v7->_cachedElementsSorted removeAllObjects];
    [(NSMutableArray *)v7->_cachedElementsSorted addObjectsFromArray:v13];
    goto LABEL_26;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = [v28 allKeys];
  uint64_t v14 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v14)
  {
    char v26 = 0;
    uint64_t v27 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v34 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        v17 = +[CACAppElementsEvaluationManager sharedManager];
        v18 = [v28 objectForKey:v16];
        uint64_t v19 = [v17 actionableAXElementsFromAXElements:v18 forAppIdentifier:v16];

        uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v30;
          while (2)
          {
            for (uint64_t j = 0; j != v20; ++j)
            {
              if (*(void *)v30 != v21) {
                objc_enumerationMutation(v19);
              }
              [(CACLabeledElementsCollection *)v7 addLabeledElementWithItemElement:*(void *)(*((void *)&v29 + 1) + 8 * j) elementsByTitle:v11 elementsByTrait:v12 elementsSorted:v13];
              if (v7->_currentCollectionTransactionID != v6)
              {
                char v26 = 1;
                goto LABEL_19;
              }
            }
            uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v37 count:16];
            if (v20) {
              continue;
            }
            break;
          }
        }
LABEL_19:
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v14);
  }
  else
  {
    char v26 = 0;
  }

  objc_sync_enter(v7);
  if ((v26 & 1) == 0) {
    goto LABEL_25;
  }
LABEL_26:
  if (v7->_currentCollectionTransactionID == v6) {
    v7->_currentCollectionTransactionID = 0.0;
  }
  objc_sync_exit(v7);
}

- (unint64_t)collectionCount
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  BOOL v3 = [(NSMutableDictionary *)v2->_cachedElementsByTitle allValues];
  unint64_t v4 = 0;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v4 += [*(id *)(*((void *)&v9 + 1) + 8 * v7++) count];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  objc_sync_exit(v2);
  return v4;
}

- (id)collectedElements
{
  BOOL v3 = [MEMORY[0x263EFF980] array];
  unint64_t v4 = self;
  objc_sync_enter(v4);
  [v3 addObjectsFromArray:v4->_cachedElementsSorted];
  objc_sync_exit(v4);

  return v3;
}

- (id)newlyCollectedElements
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263EFF980] array];
  unint64_t v4 = self;
  objc_sync_enter(v4);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(CACLabeledElementsCollection *)v4 collectedElements];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v9 hasBeenCollected] & 1) == 0)
        {
          [v3 addObject:v9];
          [v9 setHasBeenCollected:1];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v4);
  return v3;
}

- (void)resetCollectedFlagForAllElements
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  BOOL v3 = [(CACLabeledElementsCollection *)v2 collectedElements];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) setHasBeenCollected:0];
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (id)copyTableOfCollectedElementsByTitle
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  BOOL v3 = objc_opt_new();
  uint64_t v4 = self;
  objc_sync_enter(v4);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = v4->_cachedElementsByTitle;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        long long v10 = -[NSMutableDictionary objectForKey:](v4->_cachedElementsByTitle, "objectForKey:", v9, (void)v13);
        long long v11 = (void *)[v10 copy];

        [v3 setObject:v11 forKey:v9];
      }
      uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v4);
  return v3;
}

- (id)copyListOfCollectedElementsSorted
{
  BOOL v3 = objc_opt_new();
  uint64_t v4 = self;
  objc_sync_enter(v4);
  [v3 addObjectsFromArray:v4->_cachedElementsSorted];
  objc_sync_exit(v4);

  return v3;
}

- (id)collectedElementsWithTitle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  cachedElementsByTitle = v5->_cachedElementsByTitle;
  uint64_t v7 = [v4 lowercaseString];
  long long v8 = [(NSMutableDictionary *)cachedElementsByTitle objectForKey:v7];
  uint64_t v9 = (void *)[v8 copy];

  objc_sync_exit(v5);
  return v9;
}

- (id)copyTableOfCollectedElementsByTrait
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  BOOL v3 = objc_opt_new();
  id v4 = self;
  objc_sync_enter(v4);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = v4->_cachedElementsByTrait;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        long long v10 = -[NSMutableDictionary objectForKey:](v4->_cachedElementsByTrait, "objectForKey:", v9, (void)v13);
        long long v11 = (void *)[v10 copy];

        [v3 setObject:v11 forKey:v9];
      }
      uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v4);
  return v3;
}

- (id)collectedElementsWithTrait:(unint64_t)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  cachedElementsByTrait = v4->_cachedElementsByTrait;
  uint64_t v6 = [(CACLabeledElementsCollection *)v4 _keyFromTrait:a3];
  uint64_t v7 = [(NSMutableDictionary *)cachedElementsByTrait objectForKey:v6];
  long long v8 = (void *)[v7 copy];

  objc_sync_exit(v4);
  return v8;
}

- (void)addLabeledElementWithItemElement:(id)a3 elementsByTitle:(id)a4 elementsByTrait:(id)a5 elementsSorted:(id)a6
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v39 = a5;
  id v37 = a6;
  uint64_t v12 = (void *)MEMORY[0x263EFF980];
  CGRect v40 = v10;
  long long v13 = [v10 recognitionStrings];
  if (v13)
  {
    long long v14 = [v10 recognitionStrings];
    CGRect v41 = [v12 arrayWithArray:v14];
  }
  else
  {
    CGRect v41 = [v12 arrayWithArray:MEMORY[0x263EFFA68]];
  }

  long long v15 = v41;
  if ([v41 count])
  {
    unint64_t v16 = 0;
    do
    {
      v17 = +[CACAppElementsEvaluationManager sharedManager];
      uint64_t v18 = [v41 objectAtIndex:v16];
      char v19 = [v17 isRecognitionString:v18 supportedForElement:v10];

      if (v19)
      {
        ++v16;
        long long v15 = v41;
      }
      else
      {
        long long v15 = v41;
        [v41 removeObjectAtIndex:v16];
      }
    }
    while (v16 < [v15 count]);
  }
  uint64_t v20 = [CACLabeledElement alloc];
  [v10 visibleFrame];
  uint64_t v21 = -[CACLabeledElement initWithElement:recognitionStrings:rectangle:](v20, "initWithElement:recognitionStrings:rectangle:", v10, v15);
  if (v21)
  {
    obuint64_t j = self;
    objc_sync_enter(obj);
    v22 = [(CACLabeledElement *)v21 element];
    if (+[CACLabeledElementsCollection canShowElementActionsForElement:v22])
    {
      uint64_t v23 = 2;
    }
    else
    {
      uint64_t v23 = 0;
    }
    [(CACLabeledElement *)v21 setBadgeIndicatorMask:v23];

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v24 = v15;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v43 != v26) {
            objc_enumerationMutation(v24);
          }
          CGFloat v28 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          long long v29 = [v28 lowercaseString];
          long long v30 = [v11 objectForKey:v29];

          if (!v30)
          {
            long long v30 = [MEMORY[0x263EFF980] array];
            long long v31 = [v28 lowercaseString];
            [v11 setObject:v30 forKey:v31];
          }
          [v30 addObject:v21];
        }
        uint64_t v25 = [v24 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v25);
    }

    uint64_t v32 = [v40 traits];
    uint64_t v33 = 1;
    uint64_t v34 = 64;
    do
    {
      if ((v33 & v32) != 0)
      {
        long long v35 = [(CACLabeledElementsCollection *)obj _keyFromTrait:v33];
        long long v36 = [v39 objectForKey:v35];
        if (!v36)
        {
          long long v36 = [MEMORY[0x263EFF980] array];
          [v39 setObject:v36 forKey:v35];
        }
        [v36 addObject:v21];
      }
      v33 *= 2;
      --v34;
    }
    while (v34);
    [v37 addObject:v21];
    objc_sync_exit(obj);
  }
}

- (id)_keyFromTrait:(unint64_t)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%lld", a3);
}

- (NSArray)axElements
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAxElements:(id)a3
{
}

- (double)cachedCollectionTransactionID
{
  return self->_cachedCollectionTransactionID;
}

- (BOOL)areElementsNumbered
{
  return self->_areElementsNumbered;
}

- (void)setAreElementsNumbered:(BOOL)a3
{
  self->_areElementsNumbered = a3;
}

- (double)finishedTime
{
  return self->_finishedTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedElementsSorted, 0);
  objc_storeStrong((id *)&self->_cachedElementsByTrait, 0);
  objc_storeStrong((id *)&self->_cachedElementsByTitle, 0);
  objc_storeStrong((id *)&self->_axElements, 0);
}

@end