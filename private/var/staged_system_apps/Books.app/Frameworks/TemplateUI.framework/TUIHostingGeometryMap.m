@interface TUIHostingGeometryMap
- (NSDictionary)map;
- (NSSet)identifiers;
- (TUIHostingGeometryMap)initWithMap:(id)a3 identifiers:(id)a4;
- (id)computeDifferencesWithMap:(id)a3;
- (id)description;
- (id)geometryForIdentifier:(id)a3;
- (id)identifierEnumerator;
@end

@implementation TUIHostingGeometryMap

- (TUIHostingGeometryMap)initWithMap:(id)a3 identifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TUIHostingGeometryMap;
  v8 = [(TUIHostingGeometryMap *)&v14 init];
  if (v8)
  {
    v9 = (NSDictionary *)[v6 copy];
    map = v8->_map;
    v8->_map = v9;

    v11 = (NSSet *)[v7 copy];
    identifiers = v8->_identifiers;
    v8->_identifiers = v11;
  }
  return v8;
}

- (id)geometryForIdentifier:(id)a3
{
  return [(NSDictionary *)self->_map objectForKeyedSubscript:a3];
}

- (id)identifierEnumerator
{
  return [(NSDictionary *)self->_map keyEnumerator];
}

- (id)computeDifferencesWithMap:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  id v6 = [v4 map];
  id v7 = [v6 allKeys];
  v8 = +[NSMutableSet setWithArray:v7];

  map = self->_map;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_D1B38;
  v17[3] = &unk_255160;
  id v18 = v4;
  id v19 = v8;
  id v10 = v5;
  id v20 = v10;
  id v11 = v8;
  id v12 = v4;
  [(NSDictionary *)map enumerateKeysAndObjectsUsingBlock:v17];
  v13 = [v11 allObjects];
  [v10 addObjectsFromArray:v13];

  objc_super v14 = v20;
  id v15 = v10;

  return v15;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@ %p map=%@>", v4, self, self->_map];

  return v5;
}

- (NSDictionary)map
{
  return self->_map;
}

- (NSSet)identifiers
{
  return self->_identifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);

  objc_storeStrong((id *)&self->_map, 0);
}

@end