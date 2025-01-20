@interface WFMeasurementUnit
+ (BOOL)usesMetricSystemForUnitType:(id)a3;
+ (Class)unitClassForUnitType:(id)a3;
+ (id)availableUnitTypes;
+ (id)availableUnitsForUnitType:(id)a3;
+ (id)defaultUnitForUnitType:(id)a3;
+ (id)linkValueTypeFromWorkflowUnitType:(id)a3;
+ (id)localizedStringForUnitType:(id)a3;
+ (id)unitFromString:(id)a3;
+ (id)unitFromString:(id)a3 unitType:(id)a4 caseSensitive:(BOOL)a5;
+ (id)unitTypeForUnitClass:(Class)a3;
+ (id)unitTypeFromIntentSlotValueType:(int64_t)a3;
+ (id)unitTypeFromLinkMeasurementUnitType:(int64_t)a3;
+ (id)unitTypeMap;
+ (int64_t)linkMeasurementUnitTypeFromWorkflowUnitType:(id)a3;
@end

@implementation WFMeasurementUnit

+ (id)linkValueTypeFromWorkflowUnitType:(id)a3
{
  v3 = (__CFString *)a3;
  v4 = v3;
  if (v3 == @"Length")
  {
    uint64_t v5 = [MEMORY[0x1E4F72CD0] lengthValueType];
  }
  else if (v3 == @"Mass")
  {
    uint64_t v5 = [MEMORY[0x1E4F72CD0] massValueType];
  }
  else if (v3 == @"Temperature")
  {
    uint64_t v5 = [MEMORY[0x1E4F72CD0] temperatureValueType];
  }
  else if (v3 == @"Volume")
  {
    uint64_t v5 = [MEMORY[0x1E4F72CD0] volumeValueType];
  }
  else if (v3 == @"Speed")
  {
    uint64_t v5 = [MEMORY[0x1E4F72CD0] speedValueType];
  }
  else if (v3 == @"Energy")
  {
    uint64_t v5 = [MEMORY[0x1E4F72CD0] energyValueType];
  }
  else if (v3 == @"Duration")
  {
    uint64_t v5 = [MEMORY[0x1E4F72CD0] durationValueType];
  }
  else if (v3 == @"Acceleration")
  {
    uint64_t v5 = [MEMORY[0x1E4F72CD0] accelerationValueType];
  }
  else if (v3 == @"Angle")
  {
    uint64_t v5 = [MEMORY[0x1E4F72CD0] angleValueType];
  }
  else if (v3 == @"Area")
  {
    uint64_t v5 = [MEMORY[0x1E4F72CD0] areaValueType];
  }
  else if (v3 == @"Concentration Mass")
  {
    uint64_t v5 = [MEMORY[0x1E4F72CD0] concentrationMassValueType];
  }
  else if (v3 == @"Dispersion")
  {
    uint64_t v5 = [MEMORY[0x1E4F72CD0] dispersionValueType];
  }
  else if (v3 == @"Electric Charge")
  {
    uint64_t v5 = [MEMORY[0x1E4F72CD0] electricChargeValueType];
  }
  else if (v3 == @"Electric Current")
  {
    uint64_t v5 = [MEMORY[0x1E4F72CD0] electricCurrentValueType];
  }
  else if (v3 == @"Electric Potential Difference")
  {
    uint64_t v5 = [MEMORY[0x1E4F72CD0] electricPotentialDifferenceValueType];
  }
  else if (v3 == @"Electric Resistance")
  {
    uint64_t v5 = [MEMORY[0x1E4F72CD0] electricResistanceValueType];
  }
  else if (v3 == @"Frequency")
  {
    uint64_t v5 = [MEMORY[0x1E4F72CD0] frequencyValueType];
  }
  else if (v3 == @"Fuel Efficiency")
  {
    uint64_t v5 = [MEMORY[0x1E4F72CD0] fuelEfficiencyValueType];
  }
  else if (v3 == @"Illuminance")
  {
    uint64_t v5 = [MEMORY[0x1E4F72CD0] illuminanceValueType];
  }
  else if (v3 == @"Information Storage")
  {
    uint64_t v5 = [MEMORY[0x1E4F72CD0] informationStorageValueType];
  }
  else if (v3 == @"Power")
  {
    uint64_t v5 = [MEMORY[0x1E4F72CD0] powerValueType];
  }
  else
  {
    if (v3 == @"Pressure") {
      [MEMORY[0x1E4F72CD0] pressureValueType];
    }
    else {
    uint64_t v5 = [MEMORY[0x1E4F72CD0] unsupportedMeasurementValueType];
    }
  }
  v6 = (void *)v5;

  return v6;
}

