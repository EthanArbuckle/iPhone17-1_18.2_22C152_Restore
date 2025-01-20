@interface OBSetupAssistantFinishedController
- (NSDirectionalEdgeInsets)directionalLayoutMargins;
- (OBBoldTrayButton)boldButton;
- (OBButtonTray)buttonTray;
- (OBSetupAssistantFinishedController)initWithTitle:(id)a3;
- (UILabel)instructionalLabel;
- (UILabel)titleLabel;
- (id)_headerFont;
- (id)_instructionFont;
- (id)boldButtonBlock;
- (id)contentView;
- (void)buttonTapped:(id)a3;
- (void)setBoldButton:(id)a3;
- (void)setBoldButtonBlock:(id)a3;
- (void)setButtonTitle:(id)a3 action:(id)a4;
- (void)setButtonTray:(id)a3;
- (void)setInstructionalLabel:(id)a3;
- (void)setInstructionalText:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation OBSetupAssistantFinishedController

- (OBSetupAssistantFinishedController)initWithTitle:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)OBSetupAssistantFinishedController;
  v5 = [(OBSetupAssistantFinishedController *)&v30 initWithNibName:0 bundle:0];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    [(OBSetupAssistantFinishedController *)v5 setTitleLabel:v6];

    v7 = [(OBSetupAssistantFinishedController *)v5 titleLabel];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

    v8 = [MEMORY[0x1E4FB1618] labelColor];
    v9 = [(OBSetupAssistantFinishedController *)v5 titleLabel];
    [v9 setTextColor:v8];

    v10 = [(OBSetupAssistantFinishedController *)v5 _headerFont];
    v11 = [(OBSetupAssistantFinishedController *)v5 titleLabel];
    [v11 setFont:v10];

    v12 = [(OBSetupAssistantFinishedController *)v5 titleLabel];
    [v12 setText:v4];

    v13 = [(OBSetupAssistantFinishedController *)v5 titleLabel];
    [v13 setTextAlignment:1];

    v14 = [(OBSetupAssistantFinishedController *)v5 titleLabel];
    [v14 setNumberOfLines:0];

    v15 = [OBButtonTray alloc];
    v16 = -[OBButtonTray initWithFrame:](v15, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(OBSetupAssistantFinishedController *)v5 setButtonTray:v16];

    v17 = [(OBSetupAssistantFinishedController *)v5 buttonTray];
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

    v18 = [(OBSetupAssistantFinishedController *)v5 buttonTray];
    [v18 setHidden:1];

    id v19 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    [(OBSetupAssistantFinishedController *)v5 setInstructionalLabel:v19];

    v20 = [(OBSetupAssistantFinishedController *)v5 instructionalLabel];
    [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

    v21 = [MEMORY[0x1E4FB1618] labelColor];
    v22 = [(OBSetupAssistantFinishedController *)v5 instructionalLabel];
    [v22 setTextColor:v21];

    v23 = [(OBSetupAssistantFinishedController *)v5 _instructionFont];
    v24 = [(OBSetupAssistantFinishedController *)v5 instructionalLabel];
    [v24 setFont:v23];

    v25 = [(OBSetupAssistantFinishedController *)v5 instructionalLabel];
    [v25 setText:v4];

    v26 = [(OBSetupAssistantFinishedController *)v5 instructionalLabel];
    [v26 setTextAlignment:1];

    v27 = [(OBSetupAssistantFinishedController *)v5 instructionalLabel];
    [v27 setNumberOfLines:0];

    v28 = [(OBSetupAssistantFinishedController *)v5 instructionalLabel];
    [v28 setHidden:1];
  }
  return v5;
}

