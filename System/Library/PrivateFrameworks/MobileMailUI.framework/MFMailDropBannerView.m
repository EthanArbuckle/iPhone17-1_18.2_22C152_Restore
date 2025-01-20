@interface MFMailDropBannerView
- (BOOL)_hasDataLocally;
- (BOOL)_shouldDisplayProgress;
- (BOOL)shouldPresent;
- (EMMailDropMetadata)metaData;
- (MFMailDropBannerDelegate)delegate;
- (MFMailDropBannerView)initWithFrame:(CGRect)a3;
- (double)downloadProgress;
- (unint64_t)bannerState;
- (void)_setupDownloadIcon;
- (void)_setupDownloadLabel;
- (void)_setupExpirationLabel;
- (void)contentSizeCategoryDidChangeNotification:(id)a3;
- (void)setBannerState:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDownloadProgress:(double)a3;
- (void)setMetaData:(id)a3;
- (void)setSeparatorIsHidden:(BOOL)a3;
- (void)startDownload:(id)a3;
- (void)updateConstraints;
@end

@implementation MFMailDropBannerView

- (MFMailDropBannerView)initWithFrame:(CGRect)a3
{
  v73[11] = *MEMORY[0x1E4F143B8];
  v72.receiver = self;
  v72.super_class = (Class)MFMailDropBannerView;
  v3 = -[MFMessageHeaderViewBlock initWithFrame:](&v72, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MFMailDropBannerView *)v3 setClipsToBounds:0];
    id v5 = objc_alloc(MEMORY[0x1E4FB1930]);
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], v7, v8, v9);
    downloadLabel = v4->_downloadLabel;
    v4->_downloadLabel = (UILabel *)v10;

    v12 = v4->_downloadLabel;
    v13 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v12 setTextColor:v13];

    v14 = v4->_downloadLabel;
    v15 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
    [(UILabel *)v14 setFont:v15];

    [(UILabel *)v4->_downloadLabel setNumberOfLines:0];
    [(UILabel *)v4->_downloadLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MFMailDropBannerView *)v4 addSubview:v4->_downloadLabel];
    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v6, v7, v8, v9);
    expirationLabel = v4->_expirationLabel;
    v4->_expirationLabel = (UILabel *)v16;

    v18 = v4->_expirationLabel;
    v19 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v18 setTextColor:v19];

    v20 = v4->_expirationLabel;
    v21 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
    [(UILabel *)v20 setFont:v21];

    [(UILabel *)v4->_expirationLabel setNumberOfLines:0];
    [(UILabel *)v4->_expirationLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MFMailDropBannerView *)v4 addSubview:v4->_expirationLabel];
    v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v22 addObserver:v4 selector:sel_contentSizeCategoryDidChangeNotification_ name:*MEMORY[0x1E4FB27A8] object:0];

    uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB14D0]), "initWithFrame:", v6, v7, v8, v9);
    downloadIcon = v4->_downloadIcon;
    v4->_downloadIcon = (UIButton *)v23;

    LODWORD(v25) = -16.0;
    [(UIButton *)v4->_downloadIcon setCharge:v25];
    [(UIButton *)v4->_downloadIcon setTranslatesAutoresizingMaskIntoConstraints:0];
    v26 = [(MFMailDropBannerView *)v4 tintColor];
    [(UIButton *)v4->_downloadIcon setTintColor:v26];

    [(MFMailDropBannerView *)v4 addSubview:v4->_downloadIcon];
    uint64_t v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F35118]), "initWithProgressViewStyle:stroke:frame:", 0, 2.0, 0.0, 0.0, 26.0, 26.0);
    progressView = v4->_progressView;
    v4->_progressView = (MFProgressView *)v27;

    [(MFProgressView *)v4->_progressView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MFProgressView *)v4->_progressView setHidden:1];
    [(MFMailDropBannerView *)v4 addSubview:v4->_progressView];
    v71 = [(MFMailDropBannerView *)v4 layoutMarginsGuide];
    v29 = [(UILabel *)v4->_downloadLabel firstBaselineAnchor];
    v30 = [(MFMailDropBannerView *)v4 topAnchor];
    uint64_t v31 = [v29 constraintEqualToAnchor:v30 constant:0.0];
    labelFirstBaseline = v4->_labelFirstBaseline;
    v4->_labelFirstBaseline = (NSLayoutConstraint *)v31;

    v33 = [(UILabel *)v4->_expirationLabel firstBaselineAnchor];
    v34 = [(UILabel *)v4->_downloadLabel lastBaselineAnchor];
    uint64_t v35 = [v33 constraintEqualToAnchor:v34 constant:0.0];
    expirationFirstBaseline = v4->_expirationFirstBaseline;
    v4->_expirationFirstBaseline = (NSLayoutConstraint *)v35;

    v37 = [(UILabel *)v4->_expirationLabel bottomAnchor];
    v38 = [(MFMailDropBannerView *)v4 bottomAnchor];
    uint64_t v39 = [v37 constraintEqualToAnchor:v38 constant:0.0];
    expirationBottom = v4->_expirationBottom;
    v4->_expirationBottom = (NSLayoutConstraint *)v39;

    v73[0] = v4->_labelFirstBaseline;
    v70 = [(UILabel *)v4->_downloadLabel leadingAnchor];
    v65 = [v71 leadingAnchor];
    v64 = objc_msgSend(v70, "constraintEqualToAnchor:");
    v73[1] = v64;
    v69 = [(UILabel *)v4->_downloadLabel trailingAnchor];
    v63 = [(MFMessageHeaderViewBlock *)v4 trailingAccessoryViewLayoutGuide];
    v62 = [v63 leadingAnchor];
    v61 = objc_msgSend(v69, "constraintLessThanOrEqualToAnchor:");
    v73[2] = v61;
    v73[3] = v4->_expirationFirstBaseline;
    v73[4] = v4->_expirationBottom;
    v68 = [(UILabel *)v4->_expirationLabel leadingAnchor];
    v60 = [(UILabel *)v4->_downloadLabel leadingAnchor];
    v59 = objc_msgSend(v68, "constraintEqualToAnchor:");
    v73[5] = v59;
    v67 = [(UILabel *)v4->_expirationLabel trailingAnchor];
    v58 = [(MFMessageHeaderViewBlock *)v4 trailingAccessoryViewLayoutGuide];
    v57 = [v58 leadingAnchor];
    v56 = objc_msgSend(v67, "constraintLessThanOrEqualToAnchor:");
    v73[6] = v56;
    v66 = [(UIButton *)v4->_downloadIcon centerXAnchor];
    v55 = [(MFMessageHeaderViewBlock *)v4 trailingAccessoryViewLayoutGuide];
    v54 = [v55 centerXAnchor];
    v53 = objc_msgSend(v66, "constraintEqualToAnchor:");
    v73[7] = v53;
    v52 = [(UIButton *)v4->_downloadIcon centerYAnchor];
    v51 = [(MFMailDropBannerView *)v4 centerYAnchor];
    v41 = [v52 constraintEqualToAnchor:v51];
    v73[8] = v41;
    v42 = [(MFProgressView *)v4->_progressView centerXAnchor];
    v43 = [(MFMessageHeaderViewBlock *)v4 trailingAccessoryViewLayoutGuide];
    v44 = [v43 centerXAnchor];
    v45 = [v42 constraintEqualToAnchor:v44];
    v73[9] = v45;
    v46 = [(MFProgressView *)v4->_progressView centerYAnchor];
    v47 = [(MFMailDropBannerView *)v4 centerYAnchor];
    v48 = [v46 constraintEqualToAnchor:v47];
    v73[10] = v48;
    v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:11];

    [MEMORY[0x1E4F28DC8] activateConstraints:v49];
  }
  return v4;
}

