@interface ICQBackupStatusView
- (ICQBackupStatusView)initWithSpecifier:(id)a3;
- (NSArray)syncErrors;
- (NSError)backupError;
- (NSString)footerText;
- (double)backupProgress;
- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4;
- (double)progress;
- (void)_layoutSubviews;
- (void)_sizeToFitWidth:(double)a3 inTableView:(id)a4;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)setBackupError:(id)a3;
- (void)setBackupProgress:(double)a3;
- (void)setBackupProgress:(double)a3 timeIntervalRemaining:(double)a4;
- (void)setFooterText:(id)a3;
- (void)setLastBackupText:(id)a3;
- (void)setSyncErrors:(id)a3;
- (void)sizeToFit;
- (void)updateStatus:(id)a3;
- (void)updateViewsForBackupState:(int)a3 restoreState:(int)a4 enabled:(BOOL)a5;
@end

@implementation ICQBackupStatusView

- (ICQBackupStatusView)initWithSpecifier:(id)a3
{
  v53.receiver = self;
  v53.super_class = (Class)ICQBackupStatusView;
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  v7 = -[ICQBackupStatusView initWithFrame:](&v53, sel_initWithFrame_, a3, *MEMORY[0x263F001A8], v4, v5, v6);
  if (v7)
  {
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    visibleSubviews = v7->_visibleSubviews;
    v7->_visibleSubviews = v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    spinner = v7->_spinner;
    v7->_spinner = (UIActivityIndicatorView *)v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x263F82AF0]) initWithProgressViewStyle:0];
    progressBar = v7->_progressBar;
    v7->_progressBar = (UIProgressView *)v12;

    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v3, v4, v5, v6);
    statusLabel = v7->_statusLabel;
    v7->_statusLabel = (UILabel *)v14;

    uint64_t v16 = *MEMORY[0x263F83570];
    v17 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    [(UILabel *)v7->_statusLabel setFont:v17];

    [(UILabel *)v7->_statusLabel setAdjustsFontForContentSizeCategory:1];
    v18 = v7->_statusLabel;
    v19 = [MEMORY[0x263F825C8] labelColor];
    [(UILabel *)v18 setTextColor:v19];

    v20 = v7->_statusLabel;
    v21 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)v20 setBackgroundColor:v21];

    uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v3, v4, v5, v6);
    timeRemainingLabel = v7->_timeRemainingLabel;
    v7->_timeRemainingLabel = (UILabel *)v22;

    v24 = [MEMORY[0x263F81708] preferredFontForTextStyle:v16];
    [(UILabel *)v7->_timeRemainingLabel setFont:v24];

    [(UILabel *)v7->_timeRemainingLabel setAdjustsFontForContentSizeCategory:1];
    v25 = v7->_timeRemainingLabel;
    v26 = [MEMORY[0x263F825C8] labelColor];
    [(UILabel *)v25 setTextColor:v26];

    [(UILabel *)v7->_timeRemainingLabel setTextAlignment:1];
    v27 = v7->_timeRemainingLabel;
    v28 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)v27 setBackgroundColor:v28];

    v29 = v7->_timeRemainingLabel;
    v30 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v31 = [v30 localizedStringForKey:@"ESTIMATING_TIME_REMAINING" value:&stru_26DFF2C90 table:@"Backup"];
    [(UILabel *)v29 setText:v31];

    uint64_t v32 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v3, v4, v5, v6);
    backupIssueLabel = v7->_backupIssueLabel;
    v7->_backupIssueLabel = (UILabel *)v32;

    v34 = v7->_backupIssueLabel;
    v35 = PreferencesTableViewFooterFont();
    [(UILabel *)v34 setFont:v35];

    v36 = v7->_backupIssueLabel;
    v37 = [MEMORY[0x263F825C8] secondaryLabelColor];
    [(UILabel *)v36 setTextColor:v37];

    [(UILabel *)v7->_backupIssueLabel setTextAlignment:4];
    v38 = v7->_backupIssueLabel;
    v39 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)v38 setBackgroundColor:v39];

    [(UILabel *)v7->_backupIssueLabel setNumberOfLines:0];
    uint64_t v40 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v3, v4, v5, v6);
    lastBackupLabel = v7->_lastBackupLabel;
    v7->_lastBackupLabel = (UILabel *)v40;

    v42 = v7->_lastBackupLabel;
    v43 = PreferencesTableViewFooterFont();
    [(UILabel *)v42 setFont:v43];

    v44 = v7->_lastBackupLabel;
    v45 = [MEMORY[0x263F825C8] secondaryLabelColor];
    [(UILabel *)v44 setTextColor:v45];

    [(UILabel *)v7->_lastBackupLabel setTextAlignment:4];
    v46 = v7->_lastBackupLabel;
    v47 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)v46 setBackgroundColor:v47];

    [(UILabel *)v7->_lastBackupLabel setNumberOfLines:0];
    v48 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v49 = [v48 localizedStringForKey:@"DETERMINING_LAST_BACKUP" value:&stru_26DFF2C90 table:@"Backup"];
    [(ICQBackupStatusView *)v7 setLastBackupText:v49];

    v50 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x263F08780]);
    durationFormatter = v7->_durationFormatter;
    v7->_durationFormatter = v50;

    [(NSDateComponentsFormatter *)v7->_durationFormatter setUnitsStyle:3];
    [(NSDateComponentsFormatter *)v7->_durationFormatter setAllowedUnits:240];
    [(NSDateComponentsFormatter *)v7->_durationFormatter setMaximumUnitCount:1];
    [(NSDateComponentsFormatter *)v7->_durationFormatter setIncludesApproximationPhrase:1];
    [(NSDateComponentsFormatter *)v7->_durationFormatter setIncludesTimeRemainingPhrase:1];
    [(NSDateComponentsFormatter *)v7->_durationFormatter setFormattingContext:2];
  }
  return v7;
}

