@interface VGExternalAccessoryState
- (BOOL)isCharging;
- (NSDictionary)powerByConnector;
- (NSMeasurement)currentBatteryCapacity;
- (NSMeasurement)currentEVRange;
- (NSMeasurement)maxBatteryCapacity;
- (NSMeasurement)maxEVRange;
- (NSMeasurement)minBatteryCapacity;
- (NSNumber)activeConnector;
- (NSNumber)batteryCharge;
- (NSNumber)supportedConnectors;
- (NSString)chargingArguments;
- (NSString)colorHex;
- (NSString)consumptionArguments;
- (NSString)manufacturer;
- (NSString)model;
- (NSString)name;
- (NSString)year;
- (id)description;
- (void)_updateWithVehicleInfo:(id)a3;
- (void)setBatteryCharge:(id)a3;
- (void)setChargingArguments:(id)a3;
- (void)setColorHex:(id)a3;
- (void)setConsumptionArguments:(id)a3;
- (void)setCurrentBatteryCapacity:(id)a3;
- (void)setCurrentEVRange:(id)a3;
- (void)setManufacturer:(id)a3;
- (void)setMaxBatteryCapacity:(id)a3;
- (void)setMaxEVRange:(id)a3;
- (void)setMinBatteryCapacity:(id)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setSupportedConnectors:(id)a3;
- (void)setYear:(id)a3;
@end

@implementation VGExternalAccessoryState

