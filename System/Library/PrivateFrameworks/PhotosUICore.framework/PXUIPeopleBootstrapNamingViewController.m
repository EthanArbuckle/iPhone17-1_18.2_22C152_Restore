@interface PXUIPeopleBootstrapNamingViewController
- (BOOL)textDidChange;
- (BOOL)wantsCancelButton;
- (NSLayoutConstraint)pickerBackgroundViewHeightConstraint;
- (PHPerson)person;
- (PXPeopleBootstrapContext)bootstrapContext;
- (PXPeopleFlowViewControllerActionDelegate)actionDelegate;
- (PXPeopleNamePickerViewController)namePicker;
- (PXPeopleNameSelection)selection;
- (PXUIPeopleBootstrapNamingViewController)initWithContext:(id)a3;
- (UIView)pickerBackgroundView;
- (id)_localizedTitleString;
- (unint64_t)type;
- (void)_captureStringSelectionIfNeeded;
- (void)_updateNavigationBarForCurrentTraitCollection;
- (void)namePickerController:(id)a3 didPickContact:(id)a4;
- (void)namePickerController:(id)a3 didPickPerson:(id)a4;
- (void)namePickerController:(id)a3 didPickString:(id)a4;
- (void)namePickerControllerWillChangeText:(id)a3;
- (void)setActionDelegate:(id)a3;
- (void)setNamePicker:(id)a3;
- (void)setPickerBackgroundView:(id)a3;
- (void)setPickerBackgroundViewHeightConstraint:(id)a3;
- (void)setSelection:(id)a3;
- (void)setTextDidChange:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)willTransitionToNextInFlow;
@end

@implementation PXUIPeopleBootstrapNamingViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerBackgroundViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_pickerBackgroundView, 0);
  objc_storeStrong((id *)&self->_selection, 0);
  objc_storeStrong((id *)&self->_namePicker, 0);
  objc_destroyWeak((id *)&self->actionDelegate);
  objc_storeStrong((id *)&self->_bootstrapContext, 0);
}

- (void)setTextDidChange:(BOOL)a3
{
  self->_textDidChange = a3;
}

- (BOOL)textDidChange
{
  return self->_textDidChange;
}

- (void)setPickerBackgroundViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)pickerBackgroundViewHeightConstraint
{
  return self->_pickerBackgroundViewHeightConstraint;
}

- (void)setPickerBackgroundView:(id)a3
{
}

- (UIView)pickerBackgroundView
{
  return self->_pickerBackgroundView;
}

- (void)setSelection:(id)a3
{
}

- (PXPeopleNameSelection)selection
{
  return self->_selection;
}

- (void)setNamePicker:(id)a3
{
}

- (PXPeopleNamePickerViewController)namePicker
{
  return self->_namePicker;
}

- (void)setActionDelegate:(id)a3
{
}

- (PXPeopleFlowViewControllerActionDelegate)actionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->actionDelegate);
  return (PXPeopleFlowViewControllerActionDelegate *)WeakRetained;
}

- (PXPeopleBootstrapContext)bootstrapContext
{
  return self->_bootstrapContext;
}

- (void)namePickerControllerWillChangeText:(id)a3
{
  [(PXUIPeopleBootstrapNamingViewController *)self setSelection:0];
  [(PXUIPeopleBootstrapNamingViewController *)self setTextDidChange:1];
}

- (void)namePickerController:(id)a3 didPickString:(id)a4
{
  id v5 = a4;
  v6 = [[PXPeopleNameSelection alloc] initWithName:v5];
  [(PXUIPeopleBootstrapNamingViewController *)self setSelection:v6];

  v7 = [(PXUIPeopleBootstrapNamingViewController *)self namePicker];
  id v8 = [v7 titleView];

  [v8 setLocalizedName:v5];
  [v8 finishEditing];
}

- (void)namePickerController:(id)a3 didPickContact:(id)a4
{
  id v11 = a4;
  id v5 = [[PXPeopleNameSelection alloc] initWithContact:v11];
  [(PXUIPeopleBootstrapNamingViewController *)self setSelection:v5];

  v6 = [v11 identifier];
  if (v6)
  {
    v7 = [(PXUIPeopleBootstrapNamingViewController *)self namePicker];
    id v8 = [v7 titleView];

    v9 = objc_msgSend(MEMORY[0x1E4F391F0], "px_localizedNameFromContact:", v11);
    [v8 setLocalizedName:v9];
    [v8 finishEditing];
  }
  v10 = [(PXUIPeopleBootstrapNamingViewController *)self actionDelegate];
  [v10 requestAdvanceToNextInFlow];
}

