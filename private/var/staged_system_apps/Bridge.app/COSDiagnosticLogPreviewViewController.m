@interface COSDiagnosticLogPreviewViewController
- (COSDiagnosticLogPreviewDelegate)logPreviewDelegate;
- (COSDiagnosticLogPreviewViewController)initWithFilePath:(id)a3 andQueue:(id)a4;
- (NSSManager)nssManager;
- (NSString)localSavePath;
- (NSString)pathOnWatch;
- (OS_dispatch_queue)queue;
- (PSSpecifier)parentSpecifier;
- (UIImage)imageContent;
- (UIImageView)imageView;
- (UILabel)titleBar;
- (UITextView)textView;
- (UIToolbar)toolBar;
- (id)fileLabel;
- (id)logViewerToolbar;
- (id)shrinkScreenshotImage:(id)a3;
- (void)loadViewFromLogPath;
- (void)setImageContent:(id)a3;
- (void)setImageView:(id)a3;
- (void)setLocalSavePath:(id)a3;
- (void)setLogPreviewDelegate:(id)a3;
- (void)setNssManager:(id)a3;
- (void)setParentSpecifier:(id)a3;
- (void)setPathOnWatch:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTextView:(id)a3;
- (void)setTitleBar:(id)a3;
- (void)setToolBar:(id)a3;
- (void)shareLog;
- (void)viewDidLayoutSubviews;
- (void)viewWillLayoutSubviews;
@end

@implementation COSDiagnosticLogPreviewViewController

- (COSDiagnosticLogPreviewViewController)initWithFilePath:(id)a3 andQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)COSDiagnosticLogPreviewViewController;
  v9 = [(COSDiagnosticLogPreviewViewController *)&v28 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_localSavePath, a3);
    id v11 = objc_alloc((Class)UITextView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v15 = [v11 initWithFrame:CGRectZero.origin.x, y, width, height];
    textView = v10->_textView;
    v10->_textView = v15;

    [(UITextView *)v10->_textView setHidden:1];
    v17 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, y, width, height];
    imageView = v10->_imageView;
    v10->_imageView = v17;

    [(UIImageView *)v10->_imageView setHidden:1];
    toolBar = v10->_toolBar;
    v10->_toolBar = 0;

    titleBar = v10->_titleBar;
    v10->_titleBar = 0;

    v21 = [(COSDiagnosticLogPreviewViewController *)v10 view];
    [v21 addSubview:v10->_textView];

    v22 = [(COSDiagnosticLogPreviewViewController *)v10 view];
    [v22 addSubview:v10->_imageView];

    v23 = [(COSDiagnosticLogPreviewViewController *)v10 view];
    v24 = [(COSDiagnosticLogPreviewViewController *)v10 fileLabel];
    [v23 addSubview:v24];

    [(COSDiagnosticLogPreviewViewController *)v10 setQueue:v8];
    v25 = (NSSManager *)[objc_alloc((Class)NSSManager) initWithQueue:v10->_queue];
    nssManager = v10->_nssManager;
    v10->_nssManager = v25;
  }
  return v10;
}

- (void)viewWillLayoutSubviews
{
  v3 = [(COSDiagnosticLogPreviewViewController *)self view];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  v10 = [(COSDiagnosticLogPreviewViewController *)self view];
  [v10 frame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  -[UITextView setFrame:](self->_textView, "setFrame:", v5, 45.0, v7, v9 + -45.0);
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v12, -22.5, v14, v16);
  id v18 = [(COSDiagnosticLogPreviewViewController *)self view];
  v17 = [(COSDiagnosticLogPreviewViewController *)self logViewerToolbar];
  [v18 addSubview:v17];
}

- (void)viewDidLayoutSubviews
{
}