- (void)viewDidLoad
{
  v109[13] = *MEMORY[0x1E4F143B8];
  v106.receiver = self;
  v106.super_class = (Class)OBSetupAssistantFinishedController;
  [(OBBaseWelcomeController *)&v106 viewDidLoad];
  v3 = [(OBSetupAssistantFinishedController *)self contentView];

  if (v3) {
    [(OBSetupAssistantFinishedController *)self contentView];
  }
  else {
  id v4 = [(OBSetupAssistantFinishedController *)self titleLabel];
  }
  v5 = [(OBSetupAssistantFinishedController *)self view];
  [v5 addSubview:v4];

  id v6 = [(OBSetupAssistantFinishedController *)self view];
  v7 = [(OBSetupAssistantFinishedController *)self buttonTray];
  [v6 addSubview:v7];

  v8 = [(OBSetupAssistantFinishedController *)self view];
  v9 = [(OBSetupAssistantFinishedController *)self instructionalLabel];
  [v8 addSubview:v9];

  v68 = (void *)MEMORY[0x1E4F28DC8];
  v103 = [(OBSetupAssistantFinishedController *)self view];
  v101 = [v103 layoutMarginsGuide];
  v99 = [v101 leftAnchor];
  v97 = [v4 leftAnchor];
  v95 = [v99 constraintEqualToAnchor:v97];
  v109[0] = v95;
  v93 = [(OBSetupAssistantFinishedController *)self view];
  v91 = [v93 layoutMarginsGuide];
  v90 = [v91 rightAnchor];
  v89 = [v4 rightAnchor];
  v88 = [v90 constraintEqualToAnchor:v89];
  v109[1] = v88;
  v87 = [(OBSetupAssistantFinishedController *)self view];
  v86 = [v87 layoutMarginsGuide];
  v85 = [v86 centerXAnchor];
  v84 = [v4 centerXAnchor];
  v83 = [v85 constraintEqualToAnchor:v84];
  v109[2] = v83;
  v82 = [(OBSetupAssistantFinishedController *)self view];
  v81 = [v82 centerYAnchor];
  v80 = [v4 bottomAnchor];
  v79 = [v81 constraintEqualToAnchor:v80];
  v109[3] = v79;
  v76 = [v4 topAnchor];
  v78 = [(OBSetupAssistantFinishedController *)self view];
  v77 = [v78 layoutMarginsGuide];
  v75 = [v77 topAnchor];
  v74 = [v76 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v75 multiplier:1.0];
  v109[4] = v74;
  v73 = [(OBSetupAssistantFinishedController *)self buttonTray];
  v71 = [v73 bottomAnchor];
  v72 = [(OBSetupAssistantFinishedController *)self view];
  v70 = [v72 bottomAnchor];
  v69 = [v71 constraintEqualToAnchor:v70 constant:0.0];
  v109[5] = v69;
  v67 = [(OBSetupAssistantFinishedController *)self buttonTray];
  v65 = [v67 leadingAnchor];
  v66 = [(OBSetupAssistantFinishedController *)self view];
  v64 = [v66 leadingAnchor];
  v63 = [v65 constraintEqualToAnchor:v64 constant:0.0];
  v109[6] = v63;
  v62 = [(OBSetupAssistantFinishedController *)self buttonTray];
  v60 = [v62 trailingAnchor];
  v61 = [(OBSetupAssistantFinishedController *)self view];
  v59 = [v61 trailingAnchor];
  v58 = [v60 constraintEqualToAnchor:v59 constant:0.0];
  v109[7] = v58;
  v57 = [(OBSetupAssistantFinishedController *)self buttonTray];
  v56 = [v57 buttonLayoutGuide];
  v54 = [v56 bottomAnchor];
  v55 = [(OBSetupAssistantFinishedController *)self view];
  v53 = [v55 layoutMarginsGuide];
  v52 = [v53 bottomAnchor];
  v51 = [v54 constraintEqualToAnchor:v52];
  v109[8] = v51;
  v50 = [(OBSetupAssistantFinishedController *)self view];
  v49 = [v50 layoutMarginsGuide];
  v47 = [v49 leftAnchor];
  v48 = [(OBSetupAssistantFinishedController *)self instructionalLabel];
  v46 = [v48 leftAnchor];
  v45 = [v47 constraintEqualToAnchor:v46];
  v109[9] = v45;
  v44 = [(OBSetupAssistantFinishedController *)self view];
  v43 = [v44 layoutMarginsGuide];
  v41 = [v43 rightAnchor];
  v42 = [(OBSetupAssistantFinishedController *)self instructionalLabel];
  v40 = [v42 rightAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v109[10] = v39;
  v38 = [(OBSetupAssistantFinishedController *)self view];
  v37 = [v38 layoutMarginsGuide];
  v10 = [v37 bottomAnchor];
  v11 = [(OBSetupAssistantFinishedController *)self instructionalLabel];
  v12 = [v11 bottomAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  v109[11] = v13;
  v14 = [(OBSetupAssistantFinishedController *)self instructionalLabel];
  v15 = [v14 topAnchor];
  v105 = v4;
  v16 = [v4 bottomAnchor];
  v17 = [v15 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v16 multiplier:1.0];
  v109[12] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v109 count:13];
  [v68 activateConstraints:v18];

  id v19 = +[OBDevice currentDevice];
  uint64_t v20 = [v19 type];

  v102 = (void *)MEMORY[0x1E4F28DC8];
  v21 = [(OBSetupAssistantFinishedController *)self buttonTray];
  v22 = [v21 buttonLayoutGuide];
  v23 = v22;
  if (v20 == 2)
  {
    v24 = [v22 widthAnchor];
    v25 = [v24 constraintEqualToConstant:360.0];
    v108[0] = v25;
    v26 = [(OBSetupAssistantFinishedController *)self buttonTray];
    v104 = [v26 buttonLayoutGuide];
    v27 = [v104 centerXAnchor];
    v28 = [(OBSetupAssistantFinishedController *)self view];
    v29 = [v28 centerXAnchor];
    v100 = v27;
    objc_super v30 = [v27 constraintEqualToAnchor:v29];
    v108[1] = v30;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v108 count:2];
    [v102 activateConstraints:v31];
  }
  else
  {
    v92 = [v22 leadingAnchor];
    v94 = [(OBSetupAssistantFinishedController *)self view];
    v96 = [v94 layoutMarginsGuide];
    v104 = [v96 leadingAnchor];
    v100 = objc_msgSend(v92, "constraintEqualToAnchor:");
    v107[0] = v100;
    v28 = [(OBSetupAssistantFinishedController *)self buttonTray];
    v29 = [v28 buttonLayoutGuide];
    objc_super v30 = [v29 trailingAnchor];
    v31 = [(OBSetupAssistantFinishedController *)self view];
    [v31 layoutMarginsGuide];
    v32 = v98 = v21;
    [v32 trailingAnchor];
    v34 = v33 = v23;
    v35 = [v30 constraintEqualToAnchor:v34];
    v107[1] = v35;
    v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v107 count:2];
    [v102 activateConstraints:v36];

    v25 = v94;
    v24 = v92;

    v23 = v33;
    v26 = v96;

    v21 = v98;
  }

  [(OBBaseWelcomeController *)self setTemplateType:2];
}