+ (int64_t)linkMeasurementUnitTypeFromWorkflowUnitType:(id)a3
{
  if (a3 == @"Length") {
    return 1;
  }
  if (a3 == @"Mass") {
    return 2;
  }
  if (a3 == @"Temperature") {
    return 3;
  }
  if (a3 == @"Volume") {
    return 4;
  }
  if (a3 == @"Speed") {
    return 5;
  }
  if (a3 == @"Energy") {
    return 6;
  }
  if (a3 == @"Duration") {
    return 7;
  }
  if (a3 == @"Acceleration") {
    return 8;
  }
  if (a3 == @"Angle") {
    return 9;
  }
  if (a3 == @"Area") {
    return 10;
  }
  if (a3 == @"Concentration Mass") {
    return 11;
  }
  if (a3 == @"Dispersion") {
    return 12;
  }
  if (a3 == @"Electric Charge") {
    return 13;
  }
  if (a3 == @"Electric Current") {
    return 14;
  }
  if (a3 == @"Electric Potential Difference") {
    return 15;
  }
  if (a3 == @"Electric Resistance") {
    return 16;
  }
  if (a3 == @"Frequency") {
    return 17;
  }
  if (a3 == @"Fuel Efficiency") {
    return 18;
  }
  if (a3 == @"Illuminance") {
    return 19;
  }
  if (a3 == @"Information Storage") {
    return 20;
  }
  if (a3 == @"Power") {
    return 21;
  }
  if (a3 == @"Pressure") {
    return 22;
  }
  return 0;
}

+ (id)unitTypeFromIntentSlotValueType:(int64_t)a3
{
  id result = 0;
  switch(a3)
  {
    case ' ':
    case '!':
      id result = @"Temperature";
      break;
    case '""':
    case '#':
    case '$':
    case '%':
      return result;
    case '&':
      id result = @"Mass";
      break;
    case '\'':
      id result = @"Volume";
      break;
    case '(':
      id result = @"Speed";
      break;
    case ')':
      id result = @"Energy";
      break;
    default:
      if ((unint64_t)(a3 - 19) >= 2) {
        id result = 0;
      }
      else {
        id result = @"Length";
      }
      break;
  }
  return result;
}

+ (id)unitTypeFromLinkMeasurementUnitType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x15) {
    return 0;
  }
  else {
    return *(&off_1E6077B18 + a3 - 1);
  }
}

+ (id)unitFromString:(id)a3
{
  return (id)[a1 unitFromString:a3 unitType:0 caseSensitive:0];
}

+ (id)unitFromString:(id)a3 unitType:(id)a4 caseSensitive:(BOOL)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v8 length])
  {
    v10 = [v8 stringByReplacingOccurrencesOfString:@"m3" withString:@"m³"];

    id v11 = objc_alloc_init(MEMORY[0x1E4F28E30]);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__WFMeasurementUnit_unitFromString_unitType_caseSensitive___block_invoke;
    aBlock[3] = &unk_1E6077AF8;
    id v31 = a1;
    id v12 = v11;
    id v29 = v12;
    id v8 = v10;
    id v30 = v8;
    BOOL v32 = a5;
    v13 = _Block_copy(aBlock);
    v14 = (void (**)(void, void))v13;
    if (v9)
    {
      v15 = (*((void (**)(void *, id))v13 + 2))(v13, v9);
    }
    else
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      v16 = objc_msgSend(a1, "unitTypeMap", 0);
      v17 = [v16 allKeys];

      uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v33 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v25;
        while (2)
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v25 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = v14[2](v14, *(void *)(*((void *)&v24 + 1) + 8 * i));
            if (v22)
            {
              v15 = (void *)v22;
              goto LABEL_15;
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v33 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }
      v15 = 0;
LABEL_15:
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

id __59__WFMeasurementUnit_unitFromString_unitType_caseSensitive___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 48) availableUnitsForUnitType:a2];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v9 = objc_msgSend(*(id *)(a1 + 32), "stringFromUnit:", v8, (void)v14);
        if (![*(id *)(a1 + 40) compare:v9 options:*(unsigned char *)(a1 + 56) == 0]
          || (v10 = *(void **)(a1 + 40),
              [v8 symbol],
              id v11 = objc_claimAutoreleasedReturnValue(),
              LOBYTE(v10) = [v10 isEqualToString:v11],
              v11,
              (v10 & 1) != 0))
        {
          id v12 = v8;

          goto LABEL_13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      id v12 = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v12 = 0;
  }
LABEL_13:

  return v12;
}