- (void)didMoveToSuperview
{
  [(ICQBackupStatusView *)self bounds];
  if (v4 == *MEMORY[0x263F001B0] && v3 == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    [(ICQBackupStatusView *)self sizeToFit];
  }
}

- (void)setLastBackupText:(id)a3
{
  [(UILabel *)self->_lastBackupLabel setText:a3];
  [(ICQBackupStatusView *)self sizeToFit];
}

- (void)updateStatus:(id)a3
{
  [(UILabel *)self->_statusLabel setText:a3];
  statusLabel = self->_statusLabel;
  [(UILabel *)statusLabel sizeToFit];
}

- (void)_sizeToFitWidth:(double)a3 inTableView:(id)a4
{
  id v6 = a4;
  if (!v6) {
    -[ICQBackupStatusView _sizeToFitWidth:inTableView:]();
  }
  id v45 = v6;
  PSTextViewInsets();
  double v8 = v7;
  [v45 _backgroundInset];
  double v10 = v9;
  if (PSIsN56())
  {
    PSTableViewSideInset();
  }
  else
  {
    PreferencesTableViewCellLeftPad();
    double v11 = v12;
  }
  double v13 = v10 + v11 - v8;
  [(ICQBackupStatusView *)self frame];
  double v44 = v14;
  double v16 = v15;
  int v17 = [(NSMutableSet *)self->_visibleSubviews containsObject:self->_backupIssueLabel];
  double v18 = 30.0;
  if (v17)
  {
    [(UILabel *)self->_backupIssueLabel frame];
    double v20 = v19;
    double v22 = v21;
    v23 = [(UILabel *)self->_backupIssueLabel text];
    v24 = [(UILabel *)self->_backupIssueLabel font];
    objc_msgSend(v23, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v24, -[UILabel lineBreakMode](self->_backupIssueLabel, "lineBreakMode"), a3 + v13 * -2.0, 1.79769313e308);
    double v26 = v25;
    double v28 = v27;

    -[UILabel setFrame:](self->_backupIssueLabel, "setFrame:", v20, v22, v26, v28);
    double v18 = v28 + 30.0;
  }
  int v29 = [(NSMutableSet *)self->_visibleSubviews containsObject:self->_lastBackupLabel];
  if (v29)
  {
    [(UILabel *)self->_lastBackupLabel frame];
    double v31 = v30;
    double v33 = v32;
    v34 = [(UILabel *)self->_lastBackupLabel text];
    v35 = [(UILabel *)self->_lastBackupLabel font];
    objc_msgSend(v34, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v35, -[UILabel lineBreakMode](self->_lastBackupLabel, "lineBreakMode"), a3 + v13 * -2.0, 1.79769313e308);
    double v37 = v36;
    double v39 = v38;

    -[UILabel setFrame:](self->_lastBackupLabel, "setFrame:", v31, v33, v37, v39);
    double v18 = v18 + v39;
  }
  if ((v17 & v29) != 0) {
    double v40 = v18 + 15.0;
  }
  else {
    double v40 = v18;
  }
  if ([(NSMutableSet *)self->_visibleSubviews containsObject:self->_statusLabel])
  {
    [(UILabel *)self->_statusLabel sizeToFit];
    [(UILabel *)self->_statusLabel bounds];
    double v40 = v40 + v41;
  }
  if ([(NSMutableSet *)self->_visibleSubviews containsObject:self->_timeRemainingLabel])
  {
    [(UILabel *)self->_timeRemainingLabel sizeToFit];
    [(UILabel *)self->_timeRemainingLabel frame];
    -[UILabel setFrame:](self->_timeRemainingLabel, "setFrame:");
    [(UILabel *)self->_timeRemainingLabel bounds];
    double v40 = v40 + v42;
  }
  if ([(NSMutableSet *)self->_visibleSubviews containsObject:self->_progressBar])
  {
    [(UIProgressView *)self->_progressBar bounds];
    double v40 = v40 + v43;
  }
  -[ICQBackupStatusView setFrame:](self, "setFrame:", v44, v16, a3, v40);
  [(ICQBackupStatusView *)self setNeedsLayout];
}

- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4
{
  [(ICQBackupStatusView *)self _sizeToFitWidth:a4 inTableView:a3];
  [(ICQBackupStatusView *)self bounds];
  return v5;
}

- (void)sizeToFit
{
  v8.receiver = self;
  v8.super_class = (Class)ICQBackupStatusView;
  [(ICQBackupStatusView *)&v8 sizeToFit];
  double v3 = [(ICQBackupStatusView *)self superview];

  if (v3)
  {
    double v4 = [(ICQBackupStatusView *)self superview];
    [v4 bounds];
    double v6 = v5;
    double v7 = [(ICQBackupStatusView *)self superview];
    [(ICQBackupStatusView *)self _sizeToFitWidth:v7 inTableView:v6];
  }
}

- (void)_layoutSubviews
{
  double v3 = [(ICQBackupStatusView *)self superview];
  if (v3)
  {
    double v4 = [(ICQBackupStatusView *)self superview];
    [v4 _backgroundInset];
    double v6 = v5;
    if (PSIsN56())
    {
      PSTableViewSideInset();
    }
    else
    {
      PreferencesTableViewCellLeftPad();
      double v7 = v9;
    }
    double v8 = v6 + v7;
  }
  else
  {
    double v8 = 15.0;
  }

  [(ICQBackupStatusView *)self bounds];
  double v11 = v10;
  backupIssueLabel = self->_backupIssueLabel;
  if (backupIssueLabel)
  {
    [(UILabel *)backupIssueLabel frame];
    double v14 = v13;
    double v16 = v15;
    int v17 = [MEMORY[0x263F82438] sharedApplication];
    uint64_t v18 = [v17 userInterfaceLayoutDirection];

    double v19 = v8;
    if (v18)
    {
      [(ICQBackupStatusView *)self bounds];
      double v19 = v20 - v8 - v14;
    }
    -[UILabel setFrame:](self->_backupIssueLabel, "setFrame:", v19, 10.0, v14, v16);
  }
  lastBackupLabel = self->_lastBackupLabel;
  if (lastBackupLabel)
  {
    [(UILabel *)lastBackupLabel frame];
    double v23 = v22;
    double v25 = v24;
    double v26 = [MEMORY[0x263F82438] sharedApplication];
    uint64_t v27 = [v26 userInterfaceLayoutDirection];

    double v28 = v8;
    if (v27)
    {
      [(ICQBackupStatusView *)self bounds];
      double v28 = v29 - v8 - v23;
    }
    double v30 = 10.0;
    if (self->_backupIssueLabel
      && -[NSMutableSet containsObject:](self->_visibleSubviews, "containsObject:"))
    {
      [(UILabel *)self->_backupIssueLabel frame];
      double v30 = CGRectGetMaxY(v51) + 15.0;
    }
    -[UILabel setFrame:](self->_lastBackupLabel, "setFrame:", v28, v30, v23, v25);
  }
  double v31 = v11 + v8 * -2.0;
  double v32 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v33 = *(double *)(MEMORY[0x263F001A8] + 24);
  statusLabel = self->_statusLabel;
  if (statusLabel)
  {
    [(UILabel *)statusLabel frame];
    double v36 = v35;
    float v38 = (v31 - v37) * 0.5;
    double v39 = v8 + floorf(v38);
    double v40 = 10.0;
    -[UILabel setFrame:](self->_statusLabel, "setFrame:", v39, 10.0);
  }
  else
  {
    double v39 = *MEMORY[0x263F001A8];
    double v40 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v36 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  spinner = self->_spinner;
  if (spinner)
  {
    [(UIActivityIndicatorView *)spinner frame];
    -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", v39 - v42 + -4.0, 10.0);
  }
  progressBar = self->_progressBar;
  if (progressBar)
  {
    [(UIProgressView *)progressBar frame];
    double v33 = v44;
    double v32 = v40 + v36 + 4.0;
    -[UIProgressView setFrame:](self->_progressBar, "setFrame:", v8, v32, v31);
  }
  timeRemainingLabel = self->_timeRemainingLabel;
  if (timeRemainingLabel)
  {
    [(UILabel *)timeRemainingLabel frame];
    float v47 = (v31 - v46) * 0.5;
    double v48 = v8 + floorf(v47);
    v49 = self->_timeRemainingLabel;
    -[UILabel setFrame:](v49, "setFrame:", v48, v32 + v33 + 4.0);
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)ICQBackupStatusView;
  [(ICQBackupStatusView *)&v3 layoutSubviews];
  [(ICQBackupStatusView *)self _layoutSubviews];
}

- (void)setBackupProgress:(double)a3 timeIntervalRemaining:(double)a4
{
  if (a4 > 604800.0 || a4 <= 0.0)
  {
    double v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v6 = [v7 localizedStringForKey:@"ESTIMATING_TIME_REMAINING" value:&stru_26DFF2C90 table:@"Backup"];
  }
  else
  {
    double v6 = [(NSDateComponentsFormatter *)self->_durationFormatter stringFromTimeInterval:a4];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__ICQBackupStatusView_setBackupProgress_timeIntervalRemaining___block_invoke;
  block[3] = &unk_264922C70;
  block[4] = self;
  id v10 = v6;
  double v11 = a3;
  id v8 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __63__ICQBackupStatusView_setBackupProgress_timeIntervalRemaining___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 432) setText:*(void *)(a1 + 40)];
  v2 = *(void **)(*(void *)(a1 + 32) + 416);
  double v3 = *(double *)(a1 + 48);
  *(float *)&double v3 = v3;
  return [v2 setProgress:v3];
}

