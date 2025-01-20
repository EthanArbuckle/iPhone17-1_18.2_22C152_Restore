@interface POXSDefinition
- (BOOL)flattenMultiValueElementWithName:(id)a3;
- (Class)typeForName:(id)a3;
- (NSArray)types;
- (POXSDefinition)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)isSpecifiedKeyForAttributeName:(id)a3;
- (id)isSpecifiedKeyForElementName:(id)a3;
- (id)namespaceForAttributeName:(id)a3;
- (id)propertyForName:(id)a3;
- (unint64_t)maxCountForElementName:(id)a3;
- (void)setType:(Class)a3 forName:(id)a4;
@end

@implementation POXSDefinition

- (POXSDefinition)init
{
  v6.receiver = self;
  v6.super_class = (Class)POXSDefinition;
  v2 = [(POXSDefinition *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    types = v2->_types;
    v2->_types = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSMutableDictionary *)self->_types mutableCopyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (NSArray)types
{
  return (NSArray *)[(NSMutableDictionary *)self->_types allValues];
}

- (Class)typeForName:(id)a3
{
  return (Class)[(NSMutableDictionary *)self->_types objectForKeyedSubscript:a3];
}

- (id)propertyForName:(id)a3
{
  id v3 = a3;
  return v3;
}

- (unint64_t)maxCountForElementName:(id)a3
{
  return 1;
}

- (id)isSpecifiedKeyForAttributeName:(id)a3
{
  return 0;
}

- (id)isSpecifiedKeyForElementName:(id)a3
{
  return 0;
}

- (id)namespaceForAttributeName:(id)a3
{
  return 0;
}

- (BOOL)flattenMultiValueElementWithName:(id)a3
{
  return 0;
}

- (void)setType:(Class)a3 forName:(id)a4
{
}

- (void).cxx_destruct
{
}

@end