@interface VGOEMApplication
- (BOOL)_isValidConsumptionModelForResponse:(id)a3;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (LSApplicationRecord)applicationRecord;
- (NSArray)allowedFormulaIDs;
- (NSString)description;
- (NSString)identifier;
- (VGOEMAppSOCStreaming)chargeStreamingDelegate;
- (VGOEMApplication)initWithIdentifier:(id)a3 applicationRecord:(id)a4;
- (id)_connectionWithIntent:(id)a3;
- (id)_powerByConnectorDictionaryFromCar:(id)a3;
- (id)_vehicleStateFromResponse:(id)a3 error:(id *)a4;
- (id)_vehiclesFromListCarsIntentResponse:(id)a3;
- (unint64_t)_VGChargingConnectorTypeOptionFromINCarChargingConnectorType:(id)a3;
- (unint64_t)_VGChargingConnectorTypeOptionsFromINCarChargingConnectorTypes:(id)a3;
- (void)_createChargeStreamingConnectionIfNeededForVehicle:(id)a3;
- (void)getStateOfChargeForVehicle:(id)a3 completion:(id)a4;
- (void)intentResponseDidUpdate:(id)a3 withSerializedCacheItems:(id)a4;
- (void)listCarsWithCompletion:(id)a3;
- (void)setAllowedFormulaIDs:(id)a3;
- (void)setChargeStreamingDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)startSendingChargeUpdatesForVehicle:(id)a3;
- (void)stopSendingChargeUpdatesForVehicle:(id)a3;
@end

@implementation VGOEMApplication

- (VGOEMApplication)initWithIdentifier:(id)a3 applicationRecord:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VGOEMApplication;
  v9 = [(VGOEMApplication *)&v14 init];
  if (v9)
  {
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("VGOEMApplicationQueue", v10);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v9->_applicationRecord, a4);
  }

  return v9;
}

- (unint64_t)_VGChargingConnectorTypeOptionsFromINCarChargingConnectorTypes:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (_MergedGlobals_4 != -1) {
    dispatch_once(&_MergedGlobals_4, &__block_literal_global_7);
  }
  id v4 = (id)qword_26AB30FB8;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v12 = objc_msgSend(v4, "objectForKeyedSubscript:", v11, (void)v15);

        if (v12)
        {
          v13 = [v4 objectForKeyedSubscript:v11];
          v8 |= [v13 unsignedIntegerValue];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (unint64_t)_VGChargingConnectorTypeOptionFromINCarChargingConnectorType:(id)a3
{
  id v3 = a3;
  if (_MergedGlobals_4 != -1) {
    dispatch_once(&_MergedGlobals_4, &__block_literal_global_7);
  }
  id v4 = (id)qword_26AB30FB8;
  id v5 = [v4 objectForKeyedSubscript:v3];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:v3];
    unint64_t v7 = [v6 unsignedIntegerValue];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)_isValidConsumptionModelForResponse:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (GEOConfigGetBOOL())
  {
    id v5 = GEOConfigGetString();
    uint64_t v6 = [v4 consumptionFormulaArguments];
    unint64_t v7 = [v6 objectForKeyedSubscript:v5];

    if (v7
      && ([(VGOEMApplication *)self allowedFormulaIDs],
          unint64_t v8 = objc_claimAutoreleasedReturnValue(),
          char v9 = [v8 containsObject:v7],
          v8,
          (v9 & 1) != 0))
    {
      BOOL v10 = 1;
    }
    else
    {
      uint64_t v11 = VGGetOEMApplicationLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = [(VGOEMApplication *)self allowedFormulaIDs];
        int v14 = 138412546;
        long long v15 = v7;
        __int16 v16 = 2112;
        long long v17 = v12;
        _os_log_impl(&dword_214A2C000, v11, OS_LOG_TYPE_ERROR, "Allowlisted formula IDs do not contain the formula in the Consumption Arguments. Current formula: %@, Allowed formula IDs: %@", (uint8_t *)&v14, 0x16u);
      }
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (id)_vehicleStateFromResponse:(id)a3 error:(id *)a4
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v7 = a3;
  unint64_t v8 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    char v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    uint64_t v60 = (uint64_t)v9;
    _os_log_impl(&dword_214A2C000, v8, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  BOOL v10 = [v7 carIdentifier];
  if (v10)
  {
    uint64_t v11 = [v7 dateOfLastStateUpdate];
    v12 = v11;
    if (v11)
    {
      v13 = [v11 calendar];

      if (v13)
      {
        int v14 = [v12 calendar];
      }
      else
      {
        uint64_t v18 = VGGetOEMApplicationLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_214A2C000, v18, OS_LOG_TYPE_INFO, "Date components did not specify a calendar; assuming the current one",
            buf,
            2u);
        }

        int v14 = [MEMORY[0x263EFF8F0] currentCalendar];
      }
      v19 = v14;
      uint64_t v20 = [v14 dateFromComponents:v12];

      if (v20) {
        goto LABEL_19;
      }
      v21 = VGGetOEMApplicationLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v60 = (uint64_t)v12;
        _os_log_impl(&dword_214A2C000, v21, OS_LOG_TYPE_ERROR, "Failed to get an updateDate from components: %@", buf, 0xCu);
      }
    }
    v22 = VGGetOEMApplicationLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      uint64_t v60 = (uint64_t)v7;
      _os_log_impl(&dword_214A2C000, v22, OS_LOG_TYPE_ERROR, "Assuming vehicle state response: %{private}@ was created now", buf, 0xCu);
    }

    uint64_t v20 = objc_opt_new();
