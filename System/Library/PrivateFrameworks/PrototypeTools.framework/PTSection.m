@interface PTSection
+ (BOOL)supportsSecureCoding;
- (BOOL)_shouldEnableRow:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)allSections;
- (NSArray)enabledSections;
- (NSPredicate)appearancePredicate;
- (NSString)childSettingsKeyPath;
- (NSString)title;
- (PTComponentObserver)componentObserver;
- (PTSection)initWithCoder:(id)a3;
- (PTSection)initWithRows:(id)a3;
- (PTSettings)settings;
- (id)_remoteEditingWhitelistedComponent;
- (id)copyWithZone:(_NSZone *)a3;
- (id)footerTextGetter;
- (id)rowAtIndex:(unint64_t)a3;
- (id)unregisterBlock;
- (unint64_t)hash;
- (unint64_t)indexOfRow:(id)a3;
- (unint64_t)numberOfRows;
- (void)_recomputeEnabledSection;
- (void)_reloadEnabledRows;
- (void)_sendInserts:(id)a3 deletes:(id)a4;
- (void)_sendReload;
- (void)_updateEnabledRows;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAppearancePredicate:(id)a3;
- (void)setChildSettingsKeyPath:(id)a3;
- (void)setComponentObserver:(id)a3;
- (void)setFooterTextGetter:(id)a3;
- (void)setSettings:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUnregisterBlock:(id)a3;
- (void)settings:(id)a3 changedValueForKeyPath:(id)a4;
@end

@implementation PTSection

- (PTSection)initWithRows:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PTSection;
  v5 = [(PTSection *)&v21 init];
  if (v5)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          objc_msgSend(v11, "setSection:", v5, (void)v17);
          [v11 addObserver:v5];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v8);
    }

    uint64_t v12 = [v6 copy];
    rows = v5->_rows;
    v5->_rows = (NSArray *)v12;

    v5->_enabledSection = 1;
    uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
    enabledRows = v5->_enabledRows;
    v5->_enabledRows = (NSMutableArray *)v14;

    [(PTSection *)v5 _reloadEnabledRows];
  }

  return v5;
}

- (void)dealloc
{
  [(PTSettings *)self->_settings removeKeyPathObserver:self];
  unregisterBlock = (void (**)(id, PTSection *))self->_unregisterBlock;
  if (unregisterBlock) {
    unregisterBlock[2](unregisterBlock, self);
  }
  v4.receiver = self;
  v4.super_class = (Class)PTSection;
  [(PTSection *)&v4 dealloc];
}

- (void)setSettings:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self->_settings)
  {
    id v6 = PTLogObjectForTopic(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BEC4F000, v6, OS_LOG_TYPE_DEFAULT, "Ignoring attempt to set settings on a PTSection that already has settings", buf, 2u);
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_settings, a3);
    [(PTSettings *)self->_settings addKeyPathObserver:self];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_rows;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "setSettings:", self->_settings, (void)v12);
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v9);
    }

    [(PTSection *)self _reloadEnabledRows];
    [(PTSection *)self _recomputeEnabledSection];
  }
}

- (unint64_t)numberOfRows
{
  return [(NSMutableArray *)self->_enabledRows count];
}

- (id)rowAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_enabledRows objectAtIndex:a3];
}

- (unint64_t)indexOfRow:(id)a3
{
  return [(NSMutableArray *)self->_enabledRows indexOfObject:a3];
}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
  [(PTSection *)self _updateEnabledRows];

  [(PTSection *)self _recomputeEnabledSection];
}

- (NSArray)allSections
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return (NSArray *)v2;
}

- (NSArray)enabledSections
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (self->_enabledSection)
  {
    v4[0] = self;
    v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  }
  else
  {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v2;
}

- (id)_remoteEditingWhitelistedComponent
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  objc_super v4 = self->_rows;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = objc_opt_class();
        if (PTRowClassIsWhitelistedForRemoteEditing(v10)
          && objc_msgSend(v9, "isEncodable", (void)v16))
        {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  v11 = [[PTSection alloc] initWithRows:v3];
  long long v12 = [(PTSection *)self title];
  [(PTSection *)v11 setTitle:v12];

  long long v13 = [(PTSection *)self appearancePredicate];
  [(PTSection *)v11 setAppearancePredicate:v13];

  long long v14 = [(PTSection *)self childSettingsKeyPath];
  [(PTSection *)v11 setChildSettingsKeyPath:v14];

  return v11;
}

- (void)_recomputeEnabledSection
{
  appearancePredicate = self->_appearancePredicate;
  if (appearancePredicate) {
    int v4 = [(NSPredicate *)appearancePredicate evaluateWithObject:self->_settings];
  }
  else {
    int v4 = 1;
  }
  if (self->_enabledSection != v4)
  {
    self->_enabledSection = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_componentObserver);
    [WeakRetained enabledSectionsDidChange:self];
  }
}

