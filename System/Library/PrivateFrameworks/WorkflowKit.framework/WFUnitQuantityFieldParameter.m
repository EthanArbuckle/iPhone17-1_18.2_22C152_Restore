@interface WFUnitQuantityFieldParameter
- (BOOL)fallbackToAllSupportedUnits;
- (BOOL)parameterStateIsValid:(id)a3;
- (NSDictionary)unitSymbolMap;
- (NSString)defaultUnitString;
- (NSString)unitType;
- (NSUnit)defaultUnit;
- (WFUnitQuantityFieldParameter)initWithDefinition:(id)a3;
- (id)availableUnitForStringValue:(id)a3;
- (id)defaultSerializedRepresentation;
- (id)localizedLabelForPossibleUnit:(id)a3 magnitude:(id)a4 style:(unint64_t)a5;
- (id)possibleUnits;
- (void)setDefaultUnit:(id)a3;
- (void)setFallbackToAllSupportedUnits:(BOOL)a3;
- (void)setPossibleUnits:(id)a3;
- (void)setUnitSymbolMap:(id)a3;
- (void)setUnitType:(id)a3;
- (void)updatePossibleUnits;
@end

@implementation WFUnitQuantityFieldParameter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitSymbolMap, 0);
  objc_storeStrong((id *)&self->_defaultUnit, 0);
  objc_storeStrong((id *)&self->_unitType, 0);
  objc_storeStrong((id *)&self->_possibleUnits, 0);
}

- (void)setUnitSymbolMap:(id)a3
{
}

- (NSDictionary)unitSymbolMap
{
  return self->_unitSymbolMap;
}

- (BOOL)fallbackToAllSupportedUnits
{
  return self->_fallbackToAllSupportedUnits;
}

- (NSUnit)defaultUnit
{
  return self->_defaultUnit;
}

- (NSString)unitType
{
  return self->_unitType;
}

- (void)setPossibleUnits:(id)a3
{
}

- (id)possibleUnits
{
  return self->_possibleUnits;
}

