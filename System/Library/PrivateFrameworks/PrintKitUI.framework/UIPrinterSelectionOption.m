@interface UIPrinterSelectionOption
- (BOOL)contactingPrinter;
- (BOOL)filtersPrinters;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (PKPrinter)printer;
- (UIPrinterBrowserViewController)browserController;
- (UIPrinterSelectionOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4;
- (id)printOptionTableViewCell;
- (id)printerDisplayName:(id)a3;
- (id)summary;
- (unint64_t)supportedInterfaceOrientations;
- (void)didSelectPrintOption;
- (void)setBrowserController:(id)a3;
- (void)setContactingPrinter:(BOOL)a3;
- (void)setPrinter:(id)a3;
- (void)setShowContactingPrinter:(BOOL)a3;
- (void)showContacting;
@end

@implementation UIPrinterSelectionOption

- (UIPrinterSelectionOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UIPrinterSelectionOption;
  v4 = [(UIPrintOption *)&v8 initWithPrintInfo:a3 printPanelViewController:a4];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"PRINTER_OPTION_TITLE" value:@"Printer" table:@"Localizable"];
    [(UIPrintOption *)v4 setTitle:v6];
  }
  return v4;
}

- (id)printOptionTableViewCell
{
  v3 = [(UIPrintOption *)self printPanelViewController];
  v4 = [v3 printOptionsTableView];
  v5 = [v4 dequeueReusableCellWithIdentifier:@"UIPrintOptionCell"];

  [(UIPrintOption *)self setTableViewCell:v5];
  v6 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
  v7 = [(UIPrintOption *)self title];
  [v6 setText:v7];

  objc_super v8 = [(UIPrinterSelectionOption *)self summary];
  [v6 setSecondaryText:v8];

  [v5 setContentConfiguration:v6];
  if ([(UIPrinterSelectionOption *)self contactingPrinter])
  {
    [(UIPrinterSelectionOption *)self showContacting];
  }
  else
  {
    [v5 setAccessoryView:0];
    [v5 setAccessoryType:1];
    [v5 setSelectionStyle:3];
  }

  return v5;
}

- (id)printerDisplayName:(id)a3
{
  v3 = [a3 _internalPrinter];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 displayName];
  }
  else
  {
    v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v5 = [v6 localizedStringForKey:@"No Printer Selected" value:@"No Printer Selected" table:@"Localizable"];
  }
  return v5;
}

- (id)summary
{
  v3 = [(UIPrintOption *)self printInfo];
  v4 = [v3 currentPrinter];
  v5 = [(UIPrinterSelectionOption *)self printerDisplayName:v4];

  return v5;
}

- (void)didSelectPrintOption
{
  v3 = [(UIPrintOption *)self printPanelViewController];
  id v12 = [v3 printOptionsNavController];

  v4 = [v12 topViewController];
  v5 = [(UIPrinterSelectionOption *)self browserController];

  if (v4 != v5)
  {
    v6 = [(UIPrinterSelectionOption *)self browserController];

    if (!v6)
    {
      v7 = [UIPrinterBrowserViewController alloc];
      objc_super v8 = [(UIPrintOption *)self printPanelViewController];
      v9 = [v8 printInfo];
      v10 = [(UIPrinterBrowserViewController *)v7 initWithOwnerViewController:self printInfo:v9];
      [(UIPrinterSelectionOption *)self setBrowserController:v10];
    }
    v11 = [(UIPrinterSelectionOption *)self browserController];
    [v12 pushViewController:v11 animated:1];
  }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (BOOL)filtersPrinters
{
  return 0;
}

- (PKPrinter)printer
{
  v2 = [(UIPrintOption *)self printInfo];
  v3 = [v2 currentPrinter];
  v4 = [v3 _internalPrinter];

  return (PKPrinter *)v4;
}

- (void)setPrinter:(id)a3
{
  id v4 = a3;
  id v6 = [[UIPrinter alloc] _initWithPrinter:v4];

  v5 = [(UIPrintOption *)self printInfo];
  [v5 setCurrentPrinter:v6];
}

- (void)showContacting
{
  id v3 = [(UIPrintOption *)self tableViewCell];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:4];
  [v3 setAccessoryView:v2];
  [v2 startAnimating];
}

- (void)setShowContactingPrinter:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(UIPrintOption *)self tableViewCell];
  if (!v3)
  {
    [(UIPrinterSelectionOption *)self setContactingPrinter:0];
    [MEMORY[0x1E4F1CAC0] cancelPreviousPerformRequestsWithTarget:self selector:sel_showContacting object:0];
    if (pthread_main_np() == 1)
    {
      [v5 setAccessoryView:0];
      [v5 setAccessoryType:1];
      goto LABEL_9;
    }
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__UIPrinterSelectionOption_setShowContactingPrinter___block_invoke_2;
    v7[3] = &unk_1E6DA1408;
    id v8 = v5;
    dispatch_sync(MEMORY[0x1E4F14428], v7);
    id v6 = v8;
LABEL_8:

    goto LABEL_9;
  }
  [(UIPrinterSelectionOption *)self setContactingPrinter:1];
  if (pthread_main_np() != 1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__UIPrinterSelectionOption_setShowContactingPrinter___block_invoke;
    block[3] = &unk_1E6DA14F0;
    id v10 = v5;
    v11 = self;
    dispatch_sync(MEMORY[0x1E4F14428], block);
    id v6 = v10;
    goto LABEL_8;
  }
  [v5 setSelectionStyle:0];
  [(UIPrinterSelectionOption *)self performSelector:sel_showContacting withObject:0 afterDelay:0.1];
LABEL_9:
}

uint64_t __53__UIPrinterSelectionOption_setShowContactingPrinter___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setSelectionStyle:0];
  v2 = *(void **)(a1 + 40);
  return [v2 performSelector:sel_showContacting withObject:0 afterDelay:0.1];
}

uint64_t __53__UIPrinterSelectionOption_setShowContactingPrinter___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAccessoryView:0];
  v2 = *(void **)(a1 + 32);
  return [v2 setAccessoryType:1];
}

- (UIPrinterBrowserViewController)browserController
{
  return self->_browserController;
}

- (void)setBrowserController:(id)a3
{
}

- (BOOL)contactingPrinter
{
  return self->_contactingPrinter;
}

- (void)setContactingPrinter:(BOOL)a3
{
  self->_contactingPrinter = a3;
}

- (void).cxx_destruct
{
}

@end