@interface HomeStorageOutlineNode
- (HomeStorageOutlineNode)initWithDictionaryRepresentation:(id)a3;
- (HomeStorageOutlineNode)initWithExpandedValue:(id)a3 children:(id)a4;
- (NSDictionary)children;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)expandedValue;
@end

@implementation HomeStorageOutlineNode

- (HomeStorageOutlineNode)initWithExpandedValue:(id)a3 children:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HomeStorageOutlineNode;
  v9 = [(HomeStorageOutlineNode *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_expandedValue, a3);
    uint64_t v11 = +[NSDictionary dictionaryWithDictionary:v8];
    children = v10->_children;
    v10->_children = (NSDictionary *)v11;
  }
  return v10;
}

- (HomeStorageOutlineNode)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"expanded"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  id v8 = [v4 objectForKeyedSubscript:@"children"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v10 count]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100BADBC8;
  v14[3] = &unk_1012F3C58;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = v15;
  [v10 enumerateKeysAndObjectsUsingBlock:v14];

  v12 = [(HomeStorageOutlineNode *)self initWithExpandedValue:v7 children:v11];
  return v12;
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  expandedValue = self->_expandedValue;
  if (expandedValue) {
    [v3 setObject:expandedValue forKeyedSubscript:@"expanded"];
  }
  v6 = +[NSMutableDictionary dictionary];
  children = self->_children;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100BADD7C;
  v12[3] = &unk_10131A610;
  id v8 = v6;
  id v13 = v8;
  [(NSDictionary *)children enumerateKeysAndObjectsUsingBlock:v12];
  if ([v8 count])
  {
    id v9 = [v8 copy];
    [v4 setObject:v9 forKeyedSubscript:@"children"];
  }
  id v10 = [v4 copy];

  return (NSDictionary *)v10;
}

- (NSNumber)expandedValue
{
  return self->_expandedValue;
}

- (NSDictionary)children
{
  return self->_children;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);

  objc_storeStrong((id *)&self->_expandedValue, 0);
}

@end