LABEL_19:
    v46 = [VGVehicleState alloc];
    v57 = [v7 carIdentifier];
    v52 = [v7 chargePercentRemaining];
    uint64_t v23 = [v7 distanceRemainingElectric];
    v51 = [v7 maximumDistanceElectric];
    v50 = [v7 minimumBatteryCapacity];
    v49 = [v7 currentBatteryCapacity];
    v48 = [v7 maximumBatteryCapacity];
    uint64_t v24 = [v7 consumptionFormulaArguments];
    v54 = self;
    v55 = v10;
    v56 = (void *)v24;
    if (v24)
    {
      id v58 = 0;
      v25 = [MEMORY[0x263F08900] dataWithJSONObject:v24 options:0 error:&v58];
      v26 = v58;
      v27 = v26;
      if (!v25 || v26)
      {
        v29 = VGGetVirtualGarageLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v60 = (uint64_t)v56;
          __int16 v61 = 2112;
          v62 = v27;
          _os_log_impl(&dword_214A2C000, v29, OS_LOG_TYPE_ERROR, "Failed to serialize VGVehicleArguments into a string. arguments: %@, error: %@", buf, 0x16u);
        }
        uint64_t v28 = 0;
      }
      else
      {
        uint64_t v28 = [[NSString alloc] initWithData:v25 encoding:4];
        v29 = VGGetOEMApplicationLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v60 = v28;
          _os_log_impl(&dword_214A2C000, v29, OS_LOG_TYPE_INFO, "Serializing arguments as: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      v27 = VGGetVirtualGarageLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_214A2C000, v27, OS_LOG_TYPE_INFO, "Tried to serialize nil arguments.", buf, 2u);
      }
      uint64_t v28 = 0;
    }

    uint64_t v30 = [v7 chargingFormulaArguments];
    v53 = v12;
    v45 = (void *)v30;
    if (v30)
    {
      uint64_t v31 = v30;
      id v58 = 0;
      v32 = [MEMORY[0x263F08900] dataWithJSONObject:v30 options:0 error:&v58];
      v33 = v58;
      v34 = v33;
      if (!v32 || v33)
      {
        v35 = (void *)v28;
        v37 = VGGetVirtualGarageLog();
        v38 = (void *)v23;
        v39 = (void *)v20;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v60 = v31;
          __int16 v61 = 2112;
          v62 = v34;
          _os_log_impl(&dword_214A2C000, v37, OS_LOG_TYPE_ERROR, "Failed to serialize VGVehicleArguments into a string. arguments: %@, error: %@", buf, 0x16u);
        }
        v36 = 0;
      }
      else
      {
        v35 = (void *)v28;
        v36 = (void *)[[NSString alloc] initWithData:v32 encoding:4];
        v37 = VGGetOEMApplicationLog();
        v38 = (void *)v23;
        v39 = (void *)v20;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v60 = (uint64_t)v36;
          _os_log_impl(&dword_214A2C000, v37, OS_LOG_TYPE_INFO, "Serializing arguments as: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      v35 = (void *)v28;
      v38 = (void *)v23;
      v39 = (void *)v20;
      v34 = VGGetVirtualGarageLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_214A2C000, v34, OS_LOG_TYPE_INFO, "Tried to serialize nil arguments.", buf, 2u);
      }
      v36 = 0;
    }

    v40 = [v7 charging];
    char v41 = [v40 BOOLValue];
    v42 = [v7 activeConnector];
    LOBYTE(v44) = v41;
    uint64_t v47 = [(VGVehicleState *)v46 initWithIdentifier:v57 dateOfUpdate:v39 origin:2 batteryPercentage:v52 currentEVRange:v38 maxEVRange:v51 minBatteryCapacity:v50 currentBatteryCapacity:v49 maxBatteryCapacity:v48 consumptionArguments:v35 chargingArguments:v36 isCharging:v44 activeConnector:[(VGOEMApplication *)v54 _VGChargingConnectorTypeOptionFromINCarChargingConnectorType:v42]];

    long long v17 = (void *)v47;
    BOOL v10 = v55;
    __int16 v16 = v53;
    goto LABEL_44;
  }
  if (a4)
  {
    long long v15 = (void *)MEMORY[0x263F087E8];
    __int16 v16 = GEOErrorDomain();
    [v15 errorWithDomain:v16 code:-11 userInfo:0];
    long long v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_44:

    goto LABEL_45;
  }
  long long v17 = 0;
LABEL_45:

  return v17;
}

