@interface TUIDynamicRegistry
- (TUIDynamicRegistry)init;
- (id)progressProviderForKind:(id)a3;
- (id)stateProviderForKind:(id)a3;
- (void)registerProgressProvider:(id)a3 forKind:(id)a4;
- (void)registerStateProvider:(id)a3 forKind:(id)a4;
- (void)unregisterStateProviderForKind:(id)a3;
@end

@implementation TUIDynamicRegistry

- (TUIDynamicRegistry)init
{
  v8.receiver = self;
  v8.super_class = (Class)TUIDynamicRegistry;
  v2 = [(TUIDynamicRegistry *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    stateProviders = v2->_stateProviders;
    v2->_stateProviders = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    progressProviders = v2->_progressProviders;
    v2->_progressProviders = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (void)registerStateProvider:(id)a3 forKind:(id)a4
{
  if (a4) {
    -[NSMutableDictionary setObject:forKey:](self->_stateProviders, "setObject:forKey:", a3);
  }
}

- (void)unregisterStateProviderForKind:(id)a3
{
  if (a3) {
    -[NSMutableDictionary removeObjectForKey:](self->_stateProviders, "removeObjectForKey:");
  }
}

- (id)stateProviderForKind:(id)a3
{
  if (a3)
  {
    v4 = -[NSMutableDictionary objectForKey:](self->_stateProviders, "objectForKey:");
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)registerProgressProvider:(id)a3 forKind:(id)a4
{
  if (a4) {
    -[NSMutableDictionary setObject:forKey:](self->_progressProviders, "setObject:forKey:", a3);
  }
}

- (id)progressProviderForKind:(id)a3
{
  if (a3)
  {
    v4 = -[NSMutableDictionary objectForKey:](self->_progressProviders, "objectForKey:");
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressProviders, 0);

  objc_storeStrong((id *)&self->_stateProviders, 0);
}

@end