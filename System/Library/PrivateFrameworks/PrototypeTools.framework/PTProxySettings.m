@interface PTProxySettings
+ (id)new;
+ (id)proxyWithDefinition:(id)a3;
+ (id)settingsFromArchiveDictionary:(id)a3;
+ (id)settingsOrProxyWithDefinition:(id)a3;
- (PTProxySettings)init;
- (PTProxySettings)initWithDefaultValues;
- (PTProxySettingsDefinition)definition;
- (id)_createChildForKey:(id)a3;
- (id)_initWithDefinition:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)module;
- (id)valueForKey:(id)a3;
- (void)restoreDefaultValues;
- (void)restoreFromArchiveDictionary:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation PTProxySettings

+ (id)proxyWithDefinition:(id)a3
{
  id v3 = a3;
  id v4 = [[PTProxySettings alloc] _initWithDefinition:v3];

  return v4;
}

+ (id)settingsOrProxyWithDefinition:(id)a3
{
  id v3 = a3;
  if ([v3 allSettingsClassesExistAndHaveCorrectVersion])
  {
    id v4 = (objc_class *)[v3 settingsClass];

    v5 = (void *)[[v4 alloc] initWithDefaultValues];
  }
  else
  {
    v5 = +[PTProxySettings proxyWithDefinition:v3];
  }
  return v5;
}

- (id)_initWithDefinition:(id)a3
{
  id v5 = a3;
  v6 = [v5 structure];
  v11.receiver = self;
  v11.super_class = (Class)PTProxySettings;
  v7 = [(PTSettings *)&v11 _initWithClassStructure:v6];

  if (v7)
  {
    objc_storeStrong(v7 + 7, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    id v9 = v7[6];
    v7[6] = (id)v8;

    [v7 _createChildrenAndOutlets];
    [v7 restoreDefaultValues];
  }

  return v7;
}

- (id)module
{
  v2 = [(PTProxySettingsDefinition *)self->_definition module];
  id v3 = (void *)[v2 copy];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initWithDefinition:", self->_definition);
  [v4 applySettings:self];
  return v4;
}

- (void)restoreDefaultValues
{
  [(PTSettings *)self _sendWillRestoreDefaults];
  id v3 = [(PTProxySettingsDefinition *)self->_definition defaultValueArchive];
  [(PTSettings *)self _applyArchiveDictionary:v3];

  [(PTSettings *)self _sendDidRestoreDefaults];
}

- (void)restoreFromArchiveDictionary:(id)a3
{
  definition = self->_definition;
  id v6 = a3;
  id v5 = [(PTProxySettingsDefinition *)definition defaultValueArchive];
  [(PTSettings *)self _applyArchiveDictionary:v5];

  [(PTSettings *)self _applyArchiveDictionary:v6];
}

- (id)_createChildForKey:(id)a3
{
  definition = self->_definition;
  id v4 = a3;
  id v5 = [(PTProxySettingsDefinition *)definition childDefinitions];
  id v6 = [v5 objectForKeyedSubscript:v4];

  v7 = +[PTProxySettings settingsOrProxyWithDefinition:v6];

  return v7;
}

- (id)valueForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_values objectForKeyedSubscript:a3];
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  v7 = [(PTProxySettingsDefinition *)self->_definition structure];
  uint64_t v8 = [v7 childKeys];
  int v9 = [v8 containsObject:v6];

  v10 = [v7 outletKeys];
  int v11 = [v10 containsObject:v6];

  v12 = [v7 leafKeys];
  int v13 = [v12 containsObject:v6];

  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || v13 && (!v14 || PTObjectIsRecursivelyPlistable(v14)))
  {
    [(NSMutableDictionary *)self->_values setObject:v14 forKeyedSubscript:v6];
  }
  [(PTSettings *)self invalidateValueForKey:v6];
}

- (PTProxySettings)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (PTProxySettings)initWithDefaultValues
{
  return 0;
}

+ (id)settingsFromArchiveDictionary:(id)a3
{
  return 0;
}

- (PTProxySettingsDefinition)definition
{
  return self->_definition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_values, 0);
}

@end