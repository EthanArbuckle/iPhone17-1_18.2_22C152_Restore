@interface COSDiagnosticLogDownloadCell
- (BOOL)notifiedOwnerCompleteTransfer;
- (COSDiagnosticLogDownloadCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (COSLogTransferSpinnerButton)logTransferSpinnerButton;
- (NSSManager)nssManager;
- (NSString)fileName;
- (UIButton)downloadIconButton;
- (UIColor)enabledColor;
- (void)checkForFileTransferProgress;
- (void)dealloc;
- (void)layoutSubviews;
- (void)listenForLogTransferProgress;
- (void)notifyDownload:(id)a3;
- (void)setDownloadIconButton:(id)a3;
- (void)setEnabledColor:(id)a3;
- (void)setFileName:(id)a3;
- (void)setLogTransferSpinnerButton:(id)a3;
- (void)setNotifiedOwnerCompleteTransfer:(BOOL)a3;
- (void)setNssManager:(id)a3;
- (void)updateProgress:(unint64_t)a3;
@end

@implementation COSDiagnosticLogDownloadCell

- (COSDiagnosticLogDownloadCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v26.receiver = self;
  v26.super_class = (Class)COSDiagnosticLogDownloadCell;
  v9 = [(COSDiagnosticLogDownloadCell *)&v26 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  if (v9)
  {
    uint64_t v10 = [v8 propertyForKey:@"DiagnosticLogOriginalPathKey"];
    fileName = v9->_fileName;
    v9->_fileName = (NSString *)v10;

    uint64_t v12 = +[UIColor systemOrangeColor];
    enabledColor = v9->_enabledColor;
    v9->_enabledColor = (UIColor *)v12;

    v14 = (id *)&v9->BPSLinkCell_opaque[OBJC_IVAR___PSTableCell__specifier];
    objc_storeWeak(v14, v8);
    uint64_t v15 = +[UIButton buttonWithType:1];
    downloadIconButton = v9->_downloadIconButton;
    v9->_downloadIconButton = (UIButton *)v15;

    v17 = v9->_downloadIconButton;
    v18 = +[UIImage systemImageNamed:@"arrow.down.doc"];
    [(UIButton *)v17 setImage:v18 forState:0];

    [(UIButton *)v9->_downloadIconButton setTitleColor:v9->_enabledColor forState:0];
    -[UIButton setContentEdgeInsets:](v9->_downloadIconButton, "setContentEdgeInsets:", 5.0, 5.0, 5.0, 5.0);
    [(UIButton *)v9->_downloadIconButton setAlpha:1.0];
    [(UIButton *)v9->_downloadIconButton addTarget:v9 action:"notifyDownload:" forEvents:64];
    v19 = [(COSDiagnosticLogDownloadCell *)v9 contentView];
    [v19 addSubview:v9->_downloadIconButton];

    v20 = objc_alloc_init(COSLogTransferSpinnerButton);
    logTransferSpinnerButton = v9->_logTransferSpinnerButton;
    v9->_logTransferSpinnerButton = v20;

    v22 = v9->_logTransferSpinnerButton;
    id WeakRetained = objc_loadWeakRetained(v14);
    [(COSLogTransferSpinnerButton *)v22 setSpecifier:WeakRetained];

    v24 = [(COSDiagnosticLogDownloadCell *)v9 contentView];
    [v24 addSubview:v9->_logTransferSpinnerButton];

    [(COSDiagnosticLogDownloadCell *)v9 listenForLogTransferProgress];
  }

  return v9;
}

- (void)notifyDownload:(id)a3
{
  v4 = +[NSNotificationCenter defaultCenter];
  CFStringRef v7 = @"Specifier";
  id WeakRetained = objc_loadWeakRetained((id *)&self->BPSLinkCell_opaque[OBJC_IVAR___PSTableCell__specifier]);
  id v8 = WeakRetained;
  v6 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  [v4 postNotificationName:@"DiagnosticLogTransferTapped" object:0 userInfo:v6];
}

- (void)dealloc
{
  nssManager = self->_nssManager;
  if (nssManager)
  {
    self->_nssManager = 0;
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, NSSFileTransferProgressChangedNotification, 0);
  v5.receiver = self;
  v5.super_class = (Class)COSDiagnosticLogDownloadCell;
  [(COSDiagnosticLogDownloadCell *)&v5 dealloc];
}

- (void)layoutSubviews
{
  v79.receiver = self;
  v79.super_class = (Class)COSDiagnosticLogDownloadCell;
  [(COSDiagnosticLogDownloadCell *)&v79 layoutSubviews];
  unsigned int v3 = [(COSDiagnosticLogDownloadCell *)self _shouldReverseLayoutDirection];
  v4 = (id *)&self->BPSLinkCell_opaque[OBJC_IVAR___PSTableCell__specifier];
  id WeakRetained = objc_loadWeakRetained(v4);
  v6 = [WeakRetained propertyForKey:@"DiagnosticLogDownloadingKey"];
  id v7 = [v6 BOOLValue];

  id v8 = objc_loadWeakRetained(v4);
  v9 = [v8 propertyForKey:@"FileDownloadedKey"];
  unsigned int v10 = [v9 BOOLValue];

  [(COSDiagnosticLogDownloadCell *)self bounds];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  v19 = [(COSDiagnosticLogDownloadCell *)self textLabel];
  v20 = [(COSDiagnosticLogDownloadCell *)self detailTextLabel];
  [v19 frame];
  double v22 = v21;
  double v77 = v24;
  double v78 = v23;
  double v26 = v25;
  p_downloadIconButton = &self->_downloadIconButton;
  [(UIButton *)self->_downloadIconButton sizeToFit];
  [(UIButton *)self->_downloadIconButton frame];
  double v29 = v28;
  double v31 = v30 + 5.0;
  v80.origin.x = v12;
  v80.origin.y = v14;
  CGFloat v75 = v18;
  CGFloat v76 = v16;
  v80.size.width = v16;
  v80.size.height = v18;
  double v32 = (CGRectGetHeight(v80) - v29) * 0.5;
  double v33 = 15.0;
  if ((v3 & 1) == 0)
  {
    v81.origin.x = v12;
    v81.origin.y = v14;
    v81.size.height = v18;
    v81.size.width = v76;
    double v33 = CGRectGetWidth(v81) - (v31 + 15.0);
  }
  -[UIButton setFrame:](*p_downloadIconButton, "setFrame:", v33, v32, v31, v29);
  [(UIButton *)*p_downloadIconButton frame];
  double v35 = v34;
  double v37 = v36;
  [(UIButton *)*p_downloadIconButton center];
  p_logTransferSpinnerButton = &self->_logTransferSpinnerButton;
  -[COSLogTransferSpinnerButton setCenter:](self->_logTransferSpinnerButton, "setCenter:");
  [(UIButton *)*p_downloadIconButton frame];
  if (v3)
  {
    double MinX = CGRectGetMinX(*(CGRect *)&v39);
  }
  else
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)&v39);
    [(COSLogTransferSpinnerButton *)*p_logTransferSpinnerButton size];
    double MinX = MaxX - v45;
  }
  CGFloat v73 = v14;
  -[COSLogTransferSpinnerButton setFrame:](*p_logTransferSpinnerButton, "setFrame:", MinX, v35, v37, v37);
  v46 = [(COSDiagnosticLogDownloadCell *)self contentView];
  [v46 addSubview:*p_logTransferSpinnerButton];

  v47 = *p_downloadIconButton;
  CGFloat v74 = v12;
  double v48 = v26;
  if (v10)
  {
    [(UIButton *)v47 setHidden:1];
    [(COSLogTransferSpinnerButton *)*p_logTransferSpinnerButton setHidden:1];
    [(COSDiagnosticLogDownloadCell *)self setAccessoryType:0];
LABEL_13:
    id v50 = v20;
    [v50 sizeThatFits:CGSizeZero.width, CGSizeZero.height];
    double v52 = v54;
    double v53 = 35.0;
    goto LABEL_14;
  }
  if (v7) {
    v49 = (id *)&self->_logTransferSpinnerButton;
  }
  else {
    v49 = (id *)&self->_downloadIconButton;
  }
  [(UIButton *)v47 setHidden:v7];
  [(COSLogTransferSpinnerButton *)*p_logTransferSpinnerButton setHidden:v7 ^ 1];
  id v50 = *v49;
  [(COSDiagnosticLogDownloadCell *)self setAccessoryType:0];
  if (!v50) {
    goto LABEL_13;
  }
  [v50 size];
  double v52 = v51;
  double v53 = 15.0;