- (void)setBannerState:(unint64_t)a3
{
  if (self->_metaData)
  {
    v3 = objc_msgSend(MEMORY[0x1E4F60F28], "mainThreadScheduler", MEMORY[0x1E4F143A8], 3221225472, __39__MFMailDropBannerView_setBannerState___block_invoke, &unk_1E6D1B040, self, a3);
    [v3 performBlock:&v4];
  }
}

void __39__MFMailDropBannerView_setBannerState___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(void *)(v1 + 568) == v2) {
    return;
  }
  *(void *)(v1 + 568) = v2;
  char v4 = [*(id *)(*(void *)(a1 + 32) + 560) isInvalid];
  uint64_t v5 = *(void *)(a1 + 32);
  if (v4)
  {
    uint64_t v6 = 5;
LABEL_6:
    *(void *)(v5 + 568) = v6;
    goto LABEL_7;
  }
  if ([*(id *)(v5 + 560) isExpired])
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = 4;
    goto LABEL_6;
  }
LABEL_7:
  [*(id *)(a1 + 32) _setupDownloadLabel];
  [*(id *)(a1 + 32) _setupExpirationLabel];
  [*(id *)(a1 + 32) _setupDownloadIcon];
  if (*(void *)(a1 + 40) == 3) {
    [*(id *)(*(void *)(a1 + 32) + 520) progressDidFinish];
  }
  id v7 = [*(id *)(a1 + 32) superview];
  [v7 setNeedsLayout];
}

