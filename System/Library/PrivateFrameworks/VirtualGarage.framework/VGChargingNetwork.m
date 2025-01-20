@interface VGChargingNetwork
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (VGChargingNetwork)initWithBrandInfoMapping:(id)a3;
- (VGChargingNetwork)initWithChargingNetworkStorage:(id)a3;
- (VGChargingNetwork)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)globalBrandID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VGChargingNetwork

- (VGChargingNetwork)initWithBrandInfoMapping:(id)a3
{
  v30 = self;
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF960] currentLocale];
  v5 = [v4 countryCode];
  v6 = [v5 lowercaseString];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v31 = v3;
  v7 = [v3 scopedBrandInfos];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v34;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v34 != v11) {
        objc_enumerationMutation(v7);
      }
      v13 = *(void **)(*((void *)&v33 + 1) + 8 * v12);
      v14 = objc_msgSend(v13, "isoCountryCode", v30);
      char v15 = [v6 isEqualToString:v14];

      if (v15) {
        break;
      }
      v16 = [v13 isoCountryCode];
      int v17 = [@"global" isEqualToString:v16];

      if (v17)
      {
        id v18 = v13;

        id v10 = v18;
      }
      if (v9 == ++v12)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v39 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_15;
      }
    }
    id v19 = v13;

    v21 = v30;
    v20 = v31;
    if (v19) {
      goto LABEL_19;
    }
  }
  else
  {
    id v10 = 0;
LABEL_15:

    v21 = v30;
    v20 = v31;
  }
  v22 = VGGetChargingNetworksLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v20;
    _os_log_impl(&dword_214A2C000, v22, OS_LOG_TYPE_INFO, "Didn't find local scoped brand info in mapping: %@, falling back to global", buf, 0xCu);
  }

  id v10 = v10;
  id v19 = v10;
LABEL_19:
  v23 = (void *)MEMORY[0x263F417C8];
  v24 = objc_msgSend(v19, "localizedNames", v30);
  v25 = [v23 bestStringForCurrentLocale:v24 fallbackToFirstAvailable:1];

  if (v25)
  {
    v32.receiver = v21;
    v32.super_class = (Class)VGChargingNetwork;
    v26 = [(VGChargingNetwork *)&v32 init];
    if (v26)
    {
      v26->_globalBrandID = [v20 globalBrandId];
      objc_storeStrong((id *)&v26->_name, v25);
    }
    v21 = v26;
    v27 = v21;
  }
  else
  {
    v28 = VGGetChargingNetworksLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v38 = v20;
      _os_log_impl(&dword_214A2C000, v28, OS_LOG_TYPE_ERROR, "Failed to initialize a network with mapping: %{public}@", buf, 0xCu);
    }

    v27 = 0;
  }

  return v27;
}

- (VGChargingNetwork)initWithChargingNetworkStorage:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 hasIdentifier])
  {
    v12.receiver = self;
    v12.super_class = (Class)VGChargingNetwork;
    v5 = [(VGChargingNetwork *)&v12 init];
    if (v5)
    {
      v6 = [v4 name];
      uint64_t v7 = [v6 copy];
      name = v5->_name;
      v5->_name = (NSString *)v7;

      v5->_globalBrandID = [v4 identifier];
    }
    self = v5;
    uint64_t v9 = self;
  }
  else
  {
    id v10 = VGGetChargingNetworksLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_214A2C000, v10, OS_LOG_TYPE_ERROR, "Failed to initialize a network with storage: %@", buf, 0xCu);
    }

    uint64_t v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(VGChargingNetwork);
  v4->_globalBrandID = self->_globalBrandID;
  uint64_t v5 = [(NSString *)self->_name copy];
  name = v4->_name;
  v4->_name = (NSString *)v5;

  return v4;
}

- (VGChargingNetwork)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VGChargingNetwork;
  uint64_t v5 = [(VGChargingNetwork *)&v9 init];
  if (v5)
  {
    v5->_globalBrandID = [v4 decodeInt64ForKey:@"_globalBrandID"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t globalBrandID = self->_globalBrandID;
  id v5 = a3;
  [v5 encodeInt64:globalBrandID forKey:@"_globalBrandID"];
  [v5 encodeObject:self->_name forKey:@"_name"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [v4 globalBrandID] == self->_globalBrandID;

  return v5;
}

- (unint64_t)hash
{
  unint64_t v2 = 2654435761u * self->_globalBrandID;
  return [(NSString *)self->_name hash] ^ v2;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p, globalBrandID: %llu, name: %@>", objc_opt_class(), self, self->_globalBrandID, self->_name];
}

- (unint64_t)globalBrandID
{
  return self->_globalBrandID;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end