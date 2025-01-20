@interface _SBSUserNotificationButtonDefinitionBuilder
- (_SBSUserNotificationButtonDefinitionBuilder)init;
- (id)build;
- (void)addButtonDefinitionWithTitle:(id)a3 withConfiguration:(id)a4;
@end

@implementation _SBSUserNotificationButtonDefinitionBuilder

- (_SBSUserNotificationButtonDefinitionBuilder)init
{
  v6.receiver = self;
  v6.super_class = (Class)_SBSUserNotificationButtonDefinitionBuilder;
  v2 = [(_SBSUserNotificationButtonDefinitionBuilder *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    definitions = v2->_definitions;
    v2->_definitions = v3;
  }
  return v2;
}

- (void)addButtonDefinitionWithTitle:(id)a3 withConfiguration:(id)a4
{
  id v12 = a3;
  v7 = (void (**)(id, SBSMutableUserNotificationButtonDefinition *))a4;
  if (!v12)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SBSCFUserNotificationButtonDefinition.m", 183, @"Invalid parameter not satisfying: %@", @"title" object file lineNumber description];
  }
  v8 = [(SBSUserNotificationButtonDefinition *)[SBSMutableUserNotificationButtonDefinition alloc] initWithTitle:v12];
  if (v7) {
    v7[2](v7, v8);
  }
  definitions = self->_definitions;
  v10 = (void *)[(SBSMutableUserNotificationButtonDefinition *)v8 copy];
  [(NSMutableArray *)definitions addObject:v10];
}

- (id)build
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->_definitions;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) build:v11];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end