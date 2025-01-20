@interface DBSDisplayZoomTableViewCell
+ (int64_t)cellStyle;
- (DBSDisplayZoomOptionView)denseOptionView;
- (DBSDisplayZoomOptionView)denserOptionView;
- (DBSDisplayZoomOptionView)standardOptionView;
- (DBSDisplayZoomOptionView)zoomedOptionView;
- (DBSDisplayZoomTableViewCellDelegate)delegate;
- (id)_optionViewsByDensity;
- (void)_configureForLegacy;
- (void)_configureForThreeDisplayOptionsWithLeadingView:(id)a3 middleView:(id)a4 trailingView:(id)a5;
- (void)_configureForTwoDisplayOptionsWithLeadingView:(id)a3 trailingView:(id)a4;
- (void)configureView;
- (void)setDelegate:(id)a3;
- (void)setDenseOptionView:(id)a3;
- (void)setDenserOptionView:(id)a3;
- (void)setStandardOptionView:(id)a3;
- (void)setZoomedOptionView:(id)a3;
- (void)startAnimation;
- (void)stopAnimation;
- (void)updateSelectedViewWithOption:(unint64_t)a3;
- (void)userDidTapOnDisplayZoomOptionView:(id)a3;
@end

@implementation DBSDisplayZoomTableViewCell