- (void)shareLog
{
  id v7 = +[NSURL fileURLWithPath:self->_localSavePath];
  v3 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v7, 0);
  id v4 = [objc_alloc((Class)UIActivityViewController) initWithActivityItems:v3 applicationActivities:0];
  double v5 = [(COSDiagnosticLogPreviewViewController *)self view];
  double v6 = [v4 popoverPresentationController];
  [v6 setSourceView:v5];

  [(COSDiagnosticLogPreviewViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (id)fileLabel
{
  titleBar = self->_titleBar;
  if (!titleBar)
  {
    id v4 = [(COSDiagnosticLogPreviewViewController *)self view];
    [v4 frame];
    double v6 = v5;

    id v7 = [objc_alloc((Class)UILabel) initWithFrame:0.0, 0.0, v6, 55.0];
    double v8 = [(NSString *)self->_localSavePath lastPathComponent];
    [v7 setText:v8];

    double v9 = +[UIColor systemWhiteColor];
    [v7 setTextColor:v9];

    v10 = +[UIColor systemGray6Color];
    [v7 setBackgroundColor:v10];

    [v7 setTextAlignment:1];
    double v11 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    [v7 setFont:v11];

    [(COSDiagnosticLogPreviewViewController *)self setTitleBar:v7];
    titleBar = self->_titleBar;
  }

  return titleBar;
}

- (id)logViewerToolbar
{
  toolBar = self->_toolBar;
  if (!toolBar)
  {
    id v4 = objc_alloc((Class)UIBarButtonItem);
    double v5 = +[UIImage systemImageNamed:@"square.and.arrow.up"];
    id v6 = [v4 initWithImage:v5 style:0 target:self action:"shareLog"];

    id v7 = +[UIColor systemOrangeColor];
    [v6 setTintColor:v7];

    double v8 = [(COSDiagnosticLogPreviewViewController *)self view];
    [v8 safeAreaInsets];
    double v10 = v9;

    double v11 = [(COSDiagnosticLogPreviewViewController *)self view];
    [v11 frame];
    double v13 = v12;
    double v15 = v14;

    float v16 = v10;
    id v17 = [objc_alloc((Class)UIToolbar) initWithFrame:0.0, v15 - (float)(v16 + 45.0), v13, 45.0];
    id v18 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v6, 0);
    [v17 setItems:v18 animated:1];

    [(COSDiagnosticLogPreviewViewController *)self setToolBar:v17];
    toolBar = self->_toolBar;
  }

  return toolBar;
}

- (void)loadViewFromLogPath
{
  v3 = [(COSDiagnosticLogPreviewViewController *)self navigationItem];
  id v4 = [v3 rightBarButtonItem];
  [v4 setEnabled:1];

  double v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    localSavePath = self->_localSavePath;
    *(_DWORD *)buf = 138412290;
    v35 = localSavePath;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "local save path: %@", buf, 0xCu);
  }

  if ([(NSString *)self->_localSavePath containsSubstring:@".png"])
  {
    id v7 = [(COSDiagnosticLogPreviewViewController *)self shrinkScreenshotImage:self->_localSavePath];
    if (!v7)
    {
      id v15 = 0;
      id v14 = 0;
LABEL_15:
      [(UITextView *)self->_textView setHidden:0];
      textView = self->_textView;
      v25 = +[UIColor systemBlackColor];
      [(UITextView *)textView setBackgroundColor:v25];

      v26 = [(NSString *)self->_localSavePath lastPathComponent];
      v27 = self->_textView;
      objc_super v28 = +[UIColor systemWhiteColor];
      [(UITextView *)v27 setTextColor:v28];

      v29 = self->_textView;
      v30 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
      [(UITextView *)v29 setFont:v30];

      [(UITextView *)self->_textView setTextAlignment:1];
      v31 = self->_textView;
      [(UITextView *)v31 bounds];
      -[UITextView setTextContainerInset:](v31, "setTextContainerInset:", v32 * 0.5 + -60.0, 0.0, 0.0, 0.0);
      [(UITextView *)self->_textView setText:v26];
      [(UITextView *)self->_textView setEditable:0];

      goto LABEL_16;
    }
    [(UIImageView *)self->_imageView setHidden:0];
    [(UIImageView *)self->_imageView setImage:v7];
    [(UIImageView *)self->_imageView setContentsPosition:0];
    imageView = self->_imageView;
    double v9 = +[UIColor systemBlackColor];
    [(UIImageView *)imageView setBackgroundColor:v9];

    double v10 = +[CATransition animation];
    double v11 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [v10 setTimingFunction:v11];

    [v10 setType:kCATransitionReveal];
    double v12 = [(UIImageView *)self->_imageView layer];
    [v12 addAnimation:v10 forKey:kCATransition];

    BOOL v13 = 0;
    id v14 = 0;
    id v15 = 0;
  }
  else
  {
    float v16 = self->_localSavePath;
    id v33 = 0;
    id v17 = +[NSString stringWithContentsOfFile:v16 encoding:4 error:&v33];
    id v15 = v33;
    id v14 = [v17 copy];

    id v18 = [v14 length];
    BOOL v13 = v18 == 0;
    if (v18)
    {
      [(UITextView *)self->_textView setHidden:0];
      v19 = [(UITextView *)self->_textView layer];
      v20 = +[CATransition animation];
      [v19 addAnimation:v20 forKey:kCATransition];

      [(UITextView *)self->_textView setText:v14];
      v21 = self->_textView;
      v22 = +[UIColor systemBlackColor];
      [(UITextView *)v21 setBackgroundColor:v22];

      [(UITextView *)self->_textView setEditable:0];
    }
    double v10 = pbb_bridge_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (NSString *)[v14 length];
      *(_DWORD *)buf = 134218242;
      v35 = v23;
      __int16 v36 = 2112;
      id v37 = v15;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "logContent length: %lu with loadError %@", buf, 0x16u);
    }
    id v7 = 0;
  }

  if (v13 || v15) {
    goto LABEL_15;
  }
LABEL_16:
}

- (id)shrinkScreenshotImage:(id)a3
{
  v3 = +[NSData dataWithContentsOfFile:a3];
  id v4 = +[UIImage imageWithData:v3 scale:2.0];

  return v4;
}

- (NSSManager)nssManager
{
  return self->_nssManager;
}

- (void)setNssManager:(id)a3
{
}

- (NSString)pathOnWatch
{
  return self->_pathOnWatch;
}

- (void)setPathOnWatch:(id)a3
{
}

- (PSSpecifier)parentSpecifier
{
  return self->_parentSpecifier;
}

- (void)setParentSpecifier:(id)a3
{
}

- (COSDiagnosticLogPreviewDelegate)logPreviewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_logPreviewDelegate);

  return (COSDiagnosticLogPreviewDelegate *)WeakRetained;
}

- (void)setLogPreviewDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UIImage)imageContent
{
  return self->_imageContent;
}

- (void)setImageContent:(id)a3
{
}

- (NSString)localSavePath
{
  return self->_localSavePath;
}

- (void)setLocalSavePath:(id)a3
{
}

- (UIToolbar)toolBar
{
  return self->_toolBar;
}

- (void)setToolBar:(id)a3
{
}

- (UILabel)titleBar
{
  return self->_titleBar;
}

- (void)setTitleBar:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleBar, 0);
  objc_storeStrong((id *)&self->_toolBar, 0);
  objc_storeStrong((id *)&self->_localSavePath, 0);
  objc_storeStrong((id *)&self->_imageContent, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_logPreviewDelegate);
  objc_storeStrong((id *)&self->_parentSpecifier, 0);
  objc_storeStrong((id *)&self->_pathOnWatch, 0);

  objc_storeStrong((id *)&self->_nssManager, 0);
}

@end