@interface PTModule
+ (BOOL)supportsSecureCoding;
+ (PTModule)moduleWithSettings:(id)a3;
+ (PTModule)moduleWithTitle:(id)a3 contents:(id)a4;
+ (id)sectionWithRows:(id)a3;
+ (id)sectionWithRows:(id)a3 title:(id)a4;
+ (id)sectionWithRows:(id)a3 title:(id)a4 condition:(id)a5;
+ (id)sectionWithRows:(id)a3 title:(id)a4 conditionFormat:(id)a5;
+ (id)submoduleWithModule:(id)a3;
+ (id)submoduleWithModule:(id)a3 childSettingsKeyPath:(id)a4;
+ (id)submoduleWithModule:(id)a3 childSettingsKeyPath:(id)a4 condition:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSArray)allSections;
- (NSArray)enabledSections;
- (NSPredicate)appearancePredicate;
- (NSString)childSettingsKeyPath;
- (NSString)title;
- (PTComponentObserver)componentObserver;
- (PTModule)initWithCoder:(id)a3;
- (PTModule)initWithContents:(id)a3;
- (PTSettings)settings;
- (id)_computeEnabledSections;
- (id)_remoteEditingWhitelistedModule;
- (id)_settingsForComponent:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)indexPathForRow:(id)a3;
- (id)rowAtIndexPath:(id)a3;
- (id)sectionAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)numberOfSections;
- (void)_reportSectionInsertsAndDeletesRelativeTo:(id)a3;
- (void)_updateEnabledSections;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)removeObserver:(id)a3;
- (void)section:(id)a3 didInsertRows:(id)a4 deleteRows:(id)a5;
- (void)sectionDidReload:(id)a3;
- (void)setAppearancePredicate:(id)a3;
- (void)setChildSettingsKeyPath:(id)a3;
- (void)setComponentObserver:(id)a3;
- (void)setSettings:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PTModule

+ (PTModule)moduleWithTitle:(id)a3 contents:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[PTModule alloc] initWithContents:v5];

  [(PTModule *)v7 setTitle:v6];
  return v7;
}

+ (id)sectionWithRows:(id)a3
{
  return (id)[a1 sectionWithRows:a3 title:0];
}

+ (id)sectionWithRows:(id)a3 title:(id)a4
{
  return (id)[a1 sectionWithRows:a3 title:a4 conditionFormat:0];
}

+ (id)sectionWithRows:(id)a3 title:(id)a4 conditionFormat:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5)
  {
    a5 = [MEMORY[0x1E4F28F60] predicateWithFormat:a5 arguments:&v13];
  }
  v10 = [a1 sectionWithRows:v8 title:v9 condition:a5];

  return v10;
}

+ (id)sectionWithRows:(id)a3 title:(id)a4 condition:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[PTSection alloc] initWithRows:v9];

  [(PTSection *)v10 setTitle:v8];
  [(PTSection *)v10 setAppearancePredicate:v7];

  return v10;
}

+ (id)submoduleWithModule:(id)a3
{
  return (id)[a1 submoduleWithModule:a3 childSettingsKeyPath:0];
}

+ (id)submoduleWithModule:(id)a3 childSettingsKeyPath:(id)a4
{
  return (id)[a1 submoduleWithModule:a3 childSettingsKeyPath:a4 condition:0];
}

+ (id)submoduleWithModule:(id)a3 childSettingsKeyPath:(id)a4 condition:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  [v7 setChildSettingsKeyPath:a4];
  [v7 setAppearancePredicate:v8];

  return v7;
}

+ (PTModule)moduleWithSettings:(id)a3
{
  id v3 = a3;
  v4 = [v3 module];
  [v4 setSettings:v3];

  return (PTModule *)v4;
}

- (PTModule)initWithContents:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PTModule;
  id v5 = [(PTModule *)&v26 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v6;

    id v8 = [MEMORY[0x1E4F1CA48] array];
    id v9 = [MEMORY[0x1E4F1CA48] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = v4;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (objc_msgSend(v15, "conformsToProtocol:", &unk_1F19D3E10, (void)v22))
          {
            [v15 setComponentObserver:v5];
            [v8 addObject:v15];
            v16 = [v15 allSections];
            [v9 addObjectsFromArray:v16];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v12);
    }

    uint64_t v17 = [v8 copy];
    components = v5->_components;
    v5->_components = (NSArray *)v17;

    uint64_t v19 = [v9 copy];
    allSections = v5->_allSections;
    v5->_allSections = (NSArray *)v19;

    objc_storeStrong((id *)&v5->_enabledSections, v5->_allSections);
  }

  return v5;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_components;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) setComponentObserver:0];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(PTSettings *)self->_settings removeKeyPathObserver:self];
  v8.receiver = self;
  v8.super_class = (Class)PTModule;
  [(PTModule *)&v8 dealloc];
}

