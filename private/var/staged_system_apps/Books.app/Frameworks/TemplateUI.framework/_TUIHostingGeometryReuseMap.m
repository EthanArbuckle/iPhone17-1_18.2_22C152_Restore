@interface _TUIHostingGeometryReuseMap
- (NSDictionary)reuseMap;
- (NSSet)reuseIdentifiers;
- (_TUIHostingGeometryReuseMap)initWithMap:(id)a3 reuseTypes:(id)a4;
- (id)geometryForIdentifier:(id)a3 requestedSize:(CGSize)a4;
@end

@implementation _TUIHostingGeometryReuseMap

- (_TUIHostingGeometryReuseMap)initWithMap:(id)a3 reuseTypes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)_TUIHostingGeometryReuseMap;
  v8 = [(_TUIHostingGeometryReuseMap *)&v21 init];
  if (v8)
  {
    v9 = [v6 identifiers];
    id v10 = v7;
    v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    v24 = sub_E7F8C;
    v25 = &unk_2554B8;
    id v26 = v10;
    uint64_t v11 = [v9 objectsPassingTest:&v22];

    reuseIdentifiers = v8->_reuseIdentifiers;
    v8->_reuseIdentifiers = (NSSet *)v11;

    v13 = [v6 map];
    id v14 = v10;
    v15 = objc_opt_new();
    v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    v24 = sub_E7FD4;
    v25 = &unk_2554E0;
    id v26 = v14;
    id v16 = v15;
    id v27 = v16;
    id v17 = v14;
    [v13 enumerateKeysAndObjectsUsingBlock:&v22];
    if ([v16 count]) {
      v18 = (NSDictionary *)[v16 copy];
    }
    else {
      v18 = 0;
    }

    reuseMap = v8->_reuseMap;
    v8->_reuseMap = v18;
  }
  return v8;
}

- (id)geometryForIdentifier:(id)a3 requestedSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  v8 = [_TUIHostingGeometryReuseKey alloc];
  v9 = [v7 type];
  id v10 = [v7 identifier];

  uint64_t v11 = -[_TUIHostingGeometryReuseKey initWithType:identifier:requestedSize:](v8, "initWithType:identifier:requestedSize:", v9, v10, width, height);
  v12 = [(NSDictionary *)self->_reuseMap objectForKeyedSubscript:v11];

  return v12;
}

- (NSSet)reuseIdentifiers
{
  return self->_reuseIdentifiers;
}

- (NSDictionary)reuseMap
{
  return self->_reuseMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reuseMap, 0);

  objc_storeStrong((id *)&self->_reuseIdentifiers, 0);
}

@end