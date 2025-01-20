@interface SKUIResourceRequest
- (BOOL)cachesInMemory;
- (BOOL)isEqual:(id)a3;
- (SKUIResourceRequest)init;
- (id)_initSKUIResourceRequest;
- (id)cacheKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)newLoadOperation;
- (unint64_t)hash;
- (unint64_t)requestIdentifier;
- (void)_initSKUIResourceRequest;
- (void)init;
- (void)setCacheKey:(id)a3;
- (void)setRequestIdentifier:(unint64_t)a3;
@end

@implementation SKUIResourceRequest

- (SKUIResourceRequest)init
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIResourceRequest init]();
  }
  v4.receiver = self;
  v4.super_class = (Class)SKUIResourceRequest;
  result = [(SKUIResourceRequest *)&v4 init];
  if (result) {
    result->_requestID = (int)(atomic_fetch_add_explicit(init_sRequestID, 1u, memory_order_relaxed) + 1);
  }
  return result;
}

- (id)_initSKUIResourceRequest
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIResourceRequest _initSKUIResourceRequest]();
  }
  v4.receiver = self;
  v4.super_class = (Class)SKUIResourceRequest;
  return [(SKUIResourceRequest *)&v4 init];
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
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)SKUIResourceRequest;
  objc_super v4 = [(SKUIResourceRequest *)&v7 description];
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
    unint64_t v7 = [(SKUIResourceRequest *)self requestIdentifier];
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
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initSKUIResourceRequest");
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

- (void)init
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIResourceRequest init]";
}

- (void)_initSKUIResourceRequest
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIResourceRequest _initSKUIResourceRequest]";
}

@end