- (void)setSettings:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self->_settings)
  {
    uint64_t v6 = PTLogObjectForTopic(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BEC4F000, v6, OS_LOG_TYPE_DEFAULT, "Ignoring attempt to set settings on a module that already has settings", buf, 2u);
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_settings, a3);
    [(PTSettings *)self->_settings addKeyPathObserver:self];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = self->_components;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v13 = objc_msgSend(v12, "settings", (void)v15);

          if (!v13)
          {
            uint64_t v14 = [(PTModule *)self _settingsForComponent:v12];
            [v12 setSettings:v14];
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v9);
    }

    [(PTModule *)self _updateEnabledSections];
  }
}

- (unint64_t)numberOfSections
{
  return [(NSArray *)self->_enabledSections count];
}

- (id)sectionAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_enabledSections objectAtIndex:a3];
}

- (id)rowAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = -[PTModule sectionAtIndex:](self, "sectionAtIndex:", objc_msgSend(v4, "pt_section"));
  uint64_t v6 = objc_msgSend(v4, "pt_row");

  uint64_t v7 = [v5 rowAtIndex:v6];

  return v7;
}

- (id)indexPathForRow:(id)a3
{
  id v4 = a3;
  id v5 = [v4 section];
  NSUInteger v6 = [(NSArray *)self->_enabledSections indexOfObject:v5];
  uint64_t v7 = [v5 indexOfRow:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL || v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28D58], "pt_indexPathForRow:inSection:", v7, v6);
  }

  return v9;
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)section:(id)a3 didInsertRows:(id)a4 deleteRows:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_componentObserver);
  [WeakRetained section:v8 didInsertRows:v9 deleteRows:v10];

  if ([(NSHashTable *)self->_observers count])
  {
    NSUInteger v12 = [(NSArray *)self->_enabledSections indexOfObject:v8];
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      NSUInteger v13 = v12;
      uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __45__PTModule_section_didInsertRows_deleteRows___block_invoke;
      v30[3] = &unk_1E63BC830;
      id v15 = v14;
      id v31 = v15;
      NSUInteger v32 = v13;
      [v9 enumerateIndexesUsingBlock:v30];
      long long v16 = [MEMORY[0x1E4F1CA48] array];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __45__PTModule_section_didInsertRows_deleteRows___block_invoke_2;
      v27[3] = &unk_1E63BC830;
      id v17 = v16;
      id v28 = v17;
      NSUInteger v29 = v13;
      [v10 enumerateIndexesUsingBlock:v27];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v18 = self->_observers;
      uint64_t v19 = [(NSHashTable *)v18 countByEnumeratingWithState:&v23 objects:v33 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v24 != v21) {
              objc_enumerationMutation(v18);
            }
            objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "module:didInsertRows:deleteRows:", self, v15, v17, (void)v23);
          }
          uint64_t v20 = [(NSHashTable *)v18 countByEnumeratingWithState:&v23 objects:v33 count:16];
        }
        while (v20);
      }
    }
  }
}

void __45__PTModule_section_didInsertRows_deleteRows___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28D58], "pt_indexPathForRow:inSection:", a2, *(void *)(a1 + 40));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

void __45__PTModule_section_didInsertRows_deleteRows___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28D58], "pt_indexPathForRow:inSection:", a2, *(void *)(a1 + 40));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

- (void)sectionDidReload:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_componentObserver);
  [WeakRetained sectionDidReload:v4];

  if ([(NSHashTable *)self->_observers count]
    && [(NSArray *)self->_enabledSections indexOfObject:v4] != 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    NSUInteger v6 = self->_observers;
    uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "moduleDidReload:", self, (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)_updateEnabledSections
{
  NSUInteger v6 = self->_enabledSections;
  id v3 = [(PTModule *)self _computeEnabledSections];
  enabledSections = self->_enabledSections;
  self->_enabledSections = v3;

  if (![(NSArray *)self->_enabledSections isEqualToArray:v6])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_componentObserver);
    [WeakRetained enabledSectionsDidChange:self];

    [(PTModule *)self _reportSectionInsertsAndDeletesRelativeTo:v6];
  }
}

- (id)_computeEnabledSections
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  appearancePredicate = self->_appearancePredicate;
  if (appearancePredicate
    && ![(NSPredicate *)appearancePredicate evaluateWithObject:self->_settings])
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = self->_components;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "enabledSections", (void)v12);
          [v4 addObjectsFromArray:v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return v4;
}

