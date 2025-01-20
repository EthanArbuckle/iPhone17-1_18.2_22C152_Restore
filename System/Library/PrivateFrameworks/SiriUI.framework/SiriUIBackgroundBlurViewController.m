@interface SiriUIBackgroundBlurViewController
- (BOOL)backgroundBlurIsVisible;
- (SiriUIBackgroundBlurView)backgroundBlurView;
- (SiriUIBackgroundBlurViewController)init;
- (SiriUIBackgroundBlurViewController)initWithDelegate:(id)a3;
- (SiriUIBackgroundBlurViewControllerDelegate)backgroundBlurViewControllerDelegate;
- (int64_t)backgroundBlurVisibleReason;
- (void)requestBackgroundBlurVisible:(BOOL)a3 forReason:(int64_t)a4;
- (void)setBackgroundBlurIsVisible:(BOOL)a3;
- (void)setBackgroundBlurView:(id)a3;
- (void)setBackgroundBlurViewControllerDelegate:(id)a3;
- (void)setBackgroundBlurVisibleReason:(int64_t)a3;
- (void)viewDidLoad;
@end

@implementation SiriUIBackgroundBlurViewController

- (SiriUIBackgroundBlurViewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SiriUIBackgroundBlurViewController;
  v5 = [(SiriUIBackgroundBlurViewController *)&v8 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5) {
    [(SiriUIBackgroundBlurViewController *)v5 setBackgroundBlurViewControllerDelegate:v4];
  }

  return v6;
}

- (SiriUIBackgroundBlurViewController)init
{
  return [(SiriUIBackgroundBlurViewController *)self initWithDelegate:0];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)SiriUIBackgroundBlurViewController;
  [(SiriUIBackgroundBlurViewController *)&v8 viewDidLoad];
  [(SiriUIBackgroundBlurViewController *)self setBackgroundBlurIsVisible:0];
  [(SiriUIBackgroundBlurViewController *)self setBackgroundBlurVisibleReason:5];
  v3 = [SiriUIBackgroundBlurView alloc];
  id v4 = [(SiriUIBackgroundBlurViewController *)self view];
  [v4 bounds];
  v5 = -[SiriUIBackgroundBlurView initWithFrame:](v3, "initWithFrame:");
  [(SiriUIBackgroundBlurViewController *)self setBackgroundBlurView:v5];

  v6 = [(SiriUIBackgroundBlurViewController *)self view];
  v7 = [(SiriUIBackgroundBlurViewController *)self backgroundBlurView];
  [v6 addSubview:v7];
}

- (void)requestBackgroundBlurVisible:(BOOL)a3 forReason:(int64_t)a4
{
  BOOL v5 = a3;
  uint64_t v42 = *MEMORY[0x263EF8340];
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v30 = [MEMORY[0x263F08690] currentHandler];
    v31 = [NSString stringWithUTF8String:"-[SiriUIBackgroundBlurViewController requestBackgroundBlurVisible:forReason:]"];
    [v30 handleFailureInMethod:a2, self, @"SiriUIBackgroundBlurViewController.m", 55, @"%@ can only be used on the main thread", v31 object file lineNumber description];
  }
  objc_super v8 = (os_log_t *)MEMORY[0x263F28348];
  v9 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    if (v5) {
      v10 = @"show";
    }
    else {
      v10 = @"hide";
    }
    v11 = v9;
    v12 = +[SiriUIUtilities stringForSiriUIBackgroundBlurReason:a4];
    if ([(SiriUIBackgroundBlurViewController *)self backgroundBlurIsVisible]) {
      v13 = @"showing";
    }
    else {
      v13 = @"hidden";
    }
    v14 = +[SiriUIUtilities stringForSiriUIBackgroundBlurReason:[(SiriUIBackgroundBlurViewController *)self backgroundBlurVisibleReason]];
    *(_DWORD *)buf = 136316162;
    v33 = "-[SiriUIBackgroundBlurViewController requestBackgroundBlurVisible:forReason:]";
    __int16 v34 = 2112;
    v35 = v10;
    __int16 v36 = 2112;
    v37 = v12;
    __int16 v38 = 2112;
    v39 = v13;
    __int16 v40 = 2112;
    v41 = v14;
    _os_log_impl(&dword_2231EF000, v11, OS_LOG_TYPE_DEFAULT, "%s Request to %@ blur for reason %@. Current visibility: %@ and reason: %@", buf, 0x34u);
  }
  if ([(SiriUIBackgroundBlurViewController *)self backgroundBlurIsVisible] != v5)
  {
    if (v5)
    {
      if (!a4)
      {
        v15 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
          -[SiriUIBackgroundBlurViewController requestBackgroundBlurVisible:forReason:](v15);
        }
        return;
      }
      goto LABEL_23;
    }
    goto LABEL_26;
  }
  if (v5 && [(SiriUIBackgroundBlurViewController *)self backgroundBlurVisibleReason] > a4)
  {
    [(SiriUIBackgroundBlurViewController *)self setBackgroundBlurVisibleReason:a4];
    os_log_t v16 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      v18 = +[SiriUIUtilities stringForSiriUIBackgroundBlurReason:a4];
      *(_DWORD *)buf = 136315394;
      v33 = "-[SiriUIBackgroundBlurViewController requestBackgroundBlurVisible:forReason:]";
      __int16 v34 = 2112;
      v35 = v18;
      _os_log_impl(&dword_2231EF000, v17, OS_LOG_TYPE_DEFAULT, "%s Background blur is visible for reason: %@", buf, 0x16u);
    }
  }
  if (a4 == 4
    && [(SiriUIBackgroundBlurViewController *)self backgroundBlurVisibleReason] >= 4)
  {
    if (v5)
    {
LABEL_23:
      [(SiriUIBackgroundBlurViewController *)self setBackgroundBlurVisibleReason:a4];
      [(SiriUIBackgroundBlurViewController *)self setBackgroundBlurIsVisible:1];
      os_log_t v19 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        v20 = v19;
        v21 = +[SiriUIUtilities stringForSiriUIBackgroundBlurReason:a4];
        *(_DWORD *)buf = 136315394;
        v33 = "-[SiriUIBackgroundBlurViewController requestBackgroundBlurVisible:forReason:]";
        __int16 v34 = 2112;
        v35 = v21;
        _os_log_impl(&dword_2231EF000, v20, OS_LOG_TYPE_DEFAULT, "%s Showing the background blur for reason: %@", buf, 0x16u);
      }
      v22 = [(SiriUIBackgroundBlurViewController *)self backgroundBlurView];
      v23 = v22;
      uint64_t v24 = 1;
      goto LABEL_32;
    }
