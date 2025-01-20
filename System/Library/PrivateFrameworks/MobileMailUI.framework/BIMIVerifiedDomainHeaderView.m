@interface BIMIVerifiedDomainHeaderView
- (BIMIVerifiedDomainHeaderView)initWithFrame:(CGRect)a3 domain:(id)a4 mailProviderDisplayName:(id)a5;
- (NSString)domain;
- (NSString)mailProviderDisplayName;
- (void)_setupSubViews;
- (void)learnMoreButtonPressed:(id)a3;
- (void)setDomain:(id)a3;
- (void)setMailProviderDisplayName:(id)a3;
@end

@implementation BIMIVerifiedDomainHeaderView

- (BIMIVerifiedDomainHeaderView)initWithFrame:(CGRect)a3 domain:(id)a4 mailProviderDisplayName:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BIMIVerifiedDomainHeaderView;
  v14 = -[BIMIVerifiedDomainHeaderView initWithFrame:](&v17, sel_initWithFrame_, x, y, width, height);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_domain, a4);
    objc_storeStrong((id *)&v15->_mailProviderDisplayName, a5);
    [(BIMIVerifiedDomainHeaderView *)v15 setAxis:1];
    [(BIMIVerifiedDomainHeaderView *)v15 setAlignment:1];
    [(BIMIVerifiedDomainHeaderView *)v15 setDistribution:0];
    [(BIMIVerifiedDomainHeaderView *)v15 setSpacing:1.17549435e-38];
    [(BIMIVerifiedDomainHeaderView *)v15 setLayoutMarginsRelativeArrangement:1];
    -[BIMIVerifiedDomainHeaderView setDirectionalLayoutMargins:](v15, "setDirectionalLayoutMargins:", 16.0, 0.0, 16.0, 0.0);
    [(BIMIVerifiedDomainHeaderView *)v15 _setupSubViews];
  }

  return v15;
}

- (void)_setupSubViews
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1930]);
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  id v21 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  v8 = _EFLocalizedString();
  [v21 setText:v8];

  v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
  [v21 setFont:v9];

  [(BIMIVerifiedDomainHeaderView *)self addArrangedSubview:v21];
  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v4, v5, v6, v7);
  v11 = [(BIMIVerifiedDomainHeaderView *)self mailProviderDisplayName];

  id v12 = NSString;
  _EFLocalizedString();
  if (v11) {
    id v13 = {;
  }
    v14 = [(BIMIVerifiedDomainHeaderView *)self mailProviderDisplayName];
    v15 = [(BIMIVerifiedDomainHeaderView *)self domain];
    v16 = objc_msgSend(v12, "stringWithFormat:", v13, v14, v15);
    [v10 setText:v16];
  }
  else {
    id v13 = {;
  }
    v14 = [(BIMIVerifiedDomainHeaderView *)self domain];
    v15 = objc_msgSend(v12, "stringWithFormat:", v13, v14);
    [v10 setText:v15];
  }

  objc_super v17 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  [v10 setFont:v17];

  v18 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v10 setTextColor:v18];

  [v10 setNumberOfLines:0];
  [v10 setLineBreakMode:0];
  [(BIMIVerifiedDomainHeaderView *)self addArrangedSubview:v10];
  v19 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  v20 = _EFLocalizedString();
  [v19 setTitle:v20 forState:0];

  [v19 addTarget:self action:sel_learnMoreButtonPressed_ forControlEvents:0x2000];
  [(BIMIVerifiedDomainHeaderView *)self addArrangedSubview:v19];
}

- (void)learnMoreButtonPressed:(id)a3
{
  objc_msgSend(MEMORY[0x1E4FB1438], "sharedApplication", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = (void *)MEMORY[0x1E4F1CB10];
  double v4 = [MEMORY[0x1E4F28B50] mainBundle];
  double v5 = [v4 localizedStringForKey:@"BIMI_KB_LINK" value:&stru_1F39E2A88 table:@"Main"];
  double v6 = [v3 URLWithString:v5];
  [v7 openURL:v6 options:MEMORY[0x1E4F1CC08] completionHandler:0];
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (NSString)mailProviderDisplayName
{
  return self->_mailProviderDisplayName;
}

- (void)setMailProviderDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailProviderDisplayName, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end