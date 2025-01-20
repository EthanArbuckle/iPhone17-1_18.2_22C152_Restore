@interface PKAccessoryDevice
+ (BOOL)supportsSecureCoding;
+ (id)mockAccessoryDevice;
- (BOOL)isMock;
- (BOOL)isSleeve;
- (NSData)primaryColorData;
- (NSData)secondaryColorData;
- (NSDictionary)dictionary;
- (NSNumber)type;
- (NSString)endpointUUID;
- (PKAccessoryDevice)init;
- (PKAccessoryDevice)initWithCoder:(id)a3;
- (PKAccessoryDevice)initWithDictionary:(id)a3 endpointUUID:(id)a4;
- (id)accessoryTypeString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setEndpointUUID:(id)a3;
- (void)setPrimaryColorData:(id)a3;
- (void)setSecondaryColorData:(id)a3;
- (void)setType:(id)a3;
@end

@implementation PKAccessoryDevice

- (PKAccessoryDevice)init
{
  return 0;
}

+ (id)mockAccessoryDevice
{
  v17[4] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  uint64_t v15 = 0x3FF0000000000000;
  [v2 appendBytes:&v15 length:8];
  uint64_t v15 = 0;
  [v2 appendBytes:&v15 length:8];
  [v2 appendBytes:&v15 length:8];
  uint64_t v15 = 0x3FF0000000000000;
  [v2 appendBytes:&v15 length:8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  uint64_t v15 = 0;
  [v3 appendBytes:&v15 length:8];
  [v3 appendBytes:&v15 length:8];
  [v3 appendBytes:&v15 length:8];
  uint64_t v15 = 0x3FF0000000000000;
  [v3 appendBytes:&v15 length:8];
  v4 = _MergedGlobals_178();
  v16[0] = v4;
  v5 = (void *)[v2 copy];
  v17[0] = v5;
  v6 = off_1EB402480();
  v16[1] = v6;
  v7 = (void *)[v3 copy];
  v17[1] = v7;
  v8 = off_1EB402488();
  v16[2] = v8;
  v9 = [NSNumber numberWithChar:86];
  v16[3] = @"isMock";
  v17[2] = v9;
  v17[3] = MEMORY[0x1E4F1CC38];
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];

  id v11 = objc_alloc_init(MEMORY[0x1E4F29128]);
  v12 = [v11 UUIDString];

  v13 = [[PKAccessoryDevice alloc] initWithDictionary:v10 endpointUUID:v12];
  return v13;
}

- (PKAccessoryDevice)initWithDictionary:(id)a3 endpointUUID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PKAccessoryDevice;
  v9 = [(PKAccessoryDevice *)&v21 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_endpointUUID, a4);
    objc_storeStrong((id *)&v10->_dictionary, a3);
    id v11 = _MergedGlobals_178();
    uint64_t v12 = [v7 objectForKeyedSubscript:v11];
    primaryColorData = v10->_primaryColorData;
    v10->_primaryColorData = (NSData *)v12;

    v14 = off_1EB402480();
    uint64_t v15 = [v7 objectForKeyedSubscript:v14];
    secondaryColorData = v10->_secondaryColorData;
    v10->_secondaryColorData = (NSData *)v15;

    v17 = off_1EB402488();
    uint64_t v18 = [v7 objectForKeyedSubscript:v17];
    type = v10->_type;
    v10->_type = (NSNumber *)v18;

    v10->_isMock = [v7 PKBoolForKey:@"isMock"];
  }

  return v10;
}

- (BOOL)isSleeve
{
  return [(NSNumber *)self->_type charValue] == 86;
}

- (id)accessoryTypeString
{
  int v2 = [(NSNumber *)self->_type charValue];
  if (v2 > 75)
  {
    if (v2 > 85)
    {
      if (v2 == 86) {
        return @"Sleeve";
      }
      if (v2 == 87) {
        return @"Wallet";
      }
    }
    else
    {
      if (v2 == 76) {
        return @"Leather Case";
      }
      if (v2 == 83) {
        return @"Silicon Case";
      }
    }
    return @"Unidentified";
  }
  if (v2 == 57) {
    return @"Charging Cable";
  }
  if (v2 != 66)
  {
    if (v2 == 67) {
      return @"Clear Case";
    }
    return @"Unidentified";
  }
  return @"Battery Pack";
}

- (id)description
{
  id v3 = NSString;
  endpointUUID = self->_endpointUUID;
  uint64_t v5 = [(PKAccessoryDevice *)self accessoryTypeString];
  v6 = (void *)v5;
  secondaryColorData = (NSData *)@"N/A";
  primaryColorData = self->_primaryColorData;
  if (!primaryColorData) {
    primaryColorData = (NSData *)@"N/A";
  }
  if (self->_secondaryColorData) {
    secondaryColorData = self->_secondaryColorData;
  }
  v9 = [v3 stringWithFormat:@"Accessory endpointUUID: %@, type: %@, primary color: %@, secondary color: %@", endpointUUID, v5, primaryColorData, secondaryColorData];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  endpointUUID = self->_endpointUUID;
  id v5 = a3;
  [v5 encodeObject:endpointUUID forKey:@"endpointUUID"];
  [v5 encodeObject:self->_primaryColorData forKey:@"primaryColorData"];
  [v5 encodeObject:self->_secondaryColorData forKey:@"secondaryColorData"];
  [v5 encodeObject:self->_type forKey:@"type"];
  [v5 encodeBool:self->_isMock forKey:@"isMock"];
}

- (PKAccessoryDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PKAccessoryDevice *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endpointUUID"];
    endpointUUID = v5->_endpointUUID;
    v5->_endpointUUID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryColorData"];
    primaryColorData = v5->_primaryColorData;
    v5->_primaryColorData = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondaryColorData"];
    secondaryColorData = v5->_secondaryColorData;
    v5->_secondaryColorData = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    type = v5->_type;
    v5->_type = (NSNumber *)v12;

    v5->_isMock = [v4 decodeBoolForKey:@"isMock"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(NSString *)self->_endpointUUID copyWithZone:a3];
  id v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSData *)self->_primaryColorData copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSData *)self->_secondaryColorData copyWithZone:a3];
  id v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  uint64_t v12 = [(NSNumber *)self->_type copyWithZone:a3];
  v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  *(unsigned char *)(v5 + 8) = self->_isMock;
  return (id)v5;
}

- (NSString)endpointUUID
{
  return self->_endpointUUID;
}

- (void)setEndpointUUID:(id)a3
{
}

- (NSData)primaryColorData
{
  return self->_primaryColorData;
}

- (void)setPrimaryColorData:(id)a3
{
}

- (NSData)secondaryColorData
{
  return self->_secondaryColorData;
}

- (void)setSecondaryColorData:(id)a3
{
}

- (NSNumber)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (BOOL)isMock
{
  return self->_isMock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_secondaryColorData, 0);
  objc_storeStrong((id *)&self->_primaryColorData, 0);
  objc_storeStrong((id *)&self->_endpointUUID, 0);
}

@end