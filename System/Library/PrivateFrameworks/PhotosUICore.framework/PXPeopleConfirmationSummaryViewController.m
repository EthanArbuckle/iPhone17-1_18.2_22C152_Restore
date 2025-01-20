@interface PXPeopleConfirmationSummaryViewController
- (NSLayoutConstraint)labelSpacingConstraint;
- (PXPeopleConfirmationSummaryViewController)initWithDelegate:(id)a3;
- (PXPeopleScalableAvatarView)avatarView;
- (PXPeopleSummaryDelegate)delegate;
- (PXPerson)person;
- (UILabel)summaryLabel;
- (void)_updateDynamicTypeSpacing;
- (void)dealloc;
- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PXPeopleConfirmationSummaryViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_summaryLabel, 0);
  objc_storeStrong((id *)&self->_labelSpacingConstraint, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (PXPerson)person
{
  return self->_person;
}

- (PXPeopleScalableAvatarView)avatarView
{
  return self->_avatarView;
}

- (UILabel)summaryLabel
{
  return self->_summaryLabel;
}

- (NSLayoutConstraint)labelSpacingConstraint
{
  return self->_labelSpacingConstraint;
}

- (PXPeopleSummaryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXPeopleSummaryDelegate *)WeakRetained;
}

- (void)_updateDynamicTypeSpacing
{
  v3 = [(PXPeopleConfirmationSummaryViewController *)self summaryLabel];
  id v7 = [v3 font];

  [v7 _scaledValueForValue:28.0];
  *(float *)&double v4 = v4;
  double v5 = ceilf(*(float *)&v4);
  v6 = [(PXPeopleConfirmationSummaryViewController *)self labelSpacingConstraint];
  [v6 setConstant:v5];
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    [v6 displayScale];
    double v9 = v8;
  }
  else
  {
    v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v10 scale];
    double v9 = v11;
  }
  v12 = [(PXPeopleConfirmationSummaryViewController *)self traitCollection];
  [v12 displayScale];
  double v14 = v13;

  if (v14 != v9) {
    [(PXPeopleConfirmationSummaryViewController *)self _updateDynamicTypeSpacing];
  }
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PXPeopleConfirmationSummaryViewController;
  [(PXPeopleConfirmationSummaryViewController *)&v5 viewDidLayoutSubviews];
  v3 = [(PXPeopleConfirmationSummaryViewController *)self person];
  double v4 = [(PXPeopleConfirmationSummaryViewController *)self avatarView];
  [v4 setPerson:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)PXPeopleConfirmationSummaryViewController;
  [(PXPeopleConfirmationSummaryViewController *)&v15 viewWillAppear:a3];
  double v4 = [(PXPeopleConfirmationSummaryViewController *)self delegate];
  objc_super v5 = [v4 personForSummaryViewController:self];
  id v6 = objc_msgSend(v5, "px_longStyleLocalizedName");
  id v7 = [v6 stringByReplacingOccurrencesOfString:@" " withString:@" "];

  uint64_t v8 = [v4 userConfirmedCountForSummaryViewController:self];
  uint64_t v9 = [v4 autoConfirmedCountForSummaryViewController:self] + v8;
  uint64_t v10 = [v7 length];
  double v11 = [(PXPeopleConfirmationSummaryViewController *)self summaryLabel];
  if (v10) {
    PXLocalizedStringFromTable(@"PXPeopleConfirmSummaryTotalNamedMessage", @"PhotosUICore");
  }
  else {
  v12 = PXLocalizedStringFromTable(@"PXPeopleConfirmSummaryTotalUnnamedMessage", @"PhotosUICore");
  }
  uint64_t v14 = v9;
  double v13 = PXStringWithValidatedFormat();
  objc_msgSend(v11, "setText:", v13, v14);
}

