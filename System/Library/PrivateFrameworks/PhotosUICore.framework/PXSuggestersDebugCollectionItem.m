@interface PXSuggestersDebugCollectionItem
- (NSDictionary)info;
- (NSString)description;
- (NSString)name;
- (PXSuggestersDebugCollectionItem)initWithSuggesterInfo:(id)a3;
@end

@implementation PXSuggestersDebugCollectionItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSDictionary)info
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)description
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (PXSuggestersDebugCollectionItem)initWithSuggesterInfo:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXSuggestersDebugCollectionItem;
  v6 = [(PXSuggestersDebugCollectionItem *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:@"uuid"];
    name = v6->_name;
    v6->_name = (NSString *)v7;

    objc_storeStrong((id *)&v6->_info, a3);
  }

  return v6;
}

@end