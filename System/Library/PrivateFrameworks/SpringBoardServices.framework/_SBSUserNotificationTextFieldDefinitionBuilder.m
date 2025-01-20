@interface _SBSUserNotificationTextFieldDefinitionBuilder
- (_SBSUserNotificationTextFieldDefinitionBuilder)init;
- (id)build;
- (void)addTextFieldDefinitionWithConfiguration:(id)a3;
@end

@implementation _SBSUserNotificationTextFieldDefinitionBuilder

- (_SBSUserNotificationTextFieldDefinitionBuilder)init
{
  v6.receiver = self;
  v6.super_class = (Class)_SBSUserNotificationTextFieldDefinitionBuilder;
  v2 = [(_SBSUserNotificationTextFieldDefinitionBuilder *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    definitions = v2->_definitions;
    v2->_definitions = v3;
  }
  return v2;
}

- (void)addTextFieldDefinitionWithConfiguration:(id)a3
{
  v7 = (void (**)(id, SBSMutableUserNotificationTextFieldDefinition *))a3;
  v4 = objc_alloc_init(SBSMutableUserNotificationTextFieldDefinition);
  if (v7) {
    v7[2](v7, v4);
  }
  definitions = self->_definitions;
  objc_super v6 = (void *)[(SBSMutableUserNotificationTextFieldDefinition *)v4 copy];
  [(NSMutableArray *)definitions addObject:v6];
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