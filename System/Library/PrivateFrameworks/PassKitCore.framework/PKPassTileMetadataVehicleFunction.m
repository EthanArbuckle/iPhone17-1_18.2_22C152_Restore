@interface PKPassTileMetadataVehicleFunction
+ (BOOL)supportsSecureCoding;
- (BOOL)_setUpWithDictionary:(id)a3 privateDictionary:(id)a4;
- (NSArray)vehicleFunctions;
- (PKPassTileMetadataVehicleFunction)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setVehicleFunctions:(id)a3;
@end

@implementation PKPassTileMetadataVehicleFunction

- (BOOL)_setUpWithDictionary:(id)a3 privateDictionary:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPassTileMetadataVehicleFunction;
  if (![(PKPassTileMetadata *)&v13 _setUpWithDictionary:v6 privateDictionary:a4])
  {
LABEL_7:
    BOOL v9 = 0;
    goto LABEL_8;
  }
  v7 = [v6 PKArrayContaining:objc_opt_class() forKey:@"vehicleFunctions"];
  vehicleFunctions = self->_vehicleFunctions;
  self->_vehicleFunctions = v7;

  if (![(NSArray *)self->_vehicleFunctions count])
  {
    v10 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [(PKPassTileMetadata *)self identifier];
      *(_DWORD *)buf = 134218242;
      v15 = self;
      __int16 v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "PKPassTileMetadataVehicleFunction (%p): tile %@ invalid - must have vehicle functions.", buf, 0x16u);
    }
    goto LABEL_7;
  }
  BOOL v9 = 1;
LABEL_8:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileMetadataVehicleFunction)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassTileMetadataVehicleFunction;
  v5 = [(PKPassTileMetadata *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"vehicleFunctions"];
    vehicleFunctions = v5->_vehicleFunctions;
    v5->_vehicleFunctions = (NSArray *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPassTileMetadataVehicleFunction;
  id v4 = a3;
  [(PKPassTileMetadata *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_vehicleFunctions, @"vehicleFunctions", v5.receiver, v5.super_class);
}

- (NSArray)vehicleFunctions
{
  return self->_vehicleFunctions;
}

- (void)setVehicleFunctions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end