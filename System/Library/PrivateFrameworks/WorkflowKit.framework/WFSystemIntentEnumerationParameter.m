@interface WFSystemIntentEnumerationParameter
- (BOOL)alwaysShowsButton;
- (Class)singleStateClass;
- (INIntentSlotDescription)slotDescription;
- (WFSystemIntentEnumerationParameter)initWithDefinition:(id)a3;
- (id)localizedLabelForPossibleState:(id)a3;
- (id)possibleStates;
@end

@implementation WFSystemIntentEnumerationParameter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slotDescription, 0);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

- (INIntentSlotDescription)slotDescription
{
  return self->_slotDescription;
}

- (BOOL)alwaysShowsButton
{
  return 1;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  v4 = [a3 value];
  v5 = [v4 number];

  if (v5)
  {
    v6 = [(INIntentSlotDescription *)self->_slotDescription localizeValue:v5 forLanguage:0];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)possibleStates
{
  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    v4 = objc_opt_new();
    uint64_t v5 = 0;
    while (1)
    {
      v6 = [NSNumber numberWithInteger:++v5];
      v7 = [(INIntentSlotDescription *)self->_slotDescription localizeValue:v6 forLanguage:0];
      if (![v7 length]) {
        break;
      }
      v8 = [[WFNumberSubstitutableState alloc] initWithNumber:v6];
      [v4 addObject:v8];

      if (v5 == 0x7FFFFFFFFFFFFFFELL) {
        goto LABEL_7;
      }
    }

LABEL_7:
    v9 = (NSArray *)[v4 copy];
    v10 = self->_possibleStates;
    self->_possibleStates = v9;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

- (WFSystemIntentEnumerationParameter)initWithDefinition:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WFSystemIntentEnumerationParameter;
  uint64_t v5 = [(WFEnumerationParameter *)&v17 initWithDefinition:v4];
  if (v5)
  {
    v6 = [v4 objectForKey:@"IntentType"];
    uint64_t v7 = objc_opt_class();
    v8 = WFEnforceClass(v6, v7);

    v9 = [v4 objectForKey:@"SlotName"];
    uint64_t v10 = objc_opt_class();
    v11 = WFEnforceClass(v9, v10);

    v12 = INIntentSchemaGetIntentDescriptionWithType();
    uint64_t v13 = [v12 slotByName:v11];
    slotDescription = v5->_slotDescription;
    v5->_slotDescription = (INIntentSlotDescription *)v13;

    v15 = v5;
  }

  return v5;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end