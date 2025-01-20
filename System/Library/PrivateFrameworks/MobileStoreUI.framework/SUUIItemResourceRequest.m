@interface SUUIItemResourceRequest
- (NSArray)itemIdentifiers;
- (NSString)imageProfile;
- (NSString)keyProfile;
- (SUUIItemRequestDelegate)delegate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newLoadOperation;
- (void)finishWithResource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setImageProfile:(id)a3;
- (void)setItemIdentifiers:(id)a3;
- (void)setKeyProfile:(id)a3;
@end

@implementation SUUIItemResourceRequest

- (void)finishWithResource:(id)a3
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    v5 = [v8 loadedItems];
    v6 = [v8 invalidItemIdentifiers];
    [WeakRetained itemRequest:self didFinishWithItems:v5 invalidItemIdentifiers:v6];
  }
  if (objc_opt_respondsToSelector())
  {
    v7 = [v8 loadedItems];
    [WeakRetained itemRequest:self didFinishWithItems:v7];
  }
}

- (id)newLoadOperation
{
  v3 = [SUUILoadItemResourceOperation alloc];

  return [(SUUILoadItemResourceOperation *)v3 initWithResourceRequest:self];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUUIItemResourceRequest;
  id v4 = [(SUUIResourceRequest *)&v6 copyWithZone:a3];
  [v4 setImageProfile:self->_imageProfile];
  [v4 setItemIdentifiers:self->_itemIdentifiers];
  [v4 setKeyProfile:self->_keyProfile];
  return v4;
}

- (SUUIItemRequestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SUUIItemRequestDelegate *)WeakRetained;
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

@end