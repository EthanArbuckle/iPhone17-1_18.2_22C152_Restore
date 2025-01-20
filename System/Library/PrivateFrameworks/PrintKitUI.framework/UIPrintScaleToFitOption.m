@interface UIPrintScaleToFitOption
- (BOOL)shouldShow;
- (id)printOptionTableViewCell;
- (id)summary;
- (void)updateValue:(id)a3;
@end

@implementation UIPrintScaleToFitOption

- (id)printOptionTableViewCell
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:1 reuseIdentifier:@"ScaleToFitPrintOption"];
  v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"Scale to fit paper size" value:@"Scale to fit paper size" table:@"Localizable"];
  v6 = [v3 textLabel];
  [v6 setText:v5];

  [v3 setSelectionStyle:0];
  v7 = createPrintKitUISwitch(*MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v8 = [(UIPrintOption *)self printInfo];
  objc_msgSend(v7, "setOn:", objc_msgSend(v8, "scaleToFit"));

  [v7 addTarget:self action:sel_updateValue_ forControlEvents:4096];
  [v3 setAccessoryView:v7];
  [(UIPrintOption *)self setTableViewCell:v3];

  return v3;
}

- (BOOL)shouldShow
{
  return 0;
}

- (void)updateValue:(id)a3
{
  uint64_t v4 = [a3 isOn];
  id v5 = [(UIPrintOption *)self printInfo];
  [v5 setScaleToFit:v4];
}

- (id)summary
{
  v2 = [(UIPrintOption *)self printInfo];
  int v3 = [v2 scaleToFit];
  uint64_t v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = v4;
  if (v3) {
    v6 = @"Scale to Fit";
  }
  else {
    v6 = @"No Scaling";
  }
  v7 = [v4 localizedStringForKey:v6 value:v6 table:@"Localizable"];

  return v7;
}

@end