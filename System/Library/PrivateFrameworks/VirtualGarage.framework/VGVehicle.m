@interface VGVehicle
+ (BOOL)supportsSecureCoding;
- (BOOL)_canBeUpdatedFromState:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPureElectricVehicle;
- (BOOL)usesPreferredNetworksForRouting;
- (NSData)pairedAppInstallSessionIdentifier;
- (NSDate)creationDate;
- (NSDate)lastStateUpdateDate;
- (NSDictionary)powerByConnector;
- (NSSet)preferredChargingNetworks;
- (NSString)colorHex;
- (NSString)displayName;
- (NSString)headUnitBluetoothIdentifier;
- (NSString)headUnitIdentifier;
- (NSString)iapIdentifier;
- (NSString)identifier;
- (NSString)licensePlate;
- (NSString)lprPowerType;
- (NSString)lprVehicleType;
- (NSString)manufacturer;
- (NSString)model;
- (NSString)pairedAppIdentifier;
- (NSString)pairedAppInstallDeviceIdentifier;
- (NSString)siriIntentsIdentifier;
- (NSString)year;
- (VGVehicle)initWithCoder:(id)a3;
- (VGVehicle)initWithDisplayName:(id)a3 year:(id)a4 manufacturer:(id)a5 model:(id)a6 colorHex:(id)a7 headUnitIdentifier:(id)a8 headUnitBluetoothIdentifier:(id)a9 supportedConnectors:(unint64_t)a10 powerByConnector:(id)a11;
- (VGVehicle)initWithIdentifier:(id)a3 displayName:(id)a4 year:(id)a5 manufacturer:(id)a6 model:(id)a7 colorHex:(id)a8 licensePlate:(id)a9 lprVehicleType:(id)a10 lprPowerType:(id)a11;
- (VGVehicle)initWithLicensePlate:(id)a3 lprVehicleType:(id)a4 lprPowerType:(id)a5;
- (VGVehicle)initWithMapsSyncVehicle:(id)a3;
- (VGVehicleState)currentVehicleState;
- (double)batteryPercentageBasedOfCapacity;
- (id)_identifierForVehicleStateOrigin:(int64_t)a3;
- (id)_vehicleByUpdatingUsesPreferredNetworksForRouting:(BOOL)a3;
- (id)_vehicleByUpdatingWithVehicle:(id)a3;
- (id)combinedDisplayName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)displayedBatteryPercentage;
- (unint64_t)supportedConnectors;
- (void)_setVehicleState:(id)a3;
- (void)_updateWithVehicleState:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)pairToIapIdentifier:(id)a3 bluetoothIdentifier:(id)a4;
- (void)setColorHex:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setIapIdentifier:(id)a3;
- (void)setLicensePlate:(id)a3;
- (void)setLprPowerType:(id)a3;
- (void)setLprVehicleType:(id)a3;
- (void)setPairedAppIdentifier:(id)a3;
- (void)setPairedAppInstallDeviceIdentifier:(id)a3;
- (void)setPairedAppInstallSessionIdentifier:(id)a3;
- (void)setPreferredChargingNetworks:(id)a3;
- (void)setSiriIntentsIdentifier:(id)a3;
- (void)setSupportedConnectors:(unint64_t)a3;
- (void)setUsesPreferredNetworksForRouting:(BOOL)a3;
@end

@implementation VGVehicle

- (VGVehicle)initWithDisplayName:(id)a3 year:(id)a4 manufacturer:(id)a5 model:(id)a6 colorHex:(id)a7 headUnitIdentifier:(id)a8 headUnitBluetoothIdentifier:(id)a9 supportedConnectors:(unint64_t)a10 powerByConnector:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a11;
  v51.receiver = self;
  v51.super_class = (Class)VGVehicle;
  v25 = [(VGVehicle *)&v51 init];
  if (v25)
  {
    v26 = [MEMORY[0x263F08C38] UUID];
    uint64_t v27 = [v26 UUIDString];
    identifier = v25->_identifier;
    v25->_identifier = (NSString *)v27;

    uint64_t v29 = [v22 copy];
    iapIdentifier = v25->_iapIdentifier;
    v25->_iapIdentifier = (NSString *)v29;

    uint64_t v31 = [MEMORY[0x263EFF910] date];
    creationDate = v25->_creationDate;
    v25->_creationDate = (NSDate *)v31;

    lastStateUpdateDate = v25->_lastStateUpdateDate;
    v25->_lastStateUpdateDate = 0;

    uint64_t v34 = [v17 copy];
    displayName = v25->_displayName;
    v25->_displayName = (NSString *)v34;

    uint64_t v36 = [v18 copy];
    year = v25->_year;
    v25->_year = (NSString *)v36;

    uint64_t v38 = [v19 copy];
    manufacturer = v25->_manufacturer;
    v25->_manufacturer = (NSString *)v38;

    uint64_t v40 = [v20 copy];
    model = v25->_model;
    v25->_model = (NSString *)v40;

    uint64_t v42 = [v21 copy];
    colorHex = v25->_colorHex;
    v25->_colorHex = (NSString *)v42;

    uint64_t v44 = [v22 copy];
    headUnitIdentifier = v25->_headUnitIdentifier;
    v25->_headUnitIdentifier = (NSString *)v44;

    uint64_t v46 = [v23 copy];
    headUnitBluetoothIdentifier = v25->_headUnitBluetoothIdentifier;
    v25->_headUnitBluetoothIdentifier = (NSString *)v46;

    v25->_supportedConnectors = a10;
    uint64_t v48 = [v24 copy];
    powerByConnector = v25->_powerByConnector;
    v25->_powerByConnector = (NSDictionary *)v48;
  }
  return v25;
}

