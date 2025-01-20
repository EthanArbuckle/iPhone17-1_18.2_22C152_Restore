@interface WFUnitVariableAggrandizement
- (NSString)unitType;
- (NSUnit)unit;
- (WFUnitVariableAggrandizement)initWithUnit:(id)a3 unitType:(id)a4;
- (id)availableUnits;
- (id)processedContentClasses:(id)a3;
- (void)applyToContentCollection:(id)a3 completionHandler:(id)a4;
@end

@implementation WFUnitVariableAggrandizement

- (void).cxx_destruct
{
}

- (void)applyToContentCollection:(id)a3 completionHandler:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__WFUnitVariableAggrandizement_applyToContentCollection_completionHandler___block_invoke;
  v4[3] = &unk_1E65569B8;
  v4[4] = self;
  [a3 transformItemsUsingBlock:v4 completionHandler:a4];
}

void __75__WFUnitVariableAggrandizement_applyToContentCollection_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__WFUnitVariableAggrandizement_applyToContentCollection_completionHandler___block_invoke_2;
  v8[3] = &unk_1E6555690;
  v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v6 = v5;
  id v7 = a2;
  [v7 getObjectRepresentation:v8 forClass:objc_opt_class()];
}

void __75__WFUnitVariableAggrandizement_applyToContentCollection_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    v3 = [*(id *)(a1 + 32) unit];
    v4 = [v5 measurementByConvertingToUnit:v3];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)processedContentClasses:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAA0];
  uint64_t v4 = objc_opt_class();
  return (id)[v3 orderedSetWithObject:v4];
}

- (id)availableUnits
{
  v2 = (void *)MEMORY[0x1E4FB47F0];
  v3 = [(WFUnitVariableAggrandizement *)self unitType];
  uint64_t v4 = [v2 availableUnitsForUnitType:v3];

  return v4;
}

- (NSUnit)unit
{
  unit = self->_unit;
  if (!unit)
  {
    uint64_t v4 = [(WFUnitVariableAggrandizement *)self unitType];
    id v5 = [(WFVariableAggrandizement *)self dictionary];
    id v6 = [v5 objectForKey:@"WFUnitSymbol"];

    if (v6)
    {
      id v7 = [MEMORY[0x1E4FB47F0] availableUnitsForUnitType:v4];
      v8 = [v7 objectMatchingKey:@"symbol" value:v6];
      id v9 = self->_unit;
      self->_unit = v8;
    }
    unit = self->_unit;
  }
  return unit;
}

- (NSString)unitType
{
  v2 = [(WFVariableAggrandizement *)self dictionary];
  v3 = [v2 objectForKey:@"WFMeasurementUnitType"];

  return (NSString *)v3;
}

- (WFUnitVariableAggrandizement)initWithUnit:(id)a3 unitType:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WFUnitVariableAggrandizement.m", 22, @"Invalid parameter not satisfying: %@", @"unitType" object file lineNumber description];
  }
  id v9 = objc_opt_new();
  [v9 setObject:v8 forKey:@"WFMeasurementUnitType"];
  if (v7)
  {
    v10 = [v7 symbol];
    [v9 setObject:v10 forKey:@"WFUnitSymbol"];
  }
  v11 = [(WFVariableAggrandizement *)self initWithDictionary:v9];

  return v11;
}

@end