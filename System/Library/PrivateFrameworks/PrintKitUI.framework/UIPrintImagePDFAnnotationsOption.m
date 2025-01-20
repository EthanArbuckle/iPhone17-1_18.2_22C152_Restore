@interface UIPrintImagePDFAnnotationsOption
- (BOOL)shouldShow;
- (UIPrintImagePDFAnnotationsOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4;
- (UISwitch)imagePDFAnnotationsSwitch;
- (id)printOptionTableViewCell;
- (id)summary;
- (void)changeImagePDFAnnotations:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setImagePDFAnnotationsSwitch:(id)a3;
- (void)updateFromPrintInfo;
@end

@implementation UIPrintImagePDFAnnotationsOption

- (UIPrintImagePDFAnnotationsOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UIPrintImagePDFAnnotationsOption;
  v4 = [(UIPrintOption *)&v8 initWithPrintInfo:a3 printPanelViewController:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(UIPrintOption *)v4 printInfo];
    [v6 addObserver:v5 forKeyPath:0x1F3C9DE38 options:0 context:0];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [(UIPrintOption *)self printInfo];
  [v3 removeObserver:self forKeyPath:0x1F3C9DE38];

  v4.receiver = self;
  v4.super_class = (Class)UIPrintImagePDFAnnotationsOption;
  [(UIPrintImagePDFAnnotationsOption *)&v4 dealloc];
}

- (BOOL)shouldShow
{
  v2 = [(UIPrintOption *)self printInfo];
  char v3 = [v2 pdfAnnotationsAvailable];

  return v3;
}

- (id)printOptionTableViewCell
{
  char v3 = [(UIPrintOption *)self printPanelViewController];
  objc_super v4 = [v3 printOptionsTableView];
  v5 = [v4 dequeueReusableCellWithIdentifier:@"UIPrintOptionCell"];

  v6 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
  v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v8 = [v7 localizedStringForKey:@"Print PDF Annotations" value:@"Print PDF Annotations" table:@"Localizable"];
  [v6 setText:v8];

  [v5 setContentConfiguration:v6];
  [v5 setSelectionStyle:0];
  v9 = createPrintKitUISwitch(*MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(UIPrintImagePDFAnnotationsOption *)self setImagePDFAnnotationsSwitch:v9];

  v10 = [(UIPrintOption *)self printInfo];
  uint64_t v11 = [v10 imagePDFAnnotations];
  v12 = [(UIPrintImagePDFAnnotationsOption *)self imagePDFAnnotationsSwitch];
  [v12 setOn:v11];

  v13 = [(UIPrintImagePDFAnnotationsOption *)self imagePDFAnnotationsSwitch];
  [v13 addTarget:self action:sel_changeImagePDFAnnotations_ forControlEvents:4096];

  v14 = [(UIPrintImagePDFAnnotationsOption *)self imagePDFAnnotationsSwitch];
  [v5 setAccessoryView:v14];

  [(UIPrintOption *)self setTableViewCell:v5];
  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__UIPrintImagePDFAnnotationsOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E6DA1408;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __83__UIPrintImagePDFAnnotationsOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateFromPrintInfo];
}

- (void)updateFromPrintInfo
{
  id v5 = [(UIPrintOption *)self printInfo];
  uint64_t v3 = [v5 imagePDFAnnotations];
  objc_super v4 = [(UIPrintImagePDFAnnotationsOption *)self imagePDFAnnotationsSwitch];
  [v4 setOn:v3];
}

- (void)changeImagePDFAnnotations:(id)a3
{
  uint64_t v4 = [a3 isOn];
  id v5 = [(UIPrintOption *)self printInfo];
  [v5 setImagePDFAnnotations:v4];
}

- (id)summary
{
  v2 = [(UIPrintOption *)self printInfo];
  if ([v2 imagePDFAnnotations])
  {
    uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v4 = [v3 localizedStringForKey:@"Print PDF Annotations" value:@"Print PDF Annotations" table:@"Localizable"];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (UISwitch)imagePDFAnnotationsSwitch
{
  return self->_imagePDFAnnotationsSwitch;
}

- (void)setImagePDFAnnotationsSwitch:(id)a3
{
}

- (void).cxx_destruct
{
}

@end