- (id)_vehiclesFromListCarsIntentResponse:(id)a3
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    uint64_t v64 = (uint64_t)v7;
    _os_log_impl(&dword_214A2C000, v6, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  if ([v5 code] == 3)
  {
    id v8 = objc_alloc(MEMORY[0x263EFF980]);
    char v9 = [v5 cars];
    BOOL v10 = objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

    uint64_t v11 = VGGetOEMApplicationLog();
    LODWORD(v9) = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);

    if (v9) {
      v45 = objc_opt_new();
    }
    else {
      v45 = 0;
    }
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v44 = v5;
    id obj = [v5 cars];
    uint64_t v50 = [obj countByEnumeratingWithState:&v58 objects:v62 count:16];
    if (v50)
    {
      uint64_t v47 = *(void *)v59;
      v48 = self;
      v49 = v10;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v59 != v47) {
            objc_enumerationMutation(obj);
          }
          long long v15 = *(void **)(*((void *)&v58 + 1) + 8 * v14);
          __int16 v16 = (CGColor *)[v15 color];
          long long v17 = [VGVehicle alloc];
          v57 = [v15 displayName];
          v56 = [v15 year];
          v55 = [v15 make];
          [v15 model];
          v54 = uint64_t v53 = v14;
          v52 = v17;
          if (v16)
          {
            uint64_t v18 = VGHexRepresentationFromCGColor(v16);
            v51 = (void *)v18;
          }
          else
          {
            uint64_t v18 = 0;
          }
          v19 = [v15 headUnit];
          uint64_t v20 = [v19 iAP2Identifier];
          v21 = [v15 headUnit];
          v22 = [v21 bluetoothIdentifier];
          uint64_t v23 = [v15 supportedChargingConnectors];
          unint64_t v24 = [(VGOEMApplication *)self _VGChargingConnectorTypeOptionsFromINCarChargingConnectorTypes:v23];
          v25 = [(VGOEMApplication *)self _powerByConnectorDictionaryFromCar:v15];
          v26 = [(VGVehicle *)v52 initWithDisplayName:v57 year:v56 manufacturer:v55 model:v54 colorHex:v18 headUnitIdentifier:v20 headUnitBluetoothIdentifier:v22 supportedConnectors:v24 powerByConnector:v25];

          if (v16) {
          v27 = [v15 carIdentifier];
          }
          uint64_t v28 = (void *)[v27 copy];
          [(VGVehicle *)v26 setSiriIntentsIdentifier:v28];

          self = v48;
          v29 = [(VGOEMApplication *)v48 identifier];
          uint64_t v30 = (void *)[v29 copy];
          [(VGVehicle *)v26 setPairedAppIdentifier:v30];

          uint64_t v31 = VGGetOEMApplicationLog();
          LODWORD(v30) = os_log_type_enabled(v31, OS_LOG_TYPE_INFO);

          BOOL v10 = v49;
          if (v30)
          {
            v32 = (void *)MEMORY[0x263F089D8];
            v33 = [(VGVehicle *)v26 displayName];
            v34 = [(VGVehicle *)v26 siriIntentsIdentifier];
            v35 = [v32 stringWithFormat:@"%@ (%@) ", v33, v34];

            if (v16)
            {
              Components = CGColorGetComponents(v16);
              if (CGColorGetNumberOfComponents(v16))
              {
                size_t v37 = 0;
                do
                  objc_msgSend(v35, "appendFormat:", @"%f ", *(void *)&Components[v37++]);
                while (v37 < CGColorGetNumberOfComponents(v16));
              }
              ColorSpace = CGColorGetColorSpace(v16);
              [v35 appendFormat:@"%@", CGColorSpaceGetName(ColorSpace)];
            }
            else
            {
              [v35 appendString:@"<no color>"];
            }
            [v45 addObject:v35];
          }
          [v49 addObject:v26];

          uint64_t v14 = v53 + 1;
        }
        while (v53 + 1 != v50);
        uint64_t v50 = [obj countByEnumeratingWithState:&v58 objects:v62 count:16];
      }
      while (v50);
    }

    v39 = VGGetOEMApplicationLog();
    BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_INFO);

    id v5 = v44;
    if (v40)
    {
      char v41 = VGGetOEMApplicationLog();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        v42 = [v45 componentsJoinedByString:@", "];
        *(_DWORD *)buf = 138412290;
        uint64_t v64 = (uint64_t)v42;
        _os_log_impl(&dword_214A2C000, v41, OS_LOG_TYPE_INFO, "_vehiclesFromListCarsIntentResponse color are: %@", buf, 0xCu);
      }
    }
    id v13 = [v10 copy];
  }
  else
  {
    BOOL v10 = VGGetOEMApplicationLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = [v5 code];
      *(_DWORD *)buf = 134217984;
      uint64_t v64 = v12;
      _os_log_impl(&dword_214A2C000, v10, OS_LOG_TYPE_INFO, "Listing cars received a non-Success response code: %ld", buf, 0xCu);
    }
    id v13 = (id)MEMORY[0x263EFFA68];
  }

  return v13;
}

- (id)_powerByConnectorDictionaryFromCar:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  if (_MergedGlobals_4 != -1) {
    dispatch_once(&_MergedGlobals_4, &__block_literal_global_7);
  }
  uint64_t v6 = [(id)qword_26AB30FB8 allKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v27;
    *(void *)&long long v8 = 134218242;
    long long v24 = v8;
    v25 = v6;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v13 = objc_msgSend(v4, "supportedChargingConnectors", v24);
        int v14 = [v13 containsObject:v12];

        if (v14)
        {
          long long v15 = [v4 maximumPowerForChargingConnectorType:v12];
          if (v15)
          {
            unint64_t v16 = [(VGOEMApplication *)self _VGChargingConnectorTypeOptionFromINCarChargingConnectorType:v12];
            if (v16)
            {
              long long v17 = [NSNumber numberWithUnsignedInteger:v16];
              [v5 setObject:v15 forKeyedSubscript:v17];
            }
            else
            {
              long long v17 = VGGetOEMApplicationLog();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                [v4 powerPerConnectors];
                uint64_t v18 = self;
                uint64_t v20 = v19 = v5;
                *(_DWORD *)buf = v24;
                uint64_t v31 = v12;
                __int16 v32 = 2112;
                v33 = v20;
                _os_log_impl(&dword_214A2C000, v17, OS_LOG_TYPE_ERROR, "Failed to extract power for connector type: %lu, from car array: %@.", buf, 0x16u);

                id v5 = v19;
                self = v18;
                uint64_t v6 = v25;
              }
            }
          }
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v9);
  }

  v21 = VGGetOEMApplicationLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v31 = v5;
    _os_log_impl(&dword_214A2C000, v21, OS_LOG_TYPE_INFO, "Constructed powerByConnector dictionary: %@", buf, 0xCu);
  }

  v22 = (void *)[v5 copy];

  return v22;
}

- (void)listCarsWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      uint64_t v7 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      unint64_t v16 = v7;
      _os_log_impl(&dword_214A2C000, v6, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
    if ([(VGOEMApplication *)self isEnabled])
    {
      objc_initWeak((id *)buf, self);
      queue = self->_queue;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __43__VGOEMApplication_listCarsWithCompletion___block_invoke;
      v12[3] = &unk_264226428;
      objc_copyWeak(&v14, (id *)buf);
      id v13 = v5;
      dispatch_async(queue, v12);

      objc_destroyWeak(&v14);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      uint64_t v10 = VGGetOEMApplicationLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        identifier = self->_identifier;
        *(_DWORD *)buf = 138412290;
        unint64_t v16 = (const char *)identifier;
        _os_log_impl(&dword_214A2C000, v10, OS_LOG_TYPE_INFO, "Application %@ is not enabled returning no results", buf, 0xCu);
      }

      (*((void (**)(id, void, void))v5 + 2))(v5, MEMORY[0x263EFFA68], 0);
    }
  }
  else
  {
    uint64_t v9 = VGGetAssertLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      unint64_t v16 = "-[VGOEMApplication listCarsWithCompletion:]";
      __int16 v17 = 2082;
      uint64_t v18 = "completion == nil";
      __int16 v19 = 2082;
      uint64_t v20 = "Completion cannot be nil!";
      _os_log_impl(&dword_214A2C000, v9, OS_LOG_TYPE_ERROR, "%{public}s forbids: %{public}s. %{public}s", buf, 0x20u);
    }
  }
}