- (BOOL)_hasDataLocally
{
  return [(MFMailDropBannerView *)self bannerState] == 3;
}

- (void)updateConstraints
{
  v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  char v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
  uint64_t v5 = [(MFMessageHeaderViewBlock *)self displayMetrics];
  [v5 avatarDiameterForCurrentContentSize];
  -[NSLayoutConstraint setConstant:](self->_iconWrapperWidth, "setConstant:");

  [v3 _bodyLeading];
  [(NSLayoutConstraint *)self->_labelFirstBaseline setConstant:v6 * 1.11111111];
  [v4 _bodyLeading];
  [(NSLayoutConstraint *)self->_expirationFirstBaseline setConstant:v7 * 1.125];
  [v3 _bodyLeading];
  [(NSLayoutConstraint *)self->_expirationBottom setConstant:v8 * -0.666666667];
  v9.receiver = self;
  v9.super_class = (Class)MFMailDropBannerView;
  [(MFMessageHeaderViewBlock *)&v9 updateConstraints];
}

- (void)_setupDownloadLabel
{
  char v3 = [(EMMailDropMetadata *)self->_metaData flags];
  switch(self->_bannerState)
  {
    case 1uLL:
      if (([(EMMailDropMetadata *)self->_metaData flags] & 2) != 0)
      {
        if (([(EMMailDropMetadata *)self->_metaData flags] & 4) != 0)
        {
          char v4 = [MEMORY[0x1E4F28B50] mainBundle];
          [v4 localizedStringForKey:@"MAIL_DROP_BANNER_SAVE_MIXED" value:&stru_1F39E2A88 table:@"Main"];
        }
        else
        {
          char v4 = [MEMORY[0x1E4F28B50] mainBundle];
          [v4 localizedStringForKey:@"MAIL_DROP_BANNER_SAVE_IMAGE" value:&stru_1F39E2A88 table:@"Main"];
        }
      }
      else
      {
        [MEMORY[0x1E4F28B50] mainBundle];
        if ((v3 & 0x10) != 0) {
          char v4 = {;
        }
          [v4 localizedStringForKey:@"MAIL_DROP_BANNER_SAVE_NONIMAGE_PLURAL" value:&stru_1F39E2A88 table:@"Main"];
        }
        else {
          char v4 = {;
        }
          [v4 localizedStringForKey:@"MAIL_DROP_BANNER_SAVE_NONIMAGE" value:&stru_1F39E2A88 table:@"Main"];
        }
      }
      goto LABEL_35;
    case 2uLL:
      if (([(EMMailDropMetadata *)self->_metaData flags] & 2) != 0)
      {
        if (([(EMMailDropMetadata *)self->_metaData flags] & 4) == 0)
        {
          char v4 = [MEMORY[0x1E4F28B50] mainBundle];
          uint64_t v5 = [v4 localizedStringForKey:@"MAIL_DROP_BANNER_DOWNLOADING_IMAGES" value:&stru_1F39E2A88 table:@"Main"];
          goto LABEL_15;
        }
        [MEMORY[0x1E4F28B50] mainBundle];
        if ((v3 & 0x10) != 0) {
          char v4 = {;
        }
          [v4 localizedStringForKey:@"MAIL_DROP_BANNER_DOWNLOADING_MIXED_PLURAL" value:&stru_1F39E2A88 table:@"Main"];
        }
        else {
          char v4 = {;
        }
          [v4 localizedStringForKey:@"MAIL_DROP_BANNER_DOWNLOADING_MIXED" value:&stru_1F39E2A88 table:@"Main"];
        }
      }
      else
      {
        [MEMORY[0x1E4F28B50] mainBundle];
        if ((v3 & 0x10) != 0) {
          char v4 = {;
        }
          [v4 localizedStringForKey:@"MAIL_DROP_BANNER_DOWNLOADING_NONIMAGE_PLURAL" value:&stru_1F39E2A88 table:@"Main"];
        }
        else {
          char v4 = {;
        }
          [v4 localizedStringForKey:@"MAIL_DROP_BANNER_DOWNLOADING_NONIMAGE" value:&stru_1F39E2A88 table:@"Main"];
        }
      }
      uint64_t v5 = LABEL_35:;
LABEL_15:
      id v6 = (id)v5;

      [(UILabel *)self->_downloadLabel setText:v6];

      return;
    case 3uLL:
      if (([(EMMailDropMetadata *)self->_metaData flags] & 2) != 0)
      {
        if (([(EMMailDropMetadata *)self->_metaData flags] & 4) != 0)
        {
          char v4 = [MEMORY[0x1E4F28B50] mainBundle];
          [v4 localizedStringForKey:@"MAIL_DROP_BANNER_DOWNLOADED_MIXED" value:&stru_1F39E2A88 table:@"Main"];
        }
        else
        {
          char v4 = [MEMORY[0x1E4F28B50] mainBundle];
          [v4 localizedStringForKey:@"MAIL_DROP_BANNER_DOWNLOADED_IMAGE" value:&stru_1F39E2A88 table:@"Main"];
        }
      }
      else
      {
        [MEMORY[0x1E4F28B50] mainBundle];
        if ((v3 & 0x10) != 0) {
          char v4 = {;
        }
          [v4 localizedStringForKey:@"MAIL_DROP_BANNER_DOWNLOADED_PLURAL" value:&stru_1F39E2A88 table:@"Main"];
        }
        else {
          char v4 = {;
        }
          [v4 localizedStringForKey:@"MAIL_DROP_BANNER_DOWNLOADED" value:&stru_1F39E2A88 table:@"Main"];
        }
      }
      goto LABEL_35;
    case 4uLL:
      if (([(EMMailDropMetadata *)self->_metaData flags] & 2) != 0)
      {
        if (([(EMMailDropMetadata *)self->_metaData flags] & 4) != 0)
        {
          char v4 = [MEMORY[0x1E4F28B50] mainBundle];
          [v4 localizedStringForKey:@"MAIL_DROP_BANNER_ATTACHMENT" value:&stru_1F39E2A88 table:@"Main"];
        }
        else
        {
          char v4 = [MEMORY[0x1E4F28B50] mainBundle];
          [v4 localizedStringForKey:@"MAIL_DROP_BANNER_FULL_RES" value:&stru_1F39E2A88 table:@"Main"];
        }
      }
      else
      {
        [MEMORY[0x1E4F28B50] mainBundle];
        if ((v3 & 0x10) != 0) {
          char v4 = {;
        }
          [v4 localizedStringForKey:@"MAIL_DROP_BANNER_ATTACHMENT_PLURAL" value:&stru_1F39E2A88 table:@"Main"];
        }
        else {
          char v4 = {;
        }
          [v4 localizedStringForKey:@"MAIL_DROP_BANNER_ATTACHMENT" value:&stru_1F39E2A88 table:@"Main"];
        }
      }
      goto LABEL_35;
    default:
      char v4 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v5 = [v4 localizedStringForKey:@"MAIL_DROP_BANNER_ERROR" value:&stru_1F39E2A88 table:@"Main"];
      goto LABEL_15;
  }
}

