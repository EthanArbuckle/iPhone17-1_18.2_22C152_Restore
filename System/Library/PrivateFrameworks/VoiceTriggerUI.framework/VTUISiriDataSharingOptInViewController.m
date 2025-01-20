@interface VTUISiriDataSharingOptInViewController
- (BOOL)_canShowWhileLocked;
- (VTUISiriDataSharingOptInViewController)initWithViewStyle:(int64_t)a3;
- (VTUISiriDataSharingOptInViewControllerDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation VTUISiriDataSharingOptInViewController

- (VTUISiriDataSharingOptInViewController)initWithViewStyle:(int64_t)a3
{
  if (a3 == 2)
  {
    v4 = +[VTUIStringsHelper sharedStringsHelper];
    v5 = v4;
    v6 = @"DATA_SHARING_TITLE_DICTATION";
    goto LABEL_6;
  }
  if (a3 != 1)
  {
    if (a3)
    {
      v7 = 0;
      goto LABEL_11;
    }
    v4 = +[VTUIStringsHelper sharedStringsHelper];
    v5 = v4;
    v6 = @"DATA_SHARING_TITLE_SIRI";
LABEL_6:
    v7 = [v4 uiLocalizedStringForKey:v6];

LABEL_11:
    v10 = [MEMORY[0x263F827E8] _systemImageNamed:@"chart.bar.xaxis"];
    v13.receiver = self;
    v13.super_class = (Class)VTUISiriDataSharingOptInViewController;
    v11 = [(VTUISiriDataSharingOptInViewController *)&v13 initWithTitle:v7 detailText:0 icon:v10];

    self = v11;
    v9 = self;
    goto LABEL_12;
  }
  v8 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_ERROR)) {
    -[VTUISiriDataSharingOptInViewController initWithViewStyle:](v8);
  }
  v9 = 0;
LABEL_12:

  return v9;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VTUISiriDataSharingOptInViewController;
  [(VTUISiriDataSharingOptInViewController *)&v5 viewDidDisappear:a3];
  v4 = [(VTUISiriDataSharingOptInViewController *)self delegate];
  [v4 didDismissFromViewController:self];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (VTUISiriDataSharingOptInViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VTUISiriDataSharingOptInViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithViewStyle:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[VTUISiriDataSharingOptInViewController initWithViewStyle:]";
  _os_log_error_impl(&dword_238878000, log, OS_LOG_TYPE_ERROR, "%s #SiriDataSharingOptIn: Passing VTUISiriDataSharingOptInViewStyleSiriProx to VTUISiriDataSharingViewController", (uint8_t *)&v1, 0xCu);
}

@end