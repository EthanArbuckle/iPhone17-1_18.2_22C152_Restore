@interface PUTopPeopleWallpaperSuggestionsDebugSettingsViewController
- (PUTopPeopleWallpaperSuggestionsDebugSettingsViewController)initWithDelegate:(id)a3;
- (PUTopPeopleWallpaperSuggestionsDebugSettingsViewControllerDelegate)delegate;
- (void)_close:(id)a3;
- (void)_switchSettings:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation PUTopPeopleWallpaperSuggestionsDebugSettingsViewController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_distancingSettingsView, 0);
  objc_storeStrong((id *)&self->_scoringSettingsView, 0);
  objc_storeStrong((id *)&self->_filteringSettingsView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
}

- (void)setDelegate:(id)a3
{
}

- (PUTopPeopleWallpaperSuggestionsDebugSettingsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUTopPeopleWallpaperSuggestionsDebugSettingsViewControllerDelegate *)WeakRetained;
}

- (void)_close:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __69__PUTopPeopleWallpaperSuggestionsDebugSettingsViewController__close___block_invoke;
  v3[3] = &unk_1E5F2ED10;
  v3[4] = self;
  [(PUTopPeopleWallpaperSuggestionsDebugSettingsViewController *)self dismissViewControllerAnimated:1 completion:v3];
}

void __69__PUTopPeopleWallpaperSuggestionsDebugSettingsViewController__close___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1024));
  [WeakRetained settingsDidDismiss];
}

- (void)_switchSettings:(id)a3
{
  NSInteger v4 = [(UISegmentedControl *)self->_segmentedControl selectedSegmentIndex];
  [(UIView *)self->_filteringSettingsView setHidden:v4 != 0];
  [(UIView *)self->_scoringSettingsView setHidden:v4 != 1];
  distancingSettingsView = self->_distancingSettingsView;
  [(UIView *)distancingSettingsView setHidden:v4 != 2];
}

