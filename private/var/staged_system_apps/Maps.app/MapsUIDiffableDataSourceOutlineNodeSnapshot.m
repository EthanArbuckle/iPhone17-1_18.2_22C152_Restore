@interface MapsUIDiffableDataSourceOutlineNodeSnapshot
- (BOOL)expanded;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsReloadFromPreviousItemSnapshot:(id)a3;
- (IdentifierPath)identifierPath;
- (MapsUIDiffableDataSourceOutlineNodeSnapshot)initWithIdentifierPath:(id)a3 viewModel:(id)a4 childSnapshots:(id)a5 expanded:(BOOL)a6;
- (MapsUIDiffableDataSourceViewModel)viewModel;
- (NSArray)childSnapshots;
- (NSString)description;
- (NSString)recursiveDescription;
- (id)childSnapshotWithIdentifier:(id)a3;
- (id)nodeSnapshotAtIdentifierPath:(id)a3;
- (unint64_t)hash;
@end

@implementation MapsUIDiffableDataSourceOutlineNodeSnapshot

- (MapsUIDiffableDataSourceOutlineNodeSnapshot)initWithIdentifierPath:(id)a3 viewModel:(id)a4 childSnapshots:(id)a5 expanded:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  v14 = 0;
  if (v10 && v11 && v12)
  {
    v34.receiver = self;
    v34.super_class = (Class)MapsUIDiffableDataSourceOutlineNodeSnapshot;
    self = [(MapsUIDiffableDataSourceOutlineNodeSnapshot *)&v34 init];
    if (self)
    {
      v15 = (IdentifierPath *)[v10 copy];
      identifierPath = self->_identifierPath;
      self->_identifierPath = v15;

      objc_storeStrong((id *)&self->_viewModel, a4);
      v17 = (NSArray *)[v13 copy];
      childSnapshots = self->_childSnapshots;
      self->_childSnapshots = v17;

      self->_expanded = a6;
      if ([(NSArray *)self->_childSnapshots count])
      {
        unint64_t v19 = [(IdentifierPath *)self->_identifierPath length];
        v20 = +[NSMutableDictionary dictionaryWithCapacity:[(NSArray *)self->_childSnapshots count]];
        v21 = self->_childSnapshots;
        v28 = _NSConcreteStackBlock;
        uint64_t v29 = 3221225472;
        v30 = sub_1005B4050;
        v31 = &unk_1012F0D68;
        unint64_t v33 = v19;
        v22 = v20;
        v32 = v22;
        [(NSArray *)v21 enumerateObjectsUsingBlock:&v28];
        id v23 = [(NSDictionary *)v22 count];
        if (v23 != (id)[(NSArray *)self->_childSnapshots count])
        {

          v14 = 0;
          goto LABEL_12;
        }
        v24 = +[NSDictionary dictionaryWithDictionary:v22];
        childMap = self->_childMap;
        self->_childMap = v24;
      }
      else
      {
        v26 = +[NSDictionary dictionary];
        v22 = self->_childMap;
        self->_childMap = v26;
      }

      [(MapsUIDiffableDataSourceViewModel *)self->_viewModel cellRegistration];
    }
    self = self;
    v14 = self;
  }
LABEL_12:

  return v14;
}

- (unint64_t)hash
{
  return [(IdentifierPath *)self->_identifierPath hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MapsUIDiffableDataSourceOutlineNodeSnapshot *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v13 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = [(MapsUIDiffableDataSourceOutlineNodeSnapshot *)v6 identifierPath];
    v8 = v7;
    if (v7 == self->_identifierPath || -[IdentifierPath isEqual:](v7, "isEqual:"))
    {
      v9 = [(MapsUIDiffableDataSourceOutlineNodeSnapshot *)v6 viewModel];
      id v10 = v9;
      if (v9 == self->_viewModel || -[MapsUIDiffableDataSourceViewModel isEqual:](v9, "isEqual:"))
      {
        id v11 = [(MapsUIDiffableDataSourceOutlineNodeSnapshot *)v6 childSnapshots];
        id v12 = v11;
        BOOL v13 = (v11 == self->_childSnapshots || -[NSArray isEqual:](v11, "isEqual:"))
           && self->_expanded == [(MapsUIDiffableDataSourceOutlineNodeSnapshot *)v6 expanded];
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(IdentifierPath *)self->_identifierPath visualDescription];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  viewModel = self->_viewModel;
  v9 = sub_100097E28(self->_expanded);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; identifierPath = %@, viewModel = <%@: %p>, expanded = %@>",
    v4,
    self,
    v5,
    v7,
    viewModel,
  id v10 = v9);

  return (NSString *)v10;
}

- (NSString)recursiveDescription
{
  v3 = [(MapsUIDiffableDataSourceOutlineNodeSnapshot *)self description];
  v4 = +[NSMutableString stringWithString:v3];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_childSnapshots;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) recursiveDescription];
        id v11 = [v10 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n |  "];
        [v4 appendFormat:@"\n +-- %@", v11];
      }
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return (NSString *)v4;
}

- (BOOL)needsReloadFromPreviousItemSnapshot:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifierPath];
  id v6 = v5;
  if (v5 == self->_identifierPath)
  {

    goto LABEL_5;
  }
  unsigned int v7 = -[IdentifierPath isEqual:](v5, "isEqual:");

  if (v7)
  {
LABEL_5:
    viewModel = self->_viewModel;
    id v10 = [v4 viewModel];
    unsigned __int8 v8 = [(MapsUIDiffableDataSourceViewModel *)viewModel needsReloadFromPreviousViewModel:v10];

    goto LABEL_6;
  }
  unsigned __int8 v8 = 1;
LABEL_6:

  return v8;
}

- (id)nodeSnapshotAtIdentifierPath:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [v4 firstIdentifier];
    id v6 = [(MapsUIDiffableDataSourceOutlineNodeSnapshot *)self childSnapshotWithIdentifier:v5];
    unsigned int v7 = [v4 identifierPathByRemovingFirstIdentifier];
    unsigned __int8 v8 = [v6 nodeSnapshotAtIdentifierPath:v7];
  }
  else
  {
    unsigned __int8 v8 = self;
  }

  return v8;
}

- (id)childSnapshotWithIdentifier:(id)a3
{
  id v4 = [(NSDictionary *)self->_childMap objectForKeyedSubscript:a3];
  v5 = v4;
  if (v4)
  {
    id v6 = -[NSArray objectAtIndexedSubscript:](self->_childSnapshots, "objectAtIndexedSubscript:", [v4 unsignedIntegerValue]);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (IdentifierPath)identifierPath
{
  return self->_identifierPath;
}

- (MapsUIDiffableDataSourceViewModel)viewModel
{
  return self->_viewModel;
}

- (NSArray)childSnapshots
{
  return self->_childSnapshots;
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childSnapshots, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_identifierPath, 0);

  objc_storeStrong((id *)&self->_childMap, 0);
}

@end