- (void)_setupExpirationLabel
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1DDF5A000, log, OS_LOG_TYPE_ERROR, "#Attachments nil date string result for meta data [%@] expiration [%@]", buf, 0x16u);
}

- (void)_setupDownloadIcon
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__MFMailDropBannerView__setupDownloadIcon__block_invoke;
  aBlock[3] = &unk_1E6D1B068;
  aBlock[4] = self;
  char v3 = _Block_copy(aBlock);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__MFMailDropBannerView__setupDownloadIcon__block_invoke_2;
  v6[3] = &unk_1E6D1B090;
  v6[4] = self;
  id v4 = v3;
  id v7 = v4;
  uint64_t v5 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  [v5 performBlock:v6];
}

void __42__MFMailDropBannerView__setupDownloadIcon__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = *(void **)(*(void *)(a1 + 32) + 512);
  id v9 = v5;
  id v7 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_systemImageNamed:forView:");
  [v6 setImage:v7 forState:0];

  double v8 = *(void **)(*(void *)(a1 + 32) + 512);
  if (a3) {
    objc_msgSend(v8, "addTarget:action:forControlEvents:");
  }
  else {
    objc_msgSend(v8, "removeTarget:action:forControlEvents:");
  }
}

uint64_t __42__MFMailDropBannerView__setupDownloadIcon__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 520) setHidden:1];
  [*(id *)(*(void *)(a1 + 32) + 512) setHidden:0];
  switch([*(id *)(a1 + 32) bannerState])
  {
    case 2:
      [*(id *)(*(void *)(a1 + 32) + 520) setHidden:0];
      [*(id *)(*(void *)(a1 + 32) + 512) setHidden:1];
      [*(id *)(*(void *)(a1 + 32) + 520) sizeToFit];
      [*(id *)(a1 + 32) bringSubviewToFront:*(void *)(*(void *)(a1 + 32) + 520)];
      [*(id *)(*(void *)(a1 + 32) + 520) setNeedsDisplay];
      [*(id *)(*(void *)(a1 + 32) + 512) removeTarget:*(void *)(a1 + 32) action:sel_startDownload_ forControlEvents:64];
      goto LABEL_8;
    case 3:
      uint64_t v2 = *(void *)(a1 + 40);
      goto LABEL_6;
    case 4:
    case 5:
      uint64_t v2 = *(void *)(a1 + 40);
LABEL_6:
      char v3 = *(void (**)(void))(v2 + 16);
      goto LABEL_7;
    default:
      char v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_7:
      v3();
LABEL_8:
      [*(id *)(*(void *)(a1 + 32) + 512) sizeToFit];
      [*(id *)(a1 + 32) bringSubviewToFront:*(void *)(*(void *)(a1 + 32) + 512)];
      id v4 = *(void **)(*(void *)(a1 + 32) + 512);
      return [v4 setNeedsDisplay];
  }
}

