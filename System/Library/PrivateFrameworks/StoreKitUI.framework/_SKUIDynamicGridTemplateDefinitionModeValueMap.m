@interface _SKUIDynamicGridTemplateDefinitionModeValueMap
- (id)templateDefinitionViewElementsForMode:(id)a3;
- (void)addTemplateDefinitionViewElement:(id)a3 forMode:(id)a4;
@end

@implementation _SKUIDynamicGridTemplateDefinitionModeValueMap

- (void)addTemplateDefinitionViewElement:(id)a3 forMode:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if (v14)
  {
    if ([v6 length])
    {
      modeToTemplateDefinitionViewElements = self->_modeToTemplateDefinitionViewElements;
      if (!modeToTemplateDefinitionViewElements)
      {
        v8 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
        v9 = self->_modeToTemplateDefinitionViewElements;
        self->_modeToTemplateDefinitionViewElements = v8;

        modeToTemplateDefinitionViewElements = self->_modeToTemplateDefinitionViewElements;
      }
      v10 = [(NSMutableDictionary *)modeToTemplateDefinitionViewElements objectForKey:v6];
      if (!v10)
      {
        v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
        [(NSMutableDictionary *)self->_modeToTemplateDefinitionViewElements setObject:v10 forKey:v6];
      }
      [v10 addObject:v14];
    }
    else
    {
      defaultTemplateDefinitionViewElements = self->_defaultTemplateDefinitionViewElements;
      if (!defaultTemplateDefinitionViewElements)
      {
        v12 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
        v13 = self->_defaultTemplateDefinitionViewElements;
        self->_defaultTemplateDefinitionViewElements = v12;

        defaultTemplateDefinitionViewElements = self->_defaultTemplateDefinitionViewElements;
      }
      [(NSMutableArray *)defaultTemplateDefinitionViewElements addObject:v14];
    }
  }
}

- (id)templateDefinitionViewElementsForMode:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [(NSMutableDictionary *)self->_modeToTemplateDefinitionViewElements objectForKey:v4];
  }
  else
  {
    v5 = 0;
  }
  if (![v5 count])
  {
    id v6 = self->_defaultTemplateDefinitionViewElements;

    v5 = v6;
  }
  if (![v4 length] && !objc_msgSend(v5, "count"))
  {
    v7 = [(NSMutableDictionary *)self->_modeToTemplateDefinitionViewElements allValues];
    uint64_t v8 = [v7 firstObject];

    v5 = (void *)v8;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeToTemplateDefinitionViewElements, 0);

  objc_storeStrong((id *)&self->_defaultTemplateDefinitionViewElements, 0);
}

@end