void __43__VGOEMApplication_listCarsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F0FBF0]);
    id v5 = [WeakRetained _connectionWithIntent:v4];
    uint64_t v6 = VGGetOEMApplicationLog();
    uint64_t v7 = (char *)os_signpost_id_generate(v6);

    long long v8 = VGGetOEMApplicationLog();
    uint64_t v9 = v8;
    if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_214A2C000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v7, "listCarsIntentSignpost", "", buf, 2u);
    }

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __43__VGOEMApplication_listCarsWithCompletion___block_invoke_25;
    v11[3] = &unk_264226730;
    objc_copyWeak(v14, v2);
    v14[1] = v7;
    id v13 = *(id *)(a1 + 32);
    id v10 = v5;
    id v12 = v10;
    [v10 resumeWithCompletionHandler:v11];

    objc_destroyWeak(v14);
  }
  else
  {
    id v4 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      unint64_t v16 = "-[VGOEMApplication listCarsWithCompletion:]_block_invoke";
      __int16 v17 = 1024;
      int v18 = 311;
      _os_log_impl(&dword_214A2C000, v4, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }
}

void __43__VGOEMApplication_listCarsWithCompletion___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v6)
    {
      long long v8 = VGGetOEMApplicationLog();
      uint64_t v9 = v8;
      os_signpost_id_t v10 = *(void *)(a1 + 56);
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_214A2C000, v9, OS_SIGNPOST_INTERVAL_END, v10, "listCarsIntentSignpost", "", buf, 2u);
      }

      uint64_t v11 = WeakRetained[1];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __43__VGOEMApplication_listCarsWithCompletion___block_invoke_26;
      block[3] = &unk_2642266B8;
      id v21 = *(id *)(a1 + 40);
      id v12 = v6;
      id v20 = v12;
      dispatch_async(v11, block);
      id v13 = VGGetOEMApplicationLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = (const char *)v12;
        _os_log_impl(&dword_214A2C000, v13, OS_LOG_TYPE_ERROR, "Returning because of a connection error: %@", buf, 0xCu);
      }
    }
    else
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __43__VGOEMApplication_listCarsWithCompletion___block_invoke_28;
      v15[3] = &unk_264226708;
      v18[1] = *(id *)(a1 + 56);
      objc_copyWeak(v18, (id *)(a1 + 48));
      id v17 = *(id *)(a1 + 40);
      id v16 = *(id *)(a1 + 32);
      [v5 handleIntentWithCompletionHandler:v15];

      objc_destroyWeak(v18);
    }
  }
  else
  {
    id v14 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v23 = "-[VGOEMApplication listCarsWithCompletion:]_block_invoke";
      __int16 v24 = 1024;
      int v25 = 319;
      _os_log_impl(&dword_214A2C000, v14, OS_LOG_TYPE_ERROR, "strongSelf2 went away in %s line %d", buf, 0x12u);
    }
  }
}

uint64_t __43__VGOEMApplication_listCarsWithCompletion___block_invoke_26(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __43__VGOEMApplication_listCarsWithCompletion___block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = VGGetOEMApplicationLog();
  long long v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_214A2C000, v8, OS_SIGNPOST_INTERVAL_END, v9, "listCarsIntentSignpost", "", buf, 2u);
  }

  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v11 = WeakRetained;
  if (WeakRetained)
  {
    id v12 = WeakRetained[1];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__VGOEMApplication_listCarsWithCompletion___block_invoke_29;
    block[3] = &unk_2642266E0;
    long long v15 = v6;
    id v19 = *(id *)(a1 + 40);
    id v16 = v11;
    id v17 = v5;
    id v18 = *(id *)(a1 + 32);
    dispatch_async(v12, block);

    id v13 = v15;
  }
  else
  {
    id v13 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v21 = "-[VGOEMApplication listCarsWithCompletion:]_block_invoke";
      __int16 v22 = 1024;
      int v23 = 324;
      _os_log_impl(&dword_214A2C000, v13, OS_LOG_TYPE_ERROR, "strongSelf3 went away in %s line %d", buf, 0x12u);
    }
  }
}

void __43__VGOEMApplication_listCarsWithCompletion___block_invoke_29(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) underlyingError];

  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 64);
    id v4 = [*(id *)(a1 + 32) underlyingError];
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);

    id v5 = VGGetOEMApplicationLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = [*(id *)(a1 + 32) underlyingError];
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v6;
      _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_ERROR, "Returning because of an underlying error in the connection: %@", buf, 0xCu);
    }
  }
  else
  {
    id v9 = [*(id *)(a1 + 40) _vehiclesFromListCarsIntentResponse:*(void *)(a1 + 48)];
    uint64_t v7 = *(void *)(a1 + 64);
    long long v8 = [*(id *)(a1 + 32) underlyingError];
    (*(void (**)(uint64_t, id, void *))(v7 + 16))(v7, v9, v8);

    [*(id *)(a1 + 56) reset];
  }
}

- (void)getStateOfChargeForVehicle:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  long long v8 = (void (**)(id, NSObject *, void))a4;
  if (!v8)
  {
    uint64_t v12 = VGGetAssertLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v20 = "-[VGOEMApplication getStateOfChargeForVehicle:completion:]";
      __int16 v21 = 2082;
      __int16 v22 = "completion == nil";
      __int16 v23 = 2082;
      uint64_t v24 = "Completion cannot be nil!";
      _os_log_impl(&dword_214A2C000, v12, OS_LOG_TYPE_ERROR, "%{public}s forbids: %{public}s. %{public}s", buf, 0x20u);
    }
    goto LABEL_11;
  }
  id v9 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    os_signpost_id_t v10 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    id v20 = v10;
    _os_log_impl(&dword_214A2C000, v9, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  if (![(VGOEMApplication *)self isEnabled])
  {
    id v13 = VGGetOEMApplicationLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      identifier = self->_identifier;
      *(_DWORD *)buf = 138412290;
      id v20 = (const char *)identifier;
      _os_log_impl(&dword_214A2C000, v13, OS_LOG_TYPE_INFO, "Application %@ is not enabled returning existing SoC", buf, 0xCu);
    }

    uint64_t v12 = [v7 currentVehicleState];
    v8[2](v8, v12, 0);
LABEL_11:

    goto LABEL_12;
  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__VGOEMApplication_getStateOfChargeForVehicle_completion___block_invoke;
  block[3] = &unk_264226390;
  objc_copyWeak(&v18, (id *)buf);
  id v16 = v7;
  id v17 = v8;
  dispatch_async(queue, block);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
LABEL_12:
}

