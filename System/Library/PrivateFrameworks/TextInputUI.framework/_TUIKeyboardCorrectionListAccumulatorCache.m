@interface _TUIKeyboardCorrectionListAccumulatorCache
- (NSMutableArray)requestQueue;
- (NSMutableDictionary)requestCache;
- (_TUIKeyboardCorrectionListAccumulatorCache)initWithSize:(unint64_t)a3;
- (id)accumulatorForToken:(id)a3 type:(int)a4;
- (unint64_t)count;
- (unint64_t)maxSize;
- (void)addToCache:(id)a3 type:(int)a4;
- (void)emptyCache;
- (void)setMaxSize:(unint64_t)a3;
- (void)setRequestCache:(id)a3;
- (void)setRequestQueue:(id)a3;
@end

@implementation _TUIKeyboardCorrectionListAccumulatorCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_requestCache, 0);
}

- (void)setMaxSize:(unint64_t)a3
{
  self->_maxSize = a3;
}

- (unint64_t)maxSize
{
  return self->_maxSize;
}

- (void)setRequestQueue:(id)a3
{
}

- (NSMutableArray)requestQueue
{
  return self->_requestQueue;
}

- (void)setRequestCache:(id)a3
{
}

- (NSMutableDictionary)requestCache
{
  return self->_requestCache;
}

- (void)emptyCache
{
  v3 = [(_TUIKeyboardCorrectionListAccumulatorCache *)self requestQueue];
  [v3 removeAllObjects];

  id v4 = [(_TUIKeyboardCorrectionListAccumulatorCache *)self requestCache];
  [v4 removeAllObjects];
}

- (unint64_t)count
{
  v2 = [(_TUIKeyboardCorrectionListAccumulatorCache *)self requestQueue];
  unint64_t v3 = [v2 count];

  return v3;
}

- (void)addToCache:(id)a3 type:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = [v6 token];
  v8 = [v7 shortIdentifier];
  objc_msgSend(v8, "stringByAppendingFormat:", @":%d", v4);
  id v18 = (id)objc_claimAutoreleasedReturnValue();

  v9 = [(_TUIKeyboardCorrectionListAccumulatorCache *)self requestCache];
  [v9 setObject:v6 forKeyedSubscript:v18];

  v10 = [(_TUIKeyboardCorrectionListAccumulatorCache *)self requestQueue];
  [v10 addObject:v18];

  v11 = [(_TUIKeyboardCorrectionListAccumulatorCache *)self requestQueue];
  if ([v11 count])
  {
    v12 = [(_TUIKeyboardCorrectionListAccumulatorCache *)self requestQueue];
    unint64_t v13 = [v12 count];
    unint64_t v14 = [(_TUIKeyboardCorrectionListAccumulatorCache *)self maxSize];

    if (v13 <= v14) {
      goto LABEL_5;
    }
    v15 = [(_TUIKeyboardCorrectionListAccumulatorCache *)self requestQueue];
    v11 = [v15 firstObject];

    v16 = [(_TUIKeyboardCorrectionListAccumulatorCache *)self requestQueue];
    [v16 removeObjectAtIndex:0];

    v17 = [(_TUIKeyboardCorrectionListAccumulatorCache *)self requestCache];
    [v17 removeObjectForKey:v11];
  }
LABEL_5:
}

- (id)accumulatorForToken:(id)a3 type:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = [(_TUIKeyboardCorrectionListAccumulatorCache *)self requestCache];
  v8 = [v6 shortIdentifier];

  v9 = objc_msgSend(v8, "stringByAppendingFormat:", @":%d", v4);
  v10 = [v7 objectForKey:v9];

  return v10;
}

- (_TUIKeyboardCorrectionListAccumulatorCache)initWithSize:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_TUIKeyboardCorrectionListAccumulatorCache;
  uint64_t v4 = [(_TUIKeyboardCorrectionListAccumulatorCache *)&v10 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    requestCache = v4->_requestCache;
    v4->_requestCache = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    requestQueue = v4->_requestQueue;
    v4->_requestQueue = (NSMutableArray *)v7;

    v4->_maxSize = a3;
  }
  return v4;
}

@end