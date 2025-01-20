@interface SKUIItemResourceRequest
- (NSArray)itemIdentifiers;
- (NSString)imageProfile;
- (NSString)keyProfile;
- (SKUIItemRequestDelegate)delegate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newLoadOperation;
- (void)finishWithResource:(id)a3;
- (void)newLoadOperation;
- (void)setDelegate:(id)a3;
- (void)setImageProfile:(id)a3;
- (void)setItemIdentifiers:(id)a3;
- (void)setKeyProfile:(id)a3;
@end

@implementation SKUIItemResourceRequest

- (void)finishWithResource:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIItemResourceRequest finishWithResource:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    v14 = [v4 loadedItems];
    v15 = [v4 invalidItemIdentifiers];
    [WeakRetained itemRequest:self didFinishWithItems:v14 invalidItemIdentifiers:v15];
  }
  if (objc_opt_respondsToSelector())
  {
    v16 = [v4 loadedItems];
    [WeakRetained itemRequest:self didFinishWithItems:v16];
  }
}

- (id)newLoadOperation
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIItemResourceRequest *)v3 newLoadOperation];
      }
    }
  }
  return [[SKUILoadItemResourceOperation alloc] initWithResourceRequest:self];
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIItemResourceRequest copyWithZone:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIItemResourceRequest;
  id v13 = [(SKUIResourceRequest *)&v15 copyWithZone:a3];
  [v13 setImageProfile:self->_imageProfile];
  [v13 setItemIdentifiers:self->_itemIdentifiers];
  [v13 setKeyProfile:self->_keyProfile];
  return v13;
}

- (SKUIItemRequestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIItemRequestDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)imageProfile
{
  return self->_imageProfile;
}

- (void)setImageProfile:(id)a3
{
}

- (NSArray)itemIdentifiers
{
  return self->_itemIdentifiers;
}

- (void)setItemIdentifiers:(id)a3
{
}

- (NSString)keyProfile
{
  return self->_keyProfile;
}

- (void)setKeyProfile:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyProfile, 0);
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
  objc_storeStrong((id *)&self->_imageProfile, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)finishWithResource:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)newLoadOperation
{
}

- (void)copyWithZone:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end