void __58__VGOEMApplication_getStateOfChargeForVehicle_completion___block_invoke(id *a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v4 = objc_alloc(MEMORY[0x263F0FFA0]);
    id v5 = [a1[4] siriIntentsIdentifier];
    id v6 = [a1[4] displayName];
    id v7 = [v4 initWithVocabularyIdentifier:v5 spokenPhrase:v6 pronunciationHint:0];

    long long v8 = (void *)[objc_alloc(MEMORY[0x263F0FB10]) initWithCarName:v7];
    id v9 = [WeakRetained _connectionWithIntent:v8];
    os_signpost_id_t v10 = VGGetOEMApplicationLog();
    uint64_t v11 = (char *)os_signpost_id_generate(v10);

    uint64_t v12 = VGGetOEMApplicationLog();
    id v13 = v12;
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_214A2C000, v13, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v11, "stateOfChargeIntentSignpost", "", buf, 2u);
    }

    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __58__VGOEMApplication_getStateOfChargeForVehicle_completion___block_invoke_34;
    v15[3] = &unk_2642267A8;
    objc_copyWeak(v19, v2);
    v19[1] = v11;
    id v18 = a1[5];
    id v14 = v9;
    id v16 = v14;
    id v17 = a1[4];
    [v14 resumeWithCompletionHandler:v15];

    objc_destroyWeak(v19);
  }
  else
  {
    id v7 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v21 = "-[VGOEMApplication getStateOfChargeForVehicle:completion:]_block_invoke";
      __int16 v22 = 1024;
      int v23 = 352;
      _os_log_impl(&dword_214A2C000, v7, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }
}

void __58__VGOEMApplication_getStateOfChargeForVehicle_completion___block_invoke_34(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v6)
    {
      long long v8 = VGGetOEMApplicationLog();
      id v9 = v8;
      os_signpost_id_t v10 = *(void *)(a1 + 64);
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_214A2C000, v9, OS_SIGNPOST_INTERVAL_END, v10, "stateOfChargeIntent", "", buf, 2u);
      }

      uint64_t v11 = WeakRetained[1];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __58__VGOEMApplication_getStateOfChargeForVehicle_completion___block_invoke_35;
      block[3] = &unk_2642266B8;
      id v22 = *(id *)(a1 + 48);
      id v12 = v6;
      id v21 = v12;
      dispatch_async(v11, block);
      id v13 = VGGetOEMApplicationLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v24 = (const char *)v12;
        _os_log_impl(&dword_214A2C000, v13, OS_LOG_TYPE_ERROR, "Returning because of a connection error: %@", buf, 0xCu);
      }
    }
    else
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __58__VGOEMApplication_getStateOfChargeForVehicle_completion___block_invoke_36;
      v15[3] = &unk_264226780;
      v19[1] = *(id *)(a1 + 64);
      objc_copyWeak(v19, (id *)(a1 + 56));
      id v18 = *(id *)(a1 + 48);
      id v16 = *(id *)(a1 + 32);
      id v17 = *(id *)(a1 + 40);
      [v5 handleIntentWithCompletionHandler:v15];

      objc_destroyWeak(v19);
    }
  }
  else
  {
    id v14 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v24 = "-[VGOEMApplication getStateOfChargeForVehicle:completion:]_block_invoke";
      __int16 v25 = 1024;
      int v26 = 360;
      _os_log_impl(&dword_214A2C000, v14, OS_LOG_TYPE_ERROR, "strongSelf2 went away in %s line %d", buf, 0x12u);
    }
  }
}

uint64_t __58__VGOEMApplication_getStateOfChargeForVehicle_completion___block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __58__VGOEMApplication_getStateOfChargeForVehicle_completion___block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = VGGetOEMApplicationLog();
  long long v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 64);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_214A2C000, v8, OS_SIGNPOST_INTERVAL_END, v9, "stateOfChargeIntentSignpost", "", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v6)
    {
      uint64_t v11 = VGGetOEMApplicationLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v48 = v6;
        _os_log_impl(&dword_214A2C000, v11, OS_LOG_TYPE_ERROR, "error in handleIntentWithCompletionHandler: %@", buf, 0xCu);
      }

      uint64_t v12 = *(void *)(a1 + 48);
      id v13 = [v6 underlyingError];
      if (v13)
      {
        (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);
      }
      else
      {
        id v16 = (void *)MEMORY[0x263F087E8];
        id v17 = GEOErrorDomain();
        uint64_t v45 = *MEMORY[0x263F08320];
        id v33 = v5;
        id v18 = objc_msgSend(NSString, "stringWithFormat:", @"Intents error with code: %ld", objc_msgSend(v6, "errorCode"));
        v46 = v18;
        id v19 = [NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
        id v20 = [v16 errorWithDomain:v17 code:-11 userInfo:v19];
        (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v20);

        id v5 = v33;
      }

      [*(id *)(a1 + 32) reset];
    }
    else
    {
      id v15 = v5;
      if ([v15 code] == 4)
      {
      }
      else
      {
        uint64_t v21 = [v15 code];

        if (v21 != 5)
        {
          if ([WeakRetained _isValidConsumptionModelForResponse:v15])
          {
            long long v28 = WeakRetained[1];
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __58__VGOEMApplication_getStateOfChargeForVehicle_completion___block_invoke_48;
            block[3] = &unk_264226758;
            id v35 = 0;
            id v40 = *(id *)(a1 + 48);
            v36 = WeakRetained;
            id v37 = v15;
            id v38 = *(id *)(a1 + 40);
            id v39 = *(id *)(a1 + 32);
            dispatch_async(v28, block);
          }
          else
          {
            long long v29 = (void *)MEMORY[0x263F087E8];
            uint64_t v30 = GEOErrorDomain();
            uint64_t v41 = *MEMORY[0x263F08320];
            v42 = @"Invalid Formula";
            uint64_t v31 = [NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
            __int16 v32 = [v29 errorWithDomain:v30 code:-11 userInfo:v31];

            (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
            [*(id *)(a1 + 32) reset];
          }
          goto LABEL_21;
        }
      }
      id v22 = VGGetOEMApplicationLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v48 = (const char *)v15;
        _os_log_impl(&dword_214A2C000, v22, OS_LOG_TYPE_ERROR, "Unsupported response code: %@", buf, 0xCu);
      }

      int v23 = (void *)MEMORY[0x263F087E8];
      uint64_t v24 = GEOErrorDomain();
      uint64_t v43 = *MEMORY[0x263F08320];
      __int16 v25 = objc_msgSend(NSString, "stringWithFormat:", @"Intent response with unsupported code: %ld", objc_msgSend(v15, "code"));
      id v44 = v25;
      int v26 = [NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
      uint64_t v27 = [v23 errorWithDomain:v24 code:-11 userInfo:v26];

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      [*(id *)(a1 + 32) reset];
    }
  }
  else
  {
    id v14 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v48 = "-[VGOEMApplication getStateOfChargeForVehicle:completion:]_block_invoke";
      __int16 v49 = 1024;
      int v50 = 365;
      _os_log_impl(&dword_214A2C000, v14, OS_LOG_TYPE_ERROR, "strongSelf3 went away in %s line %d", buf, 0x12u);
    }
  }
