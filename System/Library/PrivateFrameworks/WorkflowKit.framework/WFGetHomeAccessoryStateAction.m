@interface WFGetHomeAccessoryStateAction
- (BOOL)setParameterState:(id)a3 forKey:(id)a4;
- (NSString)homeIdentifier;
- (id)characteristic;
- (id)home;
- (id)homeName;
- (id)localizedAttributionWithContext:(id)a3;
- (id)localizedDefaultOutputNameWithContext:(id)a3;
- (id)outputContentClasses;
- (id)outputMeasurementUnitType;
- (id)parameterStateForKey:(id)a3 fallingBackToDefaultValue:(BOOL)a4;
- (void)dealloc;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)initializeParameters;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)updateCharacteristicsEnumeration;
- (void)wasAddedToWorkflow:(id)a3;
- (void)wasAddedToWorkflowByUser:(id)a3;
@end

@implementation WFGetHomeAccessoryStateAction

- (void)updateCharacteristicsEnumeration
{
  id v6 = [(WFAction *)self parameterForKey:@"WFHMCharacteristic"];
  v3 = [(WFAction *)self parameterStateForKey:@"WFHMService"];
  v4 = [v3 service];
  v5 = [v3 homeIdentifier];
  [v6 setService:v4 homeIdentifier:v5];
}

- (id)characteristic
{
  v2 = [(WFAction *)self parameterStateForKey:@"WFHMCharacteristic"];
  v3 = [v2 characteristic];

  return v3;
}

- (id)homeName
{
  v2 = [(WFGetHomeAccessoryStateAction *)self home];
  v3 = [v2 name];

  return v3;
}

- (id)home
{
  v2 = [(WFAction *)self parameterStateForKey:@"WFHMService"];
  v3 = [v2 homeIdentifier];

  if (v3)
  {
    v4 = +[WFHomeManager sharedManager];
    v5 = [v2 homeIdentifier];
    v3 = [v4 homeWithIdentifier:v5];
  }
  return v3;
}

- (NSString)homeIdentifier
{
  v2 = [(WFAction *)self parameterStateForKey:@"WFHMService"];
  v3 = [v2 homeIdentifier];

  if (v3)
  {
    v3 = [v2 homeIdentifier];
  }

  return (NSString *)v3;
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__WFGetHomeAccessoryStateAction_homeManagerDidUpdateHomes___block_invoke;
  block[3] = &unk_1E6558B28;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __59__WFGetHomeAccessoryStateAction_homeManagerDidUpdateHomes___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) nameUpdated];
  [*(id *)(a1 + 32) outputDetailsUpdated];
  v2 = *(void **)(a1 + 32);
  return [v2 updateCharacteristicsEnumeration];
}

- (id)localizedDefaultOutputNameWithContext:(id)a3
{
  id v4 = a3;
  v5 = [(WFGetHomeAccessoryStateAction *)self characteristic];
  id v6 = [v5 localizedDescription];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WFGetHomeAccessoryStateAction;
    id v8 = [(WFAction *)&v11 localizedDefaultOutputNameWithContext:v4];
  }
  v9 = v8;

  return v9;
}

