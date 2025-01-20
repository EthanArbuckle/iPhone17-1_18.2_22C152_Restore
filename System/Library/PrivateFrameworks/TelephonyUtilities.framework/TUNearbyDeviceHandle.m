@interface TUNearbyDeviceHandle
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDeviceHandle:(id)a3;
- (BOOL)isEquivalentToDeviceHandle:(id)a3;
- (NSDictionary)knownIdentifiersByHandleType;
- (NSDictionary)plistRepresentation;
- (NSString)name;
- (TUNearbyDeviceHandle)initWithCoder:(id)a3;
- (TUNearbyDeviceHandle)initWithName:(id)a3 knownIdentifiers:(id)a4;
- (TUNearbyDeviceHandle)initWithName:(id)a3 knownIdentifiers:(id)a4 deviceModel:(int64_t)a5;
- (TUNearbyDeviceHandle)initWithName:(id)a3 knownIdentifiers:(id)a4 deviceModel:(int64_t)a5 capabilities:(id)a6;
- (TUNearbyDeviceHandle)initWithType:(int64_t)a3 identifier:(id)a4 name:(id)a5;
- (TUNearbyDeviceHandle)initWithType:(int64_t)a3 identifier:(id)a4 name:(id)a5 capabilities:(id)a6;
- (TUNearbyDeviceHandleCapabilities)capabilities;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)identifierDescription;
- (id)identifierWithType:(int64_t)a3;
- (int64_t)deviceModel;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TUNearbyDeviceHandle

- (TUNearbyDeviceHandle)initWithName:(id)a3 knownIdentifiers:(id)a4 deviceModel:(int64_t)a5 capabilities:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)TUNearbyDeviceHandle;
  v13 = [(TUNearbyDeviceHandle *)&v19 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    name = v13->_name;
    v13->_name = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    knownIdentifiersByHandleType = v13->_knownIdentifiersByHandleType;
    v13->_knownIdentifiersByHandleType = (NSDictionary *)v16;

    v13->_deviceModel = a5;
    objc_storeStrong((id *)&v13->_capabilities, a6);
  }

  return v13;
}

- (TUNearbyDeviceHandle)initWithName:(id)a3 knownIdentifiers:(id)a4 deviceModel:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(TUNearbyDeviceHandleCapabilities);
  id v11 = [(TUNearbyDeviceHandle *)self initWithName:v9 knownIdentifiers:v8 deviceModel:a5 capabilities:v10];

  return v11;
}

- (TUNearbyDeviceHandle)initWithName:(id)a3 knownIdentifiers:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(TUNearbyDeviceHandleCapabilities);
  id v9 = [(TUNearbyDeviceHandle *)self initWithName:v7 knownIdentifiers:v6 deviceModel:0 capabilities:v8];

  return v9;
}

- (TUNearbyDeviceHandle)initWithType:(int64_t)a3 identifier:(id)a4 name:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F1C9E8];
  id v9 = NSNumber;
  id v10 = a5;
  id v11 = a4;
  id v12 = [v9 numberWithInteger:a3];
  v13 = [v8 dictionaryWithObject:v11 forKey:v12];

  uint64_t v14 = objc_alloc_init(TUNearbyDeviceHandleCapabilities);
  v15 = [(TUNearbyDeviceHandle *)self initWithName:v10 knownIdentifiers:v13 deviceModel:0 capabilities:v14];

  return v15;
}

- (TUNearbyDeviceHandle)initWithType:(int64_t)a3 identifier:(id)a4 name:(id)a5 capabilities:(id)a6
{
  id v10 = (void *)MEMORY[0x1E4F1C9E8];
  id v11 = NSNumber;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  v15 = [v11 numberWithInteger:a3];
  uint64_t v16 = [v10 dictionaryWithObject:v14 forKey:v15];

  v17 = [(TUNearbyDeviceHandle *)self initWithName:v13 knownIdentifiers:v16 deviceModel:0 capabilities:v12];
  return v17;
}

