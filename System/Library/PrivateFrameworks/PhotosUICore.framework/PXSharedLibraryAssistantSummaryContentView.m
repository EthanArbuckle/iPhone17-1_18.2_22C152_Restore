@interface PXSharedLibraryAssistantSummaryContentView
- (PXSharedLibraryAssistantSummaryContentView)initWithViewModel:(id)a3;
- (PXSharedLibraryAssistantViewModel)viewModel;
- (void)_initializeSubviews;
- (void)_updateCountsLabel;
- (void)_updateDateLabel;
- (void)_updateIcon;
- (void)_updatePeopleLabel;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PXSharedLibraryAssistantSummaryContentView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_peopleLabel, 0);
  objc_storeStrong((id *)&self->_countsLabel, 0);
  objc_storeStrong((id *)&self->_topImageView, 0);
}

- (PXSharedLibraryAssistantViewModel)viewModel
{
  return self->_viewModel;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((void *)PXSharedLibraryAssistantViewModelObservationContext_157058 == a5)
  {
    __int16 v5 = a4;
    uint64_t v7 = a4 & 0x88;
    if ((+[PXSharedLibraryAssistantViewModel shareCountChangeDescriptors] & a4) != 0)[(PXSharedLibraryAssistantSummaryContentView *)self _updateCountsLabel]; {
    uint64_t v8 = v5 & 0x2084;
    }
    if (v7) {
      [(PXSharedLibraryAssistantSummaryContentView *)self _updatePeopleLabel];
    }
    if (v8)
    {
      [(PXSharedLibraryAssistantSummaryContentView *)self _updateDateLabel];
    }
  }
}

- (void)_updateIcon
{
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PXSharedLibraryAssistantSummaryContentView;
  id v4 = a3;
  [(PXSharedLibraryAssistantSummaryContentView *)&v8 traitCollectionDidChange:v4];
  __int16 v5 = [(PXSharedLibraryAssistantSummaryContentView *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    [(PXSharedLibraryAssistantSummaryContentView *)self _updateIcon];
  }
}

- (void)_updateDateLabel
{
  id v12 = [(PXSharedLibraryAssistantSummaryContentView *)self viewModel];
  v3 = [v12 startDate];
  uint64_t v4 = [v12 selectedRuleType];
  if (v3)
  {
    __int16 v5 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v3 dateStyle:2 timeStyle:0];
LABEL_5:
    objc_super v8 = PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_Summary_Date_Format");
    v11 = v5;
    v9 = PXLocalizedStringWithValidatedFormat(v8, @"%@");

    uint64_t v10 = 0;
    goto LABEL_7;
  }
  if (v4 == 1)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28C10];
    uint64_t v7 = [v12 suggestedStartDate];
    __int16 v5 = [v6 localizedStringFromDate:v7 dateStyle:2 timeStyle:0];

    goto LABEL_5;
  }
  v9 = 0;
  uint64_t v10 = 1;
LABEL_7:
  -[UILabel setText:](self->_dateLabel, "setText:", v9, v11);
  [(UILabel *)self->_dateLabel setHidden:v10];
}

- (void)_updatePeopleLabel
{
  uint64_t v17 = 0;
  v3 = [(PXSharedLibraryAssistantSummaryContentView *)self viewModel];
  uint64_t v4 = [v3 localizedSelectedPeopleWithAdditionalPeopleCount:&v17];

  uint64_t v5 = [v4 count];
  uint64_t v6 = v17 + v5;
  if (v17 + v5 >= 1)
  {
    uint64_t v7 = [MEMORY[0x1E4F28DF8] localizedStringByJoiningStrings:v4];
    if ([v4 count] == 1)
    {
      objc_super v8 = @"PXSharedLibraryAssistant_Summary_People_SinglePerson_Format";
    }
    else
    {
      if ((unint64_t)[v4 count] < 2 || v17)
      {
        if ([v4 count] == 2 && v17 >= 1)
        {
          v11 = PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_Summary_People_TwoPeopleAndCount_Format");
          v13 = [v4 objectAtIndexedSubscript:0];
          v15 = [v4 objectAtIndexedSubscript:1];
          uint64_t v16 = v17;
          v14 = v13;
          v9 = PXLocalizedStringWithValidatedFormat(v11, @"%@ %@ %lu");

          goto LABEL_10;
        }
        uint64_t v10 = PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_Summary_People_CountOnly_Format");
        v11 = v10;
        v14 = (void *)v6;
        id v12 = @"%lu";
LABEL_9:
        v9 = PXLocalizedStringWithValidatedFormat(v10, v12);
LABEL_10:

        goto LABEL_11;
      }
      objc_super v8 = @"PXSharedLibraryAssistant_Summary_People_MultiplePeople_Format";
    }
    uint64_t v10 = PXLocalizedSharedLibraryString(v8);
    v11 = v10;
    v14 = v7;
    id v12 = @"%@";
    goto LABEL_9;
  }
  v9 = 0;
LABEL_11:
  -[UILabel setText:](self->_peopleLabel, "setText:", v9, v14, v15, v16);
  [(UILabel *)self->_peopleLabel setHidden:v9 == 0];
}

- (void)_updateCountsLabel
{
  v3 = [(PXSharedLibraryAssistantSummaryContentView *)self viewModel];
  uint64_t v4 = v3;
  if (v3) {
    [v3 shareCounts];
  }
  uint64_t v5 = PLLocalizedCountDescription();
  [(UILabel *)self->_countsLabel setText:v5];
}

