@interface AXRTTSettingsListenerHelper
- (AXRTTSettingsListenerHelper)initWithListenerAddress:(void *)a3;
- (void)addSelectorKey:(SEL)a3;
- (void)dealloc;
@end

@implementation AXRTTSettingsListenerHelper

- (AXRTTSettingsListenerHelper)initWithListenerAddress:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AXRTTSettingsListenerHelper;
  result = [(AXRTTSettingsListenerHelper *)&v5 init];
  if (result) {
    result->_listenerAddress = a3;
  }
  return result;
}

- (void)addSelectorKey:(SEL)a3
{
  selectorKeys = self->_selectorKeys;
  if (!selectorKeys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_selectorKeys;
    self->_selectorKeys = v6;

    selectorKeys = self->_selectorKeys;
  }
  NSStringFromSelector(a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableArray *)selectorKeys addObject:v8];
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = self->_selectorKeys;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(NSString **)(*((void *)&v11 + 1) + 8 * v7);
        v9 = +[RTTSettings sharedInstance];
        [v9 registerUpdateBlock:0 forRetrieveSelector:NSSelectorFromString(v8) withListener:self->_listenerAddress];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  v10.receiver = self;
  v10.super_class = (Class)AXRTTSettingsListenerHelper;
  [(AXRTTSettingsListenerHelper *)&v10 dealloc];
}

- (void).cxx_destruct
{
}

@end