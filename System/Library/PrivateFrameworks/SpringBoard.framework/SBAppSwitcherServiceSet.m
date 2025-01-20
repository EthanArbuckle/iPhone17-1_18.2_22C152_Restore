@interface SBAppSwitcherServiceSet
- (NSMutableArray)services;
- (SBAppSwitcherServiceSet)initWithServices:(id)a3 zone:(_NSZone *)a4;
- (id)appLayouts;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serviceAtIndex:(unint64_t)a3;
- (id)serviceBundleIdentifiers;
- (id)serviceForBundleIdentifier:(id)a3;
- (unint64_t)count;
- (void)addService:(id)a3;
- (void)removeService:(id)a3;
@end

@implementation SBAppSwitcherServiceSet

- (SBAppSwitcherServiceSet)initWithServices:(id)a3 zone:(_NSZone *)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBAppSwitcherServiceSet;
  v7 = [(SBAppSwitcherServiceSet *)&v12 init];
  if (v7)
  {
    v8 = [v6 services];
    uint64_t v9 = [v8 copyWithZone:a4];
    services = v7->_services;
    v7->_services = (NSMutableArray *)v9;
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [SBAppSwitcherServiceSet alloc];
  return [(SBAppSwitcherServiceSet *)v5 initWithServices:self zone:a3];
}

- (void)addService:(id)a3
{
  id v4 = a3;
  services = self->_services;
  id v8 = v4;
  if (!services)
  {
    id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_services;
    self->_services = v6;

    id v4 = v8;
    services = self->_services;
  }
  [(NSMutableArray *)services addObject:v4];
}

- (void)removeService:(id)a3
{
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_services count];
}

- (id)serviceAtIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_services count] <= a3)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(NSMutableArray *)self->_services objectAtIndex:a3];
  }
  return v5;
}

- (id)serviceForBundleIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_services;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "bundleIdentifier", (void)v12);
        if ([v10 isEqualToString:v4])
        {
          id v6 = v9;

          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)serviceBundleIdentifiers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableArray count](self->_services, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_services;
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
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "bundleIdentifier", (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)appLayouts
{
  v2 = [(SBAppSwitcherServiceSet *)self serviceBundleIdentifiers];
  v3 = objc_msgSend(v2, "bs_mapNoNulls:", &__block_literal_global_204);

  return v3;
}

SBAppLayout *__37__SBAppSwitcherServiceSet_appLayouts__block_invoke(uint64_t a1, uint64_t a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = +[SBDisplayItem switcherServiceDisplayItemWithServiceIdentifier:a2];
  v3 = [SBAppLayout alloc];
  id v4 = [NSNumber numberWithInteger:1];
  id v8 = v4;
  v9[0] = v2;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  uint64_t v6 = [(SBAppLayout *)v3 initWithItemsForLayoutRoles:v5 configuration:1 environment:1 preferredDisplayOrdinal:0];

  return v6;
}

- (NSMutableArray)services
{
  return self->_services;
}

- (void).cxx_destruct
{
}

@end