- (VGVehicle)initWithLicensePlate:(id)a3 lprVehicleType:(id)a4 lprPowerType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)VGVehicle;
  v11 = [(VGVehicle *)&v27 init];
  if (v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x263F08C38]);
    uint64_t v13 = [v12 UUIDString];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v13;

    uint64_t v15 = [MEMORY[0x263EFF910] date];
    creationDate = v11->_creationDate;
    v11->_creationDate = (NSDate *)v15;

    lastStateUpdateDate = v11->_lastStateUpdateDate;
    v11->_lastStateUpdateDate = 0;

    uint64_t v18 = [v8 copy];
    displayName = v11->_displayName;
    v11->_displayName = (NSString *)v18;

    uint64_t v20 = [v8 copy];
    licensePlate = v11->_licensePlate;
    v11->_licensePlate = (NSString *)v20;

    uint64_t v22 = [v9 copy];
    lprVehicleType = v11->_lprVehicleType;
    v11->_lprVehicleType = (NSString *)v22;

    uint64_t v24 = [v10 copy];
    lprPowerType = v11->_lprPowerType;
    v11->_lprPowerType = (NSString *)v24;
  }
  return v11;
}

- (VGVehicle)initWithIdentifier:(id)a3 displayName:(id)a4 year:(id)a5 manufacturer:(id)a6 model:(id)a7 colorHex:(id)a8 licensePlate:(id)a9 lprVehicleType:(id)a10 lprPowerType:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v46 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  v47.receiver = self;
  v47.super_class = (Class)VGVehicle;
  v25 = [(VGVehicle *)&v47 init];
  if (v25)
  {
    uint64_t v26 = [v17 copy];
    identifier = v25->_identifier;
    v25->_identifier = (NSString *)v26;

    uint64_t v28 = [MEMORY[0x263EFF910] date];
    creationDate = v25->_creationDate;
    v25->_creationDate = (NSDate *)v28;

    lastStateUpdateDate = v25->_lastStateUpdateDate;
    v25->_lastStateUpdateDate = 0;

    uint64_t v31 = [v18 copy];
    displayName = v25->_displayName;
    v25->_displayName = (NSString *)v31;

    objc_storeStrong((id *)&v25->_year, a5);
    uint64_t v33 = [v19 copy];
    manufacturer = v25->_manufacturer;
    v25->_manufacturer = (NSString *)v33;

    uint64_t v35 = [v20 copy];
    model = v25->_model;
    v25->_model = (NSString *)v35;

    uint64_t v37 = [v21 copy];
    colorHex = v25->_colorHex;
    v25->_colorHex = (NSString *)v37;

    uint64_t v39 = [v22 copy];
    licensePlate = v25->_licensePlate;
    v25->_licensePlate = (NSString *)v39;

    uint64_t v41 = [v23 copy];
    lprVehicleType = v25->_lprVehicleType;
    v25->_lprVehicleType = (NSString *)v41;

    uint64_t v43 = [v24 copy];
    lprPowerType = v25->_lprPowerType;
    v25->_lprPowerType = (NSString *)v43;
  }
  return v25;
}

- (VGVehicle)initWithMapsSyncVehicle:(id)a3
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v83.receiver = self;
  v83.super_class = (Class)VGVehicle;
  v5 = [(VGVehicle *)&v83 init];
  if (v5)
  {
    v6 = [v4 vehicleIdentifier];
    uint64_t v7 = [v6 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    id v9 = [v4 iapIdentifier];
    uint64_t v10 = [v9 copy];
    iapIdentifier = v5->_iapIdentifier;
    v5->_iapIdentifier = (NSString *)v10;

    id v12 = [v4 siriIntentsIdentifier];
    uint64_t v13 = [v12 copy];
    siriIntentsIdentifier = v5->_siriIntentsIdentifier;
    v5->_siriIntentsIdentifier = (NSString *)v13;

    uint64_t v15 = [v4 dateOfVehicleIngestion];
    uint64_t v16 = [v15 copy];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v16;

    id v18 = [v4 lastStateUpdateDate];
    uint64_t v19 = [v18 copy];
    lastStateUpdateDate = v5->_lastStateUpdateDate;
    v5->_lastStateUpdateDate = (NSDate *)v19;

    id v21 = [v4 displayName];
    uint64_t v22 = [v21 copy];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v22;

    id v24 = [v4 year];
    uint64_t v25 = [v24 stringValue];
    year = v5->_year;
    v5->_year = (NSString *)v25;

    objc_super v27 = [v4 manufacturer];
    uint64_t v28 = [v27 copy];
    manufacturer = v5->_manufacturer;
    v5->_manufacturer = (NSString *)v28;

    v30 = [v4 model];
    uint64_t v31 = [v30 copy];
    model = v5->_model;
    v5->_model = (NSString *)v31;

    uint64_t v33 = [v4 colorHex];
    uint64_t v34 = [v33 copy];
    colorHex = v5->_colorHex;
    v5->_colorHex = (NSString *)v34;

    uint64_t v36 = [v4 licensePlate];
    uint64_t v37 = [v36 copy];
    licensePlate = v5->_licensePlate;
    v5->_licensePlate = (NSString *)v37;

    uint64_t v39 = [v4 lprVehicleType];
    uint64_t v40 = [v39 copy];
    lprVehicleType = v5->_lprVehicleType;
    v5->_lprVehicleType = (NSString *)v40;

    uint64_t v42 = [v4 lprPowerType];
    uint64_t v43 = [v42 copy];
    lprPowerType = v5->_lprPowerType;
    v5->_lprPowerType = (NSString *)v43;

    v45 = [v4 headUnitMacAddress];
    uint64_t v46 = [v45 copy];
    headUnitIdentifier = v5->_headUnitIdentifier;
    v5->_headUnitIdentifier = (NSString *)v46;

    uint64_t v48 = [v4 headUnitBluetoothIdentifier];
    uint64_t v49 = [v48 copy];
    headUnitBluetoothIdentifier = v5->_headUnitBluetoothIdentifier;
    v5->_headUnitBluetoothIdentifier = (NSString *)v49;

    objc_super v51 = [v4 supportedConnectors];
    v5->_supportedConnectors = [v51 unsignedIntegerValue];

    v81[0] = MEMORY[0x263EF8330];
    v81[1] = 3221225472;
    v81[2] = __37__VGVehicle_initWithMapsSyncVehicle___block_invoke;
    v81[3] = &unk_264225FF0;
    id v52 = v4;
    id v82 = v52;
    v53 = (void (**)(void, void))MEMORY[0x2166AD0C0](v81);
    v54 = [v52 powerByConnector];
    uint64_t v55 = ((void (**)(void, void *))v53)[2](v53, v54);
    powerByConnector = v5->_powerByConnector;
    v5->_powerByConnector = (NSDictionary *)v55;

    v57 = [VGChargingNetworksStorage alloc];
    v58 = [v52 preferredChargingNetworks];
    v59 = [(VGChargingNetworksStorage *)v57 initWithData:v58];

    id v60 = objc_alloc(MEMORY[0x263EFFA08]);
    v61 = [(VGChargingNetworksStorage *)v59 networks];
    v62 = VGMap(v61, &__block_literal_global_0);
    uint64_t v63 = [v60 initWithArray:v62];
    preferredChargingNetworks = v5->_preferredChargingNetworks;
    v5->_preferredChargingNetworks = (NSSet *)v63;

    v5->_usesPreferredNetworksForRouting = [(VGChargingNetworksStorage *)v59 usesPreferredNetworksForRouting];
    v65 = [VGVehicleStateStorage alloc];
    v66 = [v52 currentVehicleState];
    v67 = [(VGVehicleStateStorage *)v65 initWithData:v66];

    if (v67)
    {
      uint64_t v68 = +[VGVehicleState _vehicleStateFromStorage:v67];
      currentVehicleState = v5->_currentVehicleState;
      v5->_currentVehicleState = (VGVehicleState *)v68;
    }
    else
    {
      v70 = VGGetPersistingLog();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v85 = v52;
        _os_log_impl(&dword_214A2C000, v70, OS_LOG_TYPE_ERROR, "Failed to load vehicleStateStorage from MapsSyncVehicle: %@.", buf, 0xCu);
      }

      currentVehicleState = v5->_currentVehicleState;
      v5->_currentVehicleState = 0;
    }

    v71 = [v52 pairedAppIdentifier];
    uint64_t v72 = [v71 copy];
    pairedAppIdentifier = v5->_pairedAppIdentifier;
    v5->_pairedAppIdentifier = (NSString *)v72;

    v74 = [(VGVehicleStateStorage *)v67 pairedAppInstallDeviceIdentifier];
    uint64_t v75 = [v74 copy];
    pairedAppInstallDeviceIdentifier = v5->_pairedAppInstallDeviceIdentifier;
    v5->_pairedAppInstallDeviceIdentifier = (NSString *)v75;

    v77 = [(VGVehicleStateStorage *)v67 pairedAppInstallSessionIdentifier];
    uint64_t v78 = [v77 copy];
    pairedAppInstallSessionIdentifier = v5->_pairedAppInstallSessionIdentifier;
    v5->_pairedAppInstallSessionIdentifier = (NSData *)v78;
  }
  return v5;
}

