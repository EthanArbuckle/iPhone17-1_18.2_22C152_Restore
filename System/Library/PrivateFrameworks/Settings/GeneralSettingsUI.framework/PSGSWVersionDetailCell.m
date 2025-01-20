@interface PSGSWVersionDetailCell
- (PSGSWVersionDetailCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (double)computeHeightForWidth:(double)a3 forAccessibilitySupportedWebContainer:(id)a4;
- (double)preferredHeightWithTable:(id)a3;
- (id)deviceNameString;
- (id)preparingRollbackString;
- (id)releaseNotesSummary;
- (id)releaseNotesSummaryString;
- (id)releaseNotesSummaryView;
- (id)revokedSplatView;
- (id)systemVersionValueForKey:(id)a3;
- (id)titleLabelString;
- (id)titleLabelView;
- (void)configureContentView;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PSGSWVersionDetailCell

- (PSGSWVersionDetailCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v25.receiver = self;
  v25.super_class = (Class)PSGSWVersionDetailCell;
  v9 = [(PSTableCell *)&v25 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  v10 = v9;
  if (v9)
  {
    p_osUpdateType = &v9->_osUpdateType;
    v9->_osUpdateType = 0;
    documentationData = v9->_documentationData;
    v9->_documentationData = 0;

    v13 = [v8 propertyForKey:@"OSUpdateType"];
    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        int *p_osUpdateType = [v13 integerValue];
      }
    }
    uint64_t v14 = [v8 propertyForKey:@"SUManagerClient"];
    suClient = v10->_suClient;
    v10->_suClient = (SUManagerClient *)v14;

    if (!v10->_suClient || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      uint64_t v16 = [objc_alloc(MEMORY[0x263F78200]) initWithDelegate:0];
      v17 = v10->_suClient;
      v10->_suClient = (SUManagerClient *)v16;
    }
    uint64_t v18 = [v8 propertyForKey:@"SUDocumentationData"];
    v19 = v10->_documentationData;
    v10->_documentationData = (SUDocumentationData *)v18;

    if (!v10->_documentationData)
    {
      v20 = _PSGLoggingFacility();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[PSGSWVersionDetailCell initWithStyle:reuseIdentifier:specifier:]((uint64_t)&v10->_osUpdateType, v20);
      }
    }
    uint64_t v21 = [(PSGSWVersionDetailCell *)v10 systemVersionValueForKey:@"ProductBuildVersion"];
    buildVersion = v10->_buildVersion;
    v10->_buildVersion = (NSString *)v21;

    if (!v10->_buildVersion)
    {
      v23 = _PSGLoggingFacility();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[PSGSWVersionDetailCell initWithStyle:reuseIdentifier:specifier:](v23);
      }
    }
    [(PSGSWVersionDetailCell *)v10 setupMargins];
    [(PSGSWVersionDetailCell *)v10 configureContentView];
  }
  return v10;
}

