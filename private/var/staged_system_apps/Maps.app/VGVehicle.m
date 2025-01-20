@interface VGVehicle
- (BOOL)isLPRWithElectricEngine;
- (LSApplicationRecord)applicationRecord;
- (id)evChargingPorts;
- (id)updatedTraitsFrom:(id)a3;
@end

@implementation VGVehicle

- (LSApplicationRecord)applicationRecord
{
  objc_getAssociatedObject(self, a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    id v5 = objc_alloc((Class)LSApplicationRecord);
    v6 = [(VGVehicle *)self pairedAppIdentifier];
    id v4 = [v5 initWithBundleIdentifier:v6 allowPlaceholder:0 error:0];

    objc_setAssociatedObject(self, a2, v4, (void *)1);
  }

  return (LSApplicationRecord *)v4;
}

- (id)evChargingPorts
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = [(VGVehicle *)self powerByConnector];
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        [v9 unsignedIntegerValue];
        uint64_t v10 = GEOEvChargingConnectorTypeFromVGConnectorType();
        if (v10)
        {
          uint64_t v11 = v10;
          v12 = [(VGVehicle *)self powerByConnector];
          v13 = [v12 objectForKeyedSubscript:v9];

          id v14 = objc_alloc_init((Class)GEOPDEvChargingPort);
          [v14 setChargingConnectorType:v11];
          v15 = +[NSUnitPower watts];
          v16 = [v13 measurementByConvertingToUnit:v15];
          [v16 doubleValue];
          [v14 setPower:v17];

          [v3 addObject:v14];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BOOL)isLPRWithElectricEngine
{
  id v3 = [(VGVehicle *)self lprVehicleType];
  if (v3)
  {
    id v4 = [(VGVehicle *)self lprPowerType];
    unsigned __int8 v5 = [v4 isEqualToString:@"EV"];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)updatedTraitsFrom:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(VGVehicle *)self evChargingPorts];
  [v4 setEvChargingPorts:v5];

  [v4 clearEngineTypes];
  id v6 = +[MapsExternalDevice sharedInstance];
  unsigned int v7 = [v6 engineTypes];

  if (v7)
  {
    [v4 addEngineType:1];
    if ((v7 & 0x1000000) == 0)
    {
LABEL_3:
      if ((v7 & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else if ((v7 & 0x1000000) == 0)
  {
    goto LABEL_3;
  }
  [v4 addEngineType:4];
  if ((v7 & 0x100) == 0)
  {
LABEL_4:
    if ((v7 & 0x10000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
LABEL_8:
  [v4 addEngineType:2];
  if ((v7 & 0x10000) != 0)
  {
LABEL_11:
    [v4 addEngineType:3];
    goto LABEL_12;
  }
LABEL_9:
  if (([(VGVehicle *)self isPureElectricVehicle] & 1) != 0
    || [(VGVehicle *)self isLPRWithElectricEngine])
  {
    goto LABEL_11;
  }
LABEL_12:
  [v4 clearPreferredBrands];
  v8 = +[NSMutableSet set];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v9 = [(VGVehicle *)self preferredChargingNetworks];
  id v10 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [*(id *)(*((void *)&v25 + 1) + 8 * i) globalBrandID]);
        [v8 addObject:v14];
      }
      id v11 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v11);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v15 = v8;
  id v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        [v4 addPreferredBrand:[*(id *)(*((void *)&v21 + 1) + 8 * (void)j) unsignedLongLongValue][v21]];
      }
      id v17 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v17);
  }

  return v4;
}

@end