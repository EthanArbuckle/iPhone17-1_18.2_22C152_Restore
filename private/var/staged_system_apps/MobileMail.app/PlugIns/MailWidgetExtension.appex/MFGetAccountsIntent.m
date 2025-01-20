@interface MFGetAccountsIntent
- (MFGetAccountsIntent)init;
- (MFGetAccountsIntent)initWithCoder:(id)a3;
- (MFGetAccountsIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (MFGetAccountsIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation MFGetAccountsIntent

- (MFGetAccountsIntent)init
{
  return (MFGetAccountsIntent *)MFGetAccountsIntent.init()();
}

- (MFGetAccountsIntent)initWithCoder:(id)a3
{
  id v3 = a3;
  return (MFGetAccountsIntent *)MFGetAccountsIntent.init(coder:)(a3);
}

- (MFGetAccountsIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  id v4 = a3;
  id v5 = a4;
  if (a3)
  {
    uint64_t v8 = sub_10008A080();
    uint64_t v9 = v6;

    uint64_t v10 = v8;
    uint64_t v11 = v9;
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
  }
  return (MFGetAccountsIntent *)MFGetAccountsIntent.init(identifier:backingStore:)(v10, v11, a4);
}

- (MFGetAccountsIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  id v5 = a3;
  id v6 = a4;
  id v7 = a5;
  uint64_t v16 = sub_10008A080();
  uint64_t v17 = v8;
  uint64_t v19 = sub_10008A080();
  uint64_t v20 = v9;
  if (a5)
  {
    uint64_t v12 = sub_100089FF0();

    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v11 = (MFGetAccountsIntent *)MFGetAccountsIntent.init(domain:verb:parametersByName:)(v16, v17, v19, v20, v13);

  return v11;
}

@end