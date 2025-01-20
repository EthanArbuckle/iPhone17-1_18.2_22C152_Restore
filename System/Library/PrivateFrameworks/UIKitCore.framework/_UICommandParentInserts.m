@interface _UICommandParentInserts
- (NSArray)atEndElements;
- (NSArray)atStartElements;
- (NSArray)fallbackAfterElements;
- (NSArray)fallbackBeforeElements;
- (NSDictionary)childInserts;
- (void)_addFallbackBeforeElements:(id)a3 fallbackAfterElements:(id)a4;
- (void)_setAtStartElements:(id)a3 atEndElements:(id)a4;
- (void)_setBeforeElements:(id)a3 afterElements:(id)a4 aroundElement:(id)a5;
@end

@implementation _UICommandParentInserts

- (void)_setAtStartElements:(id)a3 atEndElements:(id)a4
{
  v7 = (NSArray *)a3;
  v8 = (NSArray *)a4;
  if (self->_atStartElements)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"_UICommandInternalDiff.m" lineNumber:36 description:@"at start elements already set"];
  }
  if (self->_atEndElements)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"_UICommandInternalDiff.m" lineNumber:37 description:@"at end elements already set"];
  }
  atStartElements = self->_atStartElements;
  self->_atStartElements = v7;
  v13 = v7;

  atEndElements = self->_atEndElements;
  self->_atEndElements = v8;
}

- (void)_setBeforeElements:(id)a3 afterElements:(id)a4 aroundElement:(id)a5
{
  id v18 = a5;
  childInserts = self->_childInserts;
  id v10 = a4;
  id v11 = a3;
  v12 = [(NSMutableDictionary *)childInserts objectForKeyedSubscript:v18];

  if (v12)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"_UICommandInternalDiff.m" lineNumber:45 description:@"child insert already set"];
  }
  v13 = objc_alloc_init(_UICommandChildInserts);
  [(_UICommandChildInserts *)v13 _setBeforeElements:v11 afterElements:v10];

  v14 = self->_childInserts;
  if (v14)
  {
    [(NSMutableDictionary *)v14 setObject:v13 forKeyedSubscript:v18];
  }
  else
  {
    v15 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:v13 forKey:v18];
    v16 = self->_childInserts;
    self->_childInserts = v15;
  }
}

- (void)_addFallbackBeforeElements:(id)a3 fallbackAfterElements:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if ([v13 count])
  {
    fallbackBeforeElements = self->_fallbackBeforeElements;
    if (fallbackBeforeElements)
    {
      [(NSMutableArray *)fallbackBeforeElements addObject:v13];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA48] arrayWithObject:v13];
      v9 = self->_fallbackBeforeElements;
      self->_fallbackBeforeElements = v8;
    }
  }
  if ([v6 count])
  {
    fallbackAfterElements = self->_fallbackAfterElements;
    if (fallbackAfterElements)
    {
      [(NSMutableArray *)fallbackAfterElements addObject:v6];
    }
    else
    {
      id v11 = [MEMORY[0x1E4F1CA48] arrayWithObject:v6];
      v12 = self->_fallbackAfterElements;
      self->_fallbackAfterElements = v11;
    }
  }
}

- (NSArray)atStartElements
{
  return self->_atStartElements;
}

- (NSArray)atEndElements
{
  return self->_atEndElements;
}

- (NSDictionary)childInserts
{
  return &self->_childInserts->super;
}

- (NSArray)fallbackBeforeElements
{
  return &self->_fallbackBeforeElements->super;
}

- (NSArray)fallbackAfterElements
{
  return &self->_fallbackAfterElements->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_atEndElements, 0);
  objc_storeStrong((id *)&self->_atStartElements, 0);
  objc_storeStrong((id *)&self->_fallbackAfterElements, 0);
  objc_storeStrong((id *)&self->_fallbackBeforeElements, 0);
  objc_storeStrong((id *)&self->_childInserts, 0);
}

@end