- (void)viewDidLoad
{
  v27.receiver = self;
  v27.super_class = (Class)PXPeopleConfirmationSummaryViewController;
  [(PXPeopleConfirmationSummaryViewController *)&v27 viewDidLoad];
  v3 = [(PXPeopleConfirmationSummaryViewController *)self view];
  double v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  id v5 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  id v6 = -[PXPeopleScalableAvatarView initWithFrame:]([PXPeopleScalableAvatarView alloc], "initWithFrame:", 0.0, 0.0, 500.0, 500.0);
  avatarView = self->_avatarView;
  self->_avatarView = v6;
  uint64_t v8 = v6;

  uint64_t v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(UILabel *)v9 setNumberOfLines:2];
  uint64_t v10 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(UILabel *)v9 setFont:v10];

  [(UILabel *)v9 setAdjustsFontForContentSizeCategory:1];
  [(UILabel *)v9 setTextAlignment:1];
  summaryLabel = self->_summaryLabel;
  self->_summaryLabel = v9;
  v12 = v9;

  [v5 addSubview:v8];
  [v5 addSubview:v12];
  [v3 addSubview:v5];
  [(PXPeopleScalableAvatarView *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v13 = _NSDictionaryOfVariableBindings(&cfstr_AvatarSummaryl.isa, v8, v12, v5, 0);
  uint64_t v14 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:[summaryLabel]-|" options:512 metrics:0 views:v13];
  [v5 addConstraints:v14];

  objc_super v15 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-[summaryLabel]-|" options:1024 metrics:0 views:v13];
  [v5 addConstraints:v15];

  v16 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[containerView]|" options:1024 metrics:0 views:v13];
  [v3 addConstraints:v16];

  v17 = [MEMORY[0x1E4F28DC8] constraintWithItem:v8 attribute:7 relatedBy:0 toItem:v8 attribute:8 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v17];

  v18 = [MEMORY[0x1E4F28DC8] constraintWithItem:v8 attribute:8 relatedBy:0 toItem:v3 attribute:8 multiplier:0.25 constant:0.0];
  [v3 addConstraint:v18];

  v19 = [MEMORY[0x1E4F28DC8] constraintWithItem:v5 attribute:10 relatedBy:0 toItem:v3 attribute:10 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v19];

  v20 = [MEMORY[0x1E4F28DC8] constraintWithItem:v5 attribute:9 relatedBy:0 toItem:v8 attribute:9 multiplier:1.0 constant:0.0];
  [v5 addConstraint:v20];

  v21 = [MEMORY[0x1E4F28DC8] constraintWithItem:v12 attribute:11 relatedBy:0 toItem:v8 attribute:4 multiplier:1.0 constant:28.0];
  [v5 addConstraint:v21];
  labelSpacingConstraint = self->_labelSpacingConstraint;
  self->_labelSpacingConstraint = v21;
  v23 = v21;

  v24 = [(PXPeopleConfirmationSummaryViewController *)self delegate];
  v25 = [v24 personForSummaryViewController:self];

  [(PXPeopleScalableAvatarView *)v8 setPerson:v25];
  person = self->_person;
  self->_person = v25;

  [(PXPeopleConfirmationSummaryViewController *)self _updateDynamicTypeSpacing];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB27A8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)PXPeopleConfirmationSummaryViewController;
  [(PXPeopleConfirmationSummaryViewController *)&v4 dealloc];
}

- (PXPeopleConfirmationSummaryViewController)initWithDelegate:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXPeopleConfirmationSummaryViewController;
  id v6 = [(PXPeopleConfirmationSummaryViewController *)&v12 init];
  if (v6)
  {
    if (!v5)
    {
      double v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:v6 file:@"PXPeopleConfirmationSummaryViewController.m" lineNumber:42 description:@"summary delegate must not be nil"];
    }
    objc_storeWeak((id *)&v6->_delegate, v5);
    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v6 selector:sel_contentSizeCategoryDidChangeNotification_ name:*MEMORY[0x1E4FB27A8] object:0];

    v13[0] = objc_opt_class();
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    id v9 = (id)[(PXPeopleConfirmationSummaryViewController *)v6 registerForTraitChanges:v8 withAction:sel_traitEnvironment_didChangeTraitCollection_];
  }
  return v6;
}

@end