- (void)configureView
{
  v3 = [(DBSDisplayZoomTableViewCell *)self delegate];
  id v41 = [v3 supportedDisplayZoomOptions];

  if ([v41 containsObject:&unk_26E939020])
  {
    v4 = [DBSDisplayZoomOptionView alloc];
    v5 = -[DBSDisplayZoomOptionView initWithFrame:displayZoomOption:](v4, "initWithFrame:displayZoomOption:", 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    standardOptionView = self->_standardOptionView;
    self->_standardOptionView = v5;

    v7 = [(DBSDisplayZoomTableViewCell *)self standardOptionView];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

    v8 = [(DBSDisplayZoomTableViewCell *)self standardOptionView];
    [v8 setDelegate:self];

    v9 = DBSStringForDisplayZoomOption(0);
    v10 = [(DBSDisplayZoomTableViewCell *)self standardOptionView];
    [v10 setAccessibilityIdentifier:v9];
  }
  if ([v41 containsObject:&unk_26E939038])
  {
    v11 = [DBSDisplayZoomOptionView alloc];
    v12 = -[DBSDisplayZoomOptionView initWithFrame:displayZoomOption:](v11, "initWithFrame:displayZoomOption:", 1, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    zoomedOptionView = self->_zoomedOptionView;
    self->_zoomedOptionView = v12;

    v14 = [(DBSDisplayZoomTableViewCell *)self zoomedOptionView];
    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

    v15 = [(DBSDisplayZoomTableViewCell *)self zoomedOptionView];
    [v15 setDelegate:self];

    v16 = DBSStringForDisplayZoomOption(1);
    v17 = [(DBSDisplayZoomTableViewCell *)self zoomedOptionView];
    [v17 setAccessibilityIdentifier:v16];
  }
  if ([v41 containsObject:&unk_26E939050])
  {
    v18 = [DBSDisplayZoomOptionView alloc];
    v19 = -[DBSDisplayZoomOptionView initWithFrame:displayZoomOption:](v18, "initWithFrame:displayZoomOption:", 2, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    denseOptionView = self->_denseOptionView;
    self->_denseOptionView = v19;

    v21 = [(DBSDisplayZoomTableViewCell *)self denseOptionView];
    [v21 setTranslatesAutoresizingMaskIntoConstraints:0];

    v22 = [(DBSDisplayZoomTableViewCell *)self denseOptionView];
    [v22 setDelegate:self];

    v23 = DBSStringForDisplayZoomOption(2);
    v24 = [(DBSDisplayZoomTableViewCell *)self denseOptionView];
    [v24 setAccessibilityIdentifier:v23];
  }
  if ([v41 containsObject:&unk_26E939068])
  {
    v25 = [DBSDisplayZoomOptionView alloc];
    v26 = -[DBSDisplayZoomOptionView initWithFrame:displayZoomOption:](v25, "initWithFrame:displayZoomOption:", 3, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    denserOptionView = self->_denserOptionView;
    self->_denserOptionView = v26;

    v28 = [(DBSDisplayZoomTableViewCell *)self denserOptionView];
    [v28 setTranslatesAutoresizingMaskIntoConstraints:0];

    v29 = [(DBSDisplayZoomTableViewCell *)self denserOptionView];
    [v29 setDelegate:self];

    v30 = DBSStringForDisplayZoomOption(3);
    v31 = [(DBSDisplayZoomTableViewCell *)self denserOptionView];
    [v31 setAccessibilityIdentifier:v30];
  }
  if (DBSReverseZoomEnabled())
  {
    v32 = [(DBSDisplayZoomTableViewCell *)self _optionViewsByDensity];
    if ((unint64_t)[v32 count] >= 4)
    {
      uint64_t v33 = objc_msgSend(v32, "subarrayWithRange:", objc_msgSend(v32, "count") - 3, 3);

      v32 = (void *)v33;
    }
    v34 = [v32 objectAtIndexedSubscript:0];
    v35 = [v32 objectAtIndexedSubscript:1];
    v36 = 0;
    if ((unint64_t)[v32 count] >= 3)
    {
      v36 = [v32 objectAtIndexedSubscript:2];
    }
    if ([v41 count] == 2) {
      [(DBSDisplayZoomTableViewCell *)self _configureForTwoDisplayOptionsWithLeadingView:v34 trailingView:v35];
    }
    else {
      [(DBSDisplayZoomTableViewCell *)self _configureForThreeDisplayOptionsWithLeadingView:v34 middleView:v35 trailingView:v36];
    }
  }
  else
  {
    [(DBSDisplayZoomTableViewCell *)self _configureForLegacy];
  }
  v37 = [(DBSDisplayZoomTableViewCell *)self delegate];
  char v38 = objc_opt_respondsToSelector();

  if (v38)
  {
    v39 = [(DBSDisplayZoomTableViewCell *)self delegate];
    uint64_t v40 = [v39 displayZoomTableViewCellCurrentlySelectedDisplayZoomOption:self];

    [(DBSDisplayZoomTableViewCell *)self updateSelectedViewWithOption:v40];
  }
}

- (void)_configureForTwoDisplayOptionsWithLeadingView:(id)a3 trailingView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(DBSDisplayZoomTableViewCell *)self contentView];
  [v8 addSubview:v7];

  v9 = [(DBSDisplayZoomTableViewCell *)self contentView];
  [v9 addSubview:v6];

  id v50 = objc_alloc_init(MEMORY[0x263F82908]);
  v10 = [(DBSDisplayZoomTableViewCell *)self contentView];
  [v10 addLayoutGuide:v50];

  v11 = [MEMORY[0x263EFF980] array];
  v12 = [v6 topAnchor];
  v13 = [(DBSDisplayZoomTableViewCell *)self contentView];
  v14 = [v13 topAnchor];
  v15 = [v12 constraintEqualToAnchor:v14 constant:18.0];
  [v11 addObject:v15];

  v16 = [v7 topAnchor];
  v17 = [(DBSDisplayZoomTableViewCell *)self contentView];
  v18 = [v17 topAnchor];
  v19 = [v16 constraintEqualToAnchor:v18 constant:18.0];
  [v11 addObject:v19];

  v20 = [v6 bottomAnchor];
  v21 = [(DBSDisplayZoomTableViewCell *)self contentView];
  v22 = [v21 bottomAnchor];
  v23 = [v20 constraintEqualToAnchor:v22 constant:-18.0];
  [v11 addObject:v23];

  v24 = [v7 bottomAnchor];
  v25 = [(DBSDisplayZoomTableViewCell *)self contentView];
  v26 = [v25 bottomAnchor];
  v27 = [v24 constraintEqualToAnchor:v26 constant:-18.0];
  [v11 addObject:v27];

  v28 = [v7 leadingAnchor];
  v29 = [(DBSDisplayZoomTableViewCell *)self contentView];
  v30 = [v29 leadingAnchor];
  v31 = [v28 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v30 multiplier:2.0];
  [v11 addObject:v31];

  v32 = [v7 trailingAnchor];

  uint64_t v33 = [v50 leadingAnchor];
  v34 = [v32 constraintEqualToAnchor:v33];
  [v11 addObject:v34];

  v35 = [MEMORY[0x263F82670] currentDevice];
  LODWORD(v32) = objc_msgSend(v35, "sf_isiPad");

  if (v32) {
    double v36 = 80.0;
  }
  else {
    double v36 = 49.0;
  }
  v37 = [v50 widthAnchor];
  char v38 = [v37 constraintEqualToConstant:v36];
  [v11 addObject:v38];

  v39 = [v50 centerXAnchor];
  uint64_t v40 = [(DBSDisplayZoomTableViewCell *)self contentView];
  id v41 = [v40 centerXAnchor];
  v42 = [v39 constraintEqualToAnchor:v41];
  [v11 addObject:v42];

  v43 = [v6 leadingAnchor];
  v44 = [v50 trailingAnchor];
  v45 = [v43 constraintEqualToAnchor:v44];
  [v11 addObject:v45];

  v46 = [(DBSDisplayZoomTableViewCell *)self contentView];
  v47 = [v46 trailingAnchor];
  v48 = [v6 trailingAnchor];

  v49 = [v47 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v48 multiplier:2.0];
  [v11 addObject:v49];

  [MEMORY[0x263F08938] activateConstraints:v11];
}

- (void)_configureForThreeDisplayOptionsWithLeadingView:(id)a3 middleView:(id)a4 trailingView:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(DBSDisplayZoomTableViewCell *)self contentView];
  [v11 addSubview:v10];

  v12 = [(DBSDisplayZoomTableViewCell *)self contentView];
  [v12 addSubview:v9];

  v13 = [(DBSDisplayZoomTableViewCell *)self contentView];
  [v13 addSubview:v8];

  id v72 = objc_alloc_init(MEMORY[0x263F82908]);
  id v14 = objc_alloc_init(MEMORY[0x263F82908]);
  v15 = [(DBSDisplayZoomTableViewCell *)self contentView];
  [v15 addLayoutGuide:v72];

  v16 = [(DBSDisplayZoomTableViewCell *)self contentView];
  [v16 addLayoutGuide:v14];

  v17 = [MEMORY[0x263EFF980] array];
  v18 = [v8 topAnchor];
  v19 = [(DBSDisplayZoomTableViewCell *)self contentView];
  v20 = [v19 topAnchor];
  v21 = [v18 constraintEqualToAnchor:v20 constant:18.0];
  [v17 addObject:v21];

  v22 = [v10 topAnchor];
  v23 = [(DBSDisplayZoomTableViewCell *)self contentView];
  v24 = [v23 topAnchor];
  v25 = [v22 constraintEqualToAnchor:v24 constant:18.0];
  [v17 addObject:v25];

  v26 = [v9 topAnchor];
  v27 = [(DBSDisplayZoomTableViewCell *)self contentView];
  v28 = [v27 topAnchor];
  v29 = [v26 constraintEqualToAnchor:v28 constant:18.0];
  [v17 addObject:v29];

  v30 = [v8 bottomAnchor];
  v31 = [(DBSDisplayZoomTableViewCell *)self contentView];
  v32 = [v31 bottomAnchor];
  uint64_t v33 = [v30 constraintEqualToAnchor:v32 constant:-18.0];
  [v17 addObject:v33];

  v34 = [v10 bottomAnchor];
  v35 = [(DBSDisplayZoomTableViewCell *)self contentView];
  double v36 = [v35 bottomAnchor];
  v37 = [v34 constraintEqualToAnchor:v36 constant:-18.0];
  [v17 addObject:v37];

  char v38 = [v9 bottomAnchor];
  v39 = [(DBSDisplayZoomTableViewCell *)self contentView];
  uint64_t v40 = [v39 bottomAnchor];
  id v41 = [v38 constraintEqualToAnchor:v40 constant:-18.0];
  [v17 addObject:v41];

  v42 = [v10 leadingAnchor];
  v43 = [(DBSDisplayZoomTableViewCell *)self contentView];
  v44 = [v43 leadingAnchor];
  v45 = [v42 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v44 multiplier:2.0];
  [v17 addObject:v45];

  v46 = [v10 trailingAnchor];

  v47 = [v72 leadingAnchor];
  v48 = [v46 constraintEqualToAnchor:v47];
  [v17 addObject:v48];

  v49 = [MEMORY[0x263F82670] currentDevice];
  LODWORD(v46) = objc_msgSend(v49, "sf_isiPad");

  if (v46) {
    double v50 = 80.0;
  }
  else {
    double v50 = 29.0;
  }
  v51 = [v72 widthAnchor];
  v52 = [v51 constraintEqualToConstant:v50];
  [v17 addObject:v52];

  v53 = [v9 leadingAnchor];
  v54 = [v72 trailingAnchor];
  v55 = [v53 constraintEqualToAnchor:v54];
  [v17 addObject:v55];

  v56 = [v9 trailingAnchor];
  v57 = [v14 leadingAnchor];
  v58 = [v56 constraintEqualToAnchor:v57];
  [v17 addObject:v58];

  v59 = [v9 centerXAnchor];

  v60 = [(DBSDisplayZoomTableViewCell *)self contentView];
  v61 = [v60 centerXAnchor];
  v62 = [v59 constraintEqualToAnchor:v61];
  [v17 addObject:v62];

  v63 = [v14 widthAnchor];
  v64 = [v63 constraintEqualToConstant:v50];
  [v17 addObject:v64];

  v65 = [v8 leadingAnchor];
  v66 = [v14 trailingAnchor];
  v67 = [v65 constraintEqualToAnchor:v66];
  [v17 addObject:v67];

  v68 = [(DBSDisplayZoomTableViewCell *)self contentView];
  v69 = [v68 trailingAnchor];
  v70 = [v8 trailingAnchor];

  v71 = [v69 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v70 multiplier:2.0];
  [v17 addObject:v71];

  [MEMORY[0x263F08938] activateConstraints:v17];
}