+ (id)defaultUnitForUnitType:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)defaultUnitForUnitType__unitDefaultsMap;
  if (!defaultUnitForUnitType__unitDefaultsMap)
  {
    int v6 = [a1 usesMetricSystemForUnitType:v4];
    v33[0] = @"Acceleration";
    if (v6) {
      [MEMORY[0x1E4F29150] metersPerSecondSquared];
    }
    else {
    BOOL v32 = [MEMORY[0x1E4F29150] gravity];
    }
    v53[0] = v32;
    v33[1] = @"Angle";
    id v31 = [MEMORY[0x1E4F29158] degrees];
    v53[1] = v31;
    v33[2] = @"Area";
    if (v6)
    {
      id v30 = [MEMORY[0x1E4F29160] squareMeters];
      v54 = v30;
      uint64_t v34 = @"Concentration Mass";
      [MEMORY[0x1E4F29168] milligramsPerDeciliter];
    }
    else
    {
      id v30 = [MEMORY[0x1E4F29160] squareFeet];
      v54 = v30;
      uint64_t v34 = @"Concentration Mass";
      [MEMORY[0x1E4F29168] gramsPerLiter];
    id v29 = };
    v55 = v29;
    v35 = @"Dispersion";
    v28 = [MEMORY[0x1E4F29178] partsPerMillion];
    v56 = v28;
    v36 = @"Duration";
    long long v27 = [MEMORY[0x1E4F29180] minutes];
    v57 = v27;
    v37 = @"Electric Charge";
    long long v26 = [MEMORY[0x1E4F29190] ampereHours];
    v58 = v26;
    v38 = @"Electric Current";
    long long v25 = [MEMORY[0x1E4F29198] amperes];
    v59 = v25;
    v39 = @"Electric Potential Difference";
    long long v24 = [MEMORY[0x1E4F291A0] volts];
    v60 = v24;
    v40 = @"Electric Resistance";
    v23 = [MEMORY[0x1E4F291A8] ohms];
    v61 = v23;
    v41 = @"Energy";
    uint64_t v22 = [MEMORY[0x1E4F291B0] joules];
    v62 = v22;
    v42 = @"Frequency";
    v21 = [MEMORY[0x1E4F291B8] hertz];
    v63 = v21;
    v43 = @"Fuel Efficiency";
    if (v6) {
      [MEMORY[0x1E4F291C0] litersPer100Kilometers];
    }
    else {
    uint64_t v20 = [MEMORY[0x1E4F291C0] milesPerGallon];
    }
    v64 = v20;
    v44 = @"Illuminance";
    uint64_t v19 = [MEMORY[0x1E4F291C8] lux];
    v65 = v19;
    v45 = @"Information Storage";
    v7 = [MEMORY[0x1E4F291D0] megabytes];
    v66 = v7;
    v46 = @"Length";
    if (v6)
    {
      id v8 = [MEMORY[0x1E4F291E0] meters];
      v67 = v8;
      v47 = @"Mass";
      [MEMORY[0x1E4F291E8] grams];
    }
    else
    {
      id v8 = [MEMORY[0x1E4F291E0] feet];
      v67 = v8;
      v47 = @"Mass";
      [MEMORY[0x1E4F291E8] poundsMass];
    id v9 = };
    v68 = v9;
    v48 = @"Power";
    v10 = [MEMORY[0x1E4F291F0] watts];
    v69 = v10;
    v49 = @"Pressure";
    if (v6)
    {
      id v11 = [MEMORY[0x1E4F291F8] millibars];
      v70 = v11;
      v50 = @"Speed";
      id v12 = [MEMORY[0x1E4F29208] kilometersPerHour];
      v71 = v12;
      v51 = @"Temperature";
      v13 = [MEMORY[0x1E4F29218] celsius];
      v72 = v13;
      v52 = @"Volume";
      [MEMORY[0x1E4F29228] liters];
    }
    else
    {
      id v11 = [MEMORY[0x1E4F291F8] inchesOfMercury];
      v70 = v11;
      v50 = @"Speed";
      id v12 = [MEMORY[0x1E4F29208] milesPerHour];
      v71 = v12;
      v51 = @"Temperature";
      v13 = [MEMORY[0x1E4F29218] fahrenheit];
      v72 = v13;
      v52 = @"Volume";
      [MEMORY[0x1E4F29228] cups];
    long long v14 = };
    v73 = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v33 count:22];
    long long v16 = (void *)defaultUnitForUnitType__unitDefaultsMap;
    defaultUnitForUnitType__unitDefaultsMap = v15;

    uint64_t v5 = (void *)defaultUnitForUnitType__unitDefaultsMap;
  }
  long long v17 = [v5 objectForKey:v4];

  return v17;
}

+ (BOOL)usesMetricSystemForUnitType:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v5 = [v4 countryCode];
  char v6 = [v5 isEqualToString:@"GB"];

  if (a3 == @"Length" && (v6 & 1) != 0) {
    char v7 = 0;
  }
  else {
    char v7 = [v4 usesMetricSystem];
  }

  return v7;
}

+ (id)availableUnitsForUnitType:(id)a3
{
  v154[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isEqualToString:@"Acceleration"])
  {
    id v4 = [MEMORY[0x1E4F29150] metersPerSecondSquared];
    v154[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F29150] gravity];
    v154[1] = v5;
    char v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v154 count:2];
LABEL_12:

    goto LABEL_13;
  }
  if ([v3 isEqualToString:@"Angle"])
  {
    id v4 = [MEMORY[0x1E4F29158] degrees];
    v153[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F29158] arcMinutes];
    v153[1] = v5;
    char v7 = [MEMORY[0x1E4F29158] arcSeconds];
    v153[2] = v7;
    id v8 = [MEMORY[0x1E4F29158] radians];
    v153[3] = v8;
    id v9 = [MEMORY[0x1E4F29158] gradians];
    v153[4] = v9;
    v10 = [MEMORY[0x1E4F29158] revolutions];
    v153[5] = v10;
    char v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v153 count:6];

LABEL_11:
    goto LABEL_12;
  }
  if ([v3 isEqualToString:@"Area"])
  {
    uint64_t v125 = [MEMORY[0x1E4F29160] squareMegameters];
    v152[0] = v125;
    uint64_t v122 = [MEMORY[0x1E4F29160] squareKilometers];
    v152[1] = v122;
    v120 = [MEMORY[0x1E4F29160] squareMeters];
    v152[2] = v120;
    v118 = [MEMORY[0x1E4F29160] squareCentimeters];
    v152[3] = v118;
    v116 = [MEMORY[0x1E4F29160] squareMillimeters];
    v152[4] = v116;
    id v11 = [MEMORY[0x1E4F29160] squareMicrometers];
    v152[5] = v11;
    [MEMORY[0x1E4F29160] squareNanometers];
    id v12 = v130 = v3;
    v152[6] = v12;
    v13 = [MEMORY[0x1E4F29160] squareInches];
    v152[7] = v13;
    long long v14 = [MEMORY[0x1E4F29160] squareFeet];
    v152[8] = v14;
    uint64_t v15 = [MEMORY[0x1E4F29160] squareYards];
    v152[9] = v15;
    long long v16 = [MEMORY[0x1E4F29160] squareMiles];
    v152[10] = v16;
    long long v17 = [MEMORY[0x1E4F29160] acres];
    v152[11] = v17;
    uint64_t v18 = [MEMORY[0x1E4F29160] ares];
    v152[12] = v18;
    uint64_t v19 = [MEMORY[0x1E4F29160] hectares];
    v152[13] = v19;
    char v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v152 count:14];

    id v4 = (void *)v125;
    id v3 = v130;

    uint64_t v20 = (void *)v122;
