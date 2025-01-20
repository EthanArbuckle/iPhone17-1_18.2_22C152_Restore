@interface WFStepperParameter
- (Class)singleStateClass;
- (NSNumber)maximumValue;
- (NSNumber)minimumValue;
- (NSString)stepperDescription;
- (NSString)stepperPrefix;
- (WFStepperParameter)initWithDefinition:(id)a3;
- (id)defaultSerializedRepresentation;
- (id)localizedLabel;
- (id)localizedLabelFormatString;
- (id)localizedLabelWithState:(id)a3 includingPrefix:(BOOL)a4;
@end

@implementation WFStepperParameter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepperDescription, 0);
  objc_storeStrong((id *)&self->_stepperPrefix, 0);
  objc_storeStrong((id *)&self->_maximumValue, 0);
  objc_storeStrong((id *)&self->_minimumValue, 0);
}

- (NSString)stepperDescription
{
  return self->_stepperDescription;
}

- (NSString)stepperPrefix
{
  return self->_stepperPrefix;
}

- (NSNumber)maximumValue
{
  return self->_maximumValue;
}

- (NSNumber)minimumValue
{
  return self->_minimumValue;
}

- (id)localizedLabelWithState:(id)a3 includingPrefix:(BOOL)a4
{
  id v6 = a3;
  v7 = [v6 variable];

  if (v7)
  {
    id v8 = [(WFStepperParameter *)self localizedLabel];
    goto LABEL_16;
  }
  v9 = [v6 number];
  v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 integerValue];
  }
  else
  {
    v12 = [(WFStepperParameter *)self minimumValue];
    uint64_t v11 = [v12 integerValue];
  }
  v13 = [(WFParameter *)self definition];
  v14 = [v13 objectForKey:@"StepperNoun"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v14;
LABEL_10:
    v16 = v15;
    v17 = objc_msgSend(NSString, "localizedStringWithFormat:", v15, v11);
    v18 = v17;
    if (a4)
    {
      v19 = NSString;
      v20 = [(WFStepperParameter *)self localizedLabelFormatString];
      objc_msgSend(v19, "localizedStringWithFormat:", v20, v18);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v8 = v17;
    }

    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = [v14 localize];
    goto LABEL_10;
  }
  v16 = 0;
  id v8 = 0;
LABEL_15:

LABEL_16:
  return v8;
}

- (id)localizedLabel
{
  v3 = [(WFStepperParameter *)self stepperDescription];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WFStepperParameter;
    id v5 = [(WFParameter *)&v8 localizedLabel];
  }
  id v6 = v5;

  return v6;
}

- (id)defaultSerializedRepresentation
{
  v8.receiver = self;
  v8.super_class = (Class)WFStepperParameter;
  v3 = [(WFParameter *)&v8 defaultSerializedRepresentation];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [(WFStepperParameter *)self minimumValue];
    id v5 = +[WFNumberSubstitutableState serializedRepresentationFromNumber:v6];
  }
  return v5;
}

- (id)localizedLabelFormatString
{
  v3 = [(WFStepperParameter *)self stepperPrefix];

  if (v3)
  {
    v4 = [(WFStepperParameter *)self stepperPrefix];
    id v5 = [v4 stringByAppendingString:@" %@"];
  }
  else
  {
    id v5 = @"%@";
  }
  return v5;
}

- (WFStepperParameter)initWithDefinition:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)WFStepperParameter;
  id v5 = [(WFParameter *)&v27 initWithDefinition:v4];
  if (v5)
  {
    id v6 = [v4 objectForKey:@"MinimumValue"];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = WFEnforceClass(v6, v7);
    v9 = (void *)v8;
    if (v8) {
      v10 = (void *)v8;
    }
    else {
      v10 = &unk_1F2316D28;
    }
    objc_storeStrong((id *)&v5->_minimumValue, v10);

    uint64_t v11 = [v4 objectForKey:@"MaximumValue"];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = WFEnforceClass(v11, v12);
    v14 = (void *)v13;
    if (v13) {
      id v15 = (void *)v13;
    }
    else {
      id v15 = &unk_1F23180E8;
    }
    objc_storeStrong((id *)&v5->_maximumValue, v15);

    v16 = [v4 objectForKey:@"StepperPrefix"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = v16;
      stepperPrefix = v5->_stepperPrefix;
      v5->_stepperPrefix = v17;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_13;
      }
      uint64_t v19 = [v16 localize];
      stepperPrefix = v5->_stepperPrefix;
      v5->_stepperPrefix = (NSString *)v19;
    }

LABEL_13:
    v20 = [(WFParameter *)v5 definition];
    v21 = [v20 objectForKey:@"StepperDescription"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = v21;
      stepperDescription = v5->_stepperDescription;
      v5->_stepperDescription = v22;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_18:
        v25 = v5;

        goto LABEL_19;
      }
      uint64_t v24 = [v21 localize];
      stepperDescription = v5->_stepperDescription;
      v5->_stepperDescription = (NSString *)v24;
    }

    goto LABEL_18;
  }
LABEL_19:

  return v5;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end