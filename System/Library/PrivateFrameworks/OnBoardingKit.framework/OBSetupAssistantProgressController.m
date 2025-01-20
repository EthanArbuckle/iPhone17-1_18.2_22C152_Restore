@interface OBSetupAssistantProgressController
- (NSLayoutConstraint)progressLabelTopAnchorConstraint;
- (OBSetupAssistantProgressController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5;
- (OBSetupAssistantProgressController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5;
- (UILabel)progressLabel;
- (UIProgressView)progressBar;
- (double)_progressLabelTopAnchorConstraintConstantWithFont:(id)a3;
- (id)_progressFont;
- (void)setProgress:(double)a3;
- (void)setProgressBar:(id)a3;
- (void)setProgressLabel:(id)a3;
- (void)setProgressLabelTopAnchorConstraint:(id)a3;
- (void)setProgressText:(id)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation OBSetupAssistantProgressController

- (OBSetupAssistantProgressController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)OBSetupAssistantProgressController;
  return [(OBWelcomeController *)&v6 initWithTitle:a3 detailText:a4 icon:a5 contentLayout:2];
}

- (OBSetupAssistantProgressController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)OBSetupAssistantProgressController;
  return [(OBWelcomeController *)&v6 initWithTitle:a3 detailText:a4 symbolName:a5 contentLayout:2];
}

