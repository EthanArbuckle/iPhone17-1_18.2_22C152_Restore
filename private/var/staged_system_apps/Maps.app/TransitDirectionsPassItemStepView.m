@interface TransitDirectionsPassItemStepView
- ($29727DC6989B69F22950FCD998EA20D4)_metrics;
- (double)bottomSpacerHeight;
- (void)_updateFonts;
@end

@implementation TransitDirectionsPassItemStepView

- ($29727DC6989B69F22950FCD998EA20D4)_metrics
{
  retstr->var6 = 0.0;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  v16.receiver = self;
  v16.super_class = (Class)TransitDirectionsPassItemStepView;
  [($29727DC6989B69F22950FCD998EA20D4 *)&v16 _metrics];
  v5 = [(TransitDirectionsStepView *)self transitListItem];
  id v6 = [v5 type];

  if (v6 == (id)6)
  {
    retstr->var6 = 0.0;
    *(_OWORD *)&retstr->var2 = 0u;
    *(_OWORD *)&retstr->var4 = 0u;
    *(_OWORD *)&retstr->var0 = 0u;
    v7 = [(TransitDirectionsPassItemStepView *)self traitCollection];
    [v7 userInterfaceIdiom];

    retstr->var2 = 8.0;
  }
  else
  {
    v9 = [(TransitDirectionsPassItemStepView *)self traitCollection];
    if ([v9 userInterfaceIdiom] == (id)5) {
      double v10 = 1.0;
    }
    else {
      double v10 = 0.0;
    }

    retstr->var0 = v10;
    v11 = [(TransitDirectionsInstructionsStepView *)self primaryLabel];
    v12 = [v11 font];
    v13 = [(TransitDirectionsPassItemStepView *)self traitCollection];
    if ([v13 userInterfaceIdiom] == (id)5) {
      double v14 = 15.0;
    }
    else {
      double v14 = 20.0;
    }

    [v12 _scaledValueForValue:v14];
    retstr->var2 = v15;
  }
  return result;
}

- (void)_updateFonts
{
  if (sub_1000BBB44(self) == 5) {
    +[UIFont system17];
  }
  else {
  v3 = +[UIFont system15];
  }
  v4 = [(TransitDirectionsInstructionsStepView *)self primaryLabel];
  [v4 setFont:v3];

  v5 = [(TransitDirectionsPassItemStepView *)self traitCollection];
  id v6 = [v5 userInterfaceIdiom];
  UIFontTextStyle v7 = UIFontTextStyleBody;
  if (v6 != (id)5) {
    UIFontTextStyle v7 = UIFontTextStyleSubheadline;
  }
  v8 = v7;

  v9 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:v8];

  double v10 = [v9 fontDescriptor];
  v11 = [v10 _mapkit_fontDescriptorByAddingFeaturesForTimeDisplayUseMonospace:1];

  v12 = +[UIFont fontWithDescriptor:v11 size:0.0];

  v13 = [(TransitDirectionsInstructionsStepView *)self primaryAccessoryLabel];
  [v13 setFont:v12];

  double v14 = self;
  id v21 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleSubheadline];
  double v15 = [(TransitDirectionsPassItemStepView *)v14 traitCollection];

  id v16 = [v15 userInterfaceIdiom];
  if (v16 == (id)5)
  {
    v17 = [v21 fontDescriptor];
    v18 = [v17 _mapkit_fontDescriptorByAddingFeaturesForTimeDisplay];

    uint64_t v19 = +[UIFont fontWithDescriptor:v18 size:0.0];

    id v21 = (id)v19;
  }
  v20 = [(TransitDirectionsInstructionsStepView *)v14 secondaryAccessoryLabel];
  [v20 setFont:v21];
}

- (double)bottomSpacerHeight
{
  v2 = [(TransitDirectionsPassItemStepView *)self traitCollection];
  if ([v2 userInterfaceIdiom] == (id)5) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }

  return v3;
}

@end