- (double)progress
{
  [(UIProgressView *)self->_progressBar progress];
  return v2;
}

- (void)updateViewsForBackupState:(int)a3 restoreState:(int)a4 enabled:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v48 = *MEMORY[0x263EF8340];
  float v9 = ICQUSLogForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v47) = a3;
    _os_log_impl(&dword_22C821000, v9, OS_LOG_TYPE_DEFAULT, "update view for backup state: %d", buf, 8u);
  }

  self->_animatedToEnabled = v5;
  self->_animatingToState = a3;
  [(NSMutableSet *)self->_visibleSubviews removeAllObjects];
  if (a3 > 6)
  {
    id v10 = 0;
    goto LABEL_44;
  }
  if (((1 << a3) & 0x79) == 0)
  {
    objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", self->_backupIssueLabel, self->_lastBackupLabel, 0);
    id v10 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    visibleSubviews = self->_visibleSubviews;
    int v17 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", self->_spinner, self->_progressBar, self->_statusLabel, self->_timeRemainingLabel, 0);
    [(NSMutableSet *)visibleSubviews addObjectsFromArray:v17];

    [(UIActivityIndicatorView *)self->_spinner startAnimating];
    statusLabel = self->_statusLabel;
    double v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v20 = [v19 localizedStringForKey:@"BACKING_UP" value:&stru_26DFF2C90 table:@"Backup"];
    [(UILabel *)statusLabel setText:v20];

    goto LABEL_44;
  }
  objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", self->_spinner, self->_progressBar, self->_statusLabel, self->_timeRemainingLabel, 0);
  id v10 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  [(UIActivityIndicatorView *)self->_spinner stopAnimating];
  if (!v5)
  {
    [(NSMutableSet *)v10 addObject:self->_backupIssueLabel];
    goto LABEL_44;
  }
  if (!self->_backupError)
  {
    if ([(NSArray *)self->_syncErrors count])
    {
      double v21 = ICQUSLogForCategory(0);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        syncErrors = self->_syncErrors;
        *(_DWORD *)buf = 138412290;
        float v47 = syncErrors;
        _os_log_impl(&dword_22C821000, v21, OS_LOG_TYPE_DEFAULT, "sync errors only: %@", buf, 0xCu);
      }
      double v23 = 0;
      goto LABEL_32;
    }
    goto LABEL_22;
  }
  double v11 = ICQUSLogForCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    backupError = self->_backupError;
    *(_DWORD *)buf = 138412290;
    float v47 = backupError;
    _os_log_impl(&dword_22C821000, v11, OS_LOG_TYPE_DEFAULT, "backup error only: %@", buf, 0xCu);
  }

  double v13 = [(NSError *)self->_backupError domain];
  int v14 = [v13 isEqualToString:@"MBErrorDomain"];

  if (!v14) {
    goto LABEL_30;
  }
  uint64_t v15 = [(NSError *)self->_backupError code];
  if (v15 > 202)
  {
    switch(v15)
    {
      case 300:
      case 304:
      case 308:
        double v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        double v21 = v24;
        double v25 = @"BACKUP_ERROR_NETWORK";
        goto LABEL_31;
      case 301:
      case 302:
      case 305:
      case 306:
      case 307:
        goto LABEL_30;
      case 303:
        double v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        double v36 = (void *)MEMORY[0x263F82670];
        double v37 = @"BACKUP_ERROR_INSUFFICIENT_QUOTA";
        goto LABEL_47;
      default:
        if (v15 == 203)
        {
          double v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          double v36 = (void *)MEMORY[0x263F82670];
          double v37 = @"BACKUP_ERROR_VERSION";
LABEL_47:
          float v38 = [v36 modelSpecificLocalizedStringKeyForKey:v37];
          double v23 = [v21 localizedStringForKey:v38 value:&stru_26DFF2C90 table:@"Backup"];

          goto LABEL_32;
        }
        if (v15 != 209) {
          goto LABEL_30;
        }
        double v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        double v21 = v24;
        double v25 = @"BACKUP_ERROR_MISSING_ENCRYPTION_KEY";
        break;
    }
    goto LABEL_31;
  }
  if (v15 == 13)
  {
    double v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v21 = v24;
    double v25 = @"BACKUP_ERROR_LOCKED";
LABEL_31:
    double v23 = [v24 localizedStringForKey:v25 value:&stru_26DFF2C90 table:@"Backup"];
LABEL_32:

    goto LABEL_33;
  }
  if (v15 == 105)
  {
    double v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v21 = v24;
    double v25 = @"BACKUP_ERROR_NO_SPACE";
    goto LABEL_31;
  }
  if (v15 != 202)
  {
LABEL_30:
    double v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v21 = v24;
    double v25 = @"BACKUP_ERROR";
    goto LABEL_31;
  }
