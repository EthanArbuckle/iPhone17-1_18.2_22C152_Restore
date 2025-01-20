@interface PUITrackerOnboardingCell
- (PUITrackerOnboardingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation PUITrackerOnboardingCell

- (PUITrackerOnboardingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6 = a4;
  v7 = PUI_LocalizedStringForAppReport(@"TRACKER_ACTIVITY_ONBOARDING_TITLE");
  v15.receiver = self;
  v15.super_class = (Class)PUITrackerOnboardingCell;
  v8 = [(PUIOnboardingCell *)&v15 initWithStyle:a3 reuseIdentifier:v6 title:v7];

  if (v8)
  {
    v9 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:60.0];
    v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"shield.lefthalf.filled" withConfiguration:v9];
    v11 = [MEMORY[0x1E4FB1618] systemGreenColor];
    [(PUIOnboardingCell *)v8 setSymbolImage:v10 tintColor:v11];

    -[PUITrackerOnboardingCell setSeparatorInset:](v8, "setSeparatorInset:", 0.0, 0.0, 0.0, 0.0);
    v12 = PUI_LocalizedStringForAppReport(@"ONBOARDING_PARAGRAPH_1");
    v13 = PUI_LocalizedStringForAppReport(@"ONBOARDING_PARAGRAPH_1_FOOTER_LINK");
    [(PUIOnboardingCell *)v8 setDetailText:v12 linkText:v13];
  }
  return v8;
}

@end