@interface PXSurveyRadarReporterViewController
- (OBTrayButton)notNowButton;
- (PXSurveyRadarReporterViewController)initWithConfiguration:(id)a3 completionHandler:(id)a4;
- (PXSurveyRadarReporterViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5;
- (PXSurveyRadarReporterViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (UIButton)readReleaseAgreementButton;
- (UILabel)detailLabel;
- (id)attributedDetailText;
- (void)_didSelectReadReleaseAgreementButton;
- (void)_handleAgreeButton:(id)a3;
- (void)_handleNotNowButton:(id)a3;
- (void)setDetailLabel:(id)a3;
- (void)setNotNowButton:(id)a3;
- (void)setReadReleaseAgreementButton:(id)a3;
@end

@implementation PXSurveyRadarReporterViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readReleaseAgreementButton, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_notNowButton, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)setReadReleaseAgreementButton:(id)a3
{
}

- (UIButton)readReleaseAgreementButton
{
  return self->_readReleaseAgreementButton;
}

- (void)setDetailLabel:(id)a3
{
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (void)setNotNowButton:(id)a3
{
}

- (OBTrayButton)notNowButton
{
  return self->_notNowButton;
}

- (void)_handleNotNowButton:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__PXSurveyRadarReporterViewController__handleNotNowButton___block_invoke;
  v3[3] = &unk_1E5DD36F8;
  v3[4] = self;
  [(PXSurveyRadarReporterViewController *)self dismissViewControllerAnimated:1 completion:v3];
}

uint64_t __59__PXSurveyRadarReporterViewController__handleNotNowButton___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 1192);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_handleAgreeButton:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__PXSurveyRadarReporterViewController__handleAgreeButton___block_invoke;
  v3[3] = &unk_1E5DD36F8;
  v3[4] = self;
  [(PXSurveyRadarReporterViewController *)self dismissViewControllerAnimated:1 completion:v3];
}

uint64_t __58__PXSurveyRadarReporterViewController__handleAgreeButton___block_invoke(uint64_t a1)
{
  PXFileRadarWithConfiguration(*(void **)(*(void *)(a1 + 32) + 1184));
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 1192);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_didSelectReadReleaseAgreementButton
{
  v3 = (void *)MEMORY[0x1E4FB1418];
  v4 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeSubmissionPhotosReleaseAgreement", @"PhotosUICore");
  v5 = [(PXRadarConfiguration *)self->_configuration description];
  id v9 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:0];

  v6 = (void *)MEMORY[0x1E4FB1410];
  v7 = PXLocalizedStringFromTable(@"PXOK", @"PhotosUICore");
  v8 = [v6 actionWithTitle:v7 style:1 handler:0];
  [v9 addAction:v8];

  [(PXSurveyRadarReporterViewController *)self presentViewController:v9 animated:1 completion:0];
}

- (id)attributedDetailText
{
  v31[1] = *MEMORY[0x1E4F143B8];
  v2 = NSString;
  v3 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeSubmissionDescriptionLine1", @"PhotosUICore");
  v29 = [v2 stringWithFormat:@"%@\n\n", v3];

  v4 = NSString;
  v5 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeSubmissionDescriptionLine2", @"PhotosUICore");
  uint64_t v6 = [v4 stringWithFormat:@"%@\n\n", v5];

  v7 = NSString;
  v8 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeSubmissionDescriptionLine3", @"PhotosUICore");
  id v9 = [v7 stringWithFormat:@"%@\n\n", v8];

  v10 = NSString;
  v11 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeSubmissionDescriptionLine4", @"PhotosUICore");
  v12 = [v10 stringWithFormat:@"%@\n\n", v11];

  v13 = NSString;
  v14 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeSubmissionDescriptionLine5", @"PhotosUICore");
  v15 = [v13 stringWithFormat:@"%@\n\n", v14];

  v16 = NSString;
  v17 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeSubmissionDescriptionLine6", @"PhotosUICore");
  v18 = [v16 stringWithFormat:@"%@", v17];

  v19 = objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E4FB28C8], 2, 1);
  uint64_t v30 = *MEMORY[0x1E4FB06F8];
  v31[0] = v19;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
  v21 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v29 attributes:v20];
  v22 = (void *)v6;
  v23 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6 attributes:0];
  [v21 appendAttributedString:v23];

  v24 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v9 attributes:v20];
  [v21 appendAttributedString:v24];

  v25 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v12 attributes:0];
  [v21 appendAttributedString:v25];

  v26 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v15 attributes:v20];
  [v21 appendAttributedString:v26];

  v27 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v18 attributes:0];
  [v21 appendAttributedString:v27];

  return v21;
}

- (PXSurveyRadarReporterViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSurveyRadarReporterViewController.m", 95, @"%s is not available as initializer", "-[PXSurveyRadarReporterViewController initWithTitle:detailText:icon:contentLayout:]");

  abort();
}

- (PXSurveyRadarReporterViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSurveyRadarReporterViewController.m", 91, @"%s is not available as initializer", "-[PXSurveyRadarReporterViewController initWithTitle:detailText:icon:]");

  abort();
}

