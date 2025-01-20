@interface NPKPassLibraryFilter
- (BOOL)_entitledForObject:(id)a3;
- (BOOL)_entitledForPassTypeID:(id)a3 teamID:(id)a4 associatedPassTypeIdentifiers:(id)a5;
- (BOOL)allowAccessToPass:(id)a3;
- (BOOL)allowsSilentAdd;
- (NPKPassLibraryFilter)initWithConnection:(id)a3;
- (NSXPCConnection)connection;
- (PKEntitlementWhitelist)whitelist;
- (id)entitlementFilteredPasses:(id)a3;
- (id)filterPassIfNeeded:(id)a3;
- (void)setConnection:(id)a3;
- (void)setWhitelist:(id)a3;
@end

@implementation NPKPassLibraryFilter

- (NPKPassLibraryFilter)initWithConnection:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NPKPassLibraryFilter;
  v5 = [(NPKPassLibraryFilter *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(NPKPassLibraryFilter *)v5 setConnection:v4];
    id v7 = [objc_alloc((Class)PKEntitlementWhitelist) initWithConnection:v4];
    [(NPKPassLibraryFilter *)v6 setWhitelist:v7];
  }
  return v6;
}

- (BOOL)allowAccessToPass:(id)a3
{
  return [(NPKPassLibraryFilter *)self _entitledForObject:a3];
}

- (id)filterPassIfNeeded:(id)a3
{
  id v4 = a3;
  if ([(NPKPassLibraryFilter *)self allowAccessToPass:v4]) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (BOOL)allowsSilentAdd
{
  v2 = [(NPKPassLibraryFilter *)self whitelist];
  unsigned __int8 v3 = [v2 passesAddSilently];

  return v3;
}

- (id)entitlementFilteredPasses:(id)a3
{
  id v4 = a3;
  if (([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess] & 1) != 0
    || [(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v5 = v4;
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10003C940;
    v8[3] = &unk_10006E798;
    v8[4] = self;
    id v5 = [v4 objectsPassingTest:v8];
  }
  id v6 = v5;

  return v6;
}

- (BOOL)_entitledForObject:(id)a3
{
  id v4 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      id v7 = [v6 passTypeIdentifier];
      v8 = [v6 teamID];
      objc_super v9 = [v6 associatedPassTypeIdentifiers];
      unsigned __int8 v10 = [(NPKPassLibraryFilter *)self _entitledForPassTypeID:v7 teamID:v8 associatedPassTypeIdentifiers:v9];

      if (v10)
      {
        unsigned __int8 v5 = 1;
      }
      else if ([v6 passType] == (id)1)
      {
        v11 = [v6 associatedApplicationIdentifiers];
        v12 = [(PKEntitlementWhitelist *)self->_whitelist applicationID];
        unsigned __int8 v5 = [v11 containsObject:v12];
      }
      else
      {
        unsigned __int8 v5 = 0;
      }
    }
    else
    {
      unsigned __int8 v5 = 0;
    }
  }

  return v5;
}

- (BOOL)_entitledForPassTypeID:(id)a3 teamID:(id)a4 associatedPassTypeIdentifiers:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(PKEntitlementWhitelist *)self->_whitelist passTypeIDs];
  v12 = +[NSSet setWithArray:v11];

  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    unsigned __int8 v13 = 1;
  }
  else
  {
    v14 = [(PKEntitlementWhitelist *)self->_whitelist passTypeIDs];
    if ([v14 containsObject:v8])
    {
      unsigned __int8 v13 = 1;
    }
    else
    {
      v15 = [(PKEntitlementWhitelist *)self->_whitelist teamIDs];
      if ([v15 containsObject:v9]) {
        unsigned __int8 v13 = 1;
      }
      else {
        unsigned __int8 v13 = [v10 intersectsSet:v12];
      }
    }
  }

  return v13;
}

- (PKEntitlementWhitelist)whitelist
{
  return (PKEntitlementWhitelist *)objc_getProperty(self, a2, 8, 1);
}

- (void)setWhitelist:(id)a3
{
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_whitelist, 0);
}

@end