NSObject *__37__VGVehicle_initWithMapsSyncVehicle___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x263F08928];
    v5 = (void *)MEMORY[0x263EFFA08];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
    id v35 = 0;
    id v8 = [v4 unarchivedObjectOfClasses:v7 fromData:v3 error:&v35];
    id v9 = v35;

    if (v9 || !v8)
    {
      uint64_t v10 = VGGetPersistingLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v38 = v24;
        _os_log_impl(&dword_214A2C000, v10, OS_LOG_TYPE_ERROR, "Failed to load powerByConnector dictionary from MapsSyncVehicle: %@.", buf, 0xCu);
      }
      id v23 = 0;
    }
    else
    {
      uint64_t v28 = a1;
      uint64_t v10 = objc_opt_new();
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v11 = v8;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v32;
        uint64_t v29 = v8;
        id v30 = v3;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v32 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v31 + 1) + 8 * i);
            id v17 = [v11 objectForKeyedSubscript:v16];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              uint64_t v25 = VGGetPersistingLog();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
              {
                uint64_t v26 = *(void *)(v28 + 32);
                *(_DWORD *)buf = 138412290;
                uint64_t v38 = v26;
                _os_log_impl(&dword_214A2C000, v25, OS_LOG_TYPE_FAULT, "Failed to parse a powerByConnector dictionary from MapsSyncVehicle: %@.", buf, 0xCu);
              }

              id v23 = 0;
              id v8 = v29;
              id v3 = v30;
              id v9 = 0;
              goto LABEL_21;
            }
            id v18 = objc_alloc(MEMORY[0x263F08980]);
            [v17 doubleValue];
            double v20 = v19;
            id v21 = [MEMORY[0x263F08D08] watts];
            uint64_t v22 = (void *)[v18 initWithDoubleValue:v21 unit:v20];
            [v10 setObject:v22 forKeyedSubscript:v16];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
          id v8 = v29;
          id v3 = v30;
          id v9 = 0;
          if (v13) {
            continue;
          }
          break;
        }
      }

      uint64_t v10 = v10;
      id v23 = v10;
    }
LABEL_21:
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

VGChargingNetwork *__37__VGVehicle_initWithMapsSyncVehicle___block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[VGChargingNetwork alloc] initWithChargingNetworkStorage:v2];

  return v3;
}

