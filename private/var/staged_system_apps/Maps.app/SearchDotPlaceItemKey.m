@interface SearchDotPlaceItemKey
- (BOOL)isEqual:(id)a3;
- (GEOMapItemIdentifier)identifier;
- (SearchDotPlaceItemKey)initWithSearchDotPlace:(id)a3;
- (unint64_t)hash;
- (void)setIdentifier:(id)a3;
@end

@implementation SearchDotPlaceItemKey

- (SearchDotPlaceItemKey)initWithSearchDotPlace:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchDotPlaceItemKey;
  v5 = [(SearchDotPlaceItemKey *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 identifier];
    identifier = v5->_identifier;
    v5->_identifier = (GEOMapItemIdentifier *)v6;
  }
  return v5;
}

- (unint64_t)hash
{
  v2 = [(SearchDotPlaceItemKey *)self identifier];
  id v3 = [v2 muid];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SearchDotPlaceItemKey *)a3;
  if (v4 == self)
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(SearchDotPlaceItemKey *)self identifier];
      v7 = [(SearchDotPlaceItemKey *)v5 identifier];

      unsigned __int8 v8 = [v6 isEqualToGEOMapItemIdentifier:v7];
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

- (GEOMapItemIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end