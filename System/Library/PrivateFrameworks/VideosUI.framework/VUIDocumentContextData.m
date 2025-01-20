@interface VUIDocumentContextData
- (BOOL)isEqual:(id)a3;
- (NSDictionary)contextDataDict;
- (VUIDocumentContextData)initWithDictionary:(id)a3;
- (void)setContextDataDict:(id)a3;
@end

@implementation VUIDocumentContextData

- (NSDictionary)contextDataDict
{
  return self->_contextDataDict;
}

- (void).cxx_destruct
{
}

- (VUIDocumentContextData)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIDocumentContextData;
  v5 = [(VUIDocumentContextData *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    contextDataDict = v5->_contextDataDict;
    v5->_contextDataDict = (NSDictionary *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VUIDocumentContextData *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(VUIDocumentContextData *)self jsonData];
      v7 = [(VUIDocumentContextData *)v5 jsonData];

      char v8 = [v6 isEqualToDictionary:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (void)setContextDataDict:(id)a3
{
}

@end