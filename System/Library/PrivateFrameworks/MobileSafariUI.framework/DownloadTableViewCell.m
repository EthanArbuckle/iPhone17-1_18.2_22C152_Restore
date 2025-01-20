@interface DownloadTableViewCell
+ (id)tableViewCellForSizeEstimation;
- ($A17CE7BAAAAB13D21F74688DC5009C79)deferrableUpdateViewState;
- (DownloadTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (DownloadTableViewCellDelegate)delegate;
- (UIImageView)iconView;
- (_SFDownload)download;
- (_SFDownloadIconCache)iconCache;
- (id)_busyStatus;
- (id)_buttonWithSymbolName:(id)a3;
- (void)_buttonPressed:(id)a3;
- (void)_downloadChanged:(id)a3;
- (void)_downloadURLChanged:(id)a3;
- (void)_updateCellContents;
- (void)_updateCellContentsForSizing;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)downloadIconCache:(id)a3 didGenerateNewIcon:(id)a4 forSource:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setDownload:(id)a3;
- (void)setIconCache:(id)a3;
- (void)setIconView:(id)a3;
@end

@implementation DownloadTableViewCell

+ (id)tableViewCellForSizeEstimation
{
  v2 = (void *)[objc_alloc((Class)a1) initWithStyle:0 reuseIdentifier:0];
  [v2 _updateCellContentsForSizing];
  return v2;
}