LABEL_22:
  double v23 = 0;
LABEL_33:
  if ((a4 - 1) > 1)
  {
    [(NSMutableSet *)self->_visibleSubviews addObject:self->_lastBackupLabel];
  }
  else
  {
    [(NSMutableSet *)v10 addObject:self->_lastBackupLabel];

    double v26 = self->_backupError;
    self->_backupError = 0;

    double v23 = 0;
  }
  uint64_t v27 = [(ICQBackupStatusView *)self footerText];

  if (v27)
  {
    uint64_t v28 = [(ICQBackupStatusView *)self footerText];
    double v29 = (void *)v28;
    if (v23)
    {
      uint64_t v30 = [v23 stringByAppendingFormat:@"\n\n%@", v28];

      double v23 = (void *)v30;
    }
    else
    {
      double v23 = (void *)v28;
    }
  }
  [(UILabel *)self->_backupIssueLabel setText:v23];
  if ([v23 length])
  {
    double v31 = self->_visibleSubviews;
    backupIssueLabel = self->_backupIssueLabel;
  }
  else
  {
    backupIssueLabel = self->_backupIssueLabel;
    double v31 = v10;
  }
  [(NSMutableSet *)v31 addObject:backupIssueLabel];

LABEL_44:
  double v33 = (void *)MEMORY[0x263F82E00];
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __70__ICQBackupStatusView_updateViewsForBackupState_restoreState_enabled___block_invoke;
  v43[3] = &unk_264921B68;
  double v44 = v10;
  id v45 = self;
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __70__ICQBackupStatusView_updateViewsForBackupState_restoreState_enabled___block_invoke_2;
  v39[3] = &unk_264922C98;
  int v41 = a3;
  BOOL v42 = v5;
  v39[4] = self;
  double v40 = v44;
  v34 = v44;
  [v33 animateWithDuration:0 delay:v43 options:v39 animations:0.400000006 completion:0.0];
  [(ICQBackupStatusView *)self sizeToFit];
  [(ICQBackupStatusView *)self _layoutSubviews];
  double v35 = [(ICQBackupStatusView *)self superview];
  [(ICQBackupStatusView *)self frame];
  objc_msgSend(v35, "setNeedsDisplayInRect:");
}

