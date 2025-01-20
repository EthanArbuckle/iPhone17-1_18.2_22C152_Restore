@interface PUILockdownModeOnboardingCell
- (PUILockdownModeOnboardingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PUILockdownModeOnboardingCell

- (PUILockdownModeOnboardingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6 = a4;
  v7 = PUI_LocalizedStringForLockdownMode(@"LOCKDOWN_MODE");
  v24.receiver = self;
  v24.super_class = (Class)PUILockdownModeOnboardingCell;
  v8 = [(PUIOnboardingCell *)&v24 initWithStyle:a3 reuseIdentifier:v6 title:v7];

  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F6F258]);
    v10 = [(PUILockdownModeOnboardingCell *)v8 traitCollection];
    [v10 displayScale];
    v12 = objc_msgSend(v9, "initWithSize:scale:", 60.0, 60.0, v11);

    v13 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithType:@"com.apple.graphic-icon.privacy"];
    v14 = [v13 prepareImageForDescriptor:v12];
    v15 = (void *)MEMORY[0x1E4FB1818];
    uint64_t v16 = [v14 CGImage];
    [v14 scale];
    v17 = objc_msgSend(v15, "imageWithCGImage:scale:orientation:", v16, 0);
    -[PUILockdownModeOnboardingCell setSeparatorInset:](v8, "setSeparatorInset:", 0.0, 0.0, 0.0, 0.0);
    [(PUIOnboardingCell *)v8 setSymbolImage:v17 tintColor:0];
    v18 = NSString;
    v19 = PUI_LocalizedStringForLockdownMode(@"ONBOARDING_CELL_DETAIL");
    v20 = getLocalizedDeviceName();
    v21 = objc_msgSend(v18, "stringWithFormat:", v19, v20);
    v22 = PUI_LocalizedStringForLockdownMode(@"ONBOARDING_CELL_LINK");
    [(PUIOnboardingCell *)v8 setDetailText:v21 linkText:v22];
  }
  return v8;
}

- (void)traitCollectionDidChange:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)PUILockdownModeOnboardingCell;
  id v4 = a3;
  [(PUILockdownModeOnboardingCell *)&v16 traitCollectionDidChange:v4];
  v5 = [(PUILockdownModeOnboardingCell *)self traitCollection];
  int v6 = [v4 hasDifferentColorAppearanceComparedToTraitCollection:v5];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F6F258]);
    v8 = [(PUILockdownModeOnboardingCell *)self traitCollection];
    [v8 displayScale];
    v10 = objc_msgSend(v7, "initWithSize:scale:", 60.0, 60.0, v9);

    double v11 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithType:@"com.apple.graphic-icon.privacy"];
    v12 = [v11 prepareImageForDescriptor:v10];
    v13 = (void *)MEMORY[0x1E4FB1818];
    uint64_t v14 = [v12 CGImage];
    [v12 scale];
    v15 = objc_msgSend(v13, "imageWithCGImage:scale:orientation:", v14, 0);
    [(PUIOnboardingCell *)self setSymbolImage:v15 tintColor:0];
  }
}

@end