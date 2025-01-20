@interface UIAccessibilityGamepadEventSource
- (NSObject)identifier;
- (UIAccessibilityGamepadEventSource)init;
- (id)observeGamepadEvents:(id)a3;
- (void)publishGamepadEvent:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation UIAccessibilityGamepadEventSource

- (UIAccessibilityGamepadEventSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)UIAccessibilityGamepadEventSource;
  v2 = [(UIAccessibilityGamepadEventSource *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    handlers = v2->_handlers;
    v2->_handlers = v3;
  }
  return v2;
}

- (void)publishGamepadEvent:(id)a3
{
  id v4 = a3;
  handlers = self->_handlers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__UIAccessibilityGamepadEventSource_publishGamepadEvent___block_invoke;
  v7[3] = &unk_1E59B9820;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)handlers enumerateObjectsUsingBlock:v7];
}

uint64_t __57__UIAccessibilityGamepadEventSource_publishGamepadEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

- (id)observeGamepadEvents:(id)a3
{
  id v4 = (void *)[a3 copy];
  handlers = self->_handlers;
  id v6 = _Block_copy(v4);
  [(NSMutableArray *)handlers addObject:v6];

  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2050000000;
  v7 = (void *)get_GCObservationClass_softClass;
  uint64_t v19 = get_GCObservationClass_softClass;
  if (!get_GCObservationClass_softClass)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __get_GCObservationClass_block_invoke;
    v15[3] = &unk_1E59B89A0;
    v15[4] = &v16;
    __get_GCObservationClass_block_invoke((uint64_t)v15);
    v7 = (void *)v17[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v16, 8);
  id v9 = [v8 alloc];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__UIAccessibilityGamepadEventSource_observeGamepadEvents___block_invoke;
  v13[3] = &unk_1E59B8848;
  v13[4] = self;
  id v14 = v4;
  id v10 = v4;
  v11 = (void *)[v9 initWithCleanupHandler:v13];

  return v11;
}

void __58__UIAccessibilityGamepadEventSource_observeGamepadEvents___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 8);
  id v2 = _Block_copy(*(const void **)(a1 + 40));
  [v1 removeObject:v2];
}

- (NSObject)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_handlers, 0);
}

@end