- (void)_initializeSubviews
{
  v55[14] = *MEMORY[0x1E4F143B8];
  v3 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
  [(UIImageView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  topImageView = self->_topImageView;
  self->_topImageView = v3;

  _CreateLabel(1);
  uint64_t v5 = (UILabel *)objc_claimAutoreleasedReturnValue();
  countsLabel = self->_countsLabel;
  self->_countsLabel = v5;

  _CreateLabel(0);
  uint64_t v7 = (UILabel *)objc_claimAutoreleasedReturnValue();
  peopleLabel = self->_peopleLabel;
  self->_peopleLabel = v7;

  _CreateLabel(0);
  v9 = (UILabel *)objc_claimAutoreleasedReturnValue();
  dateLabel = self->_dateLabel;
  self->_dateLabel = v9;

  [(PXSharedLibraryAssistantSummaryContentView *)self addSubview:self->_topImageView];
  [(PXSharedLibraryAssistantSummaryContentView *)self addSubview:self->_countsLabel];
  [(PXSharedLibraryAssistantSummaryContentView *)self addSubview:self->_peopleLabel];
  [(PXSharedLibraryAssistantSummaryContentView *)self addSubview:self->_dateLabel];
  v37 = (void *)MEMORY[0x1E4F28DC8];
  v54 = [(UIImageView *)self->_topImageView topAnchor];
  v53 = [(PXSharedLibraryAssistantSummaryContentView *)self topAnchor];
  v52 = [v54 constraintEqualToAnchor:v53];
  v55[0] = v52;
  v51 = [(UIImageView *)self->_topImageView centerXAnchor];
  v50 = [(PXSharedLibraryAssistantSummaryContentView *)self centerXAnchor];
  v49 = [v51 constraintEqualToAnchor:v50];
  v55[1] = v49;
  v48 = [(UIImageView *)self->_topImageView leadingAnchor];
  v47 = [(PXSharedLibraryAssistantSummaryContentView *)self leadingAnchor];
  v46 = [v48 constraintGreaterThanOrEqualToAnchor:v47];
  v55[2] = v46;
  v45 = [(UIImageView *)self->_topImageView trailingAnchor];
  v44 = [(PXSharedLibraryAssistantSummaryContentView *)self trailingAnchor];
  v43 = [v45 constraintLessThanOrEqualToAnchor:v44];
  v55[3] = v43;
  v42 = [(UILabel *)self->_countsLabel topAnchor];
  v41 = [(UIImageView *)self->_topImageView bottomAnchor];
  v40 = [v42 constraintEqualToAnchor:v41 constant:22.0];
  v55[4] = v40;
  v39 = [(UILabel *)self->_countsLabel leadingAnchor];
  v38 = [(PXSharedLibraryAssistantSummaryContentView *)self leadingAnchor];
  v36 = [v39 constraintEqualToAnchor:v38];
  v55[5] = v36;
  v35 = [(UILabel *)self->_countsLabel trailingAnchor];
  v34 = [(PXSharedLibraryAssistantSummaryContentView *)self trailingAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v55[6] = v33;
  v32 = [(UILabel *)self->_peopleLabel topAnchor];
  v31 = [(UILabel *)self->_countsLabel bottomAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v55[7] = v30;
  v29 = [(UILabel *)self->_peopleLabel leadingAnchor];
  v28 = [(PXSharedLibraryAssistantSummaryContentView *)self leadingAnchor];
  v27 = [v29 constraintEqualToAnchor:v28];
  v55[8] = v27;
  v26 = [(UILabel *)self->_peopleLabel trailingAnchor];
  v25 = [(PXSharedLibraryAssistantSummaryContentView *)self trailingAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v55[9] = v24;
  v23 = [(UILabel *)self->_dateLabel topAnchor];
  v22 = [(UILabel *)self->_peopleLabel bottomAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v55[10] = v21;
  v20 = [(UILabel *)self->_dateLabel leadingAnchor];
  v11 = [(PXSharedLibraryAssistantSummaryContentView *)self leadingAnchor];
  id v12 = [v20 constraintEqualToAnchor:v11];
  v55[11] = v12;
  v13 = [(UILabel *)self->_dateLabel trailingAnchor];
  v14 = [(PXSharedLibraryAssistantSummaryContentView *)self trailingAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v55[12] = v15;
  uint64_t v16 = [(UILabel *)self->_dateLabel bottomAnchor];
  uint64_t v17 = [(PXSharedLibraryAssistantSummaryContentView *)self bottomAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  v55[13] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:14];
  [v37 activateConstraints:v19];

  [(PXSharedLibraryAssistantSummaryContentView *)self _updateIcon];
}

- (PXSharedLibraryAssistantSummaryContentView)initWithViewModel:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXSharedLibraryAssistantSummaryContentView.m", 46, @"Invalid parameter not satisfying: %@", @"viewModel" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)PXSharedLibraryAssistantSummaryContentView;
  uint64_t v7 = -[PXSharedLibraryAssistantSummaryContentView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  objc_super v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_viewModel, a3);
    [(PXSharedLibraryAssistantViewModel *)v8->_viewModel registerChangeObserver:v8 context:PXSharedLibraryAssistantViewModelObservationContext_157058];
    v9 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(PXSharedLibraryAssistantSummaryContentView *)v8 setBackgroundColor:v9];

    [(PXSharedLibraryAssistantSummaryContentView *)v8 _initializeSubviews];
    [(PXSharedLibraryAssistantSummaryContentView *)v8 _updateCountsLabel];
    [(PXSharedLibraryAssistantSummaryContentView *)v8 _updatePeopleLabel];
    [(PXSharedLibraryAssistantSummaryContentView *)v8 _updateDateLabel];
  }

  return v8;
}

@end