- (id)defaultSerializedRepresentation
{
  v3 = [(WFUnitQuantityFieldParameter *)self unitType];

  if (v3)
  {
    v4 = [(WFParameter *)self definition];
    v5 = [v4 objectForKey:@"DefaultValue"];
    uint64_t v6 = objc_opt_class();
    v7 = WFEnforceClass(v5, v6);

    if (v7)
    {
      v8 = [WFNumberStringSubstitutableState alloc];
      v9 = [v7 stringValue];
      v10 = [(WFNumberStringSubstitutableState *)v8 initWithValue:v9];
    }
    else
    {
      v10 = 0;
    }
    v12 = [(WFUnitQuantityFieldParameter *)self defaultUnitString];
    if (v12)
    {
      v13 = [[WFQuantityParameterState alloc] initWithMagnitudeState:v10 unitString:v12];
      v11 = [(WFQuantityParameterState *)v13 serializedRepresentation];
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (NSString)defaultUnitString
{
  v3 = [(WFUnitQuantityFieldParameter *)self defaultUnit];
  id v4 = [v3 symbol];

  if (!v4)
  {
    v5 = [(WFParameter *)self definition];
    uint64_t v6 = [v5 objectForKey:@"DefaultUnit"];
    uint64_t v7 = objc_opt_class();
    v8 = WFEnforceClass(v6, v7);

    v9 = [MEMORY[0x1E4FB47F0] unitFromString:v8];
    if (v9)
    {
      id v4 = v8;
    }
    else
    {
      v10 = (void *)MEMORY[0x1E4FB47F0];
      v11 = [(WFUnitQuantityFieldParameter *)self unitType];
      uint64_t v12 = [v10 defaultUnitForUnitType:v11];
      id v4 = [(id)v12 symbol];

      v13 = [(WFUnitQuantityFieldParameter *)self possibleUnits];
      LOBYTE(v12) = [v13 containsObject:v4];

      if ((v12 & 1) == 0)
      {
        v14 = [(WFUnitQuantityFieldParameter *)self possibleUnits];
        uint64_t v15 = [v14 firstObject];

        id v4 = (id)v15;
      }
    }
  }
  return (NSString *)v4;
}

- (BOOL)parameterStateIsValid:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      uint64_t v6 = v4;
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = v6;
    if (isKindOfClass)
    {
      id v8 = [v4 unitString];
      v9 = [(WFUnitQuantityFieldParameter *)self availableUnitForStringValue:v8];
      BOOL v10 = v9 != 0;
    }
    else
    {
      id v11 = v4;
      objc_opt_class();
      char v12 = objc_opt_isKindOfClass();
      if (v12) {
        v13 = v11;
      }
      else {
        v13 = 0;
      }
      id v8 = v13;

      if (v12)
      {
        uint64_t v17 = 0;
        v18 = &v17;
        uint64_t v19 = 0x2020000000;
        char v20 = 1;
        v14 = [v11 parameterStates];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __54__WFUnitQuantityFieldParameter_parameterStateIsValid___block_invoke;
        v16[3] = &unk_1E6558F70;
        v16[4] = self;
        v16[5] = &v17;
        [v14 enumerateObjectsUsingBlock:v16];

        BOOL v10 = *((unsigned char *)v18 + 24) != 0;
        _Block_object_dispose(&v17, 8);
      }
      else
      {
        BOOL v10 = 0;
      }
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

void __54__WFUnitQuantityFieldParameter_parameterStateIsValid___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = objc_opt_class();
  WFEnforceClass(v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v8 + 24))
  {
    char v9 = [*(id *)(a1 + 32) parameterStateIsValid:v10];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  else
  {
    char v9 = 0;
  }
  *(unsigned char *)(v8 + 24) = v9;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^ 1;
}

- (id)localizedLabelForPossibleUnit:(id)a3 magnitude:(id)a4 style:(unint64_t)a5
{
  id v6 = -[WFUnitQuantityFieldParameter availableUnitForStringValue:](self, "availableUnitForStringValue:", a3, a4);
  if (!v6)
  {
    id v10 = 0;
    goto LABEL_29;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [MEMORY[0x1E4F291D0] bytes];
    int v8 = [v6 isEqual:v7];

    if (v8)
    {
      char v9 = @"bytes";
LABEL_22:
      id v10 = WFLocalizedString(v9);
      goto LABEL_29;
    }
    id v11 = [MEMORY[0x1E4F291D0] kilobytes];
    int v12 = [v6 isEqual:v11];

    if (v12)
    {
      char v9 = @"KB";
      goto LABEL_22;
    }
    v13 = [MEMORY[0x1E4F291D0] megabytes];
    int v14 = [v6 isEqual:v13];

    if (v14)
    {
      char v9 = @"MB";
      goto LABEL_22;
    }
    uint64_t v15 = [MEMORY[0x1E4F291D0] gigabytes];
    int v16 = [v6 isEqual:v15];

    if (v16)
    {
      char v9 = @"GB";
      goto LABEL_22;
    }
    uint64_t v17 = [MEMORY[0x1E4F291D0] terabytes];
    int v18 = [v6 isEqual:v17];

    if (v18)
    {
      char v9 = @"TB";
      goto LABEL_22;
    }
    uint64_t v19 = [MEMORY[0x1E4F291D0] petabytes];
    int v20 = [v6 isEqual:v19];

    if (v20)
    {
      char v9 = @"PB";
      goto LABEL_22;
    }
    v21 = [MEMORY[0x1E4F291D0] exabytes];
    int v22 = [v6 isEqual:v21];

    if (v22)
    {
      char v9 = @"EB";
      goto LABEL_22;
    }
    v23 = [MEMORY[0x1E4F291D0] zettabytes];
    int v24 = [v6 isEqual:v23];

    if (v24)
    {
      char v9 = @"ZB";
      goto LABEL_22;
    }
    v25 = [MEMORY[0x1E4F291D0] yottabytes];
    int v26 = [v6 isEqual:v25];

    if (v26)
    {
      char v9 = @"YB";
      goto LABEL_22;
    }
  }
  id v27 = objc_alloc_init(MEMORY[0x1E4F28E30]);
  v28 = v27;
  if (!a5)
  {
    uint64_t v29 = 1;
    goto LABEL_27;
  }
  if (a5 == 1)
  {
    uint64_t v29 = 3;
LABEL_27:
    [v27 setUnitStyle:v29];
  }
  id v10 = [v28 stringFromUnit:v6];

LABEL_29:
  return v10;
}

- (void)updatePossibleUnits
{
  v2 = self;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  v3 = [(WFUnitQuantityFieldParameter *)self unitType];
  if (v3)
  {
    id v4 = [(WFParameter *)v2 definition];
    v5 = [v4 objectForKey:@"PossibleUnits"];

    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v6 = objc_opt_new();
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v7 = v5;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v63 objects:v70 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v64;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v64 != v10) {
              objc_enumerationMutation(v7);
            }
            int v12 = [MEMORY[0x1E4FB47F0] unitFromString:*(void *)(*((void *)&v63 + 1) + 8 * i) unitType:v3 caseSensitive:0];
            v13 = [v12 symbol];
            [v6 setObject:v12 forKey:v13];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v63 objects:v70 count:16];
        }
        while (v9);
      }

      uint64_t v14 = [v7 copy];
      possibleUnits = v2->_possibleUnits;
      v2->_possibleUnits = (NSArray *)v14;

      int v16 = v6;
    }
    else
    {

      id v7 = (id)objc_opt_new();
      id v6 = objc_opt_new();
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      uint64_t v17 = [MEMORY[0x1E4FB47F0] availableUnitsForUnitType:v3];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v59 objects:v69 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v60;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v60 != v20) {
              objc_enumerationMutation(v17);
            }
            int v22 = *(void **)(*((void *)&v59 + 1) + 8 * j);
            v23 = [v22 symbol];
            [v7 setObject:v22 forKey:v23];

            int v24 = [v22 symbol];
            [v6 addObject:v24];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v59 objects:v69 count:16];
        }
        while (v19);
      }

      uint64_t v25 = [v6 copy];
      int v26 = v2->_possibleUnits;
      v2->_possibleUnits = (NSArray *)v25;

      int v16 = v7;
    }
    uint64_t v27 = [v16 copy];
    unitSymbolMap = v2->_unitSymbolMap;
    v2->_unitSymbolMap = (NSDictionary *)v27;
  }
  else if ([(WFUnitQuantityFieldParameter *)v2 fallbackToAllSupportedUnits])
  {
    v49 = v2;
    uint64_t v29 = objc_opt_new();
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    obuint64_t j = [MEMORY[0x1E4FB47F0] availableUnitTypes];
    uint64_t v30 = [obj countByEnumeratingWithState:&v55 objects:v68 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v56;
      do
      {
        for (uint64_t k = 0; k != v31; ++k)
        {
          if (*(void *)v56 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v34 = *(void *)(*((void *)&v55 + 1) + 8 * k);
          long long v51 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          v35 = [MEMORY[0x1E4FB47F0] availableUnitsForUnitType:v34];
          uint64_t v36 = [v35 countByEnumeratingWithState:&v51 objects:v67 count:16];
          if (v36)
          {
            uint64_t v37 = v36;
            uint64_t v38 = *(void *)v52;
            do
            {
              for (uint64_t m = 0; m != v37; ++m)
              {
                if (*(void *)v52 != v38) {
                  objc_enumerationMutation(v35);
                }
                v40 = *(void **)(*((void *)&v51 + 1) + 8 * m);
                v41 = [v40 symbol];
                [v29 setObject:v40 forKey:v41];
              }
              uint64_t v37 = [v35 countByEnumeratingWithState:&v51 objects:v67 count:16];
            }
            while (v37);
          }
        }
        uint64_t v31 = [obj countByEnumeratingWithState:&v55 objects:v68 count:16];
      }
      while (v31);
    }

    v42 = [v29 allKeys];
    uint64_t v43 = [v42 sortedArrayUsingSelector:sel_localizedStandardCompare_];
    v2 = v49;
    v44 = v49->_possibleUnits;
    v49->_possibleUnits = (NSArray *)v43;

    uint64_t v45 = [v29 copy];
    v46 = v49->_unitSymbolMap;
    v49->_unitSymbolMap = (NSDictionary *)v45;

    v3 = 0;
  }
  else
  {
    v47 = v2->_possibleUnits;
    v2->_possibleUnits = (NSArray *)MEMORY[0x1E4F1CBF0];

    v48 = v2->_unitSymbolMap;
    v2->_unitSymbolMap = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
  [(WFParameter *)v2 attributesDidChange];
}

- (id)availableUnitForStringValue:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"sec"])
  {
    uint64_t v5 = [MEMORY[0x1E4F29180] seconds];
LABEL_7:
    id v6 = (void *)v5;
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"min"])
  {
    uint64_t v5 = [MEMORY[0x1E4F29180] minutes];
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"hr"])
  {
    uint64_t v5 = [MEMORY[0x1E4F29180] hours];
    goto LABEL_7;
  }
  uint64_t v8 = [(WFUnitQuantityFieldParameter *)self unitSymbolMap];
  id v6 = [v8 objectForKey:v4];

