@interface WFCompactFileThumbnailViewController
- (NSString)filename;
- (WFCompactFileThumbnailViewController)initWithFileType:(id)a3 filename:(id)a4;
- (WFFileType)fileType;
- (double)contentHeightForWidth:(double)a3;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)loadView;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation WFCompactFileThumbnailViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_fileType, 0);
}

- (NSString)filename
{
  return self->_filename;
}

- (WFFileType)fileType
{
  return self->_fileType;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = objc_alloc(MEMORY[0x263F82CC8]);
  v6 = [(WFCompactFileThumbnailViewController *)self view];
  v7 = (void *)[v5 initWithView:v6];

  v8 = [MEMORY[0x263F82A60] effectWithPreview:v7];
  v9 = [MEMORY[0x263F82A90] styleWithEffect:v8 shape:0];

  return v9;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFCompactFileThumbnailViewController;
  id v4 = a3;
  [(WFCompactFileThumbnailViewController *)&v8 traitCollectionDidChange:v4];
  id v5 = [(WFCompactFileThumbnailViewController *)self traitCollection];
  v6 = [v5 preferredContentSizeCategory];
  v7 = [v4 preferredContentSizeCategory];

  if (v6 != v7) {
    [(WFCompactThumbnailViewController *)self invalidateContentSize];
  }
}

- (double)contentHeightForWidth:(double)a3
{
  [(WFCompactFileThumbnailViewController *)self loadViewIfNeeded];
  id v5 = [(WFCompactFileThumbnailViewController *)self view];
  objc_msgSend(v5, "systemLayoutSizeFittingSize:", a3, *(double *)(MEMORY[0x263F83810] + 8));
  double v7 = v6;

  return v7;
}

- (void)loadView
{
  v62[10] = *MEMORY[0x263EF8340];
  v61.receiver = self;
  v61.super_class = (Class)WFCompactFileThumbnailViewController;
  [(WFCompactFileThumbnailViewController *)&v61 loadView];
  v3 = [(WFCompactFileThumbnailViewController *)self fileType];
  id v4 = [v3 documentIcon];
  v60 = [v4 UIImage];

  id v5 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v60];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v6 = [(WFCompactFileThumbnailViewController *)self view];
  [v6 addSubview:v5];

  v59 = objc_msgSend(MEMORY[0x263F827E8], "wf_disclosureImage");
  double v7 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v59];
  objc_super v8 = [MEMORY[0x263F825C8] systemGrayColor];
  [v7 setTintColor:v8];

  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  v9 = [(WFCompactFileThumbnailViewController *)self view];
  [v9 addSubview:v7];

  id v10 = objc_alloc_init(MEMORY[0x263F828E0]);
  v11 = [(WFCompactFileThumbnailViewController *)self filename];
  [v10 setText:v11];

  v12 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  [v10 setFont:v12];

  [v10 setAdjustsFontForContentSizeCategory:1];
  [v10 setTextAlignment:4];
  [v10 setNumberOfLines:5];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v13) = 1132068864;
  [v10 setContentCompressionResistancePriority:0 forAxis:v13];
  v14 = [(WFCompactFileThumbnailViewController *)self view];
  [v14 addSubview:v10];

  v42 = (void *)MEMORY[0x263F08938];
  v57 = [v5 topAnchor];
  v58 = [(WFCompactFileThumbnailViewController *)self view];
  v56 = [v58 topAnchor];
  v55 = [v57 constraintGreaterThanOrEqualToAnchor:v56 constant:12.0];
  v62[0] = v55;
  v53 = [v5 bottomAnchor];
  v54 = [(WFCompactFileThumbnailViewController *)self view];
  v52 = [v54 bottomAnchor];
  v51 = [v53 constraintLessThanOrEqualToAnchor:v52 constant:-12.0];
  v62[1] = v51;
  v48 = [v5 leadingAnchor];
  v49 = [(WFCompactFileThumbnailViewController *)self view];
  v47 = [v49 leadingAnchor];
  v46 = [v48 constraintEqualToAnchor:v47 constant:16.0];
  v62[2] = v46;
  v50 = v5;
  v45 = [v5 centerYAnchor];
  v44 = [v10 centerYAnchor];
  v43 = [v45 constraintEqualToAnchor:v44];
  v62[3] = v43;
  v39 = [v10 topAnchor];
  v40 = [(WFCompactFileThumbnailViewController *)self view];
  v38 = [v40 topAnchor];
  v37 = [v39 constraintEqualToAnchor:v38 constant:12.0];
  v62[4] = v37;
  v34 = [v10 bottomAnchor];
  v35 = [(WFCompactFileThumbnailViewController *)self view];
  v33 = [v35 bottomAnchor];
  v32 = [v34 constraintEqualToAnchor:v33 constant:-12.0];
  v62[5] = v32;
  v31 = [v10 leadingAnchor];
  v30 = [v5 trailingAnchor];
  v29 = [v31 constraintEqualToAnchor:v30 constant:12.0];
  v62[6] = v29;
  v28 = [v7 leadingAnchor];
  v27 = [v10 trailingAnchor];
  v26 = [v28 constraintGreaterThanOrEqualToAnchor:v27 constant:20.0];
  v62[7] = v26;
  v41 = v7;
  v15 = [v7 trailingAnchor];
  v36 = self;
  v16 = [(WFCompactFileThumbnailViewController *)self view];
  v17 = [v16 trailingAnchor];
  v18 = [v15 constraintEqualToAnchor:v17 constant:-16.0];
  v62[8] = v18;
  v19 = [v7 centerYAnchor];
  v20 = [(WFCompactFileThumbnailViewController *)self view];
  v21 = [v20 centerYAnchor];
  v22 = [v19 constraintEqualToAnchor:v21];
  v62[9] = v22;
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:10];
  [v42 activateConstraints:v23];

  v24 = (void *)[objc_alloc(MEMORY[0x263F82A70]) initWithDelegate:v36];
  v25 = [(WFCompactFileThumbnailViewController *)v36 view];
  [v25 addInteraction:v24];
}

- (WFCompactFileThumbnailViewController)initWithFileType:(id)a3 filename:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFCompactFileThumbnailViewController;
  v9 = [(WFCompactFileThumbnailViewController *)&v15 initWithNibName:0 bundle:0];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileType, a3);
    uint64_t v11 = [v8 copy];
    filename = v10->_filename;
    v10->_filename = (NSString *)v11;

    double v13 = v10;
  }

  return v10;
}

@end