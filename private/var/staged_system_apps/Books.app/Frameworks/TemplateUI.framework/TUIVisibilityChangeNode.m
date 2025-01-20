@interface TUIVisibilityChangeNode
- (NSDictionary)attributesMap;
- (NSDictionary)identifierNodeMap;
- (NSSet)added;
- (NSSet)identifiers;
- (NSSet)removed;
- (TUIVisibilityChangeNode)initWithIdentifiers:(id)a3 added:(id)a4 removed:(id)a5 identifierNodeMap:(id)a6 attributesMap:(id)a7;
- (id)newAdded;
- (id)newRemoved;
@end

@implementation TUIVisibilityChangeNode

- (TUIVisibilityChangeNode)initWithIdentifiers:(id)a3 added:(id)a4 removed:(id)a5 identifierNodeMap:(id)a6 attributesMap:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)TUIVisibilityChangeNode;
  v17 = [(TUIVisibilityChangeNode *)&v29 init];
  if (v17)
  {
    v18 = (NSSet *)[v12 copy];
    identifiers = v17->_identifiers;
    v17->_identifiers = v18;

    v20 = (NSSet *)[v13 copy];
    added = v17->_added;
    v17->_added = v20;

    v22 = (NSSet *)[v14 copy];
    removed = v17->_removed;
    v17->_removed = v22;

    v24 = (NSDictionary *)[v15 copy];
    identifierNodeMap = v17->_identifierNodeMap;
    v17->_identifierNodeMap = v24;

    v26 = (NSDictionary *)[v16 copy];
    attributesMap = v17->_attributesMap;
    v17->_attributesMap = v26;
  }
  return v17;
}

- (id)newAdded
{
  id v3 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:-[NSDictionary count](self->_identifierNodeMap, "count")];
  identifierNodeMap = self->_identifierNodeMap;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1A360;
  v8[3] = &unk_251BC0;
  id v9 = v3;
  id v5 = v3;
  [(NSDictionary *)identifierNodeMap enumerateKeysAndObjectsUsingBlock:v8];
  v6 = [[TUIVisibilityChangeNode alloc] initWithIdentifiers:self->_identifiers added:self->_identifiers removed:0 identifierNodeMap:v5 attributesMap:self->_attributesMap];

  return v6;
}

- (id)newRemoved
{
  id v3 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:-[NSDictionary count](self->_identifierNodeMap, "count")];
  identifierNodeMap = self->_identifierNodeMap;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1A4BC;
  v8[3] = &unk_251BC0;
  id v9 = v3;
  id v5 = v3;
  [(NSDictionary *)identifierNodeMap enumerateKeysAndObjectsUsingBlock:v8];
  v6 = [[TUIVisibilityChangeNode alloc] initWithIdentifiers:self->_identifiers added:0 removed:self->_identifiers identifierNodeMap:v5 attributesMap:self->_attributesMap];

  return v6;
}

- (NSSet)identifiers
{
  return self->_identifiers;
}

- (NSSet)added
{
  return self->_added;
}

- (NSSet)removed
{
  return self->_removed;
}

- (NSDictionary)identifierNodeMap
{
  return self->_identifierNodeMap;
}

- (NSDictionary)attributesMap
{
  return self->_attributesMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributesMap, 0);
  objc_storeStrong((id *)&self->_identifierNodeMap, 0);
  objc_storeStrong((id *)&self->_removed, 0);
  objc_storeStrong((id *)&self->_added, 0);

  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end