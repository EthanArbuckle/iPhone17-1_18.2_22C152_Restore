@interface SXDelayed
+ (id)execute:(id)a3 delay:(double)a4;
- (BOOL)cancelled;
- (SXDelayed)initWithBlock:(id)a3 delay:(double)a4;
- (SXDelayed)strongReference;
- (id)block;
- (void)cancel;
- (void)invoke;
- (void)setBlock:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setStrongReference:(id)a3;
@end

@implementation SXDelayed

+ (id)execute:(id)a3 delay:(double)a4
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    if (a4 > 0.0)
    {
      v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBlock:v5 delay:a4];
      goto LABEL_6;
    }
    (*((void (**)(id))v5 + 2))(v5);
  }
  v7 = 0;
LABEL_6:

  return v7;
}

- (SXDelayed)initWithBlock:(id)a3 delay:(double)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SXDelayed;
  v7 = [(SXDelayed *)&v15 init];
  if (v7)
  {
    uint64_t v8 = MEMORY[0x223CA5030](v6);
    id block = v7->_block;
    v7->_id block = (id)v8;

    objc_storeStrong((id *)&v7->_strongReference, v7);
    objc_initWeak(&location, v7);
    dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __33__SXDelayed_initWithBlock_delay___block_invoke;
    v12[3] = &unk_264651108;
    objc_copyWeak(&v13, &location);
    dispatch_after(v10, MEMORY[0x263EF83A0], v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __33__SXDelayed_initWithBlock_delay___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained strongReference];
    [v2 invoke];

    id WeakRetained = v3;
  }
}

- (void)invoke
{
  id v3 = [(SXDelayed *)self block];

  if (v3)
  {
    v4 = [(SXDelayed *)self block];
    v4[2]();
  }
  [(SXDelayed *)self setStrongReference:0];
}

- (void)cancel
{
  [(SXDelayed *)self setBlock:0];
  [(SXDelayed *)self setStrongReference:0];
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (SXDelayed)strongReference
{
  return self->_strongReference;
}

- (void)setStrongReference:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strongReference, 0);
  objc_storeStrong(&self->_block, 0);
}

@end