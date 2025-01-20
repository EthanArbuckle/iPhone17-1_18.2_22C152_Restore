@interface PVCanceler
+ (id)cancelerWithUpdateBlock:(id)a3;
- (BOOL)canceled;
- (id)updateBlock;
- (void)setCanceled:(BOOL)a3;
- (void)setUpdateBlock:(id)a3;
@end

@implementation PVCanceler

- (void).cxx_destruct
{
}

- (void)setUpdateBlock:(id)a3
{
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (BOOL)canceled
{
  p_canceled = &self->_canceled;
  if (!self->_canceled)
  {
    v4 = [(PVCanceler *)self updateBlock];

    if (v4)
    {
      v5 = [(PVCanceler *)self updateBlock];
      ((void (**)(void, BOOL *))v5)[2](v5, p_canceled);
    }
  }
  return *p_canceled;
}

+ (id)cancelerWithUpdateBlock:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PVCanceler);
  [(PVCanceler *)v4 setUpdateBlock:v3];

  return v4;
}

@end