@interface TUICancellable
+ (id)newWithCancelBlock:(id)a3;
- (TUICancellable)initWithCancelBlock:(id)a3;
- (void)cancel;
- (void)dealloc;
@end

@implementation TUICancellable

- (TUICancellable)initWithCancelBlock:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TUICancellable;
  v5 = [(TUICancellable *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    id v7 = [v4 copy];
    id cancelBlock = v6->_cancelBlock;
    v6->_id cancelBlock = v7;
  }
  return v6;
}

- (void)dealloc
{
  [(TUICancellable *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)TUICancellable;
  [(TUICancellable *)&v3 dealloc];
}

- (void)cancel
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = objc_retainBlock(self->_cancelBlock);
  id cancelBlock = self->_cancelBlock;
  self->_id cancelBlock = 0;

  os_unfair_lock_unlock(p_lock);
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    v5 = v6;
  }
}

+ (id)newWithCancelBlock:(id)a3
{
  id v3 = a3;
  id v4 = [[TUICancellable alloc] initWithCancelBlock:v3];

  return v4;
}

- (void).cxx_destruct
{
}

@end