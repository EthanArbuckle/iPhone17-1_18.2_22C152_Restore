@interface WFLocationAccuracyParameter
- (id)defaultSerializedRepresentation;
- (id)localizedLabelForPossibleState:(id)a3;
- (id)possibleStates;
@end

@implementation WFLocationAccuracyParameter

- (id)localizedLabelForPossibleState:(id)a3
{
  id v3 = a3;
  v4 = [v3 value];
  char v5 = [v4 isEqualToString:@"Best"];

  if (v5)
  {
    v6 = @"Best";
LABEL_11:
    v15 = WFLocalizedString(v6);
    goto LABEL_12;
  }
  v7 = [v3 value];
  char v8 = [v7 isEqualToString:@"NearestTenMeters"];

  if (v8)
  {
    v6 = @"Nearest Ten Meters";
    goto LABEL_11;
  }
  v9 = [v3 value];
  char v10 = [v9 isEqualToString:@"HundredMeters"];

  if (v10)
  {
    v6 = @"Nearest Hundred Meters";
    goto LABEL_11;
  }
  v11 = [v3 value];
  char v12 = [v11 isEqualToString:@"Kilometer"];

  if (v12)
  {
    v6 = @"Nearest Kilometer";
    goto LABEL_11;
  }
  v13 = [v3 value];
  int v14 = [v13 isEqualToString:@"ThreeKilometers"];

  if (v14)
  {
    v6 = @"Nearest Three Kilometers";
    goto LABEL_11;
  }
  v15 = 0;
LABEL_12:

  return v15;
}

- (id)possibleStates
{
  v5[5] = *MEMORY[0x1E4F143B8];
  v5[0] = @"Best";
  v5[1] = @"NearestTenMeters";
  v5[2] = @"HundredMeters";
  v5[3] = @"Kilometer";
  v5[4] = @"ThreeKilometers";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:5];
  id v3 = objc_msgSend(v2, "if_map:", &__block_literal_global_9178);

  return v3;
}

WFStringSubstitutableState *__45__WFLocationAccuracyParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [(WFVariableSubstitutableParameterState *)[WFStringSubstitutableState alloc] initWithValue:v2];

  return v3;
}

- (id)defaultSerializedRepresentation
{
  id v2 = @"HundredMeters";
  return @"HundredMeters";
}

@end