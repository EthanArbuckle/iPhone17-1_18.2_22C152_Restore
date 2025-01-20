@interface _TUIHostingGeometryMapUpdate
- (NSSet)differences;
- (TUIHostingGeometryMap)from;
- (TUIHostingGeometryMap)to;
- (_TUIHostingGeometryMapUpdate)initWithFrom:(id)a3 to:(id)a4 reuseTypes:(id)a5;
- (_TUIHostingGeometryReuseMap)toReuseMap;
@end

@implementation _TUIHostingGeometryMapUpdate

- (_TUIHostingGeometryMapUpdate)initWithFrom:(id)a3 to:(id)a4 reuseTypes:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)_TUIHostingGeometryMapUpdate;
  v12 = [(_TUIHostingGeometryMapUpdate *)&v24 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_from, a3);
    objc_storeStrong((id *)&v13->_to, a4);
    if (v10 == v9)
    {
      if (v10) {
        goto LABEL_6;
      }
    }
    else
    {
      if (v10)
      {
        uint64_t v14 = [v10 computeDifferencesWithMap:v9];
        differences = v13->_differences;
        v13->_differences = (NSSet *)v14;

LABEL_6:
        v16 = [[_TUIHostingGeometryReuseMap alloc] initWithMap:v10 reuseTypes:v11];
        toReuseMap = v13->_toReuseMap;
        v13->_toReuseMap = v16;
LABEL_10:

        goto LABEL_11;
      }
      if (v9)
      {
        id v18 = objc_alloc((Class)NSSet);
        v19 = [v9 identifierEnumerator];
        v20 = [v19 allObjects];
        v21 = (NSSet *)[v18 initWithArray:v20];
        v22 = v13->_differences;
        v13->_differences = v21;
      }
    }
    toReuseMap = v13->_toReuseMap;
    v13->_toReuseMap = 0;
    goto LABEL_10;
  }
LABEL_11:

  return v13;
}

- (TUIHostingGeometryMap)from
{
  return self->_from;
}

- (TUIHostingGeometryMap)to
{
  return self->_to;
}

- (_TUIHostingGeometryReuseMap)toReuseMap
{
  return self->_toReuseMap;
}

- (NSSet)differences
{
  return self->_differences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_differences, 0);
  objc_storeStrong((id *)&self->_toReuseMap, 0);
  objc_storeStrong((id *)&self->_to, 0);

  objc_storeStrong((id *)&self->_from, 0);
}

@end