- (void)configureContentView
{
  v54[3] = *MEMORY[0x263EF8340];
  v3 = [(PSGSWVersionDetailCell *)self titleLabelView];
  titleLabelView = self->_titleLabelView;
  self->_titleLabelView = v3;

  if (self->_titleLabelView)
  {
    v5 = [(PSGSWVersionDetailCell *)self contentView];
    [v5 addSubview:self->_titleLabelView];

    v6 = self->_titleLabelView;
  }
  else
  {
    v6 = 0;
  }
  v38 = (void *)MEMORY[0x263F08938];
  v46 = [(UILabel *)v6 topAnchor];
  v48 = [(PSGSWVersionDetailCell *)self contentView];
  v44 = [v48 layoutMarginsGuide];
  v42 = [v44 topAnchor];
  v40 = [v46 constraintEqualToAnchor:v42];
  v54[0] = v40;
  v37 = [(UILabel *)self->_titleLabelView leadingAnchor];
  v39 = [(PSGSWVersionDetailCell *)self contentView];
  v7 = [v39 layoutMarginsGuide];
  id v8 = [v7 leadingAnchor];
  v9 = [v37 constraintEqualToAnchor:v8];
  v54[1] = v9;
  v10 = [(UILabel *)self->_titleLabelView trailingAnchor];
  v11 = [(PSGSWVersionDetailCell *)self contentView];
  v12 = [v11 layoutMarginsGuide];
  v13 = [v12 trailingAnchor];
  uint64_t v14 = [v10 constraintEqualToAnchor:v13];
  v54[2] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:3];
  [v38 activateConstraints:v15];

  uint64_t v16 = [(PSGSWVersionDetailCell *)self releaseNotesSummaryView];
  releaseNotesSummaryView = self->_releaseNotesSummaryView;
  self->_releaseNotesSummaryView = v16;

  if (self->_releaseNotesSummaryView)
  {
    uint64_t v18 = [(PSGSWVersionDetailCell *)self contentView];
    [v18 addSubview:self->_releaseNotesSummaryView];
  }
  if (self->_osUpdateType == 1
    && [(SUManagerClient *)self->_suClient isSplatOnlyUpdateRollbackSuggested])
  {
    v19 = [(PSGSWVersionDetailCell *)self revokedSplatView];
    revokedSplatView = self->_revokedSplatView;
    self->_revokedSplatView = v19;

    uint64_t v21 = (void *)MEMORY[0x263F08938];
    v22 = [(PSWebContainerView *)self->_releaseNotesSummaryView bottomAnchor];
    v23 = [(UIView *)self->_revokedSplatView topAnchor];
    v24 = [v22 constraintEqualToAnchor:v23 constant:-5.0];
    v53 = v24;
    objc_super v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v53 count:1];
    [v21 activateConstraints:v25];
  }
  else
  {
    v26 = (void *)MEMORY[0x263F08938];
    v22 = [(PSWebContainerView *)self->_releaseNotesSummaryView bottomAnchor];
    v23 = [(PSGSWVersionDetailCell *)self contentView];
    v24 = [v23 bottomAnchor];
    objc_super v25 = [v22 constraintEqualToAnchor:v24 constant:-5.0];
    v52 = v25;
    v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v52 count:1];
    [v26 activateConstraints:v27];
  }
  v41 = (void *)MEMORY[0x263F08938];
  v49 = [(PSWebContainerView *)self->_releaseNotesSummaryView topAnchor];
  v50 = [(UILabel *)self->_titleLabelView bottomAnchor];
  v47 = [v49 constraintEqualToAnchor:v50 constant:5.0];
  v51[0] = v47;
  v43 = [(PSWebContainerView *)self->_releaseNotesSummaryView leadingAnchor];
  v45 = [(PSGSWVersionDetailCell *)self contentView];
  v28 = [v45 layoutMarginsGuide];
  v29 = [v28 leadingAnchor];
  v30 = [v43 constraintEqualToAnchor:v29];
  v51[1] = v30;
  v31 = [(PSWebContainerView *)self->_releaseNotesSummaryView trailingAnchor];
  v32 = [(PSGSWVersionDetailCell *)self contentView];
  v33 = [v32 layoutMarginsGuide];
  v34 = [v33 trailingAnchor];
  v35 = [v31 constraintEqualToAnchor:v34];
  v51[2] = v35;
  v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:3];
  [v41 activateConstraints:v36];

  [(PSGSWVersionDetailCell *)self updateConstraints];
  [(PSGSWVersionDetailCell *)self setNeedsDisplay];
}