void __70__ICQBackupStatusView_updateViewsForBackupState_restoreState_enabled___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(v2);
        }
        double v7 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v8 = [v7 superview];

        if (v8) {
          [v7 setAlpha:0.0];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v4);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = *(id *)(*(void *)(a1 + 40) + 472);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = *(void **)(*((void *)&v16 + 1) + 8 * j);
        uint64_t v15 = objc_msgSend(v14, "superview", (void)v16);

        if (!v15)
        {
          [v14 setAlpha:0.0];
          [*(id *)(a1 + 40) addSubview:v14];
        }
        [v14 setAlpha:1.0];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v11);
  }
}

void __70__ICQBackupStatusView_updateViewsForBackupState_restoreState_enabled___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v1 + 464) == *(_DWORD *)(a1 + 48) && *(unsigned __int8 *)(v1 + 468) == *(unsigned __int8 *)(a1 + 52))
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    id v2 = *(id *)(a1 + 40);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v8;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v2);
          }
          objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "removeFromSuperview", (void)v7);
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v4);
    }
  }
}

- (NSError)backupError
{
  return self->_backupError;
}

- (void)setBackupError:(id)a3
{
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
{
}

- (double)backupProgress
{
  return self->_backupProgress;
}

- (void)setBackupProgress:(double)a3
{
  self->_backupProgress = a3;
}

- (NSArray)syncErrors
{
  return self->_syncErrors;
}

- (void)setSyncErrors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncErrors, 0);
  objc_storeStrong((id *)&self->_durationFormatter, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_backupError, 0);
  objc_storeStrong((id *)&self->_visibleSubviews, 0);
  objc_storeStrong((id *)&self->_lastBackupLabel, 0);
  objc_storeStrong((id *)&self->_backupIssueLabel, 0);
  objc_storeStrong((id *)&self->_timeRemainingLabel, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_progressBar, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
}

- (void)_sizeToFitWidth:inTableView:.cold.1()
{
}

@end