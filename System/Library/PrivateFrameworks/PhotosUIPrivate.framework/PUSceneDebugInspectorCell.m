@interface PUSceneDebugInspectorCell
+ (NSString)reuseIdentifier;
- (PUSceneDebugInspectorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (PUSceneDebugInspectorSceneViewModel)viewModel;
- (UILabel)countLabel;
- (UILabel)coverageLabel;
- (UILabel)isIndexedLabel;
- (UILabel)keywordLabel;
- (UILabel)sceneIdentifierLabel;
- (UILabel)synonymsLabel;
- (UILabel)thresholdLabel;
- (void)prepareForReuse;
- (void)setCountLabel:(id)a3;
- (void)setCoverageLabel:(id)a3;
- (void)setIsIndexedLabel:(id)a3;
- (void)setKeywordLabel:(id)a3;
- (void)setSceneIdentifierLabel:(id)a3;
- (void)setSynonymsLabel:(id)a3;
- (void)setThresholdLabel:(id)a3;
- (void)setViewModel:(id)a3;
@end

@implementation PUSceneDebugInspectorCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverageLabel, 0);
  objc_storeStrong((id *)&self->_thresholdLabel, 0);
  objc_storeStrong((id *)&self->_isIndexedLabel, 0);
  objc_storeStrong((id *)&self->_countLabel, 0);
  objc_storeStrong((id *)&self->_sceneIdentifierLabel, 0);
  objc_storeStrong((id *)&self->_synonymsLabel, 0);
  objc_storeStrong((id *)&self->_keywordLabel, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (void)setCoverageLabel:(id)a3
{
}

- (UILabel)coverageLabel
{
  return self->_coverageLabel;
}

- (void)setThresholdLabel:(id)a3
{
}

- (UILabel)thresholdLabel
{
  return self->_thresholdLabel;
}

- (void)setIsIndexedLabel:(id)a3
{
}

- (UILabel)isIndexedLabel
{
  return self->_isIndexedLabel;
}

- (void)setCountLabel:(id)a3
{
}

- (UILabel)countLabel
{
  return self->_countLabel;
}

- (void)setSceneIdentifierLabel:(id)a3
{
}

- (UILabel)sceneIdentifierLabel
{
  return self->_sceneIdentifierLabel;
}

- (void)setSynonymsLabel:(id)a3
{
}

- (UILabel)synonymsLabel
{
  return self->_synonymsLabel;
}

- (void)setKeywordLabel:(id)a3
{
}

- (UILabel)keywordLabel
{
  return self->_keywordLabel;
}

- (PUSceneDebugInspectorSceneViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  v21 = (PUSceneDebugInspectorSceneViewModel *)a3;
  if (self->_viewModel != v21)
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    v5 = [(PUSceneDebugInspectorSceneViewModel *)v21 keyword];
    [(UILabel *)self->_keywordLabel setText:v5];

    v6 = objc_msgSend(NSString, "stringWithFormat:", @"Identifier: %llu", -[PUSceneDebugInspectorSceneViewModel sceneIdentifier](v21, "sceneIdentifier"));
    [(UILabel *)self->_sceneIdentifierLabel setText:v6];

    v7 = NSString;
    BOOL v8 = [(PUSceneDebugInspectorSceneViewModel *)v21 isIndexed];
    v9 = @"NO";
    if (v8) {
      v9 = @"YES";
    }
    v10 = [v7 stringWithFormat:@"Searchable: %@", v9];
    [(UILabel *)self->_isIndexedLabel setText:v10];

    v11 = NSString;
    [(PUSceneDebugInspectorSceneViewModel *)v21 threshold];
    v13 = objc_msgSend(v11, "stringWithFormat:", @"Threshold: %f", v12);
    [(UILabel *)self->_thresholdLabel setText:v13];

    v14 = NSString;
    [(PUSceneDebugInspectorSceneViewModel *)v21 libraryCoverage];
    v16 = objc_msgSend(v14, "stringWithFormat:", @"Library Coverage: %2.2f%%", v15 * 100.0);
    [(UILabel *)self->_coverageLabel setText:v16];

    v17 = NSString;
    v18 = [(PUSceneDebugInspectorSceneViewModel *)v21 concatenatedSynonyms];
    v19 = [v17 stringWithFormat:@"Synonyms: %@", v18];
    [(UILabel *)self->_synonymsLabel setText:v19];

    v20 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", -[PUSceneDebugInspectorSceneViewModel count](v21, "count"));
    [(UILabel *)self->_countLabel setText:v20];
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PUSceneDebugInspectorCell;
  [(PUSceneDebugInspectorCell *)&v3 prepareForReuse];
  [(PUSceneDebugInspectorCell *)self setViewModel:0];
}

- (PUSceneDebugInspectorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v107[21] = *MEMORY[0x1E4F143B8];
  v106.receiver = self;
  v106.super_class = (Class)PUSceneDebugInspectorCell;
  v4 = [(PUSceneDebugInspectorCell *)&v106 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(PUSceneDebugInspectorCell *)v4 setAccessoryType:1];
    uint64_t v6 = [MEMORY[0x1E4FB1618] lightGrayColor];
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    keywordLabel = v5->_keywordLabel;
    v5->_keywordLabel = v7;

    v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(UILabel *)v5->_keywordLabel setFont:v9];

    [(UILabel *)v5->_keywordLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v5->_keywordLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = [(PUSceneDebugInspectorCell *)v5 contentView];
    [v10 addSubview:v5->_keywordLabel];

    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    sceneIdentifierLabel = v5->_sceneIdentifierLabel;
    v5->_sceneIdentifierLabel = v11;

    [(UILabel *)v5->_sceneIdentifierLabel setTextColor:v6];
    uint64_t v13 = *MEMORY[0x1E4FB28D8];
    v14 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
    [(UILabel *)v5->_sceneIdentifierLabel setFont:v14];

    [(UILabel *)v5->_sceneIdentifierLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v5->_sceneIdentifierLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    double v15 = [(PUSceneDebugInspectorCell *)v5 contentView];
    [v15 addSubview:v5->_sceneIdentifierLabel];

    v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    isIndexedLabel = v5->_isIndexedLabel;
    v5->_isIndexedLabel = v16;

    [(UILabel *)v5->_isIndexedLabel setTextColor:v6];
    v18 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v13];
    [(UILabel *)v5->_isIndexedLabel setFont:v18];

    [(UILabel *)v5->_isIndexedLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v5->_isIndexedLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v19 = [(PUSceneDebugInspectorCell *)v5 contentView];
    [v19 addSubview:v5->_isIndexedLabel];

    v20 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    thresholdLabel = v5->_thresholdLabel;
    v5->_thresholdLabel = v20;

    [(UILabel *)v5->_thresholdLabel setTextColor:v6];
    v22 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v13];
    [(UILabel *)v5->_thresholdLabel setFont:v22];

    [(UILabel *)v5->_thresholdLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v5->_thresholdLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v23 = [(PUSceneDebugInspectorCell *)v5 contentView];
    [v23 addSubview:v5->_thresholdLabel];

    v24 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    coverageLabel = v5->_coverageLabel;
    v5->_coverageLabel = v24;

    v105 = (void *)v6;
    [(UILabel *)v5->_coverageLabel setTextColor:v6];
    v26 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v13];
    [(UILabel *)v5->_coverageLabel setFont:v26];

    [(UILabel *)v5->_coverageLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v5->_coverageLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v27 = [(PUSceneDebugInspectorCell *)v5 contentView];
    [v27 addSubview:v5->_coverageLabel];

    v28 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    synonymsLabel = v5->_synonymsLabel;
    v5->_synonymsLabel = v28;

    [(UILabel *)v5->_synonymsLabel setTextColor:v6];
    v30 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v13];
    [(UILabel *)v5->_synonymsLabel setFont:v30];

    [(UILabel *)v5->_synonymsLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v5->_synonymsLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v5->_synonymsLabel setNumberOfLines:0];
    v31 = [(PUSceneDebugInspectorCell *)v5 contentView];
    [v31 addSubview:v5->_synonymsLabel];

    v32 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    countLabel = v5->_countLabel;
    v5->_countLabel = v32;

    v34 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D0]];
    [(UILabel *)v5->_countLabel setFont:v34];

    [(UILabel *)v5->_countLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v5->_countLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v35) = 1148846080;
    [(UILabel *)v5->_countLabel setContentCompressionResistancePriority:0 forAxis:v35];
    v36 = [(PUSceneDebugInspectorCell *)v5 contentView];
    [v36 addSubview:v5->_countLabel];

    v37 = [(PUSceneDebugInspectorCell *)v5 contentView];
    v38 = [v37 layoutMarginsGuide];

    v104 = [(UILabel *)v5->_keywordLabel leadingAnchor];
    v103 = [v38 leadingAnchor];
    v102 = [v104 constraintEqualToAnchor:v103];
    v107[0] = v102;
    v101 = [(UILabel *)v5->_keywordLabel topAnchor];
    v100 = [v38 topAnchor];
    v99 = [v101 constraintEqualToAnchor:v100];
    v107[1] = v99;
    v98 = [(UILabel *)v5->_sceneIdentifierLabel leadingAnchor];
    v97 = [(UILabel *)v5->_keywordLabel leadingAnchor];
    v96 = [v98 constraintEqualToAnchor:v97];
    v107[2] = v96;
    v95 = [(UILabel *)v5->_sceneIdentifierLabel topAnchor];
    v94 = [(UILabel *)v5->_keywordLabel bottomAnchor];
    v93 = [v95 constraintEqualToAnchor:v94];
    v107[3] = v93;
    v92 = [(UILabel *)v5->_isIndexedLabel leadingAnchor];
    v91 = [(UILabel *)v5->_sceneIdentifierLabel leadingAnchor];
    v90 = [v92 constraintEqualToAnchor:v91];
    v107[4] = v90;
    v89 = [(UILabel *)v5->_isIndexedLabel topAnchor];
    v88 = [(UILabel *)v5->_sceneIdentifierLabel bottomAnchor];
    v87 = [v89 constraintEqualToAnchor:v88];
    v107[5] = v87;
    v86 = [(UILabel *)v5->_thresholdLabel leadingAnchor];
    v85 = [(UILabel *)v5->_isIndexedLabel leadingAnchor];
    v84 = [v86 constraintEqualToAnchor:v85];
    v107[6] = v84;
    v83 = [(UILabel *)v5->_thresholdLabel topAnchor];
    v82 = [(UILabel *)v5->_isIndexedLabel bottomAnchor];
    v81 = [v83 constraintEqualToAnchor:v82];
    v107[7] = v81;
    v80 = [(UILabel *)v5->_coverageLabel leadingAnchor];
    v79 = [(UILabel *)v5->_thresholdLabel leadingAnchor];
    v78 = [v80 constraintEqualToAnchor:v79];
    v107[8] = v78;
    v77 = [(UILabel *)v5->_coverageLabel topAnchor];
    v76 = [(UILabel *)v5->_thresholdLabel bottomAnchor];
    v75 = [v77 constraintEqualToAnchor:v76];
    v107[9] = v75;
    v74 = [(UILabel *)v5->_synonymsLabel leadingAnchor];
    v73 = [(UILabel *)v5->_coverageLabel leadingAnchor];
    v72 = [v74 constraintEqualToAnchor:v73];
    v107[10] = v72;
    v71 = [(UILabel *)v5->_synonymsLabel topAnchor];
    v70 = [(UILabel *)v5->_coverageLabel bottomAnchor];
    v69 = [v71 constraintEqualToAnchor:v70];
    v107[11] = v69;
    v67 = [(UILabel *)v5->_countLabel topAnchor];
    v66 = [v38 topAnchor];
    v65 = [v67 constraintEqualToAnchor:v66];
    v107[12] = v65;
    v63 = [(UILabel *)v5->_countLabel bottomAnchor];
    v62 = [v38 bottomAnchor];
    v61 = [v63 constraintEqualToAnchor:v62];
    v107[13] = v61;
    v60 = [(UILabel *)v5->_countLabel leadingAnchor];
    v59 = [(UILabel *)v5->_keywordLabel trailingAnchor];
    v58 = [v60 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v59 multiplier:1.0];
    v107[14] = v58;
    v57 = [(UILabel *)v5->_countLabel leadingAnchor];
    v56 = [(UILabel *)v5->_isIndexedLabel trailingAnchor];
    v55 = [v57 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v56 multiplier:1.0];
    v107[15] = v55;
    v54 = [(UILabel *)v5->_countLabel leadingAnchor];
    v53 = [(UILabel *)v5->_thresholdLabel trailingAnchor];
    v52 = [v54 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v53 multiplier:1.0];
    v107[16] = v52;
    v51 = [(UILabel *)v5->_countLabel leadingAnchor];
    v50 = [(UILabel *)v5->_coverageLabel trailingAnchor];
    v49 = [v51 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v50 multiplier:1.0];
    v107[17] = v49;
    v39 = [(UILabel *)v5->_countLabel leadingAnchor];
    v40 = [(UILabel *)v5->_synonymsLabel trailingAnchor];
    v41 = [v39 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v40 multiplier:1.0];
    v107[18] = v41;
    v68 = v38;
    v42 = [v38 trailingAnchor];
    v43 = [(UILabel *)v5->_countLabel trailingAnchor];
    v44 = [v42 constraintEqualToAnchor:v43];
    v107[19] = v44;
    v45 = [v38 bottomAnchor];
    v46 = [(UILabel *)v5->_synonymsLabel bottomAnchor];
    v47 = [v45 constraintEqualToAnchor:v46];
    v107[20] = v47;
    v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v107 count:21];

    [MEMORY[0x1E4F28DC8] activateConstraints:v64];
  }
  return v5;
}

+ (NSString)reuseIdentifier
{
  return (NSString *)@"PUSceneDebugInspectorCell";
}

@end