- (void)namePickerController:(id)a3 didPickPerson:(id)a4
{
  id v10 = a4;
  id v5 = [[PXPeopleNameSelection alloc] initWithSelectedPerson:v10];
  [(PXUIPeopleBootstrapNamingViewController *)self setSelection:v5];

  if (v10)
  {
    v6 = [(PXUIPeopleBootstrapNamingViewController *)self namePicker];
    v7 = [v6 titleView];

    id v8 = objc_msgSend(v10, "px_localizedName");
    [v7 setLocalizedName:v8];

    [v7 finishEditing];
  }
  v9 = [(PXUIPeopleBootstrapNamingViewController *)self actionDelegate];
  [v9 requestAdvanceToNextInFlow];
}

- (void)willTransitionToNextInFlow
{
  id v7 = [(PXUIPeopleBootstrapNamingViewController *)self namePicker];
  v3 = [v7 titleView];
  v4 = [v3 nameField];
  [v4 resignFirstResponder];

  [v7 endNamingSession];
  [(PXUIPeopleBootstrapNamingViewController *)self _captureStringSelectionIfNeeded];
  id v5 = [(PXUIPeopleBootstrapNamingViewController *)self selection];
  v6 = [(PXUIPeopleBootstrapNamingViewController *)self bootstrapContext];
  [v6 setNameSelection:v5];
}

- (BOOL)wantsCancelButton
{
  return 0;
}

- (void)_captureStringSelectionIfNeeded
{
  if ([(PXUIPeopleBootstrapNamingViewController *)self textDidChange])
  {
    v3 = [(PXUIPeopleBootstrapNamingViewController *)self selection];

    if (!v3)
    {
      id v8 = [(PXUIPeopleBootstrapNamingViewController *)self namePicker];
      v4 = [v8 titleView];
      id v5 = [v4 nameField];
      v6 = [v5 text];

      id v7 = [[PXPeopleNameSelection alloc] initWithName:v6];
      [(PXUIPeopleBootstrapNamingViewController *)self setSelection:v7];
    }
  }
}

- (id)_localizedTitleString
{
  unint64_t v2 = [(PXUIPeopleBootstrapNamingViewController *)self type];
  if (v2 > 2) {
    v3 = @"PXPeopleAddNameNoPlus";
  }
  else {
    v3 = off_1E5DAF318[v2];
  }
  v4 = PXLocalizedStringFromTable(v3, @"PhotosUICore");
  return v4;
}

- (void)_updateNavigationBarForCurrentTraitCollection
{
  id v3 = [(PXUIPeopleBootstrapNamingViewController *)self _localizedTitleString];
  [(PXUIPeopleBootstrapNamingViewController *)self setTitle:v3];
}

- (unint64_t)type
{
  unint64_t v2 = [(PXUIPeopleBootstrapNamingViewController *)self bootstrapContext];
  unint64_t v3 = [v2 bootstrapType];

  return v3;
}

- (PHPerson)person
{
  unint64_t v2 = [(PXUIPeopleBootstrapNamingViewController *)self bootstrapContext];
  unint64_t v3 = [v2 sourcePerson];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (PHPerson *)v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXUIPeopleBootstrapNamingViewController;
  [(PXUIPeopleBootstrapNamingViewController *)&v4 traitCollectionDidChange:a3];
  [(PXUIPeopleBootstrapNamingViewController *)self _updateNavigationBarForCurrentTraitCollection];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXUIPeopleBootstrapNamingViewController;
  [(PXUIPeopleBootstrapNamingViewController *)&v7 viewDidAppear:a3];
  objc_super v4 = [(PXUIPeopleBootstrapNamingViewController *)self namePicker];
  id v5 = [v4 titleView];
  v6 = [v5 nameField];
  [v6 becomeFirstResponder];
}

