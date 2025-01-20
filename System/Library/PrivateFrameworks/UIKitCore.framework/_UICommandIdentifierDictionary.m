@interface _UICommandIdentifierDictionary
- (BOOL)intersectsEntriesFromDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (_UICommandIdentifierDictionary)init;
- (_UICommandIdentifierDictionary)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)intersectingIdentifiersFromDictionary:(id)a3;
- (id)objectForAction:(SEL)a3 propertyList:(id)a4;
- (unint64_t)hash;
- (void)addEntriesFromDictionary:(id)a3;
- (void)removeEntriesFromDictionary:(id)a3;
- (void)removeObjectForAction:(SEL)a3 propertyList:(id)a4;
- (void)setObject:(id)a3 forAction:(SEL)a4 propertyList:(id)a5;
@end

@implementation _UICommandIdentifierDictionary

- (_UICommandIdentifierDictionary)init
{
  v8.receiver = self;
  v8.super_class = (Class)_UICommandIdentifierDictionary;
  v2 = [(_UICommandIdentifierDictionary *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(_UISelectorDictionary);
    actionDictionary = v2->_actionDictionary;
    v2->_actionDictionary = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    actionPropertyListDictionary = v2->_actionPropertyListDictionary;
    v2->_actionPropertyListDictionary = v5;
  }
  return v2;
}

- (id)objectForAction:(SEL)a3 propertyList:(id)a4
{
  if (a4)
  {
    actionPropertyListDictionary = self->_actionPropertyListDictionary;
    v5 = +[_UICommandIdentifier identifierWithAction:propertyList:](_UICommandIdentifier, "identifierWithAction:propertyList:", a3);
    v6 = [(NSMutableDictionary *)actionPropertyListDictionary objectForKeyedSubscript:v5];
  }
  else
  {
    v6 = [(_UISelectorDictionary *)self->_actionDictionary objectForSelector:a3];
  }
  return v6;
}

- (void)setObject:(id)a3 forAction:(SEL)a4 propertyList:(id)a5
{
  if (a5)
  {
    actionPropertyListDictionary = self->_actionPropertyListDictionary;
    id v8 = a3;
    id v10 = +[_UICommandIdentifier identifierWithAction:a4 propertyList:a5];
    -[NSMutableDictionary setObject:forKeyedSubscript:](actionPropertyListDictionary, "setObject:forKeyedSubscript:", v8);
  }
  else
  {
    actionDictionary = self->_actionDictionary;
    id v10 = a3;
    -[_UISelectorDictionary setObject:forSelector:](actionDictionary, "setObject:forSelector:");
  }
}

- (_UICommandIdentifierDictionary)initWithDictionary:(id)a3
{
  v4 = (id *)a3;
  v11.receiver = self;
  v11.super_class = (Class)_UICommandIdentifierDictionary;
  v5 = [(_UICommandIdentifierDictionary *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4[1] copy];
    actionDictionary = v5->_actionDictionary;
    v5->_actionDictionary = (_UISelectorDictionary *)v6;

    uint64_t v8 = [v4[2] mutableCopy];
    actionPropertyListDictionary = v5->_actionPropertyListDictionary;
    v5->_actionPropertyListDictionary = (NSMutableDictionary *)v8;
  }
  return v5;
}

- (void)removeObjectForAction:(SEL)a3 propertyList:(id)a4
{
  if (a4)
  {
    actionPropertyListDictionary = self->_actionPropertyListDictionary;
    +[_UICommandIdentifier identifierWithAction:propertyList:](_UICommandIdentifier, "identifierWithAction:propertyList:", a3);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [(NSMutableDictionary *)actionPropertyListDictionary removeObjectForKey:v6];
  }
  else
  {
    actionDictionary = self->_actionDictionary;
    [(_UISelectorDictionary *)actionDictionary removeObjectForSelector:a3];
  }
}

- (BOOL)intersectsEntriesFromDictionary:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = (id *)a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = self->_actionPropertyListDictionary;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(v4[2], "objectForKey:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);

        if (v10)
        {
          char v12 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  v5 = [(_UISelectorDictionary *)self->_actionDictionary allSelectors];
  objc_super v11 = [v4[1] allSelectors];
  char v12 = [(NSMutableDictionary *)v5 intersectsSet:v11];

LABEL_11:
  return v12;
}

- (id)intersectingIdentifiersFromDictionary:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA80];
  actionPropertyListDictionary = self->_actionPropertyListDictionary;
  uint64_t v6 = (id *)a3;
  uint64_t v7 = [(NSMutableDictionary *)actionPropertyListDictionary allKeys];
  uint64_t v8 = [v4 setWithArray:v7];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  id v10 = [v6[2] allKeys];
  objc_super v11 = [v9 setWithArray:v10];
  [v8 intersectSet:v11];

  char v12 = [(_UISelectorDictionary *)self->_actionDictionary allSelectors];
  id v13 = v6[1];

  long long v14 = [v13 allSelectors];
  [v12 intersectSet:v14];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72___UICommandIdentifierDictionary_intersectingIdentifiersFromDictionary___block_invoke;
  v17[3] = &unk_1E52ED160;
  id v15 = v8;
  id v18 = v15;
  [v12 enumerateSelectorsUsingBlock:v17];

  return v15;
}

- (void)removeEntriesFromDictionary:(id)a3
{
  actionPropertyListDictionary = self->_actionPropertyListDictionary;
  v5 = (void *)*((void *)a3 + 2);
  uint64_t v6 = a3;
  uint64_t v7 = [v5 allKeys];
  [(NSMutableDictionary *)actionPropertyListDictionary removeObjectsForKeys:v7];

  actionDictionary = self->_actionDictionary;
  v9 = (void *)v6[1];

  id v10 = [v9 allSelectors];
  [(_UISelectorDictionary *)actionDictionary removeObjectsForSelectors:v10];
}

- (void)addEntriesFromDictionary:(id)a3
{
  actionPropertyListDictionary = self->_actionPropertyListDictionary;
  uint64_t v5 = *((void *)a3 + 2);
  uint64_t v6 = a3;
  [(NSMutableDictionary *)actionPropertyListDictionary addEntriesFromDictionary:v5];
  actionDictionary = self->_actionDictionary;
  uint64_t v8 = v6[1];

  [(_UISelectorDictionary *)actionDictionary addEntriesFromDictionary:v8];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [_UICommandIdentifierDictionary alloc];
  return [(_UICommandIdentifierDictionary *)v4 initWithDictionary:self];
}

- (unint64_t)hash
{
  unint64_t v3 = [(_UISelectorDictionary *)self->_actionDictionary hash];
  return [(NSMutableDictionary *)self->_actionPropertyListDictionary hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [(_UISelectorDictionary *)self->_actionDictionary isEqual:v4[1]])
  {
    char v5 = [(NSMutableDictionary *)self->_actionPropertyListDictionary isEqualToDictionary:v4[2]];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionPropertyListDictionary, 0);
  objc_storeStrong((id *)&self->_actionDictionary, 0);
}

@end