- (VGVehicle)initWithCoder:(id)a3
{
  id v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)VGVehicle;
  v5 = [(VGVehicle *)&v57 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_iapIdentifier"];
    iapIdentifier = v5->_iapIdentifier;
    v5->_iapIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_siriIntentsIdentifier"];
    siriIntentsIdentifier = v5->_siriIntentsIdentifier;
    v5->_siriIntentsIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_creationDate"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_lastStateUpdateDate"];
    lastStateUpdateDate = v5->_lastStateUpdateDate;
    v5->_lastStateUpdateDate = (NSDate *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_year"];
    year = v5->_year;
    v5->_year = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_manufacturer"];
    manufacturer = v5->_manufacturer;
    v5->_manufacturer = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_model"];
    model = v5->_model;
    v5->_model = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_colorHex"];
    colorHex = v5->_colorHex;
    v5->_colorHex = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_headUnitIdentifier"];
    headUnitIdentifier = v5->_headUnitIdentifier;
    v5->_headUnitIdentifier = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_headUnitBluetoothIdentifier"];
    headUnitBluetoothIdentifier = v5->_headUnitBluetoothIdentifier;
    v5->_headUnitBluetoothIdentifier = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_licensePlate"];
    licensePlate = v5->_licensePlate;
    v5->_licensePlate = (NSString *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_lprVehicleType"];
    lprVehicleType = v5->_lprVehicleType;
    v5->_lprVehicleType = (NSString *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_lprPowerType"];
    lprPowerType = v5->_lprPowerType;
    v5->_lprPowerType = (NSString *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_supportedConnectors"];
    v5->_supportedConnectors = [v36 unsignedIntegerValue];

    id v37 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v38 = objc_opt_class();
    uint64_t v39 = objc_opt_class();
    uint64_t v40 = objc_msgSend(v37, "initWithObjects:", v38, v39, objc_opt_class(), 0);
    uint64_t v41 = [v4 decodeObjectOfClasses:v40 forKey:@"_powerByConnector"];
    powerByConnector = v5->_powerByConnector;
    v5->_powerByConnector = (NSDictionary *)v41;

    id v43 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v44 = objc_opt_class();
    v45 = objc_msgSend(v43, "initWithObjects:", v44, objc_opt_class(), 0);
    uint64_t v46 = [v4 decodeObjectOfClasses:v45 forKey:@"_preferredChargingNetworks"];
    preferredChargingNetworks = v5->_preferredChargingNetworks;
    v5->_preferredChargingNetworks = (NSSet *)v46;

    v5->_usesPreferredNetworksForRouting = [v4 decodeBoolForKey:@"_usesPreferredNetworksForRouting"];
    uint64_t v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_currentVehicleState"];
    currentVehicleState = v5->_currentVehicleState;
    v5->_currentVehicleState = (VGVehicleState *)v48;

    uint64_t v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_pairedAppIdentifier"];
    pairedAppIdentifier = v5->_pairedAppIdentifier;
    v5->_pairedAppIdentifier = (NSString *)v50;

    uint64_t v52 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_pairedAppInstallDeviceIdentifier"];
    pairedAppInstallDeviceIdentifier = v5->_pairedAppInstallDeviceIdentifier;
    v5->_pairedAppInstallDeviceIdentifier = (NSString *)v52;

    uint64_t v54 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_pairedAppInstallSessionIdentifier"];
    pairedAppInstallSessionIdentifier = v5->_pairedAppInstallSessionIdentifier;
    v5->_pairedAppInstallSessionIdentifier = (NSData *)v54;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [v6 encodeObject:v4->_identifier forKey:@"_identifier"];
  [v6 encodeObject:v4->_iapIdentifier forKey:@"_iapIdentifier"];
  [v6 encodeObject:v4->_siriIntentsIdentifier forKey:@"_siriIntentsIdentifier"];
  [v6 encodeObject:v4->_creationDate forKey:@"_creationDate"];
  [v6 encodeObject:v4->_lastStateUpdateDate forKey:@"_lastStateUpdateDate"];
  [v6 encodeObject:v4->_displayName forKey:@"_displayName"];
  [v6 encodeObject:v4->_year forKey:@"_year"];
  [v6 encodeObject:v4->_manufacturer forKey:@"_manufacturer"];
  [v6 encodeObject:v4->_model forKey:@"_model"];
  [v6 encodeObject:v4->_colorHex forKey:@"_colorHex"];
  [v6 encodeObject:v4->_headUnitIdentifier forKey:@"_headUnitIdentifier"];
  [v6 encodeObject:v4->_headUnitBluetoothIdentifier forKey:@"_headUnitBluetoothIdentifier"];
  [v6 encodeObject:v4->_licensePlate forKey:@"_licensePlate"];
  [v6 encodeObject:v4->_lprVehicleType forKey:@"_lprVehicleType"];
  [v6 encodeObject:v4->_lprPowerType forKey:@"_lprPowerType"];
  v5 = [NSNumber numberWithUnsignedInteger:v4->_supportedConnectors];
  [v6 encodeObject:v5 forKey:@"_supportedConnectors"];

  [v6 encodeObject:v4->_powerByConnector forKey:@"_powerByConnector"];
  [v6 encodeObject:v4->_preferredChargingNetworks forKey:@"_preferredChargingNetworks"];
  [v6 encodeBool:v4->_usesPreferredNetworksForRouting forKey:@"_usesPreferredNetworksForRouting"];
  [v6 encodeObject:v4->_currentVehicleState forKey:@"_currentVehicleState"];
  [v6 encodeObject:v4->_pairedAppIdentifier forKey:@"_pairedAppIdentifier"];
  [v6 encodeObject:v4->_pairedAppInstallDeviceIdentifier forKey:@"_pairedAppInstallDeviceIdentifier"];
  [v6 encodeObject:v4->_pairedAppInstallSessionIdentifier forKey:@"_pairedAppInstallSessionIdentifier"];
  objc_sync_exit(v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isPureElectricVehicle
{
  id v3 = [(VGVehicleState *)self->_currentVehicleState consumptionArguments];
  if ([v3 length])
  {
    id v4 = [(VGVehicleState *)self->_currentVehicleState chargingArguments];
    BOOL v5 = [v4 length] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_updateWithVehicleState:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(VGVehicle *)self _canBeUpdatedFromState:v4])
  {
    [(VGVehicle *)self _setVehicleState:v4];
  }
  else
  {
    BOOL v5 = VGGetDataCoordinatorLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      id v6 = [v4 identifier];
      uint64_t v7 = [v4 origin];
      uint64_t v8 = @"Unknown";
      if (v7 == 1) {
        uint64_t v8 = @"iAP2";
      }
      int v9 = 138412802;
      uint64_t v10 = self;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      if (v7 == 2) {
        uint64_t v8 = @"SiriIntents";
      }
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_FAULT, "Tried to update a vehicle %@, with an incompatible state: id: %@, origin: %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)_setVehicleState:(id)a3
{
  id v9 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v9 copy];
  currentVehicleState = v4->_currentVehicleState;
  v4->_currentVehicleState = (VGVehicleState *)v5;

  uint64_t v7 = [MEMORY[0x263EFF910] date];
  lastStateUpdateDate = v4->_lastStateUpdateDate;
  v4->_lastStateUpdateDate = (NSDate *)v7;

  objc_sync_exit(v4);
}

- (id)_vehicleByUpdatingWithVehicle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[(VGVehicle *)self copy];
  v5[15] = [v4 supportedConnectors];
  id v6 = [v4 powerByConnector];
  uint64_t v7 = [v6 copy];
  uint64_t v8 = (void *)v5[16];
  v5[16] = v7;

  id v9 = [v4 currentVehicleState];
  [v5 _updateWithVehicleState:v9];

  uint64_t v10 = [v5 displayName];

  if (!v10)
  {
    __int16 v11 = [v4 displayName];
    uint64_t v12 = [v11 copy];
    __int16 v13 = (void *)v5[5];
    v5[5] = v12;
  }
  uint64_t v14 = [v5 colorHex];

  if (!v14)
  {
    uint64_t v15 = [v4 colorHex];
    uint64_t v16 = [v15 copy];
    id v17 = (void *)v5[9];
    v5[9] = v16;
  }
  uint64_t v18 = [v5 model];

  if (!v18)
  {
    double v19 = [v4 model];
    uint64_t v20 = [v19 copy];
    id v21 = (void *)v5[8];
    v5[8] = v20;
  }
  uint64_t v22 = [v5 manufacturer];

  if (!v22)
  {
    id v23 = [v4 manufacturer];
    uint64_t v24 = [v23 copy];
    uint64_t v25 = (void *)v5[7];
    v5[7] = v24;
  }
  uint64_t v26 = [v5 year];

  if (!v26)
  {
    objc_super v27 = [v4 year];
    uint64_t v28 = [v27 copy];
    uint64_t v29 = (void *)v5[6];
    v5[6] = v28;
  }
  uint64_t v30 = [v5 headUnitIdentifier];

  if (!v30)
  {
    long long v31 = [v4 headUnitIdentifier];
    uint64_t v32 = [v31 copy];
    long long v33 = (void *)v5[11];
    v5[11] = v32;
  }
  uint64_t v34 = [v5 headUnitBluetoothIdentifier];

  if (!v34)
  {
    id v35 = [v4 headUnitBluetoothIdentifier];
    uint64_t v36 = [v35 copy];
    id v37 = (void *)v5[10];
    v5[10] = v36;
  }
  uint64_t v38 = [v5 iapIdentifier];

  if (!v38)
  {
    uint64_t v39 = [v4 iapIdentifier];
    uint64_t v40 = [v39 copy];
    uint64_t v41 = (void *)v5[20];
    v5[20] = v40;
  }

  return v5;
}

- (id)_vehicleByUpdatingUsesPreferredNetworksForRouting:(BOOL)a3
{
  id v4 = (unsigned char *)[(VGVehicle *)self copy];
  v4[8] = a3;

  return v4;
}

- (void)pairToIapIdentifier:(id)a3 bluetoothIdentifier:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = (VGVehicle *)a3;
  uint64_t v7 = (VGVehicle *)a4;
  iapIdentifier = self->_iapIdentifier;
  id v9 = VGGetDataCoordinatorLog();
  headUnitBluetoothIdentifier = v9;
  if (iapIdentifier)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      int v16 = 138412802;
      id v17 = self;
      __int16 v18 = 2112;
      double v19 = v6;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl(&dword_214A2C000, headUnitBluetoothIdentifier, OS_LOG_TYPE_FAULT, "Tried to pair a vehicle: (%@) to iapID: %@, bluetoothID: %@, but it was already paired.", (uint8_t *)&v16, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      double v19 = v7;
      _os_log_impl(&dword_214A2C000, headUnitBluetoothIdentifier, OS_LOG_TYPE_INFO, "Pairing vehicle to iapIdentifier: %@, bluetoothIdentifier: %@", (uint8_t *)&v16, 0x16u);
    }

    __int16 v11 = (NSString *)[(VGVehicle *)v6 copy];
    uint64_t v12 = self->_iapIdentifier;
    self->_iapIdentifier = v11;

    __int16 v13 = (NSString *)[(VGVehicle *)v6 copy];
    headUnitIdentifier = self->_headUnitIdentifier;
    self->_headUnitIdentifier = v13;

    uint64_t v15 = (NSString *)[(VGVehicle *)v7 copy];
    headUnitBluetoothIdentifier = self->_headUnitBluetoothIdentifier;
    self->_headUnitBluetoothIdentifier = v15;
  }
}

- (id)_identifierForVehicleStateOrigin:(int64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v4 = 160;
LABEL_5:
    id v5 = *(id *)((char *)&self->super.isa + v4);
    return v5;
  }
  if (a3 == 2)
  {
    uint64_t v4 = 168;
    goto LABEL_5;
  }
  id v5 = 0;
  return v5;
}

- (BOOL)_canBeUpdatedFromState:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  uint64_t v6 = [v4 origin];

  uint64_t v7 = [(VGVehicle *)self _identifierForVehicleStateOrigin:v6];
  LOBYTE(v4) = [v5 isEqualToString:v7];

  return (char)v4;
}

