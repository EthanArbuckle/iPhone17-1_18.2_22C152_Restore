@interface PKPassTileStateMetadataVehicleFunction
+ (BOOL)supportsSecureCoding;
- (BOOL)_setUpWithDictionary:(id)a3;
- (BOOL)isEqualToUnresolvedMetadata:(id)a3;
- (NSDictionary)vehicleFunctionStates;
- (PKPassTileStateMetadataVehicleFunction)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setVehicleFunctionStates:(id)a3;
@end

@implementation PKPassTileStateMetadataVehicleFunction

- (BOOL)_setUpWithDictionary:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKPassTileStateMetadataVehicleFunction;
  BOOL v5 = [(PKPassTileStateMetadata *)&v23 _setUpWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 PKDictionaryForKey:@"vehicleFunctionStates"];
    if (v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_opt_class();
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      v17 = __63__PKPassTileStateMetadataVehicleFunction__setUpWithDictionary___block_invoke;
      v18 = &unk_1E56F6150;
      uint64_t v20 = v8;
      uint64_t v21 = v9;
      uint64_t v22 = v10;
      id v11 = v7;
      id v19 = v11;
      [v6 enumerateKeysAndObjectsUsingBlock:&v15];
      if (objc_msgSend(v11, "count", v15, v16, v17, v18))
      {
        v12 = (NSDictionary *)[v11 copy];
        vehicleFunctionStates = self->_vehicleFunctionStates;
        self->_vehicleFunctionStates = v12;
      }
      else
      {
        vehicleFunctionStates = self->_vehicleFunctionStates;
        self->_vehicleFunctionStates = (NSDictionary *)MEMORY[0x1E4F1CC08];
      }
    }
  }

  return v5;
}

void __63__PKPassTileStateMetadataVehicleFunction__setUpWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass())
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      while (2)
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_16;
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    unsigned int v15 = 0;
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v5];
    if ([v12 scanHexInt:&v15] && objc_msgSend(v12, "isAtEnd"))
    {
      v13 = *(void **)(a1 + 32);
      v14 = [NSNumber numberWithUnsignedInt:v15];
      [v13 setObject:v7 forKeyedSubscript:v14];
    }
  }
LABEL_16:
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileStateMetadataVehicleFunction)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPassTileStateMetadataVehicleFunction;
  id v5 = [(PKPassTileStateMetadata *)&v13 initWithCoder:v4];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"vehicleFunctions"];
    vehicleFunctionStates = v5->_vehicleFunctionStates;
    v5->_vehicleFunctionStates = (NSDictionary *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPassTileStateMetadataVehicleFunction;
  id v4 = a3;
  [(PKPassTileStateMetadata *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_vehicleFunctionStates, @"vehicleFunctionStates", v5.receiver, v5.super_class);
}

- (BOOL)isEqualToUnresolvedMetadata:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPassTileStateMetadataVehicleFunction;
  if ([(PKPassTileStateMetadata *)&v10 isEqualToUnresolvedMetadata:v4])
  {
    objc_super v5 = (NSDictionary *)v4[2];
    vehicleFunctionStates = self->_vehicleFunctionStates;
    if (v5) {
      BOOL v7 = vehicleFunctionStates == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7) {
      char v8 = v5 == vehicleFunctionStates;
    }
    else {
      char v8 = -[NSDictionary isEqual:](v5, "isEqual:");
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (NSDictionary)vehicleFunctionStates
{
  return self->_vehicleFunctionStates;
}

- (void)setVehicleFunctionStates:(id)a3
{
}

- (void).cxx_destruct
{
}

@end