LABEL_14:
  [v50 frame];
  double v56 = v55;
  double v58 = v57;
  double v60 = v59;
  double v62 = v61;
  v63 = [(COSDiagnosticLogDownloadCell *)self traitCollection];
  v64 = [v63 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v64);

  if (v50)
  {
    v82.origin.x = v56;
    v82.origin.y = v58;
    v82.size.width = v60;
    v82.size.height = v62;
    char v66 = CGRectGetWidth(v82) <= 0.0 || IsAccessibilityCategory;
    if ((v66 & 1) == 0)
    {
      if (v3)
      {
        v83.origin.x = v22;
        v83.size.height = v77;
        v83.origin.y = v78;
        v83.size.width = v48;
        double v67 = CGRectGetMinX(v83);
        v84.origin.x = v56;
        v84.origin.y = v58;
        v84.size.width = v60;
        v84.size.height = v62;
        double v68 = v67 - CGRectGetMaxX(v84);
        if (v68 < 0.0)
        {
          double v69 = v68 + -6.0;
          double v48 = v48 + v69;
          double v22 = v22 - v69;
        }
      }
      else
      {
        double v72 = v53;
        v85.origin.x = v56;
        v85.origin.y = v58;
        v85.size.width = v60;
        v85.size.height = v62;
        CGFloat v70 = CGRectGetMaxX(v85) - v52;
        v86.origin.x = v22;
        v86.size.height = v77;
        v86.origin.y = v78;
        v86.size.width = v48;
        double v71 = v70 - (CGRectGetMaxX(v86) + 6.0);
        if (v71 < 0.0)
        {
          double v48 = v48 + v71;
          v87.origin.y = v73;
          v87.origin.x = v74;
          v87.size.height = v75;
          v87.size.width = v76;
          double v56 = CGRectGetWidth(v87) - (v72 + v52);
          double v60 = v52;
        }
      }
    }
  }
  [v50 setFrame:v56, v58, v60, v62];
  [v19 setFrame:v22, v78, v48, v77];
}