- (DownloadTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v80[3] = *MEMORY[0x1E4F143B8];
  v77.receiver = self;
  v77.super_class = (Class)DownloadTableViewCell;
  v4 = [(DownloadTableViewCell *)&v77 initWithStyle:3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v76 = [(DownloadTableViewCell *)v4 contentView];
    v6 = [(DownloadTableViewCell *)v5 layoutManager];
    objc_msgSend(v76, "setLayoutMargins:", 10.0, 0.0, 10.0, 0.0);
    v75 = v6;
    uint64_t v7 = [v6 textLabelForCell:v5];
    nameLabel = v5->_nameLabel;
    v5->_nameLabel = (UILabel *)v7;

    [(UILabel *)v5->_nameLabel setAdjustsFontForContentSizeCategory:1];
    uint64_t v9 = [v6 detailTextLabelForCell:v5];
    statusLabel = v5->_statusLabel;
    v5->_statusLabel = (UILabel *)v9;

    [(UILabel *)v5->_statusLabel setAdjustsFontForContentSizeCategory:1];
    v11 = objc_msgSend(MEMORY[0x1E4FB08E0], "safari_monospacedDigitFontForTextStyle:", *MEMORY[0x1E4FB28D8]);
    [(UILabel *)v5->_statusLabel setFont:v11];

    v12 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v5->_statusLabel setTextColor:v12];

    uint64_t v13 = [(DownloadTableViewCell *)v5 _buttonWithSymbolName:@"xmark"];
    cancelButton = v5->_cancelButton;
    v5->_cancelButton = (UIButton *)v13;

    uint64_t v15 = [(DownloadTableViewCell *)v5 _buttonWithSymbolName:@"magnifyingglass"];
    revealButton = v5->_revealButton;
    v5->_revealButton = (UIButton *)v15;

    uint64_t v17 = [(DownloadTableViewCell *)v5 _buttonWithSymbolName:@"arrow.clockwise"];
    resumeButton = v5->_resumeButton;
    v5->_resumeButton = (UIButton *)v17;

    [(UILabel *)v5->_nameLabel setAccessibilityIdentifier:@"DownloadName"];
    [(UILabel *)v5->_statusLabel setAccessibilityIdentifier:@"DownloadStatus"];
    [(UIButton *)v5->_cancelButton setAccessibilityIdentifier:@"CancelDownloadButton"];
    [(UIButton *)v5->_revealButton setAccessibilityIdentifier:@"RevealDownloadButton"];
    [(UIButton *)v5->_resumeButton setAccessibilityIdentifier:@"ResumeDownloadButton"];
    uint64_t v19 = [objc_alloc(MEMORY[0x1E4FB1B48]) initWithProgressViewStyle:0];
    progressView = v5->_progressView;
    v5->_progressView = (UIProgressView *)v19;

    [(UIProgressView *)v5->_progressView setAccessibilityIdentifier:@"DownloadProgress"];
    id v21 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v80[0] = v5->_nameLabel;
    v80[1] = v5->_progressView;
    v80[2] = v5->_statusLabel;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:3];
    v23 = (void *)[v21 initWithArrangedSubviews:v22];

    [v23 setAxis:1];
    [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v23 setSpacing:4.0];
    LODWORD(v24) = 1144750080;
    [v23 setContentCompressionResistancePriority:1 forAxis:v24];
    id v25 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v79[0] = v5->_cancelButton;
    v79[1] = v5->_resumeButton;
    v79[2] = v5->_revealButton;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:3];
    v27 = (void *)[v25 initWithArrangedSubviews:v26];

    [v27 setAxis:0];
    [v27 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v27 setSpacing:24.0];
    LODWORD(v28) = 1144750080;
    [v27 setContentHuggingPriority:0 forAxis:v28];
    objc_msgSend(v27, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
    v29 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:0];
    [(UIImageView *)v29 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v29 setContentMode:4];
    iconView = v5->_iconView;
    v5->_iconView = v29;
    v31 = v29;

    [v76 addSubview:v23];
    [v76 addSubview:v27];
    [v76 addSubview:v31];
    v61 = (void *)MEMORY[0x1E4F28DC8];
    v74 = [(UIImageView *)v31 leadingAnchor];
    v73 = [v76 leadingAnchor];
    v72 = [v74 constraintEqualToAnchor:v73 constant:16.0];
    v78[0] = v72;
    v71 = [(UIImageView *)v31 widthAnchor];
    v70 = [v71 constraintEqualToConstant:48.0];
    v78[1] = v70;
    v69 = [(UIImageView *)v31 heightAnchor];
    v68 = [v69 constraintEqualToConstant:48.0];
    v78[2] = v68;
    v67 = [(UIImageView *)v31 centerYAnchor];
    v66 = [v76 centerYAnchor];
    v65 = [v67 constraintEqualToAnchor:v66];
    v78[3] = v65;
    v64 = [(UIImageView *)v31 topAnchor];
    v63 = [v76 topAnchor];
    v62 = [v64 constraintGreaterThanOrEqualToAnchor:v63 constant:14.0];
    v78[4] = v62;
    v32 = [(UIImageView *)v31 topAnchor];
    v33 = [(UILabel *)v5->_nameLabel topAnchor];
    v34 = [v32 constraintEqualToAnchor:v33];

    v60 = v34;
    LODWORD(v35) = 1144750080;
    [v34 setPriority:v35];
    v78[5] = v34;
    v58 = [(UILabel *)v5->_nameLabel topAnchor];
    v57 = [v76 topAnchor];
    v56 = [v58 constraintLessThanOrEqualToAnchor:v57 constant:40.0];
    v78[6] = v56;
    v54 = [v23 leadingAnchor];
    v53 = [(UIImageView *)v5->_iconView trailingAnchor];
    v52 = [v54 constraintEqualToAnchor:v53 constant:12.0];
    v78[7] = v52;
    v51 = [v76 bottomAnchor];
    v59 = v23;
    v50 = [v23 bottomAnchor];
    v49 = [v51 constraintGreaterThanOrEqualToAnchor:v50 constant:16.0];
    v78[8] = v49;
    v36 = v27;
    v48 = [v27 leadingAnchor];
    v47 = [v23 trailingAnchor];
    v37 = [v48 constraintEqualToAnchor:v47 constant:24.0];
    v78[9] = v37;
    v55 = v27;
    v38 = [v27 trailingAnchor];
    v39 = [v76 trailingAnchor];
    v40 = [v38 constraintEqualToAnchor:v39 constant:-16.0];
    v78[10] = v40;
    v41 = [v36 centerYAnchor];
    v42 = [v76 centerYAnchor];
    v43 = [v41 constraintEqualToAnchor:v42];
    v78[11] = v43;
    v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:12];
    [v61 activateConstraints:v44];

    v45 = v5;
  }

  return v5;
}

