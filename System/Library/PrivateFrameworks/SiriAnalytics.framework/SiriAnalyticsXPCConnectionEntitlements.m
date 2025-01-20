@interface SiriAnalyticsXPCConnectionEntitlements
- (BOOL)canPublishUnordered;
- (BOOL)hasGenericEntitlement;
- (BOOL)hasPluginState;
- (BOOL)hasRuntimeIntrospection;
- (BOOL)hasRuntimeManagement;
- (BOOL)hasUnifiedMessageStreamReadOnlyAccess;
- (NSArray)extendedEntitlements;
- (SiriAnalyticsXPCConnectionEntitlements)initWithEntitlements:(id)a3;
@end

@implementation SiriAnalyticsXPCConnectionEntitlements

- (void).cxx_destruct
{
}

- (BOOL)hasPluginState
{
  return self->_pluginState;
}

- (BOOL)canPublishUnordered
{
  return self->_publishUnorderedMessages;
}

- (BOOL)hasUnifiedMessageStreamReadOnlyAccess
{
  return self->_unifiedMessageStreamReadOnlyAccess;
}

- (BOOL)hasRuntimeIntrospection
{
  return self->_runtimeIntrospection;
}

- (BOOL)hasRuntimeManagement
{
  return self->_runtimeManagement;
}

- (BOOL)hasGenericEntitlement
{
  return self->_genericEntitlement;
}

- (NSArray)extendedEntitlements
{
  return self->_extendedEntitlements;
}

- (SiriAnalyticsXPCConnectionEntitlements)initWithEntitlements:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SiriAnalyticsXPCConnectionEntitlements;
  v5 = [(SiriAnalyticsXPCConnectionEntitlements *)&v28 init];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5->_genericEntitlement = 1;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v23 = v4;
        id v6 = v4;
        v7 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v8 = v6;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v25 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v14 = v13;
                [(NSArray *)v7 addObject:v14];
                char v15 = [v14 isEqualToString:@"runtime.management"];
                p_runtimeManagement = &v5->_runtimeManagement;
                if (v15) {
                  goto LABEL_16;
                }
                char v17 = [v14 isEqualToString:@"runtime.introspection"];
                p_runtimeManagement = &v5->_runtimeIntrospection;
                if ((v17 & 1) != 0
                  || (char v18 = [v14 isEqualToString:@"stream.unifiedMessageStream.readonly"],
                      p_runtimeManagement = &v5->_unifiedMessageStreamReadOnlyAccess,
                      (v18 & 1) != 0)
                  || (char v19 = [v14 isEqualToString:@"publish.unordered"],
                      p_runtimeManagement = &v5->_publishUnorderedMessages,
                      (v19 & 1) != 0)
                  || (int v20 = [v14 isEqualToString:@"plugin.state"],
                      p_runtimeManagement = &v5->_pluginState,
                      v20))
                {
LABEL_16:
                  BOOL *p_runtimeManagement = 1;
                }
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
          }
          while (v10);
        }

        extendedEntitlements = v5->_extendedEntitlements;
        v5->_extendedEntitlements = v7;

        id v4 = v23;
      }
    }
  }

  return v5;
}

@end