- (id)revokedSplatView
{
  v53[4] = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  v3 = PSG_LocalizedStringForGeneral(@"REVOKE_SPLAT_INFO");
  [v2 setText:v3];

  v4 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
  [v2 setFont:v4];

  v5 = [MEMORY[0x263F82DA0] currentTraitCollection];
  if ([v5 userInterfaceStyle] == 2) {
    [MEMORY[0x263F825C8] colorWithRed:0.62 green:0.6 blue:0.58 alpha:1.0];
  }
  else {
  v6 = [MEMORY[0x263F825C8] systemBlackColor];
  }
  [v2 setTextColor:v6];

  [v2 setTextAlignment:4];
  [v2 setNumberOfLines:0];
  v7 = objc_opt_new();
  id v8 = [MEMORY[0x263F82DA0] currentTraitCollection];
  if ([v8 userInterfaceStyle] == 2)
  {
    double v9 = 0.24;
    double v10 = 0.22;
    double v11 = 0.11;
  }
  else
  {
    double v10 = 0.97;
    double v11 = 0.84;
    double v9 = 1.0;
  }
  v12 = [MEMORY[0x263F825C8] colorWithRed:v9 green:v10 blue:v11 alpha:1.0];
  [v7 setBackgroundColor:v12];

  v13 = [v7 layer];
  [v13 setCornerRadius:5.0];

  uint64_t v14 = [v7 layer];
  [v14 setMasksToBounds:1];

  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 addSubview:v2];
  v40 = (void *)MEMORY[0x263F08938];
  v48 = [v2 topAnchor];
  v46 = [v7 topAnchor];
  v44 = [v48 constraintEqualToAnchor:v46 constant:10.0];
  v53[0] = v44;
  v42 = [v2 leadingAnchor];
  v15 = [v7 leadingAnchor];
  uint64_t v16 = [v42 constraintEqualToAnchor:v15 constant:10.0];
  v53[1] = v16;
  v17 = [v2 trailingAnchor];
  uint64_t v18 = [v7 trailingAnchor];
  v19 = [v17 constraintEqualToAnchor:v18 constant:-10.0];
  v53[2] = v19;
  [v2 bottomAnchor];
  v20 = v50 = v2;
  uint64_t v21 = [v7 bottomAnchor];
  v22 = [v20 constraintEqualToAnchor:v21 constant:-10.0];
  v53[3] = v22;
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:4];
  [v40 activateConstraints:v23];

  v24 = [(PSGSWVersionDetailCell *)self contentView];
  [v24 addSubview:v7];

  v37 = (void *)MEMORY[0x263F08938];
  v49 = [v7 topAnchor];
  v47 = [(PSWebContainerView *)self->_releaseNotesSummaryView bottomAnchor];
  v45 = [v49 constraintEqualToAnchor:v47 constant:30.0];
  v52[0] = v45;
  v41 = [v7 leadingAnchor];
  v43 = [(PSGSWVersionDetailCell *)self contentView];
  v39 = [v43 layoutMarginsGuide];
  v38 = [v39 leadingAnchor];
  v36 = [v41 constraintEqualToAnchor:v38 constant:10.0];
  v52[1] = v36;
  v35 = [v7 trailingAnchor];
  objc_super v25 = [(PSGSWVersionDetailCell *)self contentView];
  v26 = [v25 layoutMarginsGuide];
  v27 = [v26 trailingAnchor];
  v28 = [v35 constraintEqualToAnchor:v27 constant:-5.0];
  v52[2] = v28;
  v29 = [v7 bottomAnchor];
  v30 = [(PSGSWVersionDetailCell *)self contentView];
  v31 = [v30 bottomAnchor];
  v32 = [v29 constraintEqualToAnchor:v31 constant:-15.0];
  v52[3] = v32;
  v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:4];
  [v37 activateConstraints:v33];

  return v7;
}

- (id)titleLabelView
{
  v3 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F835D0] maximumContentSizeCategory:*MEMORY[0x263F83418]];
  v4 = [v3 fontDescriptor];
  v5 = [v4 fontDescriptorWithSymbolicTraits:2];

  v6 = objc_opt_new();
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  v7 = [(PSGSWVersionDetailCell *)self titleLabelString];
  [v6 setText:v7];

  id v8 = [MEMORY[0x263F81708] fontWithDescriptor:v5 size:0.0];
  [v6 setFont:v8];

  double v9 = [MEMORY[0x263F825C8] labelColor];
  [v6 setTextColor:v9];

  [v6 setTextAlignment:4];
  [v6 setNumberOfLines:0];

  return v6;
}

- (id)titleLabelString
{
  v3 = [(PSGSWVersionDetailCell *)self systemVersionValueForKey:*MEMORY[0x263EFFAC8]];
  v4 = NSString;
  v5 = [MEMORY[0x263F82670] currentDevice];
  v6 = [v5 systemName];
  v7 = [(PSGSWVersionDetailCell *)self systemVersionValueForKey:@"ProductBuildVersion"];
  id v8 = [v4 stringWithFormat:@"%@ %@ (%@)", v6, v3, v7];

  return v8;
}

