@interface TSDDisplayLinkDispatch
- (void)performBlockNextFrame:(id)a3;
- (void)teardown;
@end

@implementation TSDDisplayLinkDispatch

- (void)teardown
{
  objc_sync_enter(self);
  [(TSDDisplayLink *)self->_displayLink teardown];

  self->_displayLink = 0;
  self->_blocks = 0;

  objc_sync_exit(self);
}

- (void)performBlockNextFrame:(id)a3
{
  v4 = (void *)[a3 copy];
  objc_sync_enter(self);
  blocks = self->_blocks;
  if (!blocks)
  {
    blocks = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_blocks = blocks;
  }
  [(NSMutableArray *)blocks addObject:v4];
  if (!self->_displayLink)
  {
    v6 = objc_alloc_init(TSDDisplayLink);
    self->_displayLink = v6;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __48__TSDDisplayLinkDispatch_performBlockNextFrame___block_invoke;
    v7[3] = &unk_2646B2728;
    v7[4] = self;
    [(TSDDisplayLink *)v6 setTickBlock:v7];
    [(TSDDisplayLink *)self->_displayLink start];
  }
  objc_sync_exit(self);
}

uint64_t __48__TSDDisplayLinkDispatch_performBlockNextFrame___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  objc_sync_enter(v2);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  v5 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = 0;
  *(void *)(*(void *)(a1 + 32) + 8) = 0;
  objc_sync_exit(v2);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * i) + 16))();
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  id v10 = v4;
  return 1;
}

@end