LABEL_7:

LABEL_13:
    goto LABEL_14;
  }
  if ([v3 isEqualToString:@"Concentration Mass"])
  {
    id v4 = [MEMORY[0x1E4F29168] gramsPerLiter];
    v151[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F29168] milligramsPerDeciliter];
    v151[1] = v5;
    char v7 = objc_msgSend(MEMORY[0x1E4F29168], "wf_microgramsPerCubicMeter");
    v151[2] = v7;
    v21 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v22 = v151;
LABEL_10:
    char v6 = [v21 arrayWithObjects:v22 count:3];
    goto LABEL_11;
  }
  if ([v3 isEqualToString:@"Dispersion"])
  {
    id v4 = [MEMORY[0x1E4F29178] partsPerMillion];
    v150 = v4;
    long long v24 = (void *)MEMORY[0x1E4F1C978];
    long long v25 = &v150;
LABEL_19:
    char v6 = [v24 arrayWithObjects:v25 count:1];
    goto LABEL_13;
  }
  if ([v3 isEqualToString:@"Duration"])
  {
    id v4 = [MEMORY[0x1E4F29180] milliseconds];
    v149[0] = v4;
    long long v26 = [MEMORY[0x1E4F29180] microseconds];
    v149[1] = v26;
    long long v27 = [MEMORY[0x1E4F29180] nanoseconds];
    v149[2] = v27;
    v28 = [MEMORY[0x1E4F29180] picoseconds];
    v149[3] = v28;
    id v29 = [MEMORY[0x1E4F29180] seconds];
    v149[4] = v29;
    id v30 = [MEMORY[0x1E4F29180] minutes];
    v149[5] = v30;
    id v31 = [MEMORY[0x1E4F29180] hours];
    v149[6] = v31;
    char v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v149 count:7];

    goto LABEL_13;
  }
  if ([v3 isEqualToString:@"Electric Charge"])
  {
    id v4 = [MEMORY[0x1E4F29190] coulombs];
    v148[0] = v4;
    BOOL v32 = [MEMORY[0x1E4F29190] megaampereHours];
    v148[1] = v32;
    v33 = [MEMORY[0x1E4F29190] kiloampereHours];
    v148[2] = v33;
    uint64_t v34 = [MEMORY[0x1E4F29190] ampereHours];
    v148[3] = v34;
    v35 = [MEMORY[0x1E4F29190] milliampereHours];
    v148[4] = v35;
    v36 = [MEMORY[0x1E4F29190] microampereHours];
    v148[5] = v36;
    char v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v148 count:6];

    goto LABEL_13;
  }
  if ([v3 isEqualToString:@"Electric Current"])
  {
    id v4 = [MEMORY[0x1E4F29198] megaamperes];
    v147[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F29198] kiloamperes];
    v147[1] = v5;
    char v7 = [MEMORY[0x1E4F29198] amperes];
    v147[2] = v7;
    v37 = [MEMORY[0x1E4F29198] milliamperes];
    v147[3] = v37;
    v38 = [MEMORY[0x1E4F29198] microamperes];
    v147[4] = v38;
    v39 = (void *)MEMORY[0x1E4F1C978];
    v40 = v147;