- (id)releaseNotesSummaryView
{
  id v3 = objc_alloc_init(MEMORY[0x263F5FD20]);
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 setAutoresizesSubviews:0];
  v4 = [(PSGSWVersionDetailCell *)self releaseNotesSummary];
  [v3 setContent:v4];

  return v3;
}

- (id)releaseNotesSummary
{
  v2 = [(PSGSWVersionDetailCell *)self releaseNotesSummaryString];
  id v3 = [v2 stringByAppendingString:@"<style type=\"text/css\">body { margin: 0px padding: 0px; }</style>"];;

  v4 = [v3 dataUsingEncoding:4];

  return v4;
}

- (id)deviceNameString
{
  v2 = (void *)MGGetStringAnswer();
  return v2;
}

- (id)releaseNotesSummaryString
{
  id v3 = [(SUDocumentationData *)self->_documentationData readmeSummary];
  v4 = v3;
  if (v3 && [v3 length])
  {
    v5 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
  }
  else
  {
    v6 = NSString;
    if (self->_osUpdateType == 1) {
      v7 = @"SW_DETAIL_SECURITY";
    }
    else {
      v7 = @"SW_DETAIL_OS";
    }
    id v8 = PSG_LocalizedStringForGeneral(v7);
    double v9 = [(PSGSWVersionDetailCell *)self deviceNameString];
    double v10 = objc_msgSend(v6, "stringWithFormat:", v8, v9);

    double v11 = [MEMORY[0x263F82438] sharedApplication];
    uint64_t v12 = [v11 userInterfaceLayoutDirection];
    v13 = @"ltr";
    if (v12 == 1) {
      v13 = @"rtl";
    }
    uint64_t v14 = v13;

    objc_msgSend(NSString, "stringWithFormat:", @"<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\"><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"><meta http-equiv=\"Content-Style-Type\" content=\"text/css\"><meta name=\"supported-color-schemes\" content=\"light dark\"><title></title><style type=\"text/css\">p.plain { margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px; -webkit-text-size-adjust: 100%; font-family: -apple-system, HelveticaNeue, LucidaGrande; color: -apple-system-secondary-label; }</style><body dir=\"%@\"><p class=\"plain\">{CONTENT}</p></body></html>",
    v15 = v14);

    v5 = [v15 stringByReplacingOccurrencesOfString:@"{CONTENT}" withString:v10];
  }
  return v5;
}

