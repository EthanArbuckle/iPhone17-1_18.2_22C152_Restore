@interface NUPagingBlueprintItem
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (NUPage)page;
- (NUPagingBlueprintItem)initWithPage:(id)a3;
- (NUPagingBlueprintItem)initWithPageID:(id)a3;
- (unint64_t)hash;
@end

@implementation NUPagingBlueprintItem

- (NUPagingBlueprintItem)initWithPage:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NUPagingBlueprintItem;
  v6 = [(NUPagingBlueprintItem *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_page, a3);
    v8 = [v5 identifier];
    uint64_t v9 = [v8 copy];
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v9;
  }
  return v7;
}

- (NUPagingBlueprintItem)initWithPageID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUPagingBlueprintItem;
  id v5 = [(NUPagingBlueprintItem *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NUPagingBlueprintItem *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(NUPagingBlueprintItem *)v4 identifier];
      uint64_t v6 = [(NUPagingBlueprintItem *)self identifier];
      char v7 = [v5 isEqualToString:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(NUPagingBlueprintItem *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NUPage)page
{
  return self->_page;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_page, 0);
}

@end