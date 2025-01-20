@interface _UIBurnableBlock
- (BOOL)performWithInput:(id)a3;
- (_UIBurnableBlock)initWithTimeout:(double)a3 block:(id)a4 defaultInputProvider:(id)a5;
- (void)_cancelTimerIfNeeded;
- (void)dealloc;
@end

@implementation _UIBurnableBlock

- (_UIBurnableBlock)initWithTimeout:(double)a3 block:(id)a4 defaultInputProvider:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)_UIBurnableBlock;
  v10 = [(_UIBurnableBlock *)&v22 init];
  if (v10)
  {
    v11 = _Block_copy(v8);
    id block = v10->_block;
    v10->_id block = v11;

    v13 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
    dispatch_time_t v14 = dispatch_time(0, (unint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v13, v14, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(a3 * 0.1 * 1000000000.0));
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __63___UIBurnableBlock_initWithTimeout_block_defaultInputProvider___block_invoke;
    v19[3] = &unk_1E52DB330;
    id v21 = v9;
    v15 = v10;
    v20 = v15;
    dispatch_source_set_event_handler(v13, v19);
    dispatch_activate(v13);
    timer = v15->_timer;
    v15->_timer = (OS_dispatch_source *)v13;
    v17 = v13;
  }
  return v10;
}

- (BOOL)performWithInput:(id)a3
{
  id v4 = a3;
  [(_UIBurnableBlock *)self _cancelTimerIfNeeded];
  id block = (void (**)(id, id))self->_block;
  if (block)
  {
    block[2](self->_block, v4);
    id v6 = self->_block;
    self->_id block = 0;
  }
  return block != 0;
}

- (void)dealloc
{
  [(_UIBurnableBlock *)self _cancelTimerIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)_UIBurnableBlock;
  [(_UIBurnableBlock *)&v3 dealloc];
}

- (void)_cancelTimerIfNeeded
{
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    id v4 = self->_timer;
    self->_timer = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end