- (void)dealloc
{
  [(_SFDownloadIconCache *)self->_iconCache removeCacheObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)DownloadTableViewCell;
  [(DownloadTableViewCell *)&v3 dealloc];
}

- (void)didMoveToWindow
{
  v2.receiver = self;
  v2.super_class = (Class)DownloadTableViewCell;
  [(DownloadTableViewCell *)&v2 didMoveToWindow];
  SFDeferrableUpdateViewDidMoveToWindow();
}

- (id)_buttonWithSymbolName:(id)a3
{
  v4 = (void *)MEMORY[0x1E4FB1830];
  id v5 = a3;
  v6 = [v4 configurationWithPointSize:15.0];
  uint64_t v7 = [MEMORY[0x1E4FB1818] systemImageNamed:v5 withConfiguration:v6];

  v8 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  [v8 setImage:v7 forState:0];
  objc_msgSend(v8, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
  [v8 addTarget:self action:sel__buttonPressed_ forControlEvents:0x2000];
  LODWORD(v9) = 1144750080;
  [v8 setContentHuggingPriority:0 forAxis:v9];
  LODWORD(v10) = 1148846080;
  [v8 setContentCompressionResistancePriority:0 forAxis:v10];

  return v8;
}

- (void)_buttonPressed:(id)a3
{
  id v5 = (UIButton *)a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (self->_cancelButton == v5)
  {
    [WeakRetained cancelDownload:self->_download];
  }
  else if (self->_resumeButton == v5)
  {
    [WeakRetained resumeDownload:self->_download];
  }
  else if (self->_revealButton == v5)
  {
    [WeakRetained revealDownload:self->_download];
  }
}

- (void)setIconCache:(id)a3
{
  objc_storeStrong((id *)&self->_iconCache, a3);
  id v5 = a3;
  [v5 addCacheObserver:self];
}

- (void)setDownload:(id)a3
{
  id v5 = (_SFDownload *)a3;
  download = self->_download;
  if (download != v5)
  {
    double v10 = v5;
    if (download)
    {
      uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v7 removeObserver:self name:0 object:self->_download];
    }
    objc_storeStrong((id *)&self->_download, a3);
    v8 = [(_SFDownloadIconCache *)self->_iconCache iconForSource:v10];
    [(UIImageView *)self->_iconView setImage:v8];

    id v5 = v10;
    if (v10)
    {
      double v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 addObserver:self selector:sel__downloadChanged_ name:*MEMORY[0x1E4F3B140] object:v10];
      [v9 addObserver:self selector:sel__downloadURLChanged_ name:*MEMORY[0x1E4F3B138] object:v10];
      [(DownloadTableViewCell *)self _updateCellContents];

      id v5 = v10;
    }
  }
}

- (void)_downloadChanged:(id)a3
{
  if (SFDeferrableUpdateViewShouldAttemptToUpdateContents())
  {
    [(DownloadTableViewCell *)self _updateCellContents];
  }
}

- (void)_downloadURLChanged:(id)a3
{
  id v4 = [(_SFDownload *)self->_download filenameWithoutExtension];
  [(UILabel *)self->_nameLabel setText:v4];
}