- (id)combinedDisplayName
{
  p_displayName = &self->_displayName;
  if (![(NSString *)self->_displayName length])
  {
    licensePlate = self->_licensePlate;
    p_licensePlate = &self->_licensePlate;
    uint64_t v6 = [(NSString *)licensePlate length];
    if (!v6) {
      goto LABEL_5;
    }
    p_displayName = p_licensePlate;
  }
  uint64_t v6 = *p_displayName;
LABEL_5:

  return v6;
}

- (unint64_t)displayedBatteryPercentage
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([(VGVehicle *)self isPureElectricVehicle])
  {
    uint64_t v3 = [(VGVehicle *)self currentVehicleState];
    id v4 = [v3 batteryPercentage];

    if (v4)
    {
      id v5 = [(VGVehicle *)self currentVehicleState];
      uint64_t v6 = [v5 batteryPercentage];
      [v6 doubleValue];
      double v8 = v7;
    }
    else
    {
      __int16 v11 = VGGetVirtualGarageLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v15) = 0;
      }

      [(VGVehicle *)self batteryPercentageBasedOfCapacity];
      double v8 = v12;
    }
    double v13 = 100.0;
    double v14 = v8 * 100.0;
    if (v8 < 0.0) {
      double v14 = 0.0;
    }
    if (v8 <= 1.0) {
      double v13 = v14;
    }
    return vcvtad_u64_f64(v13);
  }
  else
  {
    id v9 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412290;
      int v16 = self;
      _os_log_impl(&dword_214A2C000, v9, OS_LOG_TYPE_ERROR, "Querried a vehicle for battery state that is not an EV. Vehicle: %@", (uint8_t *)&v15, 0xCu);
    }

    return 0;
  }
}

