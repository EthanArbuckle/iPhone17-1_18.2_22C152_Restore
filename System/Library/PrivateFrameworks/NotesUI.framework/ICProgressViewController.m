@interface ICProgressViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)showsCancel;
- (ICCircularProgressView)circularProgressView;
- (ICProgressViewController)initWithDelegate:(id)a3;
- (ICProgressViewControllerDelegate)progressDelegate;
- (NSProgress)observedProgress;
- (UIActivityIndicatorView)activityIndicator;
- (UILabel)label;
- (void)setActivityIndicator:(id)a3;
- (void)setCircularProgressView:(id)a3;
- (void)setLabel:(id)a3;
- (void)setObservedProgress:(id)a3;
- (void)setProgressDelegate:(id)a3;
- (void)setShowsCancel:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ICProgressViewController

- (ICProgressViewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v8.receiver = self;
  v8.super_class = (Class)ICProgressViewController;
  v6 = [(ICProgressViewController *)&v8 initWithNibName:@"ICProgressViewController" bundle:v5];

  if (v6) {
    [(ICProgressViewController *)v6 setProgressDelegate:v4];
  }

  return v6;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)ICProgressViewController;
  [(ICProgressViewController *)&v10 viewDidLoad];
  v3 = [MEMORY[0x1E4FB1618] clearColor];
  id v4 = [(ICProgressViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [MEMORY[0x1E4FB1618] labelColor];
  v6 = [(ICProgressViewController *)self label];
  [v6 setTextColor:v5];

  v7 = [(ICProgressViewController *)self activityIndicator];
  [v7 setActivityIndicatorViewStyle:100];

  objc_super v8 = [(ICProgressViewController *)self label];
  [v8 setText:@" "];

  v9 = [(ICProgressViewController *)self circularProgressView];
  [v9 setHidden:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICProgressViewController;
  [(ICProgressViewController *)&v5 viewWillAppear:a3];
  id v4 = [(ICProgressViewController *)self activityIndicator];
  [v4 startAnimating];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICProgressViewController;
  [(ICProgressViewController *)&v6 viewWillDisappear:a3];
  id v4 = [(ICProgressViewController *)self activityIndicator];
  [v4 stopAnimating];

  objc_super v5 = [(ICProgressViewController *)self progressDelegate];
  [v5 willDismissProgressViewController:self];
}

- (void)setObservedProgress:(id)a3
{
  objc_super v5 = (NSProgress *)a3;
  if (self->_observedProgress != v5)
  {
    v13 = v5;
    objc_storeStrong((id *)&self->_observedProgress, a3);
    objc_super v6 = [(ICProgressViewController *)self circularProgressView];
    [v6 setObservedProgress:v13];

    observedProgress = self->_observedProgress;
    objc_super v8 = [(ICProgressViewController *)self activityIndicator];
    v9 = v8;
    if (observedProgress)
    {
      [v8 setHidden:1];

      objc_super v10 = [(ICProgressViewController *)self circularProgressView];
      v11 = v10;
      uint64_t v12 = 0;
    }
    else
    {
      [v8 setHidden:0];

      objc_super v10 = [(ICProgressViewController *)self circularProgressView];
      v11 = v10;
      uint64_t v12 = 1;
    }
    [v10 setHidden:v12];

    objc_super v5 = v13;
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSProgress)observedProgress
{
  return self->_observedProgress;
}

- (BOOL)showsCancel
{
  return self->_showsCancel;
}

- (void)setShowsCancel:(BOOL)a3
{
  self->_showsCancel = a3;
}

- (ICProgressViewControllerDelegate)progressDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_progressDelegate);
  return (ICProgressViewControllerDelegate *)WeakRetained;
}

- (void)setProgressDelegate:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (ICCircularProgressView)circularProgressView
{
  return self->_circularProgressView;
}

- (void)setCircularProgressView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circularProgressView, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak((id *)&self->_progressDelegate);
  objc_storeStrong((id *)&self->_observedProgress, 0);
}

@end