- (PXSurveyRadarReporterViewController)initWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v58 = [MEMORY[0x1E4F28B00] currentHandler];
    [v58 handleFailureInMethod:a2, self, @"PXSurveyRadarReporterViewController.m", 35, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];
  }
  id v10 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeSubmissionTitle", @"PhotosUICore");
  id v11 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", @"Photos_GettingStarted");
  v61.receiver = self;
  v61.super_class = (Class)PXSurveyRadarReporterViewController;
  id v12 = [(PXSurveyRadarReporterViewController *)&v61 initWithTitle:v10 detailText:0 icon:v11 contentLayout:2];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_configuration, a3);
    v14 = _Block_copy(v9);
    id completionHandler = v13->_completionHandler;
    v13->_id completionHandler = v14;

    id v16 = objc_alloc(MEMORY[0x1E4FB1930]);
    double v17 = *MEMORY[0x1E4F1DB28];
    double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v21 = objc_msgSend(v16, "initWithFrame:", *MEMORY[0x1E4F1DB28], v18, v19, v20);
    id v59 = v9;
    detailLabel = v13->_detailLabel;
    v13->_detailLabel = (UILabel *)v21;

    v23 = [(PXSurveyRadarReporterViewController *)v13 attributedDetailText];
    [(UILabel *)v13->_detailLabel setAttributedText:v23];

    [(UILabel *)v13->_detailLabel setTextAlignment:1];
    v24 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v13->_detailLabel setTextColor:v24];

    [(UILabel *)v13->_detailLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v13->_detailLabel setMinimumScaleFactor:0.75];
    [(UILabel *)v13->_detailLabel setNumberOfLines:0];
    [(UILabel *)v13->_detailLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v25 = [(PXSurveyRadarReporterViewController *)v13 contentView];
    [v25 addSubview:v13->_detailLabel];

    uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB14D0]), "initWithFrame:", v17, v18, v19, v20);
    readReleaseAgreementButton = v13->_readReleaseAgreementButton;
    v13->_readReleaseAgreementButton = (UIButton *)v26;

    v28 = v13->_readReleaseAgreementButton;
    v29 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeSubmissionPhotosReadFullReleaseAgreement", @"PhotosUICore");
    [(UIButton *)v28 setTitle:v29 forState:0];

    [(UIButton *)v13->_readReleaseAgreementButton addTarget:v13 action:sel__didSelectReadReleaseAgreementButton forControlEvents:64];
    uint64_t v30 = v13->_readReleaseAgreementButton;
    v31 = [(PXSurveyRadarReporterViewController *)v13 view];
    v32 = [v31 tintColor];
    [(UIButton *)v30 setTitleColor:v32 forState:0];

    [(UIButton *)v13->_readReleaseAgreementButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v33 = [(UIButton *)v13->_readReleaseAgreementButton titleLabel];
    [v33 setNumberOfLines:0];

    v34 = [(UIButton *)v13->_readReleaseAgreementButton titleLabel];
    [v34 setLineBreakMode:0];

    v35 = [(UIButton *)v13->_readReleaseAgreementButton titleLabel];
    [v35 setTextAlignment:1];

    v36 = [(PXSurveyRadarReporterViewController *)v13 contentView];
    [v36 addSubview:v13->_readReleaseAgreementButton];

    id v60 = v8;
    v37 = v13->_detailLabel;
    v38 = v13->_readReleaseAgreementButton;
    v39 = v37;
    v40 = _NSDictionaryOfVariableBindings(&cfstr_DetaillabelRea.isa, v39, v38, 0);
    v41 = [(PXSurveyRadarReporterViewController *)v13 contentView];
    v42 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[detailLabel]|" options:0 metrics:0 views:v40];
    [v41 addConstraints:v42];

    v43 = [(PXSurveyRadarReporterViewController *)v13 contentView];
    v44 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-[readReleaseAgreementButton]-|" options:0 metrics:0 views:v40];
    [v43 addConstraints:v44];

    v45 = [(PXSurveyRadarReporterViewController *)v13 contentView];
    v46 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[detailLabel]-[readReleaseAgreementButton]|" options:0 metrics:0 views:v40];
    [v45 addConstraints:v46];

    v47 = [MEMORY[0x1E4F83A80] boldButton];
    [v47 setTranslatesAutoresizingMaskIntoConstraints:0];
    v48 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeSubmissionAgree", @"PhotosUICore");
    [v47 setTitle:v48 forState:0];

    [v47 addTarget:v13 action:sel__handleAgreeButton_ forControlEvents:0x2000];
    v49 = [(PXSurveyRadarReporterViewController *)v13 buttonTray];
    [v49 addButton:v47];

    uint64_t v50 = [MEMORY[0x1E4F83A80] boldButton];
    notNowButton = v13->_notNowButton;
    v13->_notNowButton = (OBTrayButton *)v50;

    [(OBTrayButton *)v13->_notNowButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v52 = v13->_notNowButton;
    v53 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeSubmissionNotNow", @"PhotosUICore");
    [(OBTrayButton *)v52 setTitle:v53 forState:0];

    [(OBTrayButton *)v13->_notNowButton addTarget:v13 action:sel__handleNotNowButton_ forControlEvents:0x2000];
    v54 = v13->_notNowButton;
    v55 = [MEMORY[0x1E4FB1618] labelColor];
    [(OBTrayButton *)v54 setTitleColor:v55 forState:0];

    v56 = [(PXSurveyRadarReporterViewController *)v13 buttonTray];
    id v8 = v60;
    [v56 addButton:v13->_notNowButton];

    id v9 = v59;
    [(PXSurveyRadarReporterViewController *)v13 setModalPresentationStyle:2];
  }
  return v13;
}

@end