- (double)batteryPercentageBasedOfCapacity
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if ([(VGVehicle *)self isPureElectricVehicle])
  {
    uint64_t v3 = [(VGVehicle *)self currentVehicleState];
    id v4 = [v3 minBatteryCapacity];
    [v4 doubleValue];
    double v6 = v5;

    double v7 = [v3 maxBatteryCapacity];
    [v7 doubleValue];
    double v9 = v8 - v6;

    uint64_t v10 = [v3 currentBatteryCapacity];
    [v10 doubleValue];
    double v12 = v11 - v6;

    if (v12 < 0.0 || v9 <= 2.22044605e-16 || v12 > v9)
    {
      int v15 = VGGetVirtualGarageLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v19 = 138412290;
        __int16 v20 = (VGVehicle *)v3;
        _os_log_impl(&dword_214A2C000, v15, OS_LOG_TYPE_ERROR, "Vehicle provided invalid battery state: %@", (uint8_t *)&v19, 0xCu);
      }

      double v16 = 0.0;
    }
    else
    {
      double v17 = 0.0;
      if (v12 / v9 >= 0.0) {
        double v17 = v12 / v9;
      }
      if (v12 / v9 <= 1.0) {
        double v16 = v17;
      }
      else {
        double v16 = 1.0;
      }
    }
  }
  else
  {
    uint64_t v3 = VGGetVirtualGarageLog();
    double v16 = 0.0;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v19 = 138412290;
      __int16 v20 = self;
      _os_log_impl(&dword_214A2C000, v3, OS_LOG_TYPE_ERROR, "Querried a vehicle for battery state that is not an EV. Vehicle: %@", (uint8_t *)&v19, 0xCu);
    }
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v39 = +[VGVehicle allocWithZone:a3];
  uint64_t v38 = (void *)[(NSString *)self->_identifier copy];
  id v4 = (void *)[(NSString *)self->_displayName copy];
  double v5 = (void *)[(NSString *)self->_year copy];
  double v6 = (void *)[(NSString *)self->_manufacturer copy];
  double v7 = (void *)[(NSString *)self->_model copy];
  double v8 = (void *)[(NSString *)self->_colorHex copy];
  double v9 = (void *)[(NSString *)self->_licensePlate copy];
  uint64_t v10 = (void *)[(NSString *)self->_lprVehicleType copy];
  double v11 = (void *)[(NSString *)self->_lprPowerType copy];
  uint64_t v12 = [(VGVehicle *)v39 initWithIdentifier:v38 displayName:v4 year:v5 manufacturer:v6 model:v7 colorHex:v8 licensePlate:v9 lprVehicleType:v10 lprPowerType:v11];

  uint64_t v13 = [(NSString *)self->_iapIdentifier copy];
  double v14 = *(void **)(v12 + 160);
  *(void *)(v12 + 160) = v13;

  uint64_t v15 = [(NSString *)self->_siriIntentsIdentifier copy];
  double v16 = *(void **)(v12 + 168);
  *(void *)(v12 + 168) = v15;

  uint64_t v17 = [(NSDate *)self->_creationDate copy];
  __int16 v18 = *(void **)(v12 + 24);
  *(void *)(v12 + 24) = v17;

  uint64_t v19 = [(NSDate *)self->_lastStateUpdateDate copy];
  __int16 v20 = *(void **)(v12 + 32);
  *(void *)(v12 + 32) = v19;

  uint64_t v21 = [(NSString *)self->_headUnitIdentifier copy];
  uint64_t v22 = *(void **)(v12 + 88);
  *(void *)(v12 + 88) = v21;

  uint64_t v23 = [(NSString *)self->_headUnitBluetoothIdentifier copy];
  uint64_t v24 = *(void **)(v12 + 80);
  *(void *)(v12 + 80) = v23;

  *(void *)(v12 + 120) = self->_supportedConnectors;
  uint64_t v25 = [(NSDictionary *)self->_powerByConnector copy];
  uint64_t v26 = *(void **)(v12 + 128);
  *(void *)(v12 + 128) = v25;

  uint64_t v27 = [(NSSet *)self->_preferredChargingNetworks copy];
  uint64_t v28 = *(void **)(v12 + 136);
  *(void *)(v12 + 136) = v27;

  *(unsigned char *)(v12 + 8) = self->_usesPreferredNetworksForRouting;
  uint64_t v29 = [(VGVehicleState *)self->_currentVehicleState copy];
  uint64_t v30 = *(void **)(v12 + 144);
  *(void *)(v12 + 144) = v29;

  uint64_t v31 = [(NSString *)self->_pairedAppIdentifier copy];
  uint64_t v32 = *(void **)(v12 + 152);
  *(void *)(v12 + 152) = v31;

  uint64_t v33 = [(NSString *)self->_pairedAppInstallDeviceIdentifier copy];
  uint64_t v34 = *(void **)(v12 + 176);
  *(void *)(v12 + 176) = v33;

  uint64_t v35 = [(NSData *)self->_pairedAppInstallSessionIdentifier copy];
  uint64_t v36 = *(void **)(v12 + 184);
  *(void *)(v12 + 184) = v35;

  return (id)v12;
}