LABEL_21:
}

void __58__VGOEMApplication_getStateOfChargeForVehicle_completion___block_invoke_48(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) underlyingError];

  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 72);
    id v4 = [*(id *)(a1 + 32) underlyingError];
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);

    id v5 = VGGetOEMApplicationLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = [*(id *)(a1 + 32) underlyingError];
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_ERROR, "Returning because of an underlying error in the connection: %@", buf, 0xCu);
    }
  }
  else
  {
    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    id v16 = 0;
    os_signpost_id_t v9 = [v7 _vehicleStateFromResponse:v8 error:&v16];
    id v5 = v16;
    if (v9)
    {
      os_signpost_id_t v10 = [v9 identifier];
      uint64_t v11 = [*(id *)(a1 + 56) siriIntentsIdentifier];
      char v12 = [v10 isEqualToString:v11];

      if ((v12 & 1) == 0)
      {
        id v13 = VGGetOEMApplicationLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          uint64_t v14 = *(void *)(a1 + 56);
          *(_DWORD *)buf = 138412546;
          id v18 = v9;
          __int16 v19 = 2112;
          uint64_t v20 = v14;
          _os_log_impl(&dword_214A2C000, v13, OS_LOG_TYPE_FAULT, "Received a vehicle state: %@ that doesn't apply to the provided vehicle: %@", buf, 0x16u);
        }

        os_signpost_id_t v9 = 0;
      }
    }
    id v15 = VGGetOEMApplicationLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v9;
      _os_log_impl(&dword_214A2C000, v15, OS_LOG_TYPE_INFO, "getStateOfChargeForVehicle fetched %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    [*(id *)(a1 + 64) reset];
  }
}

- (void)_createChargeStreamingConnectionIfNeededForVehicle:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    objc_initWeak((id *)location, self);
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __71__VGOEMApplication__createChargeStreamingConnectionIfNeededForVehicle___block_invoke;
    v7[3] = &unk_264226208;
    objc_copyWeak(&v9, (id *)location);
    id v8 = v4;
    dispatch_async(queue, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v6 = VGGetAssertLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446722;
      *(void *)&location[4] = "-[VGOEMApplication _createChargeStreamingConnectionIfNeededForVehicle:]";
      __int16 v11 = 2082;
      char v12 = "vehicle == nil";
      __int16 v13 = 2082;
      uint64_t v14 = "Vehicle cannot be nil";
      _os_log_impl(&dword_214A2C000, v6, OS_LOG_TYPE_ERROR, "%{public}s forbids: %{public}s. %{public}s", location, 0x20u);
    }
  }
}

void __71__VGOEMApplication__createChargeStreamingConnectionIfNeededForVehicle___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (!WeakRetained)
  {
    id v7 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315394;
      id v16 = "-[VGOEMApplication _createChargeStreamingConnectionIfNeededForVehicle:]_block_invoke";
      __int16 v17 = 1024;
      LODWORD(v18) = 423;
      _os_log_impl(&dword_214A2C000, v7, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v15, 0x12u);
    }
    goto LABEL_12;
  }
  if (!WeakRetained[2] && [WeakRetained isEnabled])
  {
    id v4 = objc_alloc(MEMORY[0x263F0FFA0]);
    id v5 = [*(id *)(a1 + 32) siriIntentsIdentifier];
    id v6 = [*(id *)(a1 + 32) displayName];
    id v7 = [v4 initWithVocabularyIdentifier:v5 spokenPhrase:v6 pronunciationHint:0];

    id v8 = (char *)[objc_alloc(MEMORY[0x263F0FB10]) initWithCarName:v7];
    uint64_t v9 = [objc_alloc(MEMORY[0x263F502A8]) initWithIntent:v8];
    id v10 = v3[2];
    v3[2] = (id)v9;

    [v3[2] setRequiresTCC:0];
    __int16 v11 = [v3 identifier];
    char v12 = [v3[2] intent];
    [v12 _setLaunchId:v11];

    if (GEOConfigGetBOOL())
    {
      __int16 v13 = [MEMORY[0x263F41B90] sharedPlatform];
      objc_msgSend(v3[2], "setRequiresTrustCheck:", objc_msgSend(v13, "isInternalInstall") ^ 1);
    }
    else
    {
      [v3[2] setRequiresTrustCheck:0];
    }
    uint64_t v14 = VGGetOEMApplicationLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412546;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_214A2C000, v14, OS_LOG_TYPE_INFO, "Started a new Intent %@ with %@", (uint8_t *)&v15, 0x16u);
    }

LABEL_12:
  }
}

- (void)startSendingChargeUpdatesForVehicle:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    id v6 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      id v7 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      int v15 = v7;
      _os_log_impl(&dword_214A2C000, v6, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
    id v8 = VGGetOEMApplicationLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [(VGOEMApplication *)self identifier];
      *(_DWORD *)buf = 138412290;
      int v15 = v9;
      _os_log_impl(&dword_214A2C000, v8, OS_LOG_TYPE_INFO, "%@ starting updates", buf, 0xCu);
    }
    [(VGOEMApplication *)self _createChargeStreamingConnectionIfNeededForVehicle:v5];
    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__VGOEMApplication_startSendingChargeUpdatesForVehicle___block_invoke;
    block[3] = &unk_2642260C8;
    objc_copyWeak(&v13, (id *)buf);
    dispatch_async(queue, block);
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    __int16 v11 = VGGetAssertLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      int v15 = "-[VGOEMApplication startSendingChargeUpdatesForVehicle:]";
      __int16 v16 = 2082;
      __int16 v17 = "vehicle == nil";
      __int16 v18 = 2082;
      uint64_t v19 = "Vehicle cannot be nil";
      _os_log_impl(&dword_214A2C000, v11, OS_LOG_TYPE_ERROR, "%{public}s forbids: %{public}s. %{public}s", buf, 0x20u);
    }
  }
}

