@interface _SAMetricsSendCompletionsProxy
- (_SAMetricsSendCompletionsProxy)init;
- (void)addBlock:(id)a3;
- (void)dealloc;
- (void)dispatchBlocksWithResult:(int64_t)a3 error:(id)a4;
@end

@implementation _SAMetricsSendCompletionsProxy

- (void).cxx_destruct
{
}

- (void)dispatchBlocksWithResult:(int64_t)a3 error:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if ([(NSMutableArray *)self->_blocks count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v6 = self->_blocks;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v10));
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }

    [(NSMutableArray *)self->_blocks removeAllObjects];
  }
}

- (void)addBlock:(id)a3
{
  if (a3)
  {
    blocks = self->_blocks;
    id v5 = (id)[a3 copy];
    v4 = (void *)MEMORY[0x21D4B91D0]();
    [(NSMutableArray *)blocks addObject:v4];
  }
}

- (void)dealloc
{
  [(_SAMetricsSendCompletionsProxy *)self dispatchBlocksWithResult:2 error:0];
  v3.receiver = self;
  v3.super_class = (Class)_SAMetricsSendCompletionsProxy;
  [(_SAMetricsSendCompletionsProxy *)&v3 dealloc];
}

- (_SAMetricsSendCompletionsProxy)init
{
  v6.receiver = self;
  v6.super_class = (Class)_SAMetricsSendCompletionsProxy;
  v2 = [(_SAMetricsSendCompletionsProxy *)&v6 init];
  if (v2)
  {
    objc_super v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    blocks = v2->_blocks;
    v2->_blocks = v3;
  }
  return v2;
}

@end