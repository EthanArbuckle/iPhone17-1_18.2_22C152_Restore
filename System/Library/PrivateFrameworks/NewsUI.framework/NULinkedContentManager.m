@interface NULinkedContentManager
- (NSArray)linkedContentProviders;
- (NULinkedContentManager)initWithLinkedContentProviders:(id)a3;
- (id)loadLinkedContentForHeadline:(id)a3 withContext:(id)a4 completion:(id)a5;
- (id)loadLinkedContentForHeadline:(id)a3 withContext:(id)a4 priority:(int64_t)a5 completion:(id)a6;
@end

@implementation NULinkedContentManager

- (NULinkedContentManager)initWithLinkedContentProviders:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NULinkedContentManager;
  v6 = [(NULinkedContentManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_linkedContentProviders, a3);
  }

  return v7;
}

- (NSArray)linkedContentProviders
{
  return self->_linkedContentProviders;
}

- (id)loadLinkedContentForHeadline:(id)a3 withContext:(id)a4 completion:(id)a5
{
  return [(NULinkedContentManager *)self loadLinkedContentForHeadline:a3 withContext:a4 priority:0 completion:a5];
}

- (id)loadLinkedContentForHeadline:(id)a3 withContext:(id)a4 priority:(int64_t)a5 completion:(id)a6
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = [MEMORY[0x263EFF980] array];
  v13 = dispatch_group_create();
  if (v9 && v10)
  {
    id v23 = v11;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = (id)[(NSArray *)self->_linkedContentProviders copy];
    uint64_t v14 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v31 != v16) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          dispatch_group_enter(v13);
          if (objc_opt_respondsToSelector())
          {
            v28[0] = MEMORY[0x263EF8330];
            v28[1] = 3221225472;
            v28[2] = __87__NULinkedContentManager_loadLinkedContentForHeadline_withContext_priority_completion___block_invoke;
            v28[3] = &unk_2645FE4C8;
            v29 = v13;
            v19 = [v18 loadLinkedContentForHeadline:v9 withContext:v10 priority:a5 completion:v28];
            v20 = (id *)&v29;
          }
          else
          {
            v26[0] = MEMORY[0x263EF8330];
            v26[1] = 3221225472;
            v26[2] = __87__NULinkedContentManager_loadLinkedContentForHeadline_withContext_priority_completion___block_invoke_2;
            v26[3] = &unk_2645FE4C8;
            v27 = v13;
            v19 = [v18 loadLinkedContentForHeadline:v9 withContext:v10 completion:v26];
            v20 = (id *)&v27;
          }
          [v12 addObject:v19];
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v15);
    }

    id v11 = v23;
  }
  dispatch_group_notify(v13, MEMORY[0x263EF83A0], v11);
  v21 = [MEMORY[0x263F594E8] groupCancelHandlerWithCancelHandlers:v12];

  return v21;
}

void __87__NULinkedContentManager_loadLinkedContentForHeadline_withContext_priority_completion___block_invoke(uint64_t a1)
{
}

void __87__NULinkedContentManager_loadLinkedContentForHeadline_withContext_priority_completion___block_invoke_2(uint64_t a1)
{
}

- (void).cxx_destruct
{
}

@end