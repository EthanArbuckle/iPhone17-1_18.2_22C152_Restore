@interface WFContentProperty(WFParameter)
- (id)parameterDefinition;
@end

@implementation WFContentProperty(WFParameter)

- (id)parameterDefinition
{
  v2 = objc_opt_new();
  v3 = WFLocalizedStringResourceWithKey(@"Value (ContentPropertyParameter)", @"Value");
  [v2 setObject:v3 forKeyedSubscript:@"Label"];

  v4 = NSNumber;
  if ([a1 multipleValues]) {
    uint64_t v5 = [a1 isLabeledValue] ^ 1;
  }
  else {
    uint64_t v5 = 0;
  }
  v6 = [v4 numberWithInt:v5];
  [v2 setObject:v6 forKeyedSubscript:@"AllowsMultipleValues"];

  v7 = (void *)[a1 propertyClass];
  if (([v7 isEqual:objc_opt_class()] & 1) != 0
    || ([v7 isEqual:objc_opt_class()] & 1) != 0
    || [v7 isEqual:objc_opt_class()])
  {
    if ([a1 hasPossibleValues])
    {
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      [v2 setObject:v9 forKeyedSubscript:@"Class"];

      [v2 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"ProvidesLocalizedValues"];
      v10 = [a1 possibleValues];
      v11 = WFContentPropertyGetPossibleValuesSynchronouslyWithSemaphore();
      [v2 setObject:v11 forKeyedSubscript:@"Items"];

LABEL_11:
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  if (![v7 isEqual:objc_opt_class()])
  {
    if (![v7 isEqual:objc_opt_class()]
      && ![v7 isEqual:objc_opt_class()]
      && ![v7 isEqual:objc_opt_class()]
      && ![v7 isEqual:objc_opt_class()]
      && ![v7 isEqual:objc_opt_class()])
    {
      v21 = [NSNumber numberWithBool:1];
      int v22 = [v7 isEqual:objc_opt_class()];

      if (v22)
      {
        v23 = (objc_class *)objc_opt_class();
        v24 = NSStringFromClass(v23);
        [v2 setObject:v24 forKeyedSubscript:@"Class"];

        v25 = WFLocalizedStringResourceWithKey(@"Yes (ContentPropertyParameter)", @"Yes");
        [v2 setObject:v25 forKeyedSubscript:@"OnDisplayName"];

        v10 = WFLocalizedStringResourceWithKey(@"No (ContentPropertyParameter)", @"No");
        v13 = @"OffDisplayName";
        goto LABEL_10;
      }
      [v7 isEqual:objc_opt_class()];
    }
LABEL_9:
    v12 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v12);
    v13 = @"Class";
LABEL_10:
    [v2 setObject:v10 forKeyedSubscript:v13];
    goto LABEL_11;
  }
  v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  [v2 setObject:v16 forKeyedSubscript:@"Class"];

  if (([a1 timeUnits] & 0x40) != 0) {
    LODWORD(v17) = 1;
  }
  else {
    unint64_t v17 = ((unint64_t)[a1 timeUnits] >> 5) & 1;
  }
  if (([a1 timeUnits] & 4) != 0
    || ([a1 timeUnits] & 8) != 0
    || ([a1 timeUnits] & 0x10) != 0)
  {
    LODWORD(v19) = 1;
LABEL_28:
    if (v19 ^ 1 | v17) {
      v20 = WFDateFieldHintDateModeDateAndTime;
    }
    else {
      v20 = WFDateFieldHintDateModeDate;
    }
    goto LABEL_31;
  }
  unint64_t v18 = [a1 timeUnits];
  uint64_t v19 = (v18 >> 13) & 1;
  if (!v17 || (v18 & 0x2000) != 0) {
    goto LABEL_28;
  }
  v20 = WFDateFieldHintDateModeTime;
LABEL_31:
  [v2 setObject:*v20 forKeyedSubscript:@"HintDateMode"];
  [v2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"DetectsAllDayDates"];
  [v2 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"DisplaysAllDayString"];
  [v2 setObject:@"String" forKeyedSubscript:@"ResultType"];
LABEL_12:
  return v2;
}

@end