- (void)viewDidLoad
{
  v83[8] = *MEMORY[0x1E4F143B8];
  v82.receiver = self;
  v82.super_class = (Class)OBSetupAssistantProgressController;
  [(OBBaseWelcomeController *)&v82 viewDidLoad];
  [(OBWelcomeController *)self setTemplateType:2];
  uint64_t v3 = [(OBSetupAssistantProgressController *)self _progressFont];
  id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
  v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(OBSetupAssistantProgressController *)self setProgressLabel:v5];

  objc_super v6 = [(OBSetupAssistantProgressController *)self progressLabel];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  v7 = [(OBSetupAssistantProgressController *)self progressLabel];
  [v7 setTextAlignment:1];

  v8 = [MEMORY[0x1E4FB1618] labelColor];
  v9 = [(OBSetupAssistantProgressController *)self progressLabel];
  [v9 setTextColor:v8];

  v10 = [(OBSetupAssistantProgressController *)self progressLabel];
  [v10 setFont:v3];

  v11 = [(OBSetupAssistantProgressController *)self progressLabel];
  [v11 setNumberOfLines:0];

  v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1B48]) initWithProgressViewStyle:0];
  [(OBSetupAssistantProgressController *)self setProgressBar:v12];

  v13 = [MEMORY[0x1E4FB1618] systemBlueColor];
  v14 = [(OBSetupAssistantProgressController *)self progressBar];
  [v14 setProgressTintColor:v13];

  v15 = [(OBSetupAssistantProgressController *)self progressBar];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  v16 = [(OBWelcomeController *)self contentView];
  v17 = [(OBSetupAssistantProgressController *)self progressLabel];
  [v16 addSubview:v17];

  v18 = [(OBWelcomeController *)self contentView];
  v19 = [(OBSetupAssistantProgressController *)self progressBar];
  [v18 addSubview:v19];

  v20 = [(OBSetupAssistantProgressController *)self progressLabel];
  v21 = [v20 topAnchor];
  v22 = [(OBWelcomeController *)self scrollView];
  v23 = [v22 centerYAnchor];
  v81 = (void *)v3;
  [(OBSetupAssistantProgressController *)self _progressLabelTopAnchorConstraintConstantWithFont:v3];
  v24 = objc_msgSend(v21, "constraintGreaterThanOrEqualToAnchor:constant:", v23);
  [(OBSetupAssistantProgressController *)self setProgressLabelTopAnchorConstraint:v24];

  v65 = (void *)MEMORY[0x1E4F28DC8];
  v80 = [(OBSetupAssistantProgressController *)self progressBar];
  v78 = [v80 topAnchor];
  v79 = [(OBWelcomeController *)self contentView];
  v77 = [v79 topAnchor];
  v76 = [v78 constraintGreaterThanOrEqualToAnchor:v77];
  v83[0] = v76;
  v75 = [(OBSetupAssistantProgressController *)self progressBar];
  v73 = [v75 centerXAnchor];
  v74 = [(OBWelcomeController *)self contentView];
  v72 = [v74 centerXAnchor];
  v71 = [v73 constraintEqualToAnchor:v72];
  v83[1] = v71;
  v70 = [(OBSetupAssistantProgressController *)self progressBar];
  v68 = [v70 heightAnchor];
  v69 = [(OBSetupAssistantProgressController *)self progressBar];
  [v69 intrinsicContentSize];
  v67 = [v68 constraintEqualToConstant:v25];
  v83[2] = v67;
  v66 = [(OBSetupAssistantProgressController *)self progressBar];
  v63 = [v66 bottomAnchor];
  v64 = [(OBSetupAssistantProgressController *)self progressLabel];
  v62 = [v64 topAnchor];
  v61 = [v63 constraintEqualToAnchor:v62 constant:-14.0];
  v83[3] = v61;
  v60 = [(OBSetupAssistantProgressController *)self progressLabel];
  v58 = [v60 leftAnchor];
  v59 = [(OBWelcomeController *)self contentView];
  v57 = [v59 safeAreaLayoutGuide];
  v56 = [v57 leftAnchor];
  v55 = [v58 constraintEqualToAnchor:v56];
  v83[4] = v55;
  v54 = [(OBSetupAssistantProgressController *)self progressLabel];
  v52 = [v54 rightAnchor];
  v53 = [(OBWelcomeController *)self contentView];
  v51 = [v53 safeAreaLayoutGuide];
  v26 = [v51 rightAnchor];
  v27 = [v52 constraintEqualToAnchor:v26];
  v83[5] = v27;
  v28 = [(OBSetupAssistantProgressController *)self progressLabelTopAnchorConstraint];
  v83[6] = v28;
  v29 = [(OBSetupAssistantProgressController *)self progressLabel];
  v30 = [v29 bottomAnchor];
  v31 = [(OBWelcomeController *)self contentView];
  v32 = [v31 bottomAnchor];
  v33 = [v30 constraintEqualToAnchor:v32];
  v83[7] = v33;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:8];
  [v65 activateConstraints:v34];

  v35 = [(OBSetupAssistantProgressController *)self progressLabel];
  LODWORD(v36) = 1148846080;
  [v35 setContentHuggingPriority:1 forAxis:v36];

  v37 = +[OBDevice currentDevice];
  uint64_t v38 = [v37 type];

  v39 = [(OBSetupAssistantProgressController *)self progressBar];
  v40 = v39;
  if (v38 == 2)
  {
    v41 = [v39 widthAnchor];
    v42 = [v41 constraintEqualToConstant:448.0];
    [v42 setActive:1];
  }
  else
  {
    v43 = [v39 leftAnchor];
    v44 = [(OBWelcomeController *)self contentView];
    v45 = [v44 safeAreaLayoutGuide];
    v46 = [v45 leftAnchor];
    v47 = [v43 constraintEqualToAnchor:v46];
    [v47 setActive:1];

    v40 = [(OBSetupAssistantProgressController *)self progressBar];
    v41 = [v40 rightAnchor];
    v42 = [(OBWelcomeController *)self contentView];
    v48 = [v42 safeAreaLayoutGuide];
    v49 = [v48 rightAnchor];
    v50 = [v41 constraintEqualToAnchor:v49];
    [v50 setActive:1];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)OBSetupAssistantProgressController;
  [(OBWelcomeController *)&v9 traitCollectionDidChange:a3];
  id v4 = [(OBSetupAssistantProgressController *)self _progressFont];
  v5 = [(OBSetupAssistantProgressController *)self progressLabel];
  [v5 setFont:v4];

  [(OBSetupAssistantProgressController *)self _progressLabelTopAnchorConstraintConstantWithFont:v4];
  double v7 = v6;
  v8 = [(OBSetupAssistantProgressController *)self progressLabelTopAnchorConstraint];
  [v8 setConstant:v7];
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(OBWelcomeController *)self headerView];
  [v5 setTitle:v4];
}

- (void)setProgressText:(id)a3
{
  id v4 = a3;
  id v5 = [(OBSetupAssistantProgressController *)self progressLabel];
  [v5 setText:v4];
}

- (void)setProgress:(double)a3
{
  float v3 = a3;
  id v5 = [(OBSetupAssistantProgressController *)self progressBar];
  *(float *)&double v4 = v3;
  [v5 setProgress:v4];
}

- (id)_progressFont
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
}

- (double)_progressLabelTopAnchorConstraintConstantWithFont:(id)a3
{
  id v3 = a3;
  [v3 ascender];
  double v5 = v4;
  [v3 descender];
  double v7 = v6;

  return -(v5 - v7);
}

- (UIProgressView)progressBar
{
  return self->_progressBar;
}

- (void)setProgressBar:(id)a3
{
}

- (UILabel)progressLabel
{
  return self->_progressLabel;
}

- (void)setProgressLabel:(id)a3
{
}

- (NSLayoutConstraint)progressLabelTopAnchorConstraint
{
  return self->_progressLabelTopAnchorConstraint;
}

- (void)setProgressLabelTopAnchorConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressLabelTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_progressLabel, 0);
  objc_storeStrong((id *)&self->_progressBar, 0);
}

@end