@interface PearlIDAboutController
- (PearlIDAboutController)initWithTitle:(id)a3 content:(id)a4;
- (void)backgrounded:(id)a3;
- (void)donePressed;
@end

@implementation PearlIDAboutController

- (PearlIDAboutController)initWithTitle:(id)a3 content:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PearlIDAboutController;
  v8 = [(PearlIDAboutController *)&v18 init];
  v9 = v8;
  if (v8)
  {
    [(PearlIDAboutController *)v8 setTitle:v6];
    v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:v9 selector:sel_backgrounded_ name:*MEMORY[0x263F83330] object:0];

    id v11 = objc_alloc(MEMORY[0x263F82D60]);
    v12 = objc_msgSend(v11, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [v12 setText:v7];
    v13 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    [v12 setFont:v13];

    [v12 setEditable:0];
    [v12 textContainerInset];
    objc_msgSend(v12, "setContentOffset:animated:", 0, 0.0, -v14);
    [(PearlIDAboutController *)v9 setView:v12];
    v15 = [(PearlIDAboutController *)v9 navigationItem];
    v16 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:v9 action:sel_donePressed];
    [v15 setRightBarButtonItem:v16];
  }
  return v9;
}

- (void)backgrounded:(id)a3
{
  id v3 = [(PearlIDAboutController *)self parentViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)donePressed
{
  id v2 = [(PearlIDAboutController *)self parentViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

@end