LABEL_26:
    if ([(SiriUIBackgroundBlurViewController *)self backgroundBlurVisibleReason] < a4)
    {
      os_log_t v25 = *v8;
      if (!os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      v23 = v25;
      v26 = +[SiriUIUtilities stringForSiriUIBackgroundBlurReason:a4];
      *(_DWORD *)buf = 136315394;
      v33 = "-[SiriUIBackgroundBlurViewController requestBackgroundBlurVisible:forReason:]";
      __int16 v34 = 2112;
      v35 = v26;
      _os_log_impl(&dword_2231EF000, v23, OS_LOG_TYPE_DEFAULT, "%s NOT hiding the background blur for reason: %@", buf, 0x16u);

      goto LABEL_33;
    }
    [(SiriUIBackgroundBlurViewController *)self setBackgroundBlurVisibleReason:5];
    [(SiriUIBackgroundBlurViewController *)self setBackgroundBlurIsVisible:0];
    os_log_t v27 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      v28 = v27;
      v29 = +[SiriUIUtilities stringForSiriUIBackgroundBlurReason:a4];
      *(_DWORD *)buf = 136315394;
      v33 = "-[SiriUIBackgroundBlurViewController requestBackgroundBlurVisible:forReason:]";
      __int16 v34 = 2112;
      v35 = v29;
      _os_log_impl(&dword_2231EF000, v28, OS_LOG_TYPE_DEFAULT, "%s Hiding the background blur for reason: %@", buf, 0x16u);
    }
    v22 = [(SiriUIBackgroundBlurViewController *)self backgroundBlurView];
    v23 = v22;
    uint64_t v24 = 0;
LABEL_32:
    [v22 setVisible:v24];
LABEL_33:
  }
}

- (void)setBackgroundBlurIsVisible:(BOOL)a3
{
  if (self->_backgroundBlurIsVisible != a3)
  {
    self->_backgroundBlurIsVisible = a3;
    id v4 = [(SiriUIBackgroundBlurViewController *)self backgroundBlurViewControllerDelegate];
    [v4 backgroundBlurViewController:self didSetBlurVisibilityTo:self->_backgroundBlurIsVisible];
  }
}

- (SiriUIBackgroundBlurView)backgroundBlurView
{
  return self->_backgroundBlurView;
}

- (void)setBackgroundBlurView:(id)a3
{
}

- (BOOL)backgroundBlurIsVisible
{
  return self->_backgroundBlurIsVisible;
}

- (int64_t)backgroundBlurVisibleReason
{
  return self->_backgroundBlurVisibleReason;
}

- (void)setBackgroundBlurVisibleReason:(int64_t)a3
{
  self->_backgroundBlurVisibleReason = a3;
}

- (SiriUIBackgroundBlurViewControllerDelegate)backgroundBlurViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundBlurViewControllerDelegate);
  return (SiriUIBackgroundBlurViewControllerDelegate *)WeakRetained;
}

- (void)setBackgroundBlurViewControllerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_backgroundBlurViewControllerDelegate);
  objc_storeStrong((id *)&self->_backgroundBlurView, 0);
}

- (void)requestBackgroundBlurVisible:(os_log_t)log forReason:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[SiriUIBackgroundBlurViewController requestBackgroundBlurVisible:forReason:]";
  _os_log_error_impl(&dword_2231EF000, log, OS_LOG_TYPE_ERROR, "%s Cannot request visibility with the force dismissal reason", (uint8_t *)&v1, 0xCu);
}

@end