- (id)outputMeasurementUnitType
{
  v3 = [(WFGetHomeAccessoryStateAction *)self characteristic];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4FB47F0];
    v5 = [(WFGetHomeAccessoryStateAction *)self characteristic];
    id v6 = WFUnitForHMCharacteristic(v5);
    v7 = [v4 unitTypeForUnitClass:objc_opt_class()];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)outputContentClasses
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v3 = [(WFGetHomeAccessoryStateAction *)self characteristic];
  id v4 = [v3 metadata];
  v5 = [v4 format];

  id v6 = getHMCharacteristicMetadataFormatBool();
  LODWORD(v4) = [v5 isEqualToString:v6];

  if (v4)
  {
    v23[0] = objc_opt_class();
    v7 = (void *)MEMORY[0x1E4F1C978];
    id v8 = v23;
LABEL_5:
    objc_super v11 = [v7 arrayWithObjects:v8 count:1];
    goto LABEL_17;
  }
  v9 = getHMCharacteristicMetadataFormatString[0]();
  int v10 = [v5 isEqualToString:v9];

  if (v10)
  {
    uint64_t v22 = objc_opt_class();
    v7 = (void *)MEMORY[0x1E4F1C978];
    id v8 = &v22;
    goto LABEL_5;
  }
  v12 = getHMCharacteristicMetadataFormatInt[0]();
  if ([v5 isEqualToString:v12]) {
    goto LABEL_15;
  }
  v13 = getHMCharacteristicMetadataFormatFloat[0]();
  if ([v5 isEqualToString:v13])
  {
LABEL_14:

LABEL_15:
LABEL_16:
    v17 = [(WFGetHomeAccessoryStateAction *)self outputMeasurementUnitType];
    uint64_t v21 = objc_opt_class();
    objc_super v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];

    goto LABEL_17;
  }
  v14 = getHMCharacteristicMetadataFormatUInt8();
  if ([v5 isEqualToString:v14])
  {
LABEL_13:

    goto LABEL_14;
  }
  v15 = getHMCharacteristicMetadataFormatUInt16[0]();
  if ([v5 isEqualToString:v15])
  {
LABEL_12:

    goto LABEL_13;
  }
  v16 = getHMCharacteristicMetadataFormatUInt32[0]();
  if ([v5 isEqualToString:v16])
  {

    goto LABEL_12;
  }
  v19 = getHMCharacteristicMetadataFormatUInt64[0]();
  char v20 = [v5 isEqualToString:v19];

  if (v20) {
    goto LABEL_16;
  }
  objc_super v11 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_17:

  return v11;
}

- (id)localizedAttributionWithContext:(id)a3
{
  id v4 = a3;
  v5 = [(WFGetHomeAccessoryStateAction *)self homeName];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)WFGetHomeAccessoryStateAction;
    id v7 = [(WFAction *)&v10 localizedAttributionWithContext:v4];
  }
  id v8 = v7;

  return v8;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = +[WFHomeManager sharedManager];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__WFGetHomeAccessoryStateAction_runAsynchronouslyWithInput___block_invoke;
  v5[3] = &unk_1E6558B28;
  v5[4] = self;
  [v4 ensureHomesAreLoadedWithCompletionHandler:v5];
}

void __60__WFGetHomeAccessoryStateAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) characteristic];

  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = [v3 characteristic];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __60__WFGetHomeAccessoryStateAction_runAsynchronouslyWithInput___block_invoke_2;
    v5[3] = &unk_1E6557668;
    v5[4] = *(void *)(a1 + 32);
    [v4 readValueWithCompletionHandler:v5];
  }
  else
  {
    [v3 finishRunningWithError:0];
  }
}

void __60__WFGetHomeAccessoryStateAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2)
{
  id v11 = a2;
  v3 = [*(id *)(a1 + 32) characteristic];
  id v4 = [v3 value];
  if (!v11 && v4)
  {
    v5 = WFUnitForHMCharacteristic(v3);
    if (v5)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F28E28]);
      [v4 doubleValue];
      id v7 = objc_msgSend(v6, "initWithDoubleValue:unit:", v5);
      id v8 = [*(id *)(a1 + 32) output];
      v9 = v8;
      objc_super v10 = v7;
    }
    else
    {
      id v7 = [*(id *)(a1 + 32) output];
      v9 = WFFormattedCharacteristicValueForCharacteristic(v3);
      id v8 = v7;
      objc_super v10 = v9;
    }
    [v8 addObject:v10];
  }
  [*(id *)(a1 + 32) finishRunningWithError:v11];
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:@"WFHome"])
  {
    id v8 = v6;
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v9 = v8;
      }
      else {
        v9 = 0;
      }
    }
    else
    {
      v9 = 0;
    }
    id v11 = v9;

    v12 = [v11 value];

    BOOL v10 = v12 != 0;
    if (v12)
    {
      v13 = [[WFHMServiceParameterState alloc] initWithService:0 homeIdentifier:v12];
      v14 = [[WFHMCharacteristicSubstitutableState alloc] initWithCharacteristic:0 homeIdentifier:v12];
      [(WFGetHomeAccessoryStateAction *)self setParameterState:v13 forKey:@"WFHMService"];
      [(WFGetHomeAccessoryStateAction *)self setParameterState:v14 forKey:@"WFHMCharacteristic"];
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)WFGetHomeAccessoryStateAction;
    if ([(WFAction *)&v16 setParameterState:v6 forKey:v7])
    {
      if ([v7 isEqualToString:@"WFHMCharacteristic"]) {
        [(WFAction *)self outputDetailsUpdated];
      }
      if ([v7 isEqualToString:@"WFHMService"]) {
        [(WFGetHomeAccessoryStateAction *)self updateCharacteristicsEnumeration];
      }
      BOOL v10 = 1;
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (id)parameterStateForKey:(id)a3 fallingBackToDefaultValue:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 isEqualToString:@"WFHome"])
  {
    id v7 = [(WFGetHomeAccessoryStateAction *)self homeIdentifier];
    if (v7) {
      id v8 = [(WFVariableSubstitutableParameterState *)[WFStringSubstitutableState alloc] initWithValue:v7];
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)WFGetHomeAccessoryStateAction;
    id v8 = [(WFAction *)&v10 parameterStateForKey:v6 fallingBackToDefaultValue:v4];
  }

  return v8;
}

- (void)wasAddedToWorkflow:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)WFGetHomeAccessoryStateAction;
  [(WFAction *)&v7 wasAddedToWorkflow:v4];
  v5 = [(WFAction *)self parameterForKey:@"WFHome"];
  BOOL v6 = [v4 environment] == 2 || objc_msgSend(v4, "environment") == 1;
  [v5 setHidden:v6];
}

- (void)wasAddedToWorkflowByUser:(id)a3
{
  id v4 = a3;
  v5 = [(WFGetHomeAccessoryStateAction *)self home];

  if (!v5)
  {
    BOOL v6 = +[WFHomeManager sharedManager];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__WFGetHomeAccessoryStateAction_wasAddedToWorkflowByUser___block_invoke;
    v8[3] = &unk_1E6558B28;
    v8[4] = self;
    [v6 ensureHomesAreLoadedWithCompletionHandler:v8];
  }
  v7.receiver = self;
  v7.super_class = (Class)WFGetHomeAccessoryStateAction;
  [(WFAction *)&v7 wasAddedToWorkflowByUser:v4];
}

void __58__WFGetHomeAccessoryStateAction_wasAddedToWorkflowByUser___block_invoke(uint64_t a1)
{
  v2 = +[WFHomeManager sharedManager];
  id v7 = [v2 primaryHome];

  v3 = v7;
  if (v7)
  {
    id v4 = WFSerializableHomeIdentifier(v7);
    v5 = [[WFHMServiceParameterState alloc] initWithService:0 homeIdentifier:v4];
    BOOL v6 = [[WFHMCharacteristicSubstitutableState alloc] initWithCharacteristic:0 homeIdentifier:v4];
    [*(id *)(a1 + 32) setParameterState:v5 forKey:@"WFHMService"];
    [*(id *)(a1 + 32) setParameterState:v6 forKey:@"WFHMCharacteristic"];

    v3 = v7;
  }
}

- (void)dealloc
{
  v3 = +[WFHomeManager sharedManager];
  [v3 removeEventObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)WFGetHomeAccessoryStateAction;
  [(WFGetHomeAccessoryStateAction *)&v4 dealloc];
}

- (void)initializeParameters
{
  v4.receiver = self;
  v4.super_class = (Class)WFGetHomeAccessoryStateAction;
  [(WFAction *)&v4 initializeParameters];
  [(WFGetHomeAccessoryStateAction *)self updateCharacteristicsEnumeration];
  v3 = +[WFHomeManager sharedManager];
  [v3 addEventObserver:self];
}

@end