- (id)preparingRollbackString
{
  if (self->_osUpdateType == 1)
  {
    v2 = PSG_LocalizedStringForGeneral(@"PREPARING_REMOVAL");
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)systemVersionValueForKey:(id)a3
{
  int osUpdateType = self->_osUpdateType;
  id v4 = a3;
  if (osUpdateType == 1) {
    v5 = (void *)_CFCopySupplementalVersionDictionary();
  }
  else {
    v5 = (void *)_CFCopySystemVersionDictionary();
  }
  v6 = v5;
  v7 = [v5 objectForKey:v4];

  return v7;
}

- (double)preferredHeightWithTable:(id)a3
{
  [(PSGSWVersionDetailCell *)self bounds];
  double v5 = v4;
  v6 = [MEMORY[0x263F82B60] mainScreen];
  [v6 bounds];
  double v8 = v7;

  double v9 = [(PSWebContainerView *)self->_releaseNotesSummaryView webView];
  double v10 = [v9 scrollView];
  [v10 contentOffset];
  double v12 = v11;
  double v14 = v13;

  [(PSGSWVersionDetailCell *)self computeHeightForWidth:self->_releaseNotesSummaryView forAccessibilitySupportedWebContainer:v5];
  double v16 = v15;
  v17 = [(PSWebContainerView *)self->_releaseNotesSummaryView webView];
  uint64_t v18 = [v17 scrollView];
  objc_msgSend(v18, "setContentOffset:", v12, v14);

  double v19 = v8 * 0.330000013;
  v20 = [(PSWebContainerView *)self->_releaseNotesSummaryView webView];
  uint64_t v21 = [v20 scrollView];
  v22 = v21;
  if (v16 <= v19)
  {
    [v21 setScrollEnabled:0];

    v23 = [(PSWebContainerView *)self->_releaseNotesSummaryView webView];
    v24 = [v23 scrollView];
    [v24 setBounces:0];
    double v19 = v16;
  }
  else
  {
    [v21 setScrollEnabled:1];

    v23 = [(PSWebContainerView *)self->_releaseNotesSummaryView webView];
    v24 = [v23 scrollView];
    [v24 setBounces:1];
  }

  revokedSplatView = self->_revokedSplatView;
  if (revokedSplatView)
  {
    v26 = [(UIView *)revokedSplatView subviews];
    v27 = [v26 objectAtIndex:0];

    [v27 intrinsicContentSize];
    double v29 = v28 + 45.0;
  }
  else
  {
    double v29 = 0.0;
  }
  v30 = [(PSGSWVersionDetailCell *)self contentView];
  [v30 layoutMargins];
  double v32 = v31;
  [(UILabel *)self->_titleLabelView frame];
  double v34 = v29 + v19 + v32 + v33;
  v35 = [(PSGSWVersionDetailCell *)self contentView];
  [v35 layoutMargins];
  double v37 = v36 + v34;

  return v37;
}

- (void)traitCollectionDidChange:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)PSGSWVersionDetailCell;
  [(PSGSWVersionDetailCell *)&v15 traitCollectionDidChange:a3];
  double v4 = [MEMORY[0x263F82DA0] currentTraitCollection];
  if ([v4 userInterfaceStyle] == 2)
  {
    double v5 = 0.24;
    double v6 = 0.22;
    double v7 = 0.11;
  }
  else
  {
    double v6 = 0.97;
    double v7 = 0.84;
    double v5 = 1.0;
  }
  double v8 = [MEMORY[0x263F825C8] colorWithRed:v5 green:v6 blue:v7 alpha:1.0];
  [(UIView *)self->_revokedSplatView setBackgroundColor:v8];

  double v9 = [(UIView *)self->_revokedSplatView subviews];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    double v11 = [(UIView *)self->_revokedSplatView subviews];
    double v12 = [v11 objectAtIndex:0];

    if (v12)
    {
      double v13 = [MEMORY[0x263F82DA0] currentTraitCollection];
      if ([v13 userInterfaceStyle] == 2) {
        [MEMORY[0x263F825C8] colorWithRed:0.62 green:0.6 blue:0.58 alpha:1.0];
      }
      else {
      double v14 = [MEMORY[0x263F825C8] systemBlackColor];
      }
      [v12 setTextColor:v14];
    }
  }
}

- (double)computeHeightForWidth:(double)a3 forAccessibilitySupportedWebContainer:(id)a4
{
  id v5 = a4;
  double v6 = [v5 webView];
  double v7 = [v6 stringByEvaluatingJavaScriptFromString:@"function get_height(){var e=documentreturn Math.max(e.body.scrollHeight,e.documentElement.scrollHeight,e.body.offsetHeight,e.documentElement.offsetHeight,e.body.clientHeight,e.documentElement.clientHeight)}; get_height();"];;

  if (!v7
    || [v7 isEqualToString:&stru_26F0FADC0]
    || ([v7 floatValue], v8 <= 0.0))
  {
    [v5 heightForWidth:a3];
    double v9 = v10;
  }
  else
  {
    double v9 = v8;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suClient, 0);
  objc_storeStrong((id *)&self->_revokedSplatView, 0);
  objc_storeStrong((id *)&self->_releaseNotesSummaryView, 0);
  objc_storeStrong((id *)&self->_titleLabelView, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_documentationData, 0);
}

- (void)initWithStyle:(os_log_t)log reuseIdentifier:specifier:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23D28D000, log, OS_LOG_TYPE_ERROR, "Failed to get buildVersion string from system version plist", v1, 2u);
}

- (void)initWithStyle:(uint64_t)a1 reuseIdentifier:(NSObject *)a2 specifier:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = SUStringFromOSUpdateType();
  int v4 = 138412546;
  id v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = 0;
  _os_log_error_impl(&dword_23D28D000, a2, OS_LOG_TYPE_ERROR, "Failed to get documentation data for %@ update: %@", (uint8_t *)&v4, 0x16u);
}

@end