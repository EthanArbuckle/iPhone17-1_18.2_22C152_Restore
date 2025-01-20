@interface FCEditorialTopicEventMappingProperty
- (FCEditorialTopicEventMappingProperty)initWithDictionary:(id)a3;
- (NSString)mappingType;
@end

@implementation FCEditorialTopicEventMappingProperty

- (FCEditorialTopicEventMappingProperty)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FCEditorialTopicEventMappingProperty;
  v5 = [(FCEditorialTopicEventMappingProperty *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"mappingType"];
    if (!v6)
    {
      v8 = 0;
      goto LABEL_6;
    }
    mappingType = v5->_mappingType;
    v5->_mappingType = (NSString *)v6;
  }
  v8 = v5;
LABEL_6:

  return v8;
}

- (NSString)mappingType
{
  return self->_mappingType;
}

- (void).cxx_destruct
{
}

@end