- (void)_updateCellContents
{
  v23[5] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(_SFDownload *)self->_download filenameWithoutExtension];
  [(UILabel *)self->_nameLabel setText:v3];

  [(UIButton *)self->_cancelButton setHidden:[(_SFDownload *)self->_download isIdle]];
  [(UIButton *)self->_resumeButton setHidden:[(_SFDownload *)self->_download canResume] ^ 1];
  [(UIButton *)self->_revealButton setHidden:[(_SFDownload *)self->_download canReveal] ^ 1];
  if ([(_SFDownload *)self->_download isIdle])
  {
    [(_SFDownload *)self->_download progress];
    BOOL v5 = v4 >= 1.0;
  }
  else
  {
    BOOL v5 = 0;
  }
  [(UIProgressView *)self->_progressView setHidden:v5];
  if (([(UIProgressView *)self->_progressView isHidden] & 1) == 0)
  {
    [(_SFDownload *)self->_download progress];
    *(float *)&double v6 = v6;
    [(UIProgressView *)self->_progressView setProgress:v6];
    if ([(_SFDownload *)self->_download isIdle]) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 0;
    }
    [(UIProgressView *)self->_progressView setTintAdjustmentMode:v7];
  }
  if ([(_SFDownload *)self->_download state] == 4)
  {
    [(_SFDownload *)self->_download bytesLoaded];
    NSLocalizedFileSizeDescription();
  }
  else
  {
    [(DownloadTableViewCell *)self _busyStatus];
  v8 = };
  [(UILabel *)self->_statusLabel setText:v8];

  if ([(UIButton *)self->_cancelButton isHidden]) {
    double v9 = @"ResumeDownloadButton";
  }
  else {
    double v9 = @"CancelDownloadButton";
  }
  [(UIButton *)self->_resumeButton setAccessibilityIdentifier:v9];
  [(UIButton *)self->_cancelButton setAccessibilityIdentifier:v9];
  v22[0] = @"complete";
  if ([(_SFDownload *)self->_download state] == 4) {
    double v10 = @"true";
  }
  else {
    double v10 = @"false";
  }
  v23[0] = v10;
  v22[1] = @"progress";
  v11 = NSString;
  [(_SFDownload *)self->_download progress];
  uint64_t v13 = objc_msgSend(v11, "stringWithFormat:", @"%f", v12);
  v23[1] = v13;
  v22[2] = @"canResume";
  if ([(_SFDownload *)self->_download canResume]) {
    v14 = @"true";
  }
  else {
    v14 = @"false";
  }
  v23[2] = v14;
  v22[3] = @"idle";
  if ([(_SFDownload *)self->_download isIdle]) {
    uint64_t v15 = @"true";
  }
  else {
    uint64_t v15 = @"false";
  }
  v23[3] = v15;
  v22[4] = @"uuid";
  v16 = [(_SFDownload *)self->_download identifier];
  uint64_t v17 = [v16 UUIDString];
  v18 = (void *)v17;
  uint64_t v19 = &stru_1F3C268E8;
  if (v17) {
    uint64_t v19 = (__CFString *)v17;
  }
  v23[4] = v19;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:5];
  id v21 = WBSMakeAccessibilityIdentifier();
  [(DownloadTableViewCell *)self setAccessibilityIdentifier:v21];
}

- (void)_updateCellContentsForSizing
{
  [(UILabel *)self->_nameLabel setText:@"A"];
  statusLabel = self->_statusLabel;
  [(UILabel *)statusLabel setText:@"A"];
}

- (id)_busyStatus
{
  uint64_t v3 = [(_SFDownload *)self->_download bytesExpected];
  [(_SFDownload *)self->_download bytesLoaded];
  double v4 = NSString;
  BOOL v5 = _WBSLocalizedString();
  double v6 = NSLocalizedFileSizeDescription();
  if (v3 < 0)
  {
    v8 = objc_msgSend(v4, "stringWithFormat:", v5, v6);
  }
  else
  {
    uint64_t v7 = NSLocalizedFileSizeDescription();
    v8 = objc_msgSend(v4, "localizedStringWithFormat:", v5, v6, v7);
  }
  return v8;
}

- ($A17CE7BAAAAB13D21F74688DC5009C79)deferrableUpdateViewState
{
  return ($A17CE7BAAAAB13D21F74688DC5009C79 *)&self->deferrableUpdateViewState;
}

- (void)downloadIconCache:(id)a3 didGenerateNewIcon:(id)a4 forSource:(id)a5
{
  if (self->_download == a5) {
    [(UIImageView *)self->_iconView setImage:a4];
  }
}

- (_SFDownload)download
{
  return self->_download;
}

- (_SFDownloadIconCache)iconCache
{
  return self->_iconCache;
}

- (DownloadTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DownloadTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_iconCache, 0);
  objc_storeStrong((id *)&self->_download, 0);

  objc_storeStrong((id *)&self->_resumeButton, 0);
  objc_storeStrong((id *)&self->_revealButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
}

@end