LABEL_32:
    char v6 = [v39 arrayWithObjects:v40 count:5];

    goto LABEL_11;
  }
  if ([v3 isEqualToString:@"Electric Potential Difference"])
  {
    id v4 = [MEMORY[0x1E4F291A0] megavolts];
    v146[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F291A0] kilovolts];
    v146[1] = v5;
    char v7 = [MEMORY[0x1E4F291A0] volts];
    v146[2] = v7;
    v37 = [MEMORY[0x1E4F291A0] millivolts];
    v146[3] = v37;
    v38 = [MEMORY[0x1E4F291A0] microvolts];
    v146[4] = v38;
    v39 = (void *)MEMORY[0x1E4F1C978];
    v40 = v146;
    goto LABEL_32;
  }
  if ([v3 isEqualToString:@"Electric Resistance"])
  {
    id v4 = [MEMORY[0x1E4F291A8] megaohms];
    v145[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F291A8] kiloohms];
    v145[1] = v5;
    char v7 = [MEMORY[0x1E4F291A8] ohms];
    v145[2] = v7;
    v37 = [MEMORY[0x1E4F291A8] milliohms];
    v145[3] = v37;
    v38 = [MEMORY[0x1E4F291A8] microohms];
    v145[4] = v38;
    v39 = (void *)MEMORY[0x1E4F1C978];
    v40 = v145;
    goto LABEL_32;
  }
  if ([v3 isEqualToString:@"Energy"])
  {
    id v4 = [MEMORY[0x1E4F291B0] kilojoules];
    v144[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F291B0] joules];
    v144[1] = v5;
    char v7 = [MEMORY[0x1E4F291B0] kilocalories];
    v144[2] = v7;
    v37 = [MEMORY[0x1E4F291B0] calories];
    v144[3] = v37;
    v38 = [MEMORY[0x1E4F291B0] kilowattHours];
    v144[4] = v38;
    v39 = (void *)MEMORY[0x1E4F1C978];
    v40 = v144;
    goto LABEL_32;
  }
  if ([v3 isEqualToString:@"Frequency"])
  {
    id v4 = [MEMORY[0x1E4F291B8] terahertz];
    v143[0] = v4;
    uint64_t v131 = [MEMORY[0x1E4F291B8] gigahertz];
    v143[1] = v131;
    v41 = [MEMORY[0x1E4F291B8] megahertz];
    v143[2] = v41;
    v42 = [MEMORY[0x1E4F291B8] kilohertz];
    v143[3] = v42;
    v43 = [MEMORY[0x1E4F291B8] hertz];
    v143[4] = v43;
    v44 = [MEMORY[0x1E4F291B8] millihertz];
    v143[5] = v44;
    v45 = [MEMORY[0x1E4F291B8] microhertz];
    v143[6] = v45;
    v46 = [MEMORY[0x1E4F291B8] nanohertz];
    v143[7] = v46;
    v47 = [MEMORY[0x1E4F291B8] framesPerSecond];
    v143[8] = v47;
    v48 = (void *)MEMORY[0x1E4F1C978];
    v49 = v143;
LABEL_35:
    char v6 = [v48 arrayWithObjects:v49 count:9];

    uint64_t v20 = (void *)v131;
    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"Fuel Efficiency"])
  {
    id v4 = [MEMORY[0x1E4F291C0] litersPer100Kilometers];
    v142[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F291C0] milesPerImperialGallon];
    v142[1] = v5;
    char v7 = [MEMORY[0x1E4F291C0] milesPerGallon];
    v142[2] = v7;
    v21 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v22 = v142;
    goto LABEL_10;
  }
  if ([v3 isEqualToString:@"Illuminance"])
  {
    id v4 = [MEMORY[0x1E4F291C8] lux];
    v141 = v4;
    long long v24 = (void *)MEMORY[0x1E4F1C978];
    long long v25 = &v141;
    goto LABEL_19;
  }
  if ([v3 isEqualToString:@"Information Storage"])
  {
    id v4 = [MEMORY[0x1E4F291D0] bytes];
    v140[0] = v4;
    uint64_t v131 = [MEMORY[0x1E4F291D0] kilobytes];
    v140[1] = v131;
    v41 = [MEMORY[0x1E4F291D0] megabytes];
    v140[2] = v41;
    v42 = [MEMORY[0x1E4F291D0] gigabytes];
    v140[3] = v42;
    v43 = [MEMORY[0x1E4F291D0] terabytes];
    v140[4] = v43;
    v44 = [MEMORY[0x1E4F291D0] petabytes];
    v140[5] = v44;
    v45 = [MEMORY[0x1E4F291D0] exabytes];
    v140[6] = v45;
    v46 = [MEMORY[0x1E4F291D0] zettabytes];
    v140[7] = v46;
    v47 = [MEMORY[0x1E4F291D0] yottabytes];
    v140[8] = v47;
    v48 = (void *)MEMORY[0x1E4F1C978];
    v49 = v140;
    goto LABEL_35;
  }
  id v132 = v3;
  if ([v3 isEqualToString:@"Length"])
  {
    uint64_t v126 = [MEMORY[0x1E4F291E0] megameters];
    v139[0] = v126;
    uint64_t v123 = [MEMORY[0x1E4F291E0] kilometers];
    v139[1] = v123;
    v121 = [MEMORY[0x1E4F291E0] hectometers];
    v139[2] = v121;
    v119 = [MEMORY[0x1E4F291E0] decameters];
    v139[3] = v119;
    v117 = [MEMORY[0x1E4F291E0] meters];
    v139[4] = v117;
    v115 = [MEMORY[0x1E4F291E0] decimeters];
    v139[5] = v115;
    v114 = [MEMORY[0x1E4F291E0] centimeters];
    v139[6] = v114;
    v113 = [MEMORY[0x1E4F291E0] millimeters];
    v139[7] = v113;
    v112 = [MEMORY[0x1E4F291E0] micrometers];
    v139[8] = v112;
    v111 = [MEMORY[0x1E4F291E0] nanometers];
    v139[9] = v111;
    v110 = [MEMORY[0x1E4F291E0] picometers];
    v139[10] = v110;
    v109 = [MEMORY[0x1E4F291E0] inches];
    v139[11] = v109;
    v108 = [MEMORY[0x1E4F291E0] feet];
    v139[12] = v108;
    v50 = [MEMORY[0x1E4F291E0] yards];
    v139[13] = v50;
    v51 = [MEMORY[0x1E4F291E0] miles];
    v139[14] = v51;
    v52 = [MEMORY[0x1E4F291E0] scandinavianMiles];
    v139[15] = v52;
    v53 = [MEMORY[0x1E4F291E0] lightyears];
    v139[16] = v53;
    v54 = [MEMORY[0x1E4F291E0] nauticalMiles];
    v139[17] = v54;
    v55 = [MEMORY[0x1E4F291E0] fathoms];
    v139[18] = v55;
    v56 = [MEMORY[0x1E4F291E0] furlongs];
    v139[19] = v56;
    v57 = [MEMORY[0x1E4F291E0] astronomicalUnits];
    v139[20] = v57;
    v58 = [MEMORY[0x1E4F291E0] parsecs];
    v139[21] = v58;
    uint64_t v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v139 count:22];

    char v6 = (void *)v59;
    id v4 = (void *)v126;

