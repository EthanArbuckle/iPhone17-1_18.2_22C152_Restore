@interface UIPrintAppOptionsSection
- (UIPrintAppOptionsProtocol)appOptionsViewController;
- (UIPrintAppOptionsSection)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4 appOptionsViewController:(id)a5;
- (id)summaryString;
- (void)dealloc;
- (void)didSelectPrintOptionSection;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAppOptionsViewController:(id)a3;
- (void)thumbnailsNeedUpdate:(id)a3;
@end

@implementation UIPrintAppOptionsSection

- (UIPrintAppOptionsSection)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4 appOptionsViewController:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)UIPrintAppOptionsSection;
  v10 = [(UIPrintOptionSection *)&v20 initWithPrintInfo:v8 printPanelViewController:a4];
  v11 = v10;
  if (v10)
  {
    [(UIPrintAppOptionsSection *)v10 setAppOptionsViewController:v9];
    v12 = [(UIPrintAppOptionsSection *)v11 appOptionsViewController];
    [v12 setPrintInfo:v8];

    v13 = [v9 title];
    [(UIPrintOptionSection *)v11 setTitle:v13];

    v14 = [(UIPrintOptionSection *)v11 title];

    if (!v14)
    {
      v15 = [MEMORY[0x1E4F28B50] mainBundle];
      v16 = [v15 objectForInfoDictionaryKey:@"CFBundleDisplayName"];
      [(UIPrintOptionSection *)v11 setTitle:v16];
    }
    v17 = [(UIPrintAppOptionsSection *)v11 appOptionsViewController];
    [v17 addObserver:v11 forKeyPath:@"summary" options:0 context:0];

    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v11 selector:sel_thumbnailsNeedUpdate_ name:@"UIPrintThumbnailsNeedUpdateNotification" object:v9];
  }
  return v11;
}

- (void)dealloc
{
  v3 = [(UIPrintAppOptionsSection *)self appOptionsViewController];
  [v3 removeObserver:self forKeyPath:@"summary"];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)UIPrintAppOptionsSection;
  [(UIPrintAppOptionsSection *)&v5 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", @"summary", a4, a5, a6))
  {
    [(UIPrintOptionSection *)self updateSectionSummary];
  }
}

- (void)thumbnailsNeedUpdate:(id)a3
{
  id v3 = [(UIPrintOptionSection *)self printPanelViewController];
  [v3 resetPreviewPages];
}

- (id)summaryString
{
  v2 = [(UIPrintAppOptionsSection *)self appOptionsViewController];
  id v3 = [v2 summary];

  return v3;
}

- (void)didSelectPrintOptionSection
{
  id v7 = [(UIPrintOptionSection *)self printPanelViewController];
  id v3 = [(UIPrintAppOptionsSection *)self appOptionsViewController];
  v4 = [v3 navigationItem];
  [v7 addPrintShareButtonsToNavItem:v4];

  objc_super v5 = [v7 printOptionsNavController];
  v6 = [(UIPrintAppOptionsSection *)self appOptionsViewController];
  [v5 pushViewController:v6 animated:1];
}

- (UIPrintAppOptionsProtocol)appOptionsViewController
{
  return self->_appOptionsViewController;
}

- (void)setAppOptionsViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end