- (id)description
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v26 = NSString;
  uint64_t v25 = objc_opt_class();
  identifier = v2->_identifier;
  iapIdentifier = v2->_iapIdentifier;
  creationDate = v2->_creationDate;
  siriIntentsIdentifier = v2->_siriIntentsIdentifier;
  displayName = v2->_displayName;
  lastStateUpdateDate = v2->_lastStateUpdateDate;
  manufacturer = v2->_manufacturer;
  year = v2->_year;
  headUnitBluetoothIdentifier = v2->_headUnitBluetoothIdentifier;
  colorHex = v2->_colorHex;
  model = v2->_model;
  headUnitIdentifier = v2->_headUnitIdentifier;
  licensePlate = v2->_licensePlate;
  lprVehicleType = v2->_lprVehicleType;
  lprPowerType = v2->_lprPowerType;
  double v8 = NSStringFromVGChargingConnectorTypeOptions(v2->_supportedConnectors);
  powerByConnector = v2->_powerByConnector;
  preferredChargingNetworks = v2->_preferredChargingNetworks;
  if (v2->_usesPreferredNetworksForRouting) {
    double v11 = @"YES";
  }
  else {
    double v11 = @"NO";
  }
  uint64_t v12 = v11;
  objc_msgSend(v26, "stringWithFormat:", @"<%@:%p,\n identifier: %@,\n iapIdentifier: %@,\n siriIntentsIdentifier: %@,\n creationDate: %@,\n lastStateUpdateDate: %@,\n displayName: %@,\n year: %@,\n manufacturer: %@,\n model: %@,\n colorHex: %@,\n headUnitBluetoothIdentifier: %@,\n headUnitIdentifier: %@,\n license plate: %@,\n lprVehicleType: %@,\n lprPowerType: %@,\n supportedConnectors: %@,\n powerByConnector: %@,\n preferredChargingNetworks: %@,\n usesPreferredNetworksForRouting: %@,\n currentState: %@,\n pairedAppIdentifier: %@,\n pairedAppInstallDeviceIdentifier: %@,\n pairedAppInstallSessionIdentifier: %@\n>", v25, v2, identifier, iapIdentifier, siriIntentsIdentifier, creationDate, lastStateUpdateDate, displayName, year, manufacturer, model, colorHex, headUnitBluetoothIdentifier, headUnitIdentifier, licensePlate, lprVehicleType,
    lprPowerType,
    v8,
    powerByConnector,
    preferredChargingNetworks,
    v12,
    v2->_currentVehicleState,
    v2->_pairedAppIdentifier,
    v2->_pairedAppInstallDeviceIdentifier,
  uint64_t v13 = v2->_pairedAppInstallSessionIdentifier);

  objc_sync_exit(v2);

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VGVehicle *)a3;
  if (v4 == self)
  {
    char v95 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      identifier = v5->_identifier;
      unint64_t v7 = self->_identifier;
      unint64_t v8 = identifier;
      if (v7 | v8)
      {
        double v9 = (void *)v8;
        int v10 = [(id)v7 isEqual:v8];

        if (!v10) {
          goto LABEL_43;
        }
      }
      creationDate = v5->_creationDate;
      unint64_t v12 = self->_creationDate;
      unint64_t v13 = creationDate;
      if (v12 | v13)
      {
        double v14 = (void *)v13;
        int v15 = [(id)v12 isEqual:v13];

        if (!v15) {
          goto LABEL_43;
        }
      }
      iapIdentifier = v5->_iapIdentifier;
      unint64_t v17 = self->_iapIdentifier;
      unint64_t v18 = iapIdentifier;
      if (v17 | v18)
      {
        uint64_t v19 = (void *)v18;
        int v20 = [(id)v17 isEqual:v18];

        if (!v20) {
          goto LABEL_43;
        }
      }
      siriIntentsIdentifier = v5->_siriIntentsIdentifier;
      unint64_t v22 = self->_siriIntentsIdentifier;
      unint64_t v23 = siriIntentsIdentifier;
      if (v22 | v23)
      {
        uint64_t v24 = (void *)v23;
        int v25 = [(id)v22 isEqual:v23];

        if (!v25) {
          goto LABEL_43;
        }
      }
      lastStateUpdateDate = v5->_lastStateUpdateDate;
      unint64_t v27 = self->_lastStateUpdateDate;
      unint64_t v28 = lastStateUpdateDate;
      if (v27 | v28)
      {
        uint64_t v29 = (void *)v28;
        int v30 = [(id)v27 isEqual:v28];

        if (!v30) {
          goto LABEL_43;
        }
      }
      displayName = v5->_displayName;
      unint64_t v32 = self->_displayName;
      unint64_t v33 = displayName;
      if (v32 | v33)
      {
        uint64_t v34 = (void *)v33;
        int v35 = [(id)v32 isEqual:v33];

        if (!v35) {
          goto LABEL_43;
        }
      }
      manufacturer = v5->_manufacturer;
      unint64_t v37 = self->_manufacturer;
      unint64_t v38 = manufacturer;
      if (v37 | v38)
      {
        uint64_t v39 = (void *)v38;
        int v40 = [(id)v37 isEqual:v38];

        if (!v40) {
          goto LABEL_43;
        }
      }
      model = v5->_model;
      unint64_t v42 = self->_model;
      unint64_t v43 = model;
      if (v42 | v43)
      {
        uint64_t v44 = (void *)v43;
        int v45 = [(id)v42 isEqual:v43];

        if (!v45) {
          goto LABEL_43;
        }
      }
      year = v5->_year;
      unint64_t v47 = self->_year;
      unint64_t v48 = year;
      if (v47 | v48)
      {
        uint64_t v49 = (void *)v48;
        int v50 = [(id)v47 isEqual:v48];

        if (!v50) {
          goto LABEL_43;
        }
      }
      headUnitBluetoothIdentifier = v5->_headUnitBluetoothIdentifier;
      unint64_t v52 = self->_headUnitBluetoothIdentifier;
      unint64_t v53 = headUnitBluetoothIdentifier;
      if (v52 | v53)
      {
        uint64_t v54 = (void *)v53;
        int v55 = [(id)v52 isEqual:v53];

        if (!v55) {
          goto LABEL_43;
        }
      }
      headUnitIdentifier = v5->_headUnitIdentifier;
      unint64_t v57 = self->_headUnitIdentifier;
      unint64_t v58 = headUnitIdentifier;
      if (v57 | v58)
      {
        v59 = (void *)v58;
        int v60 = [(id)v57 isEqual:v58];

        if (!v60) {
          goto LABEL_43;
        }
      }
      colorHex = v5->_colorHex;
      unint64_t v62 = self->_colorHex;
      unint64_t v63 = colorHex;
      if (v62 | v63)
      {
        v64 = (void *)v63;
        int v65 = [(id)v62 isEqual:v63];

        if (!v65) {
          goto LABEL_43;
        }
      }
      licensePlate = v5->_licensePlate;
      unint64_t v67 = self->_licensePlate;
      unint64_t v68 = licensePlate;
      if (v67 | v68)
      {
        v69 = (void *)v68;
        int v70 = [(id)v67 isEqual:v68];

        if (!v70) {
          goto LABEL_43;
        }
      }
      lprVehicleType = v5->_lprVehicleType;
      unint64_t v72 = self->_lprVehicleType;
      unint64_t v73 = lprVehicleType;
      if (v72 | v73)
      {
        v74 = (void *)v73;
        int v75 = [(id)v72 isEqual:v73];

        if (!v75) {
          goto LABEL_43;
        }
      }
      lprPowerType = v5->_lprPowerType;
      unint64_t v77 = self->_lprPowerType;
      unint64_t v78 = lprPowerType;
      if (v77 | v78)
      {
        v79 = (void *)v78;
        int v80 = [(id)v77 isEqual:v78];

        if (!v80) {
          goto LABEL_43;
        }
      }
      if (self->_supportedConnectors != v5->_supportedConnectors) {
        goto LABEL_43;
      }
      powerByConnector = v5->_powerByConnector;
      unint64_t v82 = self->_powerByConnector;
      unint64_t v83 = powerByConnector;
      if (v82 | v83)
      {
        v84 = (void *)v83;
        int v85 = [(id)v82 isEqual:v83];

        if (!v85) {
          goto LABEL_43;
        }
      }
      if (((preferredChargingNetworks = v5->_preferredChargingNetworks,
             unint64_t v87 = self->_preferredChargingNetworks,
             unint64_t v88 = preferredChargingNetworks,
             !(v87 | v88))
         || (v89 = (void *)v88,
             int v90 = [(id)v87 isEqual:v88],
             v89,
             (id)v87,
             v90))
        && self->_usesPreferredNetworksForRouting == v5->_usesPreferredNetworksForRouting)
      {
        currentVehicleState = self->_currentVehicleState;
        v92 = v5->_currentVehicleState;
        id v93 = currentVehicleState;
        v94 = v93;
        if ((unint64_t)v93 | (unint64_t)v92) {
          char v95 = [v93 isEqual:v92];
        }
        else {
          char v95 = 1;
        }
      }
      else
      {
LABEL_43:
        char v95 = 0;
      }
    }
    else
    {
      char v95 = 0;
    }
  }

  return v95;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)lastStateUpdateDate
{
  return self->_lastStateUpdateDate;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)year
{
  return self->_year;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)colorHex
{
  return self->_colorHex;
}