- (id)identifierDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  knownIdentifiersByHandleType = self->_knownIdentifiersByHandleType;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__TUNearbyDeviceHandle_identifierDescription__block_invoke;
  v7[3] = &unk_1E58E8C50;
  id v5 = v3;
  id v8 = v5;
  [(NSDictionary *)knownIdentifiersByHandleType enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __45__TUNearbyDeviceHandle_identifierDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v8 = a3;
  uint64_t v5 = [a2 integerValue];
  id v6 = @"Effective identifier";
  if (v5 == 1) {
    id v6 = @"Media route identifier";
  }
  if (v5 == 2) {
    id v7 = @"IDS device identifier";
  }
  else {
    id v7 = v6;
  }
  [v4 setObject:v8 forKeyedSubscript:v7];
}

- (id)description
{
  id v3 = [NSString alloc];
  v12.receiver = self;
  v12.super_class = (Class)TUNearbyDeviceHandle;
  v4 = [(TUNearbyDeviceHandle *)&v12 description];
  if (self->_name) {
    name = (__CFString *)self->_name;
  }
  else {
    name = @"<nil>";
  }
  id v6 = [(TUNearbyDeviceHandle *)self identifierDescription];
  id v7 = [NSNumber numberWithInteger:self->_deviceModel];
  id v8 = [v7 stringValue];
  id v9 = [(TUNearbyDeviceHandleCapabilities *)self->_capabilities description];
  id v10 = (void *)[v3 initWithFormat:@"%@: %@ - %@ - %@ - %@", v4, name, v6, v8, v9];

  return v10;
}

- (NSDictionary)plistRepresentation
{
  v15[4] = *MEMORY[0x1E4F143B8];
  v14[0] = @"name";
  uint64_t v3 = [(TUNearbyDeviceHandle *)self name];
  v4 = (void *)v3;
  if (v3) {
    uint64_t v5 = (__CFString *)v3;
  }
  else {
    uint64_t v5 = @"<nil>";
  }
  v15[0] = v5;
  v14[1] = @"deviceModel";
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[TUNearbyDeviceHandle deviceModel](self, "deviceModel"));
  v15[1] = v6;
  v14[2] = @"identifiers";
  id v7 = [(TUNearbyDeviceHandle *)self identifierDescription];
  v15[2] = v7;
  v14[3] = @"capabilities";
  id v8 = [(TUNearbyDeviceHandle *)self capabilities];
  uint64_t v9 = [v8 description];
  id v10 = (void *)v9;
  if (v9) {
    id v11 = (__CFString *)v9;
  }
  else {
    id v11 = @"<nil>";
  }
  v15[3] = v11;
  objc_super v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];

  return (NSDictionary *)v12;
}

- (id)identifierWithType:(int64_t)a3
{
  knownIdentifiersByHandleType = self->_knownIdentifiersByHandleType;
  v4 = [NSNumber numberWithInteger:a3];
  uint64_t v5 = [(NSDictionary *)knownIdentifiersByHandleType objectForKeyedSubscript:v4];

  return v5;
}

- (BOOL)isEquivalentToDeviceHandle:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    knownIdentifiersByHandleType = self->_knownIdentifiersByHandleType;
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __51__TUNearbyDeviceHandle_isEquivalentToDeviceHandle___block_invoke;
    v17 = &unk_1E58E8C78;
    id v6 = v4;
    id v18 = v6;
    objc_super v19 = &v20;
    [(NSDictionary *)knownIdentifiersByHandleType enumerateKeysAndObjectsUsingBlock:&v14];
    if (*((unsigned char *)v21 + 24))
    {
      char v7 = 1;
LABEL_11:

      _Block_object_dispose(&v20, 8);
      goto LABEL_12;
    }
    id v8 = -[NSDictionary objectForKeyedSubscript:](self->_knownIdentifiersByHandleType, "objectForKeyedSubscript:", &unk_1EED24570, v14, v15, v16, v17);
    uint64_t v9 = [v6 knownIdentifiersByHandleType];
    id v10 = [v9 objectForKeyedSubscript:&unk_1EED24570];

    if (v8)
    {
      id v11 = [v6 knownIdentifiersByHandleType];
      objc_super v12 = [v11 objectForKeyedSubscript:&unk_1EED24588];
      char v7 = [v12 isEqualToString:v8];
    }
    else
    {
      if (!v10)
      {
        char v7 = 0;
        goto LABEL_10;
      }
      id v11 = [(NSDictionary *)self->_knownIdentifiersByHandleType objectForKeyedSubscript:&unk_1EED24588];
      char v7 = [v11 isEqualToString:v10];
    }

