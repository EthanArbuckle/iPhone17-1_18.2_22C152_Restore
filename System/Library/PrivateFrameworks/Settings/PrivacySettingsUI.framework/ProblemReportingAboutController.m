@interface ProblemReportingAboutController
- (ProblemReportingAboutController)initWithTitle:(id)a3 content:(id)a4;
- (void)donePressed;
@end

@implementation ProblemReportingAboutController

- (ProblemReportingAboutController)initWithTitle:(id)a3 content:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ProblemReportingAboutController;
  v8 = [(ProblemReportingAboutController *)&v17 init];
  v9 = v8;
  if (v8)
  {
    [(ProblemReportingAboutController *)v8 setTitle:v6];
    id v10 = objc_alloc(MEMORY[0x1E4FB1DD8]);
    v11 = objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v11 setText:v7];
    v12 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [v11 setFont:v12];

    [v11 setEditable:0];
    [v11 textContainerInset];
    objc_msgSend(v11, "setContentOffset:animated:", 0, 0.0, -v13);
    [(ProblemReportingAboutController *)v9 setView:v11];
    v14 = [(ProblemReportingAboutController *)v9 navigationItem];
    v15 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:v9 action:sel_donePressed];
    [v14 setRightBarButtonItem:v15];
  }
  return v9;
}

- (void)donePressed
{
  id v2 = [(ProblemReportingAboutController *)self parentViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

@end