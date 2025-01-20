@interface WLDetailWarningViewController
- (WLDetailWarningViewController)initWithWLDetailItem:(id)a3;
@end

@implementation WLDetailWarningViewController

- (WLDetailWarningViewController)initWithWLDetailItem:(id)a3
{
  id v4 = a3;
  int v5 = [v4 failed];
  v6 = @"exclamationmark.triangle";
  if (v5) {
    v6 = @"xmark";
  }
  v7 = v6;
  v8 = [v4 text];
  v9 = [v4 detailText];
  v14.receiver = self;
  v14.super_class = (Class)WLDetailWarningViewController;
  v10 = [(WLDetailWarningViewController *)&v14 initWithTitle:v8 detailText:v9 symbolName:v7];

  if (v10)
  {
    if ([v4 failed]) {
      [MEMORY[0x263F825C8] systemRedColor];
    }
    else {
    v11 = [MEMORY[0x263F825C8] systemOrangeColor];
    }
    v12 = [(WLDetailWarningViewController *)v10 headerView];
    [v12 setTintColor:v11];
  }
  return v10;
}

@end