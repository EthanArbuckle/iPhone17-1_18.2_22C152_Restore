@interface PSAppSuggestionsMetricsItem
- (BOOL)isEqual:(id)a3;
- (PSAppSuggestionsMetricsItem)initWithTransportBundleId:(id)a3 model:(id)a4 rank:(unsigned __int8)a5;
- (_PSAppSuggestionsMetricsItem)underlyingObject;
- (unint64_t)hash;
@end

@implementation PSAppSuggestionsMetricsItem

- (PSAppSuggestionsMetricsItem)initWithTransportBundleId:(id)a3 model:(id)a4 rank:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PSAppSuggestionsMetricsItem;
  id v7 = a4;
  id v8 = a3;
  v9 = [(PSAppSuggestionsMetricsItem *)&v14 init];
  v10 = [_PSAppSuggestionsMetricsItem alloc];
  uint64_t v11 = -[_PSAppSuggestionsMetricsItem initWithTransportBundleId:model:rank:](v10, "initWithTransportBundleId:model:rank:", v8, v7, v5, v14.receiver, v14.super_class);

  underlyingObject = v9->_underlyingObject;
  v9->_underlyingObject = (_PSAppSuggestionsMetricsItem *)v11;

  return v9;
}

- (unint64_t)hash
{
  v3 = [(PSAppSuggestionsMetricsItem *)self underlyingObject];
  v4 = [v3 transportBundleId];
  uint64_t v5 = [v4 hash];

  v6 = [(PSAppSuggestionsMetricsItem *)self underlyingObject];
  id v7 = [v6 model];
  unint64_t v8 = [v7 hash] - v5 + 32 * v5 + 961;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PSAppSuggestionsMetricsItem *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    id v7 = [(PSAppSuggestionsMetricsItem *)self underlyingObject];
    unint64_t v8 = [(PSAppSuggestionsMetricsItem *)v6 underlyingObject];

    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (_PSAppSuggestionsMetricsItem)underlyingObject
{
  return (_PSAppSuggestionsMetricsItem *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end