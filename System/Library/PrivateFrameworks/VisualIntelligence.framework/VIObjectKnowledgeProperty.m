@interface VIObjectKnowledgeProperty
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (NSString)value;
- (VIObjectKnowledgeProperty)initWithName:(id)a3 value:(id)a4;
- (unint64_t)hash;
@end

@implementation VIObjectKnowledgeProperty

- (VIObjectKnowledgeProperty)initWithName:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VIObjectKnowledgeProperty;
  v8 = [(VIObjectKnowledgeProperty *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    value = v8->_value;
    v8->_value = (NSString *)v11;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VIObjectKnowledgeProperty *)a3;
  if (v4 == self)
  {
    char IsEqual = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    id v6 = v5;
    id v7 = [(VIObjectKnowledgeProperty *)v6 name];
    if (VIObjectIsEqual((unint64_t)v7, (uint64_t)self->_name))
    {
      v8 = [(VIObjectKnowledgeProperty *)v6 value];
      char IsEqual = VIObjectIsEqual((unint64_t)v8, (uint64_t)self->_value);
    }
    else
    {
      char IsEqual = 0;
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  return [(NSString *)self->_value hash] ^ v3;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end