- (void)viewDidLoad
{
  v56.receiver = self;
  v56.super_class = (Class)PUTopPeopleWallpaperSuggestionsDebugSettingsViewController;
  [(PUTopPeopleWallpaperSuggestionsDebugSettingsViewController *)&v56 viewDidLoad];
  v3 = [(PUTopPeopleWallpaperSuggestionsDebugSettingsViewController *)self view];
  [v3 setAutoresizingMask:18];

  NSInteger v4 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  v5 = [(PUTopPeopleWallpaperSuggestionsDebugSettingsViewController *)self view];
  [v5 setBackgroundColor:v4];

  v6 = [(PUTopPeopleWallpaperSuggestionsDebugSettingsViewController *)self navigationController];
  [v6 setToolbarHidden:1 animated:0];

  v7 = [MEMORY[0x1E4FB14D0] buttonWithType:7];
  closeButton = self->_closeButton;
  self->_closeButton = v7;

  [(UIButton *)self->_closeButton addTarget:self action:sel__close_ forControlEvents:64];
  [(UIButton *)self->_closeButton setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v9) = 1132134400;
  [(UIButton *)self->_closeButton setContentHuggingPriority:0 forAxis:v9];
  LODWORD(v10) = 1132134400;
  [(UIButton *)self->_closeButton setContentHuggingPriority:1 forAxis:v10];
  v11 = [(PUTopPeopleWallpaperSuggestionsDebugSettingsViewController *)self view];
  [v11 addSubview:self->_closeButton];

  v12 = [(UIButton *)self->_closeButton topAnchor];
  v13 = [(PUTopPeopleWallpaperSuggestionsDebugSettingsViewController *)self view];
  v14 = [v13 safeAreaLayoutGuide];
  v15 = [v14 topAnchor];
  v16 = [v12 constraintEqualToAnchor:v15 constant:16.0];
  [v16 setActive:1];

  v17 = (UISegmentedControl *)[objc_alloc(MEMORY[0x1E4FB1C10]) initWithItems:&unk_1F078AB50];
  segmentedControl = self->_segmentedControl;
  self->_segmentedControl = v17;

  [(UISegmentedControl *)self->_segmentedControl addTarget:self action:sel__switchSettings_ forControlEvents:4096];
  [(UISegmentedControl *)self->_segmentedControl setSelectedSegmentIndex:0];
  [(UISegmentedControl *)self->_segmentedControl setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v19) = 1132134400;
  [(UISegmentedControl *)self->_segmentedControl setContentHuggingPriority:0 forAxis:v19];
  LODWORD(v20) = 1132134400;
  [(UISegmentedControl *)self->_segmentedControl setContentHuggingPriority:1 forAxis:v20];
  v21 = [(PUTopPeopleWallpaperSuggestionsDebugSettingsViewController *)self view];
  [v21 addSubview:self->_segmentedControl];

  v22 = [(UISegmentedControl *)self->_segmentedControl topAnchor];
  v23 = [(PUTopPeopleWallpaperSuggestionsDebugSettingsViewController *)self view];
  v24 = [v23 safeAreaLayoutGuide];
  v25 = [v24 topAnchor];
  v26 = [v22 constraintEqualToAnchor:v25 constant:16.0];
  [v26 setActive:1];

  v27 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  contentView = self->_contentView;
  self->_contentView = v27;

  [(UIView *)self->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
  v29 = [(PUTopPeopleWallpaperSuggestionsDebugSettingsViewController *)self view];
  [v29 addSubview:self->_contentView];

  id v30 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v30 setTranslatesAutoresizingMaskIntoConstraints:0];
  v31 = [(PUTopPeopleWallpaperSuggestionsDebugSettingsViewController *)self view];
  [v31 addSubview:v30];

  id v32 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v32 setTranslatesAutoresizingMaskIntoConstraints:0];
  v33 = [(PUTopPeopleWallpaperSuggestionsDebugSettingsViewController *)self view];
  [v33 addSubview:v32];

  v34 = _NSDictionaryOfVariableBindings(&cfstr_Spacer1Segment.isa, v30, self->_segmentedControl, v32, self->_closeButton, self->_contentView, 0);
  v35 = [(PUTopPeopleWallpaperSuggestionsDebugSettingsViewController *)self view];
  v36 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-16-[_segmentedControl(<=31)]-10-[_contentView]-0-|" options:0 metrics:0 views:v34];
  [v35 addConstraints:v36];

  v37 = [(PUTopPeopleWallpaperSuggestionsDebugSettingsViewController *)self view];
  v38 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-[spacer1]-[_segmentedControl]-[spacer2(==spacer1)]-[_closeButton]-|" options:0 metrics:0 views:v34];
  [v37 addConstraints:v38];

  v39 = [(PUTopPeopleWallpaperSuggestionsDebugSettingsViewController *)self view];
  v40 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[_contentView]|" options:0 metrics:0 views:v34];
  [v39 addConstraints:v40];

  v41 = [PUTopPeopleWallpaperSuggesterDebugSettingsFilteringSettingsView alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v43 = [WeakRetained filteringContext];
  v44 = [(PUTopPeopleWallpaperSuggesterDebugSettingsFilteringSettingsView *)v41 initWithFilteringContext:v43];
  filteringSettingsView = self->_filteringSettingsView;
  self->_filteringSettingsView = v44;

  [(UIView *)self->_contentView bounds];
  -[UIView setFrame:](self->_filteringSettingsView, "setFrame:");
  [(UIView *)self->_filteringSettingsView setAutoresizingMask:18];
  v46 = [PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView alloc];
  id v47 = objc_loadWeakRetained((id *)&self->_delegate);
  v48 = [v47 scoringContext];
  v49 = [(PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView *)v46 initWithScoringContext:v48];
  scoringSettingsView = self->_scoringSettingsView;
  self->_scoringSettingsView = v49;

  [(UIView *)self->_contentView bounds];
  -[UIView setFrame:](self->_scoringSettingsView, "setFrame:");
  [(UIView *)self->_scoringSettingsView setAutoresizingMask:18];
  v51 = [PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView alloc];
  id v52 = objc_loadWeakRetained((id *)&self->_delegate);
  v53 = [v52 distancingContext];
  v54 = [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v51 initWithDistancingContext:v53];
  distancingSettingsView = self->_distancingSettingsView;
  self->_distancingSettingsView = v54;

  [(UIView *)self->_contentView bounds];
  -[UIView setFrame:](self->_distancingSettingsView, "setFrame:");
  [(UIView *)self->_distancingSettingsView setAutoresizingMask:18];
  [(UIView *)self->_contentView addSubview:self->_filteringSettingsView];
  [(UIView *)self->_contentView addSubview:self->_scoringSettingsView];
  [(UIView *)self->_contentView addSubview:self->_distancingSettingsView];
  [(PUTopPeopleWallpaperSuggestionsDebugSettingsViewController *)self _switchSettings:0];
}

- (PUTopPeopleWallpaperSuggestionsDebugSettingsViewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PUTopPeopleWallpaperSuggestionsDebugSettingsViewController;
  v5 = [(PUTopPeopleWallpaperSuggestionsDebugSettingsViewController *)&v8 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

@end