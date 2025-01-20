@interface WBSCopyOnWriteValue
- (NSCopying)value;
- (WBSCopyOnWriteValue)initWithValue:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initAsCopy:(id)a3;
- (void)dealloc;
- (void)willModify;
@end

@implementation WBSCopyOnWriteValue

- (id)copyWithZone:(_NSZone *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initAsCopy:", self);
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)initAsCopy:(id)a3
{
  v4 = (id *)a3;
  v9.receiver = self;
  v9.super_class = (Class)WBSCopyOnWriteValue;
  v5 = [(WBSCopyOnWriteValue *)&v9 init];
  p_isa = (id *)&v5->super.isa;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v5->_state, v4[2]);
    objc_storeStrong(p_isa + 3, v4[3]);
    [p_isa[2] incrementCount];
    v7 = p_isa;
  }

  return p_isa;
}

- (void)willModify
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  state = self->_state;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__WBSCopyOnWriteValue_willModify__block_invoke;
  v7[3] = &unk_1E615A768;
  v7[4] = self;
  v5 = [(WBSCopyOnWriteState *)state forkIfNeededWithHandler:v7];
  v6 = self->_state;
  self->_state = v5;

  os_unfair_lock_unlock(p_lock);
}

- (WBSCopyOnWriteValue)initWithValue:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSCopyOnWriteValue;
  v6 = [(WBSCopyOnWriteValue *)&v12 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    v8 = objc_alloc_init(WBSCopyOnWriteState);
    state = v7->_state;
    v7->_state = v8;

    objc_storeStrong(&v7->_value, a3);
    v10 = v7;
  }

  return v7;
}

void __33__WBSCopyOnWriteValue_willModify__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;
}

- (NSCopying)value
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_value;
  os_unfair_lock_unlock(p_lock);
  return (NSCopying *)v4;
}

- (void)dealloc
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(WBSCopyOnWriteState *)self->_state decrementCount];
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)WBSCopyOnWriteValue;
  [(WBSCopyOnWriteValue *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

@end