LABEL_44:
LABEL_47:

    v69 = (void *)v123;
LABEL_48:

LABEL_49:
    id v3 = v132;
    goto LABEL_13;
  }
  if ([v3 isEqualToString:@"Mass"])
  {
    uint64_t v127 = [MEMORY[0x1E4F291E8] kilograms];
    v138[0] = v127;
    uint64_t v123 = [MEMORY[0x1E4F291E8] grams];
    v138[1] = v123;
    v121 = [MEMORY[0x1E4F291E8] decigrams];
    v138[2] = v121;
    v119 = [MEMORY[0x1E4F291E8] centigrams];
    v138[3] = v119;
    v117 = [MEMORY[0x1E4F291E8] milligrams];
    v138[4] = v117;
    v115 = [MEMORY[0x1E4F291E8] micrograms];
    v138[5] = v115;
    v114 = [MEMORY[0x1E4F291E8] nanograms];
    v138[6] = v114;
    v60 = [MEMORY[0x1E4F291E8] picograms];
    v138[7] = v60;
    v61 = [MEMORY[0x1E4F291E8] ounces];
    v138[8] = v61;
    v62 = [MEMORY[0x1E4F291E8] poundsMass];
    v138[9] = v62;
    v63 = [MEMORY[0x1E4F291E8] stones];
    v138[10] = v63;
    v64 = [MEMORY[0x1E4F291E8] metricTons];
    v138[11] = v64;
    v65 = [MEMORY[0x1E4F291E8] shortTons];
    v138[12] = v65;
    v66 = [MEMORY[0x1E4F291E8] carats];
    v138[13] = v66;
    v67 = [MEMORY[0x1E4F291E8] ouncesTroy];
    v138[14] = v67;
    v68 = [MEMORY[0x1E4F291E8] slugs];
    v138[15] = v68;
    char v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v138 count:16];

    id v4 = (void *)v127;
    goto LABEL_47;
  }
  if ([v3 isEqualToString:@"Power"])
  {
    uint64_t v70 = [MEMORY[0x1E4F291F0] terawatts];
    v137[0] = v70;
    uint64_t v128 = [MEMORY[0x1E4F291F0] gigawatts];
    v137[1] = v128;
    v124 = [MEMORY[0x1E4F291F0] megawatts];
    v137[2] = v124;
    v71 = [MEMORY[0x1E4F291F0] kilowatts];
    v137[3] = v71;
    v72 = [MEMORY[0x1E4F291F0] watts];
    v137[4] = v72;
    v73 = [MEMORY[0x1E4F291F0] milliwatts];
    v137[5] = v73;
    uint64_t v74 = [MEMORY[0x1E4F291F0] microwatts];
    v137[6] = v74;
    v75 = [MEMORY[0x1E4F291F0] nanowatts];
    v137[7] = v75;
    v76 = [MEMORY[0x1E4F291F0] picowatts];
    v137[8] = v76;
    v77 = [MEMORY[0x1E4F291F0] femtowatts];
    v137[9] = v77;
    v78 = [MEMORY[0x1E4F291F0] horsepower];
    v137[10] = v78;
    char v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v137 count:11];

    id v4 = (void *)v70;
LABEL_54:
    v69 = (void *)v128;
    goto LABEL_48;
  }
  if ([v3 isEqualToString:@"Pressure"])
  {
    id v4 = [MEMORY[0x1E4F291F8] newtonsPerMetersSquared];
    v136[0] = v4;
    uint64_t v128 = [MEMORY[0x1E4F291F8] gigapascals];
    v136[1] = v128;
    v79 = [MEMORY[0x1E4F291F8] megapascals];
    v136[2] = v79;
    v80 = [MEMORY[0x1E4F291F8] kilopascals];
    v136[3] = v80;
    v81 = [MEMORY[0x1E4F291F8] hectopascals];
    v136[4] = v81;
    v82 = [MEMORY[0x1E4F291F8] inchesOfMercury];
    v136[5] = v82;
    v83 = [MEMORY[0x1E4F291F8] bars];
    v136[6] = v83;
    v84 = [MEMORY[0x1E4F291F8] millibars];
    v136[7] = v84;
    v85 = [MEMORY[0x1E4F291F8] millimetersOfMercury];
    v136[8] = v85;
    v86 = [MEMORY[0x1E4F291F8] poundsForcePerSquareInch];
    v136[9] = v86;
    char v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v136 count:10];

    goto LABEL_54;
  }
  if ([v3 isEqualToString:@"Speed"])
  {
    id v4 = [MEMORY[0x1E4F29208] metersPerSecond];
    v135[0] = v4;
    v87 = [MEMORY[0x1E4F29208] kilometersPerHour];
    v135[1] = v87;
    v88 = [MEMORY[0x1E4F29208] milesPerHour];
    v135[2] = v88;
    v89 = [MEMORY[0x1E4F29208] knots];
    v135[3] = v89;
    char v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v135 count:4];