LABEL_8:
  return v6;
}

- (void)setFallbackToAllSupportedUnits:(BOOL)a3
{
  if (self->_fallbackToAllSupportedUnits != a3)
  {
    self->_fallbackToAllSupportedUnits = a3;
    id v4 = [(WFUnitQuantityFieldParameter *)self unitType];

    if (!v4)
    {
      [(WFUnitQuantityFieldParameter *)self updatePossibleUnits];
      [(WFParameter *)self defaultSerializedRepresentationDidChange];
    }
  }
}

- (void)setDefaultUnit:(id)a3
{
  id v8 = a3;
  uint64_t v5 = [(WFUnitQuantityFieldParameter *)self unitType];

  if (v5)
  {
    if (!v8
      || (id v6 = (void *)MEMORY[0x1E4FB47F0],
          [(WFUnitQuantityFieldParameter *)self unitType],
          id v7 = objc_claimAutoreleasedReturnValue(),
          [v6 unitClassForUnitType:v7],
          v7,
          (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_storeStrong((id *)&self->_defaultUnit, a3);
      [(WFParameter *)self defaultSerializedRepresentationDidChange];
    }
  }
}

- (void)setUnitType:(id)a3
{
  id v4 = (NSString *)a3;
  unitType = self->_unitType;
  if (unitType != v4)
  {
    id v11 = v4;
    BOOL v6 = [(NSString *)unitType isEqualToString:v4];
    id v4 = v11;
    if (!v6)
    {
      id v7 = (NSString *)[(NSString *)v11 copy];
      id v8 = self->_unitType;
      self->_unitType = v7;

      if (v11)
      {
        objc_msgSend(MEMORY[0x1E4FB47F0], "unitClassForUnitType:");
        p_defaultUnit = &self->_defaultUnit;
        if (objc_opt_isKindOfClass()) {
          goto LABEL_8;
        }
      }
      else
      {
        p_defaultUnit = &self->_defaultUnit;
      }
      uint64_t v10 = *p_defaultUnit;
      *p_defaultUnit = 0;

LABEL_8:
      [(WFUnitQuantityFieldParameter *)self updatePossibleUnits];
      [(WFParameter *)self defaultSerializedRepresentationDidChange];
      id v4 = v11;
    }
  }
}

- (WFUnitQuantityFieldParameter)initWithDefinition:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WFUnitQuantityFieldParameter;
  uint64_t v5 = [(WFQuantityFieldParameter *)&v15 initWithDefinition:v4];
  if (v5)
  {
    BOOL v6 = [v4 objectForKey:@"WFUnitType"];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = WFEnforceClass(v6, v7);
    unitType = v5->_unitType;
    v5->_unitType = (NSString *)v8;

    uint64_t v10 = [v4 objectForKey:@"FallbackToAllSupportedUnits"];
    uint64_t v11 = objc_opt_class();
    int v12 = WFEnforceClass(v10, v11);
    v5->_fallbackToAllSupportedUnits = [v12 BOOLValue];

    [(WFUnitQuantityFieldParameter *)v5 updatePossibleUnits];
    v13 = v5;
  }

  return v5;
}

@end