- (void)_reportSectionInsertsAndDeletesRelativeTo:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  if ([(NSHashTable *)self->_observers count])
  {
    id v4 = [MEMORY[0x1E4F28E60] indexSet];
    id v5 = [MEMORY[0x1E4F28E60] indexSet];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    obuint64_t j = self->_allSections;
    uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          BOOL v13 = [(NSArray *)self->_enabledSections containsObject:v12];
          unsigned int v14 = [v21 containsObject:v12];
          if (v14 && !v13) {
            [v5 addIndex:v9];
          }
          if (((v14 | !v13) & 1) == 0) {
            [v4 addIndex:v8];
          }
          v9 += v14;
          v8 += v13;
        }
        uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v7);
    }

    if ([v4 count] || objc_msgSend(v5, "count"))
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v15 = self->_observers;
      uint64_t v16 = [(NSHashTable *)v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v23;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v23 != v18) {
              objc_enumerationMutation(v15);
            }
            [*(id *)(*((void *)&v22 + 1) + 8 * j) module:self didInsertSections:v4 deleteSections:v5];
          }
          uint64_t v17 = [(NSHashTable *)v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
        }
        while (v17);
      }
    }
  }
}

- (id)_settingsForComponent:(id)a3
{
  id v4 = [a3 childSettingsKeyPath];
  settings = self->_settings;
  if (v4)
  {
    uint64_t v6 = [(PTSettings *)settings valueForKeyPath:v4];
  }
  else
  {
    uint64_t v6 = settings;
  }
  uint64_t v7 = v6;

  return v7;
}

- (id)_remoteEditingWhitelistedModule
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = self->_components;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "_remoteEditingWhitelistedComponent", (void)v15);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [(PTModule *)self title];
  long long v11 = +[PTModule moduleWithTitle:v10 contents:v3];

  uint64_t v12 = [(PTModule *)self appearancePredicate];
  [v11 setAppearancePredicate:v12];

  BOOL v13 = [(PTModule *)self childSettingsKeyPath];
  [v11 setChildSettingsKeyPath:v13];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PTModule *)a3;
  if (self == v4)
  {
    char v5 = 1;
  }
  else if ([(PTModule *)v4 isMemberOfClass:objc_opt_class()] {
         && BSEqualObjects()
  }
         && BSEqualStrings()
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
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_components];
  id v5 = (id)[v3 appendString:self->_title];
  id v6 = (id)[v3 appendObject:self->_appearancePredicate];
  id v7 = (id)[v3 appendString:self->_childSettingsKeyPath];
  unint64_t v8 = [v3 hash];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_components forKey:@"components"];
  [v4 encodeObject:self->_title forKey:@"title"];
  [v4 encodeObject:self->_childSettingsKeyPath forKey:@"childKeyPath"];
  if (os_variant_allows_internal_security_policies()) {
    [v4 encodeObject:self->_appearancePredicate forKey:@"predicate"];
  }
}

- (PTModule)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  unint64_t v8 = objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"components"];
  uint64_t v10 = [(PTModule *)self initWithContents:v9];
  if (v10)
  {
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v10->_title;
    v10->_title = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"childKeyPath"];
    childSettingsKeyPath = v10->_childSettingsKeyPath;
    v10->_childSettingsKeyPath = (NSString *)v13;

    if (os_variant_allows_internal_security_policies())
    {
      uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predicate"];
      appearancePredicate = v10->_appearancePredicate;
      v10->_appearancePredicate = (NSPredicate *)v15;

      int v17 = PTValidatePredicate(v10->_appearancePredicate);
      long long v18 = v10->_appearancePredicate;
      if (v17)
      {
        [(NSPredicate *)v18 allowEvaluation];
      }
      else
      {
        v10->_appearancePredicate = 0;
      }
    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_components copyItems:1];
  id v5 = [(PTModule *)self title];
  uint64_t v6 = +[PTModule moduleWithTitle:v5 contents:v4];

  uint64_t v7 = [(PTModule *)self childSettingsKeyPath];
  [v6 setChildSettingsKeyPath:v7];

  unint64_t v8 = [(PTModule *)self appearancePredicate];
  [v6 setAppearancePredicate:v8];

  return v6;
}

- (PTComponentObserver)componentObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_componentObserver);
  return (PTComponentObserver *)WeakRetained;
}

- (void)setComponentObserver:(id)a3
{
}

- (PTSettings)settings
{
  return self->_settings;
}

- (NSArray)allSections
{
  return self->_allSections;
}

- (NSArray)enabledSections
{
  return self->_enabledSections;
}

- (NSPredicate)appearancePredicate
{
  return self->_appearancePredicate;
}

- (void)setAppearancePredicate:(id)a3
{
}

- (NSString)childSettingsKeyPath
{
  return self->_childSettingsKeyPath;
}

- (void)setChildSettingsKeyPath:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_childSettingsKeyPath, 0);
  objc_storeStrong((id *)&self->_appearancePredicate, 0);
  objc_storeStrong((id *)&self->_enabledSections, 0);
  objc_storeStrong((id *)&self->_allSections, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_destroyWeak((id *)&self->_componentObserver);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end