- (void)_updateWithVehicleInfo:(id)a3
{
  uint64_t v128 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F04EF8];
  v6 = [v4 objectForKeyedSubscript:*MEMORY[0x263F04EF8]];

  if (v6)
  {
    v7 = [v4 objectForKeyedSubscript:v5];
    v8 = (NSString *)[v7 copy];
    displayName = self->_displayName;
    self->_displayName = v8;
  }
  uint64_t v10 = *MEMORY[0x263F04F18];
  v11 = [v4 objectForKeyedSubscript:*MEMORY[0x263F04F18]];

  if (v11)
  {
    v12 = [v4 objectForKeyedSubscript:v10];
    v13 = (NSString *)[v12 copy];
    mapsDisplayName = self->_mapsDisplayName;
    self->_mapsDisplayName = v13;
  }
  uint64_t v15 = *MEMORY[0x263F04F10];
  v16 = [v4 objectForKeyedSubscript:*MEMORY[0x263F04F10]];

  if (v16)
  {
    v17 = [v4 objectForKeyedSubscript:v15];
    v18 = (NSString *)[v17 copy];
    manufacturer = self->_manufacturer;
    self->_manufacturer = v18;
  }
  uint64_t v20 = *MEMORY[0x263F04F38];
  v21 = [v4 objectForKeyedSubscript:*MEMORY[0x263F04F38]];

  if (v21)
  {
    v22 = [v4 objectForKeyedSubscript:v20];
    v23 = (NSString *)[v22 copy];
    model = self->_model;
    self->_model = v23;
  }
  uint64_t v25 = *MEMORY[0x263F04F98];
  v26 = [v4 objectForKeyedSubscript:*MEMORY[0x263F04F98]];

  if (v26)
  {
    v27 = [v4 objectForKeyedSubscript:v25];
    v28 = (NSString *)[v27 copy];
    year = self->_year;
    self->_year = v28;
  }
  uint64_t v30 = *MEMORY[0x263F04F90];
  v31 = [v4 objectForKeyedSubscript:*MEMORY[0x263F04F90]];

  if (v31)
  {
    v32 = [v4 objectForKeyedSubscript:v30];
    v33 = (NSString *)[v32 copy];
    colorHex = self->_colorHex;
    self->_colorHex = v33;
  }
  uint64_t v35 = *MEMORY[0x263F04F28];
  v36 = [v4 objectForKeyedSubscript:*MEMORY[0x263F04F28]];

  unint64_t v37 = 0x263F08000uLL;
  if (v36)
  {
    v38 = [v4 objectForKeyedSubscript:v35];
    [v38 doubleValue];
    double v40 = v39;

    id v41 = objc_alloc(MEMORY[0x263F08980]);
    v42 = [MEMORY[0x263F08CE8] kilometers];
    v43 = (NSMeasurement *)[v41 initWithDoubleValue:v42 unit:v40];
    maxEVRange = self->_maxEVRange;
    self->_maxEVRange = v43;
  }
  uint64_t v45 = *MEMORY[0x263F04EE8];
  v46 = [v4 objectForKeyedSubscript:*MEMORY[0x263F04EE8]];

  if (v46)
  {
    v47 = [v4 objectForKeyedSubscript:v45];
    v48 = (NSString *)[v47 copy];
    consumptionArguments = self->_consumptionArguments;
    self->_consumptionArguments = v48;
  }
  uint64_t v50 = *MEMORY[0x263F04EE0];
  v51 = [v4 objectForKeyedSubscript:*MEMORY[0x263F04EE0]];

  if (v51)
  {
    v52 = [v4 objectForKeyedSubscript:v50];
    v53 = (NSString *)[v52 copy];
    chargingArguments = self->_chargingArguments;
    self->_chargingArguments = v53;
  }
  uint64_t v55 = *MEMORY[0x263F04F00];
  v56 = [v4 objectForKeyedSubscript:*MEMORY[0x263F04F00]];

  if (v56)
  {
    v57 = [v4 objectForKeyedSubscript:v55];
    v58 = NSNumber;
    [v57 doubleValue];
    v60 = [v58 numberWithDouble:v59 / 100000.0];
    batteryCharge = self->_batteryCharge;
    self->_batteryCharge = v60;
  }
  uint64_t v62 = *MEMORY[0x263F04F30];
  v63 = [v4 objectForKeyedSubscript:*MEMORY[0x263F04F30]];

  if (v63)
  {
    v64 = [v4 objectForKeyedSubscript:v62];
    [v64 doubleValue];
    double v66 = v65 / 1000.0;

    id v67 = objc_alloc(MEMORY[0x263F08980]);
    v68 = [MEMORY[0x263F08CC0] kilowattHours];
    v69 = (NSMeasurement *)[v67 initWithDoubleValue:v68 unit:v66];
    minBatteryCapacity = self->_minBatteryCapacity;
    self->_minBatteryCapacity = v69;
  }
  uint64_t v71 = *MEMORY[0x263F04EF0];
  v72 = [v4 objectForKeyedSubscript:*MEMORY[0x263F04EF0]];

  if (v72)
  {
    v73 = [v4 objectForKeyedSubscript:v71];
    [v73 doubleValue];
    double v75 = v74 / 1000.0;

    id v76 = objc_alloc(MEMORY[0x263F08980]);
    v77 = [MEMORY[0x263F08CC0] kilowattHours];
    v78 = (NSMeasurement *)[v76 initWithDoubleValue:v77 unit:v75];
    currentBatteryCapacity = self->_currentBatteryCapacity;
    self->_currentBatteryCapacity = v78;
  }
  uint64_t v80 = *MEMORY[0x263F04F20];
  v81 = [v4 objectForKeyedSubscript:*MEMORY[0x263F04F20]];

  if (v81)
  {
    v82 = [v4 objectForKeyedSubscript:v80];
    [v82 doubleValue];
    double v84 = v83 / 1000.0;

    id v85 = objc_alloc(MEMORY[0x263F08980]);
    v86 = [MEMORY[0x263F08CC0] kilowattHours];
    v87 = (NSMeasurement *)[v85 initWithDoubleValue:v86 unit:v84];
    maxBatteryCapacity = self->_maxBatteryCapacity;
    self->_maxBatteryCapacity = v87;
  }
  uint64_t v89 = *MEMORY[0x263F04F88];
  v90 = [v4 objectForKeyedSubscript:*MEMORY[0x263F04F88]];

  if (v90) {
    self->_supportedConnectors = (NSNumber *)(id)[v4 objectForKeyedSubscript:v89];
  }
  powerByConnector = self->_powerByConnector;
  if (powerByConnector) {
    uint64_t v92 = [(NSDictionary *)powerByConnector mutableCopy];
  }
  else {
    uint64_t v92 = objc_opt_new();
  }
  v121 = self;
  v122 = (void *)v92;
  if (qword_26AB30F98 != -1) {
    dispatch_once(&qword_26AB30F98, &__block_literal_global_2);
  }
  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  id v93 = (id)_MergedGlobals_2;
  uint64_t v94 = [v93 countByEnumeratingWithState:&v123 objects:v127 count:16];
  if (v94)
  {
    uint64_t v95 = v94;
    uint64_t v96 = *(void *)v124;
    do
    {
      for (uint64_t i = 0; i != v95; ++i)
      {
        if (*(void *)v124 != v96) {
          objc_enumerationMutation(v93);
        }
        uint64_t v98 = *(void *)(*((void *)&v123 + 1) + 8 * i);
        v99 = objc_msgSend(v4, "objectForKeyedSubscript:", v98, v121);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v99 doubleValue];
          double v101 = v100;
          id v102 = v4;
          id v103 = objc_alloc(*(Class *)(v37 + 2432));
          [MEMORY[0x263F08D08] watts];
          v105 = unint64_t v104 = v37;
          v106 = (void *)[v103 initWithDoubleValue:v105 unit:v101];
          v107 = [(id)_MergedGlobals_2 objectForKeyedSubscript:v98];
          [v122 setObject:v106 forKeyedSubscript:v107];

          id v4 = v102;
          unint64_t v37 = v104;
        }
      }
      uint64_t v95 = [v93 countByEnumeratingWithState:&v123 objects:v127 count:16];
    }
    while (v95);
  }

  uint64_t v108 = [v122 copy];
  v109 = v121;
  v110 = v121->_powerByConnector;
  v121->_powerByConnector = (NSDictionary *)v108;

  uint64_t v111 = *MEMORY[0x263F04F08];
  uint64_t v112 = [v4 objectForKeyedSubscript:*MEMORY[0x263F04F08]];
  if (v112)
  {
    v113 = (void *)v112;
    v114 = [v4 objectForKeyedSubscript:v111];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v116 = [v4 objectForKeyedSubscript:v111];
      v121->_isCharging = [v116 BOOLValue];
    }
  }
  uint64_t v117 = *MEMORY[0x263F04ED8];
  v118 = objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x263F04ED8], v121);

  if (v118)
  {
    uint64_t v119 = [v4 objectForKeyedSubscript:v117];
    activeConnector = v109->_activeConnector;
    v109->_activeConnector = (NSNumber *)v119;
  }
}