- (void)setColorHex:(id)a3
{
}

- (NSString)headUnitBluetoothIdentifier
{
  return self->_headUnitBluetoothIdentifier;
}

- (NSString)headUnitIdentifier
{
  return self->_headUnitIdentifier;
}

- (NSString)licensePlate
{
  return self->_licensePlate;
}

- (void)setLicensePlate:(id)a3
{
}

- (NSString)lprVehicleType
{
  return self->_lprVehicleType;
}

- (void)setLprVehicleType:(id)a3
{
}

- (NSString)lprPowerType
{
  return self->_lprPowerType;
}

- (void)setLprPowerType:(id)a3
{
}

- (unint64_t)supportedConnectors
{
  return self->_supportedConnectors;
}

- (void)setSupportedConnectors:(unint64_t)a3
{
  self->_supportedConnectors = a3;
}

- (NSDictionary)powerByConnector
{
  return self->_powerByConnector;
}

- (NSSet)preferredChargingNetworks
{
  return self->_preferredChargingNetworks;
}

- (void)setPreferredChargingNetworks:(id)a3
{
}

- (BOOL)usesPreferredNetworksForRouting
{
  return self->_usesPreferredNetworksForRouting;
}

- (void)setUsesPreferredNetworksForRouting:(BOOL)a3
{
  self->_usesPreferredNetworksForRouting = a3;
}

- (VGVehicleState)currentVehicleState
{
  return self->_currentVehicleState;
}

- (NSString)pairedAppIdentifier
{
  return self->_pairedAppIdentifier;
}

- (void)setPairedAppIdentifier:(id)a3
{
}

- (NSString)iapIdentifier
{
  return self->_iapIdentifier;
}

- (void)setIapIdentifier:(id)a3
{
}

- (NSString)siriIntentsIdentifier
{
  return self->_siriIntentsIdentifier;
}

- (void)setSiriIntentsIdentifier:(id)a3
{
}

- (NSString)pairedAppInstallDeviceIdentifier
{
  return self->_pairedAppInstallDeviceIdentifier;
}

- (void)setPairedAppInstallDeviceIdentifier:(id)a3
{
}

- (NSData)pairedAppInstallSessionIdentifier
{
  return self->_pairedAppInstallSessionIdentifier;
}

- (void)setPairedAppInstallSessionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedAppInstallSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_pairedAppInstallDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_siriIntentsIdentifier, 0);
  objc_storeStrong((id *)&self->_iapIdentifier, 0);
  objc_storeStrong((id *)&self->_pairedAppIdentifier, 0);
  objc_storeStrong((id *)&self->_currentVehicleState, 0);
  objc_storeStrong((id *)&self->_preferredChargingNetworks, 0);
  objc_storeStrong((id *)&self->_powerByConnector, 0);
  objc_storeStrong((id *)&self->_lprPowerType, 0);
  objc_storeStrong((id *)&self->_lprVehicleType, 0);
  objc_storeStrong((id *)&self->_licensePlate, 0);
  objc_storeStrong((id *)&self->_headUnitIdentifier, 0);
  objc_storeStrong((id *)&self->_headUnitBluetoothIdentifier, 0);
  objc_storeStrong((id *)&self->_colorHex, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_year, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_lastStateUpdateDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end