@interface _UVBSActionHandler
- (_UVBSActionHandler)initWithHandler:(id)a3;
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
@end

@implementation _UVBSActionHandler

- (_UVBSActionHandler)initWithHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UVBSActionHandler;
  v5 = [(_UVBSActionHandler *)&v9 init];
  if (v5)
  {
    v6 = _Block_copy(v4);
    id handler = v5->_handler;
    v5->_id handler = v6;
  }
  return v5;
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = (void *)[v7 mutableCopy];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if ((*((unsigned int (**)(id))self->_handler + 2))(self->_handler)) {
          objc_msgSend(v8, "removeObject:", v14, (void)v16);
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end