void __56__VGOEMApplication_startSendingChargeUpdatesForVehicle___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = (void *)*((void *)WeakRetained + 2);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __56__VGOEMApplication_startSendingChargeUpdatesForVehicle___block_invoke_54;
    v6[3] = &unk_2642267D0;
    objc_copyWeak(&v7, v1);
    [v4 resumeWithCompletionHandler:v6];
    objc_destroyWeak(&v7);
  }
  else
  {
    id v5 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v9 = "-[VGOEMApplication startSendingChargeUpdatesForVehicle:]_block_invoke";
      __int16 v10 = 1024;
      int v11 = 449;
      _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }
}

void __56__VGOEMApplication_startSendingChargeUpdatesForVehicle___block_invoke_54(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6)
    {
      id v8 = VGGetOEMApplicationLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = [v6 localizedDescription];
        int v11 = 138412290;
        uint64_t v12 = v9;
        _os_log_impl(&dword_214A2C000, v8, OS_LOG_TYPE_ERROR, "Connection error while receiving updates: %@", (uint8_t *)&v11, 0xCu);
      }
    }
    [v5 startSendingUpdatesToObserver:WeakRetained];
  }
  else
  {
    __int16 v10 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      uint64_t v12 = "-[VGOEMApplication startSendingChargeUpdatesForVehicle:]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 452;
      _os_log_impl(&dword_214A2C000, v10, OS_LOG_TYPE_ERROR, "strongSelf2 went away in %s line %d", (uint8_t *)&v11, 0x12u);
    }
  }
}

- (void)stopSendingChargeUpdatesForVehicle:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    id v6 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      id v7 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v7;
      _os_log_impl(&dword_214A2C000, v6, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
    id v8 = VGGetOEMApplicationLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [(VGOEMApplication *)self identifier];
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v9;
      _os_log_impl(&dword_214A2C000, v8, OS_LOG_TYPE_INFO, "%@ stopping updates", buf, 0xCu);
    }
    [(VGOEMApplication *)self _createChargeStreamingConnectionIfNeededForVehicle:v5];
    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__VGOEMApplication_stopSendingChargeUpdatesForVehicle___block_invoke;
    block[3] = &unk_2642260C8;
    objc_copyWeak(&v13, (id *)buf);
    dispatch_async(queue, block);
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    int v11 = VGGetAssertLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v15 = "-[VGOEMApplication stopSendingChargeUpdatesForVehicle:]";
      __int16 v16 = 2082;
      __int16 v17 = "vehicle == nil";
      __int16 v18 = 2082;
      uint64_t v19 = "Vehicle cannot be nil";
      _os_log_impl(&dword_214A2C000, v11, OS_LOG_TYPE_ERROR, "%{public}s forbids: %{public}s. %{public}s", buf, 0x20u);
    }
  }
}

void __55__VGOEMApplication_stopSendingChargeUpdatesForVehicle___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = (void *)*((void *)WeakRetained + 2);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __55__VGOEMApplication_stopSendingChargeUpdatesForVehicle___block_invoke_55;
    v6[3] = &unk_2642267D0;
    objc_copyWeak(&v7, v1);
    [v4 resumeWithCompletionHandler:v6];
    objc_destroyWeak(&v7);
  }
  else
  {
    id v5 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v9 = "-[VGOEMApplication stopSendingChargeUpdatesForVehicle:]_block_invoke";
      __int16 v10 = 1024;
      int v11 = 473;
      _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }
}

void __55__VGOEMApplication_stopSendingChargeUpdatesForVehicle___block_invoke_55(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6)
    {
      id v8 = VGGetOEMApplicationLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = [v6 localizedDescription];
        int v11 = 138412290;
        uint64_t v12 = v9;
        _os_log_impl(&dword_214A2C000, v8, OS_LOG_TYPE_ERROR, "Connection error while receiving updates: %@", (uint8_t *)&v11, 0xCu);
      }
    }
    [v5 stopSendingUpdates];
    [WeakRetained[2] reset];
    __int16 v10 = WeakRetained[2];
    WeakRetained[2] = 0;
  }
  else
  {
    __int16 v10 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      uint64_t v12 = "-[VGOEMApplication stopSendingChargeUpdatesForVehicle:]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 475;
      _os_log_impl(&dword_214A2C000, v10, OS_LOG_TYPE_ERROR, "strongSelf2 went away in %s line %d", (uint8_t *)&v11, 0x12u);
    }
  }
}

- (void)intentResponseDidUpdate:(id)a3 withSerializedCacheItems:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chargeStreamingDelegate);
  if (WeakRetained)
  {
    objc_initWeak((id *)location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__VGOEMApplication_intentResponseDidUpdate_withSerializedCacheItems___block_invoke;
    block[3] = &unk_2642261B8;
    objc_copyWeak(&v12, (id *)location);
    id v10 = v5;
    id v11 = WeakRetained;
    dispatch_async(queue, block);

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v8 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315394;
      *(void *)&location[4] = "-[VGOEMApplication intentResponseDidUpdate:withSerializedCacheItems:]";
      __int16 v14 = 1024;
      int v15 = 490;
      _os_log_impl(&dword_214A2C000, v8, OS_LOG_TYPE_ERROR, "strongChargeStreamingDelegate went away in %s line %d", location, 0x12u);
    }
  }
}