LABEL_59:
    goto LABEL_49;
  }
  if ([v3 isEqualToString:@"Temperature"])
  {
    id v4 = [MEMORY[0x1E4F29218] kelvin];
    v134[0] = v4;
    v87 = [MEMORY[0x1E4F29218] celsius];
    v134[1] = v87;
    v88 = [MEMORY[0x1E4F29218] fahrenheit];
    v134[2] = v88;
    char v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v134 count:3];
    goto LABEL_59;
  }
  if ([v3 isEqualToString:@"Volume"])
  {
    uint64_t v129 = [MEMORY[0x1E4F29228] megaliters];
    v133[0] = v129;
    uint64_t v123 = [MEMORY[0x1E4F29228] kiloliters];
    v133[1] = v123;
    v121 = [MEMORY[0x1E4F29228] liters];
    v133[2] = v121;
    v119 = [MEMORY[0x1E4F29228] deciliters];
    v133[3] = v119;
    v117 = [MEMORY[0x1E4F29228] centiliters];
    v133[4] = v117;
    v115 = [MEMORY[0x1E4F29228] milliliters];
    v133[5] = v115;
    v114 = [MEMORY[0x1E4F29228] cubicKilometers];
    v133[6] = v114;
    v113 = [MEMORY[0x1E4F29228] cubicMeters];
    v133[7] = v113;
    v112 = [MEMORY[0x1E4F29228] cubicDecimeters];
    v133[8] = v112;
    v111 = [MEMORY[0x1E4F29228] cubicCentimeters];
    v133[9] = v111;
    v110 = [MEMORY[0x1E4F29228] cubicMillimeters];
    v133[10] = v110;
    v109 = [MEMORY[0x1E4F29228] cubicInches];
    v133[11] = v109;
    v108 = [MEMORY[0x1E4F29228] cubicFeet];
    v133[12] = v108;
    v107 = [MEMORY[0x1E4F29228] cubicYards];
    v133[13] = v107;
    v106 = [MEMORY[0x1E4F29228] cubicMiles];
    v133[14] = v106;
    v105 = [MEMORY[0x1E4F29228] acreFeet];
    v133[15] = v105;
    v104 = [MEMORY[0x1E4F29228] bushels];
    v133[16] = v104;
    v103 = [MEMORY[0x1E4F29228] teaspoons];
    v133[17] = v103;
    v102 = [MEMORY[0x1E4F29228] tablespoons];
    v133[18] = v102;
    v101 = [MEMORY[0x1E4F29228] fluidOunces];
    v133[19] = v101;
    v100 = [MEMORY[0x1E4F29228] cups];
    v133[20] = v100;
    v99 = [MEMORY[0x1E4F29228] pints];
    v133[21] = v99;
    v90 = [MEMORY[0x1E4F29228] quarts];
    v133[22] = v90;
    v91 = [MEMORY[0x1E4F29228] gallons];
    v133[23] = v91;
    v92 = [MEMORY[0x1E4F29228] imperialTeaspoons];
    v133[24] = v92;
    v93 = [MEMORY[0x1E4F29228] imperialTablespoons];
    v133[25] = v93;
    v94 = [MEMORY[0x1E4F29228] imperialFluidOunces];
    v133[26] = v94;
    v95 = [MEMORY[0x1E4F29228] imperialPints];
    v133[27] = v95;
    v96 = [MEMORY[0x1E4F29228] imperialQuarts];
    v133[28] = v96;
    v97 = [MEMORY[0x1E4F29228] imperialGallons];
    v133[29] = v97;
    v98 = [MEMORY[0x1E4F29228] metricCups];
    v133[30] = v98;
    char v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v133 count:31];

    id v4 = (void *)v129;
    goto LABEL_44;
  }
  char v6 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_14:

  return v6;
}

+ (id)unitTypeMap
{
  if (unitTypeMap_onceToken != -1) {
    dispatch_once(&unitTypeMap_onceToken, &__block_literal_global_5461);
  }
  v2 = (void *)unitTypeMap_unitTypeMap;
  return v2;
}

void __32__WFMeasurementUnit_unitTypeMap__block_invoke()
{
  v3[22] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Acceleration";
  v3[0] = objc_opt_class();
  v2[1] = @"Angle";
  v3[1] = objc_opt_class();
  v2[2] = @"Area";
  v3[2] = objc_opt_class();
  v2[3] = @"Concentration Mass";
  v3[3] = objc_opt_class();
  v2[4] = @"Dispersion";
  v3[4] = objc_opt_class();
  v2[5] = @"Duration";
  v3[5] = objc_opt_class();
  v2[6] = @"Electric Charge";
  v3[6] = objc_opt_class();
  v2[7] = @"Electric Current";
  v3[7] = objc_opt_class();
  v2[8] = @"Electric Potential Difference";
  v3[8] = objc_opt_class();
  v2[9] = @"Electric Resistance";
  v3[9] = objc_opt_class();
  v2[10] = @"Energy";
  v3[10] = objc_opt_class();
  v2[11] = @"Frequency";
  v3[11] = objc_opt_class();
  v2[12] = @"Fuel Efficiency";
  v3[12] = objc_opt_class();
  v2[13] = @"Illuminance";
  v3[13] = objc_opt_class();
  v2[14] = @"Information Storage";
  v3[14] = objc_opt_class();
  v2[15] = @"Length";
  v3[15] = objc_opt_class();
  v2[16] = @"Mass";
  v3[16] = objc_opt_class();
  v2[17] = @"Power";
  v3[17] = objc_opt_class();
  v2[18] = @"Pressure";
  v3[18] = objc_opt_class();
  v2[19] = @"Speed";
  v3[19] = objc_opt_class();
  v2[20] = @"Temperature";
  v3[20] = objc_opt_class();
  v2[21] = @"Volume";
  v3[21] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:22];
  v1 = (void *)unitTypeMap_unitTypeMap;
  unitTypeMap_unitTypeMap = v0;
}