- (void)startDownload:(id)a3
{
  [(MFMailDropBannerView *)self setBannerState:2];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained mailDropBannerDidTriggerDownload:self];
}

- (void)setDownloadProgress:(double)a3
{
  self->_downloadProgress = a3;
  if ([(MFMailDropBannerView *)self _shouldDisplayProgress])
  {
    progressView = self->_progressView;
    [(MFProgressView *)progressView setProgress:a3];
  }
}

- (BOOL)_shouldDisplayProgress
{
  return [(MFMailDropBannerView *)self bannerState] == 2;
}

- (void)contentSizeCategoryDidChangeNotification:(id)a3
{
  downloadLabel = self->_downloadLabel;
  id v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  [(UILabel *)downloadLabel setFont:v5];

  expirationLabel = self->_expirationLabel;
  id v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
  [(UILabel *)expirationLabel setFont:v7];

  [(MFMailDropBannerView *)self setNeedsUpdateConstraints];
  [(MFMailDropBannerView *)self invalidateIntrinsicContentSize];
}

- (BOOL)shouldPresent
{
  return self->_metaData != 0;
}

- (void)setSeparatorIsHidden:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MFMailDropBannerView;
  [(MFMessageHeaderViewBlock *)&v3 setSeparatorIsHidden:0];
}

- (EMMailDropMetadata)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
}

- (unint64_t)bannerState
{
  return self->_bannerState;
}

- (double)downloadProgress
{
  return self->_downloadProgress;
}

- (MFMailDropBannerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MFMailDropBannerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_expirationBottom, 0);
  objc_storeStrong((id *)&self->_expirationFirstBaseline, 0);
  objc_storeStrong((id *)&self->_labelFirstBaseline, 0);
  objc_storeStrong((id *)&self->_iconWrapperWidth, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_downloadIcon, 0);
  objc_storeStrong((id *)&self->_downloadLabel, 0);
  objc_storeStrong((id *)&self->_expirationLabel, 0);
}

@end