LABEL_10:
    goto LABEL_11;
  }
  char v7 = 0;
LABEL_12:

  return v7;
}

void __51__TUNearbyDeviceHandle_isEquivalentToDeviceHandle___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  char v7 = *(void **)(a1 + 32);
  id v8 = a3;
  id v9 = a2;
  id v10 = [v7 knownIdentifiersByHandleType];
  id v11 = [v10 objectForKeyedSubscript:v9];

  LODWORD(v9) = [v11 isEqual:v8];
  if (v9)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (BOOL)isEqualToDeviceHandle:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    knownIdentifiersByHandleType = self->_knownIdentifiersByHandleType;
    id v6 = [v4 knownIdentifiersByHandleType];
    char v7 = [(NSDictionary *)knownIdentifiersByHandleType isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(NSDictionary *)self->_knownIdentifiersByHandleType isEqualToDictionary:v4[4]];

  return v5;
}

- (unint64_t)hash
{
  return [(NSDictionary *)self->_knownIdentifiersByHandleType hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v6 = [(TUNearbyDeviceHandle *)self name];
  char v7 = (void *)[v6 copyWithZone:a3];
  id v8 = [(TUNearbyDeviceHandle *)self knownIdentifiersByHandleType];
  id v9 = (void *)[v8 copyWithZone:a3];
  int64_t v10 = [(TUNearbyDeviceHandle *)self deviceModel];
  id v11 = [(TUNearbyDeviceHandle *)self capabilities];
  objc_super v12 = (void *)[v11 copyWithZone:a3];
  id v13 = (void *)[v5 initWithName:v7 knownIdentifiers:v9 deviceModel:v10 capabilities:v12];

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUNearbyDeviceHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = NSStringFromSelector(sel_name);
  char v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  id v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  objc_super v12 = NSStringFromSelector(sel_knownIdentifiersByHandleType);
  id v13 = [v4 decodeObjectOfClasses:v11 forKey:v12];

  uint64_t v14 = objc_opt_class();
  uint64_t v15 = NSStringFromSelector(sel_deviceModel);
  uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];

  if (v16) {
    uint64_t v17 = [v16 integerValue];
  }
  else {
    uint64_t v17 = 0;
  }
  uint64_t v18 = objc_opt_class();
  objc_super v19 = NSStringFromSelector(sel_capabilities);
  uint64_t v20 = [v4 decodeObjectOfClass:v18 forKey:v19];

  v21 = [(TUNearbyDeviceHandle *)self initWithName:v7 knownIdentifiers:v13 deviceModel:v17 capabilities:v20];
  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  id v6 = NSStringFromSelector(sel_name);
  [v5 encodeObject:name forKey:v6];

  knownIdentifiersByHandleType = self->_knownIdentifiersByHandleType;
  id v8 = NSStringFromSelector(sel_knownIdentifiersByHandleType);
  [v5 encodeObject:knownIdentifiersByHandleType forKey:v8];

  uint64_t v9 = [NSNumber numberWithInteger:self->_deviceModel];
  uint64_t v10 = NSStringFromSelector(sel_deviceModel);
  [v5 encodeObject:v9 forKey:v10];

  capabilities = self->_capabilities;
  NSStringFromSelector(sel_capabilities);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:capabilities forKey:v12];
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)deviceModel
{
  return self->_deviceModel;
}

- (TUNearbyDeviceHandleCapabilities)capabilities
{
  return self->_capabilities;
}

- (NSDictionary)knownIdentifiersByHandleType
{
  return self->_knownIdentifiersByHandleType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownIdentifiersByHandleType, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end