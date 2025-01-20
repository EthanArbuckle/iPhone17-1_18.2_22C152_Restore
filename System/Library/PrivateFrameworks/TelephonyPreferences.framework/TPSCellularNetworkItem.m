@interface TPSCellularNetworkItem
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCellularNetworkItem:(id)a3;
- (NSString)identifier;
- (NSString)localizedName;
- (NSString)name;
- (TPSCellularNetworkItem)init;
- (TPSCellularNetworkItem)initWithIdentifier:(id)a3 name:(id)a4 localizedName:(id)a5;
- (unint64_t)hash;
@end

@implementation TPSCellularNetworkItem

- (TPSCellularNetworkItem)init
{
  return 0;
}

- (TPSCellularNetworkItem)initWithIdentifier:(id)a3 name:(id)a4 localizedName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)TPSCellularNetworkItem;
  v11 = [(TPSCellularNetworkItem *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    name = v11->_name;
    v11->_name = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    localizedName = v11->_localizedName;
    v11->_localizedName = (NSString *)v16;
  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(TPSCellularNetworkItem *)self isEqualToCellularNetworkItem:v4];

  return v5;
}

- (unint64_t)hash
{
  v3 = [(TPSCellularNetworkItem *)self identifier];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(TPSCellularNetworkItem *)self name];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(TPSCellularNetworkItem *)self localizedName];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqualToCellularNetworkItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TPSCellularNetworkItem *)self identifier];
  uint64_t v6 = [v4 identifier];
  if ([v5 isEqualToString:v6])
  {
    v7 = [(TPSCellularNetworkItem *)self name];
    unint64_t v8 = [v4 name];
    if ([v7 isEqualToString:v8])
    {
      id v9 = [(TPSCellularNetworkItem *)self localizedName];
      id v10 = [v4 localizedName];
      char v11 = [v9 isEqualToString:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end