- (void)_configureForLegacy
{
  v3 = [(DBSDisplayZoomTableViewCell *)self contentView];
  v4 = [(DBSDisplayZoomTableViewCell *)self zoomedOptionView];
  [v3 addSubview:v4];

  v5 = [(DBSDisplayZoomTableViewCell *)self contentView];
  id v6 = [(DBSDisplayZoomTableViewCell *)self standardOptionView];
  [v5 addSubview:v6];

  id v55 = objc_alloc_init(MEMORY[0x263F82908]);
  id v7 = [(DBSDisplayZoomTableViewCell *)self contentView];
  [v7 addLayoutGuide:v55];

  id v8 = [MEMORY[0x263EFF980] array];
  id v9 = [(DBSDisplayZoomTableViewCell *)self standardOptionView];
  id v10 = [v9 topAnchor];
  v11 = [(DBSDisplayZoomTableViewCell *)self contentView];
  v12 = [v11 topAnchor];
  v13 = [v10 constraintEqualToAnchor:v12 constant:56.0];
  [v8 addObject:v13];

  id v14 = [(DBSDisplayZoomTableViewCell *)self zoomedOptionView];
  v15 = [v14 topAnchor];
  v16 = [(DBSDisplayZoomTableViewCell *)self contentView];
  v17 = [v16 topAnchor];
  v18 = [v15 constraintEqualToAnchor:v17 constant:56.0];
  [v8 addObject:v18];

  v19 = [(DBSDisplayZoomTableViewCell *)self standardOptionView];
  v20 = [v19 bottomAnchor];
  v21 = [(DBSDisplayZoomTableViewCell *)self contentView];
  v22 = [v21 bottomAnchor];
  v23 = [v20 constraintEqualToAnchor:v22 constant:-56.0];
  [v8 addObject:v23];

  v24 = [(DBSDisplayZoomTableViewCell *)self zoomedOptionView];
  v25 = [v24 bottomAnchor];
  v26 = [(DBSDisplayZoomTableViewCell *)self contentView];
  v27 = [v26 bottomAnchor];
  v28 = [v25 constraintEqualToAnchor:v27 constant:-56.0];
  [v8 addObject:v28];

  v29 = [(DBSDisplayZoomTableViewCell *)self standardOptionView];
  v30 = [v29 leadingAnchor];
  v31 = [(DBSDisplayZoomTableViewCell *)self contentView];
  v32 = [v31 leadingAnchor];
  uint64_t v33 = [v30 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v32 multiplier:2.0];
  [v8 addObject:v33];

  v34 = [(DBSDisplayZoomTableViewCell *)self standardOptionView];
  v35 = [v34 trailingAnchor];
  double v36 = [v55 leadingAnchor];
  v37 = [v35 constraintEqualToAnchor:v36];
  [v8 addObject:v37];

  char v38 = [MEMORY[0x263F82670] currentDevice];
  LODWORD(v35) = objc_msgSend(v38, "sf_isiPad");

  if (v35) {
    double v39 = 80.0;
  }
  else {
    double v39 = 49.0;
  }
  uint64_t v40 = [v55 widthAnchor];
  id v41 = [v40 constraintEqualToConstant:v39];
  [v8 addObject:v41];

  v42 = [v55 centerXAnchor];
  v43 = [(DBSDisplayZoomTableViewCell *)self contentView];
  v44 = [v43 centerXAnchor];
  v45 = [v42 constraintEqualToAnchor:v44];
  [v8 addObject:v45];

  v46 = [(DBSDisplayZoomTableViewCell *)self zoomedOptionView];
  v47 = [v46 leadingAnchor];
  v48 = [v55 trailingAnchor];
  v49 = [v47 constraintEqualToAnchor:v48];
  [v8 addObject:v49];

  double v50 = [(DBSDisplayZoomTableViewCell *)self contentView];
  v51 = [v50 trailingAnchor];
  v52 = [(DBSDisplayZoomTableViewCell *)self zoomedOptionView];
  v53 = [v52 trailingAnchor];
  v54 = [v51 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v53 multiplier:2.0];
  [v8 addObject:v54];

  [MEMORY[0x263F08938] activateConstraints:v8];
}

