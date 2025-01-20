@interface _RBSExpirationWarningClient
- (void)initWithBlock:(void *)a3 invalidationBlock:;
- (void)invalidate;
@end

@implementation _RBSExpirationWarningClient

- (void)initWithBlock:(void *)a3 invalidationBlock:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)_RBSExpirationWarningClient;
    a1 = objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      uint64_t v7 = [v5 copy];
      v8 = (void *)a1[1];
      a1[1] = v7;

      uint64_t v9 = [v6 copy];
      v10 = (void *)a1[2];
      a1[2] = v9;
    }
  }

  return a1;
}

- (void)invalidate
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationBlock, 0);
  objc_storeStrong(&self->_block, 0);
}

@end