void __51__VGExternalAccessoryState__updateWithVehicleInfo___block_invoke()
{
  v7[9] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F04F48];
  v6[0] = *MEMORY[0x263F04F40];
  v6[1] = v0;
  v7[0] = &unk_26C597340;
  v7[1] = &unk_26C597358;
  uint64_t v1 = *MEMORY[0x263F04F50];
  v6[2] = *MEMORY[0x263F04F68];
  v6[3] = v1;
  v7[2] = &unk_26C597370;
  v7[3] = &unk_26C597388;
  uint64_t v2 = *MEMORY[0x263F04F60];
  v6[4] = *MEMORY[0x263F04F70];
  v6[5] = v2;
  v7[4] = &unk_26C5973A0;
  v7[5] = &unk_26C5973B8;
  uint64_t v3 = *MEMORY[0x263F04F80];
  v6[6] = *MEMORY[0x263F04F58];
  v6[7] = v3;
  v7[6] = &unk_26C5973D0;
  v7[7] = &unk_26C5973E8;
  v6[8] = *MEMORY[0x263F04F78];
  v7[8] = &unk_26C597400;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:9];
  uint64_t v5 = (void *)_MergedGlobals_2;
  _MergedGlobals_2 = v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@:%p, _displayName=%@, _mapsDisplayName=%@>", v5, self, self->_displayName, self->_mapsDisplayName];

  return v6;
}

- (NSString)name
{
  displayName = self->_displayName;
  if (!displayName) {
    displayName = self->_mapsDisplayName;
  }
  return displayName;
}

- (void)setName:(id)a3
{
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (void)setManufacturer:(id)a3
{
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSString)year
{
  return self->_year;
}

- (void)setYear:(id)a3
{
}

- (NSString)colorHex
{
  return self->_colorHex;
}

- (void)setColorHex:(id)a3
{
}

- (NSMeasurement)currentEVRange
{
  return self->_currentEVRange;
}

- (void)setCurrentEVRange:(id)a3
{
}

- (NSMeasurement)maxEVRange
{
  return self->_maxEVRange;
}

- (void)setMaxEVRange:(id)a3
{
}

- (NSString)consumptionArguments
{
  return self->_consumptionArguments;
}

- (void)setConsumptionArguments:(id)a3
{
}

- (NSString)chargingArguments
{
  return self->_chargingArguments;
}

- (void)setChargingArguments:(id)a3
{
}

- (NSNumber)batteryCharge
{
  return self->_batteryCharge;
}

- (void)setBatteryCharge:(id)a3
{
}

- (NSMeasurement)minBatteryCapacity
{
  return self->_minBatteryCapacity;
}

- (void)setMinBatteryCapacity:(id)a3
{
}

- (NSMeasurement)currentBatteryCapacity
{
  return self->_currentBatteryCapacity;
}

- (void)setCurrentBatteryCapacity:(id)a3
{
}

- (NSMeasurement)maxBatteryCapacity
{
  return self->_maxBatteryCapacity;
}

- (void)setMaxBatteryCapacity:(id)a3
{
}

- (NSNumber)supportedConnectors
{
  return self->_supportedConnectors;
}

- (void)setSupportedConnectors:(id)a3
{
  self->_supportedConnectors = (NSNumber *)a3;
}

- (BOOL)isCharging
{
  return self->_isCharging;
}

- (NSNumber)activeConnector
{
  return self->_activeConnector;
}

- (NSDictionary)powerByConnector
{
  return self->_powerByConnector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerByConnector, 0);
  objc_storeStrong((id *)&self->_activeConnector, 0);
  objc_storeStrong((id *)&self->_maxBatteryCapacity, 0);
  objc_storeStrong((id *)&self->_currentBatteryCapacity, 0);
  objc_storeStrong((id *)&self->_minBatteryCapacity, 0);
  objc_storeStrong((id *)&self->_batteryCharge, 0);
  objc_storeStrong((id *)&self->_chargingArguments, 0);
  objc_storeStrong((id *)&self->_consumptionArguments, 0);
  objc_storeStrong((id *)&self->_maxEVRange, 0);
  objc_storeStrong((id *)&self->_currentEVRange, 0);
  objc_storeStrong((id *)&self->_colorHex, 0);
  objc_storeStrong((id *)&self->_year, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mapsDisplayName, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

@end