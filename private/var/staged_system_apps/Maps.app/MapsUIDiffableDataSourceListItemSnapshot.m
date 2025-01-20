@interface MapsUIDiffableDataSourceListItemSnapshot
- (BOOL)isEqual:(id)a3;
- (BOOL)needsReloadFromPreviousItemSnapshot:(id)a3;
- (IdentifierPath)identifierPath;
- (MapsUIDiffableDataSourceListItemSnapshot)initWithIdentifierPath:(id)a3 viewModel:(id)a4;
- (MapsUIDiffableDataSourceViewModel)viewModel;
- (unint64_t)hash;
@end

@implementation MapsUIDiffableDataSourceListItemSnapshot

- (MapsUIDiffableDataSourceListItemSnapshot)initWithIdentifierPath:(id)a3 viewModel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MapsUIDiffableDataSourceListItemSnapshot;
  v8 = [(MapsUIDiffableDataSourceListItemSnapshot *)&v12 init];
  if (v8)
  {
    v9 = (IdentifierPath *)[v6 copy];
    identifierPath = v8->_identifierPath;
    v8->_identifierPath = v9;

    objc_storeStrong((id *)&v8->_viewModel, a4);
    if (objc_opt_respondsToSelector())
    {
      [(MapsUIDiffableDataSourceViewModel *)v8->_viewModel cellRegistration];
    }
  }

  return v8;
}

- (unint64_t)hash
{
  return [(IdentifierPath *)self->_identifierPath hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MapsUIDiffableDataSourceListItemSnapshot *)a3;
  v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    id v7 = [(MapsUIDiffableDataSourceListItemSnapshot *)v6 identifierPath];
    v8 = v7;
    if (v7 == self->_identifierPath || -[IdentifierPath isEqual:](v7, "isEqual:"))
    {
      v9 = [(MapsUIDiffableDataSourceListItemSnapshot *)v6 viewModel];
      v10 = v9;
      if (v9 == self->_viewModel) {
        unsigned __int8 v11 = 1;
      }
      else {
        unsigned __int8 v11 = -[MapsUIDiffableDataSourceViewModel isEqual:](v9, "isEqual:");
      }
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (BOOL)needsReloadFromPreviousItemSnapshot:(id)a3
{
  id v4 = a3;
  if ([(MapsUIDiffableDataSourceListItemSnapshot *)self isEqual:v4])
  {
    viewModel = self->_viewModel;
    id v6 = [v4 viewModel];
    unsigned __int8 v7 = [(MapsUIDiffableDataSourceViewModel *)viewModel needsReloadFromPreviousViewModel:v6];
  }
  else
  {
    unsigned __int8 v7 = 1;
  }

  return v7;
}

- (IdentifierPath)identifierPath
{
  return self->_identifierPath;
}

- (MapsUIDiffableDataSourceViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);

  objc_storeStrong((id *)&self->_identifierPath, 0);
}

@end