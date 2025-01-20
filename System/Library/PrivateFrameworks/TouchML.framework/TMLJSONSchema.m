@interface TMLJSONSchema
- (TMLJSONSchema)init;
- (TMLJSONSchema)initWithJSON:(id)a3;
- (TMLJSONSchema)initWithString:(id)a3;
- (id)propertyForKeyPath:(id)a3;
@end

@implementation TMLJSONSchema

- (TMLJSONSchema)init
{
  return (TMLJSONSchema *)((uint64_t (*)(TMLJSONSchema *, char *))MEMORY[0x270F9A6D0])(self, sel_initWithJSON_);
}

- (TMLJSONSchema)initWithJSON:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TMLJSONSchema;
  v6 = [(TMLJSONSchema *)&v11 init];
  if (v6)
  {
    uint64_t v8 = objc_msgSend_copy(v4, v5, v7);
    schema = v6->_schema;
    v6->_schema = (NSDictionary *)v8;
  }
  return v6;
}

- (TMLJSONSchema)initWithString:(id)a3
{
  return 0;
}

- (id)propertyForKeyPath:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
}

@end