- (void)listenForLogTransferProgress
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v4 = (const __CFString *)NSSFileTransferProgressChangedNotification;

  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100073920, v4, 0, (CFNotificationSuspensionBehavior)0);
}

- (void)checkForFileTransferProgress
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->BPSLinkCell_opaque[OBJC_IVAR___PSTableCell__specifier]);
  CFStringRef v4 = [WeakRetained propertyForKey:@"DiagnosticLogDownloadingKey"];
  unsigned int v5 = [v4 BOOLValue];

  if (v5)
  {
    if (!self->_nssManager)
    {
      v6 = (NSSManager *)[objc_alloc((Class)NSSManager) initWithQueue:&_dispatch_main_q];
      nssManager = self->_nssManager;
      self->_nssManager = v6;
    }
    id v8 = [(COSDiagnosticLogDownloadCell *)self fileName];
    v9 = [v8 lastPathComponent];

    unsigned int v10 = pbb_bridge_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CGFloat v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "checking transfer progress for %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    double v11 = [(COSDiagnosticLogDownloadCell *)self nssManager];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100073B44;
    v13[3] = &unk_100244F70;
    objc_copyWeak(&v16, (id *)buf);
    id v12 = v9;
    id v14 = v12;
    double v15 = self;
    [v11 retrieveDiagnosticLogTransferProgress:v12 withProgress:v13];

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
}

- (void)updateProgress:(unint64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100073D88;
  v3[3] = &unk_1002437D0;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (COSLogTransferSpinnerButton)logTransferSpinnerButton
{
  return self->_logTransferSpinnerButton;
}

- (void)setLogTransferSpinnerButton:(id)a3
{
}

- (UIButton)downloadIconButton
{
  return self->_downloadIconButton;
}

- (void)setDownloadIconButton:(id)a3
{
}

- (UIColor)enabledColor
{
  return self->_enabledColor;
}

- (void)setEnabledColor:(id)a3
{
}

- (NSSManager)nssManager
{
  return self->_nssManager;
}

- (void)setNssManager:(id)a3
{
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
}

- (BOOL)notifiedOwnerCompleteTransfer
{
  return self->_notifiedOwnerCompleteTransfer;
}

- (void)setNotifiedOwnerCompleteTransfer:(BOOL)a3
{
  self->_notifiedOwnerCompleteTransfer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_nssManager, 0);
  objc_storeStrong((id *)&self->_enabledColor, 0);
  objc_storeStrong((id *)&self->_downloadIconButton, 0);

  objc_storeStrong((id *)&self->_logTransferSpinnerButton, 0);
}

@end