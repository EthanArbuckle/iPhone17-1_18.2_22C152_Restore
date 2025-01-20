@interface PSPeopleSuggestionsMetricsItem
- (BOOL)isEqual:(id)a3;
- (PSPeopleSuggestionsMetricsItem)initWithId:(id)a3 model:(id)a4 transportBundleId:(id)a5 rank:(unsigned __int8)a6 score:(double)a7;
- (PSPeopleSuggestionsMetricsItem)initWithId:(id)a3 modelIdentifier:(id)a4 transportBundleId:(id)a5 rank:(unsigned __int8)a6 score:(double)a7;
- (_PSPeopleSuggestionsMetricsItemInternal)underlyingObject;
- (unint64_t)hash;
@end

@implementation PSPeopleSuggestionsMetricsItem

- (PSPeopleSuggestionsMetricsItem)initWithId:(id)a3 model:(id)a4 transportBundleId:(id)a5 rank:(unsigned __int8)a6 score:(double)a7
{
  uint64_t v8 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = [[_PSPeopleSuggestionsMetricsModel alloc] initWithModelIdentifier:v13 trialIdentifier:0];

  v16 = [(PSPeopleSuggestionsMetricsItem *)self initWithId:v14 modelIdentifier:v15 transportBundleId:v12 rank:v8 score:a7];
  return v16;
}

- (PSPeopleSuggestionsMetricsItem)initWithId:(id)a3 modelIdentifier:(id)a4 transportBundleId:(id)a5 rank:(unsigned __int8)a6 score:(double)a7
{
  uint64_t v8 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PSPeopleSuggestionsMetricsItem;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(PSPeopleSuggestionsMetricsItem *)&v20 init];
  v15 = [_PSPeopleSuggestionsMetricsItemInternal alloc];
  v16 = objc_msgSend(v12, "underlyingObject", v20.receiver, v20.super_class);

  uint64_t v17 = [(_PSPeopleSuggestionsMetricsItemInternal *)v15 initWithId:v13 model:v16 transportBundleId:v11 rank:v8 score:a7];
  underlyingObject = v14->_underlyingObject;
  v14->_underlyingObject = (_PSPeopleSuggestionsMetricsItemInternal *)v17;

  return v14;
}

- (unint64_t)hash
{
  v3 = [(PSPeopleSuggestionsMetricsItem *)self underlyingObject];
  v4 = [v3 id];
  uint64_t v5 = [v4 hash];

  v6 = [(PSPeopleSuggestionsMetricsItem *)self underlyingObject];
  v7 = [v6 model];
  unint64_t v8 = [v7 hash] - v5 + 32 * v5 + 961;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PSPeopleSuggestionsMetricsItem *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = [(PSPeopleSuggestionsMetricsItem *)self underlyingObject];
    unint64_t v8 = [(PSPeopleSuggestionsMetricsItem *)v6 underlyingObject];

    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (_PSPeopleSuggestionsMetricsItemInternal)underlyingObject
{
  return (_PSPeopleSuggestionsMetricsItemInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end