@interface PTProxySettingsDefinition
+ (BOOL)supportsSecureCoding;
+ (id)definitionForSettingsClass:(Class)a3;
- (BOOL)allSettingsClassesExistAndHaveCorrectVersion;
- (BOOL)isEqual:(id)a3;
- (Class)settingsClass;
- (NSDictionary)childDefinitions;
- (NSDictionary)defaultValueArchive;
- (PTModule)module;
- (PTProxySettingsDefinition)initWithCoder:(id)a3;
- (PTSettingsClassStructure)structure;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setChildDefinitions:(id)a3;
- (void)setDefaultValueArchive:(id)a3;
- (void)setModule:(id)a3;
- (void)setStructure:(id)a3;
@end

@implementation PTProxySettingsDefinition

+ (id)definitionForSettingsClass:(Class)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v4 = +[PTSettingsClassStructure structureForSettingsClass:]((uint64_t)PTSettingsClassStructure, a3);
  v5 = [v4 filteredForProxySettings];

  v6 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v7 = objc_msgSend(v5, "childKeys", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v13 = +[PTProxySettingsDefinition definitionForSettingsClass:](PTProxySettingsDefinition, "definitionForSettingsClass:", [v5 childClassForKey:v12]);
        [v6 setObject:v13 forKeyedSubscript:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  v14 = (void *)[[a3 alloc] initWithDefaultValues];
  v15 = [v14 archiveDictionary];
  v16 = [(objc_class *)a3 settingsControllerModule];
  v17 = [v16 _remoteEditingWhitelistedModule];

  v18 = objc_alloc_init(PTProxySettingsDefinition);
  [(PTProxySettingsDefinition *)v18 setStructure:v5];
  [(PTProxySettingsDefinition *)v18 setChildDefinitions:v6];
  [(PTProxySettingsDefinition *)v18 setDefaultValueArchive:v15];
  [(PTProxySettingsDefinition *)v18 setModule:v17];

  return v18;
}

- (Class)settingsClass
{
  v2 = [(PTSettingsClassStructure *)self->_structure settingsClassName];
  Class v3 = NSClassFromString(v2);

  if ([(objc_class *)v3 isSubclassOfClass:objc_opt_class()]) {
    Class v4 = v3;
  }
  else {
    Class v4 = 0;
  }
  return v4;
}

- (BOOL)allSettingsClassesExistAndHaveCorrectVersion
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  Class v3 = [(PTProxySettingsDefinition *)self settingsClass];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = [(objc_class *)v3 settingsVersionNumber];
  if (v4 != [(PTSettingsClassStructure *)self->_structure settingsClassVersion]) {
    return 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(NSDictionary *)self->_childDefinitions allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (![*(id *)(*((void *)&v12 + 1) + 8 * i) allSettingsClassesExistAndHaveCorrectVersion])
        {
          BOOL v10 = 0;
          goto LABEL_14;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_14:

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PTProxySettingsDefinition *)a3;
  if (self == v4)
  {
    char v5 = 1;
  }
  else if ([(PTProxySettingsDefinition *)v4 isMemberOfClass:objc_opt_class()] {
         && BSEqualObjects()
  }
         && BSEqualObjects()
         && BSEqualObjects())
  {
    char v5 = BSEqualObjects();
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  Class v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_structure];
  id v5 = (id)[v3 appendObject:self->_childDefinitions];
  id v6 = (id)[v3 appendObject:self->_defaultValueArchive];
  id v7 = (id)[v3 appendObject:self->_module];
  unint64_t v8 = [v3 hash];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  structure = self->_structure;
  id v5 = a3;
  [v5 encodeObject:structure forKey:@"structure"];
  [v5 encodeObject:self->_childDefinitions forKey:@"childDefinitions"];
  [v5 encodeObject:self->_defaultValueArchive forKey:@"defaultValueArchive"];
  [v5 encodeObject:self->_module forKey:@"module"];
}

- (PTProxySettingsDefinition)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PTProxySettingsDefinition *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"structure"];
    structure = v5->_structure;
    v5->_structure = (PTSettingsClassStructure *)v6;

    unint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    long long v12 = [v4 decodeObjectOfClasses:v11 forKey:@"childDefinitions"];
    objc_opt_class();
    objc_opt_class();
    if ((PTValidateDictionary(v12) & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498], @"%@ expected String->%@ dictionary for '%@', got %@", @"PTProxySettingsDescription", @"PTProxySettingsDescription", @"childDefinitions", v12 format];
    }
    childDefinitions = v5->_childDefinitions;
    v5->_childDefinitions = v12;
    long long v14 = v12;

    long long v15 = PTPlistableClasses();
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"defaultValueArchive"];
    defaultValueArchive = v5->_defaultValueArchive;
    v5->_defaultValueArchive = (NSDictionary *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"module"];
    module = v5->_module;
    v5->_module = (PTModule *)v18;
  }
  return v5;
}

- (PTSettingsClassStructure)structure
{
  return self->_structure;
}

- (void)setStructure:(id)a3
{
}

- (NSDictionary)childDefinitions
{
  return self->_childDefinitions;
}

- (void)setChildDefinitions:(id)a3
{
}

- (NSDictionary)defaultValueArchive
{
  return self->_defaultValueArchive;
}

- (void)setDefaultValueArchive:(id)a3
{
}

- (PTModule)module
{
  return self->_module;
}

- (void)setModule:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_module, 0);
  objc_storeStrong((id *)&self->_defaultValueArchive, 0);
  objc_storeStrong((id *)&self->_childDefinitions, 0);
  objc_storeStrong((id *)&self->_structure, 0);
}

@end