@interface UIPrintQualityOption
- (BOOL)shouldShow;
- (NSArray)printQualities;
- (NSArray)qualities;
- (UIPrintQualityOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4;
- (UIPrintQualityView)printQualityView;
- (id)printOptionTableViewCell;
- (id)shortSummary;
- (id)summaryString;
- (void)currentPrinterChanged;
- (void)dealloc;
- (void)didSelectPrintOption;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setPrintQualities:(id)a3;
- (void)setPrintQualityView:(id)a3;
- (void)setQualities:(id)a3;
- (void)updateFromPrintInfo;
@end

@implementation UIPrintQualityOption

- (UIPrintQualityOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)UIPrintQualityOption;
  v4 = [(UIPrintOption *)&v13 initWithPrintInfo:a3 printPanelViewController:a4];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"Print Quality" value:@"Print Quality" table:@"Localizable"];
    [(UIPrintOption *)v4 setTitle:v6];

    v7 = [UIPrintQualityView alloc];
    v8 = [(UIPrintOption *)v4 printInfo];
    v9 = -[UIPrintQualityView initWithFrame:printInfo:](v7, "initWithFrame:printInfo:", v8, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UIPrintQualityOption *)v4 setPrintQualityView:v9];

    [(UIPrintQualityOption *)v4 currentPrinterChanged];
    v10 = [(UIPrintOption *)v4 printInfo];
    [v10 addObserver:v4 forKeyPath:0x1F3C9DFD8 options:0 context:0];

    v11 = [(UIPrintOption *)v4 printInfo];
    [v11 addObserver:v4 forKeyPath:0x1F3C9DE58 options:0 context:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [(UIPrintOption *)self printInfo];
  [v3 removeObserver:self forKeyPath:0x1F3C9DFD8];

  v4 = [(UIPrintOption *)self printInfo];
  [v4 removeObserver:self forKeyPath:0x1F3C9DE58];

  v5.receiver = self;
  v5.super_class = (Class)UIPrintQualityOption;
  [(UIPrintQualityOption *)&v5 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__UIPrintQualityOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v9[3] = &unk_1E6DA14F0;
  id v10 = v7;
  v11 = self;
  id v8 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

uint64_t __71__UIPrintQualityOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isEqualToString:0x1F3C9DE58];
  v3 = *(void **)(a1 + 40);
  if (v2)
  {
    return [v3 currentPrinterChanged];
  }
  else
  {
    return [v3 updateFromPrintInfo];
  }
}

- (NSArray)printQualities
{
  if (!self->_qualities)
  {
    v3 = [(UIPrintOption *)self printInfo];
    v4 = [v3 currentPrinter];
    objc_super v5 = [v4 printerInfoDict];

    if (v5)
    {
      v6 = [(UIPrintOption *)self printInfo];
      id v7 = [v6 currentPrinter];
      id v8 = [v7 supportedQualities];
      qualities = self->_qualities;
      self->_qualities = v8;
    }
  }
  id v10 = self->_qualities;
  return v10;
}

- (void)updateFromPrintInfo
{
  id v3 = [(UIPrintQualityOption *)self summaryString];
  [(UIPrintOption *)self setSummary:v3];
}

- (void)currentPrinterChanged
{
  [(UIPrintQualityOption *)self setPrintQualities:0];
  [(UIPrintQualityOption *)self updateFromPrintInfo];
}

- (BOOL)shouldShow
{
  int v2 = [(UIPrintQualityOption *)self printQualities];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (id)printOptionTableViewCell
{
  v23[4] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(UIPrintOption *)self printPanelViewController];
  v4 = [v3 printOptionsTableView];
  objc_super v5 = [v4 dequeueReusableCellWithIdentifier:@"UIPrintQualityCell"];

  if (!v5)
  {
    objc_super v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"UIPrintQualityCell"];
    v6 = [(UIPrintQualityOption *)self printQualityView];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v6 setUserInteractionEnabled:1];
    id v7 = [v5 contentView];
    [v7 addSubview:v6];

    id v8 = (void *)MEMORY[0x1E4F28DC8];
    v19 = (void *)MEMORY[0x1E4F28DC8];
    v22 = [v6 superview];
    v21 = [v8 constraintWithItem:v6 attribute:3 relatedBy:0 toItem:v22 attribute:15 multiplier:1.0 constant:0.0];
    v23[0] = v21;
    v9 = (void *)MEMORY[0x1E4F28DC8];
    v20 = [v6 superview];
    id v10 = [v9 constraintWithItem:v6 attribute:5 relatedBy:0 toItem:v20 attribute:5 multiplier:1.0 constant:0.0];
    v23[1] = v10;
    v11 = (void *)MEMORY[0x1E4F28DC8];
    v12 = [v6 superview];
    objc_super v13 = [v11 constraintWithItem:v6 attribute:6 relatedBy:0 toItem:v12 attribute:6 multiplier:1.0 constant:0.0];
    v23[2] = v13;
    v14 = (void *)MEMORY[0x1E4F28DC8];
    v15 = [v6 superview];
    v16 = [v14 constraintWithItem:v6 attribute:4 relatedBy:0 toItem:v15 attribute:4 multiplier:1.0 constant:0.0];
    v23[3] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
    [v19 activateConstraints:v17];
  }
  [v5 setSelectionStyle:0];
  [v5 setUserInteractionEnabled:1];
  [(UIPrintOption *)self setTableViewCell:v5];

  return v5;
}

- (id)shortSummary
{
  BOOL v3 = [(UIPrintOption *)self printInfo];
  uint64_t v4 = [v3 quality];

  if (v4 == 3)
  {
    objc_super v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v6 = v5;
    id v7 = @"Draft";
  }
  else
  {
    id v8 = [(UIPrintOption *)self printInfo];
    uint64_t v9 = [v8 quality];

    objc_super v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v6 = v5;
    if (v9 == 5) {
      id v7 = @"Best";
    }
    else {
      id v7 = @"Normal";
    }
  }
  id v10 = [v5 localizedStringForKey:v7 value:v7 table:@"Localizable"];

  return v10;
}

- (id)summaryString
{
  BOOL v3 = NSString;
  uint64_t v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v5 = [v4 localizedStringForKey:@"%@ Quality" value:@"%@ Quality" table:@"Localizable"];
  v6 = [(UIPrintQualityOption *)self shortSummary];
  id v7 = objc_msgSend(v3, "stringWithFormat:", v5, v6);

  return v7;
}

- (void)didSelectPrintOption
{
  id v2 = [(UIPrintOption *)self tableViewCell];
  [v2 printOptionCellTapped];
}

- (NSArray)qualities
{
  return self->_qualities;
}

- (void)setQualities:(id)a3
{
}

- (void)setPrintQualities:(id)a3
{
}

- (UIPrintQualityView)printQualityView
{
  return self->_printQualityView;
}

- (void)setPrintQualityView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printQualityView, 0);
  objc_storeStrong((id *)&self->_printQualities, 0);
  objc_storeStrong((id *)&self->_qualities, 0);
}

@end