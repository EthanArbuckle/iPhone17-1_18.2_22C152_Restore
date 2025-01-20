@interface WFSliderParameter
- (BOOL)shouldAlignLabels;
- (Class)singleStateClass;
- (NSNumber)maximumValue;
- (NSNumber)minimumValue;
- (WFImage)maximumIcon;
- (WFImage)minimumIcon;
- (WFSliderParameter)initWithDefinition:(id)a3;
- (id)defaultSerializedRepresentation;
- (id)localizedLabelWithState:(id)a3;
- (void)setMaximumValue:(id)a3;
- (void)setMinimumValue:(id)a3;
@end

@implementation WFSliderParameter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumValue, 0);
  objc_storeStrong((id *)&self->_minimumValue, 0);
}

- (NSNumber)maximumValue
{
  return self->_maximumValue;
}

- (NSNumber)minimumValue
{
  return self->_minimumValue;
}

- (id)localizedLabelWithState:(id)a3
{
  id v4 = a3;
  v5 = [v4 variable];

  if (v5)
  {
    v6 = [(WFParameter *)self localizedLabel];
  }
  else
  {
    if (v4) {
      [v4 number];
    }
    else {
    v7 = [(WFSliderParameter *)self minimumValue];
    }
    [v7 doubleValue];
    double v9 = v8;

    v10 = [(WFSliderParameter *)self minimumValue];
    [v10 doubleValue];
    double v12 = v11;

    v13 = [(WFSliderParameter *)self maximumValue];
    [v13 doubleValue];
    double v15 = v14;

    v16 = (void *)MEMORY[0x1E4F28EE0];
    v17 = [NSNumber numberWithDouble:(v9 - v12) / (v15 - v12)];
    v6 = [v16 localizedStringFromNumber:v17 numberStyle:3];
  }
  return v6;
}

- (WFImage)maximumIcon
{
  v2 = [(WFParameter *)self definition];
  v3 = [v2 objectForKey:@"MaximumIconName"];
  uint64_t v4 = objc_opt_class();
  v5 = WFEnforceClass(v3, v4);

  if (v5)
  {
    v6 = [MEMORY[0x1E4FB4770] workflowKitImageNamed:v5];
  }
  else
  {
    v6 = 0;
  }

  return (WFImage *)v6;
}

- (WFImage)minimumIcon
{
  v2 = [(WFParameter *)self definition];
  v3 = [v2 objectForKey:@"MinimumIconName"];
  uint64_t v4 = objc_opt_class();
  v5 = WFEnforceClass(v3, v4);

  if (v5)
  {
    v6 = [MEMORY[0x1E4FB4770] workflowKitImageNamed:v5];
  }
  else
  {
    v6 = 0;
  }

  return (WFImage *)v6;
}

- (void)setMaximumValue:(id)a3
{
  id v4 = &unk_1F23171D8;
  if (a3) {
    id v4 = a3;
  }
  v5 = (NSNumber *)v4;
  v6 = [(WFSliderParameter *)self maximumValue];
  char v7 = [v6 isEqualToNumber:v5];

  maximumValue = self->_maximumValue;
  self->_maximumValue = v5;

  if ((v7 & 1) == 0)
  {
    [(WFParameter *)self attributesDidChange];
  }
}

- (void)setMinimumValue:(id)a3
{
  id v4 = &unk_1F23171C0;
  if (a3) {
    id v4 = a3;
  }
  v5 = (NSNumber *)v4;
  v6 = [(WFSliderParameter *)self minimumValue];
  char v7 = [v6 isEqualToNumber:v5];

  minimumValue = self->_minimumValue;
  self->_minimumValue = v5;

  if ((v7 & 1) == 0)
  {
    [(WFParameter *)self attributesDidChange];
    [(WFParameter *)self defaultSerializedRepresentationDidChange];
  }
}

- (BOOL)shouldAlignLabels
{
  return 1;
}

- (id)defaultSerializedRepresentation
{
  v8.receiver = self;
  v8.super_class = (Class)WFSliderParameter;
  v3 = [(WFParameter *)&v8 defaultSerializedRepresentation];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [(WFSliderParameter *)self minimumValue];
    id v5 = +[WFNumberSubstitutableState serializedRepresentationFromNumber:v6];
  }
  return v5;
}

- (WFSliderParameter)initWithDefinition:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WFSliderParameter;
  id v5 = [(WFParameter *)&v18 initWithDefinition:v4];
  if (v5)
  {
    v6 = [v4 objectForKey:@"MinimumValue"];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = WFEnforceClass(v6, v7);
    double v9 = (void *)v8;
    if (v8) {
      v10 = (void *)v8;
    }
    else {
      v10 = &unk_1F23171C0;
    }
    objc_storeStrong((id *)&v5->_minimumValue, v10);

    double v11 = [v4 objectForKey:@"MaximumValue"];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = WFEnforceClass(v11, v12);
    double v14 = (void *)v13;
    if (v13) {
      double v15 = (void *)v13;
    }
    else {
      double v15 = &unk_1F23171D8;
    }
    objc_storeStrong((id *)&v5->_maximumValue, v15);

    v16 = v5;
  }

  return v5;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end