- (void)_updateEnabledRows
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v14 = [MEMORY[0x1E4F28E60] indexSet];
  long long v13 = [MEMORY[0x1E4F28E60] indexSet];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v3 = self->_rows;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        BOOL v11 = -[PTSection _shouldEnableRow:](self, "_shouldEnableRow:", v10, v13);
        unsigned int v12 = [(NSMutableArray *)self->_enabledRows containsObject:v10];
        if (v12 && !v11)
        {
          [v13 addIndex:v7];
          [(NSMutableArray *)self->_enabledRows removeObject:v10];
        }
        if (((v12 | !v11) & 1) == 0)
        {
          [v14 addIndex:v6];
          [(NSMutableArray *)self->_enabledRows insertObject:v10 atIndex:v6];
        }
        v7 += v12;
        v6 += v11;
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  [(PTSection *)self _sendInserts:v14 deletes:v13];
}

- (void)_reloadEnabledRows
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(NSMutableArray *)self->_enabledRows removeAllObjects];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = self->_rows;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        if (-[PTSection _shouldEnableRow:](self, "_shouldEnableRow:", v8, (void)v9)) {
          [(NSMutableArray *)self->_enabledRows addObject:v8];
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(PTSection *)self _sendReload];
}

- (BOOL)_shouldEnableRow:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 condition];

  if (v5)
  {
    uint64_t v6 = [v4 condition];
    char v7 = [v6 evaluateWithObject:self->_settings];
  }
  else
  {
    uint64_t v8 = [v4 externalCondition];

    if (!v8)
    {
      BOOL v9 = 1;
      goto LABEL_6;
    }
    uint64_t v6 = [v4 externalCondition];
    char v7 = v6[2]();
  }
  BOOL v9 = v7;

LABEL_6:
  return v9;
}

- (void)_sendInserts:(id)a3 deletes:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([v8 count] || objc_msgSend(v6, "count"))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_componentObserver);
    [WeakRetained section:self didInsertRows:v8 deleteRows:v6];
  }
}

- (void)_sendReload
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_componentObserver);
  [WeakRetained sectionDidReload:self];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PTSection *)a3;
  if (self == v4)
  {
    char v5 = 1;
  }
  else if ([(PTSection *)v4 isMemberOfClass:objc_opt_class()] {
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
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_rows];
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
  [v4 encodeObject:self->_rows forKey:@"rows"];
  [v4 encodeObject:self->_title forKey:@"title"];
  [v4 encodeObject:self->_childSettingsKeyPath forKey:@"childKeyPath"];
  if (os_variant_allows_internal_security_policies()) {
    [v4 encodeObject:self->_appearancePredicate forKey:@"predicate"];
  }
}

- (PTSection)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  unint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"rows"];
  BOOL v9 = [(PTSection *)self initWithRows:v8];
  if (v9)
  {
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v9->_title;
    v9->_title = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"childKeyPath"];
    childSettingsKeyPath = v9->_childSettingsKeyPath;
    v9->_childSettingsKeyPath = (NSString *)v12;

    if (os_variant_allows_internal_security_policies())
    {
      uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predicate"];
      appearancePredicate = v9->_appearancePredicate;
      v9->_appearancePredicate = (NSPredicate *)v14;

      int v16 = PTValidatePredicate(v9->_appearancePredicate);
      long long v17 = v9->_appearancePredicate;
      if (v16)
      {
        [(NSPredicate *)v17 allowEvaluation];
      }
      else
      {
        v9->_appearancePredicate = 0;
      }
    }
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "allocWithZone:"), "initWithArray:copyItems:", self->_rows, 1);
  uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithRows:", v5);
  [v6 setTitle:self->_title];
  [v6 setChildSettingsKeyPath:self->_childSettingsKeyPath];
  [v6 setAppearancePredicate:self->_appearancePredicate];

  return v6;
}

- (PTSettings)settings
{
  return self->_settings;
}

- (PTComponentObserver)componentObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_componentObserver);

  return (PTComponentObserver *)WeakRetained;
}

- (void)setComponentObserver:(id)a3
{
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

- (id)footerTextGetter
{
  return self->_footerTextGetter;
}

- (void)setFooterTextGetter:(id)a3
{
}

- (id)unregisterBlock
{
  return self->_unregisterBlock;
}

- (void)setUnregisterBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unregisterBlock, 0);
  objc_storeStrong(&self->_footerTextGetter, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_childSettingsKeyPath, 0);
  objc_storeStrong((id *)&self->_appearancePredicate, 0);
  objc_destroyWeak((id *)&self->_componentObserver);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_enabledRows, 0);

  objc_storeStrong((id *)&self->_rows, 0);
}

@end