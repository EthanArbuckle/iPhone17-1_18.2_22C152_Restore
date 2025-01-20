@interface UIPrintScalingSection
- (BOOL)updatePrintOptionsList;
- (UIPrintScaleDownOnlyOption)scaleDownOnlyPrintOption;
- (UIPrintScaleToFitOption)scaleToFitPrintOption;
- (UIPrintScalingSection)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4;
- (void)scaleToFitChanged;
- (void)setScaleDownOnlyPrintOption:(id)a3;
- (void)setScaleToFitPrintOption:(id)a3;
@end

@implementation UIPrintScalingSection

- (UIPrintScalingSection)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UIPrintScalingSection;
  v8 = [(UIPrintOptionSection *)&v14 initWithPrintInfo:v6 printPanelViewController:v7];
  if (v8)
  {
    v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"Scaling" value:@"Scaling" table:@"Localizable"];
    [(UIPrintOptionSection *)v8 setTitle:v10];

    v11 = [(UIPrintOption *)[UIPrintScaleToFitOption alloc] initWithPrintInfo:v6 printPanelViewController:v7];
    [(UIPrintScalingSection *)v8 setScaleToFitPrintOption:v11];

    v12 = [(UIPrintOption *)[UIPrintScaleDownOnlyOption alloc] initWithPrintInfo:v6 printPanelViewController:v7];
    [(UIPrintScalingSection *)v8 setScaleDownOnlyPrintOption:v12];

    [(UIPrintScalingSection *)v8 updatePrintOptionsList];
  }

  return v8;
}

- (BOOL)updatePrintOptionsList
{
  v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  v4 = [(UIPrintScalingSection *)self scaleToFitPrintOption];
  int v5 = [v4 shouldShow];

  if (v5)
  {
    id v6 = [(UIPrintScalingSection *)self scaleToFitPrintOption];
    [v3 addObject:v6];
  }
  id v7 = [(UIPrintScalingSection *)self scaleDownOnlyPrintOption];
  int v8 = [v7 shouldShow];

  if (v8)
  {
    v9 = [(UIPrintScalingSection *)self scaleDownOnlyPrintOption];
    [v3 addObject:v9];
  }
  v10 = [(UIPrintOptionSection *)self printOptions];
  char v11 = [v10 isEqualToArray:v3];

  if ((v11 & 1) == 0) {
    [(UIPrintOptionSection *)self setPrintOptions:v3];
  }

  return v11 ^ 1;
}

- (void)scaleToFitChanged
{
  [(UIPrintScalingSection *)self updatePrintOptionsList];
  id v4 = [(UIPrintOptionSection *)self printPanelViewController];
  v3 = [v4 printOptionsTableView];
  [v3 reloadData];
}

- (UIPrintScaleToFitOption)scaleToFitPrintOption
{
  return self->_scaleToFitPrintOption;
}

- (void)setScaleToFitPrintOption:(id)a3
{
}

- (UIPrintScaleDownOnlyOption)scaleDownOnlyPrintOption
{
  return self->_scaleDownOnlyPrintOption;
}

- (void)setScaleDownOnlyPrintOption:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scaleDownOnlyPrintOption, 0);
  objc_storeStrong((id *)&self->_scaleToFitPrintOption, 0);
}

@end