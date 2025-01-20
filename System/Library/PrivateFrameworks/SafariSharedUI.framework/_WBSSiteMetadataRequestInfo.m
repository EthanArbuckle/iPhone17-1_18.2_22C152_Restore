@interface _WBSSiteMetadataRequestInfo
- (BOOL)canStopWatchingRequestAfterRemovingToken:(id)a3;
- (NSOperation)operation;
- (NSSet)requestTokens;
- (NSSet)tokens;
- (WBSSiteMetadataProvider)provider;
- (_WBSSiteMetadataRequestInfo)initWithProvider:(id)a3;
- (void)addCacheRequestToken:(id)a3;
- (void)addRequestToken:(id)a3;
- (void)dealloc;
- (void)setOperation:(id)a3;
@end

@implementation _WBSSiteMetadataRequestInfo

- (NSSet)requestTokens
{
  v2 = (void *)[(NSMutableSet *)self->_requestTokens copy];
  return (NSSet *)v2;
}

- (_WBSSiteMetadataRequestInfo)initWithProvider:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_WBSSiteMetadataRequestInfo;
  v6 = [(_WBSSiteMetadataRequestInfo *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_provider, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    tokens = v7->_tokens;
    v7->_tokens = (NSMutableSet *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    requestTokens = v7->_requestTokens;
    v7->_requestTokens = (NSMutableSet *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
    cacheRequestTokens = v7->_cacheRequestTokens;
    v7->_cacheRequestTokens = (NSMutableSet *)v12;

    v14 = v7;
  }

  return v7;
}

- (NSOperation)operation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_operation);
  return (NSOperation *)WeakRetained;
}

- (void)addRequestToken:(id)a3
{
  tokens = self->_tokens;
  id v5 = a3;
  [(NSMutableSet *)tokens addObject:v5];
  [(NSMutableSet *)self->_requestTokens addObject:v5];
}

- (NSSet)tokens
{
  v2 = (void *)[(NSMutableSet *)self->_tokens copy];
  return (NSSet *)v2;
}

- (BOOL)canStopWatchingRequestAfterRemovingToken:(id)a3
{
  tokens = self->_tokens;
  id v5 = a3;
  [(NSMutableSet *)tokens removeObject:v5];
  if ([(NSMutableSet *)self->_requestTokens containsObject:v5])
  {
    [(NSMutableSet *)self->_requestTokens removeObject:v5];

    return [(NSMutableSet *)self->_requestTokens count] == 0;
  }
  else
  {
    [(NSMutableSet *)self->_cacheRequestTokens removeObject:v5];

    return 0;
  }
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)_WBSSiteMetadataRequestInfo;
  [(_WBSSiteMetadataRequestInfo *)&v2 dealloc];
}

- (void)addCacheRequestToken:(id)a3
{
  tokens = self->_tokens;
  id v5 = a3;
  [(NSMutableSet *)tokens addObject:v5];
  [(NSMutableSet *)self->_cacheRequestTokens addObject:v5];
}

- (WBSSiteMetadataProvider)provider
{
  return self->_provider;
}

- (void)setOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_operation);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_cacheRequestTokens, 0);
  objc_storeStrong((id *)&self->_requestTokens, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
}

@end