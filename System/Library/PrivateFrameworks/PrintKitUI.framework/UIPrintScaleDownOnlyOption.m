@interface UIPrintScaleDownOnlyOption
- (BOOL)shouldShow;
- (id)printOptionTableViewCell;
- (id)summary;
- (void)updateValue:(id)a3;
@end

@implementation UIPrintScaleDownOnlyOption

- (id)printOptionTableViewCell
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:1 reuseIdentifier:@"ScaleDownOnlyPrintOption"];
  v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"Scale Down Only" value:@"Scale Down Only" table:@"Localizable"];
  v6 = [v3 textLabel];
  [v6 setText:v5];

  [v3 setSelectionStyle:0];
  v7 = createPrintKitUISwitch(*MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v8 = [(UIPrintOption *)self printInfo];
  objc_msgSend(v7, "setOn:", objc_msgSend(v8, "scaleDownOnly"));

  [v7 addTarget:self action:sel_updateValue_ forControlEvents:4096];
  [v3 setAccessoryView:v7];
  [(UIPrintOption *)self setTableViewCell:v3];

  return v3;
}

- (BOOL)shouldShow
{
  v2 = [(UIPrintOption *)self printInfo];
  char v3 = [v2 scaleToFit];

  return v3;
}

- (void)updateValue:(id)a3
{
  uint64_t v4 = [a3 isOn];
  id v5 = [(UIPrintOption *)self printInfo];
  [v5 setScaleDownOnly:v4];
}

- (id)summary
{
  v2 = [(UIPrintOption *)self printInfo];
  if ([v2 scaleDownOnly])
  {
    char v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v4 = [v3 localizedStringForKey:@"Scale Down Only" value:@"Scale Down Only" table:@"Localizable"];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

@end