- (void)viewDidLoad
{
  v62[11] = *MEMORY[0x1E4F143B8];
  v61.receiver = self;
  v61.super_class = (Class)PXUIPeopleBootstrapNamingViewController;
  [(PXUIPeopleBootstrapNamingViewController *)&v61 viewDidLoad];
  unint64_t v3 = [(PXUIPeopleBootstrapNamingViewController *)self namePicker];
  [(PXUIPeopleBootstrapNamingViewController *)self addChildViewController:v3];
  [v3 didMoveToParentViewController:self];
  objc_super v4 = [v3 titleView];
  v59 = self;
  id v5 = [(PXUIPeopleBootstrapNamingViewController *)self view];
  v60 = [v3 view];
  [v5 addSubview:v60];
  [v3 adjustForAccessoryViewYOffset:80.0];
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  v58 = v3;
  objc_super v7 = [v3 resultsController];
  id v8 = [v7 tableView];
  v9 = [v8 backgroundColor];
  [v6 setBackgroundColor:v9];

  [v5 addSubview:v6];
  [(PXUIPeopleBootstrapNamingViewController *)self setPickerBackgroundView:v6];
  id v10 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v5 addSubview:v10];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v11 = [v3 resultsController];
  v12 = [v11 tableView];
  v13 = [v12 separatorColor];
  [v10 setBackgroundColor:v13];

  [v6 addSubview:v4];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v14 = [v5 leadingAnchor];
  uint64_t v15 = [v5 trailingAnchor];
  v16 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v16 scale];
  double v18 = 1.0 / v17;

  v57 = [v6 heightAnchor];
  v56 = [v57 constraintEqualToConstant:80.0];
  v62[0] = v56;
  v54 = [v4 centerYAnchor];
  v53 = [v6 centerYAnchor];
  v51 = [v54 constraintEqualToAnchor:v53];
  v62[1] = v51;
  v49 = [v6 topAnchor];
  v50 = [v5 safeAreaLayoutGuide];
  v48 = [v50 topAnchor];
  v46 = [v49 constraintEqualToAnchor:v48];
  v62[2] = v46;
  v55 = v4;
  v43 = [v4 leadingAnchor];
  v47 = v5;
  v44 = [v5 safeAreaLayoutGuide];
  v42 = [v44 leadingAnchor];
  v40 = [v43 constraintEqualToAnchor:v42];
  v62[3] = v40;
  v39 = [v10 leadingAnchor];
  v52 = (void *)v14;
  v38 = [v39 constraintEqualToAnchor:v14];
  v62[4] = v38;
  v37 = [v6 leadingAnchor];
  v36 = [v37 constraintEqualToAnchor:v14];
  v62[5] = v36;
  v33 = [v4 trailingAnchor];
  v34 = [v5 safeAreaLayoutGuide];
  v32 = [v34 trailingAnchor];
  v31 = [v33 constraintEqualToAnchor:v32];
  v62[6] = v31;
  v19 = [v10 trailingAnchor];
  v41 = (void *)v15;
  v20 = [v19 constraintEqualToAnchor:v15];
  v62[7] = v20;
  v45 = v10;
  v21 = [v10 bottomAnchor];
  v22 = [v6 bottomAnchor];
  v23 = [v21 constraintEqualToAnchor:v22];
  v62[8] = v23;
  v24 = [v10 heightAnchor];
  v25 = [v24 constraintEqualToConstant:v18];
  v62[9] = v25;
  v26 = [v6 trailingAnchor];
  v27 = [v26 constraintEqualToAnchor:v15];
  v62[10] = v27;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:11];

  [MEMORY[0x1E4F28DC8] activateConstraints:v35];
  v28 = [v58 resultsController];
  v29 = [v28 tableView];
  v30 = [v29 backgroundColor];
  [v47 setBackgroundColor:v30];

  [(PXUIPeopleBootstrapNamingViewController *)v59 _updateNavigationBarForCurrentTraitCollection];
}

- (PXUIPeopleBootstrapNamingViewController)initWithContext:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXUIPeopleBootstrapNamingViewController;
  id v6 = [(PXUIPeopleBootstrapNamingViewController *)&v16 init];
  objc_super v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bootstrapContext, a3);
    id v8 = [v5 face];
    v9 = [PXPeopleNamePickerViewController alloc];
    id v10 = v9;
    if (v8)
    {
      uint64_t v11 = [(PXPeopleNamePickerViewController *)v9 initWithFace:v8];
      namePicker = v7->_namePicker;
      v7->_namePicker = (PXPeopleNamePickerViewController *)v11;
    }
    else
    {
      namePicker = [(PXUIPeopleBootstrapNamingViewController *)v7 person];
      uint64_t v13 = [(PXPeopleNamePickerViewController *)v10 initWithPerson:namePicker];
      uint64_t v14 = v7->_namePicker;
      v7->_namePicker = (PXPeopleNamePickerViewController *)v13;
    }
    [(PXPeopleNamePickerViewController *)v7->_namePicker setDelegate:v7];
  }
  return v7;
}

@end