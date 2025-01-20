@interface TSKAggregateSearchTargetProvider
- (NSArray)searchTargetProviders;
- (TSKAggregateSearchTargetProvider)initWithSearchTargetProviders:(id)a3;
- (unint64_t)nextRootSearchTargetIndexFromIndex:(unint64_t)a3 forString:(id)a4 options:(unint64_t)a5 inDirection:(unint64_t)a6;
- (unint64_t)p_firstTargetIndexForProvider:(id)a3;
- (unint64_t)rootSearchTargetCountThroughIndex:(unint64_t)a3;
- (void)dealloc;
- (void)p_enumerateTargetProvidersFromTargetIndex:(unint64_t)a3 direction:(unint64_t)a4 action:(id)a5;
- (void)setSearchTargetProviders:(id)a3;
- (void)withRootSearchTargetAtIndex:(unint64_t)a3 executeBlock:(id)a4;
@end

@implementation TSKAggregateSearchTargetProvider

- (TSKAggregateSearchTargetProvider)initWithSearchTargetProviders:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSKAggregateSearchTargetProvider;
  v4 = [(TSKAggregateSearchTargetProvider *)&v7 init];
  v5 = v4;
  if (v4) {
    [(TSKAggregateSearchTargetProvider *)v4 setSearchTargetProviders:a3];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSKAggregateSearchTargetProvider;
  [(TSKAggregateSearchTargetProvider *)&v3 dealloc];
}

- (unint64_t)rootSearchTargetCountThroughIndex:(unint64_t)a3
{
  objc_super v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSKAggregateSearchTargetProvider rootSearchTargetCountThroughIndex:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAggregateSearchTargetProvider.m"), 44, @"no implementation because it's not currently used outside TSKDocumentRoot");
  return 0;
}

- (void)withRootSearchTargetAtIndex:(unint64_t)a3 executeBlock:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  searchTargetProviders = self->_searchTargetProviders;
  uint64_t v7 = [(NSArray *)searchTargetProviders countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      uint64_t v10 = 0;
      unint64_t v11 = a3;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(searchTargetProviders);
        }
        v12 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
        unint64_t v13 = [v12 rootSearchTargetCountThroughIndex:v11];
        a3 = v11 - v13;
        if (v11 < v13)
        {
          [v12 withRootSearchTargetAtIndex:v11 executeBlock:a4];
          return;
        }
        ++v10;
        v11 -= v13;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)searchTargetProviders countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
}

- (unint64_t)nextRootSearchTargetIndexFromIndex:(unint64_t)a3 forString:(id)a4 options:(unint64_t)a5 inDirection:(unint64_t)a6
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __101__TSKAggregateSearchTargetProvider_nextRootSearchTargetIndexFromIndex_forString_options_inDirection___block_invoke;
  v8[3] = &unk_2646B0E20;
  v8[7] = a5;
  v8[8] = a6;
  v8[5] = self;
  v8[6] = &v9;
  v8[4] = a4;
  [(TSKAggregateSearchTargetProvider *)self p_enumerateTargetProvidersFromTargetIndex:a3 direction:a6 action:v8];
  unint64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

BOOL __101__TSKAggregateSearchTargetProvider_nextRootSearchTargetIndexFromIndex_forString_options_inDirection___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 nextRootSearchTargetIndexFromIndex:a3 forString:*(void *)(a1 + 32) options:*(void *)(a1 + 56) inDirection:*(void *)(a1 + 64)];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "p_firstTargetIndexForProvider:", a2)+ v5;
  }
  return v5 == 0x7FFFFFFFFFFFFFFFLL;
}

- (void)p_enumerateTargetProvidersFromTargetIndex:(unint64_t)a3 direction:(unint64_t)a4 action:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  searchTargetProviders = self->_searchTargetProviders;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t v8 = a3, (v10 = [(NSArray *)self->_searchTargetProviders count]) == 0))
  {
LABEL_6:
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  NSUInteger v11 = v10;
  NSUInteger v12 = 0;
  while (1)
  {
    id v13 = [(NSArray *)self->_searchTargetProviders objectAtIndex:v12];
    unint64_t v14 = [v13 rootSearchTargetCountThroughIndex:v8];
    if (v8 < v14) {
      break;
    }
    ++v12;
    v8 -= v14;
    if (v11 == v12) {
      goto LABEL_6;
    }
  }
  if ((*((unsigned int (**)(id, id, unint64_t))a5 + 2))(a5, v13, v8))
  {
    v20 = self->_searchTargetProviders;
    if (!a4)
    {
      NSUInteger v21 = [(NSArray *)self->_searchTargetProviders count];
      if (v12 >= v21) {
        NSUInteger v22 = v12 + 1;
      }
      else {
        NSUInteger v22 = v21;
      }
      if (v12 < v21) {
        NSUInteger v23 = v12 + 1;
      }
      else {
        NSUInteger v23 = v21;
      }
      uint64_t v15 = -[NSArray subarrayWithRange:](v20, "subarrayWithRange:", v23, v22 - v23);
      goto LABEL_8;
    }
    searchTargetProviders = -[NSArray subarrayWithRange:](self->_searchTargetProviders, "subarrayWithRange:", 0, v12);
LABEL_7:
    uint64_t v15 = [(NSArray *)searchTargetProviders reverseObjectEnumerator];
LABEL_8:
    searchTargetProviders = (NSArray *)v15;
    goto LABEL_9;
  }
  searchTargetProviders = 0;
  if (a4) {
    goto LABEL_7;
  }
LABEL_9:
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v16 = [(NSArray *)searchTargetProviders countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v25;
LABEL_11:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v25 != v18) {
        objc_enumerationMutation(searchTargetProviders);
      }
      if (!(*((unsigned int (**)(id, void, uint64_t))a5 + 2))(a5, *(void *)(*((void *)&v24 + 1) + 8 * v19), 0x7FFFFFFFFFFFFFFFLL))break; {
      if (v17 == ++v19)
      }
      {
        uint64_t v17 = [(NSArray *)searchTargetProviders countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v17) {
          goto LABEL_11;
        }
        return;
      }
    }
  }
}

- (unint64_t)p_firstTargetIndexForProvider:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  searchTargetProviders = self->_searchTargetProviders;
  uint64_t v5 = [(NSArray *)searchTargetProviders countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  unint64_t v7 = 0;
  uint64_t v8 = *(void *)v13;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v13 != v8) {
      objc_enumerationMutation(searchTargetProviders);
    }
    id v10 = *(id *)(*((void *)&v12 + 1) + 8 * v9);
    if (v10 == a3) {
      return v7;
    }
    v7 += [v10 rootSearchTargetCountThroughIndex:0x7FFFFFFFFFFFFFFFLL];
    if (v6 == ++v9)
    {
      uint64_t v6 = [(NSArray *)searchTargetProviders countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return v7;
    }
  }
}

- (NSArray)searchTargetProviders
{
  return self->_searchTargetProviders;
}

- (void)setSearchTargetProviders:(id)a3
{
}

@end