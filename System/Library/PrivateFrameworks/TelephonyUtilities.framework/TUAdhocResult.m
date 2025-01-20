@interface TUAdhocResult
- (BOOL)mostRecentCallWasMissed;
- (CNContact)backingContact;
- (NSArray)handles;
- (NSArray)idsCanonicalDestinations;
- (NSString)backingContactIdentifier;
- (NSString)displayName;
- (NSString)isoCountryCode;
- (NSString)value;
- (TUAdhocResult)initWithString:(id)a3;
- (TUSearchController)searchController;
- (int64_t)mostRecentCallType;
- (void)setSearchController:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation TUAdhocResult

- (TUAdhocResult)initWithString:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TUAdhocResult;
  v5 = [(TUAdhocResult *)&v8 init];
  v6 = v5;
  if (v5) {
    [(TUAdhocResult *)v5 setValue:v4];
  }

  return v6;
}

- (NSString)displayName
{
  v2 = [(TUAdhocResult *)self value];
  v3 = [v2 formattedDisplayID];

  return (NSString *)v3;
}

- (CNContact)backingContact
{
  v3 = [(TUAdhocResult *)self searchController];
  id v4 = [v3 contactStore];
  v5 = [(TUAdhocResult *)self value];
  v6 = [v4 contactForDestinationId:v5];

  return (CNContact *)v6;
}

- (NSString)backingContactIdentifier
{
  v2 = [(TUAdhocResult *)self backingContact];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (NSString)isoCountryCode
{
  return (NSString *)&stru_1EECEA668;
}

- (NSArray)handles
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v3 = [(TUAdhocResult *)self value];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    v5 = [(TUAdhocResult *)self value];
    v8[0] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v6;
}

- (int64_t)mostRecentCallType
{
  return 3;
}

- (BOOL)mostRecentCallWasMissed
{
  return 0;
}

- (NSArray)idsCanonicalDestinations
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = [(TUAdhocResult *)self value];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    v5 = [(TUAdhocResult *)self value];
    v6 = [v5 IDSFormattedDestinationID];

    if (v6)
    {
      v9[0] = v6;
      v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    }
    else
    {
      v7 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v7;
}

- (TUSearchController)searchController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchController);

  return (TUSearchController *)WeakRetained;
}

- (void)setSearchController:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_destroyWeak((id *)&self->_searchController);
}

@end