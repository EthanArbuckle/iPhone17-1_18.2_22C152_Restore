@interface SUUIResourceRequest
- (BOOL)cachesInMemory;
- (BOOL)isEqual:(id)a3;
- (SUUIResourceRequest)init;
- (id)_initSUUIResourceRequest;
- (id)cacheKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)newLoadOperation;
- (unint64_t)hash;
- (unint64_t)requestIdentifier;
- (void)setCacheKey:(id)a3;
- (void)setRequestIdentifier:(unint64_t)a3;
@end

@implementation SUUIResourceRequest

- (SUUIResourceRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)SUUIResourceRequest;
  result = [(SUUIResourceRequest *)&v3 init];
  if (result) {
    result->_requestID = (int)(atomic_fetch_add_explicit(init_sRequestID, 1u, memory_order_relaxed) + 1);
  }
  return result;
}

- (id)_initSUUIResourceRequest
{
  v3.receiver = self;
  v3.super_class = (Class)SUUIResourceRequest;
  return [(SUUIResourceRequest *)&v3 init];
}

- (BOOL)cachesInMemory
{
  return 0;
}

- (id)newLoadOperation
{
  return 0;
}

- (id)description
{
  objc_super v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)SUUIResourceRequest;
  v4 = [(SUUIResourceRequest *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@: [%lu]", v4, self->_requestID];

  return v5;
}

- (unint64_t)hash
{
  return self->_requestID;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    unint64_t v7 = [(SUUIResourceRequest *)self requestIdentifier];
    BOOL v6 = v7 == [v4 requestIdentifier];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initSUUIResourceRequest");
  objc_storeStrong((id *)(v4 + 8), self->_cacheKey);
  *(void *)(v4 + 16) = self->_requestID;
  return (id)v4;
}

- (id)cacheKey
{
  return self->_cacheKey;
}

- (void)setCacheKey:(id)a3
{
}

- (unint64_t)requestIdentifier
{
  return self->_requestID;
}

- (void)setRequestIdentifier:(unint64_t)a3
{
  self->_requestID = a3;
}

- (void).cxx_destruct
{
}

@end