- (id)_optionViewsByDensity
{
  v3 = objc_opt_new();
  v4 = [(DBSDisplayZoomTableViewCell *)self zoomedOptionView];

  if (v4)
  {
    v5 = [(DBSDisplayZoomTableViewCell *)self zoomedOptionView];
    [v3 addObject:v5];
  }
  id v6 = [(DBSDisplayZoomTableViewCell *)self standardOptionView];

  if (v6)
  {
    id v7 = [(DBSDisplayZoomTableViewCell *)self standardOptionView];
    [v3 addObject:v7];
  }
  id v8 = [(DBSDisplayZoomTableViewCell *)self denseOptionView];

  if (v8)
  {
    id v9 = [(DBSDisplayZoomTableViewCell *)self denseOptionView];
    [v3 addObject:v9];
  }
  id v10 = [(DBSDisplayZoomTableViewCell *)self denserOptionView];

  if (v10)
  {
    v11 = [(DBSDisplayZoomTableViewCell *)self denserOptionView];
    [v3 addObject:v11];
  }
  return v3;
}

+ (int64_t)cellStyle
{
  return 0;
}

- (void)updateSelectedViewWithOption:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v5 = [(DBSDisplayZoomTableViewCell *)self _optionViewsByDensity];
  switch(a3)
  {
    case 0uLL:
      uint64_t v6 = [(DBSDisplayZoomTableViewCell *)self standardOptionView];
      goto LABEL_7;
    case 1uLL:
      uint64_t v6 = [(DBSDisplayZoomTableViewCell *)self zoomedOptionView];
      goto LABEL_7;
    case 2uLL:
      uint64_t v6 = [(DBSDisplayZoomTableViewCell *)self denseOptionView];
      goto LABEL_7;
    case 3uLL:
      uint64_t v6 = [(DBSDisplayZoomTableViewCell *)self denserOptionView];
LABEL_7:
      id v7 = (void *)v6;
      break;
    default:
      id v7 = 0;
      break;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12), "setSelected:", *(void *)(*((void *)&v13 + 1) + 8 * v12) == (void)v7, (void)v13);
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)startAnimation
{
  v3 = [(DBSDisplayZoomTableViewCell *)self standardOptionView];
  [v3 startAnimation];

  v4 = [(DBSDisplayZoomTableViewCell *)self zoomedOptionView];
  [v4 startAnimation];

  v5 = [(DBSDisplayZoomTableViewCell *)self denseOptionView];
  [v5 startAnimation];

  id v6 = [(DBSDisplayZoomTableViewCell *)self denserOptionView];
  [v6 startAnimation];
}