- (NSDirectionalEdgeInsets)directionalLayoutMargins
{
  v6.receiver = self;
  v6.super_class = (Class)OBSetupAssistantFinishedController;
  [(OBBaseWelcomeController *)&v6 directionalLayoutMargins];
  double v5 = 0.0;
  result.trailing = v4;
  result.bottom = v5;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)OBSetupAssistantFinishedController;
  [(OBSetupAssistantFinishedController *)&v8 traitCollectionDidChange:a3];
  double v4 = [(OBSetupAssistantFinishedController *)self _headerFont];
  double v5 = [(OBSetupAssistantFinishedController *)self titleLabel];
  [v5 setFont:v4];

  objc_super v6 = [(OBSetupAssistantFinishedController *)self _instructionFont];
  v7 = [(OBSetupAssistantFinishedController *)self instructionalLabel];
  [v7 setFont:v6];
}

- (void)setButtonTitle:(id)a3 action:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(OBSetupAssistantFinishedController *)self boldButton];
  [v8 removeFromSuperview];

  v9 = [(OBSetupAssistantFinishedController *)self instructionalLabel];
  [v9 removeFromSuperview];

  v10 = [(OBSetupAssistantFinishedController *)self buttonTray];
  [v10 setHidden:0];

  v11 = +[OBBoldTrayButton boldButton];
  [(OBSetupAssistantFinishedController *)self setBoldButton:v11];

  [(OBSetupAssistantFinishedController *)self setBoldButtonBlock:v6];
  v12 = [(OBSetupAssistantFinishedController *)self boldButton];
  [v12 setTitle:v7 forState:0];

  v13 = [(OBSetupAssistantFinishedController *)self boldButton];
  [v13 addTarget:self action:sel_buttonTapped_ forControlEvents:0x2000];

  id v15 = [(OBSetupAssistantFinishedController *)self buttonTray];
  v14 = [(OBSetupAssistantFinishedController *)self boldButton];
  [v15 addButton:v14];
}

- (void)setInstructionalText:(id)a3
{
  id v4 = a3;
  double v5 = [(OBSetupAssistantFinishedController *)self buttonTray];
  [v5 removeFromSuperview];

  id v6 = [(OBSetupAssistantFinishedController *)self instructionalLabel];
  [v6 setHidden:0];

  id v7 = [(OBSetupAssistantFinishedController *)self instructionalLabel];
  [v7 setText:v4];
}

- (id)_headerFont
{
  double v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2928]];
  double v3 = +[OBDevice currentDevice];
  uint64_t v4 = [v3 templateType];

  if (v4 == 5)
  {
    uint64_t v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2988]];

    double v2 = (void *)v5;
  }
  id v6 = (void *)MEMORY[0x1E4FB08E0];
  [v2 pointSize];
  id v7 = objc_msgSend(v6, "boldSystemFontOfSize:");

  return v7;
}

- (id)_instructionFont
{
  double v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  double v3 = (void *)MEMORY[0x1E4FB08E0];
  [v2 pointSize];
  uint64_t v4 = objc_msgSend(v3, "boldSystemFontOfSize:");

  return v4;
}

- (void)buttonTapped:(id)a3
{
  uint64_t v4 = [(OBSetupAssistantFinishedController *)self boldButtonBlock];

  if (v4)
  {
    uint64_t v5 = [(OBSetupAssistantFinishedController *)self boldButtonBlock];
    v5[2]();
  }
}

- (id)contentView
{
  return 0;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (OBButtonTray)buttonTray
{
  return self->_buttonTray;
}

- (void)setButtonTray:(id)a3
{
}

- (OBBoldTrayButton)boldButton
{
  return self->_boldButton;
}

- (void)setBoldButton:(id)a3
{
}

- (id)boldButtonBlock
{
  return self->_boldButtonBlock;
}

- (void)setBoldButtonBlock:(id)a3
{
}

- (UILabel)instructionalLabel
{
  return self->_instructionalLabel;
}

- (void)setInstructionalLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructionalLabel, 0);
  objc_storeStrong(&self->_boldButtonBlock, 0);
  objc_storeStrong((id *)&self->_boldButton, 0);
  objc_storeStrong((id *)&self->_buttonTray, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end