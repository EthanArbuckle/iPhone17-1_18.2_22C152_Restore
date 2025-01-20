@interface VUIDocumentPreFetchedData
- (BOOL)isEqual:(id)a3;
- (NSDictionary)prefetchedDataDict;
- (VUIDocumentPreFetchedData)initWithDictionary:(id)a3;
- (void)setPrefetchedDataDict:(id)a3;
@end

@implementation VUIDocumentPreFetchedData

- (VUIDocumentPreFetchedData)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIDocumentPreFetchedData;
  v5 = [(VUIDocumentPreFetchedData *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    prefetchedDataDict = v5->_prefetchedDataDict;
    v5->_prefetchedDataDict = (NSDictionary *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VUIDocumentPreFetchedData *)a3;
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
      uint64_t v6 = [(VUIDocumentPreFetchedData *)self jsonData];
      v7 = [(VUIDocumentPreFetchedData *)v5 jsonData];

      char v8 = [v6 isEqualToDictionary:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (NSDictionary)prefetchedDataDict
{
  return self->_prefetchedDataDict;
}

- (void)setPrefetchedDataDict:(id)a3
{
}

- (void).cxx_destruct
{
}

@end