- (void)stopAnimation
{
  v3 = [(DBSDisplayZoomTableViewCell *)self standardOptionView];
  [v3 stopAnimation];

  v4 = [(DBSDisplayZoomTableViewCell *)self zoomedOptionView];
  [v4 stopAnimation];

  v5 = [(DBSDisplayZoomTableViewCell *)self denseOptionView];
  [v5 stopAnimation];

  id v6 = [(DBSDisplayZoomTableViewCell *)self denserOptionView];
  [v6 stopAnimation];
}

- (void)userDidTapOnDisplayZoomOptionView:(id)a3
{
  id v7 = a3;
  v4 = [(DBSDisplayZoomTableViewCell *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(DBSDisplayZoomTableViewCell *)self delegate];
    objc_msgSend(v6, "displayZoomTableViewCell:userDidTapOnDisplayZoomOption:", self, objc_msgSend(v7, "displayZoomOption"));

    -[DBSDisplayZoomTableViewCell updateSelectedViewWithOption:](self, "updateSelectedViewWithOption:", [v7 displayZoomOption]);
  }
}

- (DBSDisplayZoomTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DBSDisplayZoomTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DBSDisplayZoomOptionView)standardOptionView
{
  return self->_standardOptionView;
}

- (void)setStandardOptionView:(id)a3
{
}

- (DBSDisplayZoomOptionView)zoomedOptionView
{
  return self->_zoomedOptionView;
}

- (void)setZoomedOptionView:(id)a3
{
}

- (DBSDisplayZoomOptionView)denseOptionView
{
  return self->_denseOptionView;
}

- (void)setDenseOptionView:(id)a3
{
}

- (DBSDisplayZoomOptionView)denserOptionView
{
  return self->_denserOptionView;
}

- (void)setDenserOptionView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_denserOptionView, 0);
  objc_storeStrong((id *)&self->_denseOptionView, 0);
  objc_storeStrong((id *)&self->_zoomedOptionView, 0);
  objc_storeStrong((id *)&self->_standardOptionView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end