void __69__VGOEMApplication_intentResponseDidUpdate_withSerializedCacheItems___block_invoke(id *a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    uint64_t v3 = VGGetOEMApplicationLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = [WeakRetained identifier];
      id v5 = a1[4];
      *(_DWORD *)buf = 138412546;
      uint64_t v24 = v4;
      __int16 v25 = 2112;
      id v26 = v5;
      _os_log_impl(&dword_214A2C000, v3, OS_LOG_TYPE_INFO, "%@ received INGetCarPowerLevelStatusResponse live update: %@", buf, 0x16u);
    }
    if ([WeakRetained isEnabled])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = a1[4];
        if (objc_opt_respondsToSelector())
        {
          id v7 = v6;
          if ([v7 code] == 4)
          {

            goto LABEL_21;
          }
          uint64_t v17 = [v7 code];

          if (v17 == 5)
          {
LABEL_21:
            __int16 v13 = VGGetOEMApplicationLog();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              uint64_t v18 = [v7 code];
              *(_DWORD *)buf = 134217984;
              uint64_t v24 = (const char *)v18;
              __int16 v14 = "Unsupported response code: %ld";
              int v15 = v13;
              uint32_t v16 = 12;
              goto LABEL_23;
            }
LABEL_24:

            goto LABEL_25;
          }
          if ([WeakRetained _isValidConsumptionModelForResponse:v7])
          {
            id v19 = a1[4];
            id v22 = 0;
            uint64_t v20 = [WeakRetained _vehicleStateFromResponse:v19 error:&v22];
            __int16 v13 = v22;
            if (v20)
            {
              [a1[5] vehicleStateUpdated:v20];
            }
            else
            {
              uint64_t v21 = VGGetOEMApplicationLog();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v24 = (const char *)v13;
                _os_log_impl(&dword_214A2C000, v21, OS_LOG_TYPE_ERROR, "Response failed to deserialize to a valid VGVehicleState %@", buf, 0xCu);
              }
            }
            goto LABEL_24;
          }
          __int16 v13 = VGGetOEMApplicationLog();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            goto LABEL_24;
          }
          *(_WORD *)buf = 0;
          __int16 v14 = "Formula from the response is invalid";
        }
        else
        {
          __int16 v13 = VGGetOEMApplicationLog();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            goto LABEL_24;
          }
          *(_WORD *)buf = 0;
          __int16 v14 = "chargeStreamingDelegate does not implement required method vehicleStateUpdated:";
        }
        int v15 = v13;
        uint32_t v16 = 2;
LABEL_23:
        _os_log_impl(&dword_214A2C000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
        goto LABEL_24;
      }
      id v6 = VGGetOEMApplicationLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        uint64_t v24 = (const char *)v12;
        id v8 = "Unexpected streaming response class. Received an %@ instance";
        uint64_t v9 = v6;
        uint32_t v10 = 12;
        goto LABEL_16;
      }
    }
    else
    {
      id v11 = VGGetOEMApplicationLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_214A2C000, v11, OS_LOG_TYPE_ERROR, "Received stream callback when disabled", buf, 2u);
      }

      [WeakRetained[2] reset];
      id v6 = WeakRetained[2];
      WeakRetained[2] = 0;
    }
  }
  else
  {
    id v6 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v24 = "-[VGOEMApplication intentResponseDidUpdate:withSerializedCacheItems:]_block_invoke";
      __int16 v25 = 1024;
      LODWORD(v26) = 494;
      id v8 = "strongSelf went away in %s line %d";
      uint64_t v9 = v6;
      uint32_t v10 = 18;
LABEL_16:
      _os_log_impl(&dword_214A2C000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
    }
  }
LABEL_25:
}

- (id)_connectionWithIntent:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    id v7 = (VGOEMApplication *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v7;
    _os_log_impl(&dword_214A2C000, v6, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  id v8 = [(VGOEMApplication *)self identifier];
  [v5 _setLaunchId:v8];

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F502A8]) initWithIntent:v5];
  [v9 setRequiresTCC:0];
  if (GEOConfigGetBOOL())
  {
    uint32_t v10 = [MEMORY[0x263F41B90] sharedPlatform];
    objc_msgSend(v9, "setRequiresTrustCheck:", objc_msgSend(v10, "isInternalInstall") ^ 1);
  }
  else
  {
    [v9 setRequiresTrustCheck:0];
  }
  GEOConfigGetDouble();
  double v12 = v11;
  __int16 v13 = VGGetOEMApplicationLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = self;
    __int16 v19 = 2048;
    double v20 = v12;
    _os_log_impl(&dword_214A2C000, v13, OS_LOG_TYPE_INFO, "Creating connection for OEMApp: (%@), with timeout %.2f", buf, 0x16u);
  }

  [v9 setRequestTimeoutInterval:v12];
  objc_initWeak((id *)buf, self);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __42__VGOEMApplication__connectionWithIntent___block_invoke;
  v15[3] = &unk_2642267F8;
  objc_copyWeak(&v16, (id *)buf);
  [v9 setTimeoutHandler:v15];
  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);

  return v9;
}

void __42__VGOEMApplication__connectionWithIntent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = VGGetOEMApplicationLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412546;
      uint32_t v10 = WeakRetained;
      __int16 v11 = 2112;
      id v12 = v3;
      id v6 = "Connection for OEMApp: (%@), timed out with error: %@";
      id v7 = v5;
      uint32_t v8 = 22;
LABEL_6:
      _os_log_impl(&dword_214A2C000, v7, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v9, v8);
    }
  }
  else
  {
    id v5 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      uint32_t v10 = "-[VGOEMApplication _connectionWithIntent:]_block_invoke";
      __int16 v11 = 1024;
      LODWORD(v12) = 553;
      id v6 = "strongSelf went away in %s line %d";
      id v7 = v5;
      uint32_t v8 = 18;
      goto LABEL_6;
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(VGOEMApplication *)self identifier];
    id v6 = [v4 identifier];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"Identifier: %@", self->_identifier];
}

- (LSApplicationRecord)applicationRecord
{
  return self->_applicationRecord;
}

- (VGOEMAppSOCStreaming)chargeStreamingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chargeStreamingDelegate);

  return (VGOEMAppSOCStreaming *)WeakRetained;
}

- (void)setChargeStreamingDelegate:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)allowedFormulaIDs
{
  return self->_allowedFormulaIDs;
}

- (void)setAllowedFormulaIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedFormulaIDs, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_chargeStreamingDelegate);
  objc_storeStrong((id *)&self->_applicationRecord, 0);
  objc_storeStrong((id *)&self->_chargeStreamingConnection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end