+ (id)unitTypeForUnitClass:(Class)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__5463;
  id v12 = __Block_byref_object_dispose__5464;
  id v13 = 0;
  id v4 = [a1 unitTypeMap];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__WFMeasurementUnit_unitTypeForUnitClass___block_invoke;
  v7[3] = &unk_1E6077AD0;
  v7[4] = &v8;
  v7[5] = a3;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __42__WFMeasurementUnit_unitTypeForUnitClass___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if ([*(id *)(a1 + 40) isSubclassOfClass:a3])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

+ (id)localizedStringForUnitType:(id)a3
{
  id v3 = a3;
  id v4 = @"Acceleration";
  if ([v3 isEqualToString:@"Acceleration"]) {
    goto LABEL_23;
  }
  id v4 = @"Angle";
  if ([v3 isEqualToString:@"Angle"]) {
    goto LABEL_23;
  }
  id v4 = @"Area";
  if ([v3 isEqualToString:@"Area"]) {
    goto LABEL_23;
  }
  id v4 = @"Concentration Mass";
  if ([v3 isEqualToString:@"Concentration Mass"]) {
    goto LABEL_23;
  }
  id v4 = @"Dispersion";
  if ([v3 isEqualToString:@"Dispersion"]) {
    goto LABEL_23;
  }
  id v4 = @"Duration";
  if ([v3 isEqualToString:@"Duration"]) {
    goto LABEL_23;
  }
  id v4 = @"Electric Charge";
  if ([v3 isEqualToString:@"Electric Charge"]) {
    goto LABEL_23;
  }
  id v4 = @"Electric Current";
  if ([v3 isEqualToString:@"Electric Current"]) {
    goto LABEL_23;
  }
  id v4 = @"Electric Potential Difference";
  if ([v3 isEqualToString:@"Electric Potential Difference"]) {
    goto LABEL_23;
  }
  id v4 = @"Electric Resistance";
  if ([v3 isEqualToString:@"Electric Resistance"]) {
    goto LABEL_23;
  }
  id v4 = @"Energy";
  if ([v3 isEqualToString:@"Energy"]) {
    goto LABEL_23;
  }
  id v4 = @"Frequency";
  if ([v3 isEqualToString:@"Frequency"]) {
    goto LABEL_23;
  }
  id v4 = @"Fuel Efficiency";
  if ([v3 isEqualToString:@"Fuel Efficiency"]) {
    goto LABEL_23;
  }
  id v4 = @"Illuminance";
  if ([v3 isEqualToString:@"Illuminance"]) {
    goto LABEL_23;
  }
  id v4 = @"Information Storage";
  if (([v3 isEqualToString:@"Information Storage"] & 1) != 0
    || (id v4 = @"Length", ([v3 isEqualToString:@"Length"] & 1) != 0)
    || (id v4 = @"Mass", ([v3 isEqualToString:@"Mass"] & 1) != 0)
    || (id v4 = @"Power", ([v3 isEqualToString:@"Power"] & 1) != 0)
    || (id v4 = @"Pressure", ([v3 isEqualToString:@"Pressure"] & 1) != 0)
    || (id v4 = @"Speed", ([v3 isEqualToString:@"Speed"] & 1) != 0)
    || (id v4 = @"Temperature", ([v3 isEqualToString:@"Temperature"] & 1) != 0)
    || (id v4 = @"Volume", [v3 isEqualToString:@"Volume"]))
  {
LABEL_23:
    id v5 = WFLocalizedString(v4);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (Class)unitClassForUnitType:(id)a3
{
  id v5 = a3;
  char v6 = [a1 unitTypeMap];
  char v7 = (void *)[v6 objectForKey:v5];

  if (!v7)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"WFMeasurementUnit.m", 48, @"Invalid unit type: %@", v5 object file lineNumber description];
  }
  id v8 = v7;

  return v8;
}

+ (id)availableUnitTypes
{
  id v3 = [a1 unitTypeMap];
  id v4 = [v3 allKeys];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__WFMeasurementUnit_availableUnitTypes__block_invoke;
  v7[3] = &__block_descriptor_40_e31_q24__0__NSString_8__NSString_16l;
  v7[4] = a1;
  id v5 = [v4 sortedArrayUsingComparator:v7];

  return v5;
}

uint64_t __39__WFMeasurementUnit_availableUnitTypes__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  char v7 = [v5 localizedStringForUnitType:a2];
  id v8 = [*(id *)(a1 + 32) localizedStringForUnitType:v6];

  uint64_t v9 = [v7 compare:v8];
  return v9;
}

@end