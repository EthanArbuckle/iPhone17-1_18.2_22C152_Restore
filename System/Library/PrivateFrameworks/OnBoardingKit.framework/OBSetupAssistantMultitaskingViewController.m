@interface OBSetupAssistantMultitaskingViewController
- (OBSetupAssistantMultitaskingViewController)init;
- (OBSetupAssistantMultitaskingViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (OBSetupAssistantMultitaskingViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (double)_headerTopOffset;
- (double)contentViewsTopPaddingFromBottomOfHeader;
- (void)addMultitaskingBulletedListItemWithTitle:(id)a3 description:(id)a4 symbolName:(id)a5;
- (void)setupBulletedListIfNeeded;
- (void)viewDidLoad;
@end

@implementation OBSetupAssistantMultitaskingViewController

- (OBSetupAssistantMultitaskingViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)OBSetupAssistantMultitaskingViewController;
  v13 = [(OBWelcomeController *)&v17 initWithTitle:v10 detailText:v11 symbolName:v12 contentLayout:a6];
  if (v13)
  {
    v14 = [(OBHeaderView *)[OBSetupAssistantMultitaskingHeaderView alloc] initWithTitle:v10 detailText:v11 symbolName:v12];
    [(OBWelcomeController *)v13 setHeaderView:v14];

    v15 = [(OBWelcomeController *)v13 headerView];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  return v13;
}

- (OBSetupAssistantMultitaskingViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)OBSetupAssistantMultitaskingViewController;
  v13 = [(OBWelcomeController *)&v17 initWithTitle:v10 detailText:v11 icon:v12 contentLayout:a6];
  if (v13)
  {
    v14 = [(OBHeaderView *)[OBSetupAssistantMultitaskingHeaderView alloc] initWithTitle:v10 detailText:v11 icon:v12];
    [(OBWelcomeController *)v13 setHeaderView:v14];

    v15 = [(OBWelcomeController *)v13 headerView];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  return v13;
}

- (OBSetupAssistantMultitaskingViewController)init
{
  return 0;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)OBSetupAssistantMultitaskingViewController;
  [(OBBaseWelcomeController *)&v3 viewDidLoad];
  [(OBWelcomeController *)self setTemplateType:2];
}

- (void)setupBulletedListIfNeeded
{
  v45[4] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(OBWelcomeController *)self bulletedList];

  if (!v3)
  {
    v4 = objc_alloc_init(OBSetupAssistantMultitaskingBulletedList);
    [(OBWelcomeController *)self setBulletedList:v4];

    v5 = [(OBWelcomeController *)self bulletedList];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

    v6 = [(OBWelcomeController *)self contentView];
    v7 = [(OBWelcomeController *)self bulletedList];
    [v6 addSubview:v7];

    [(OBSetupAssistantMultitaskingViewController *)self contentViewsTopPaddingFromBottomOfHeader];
    double v9 = v8;
    id v10 = [(OBWelcomeController *)self contentViewTopOffsetConstraint];
    [v10 setActive:0];

    id v11 = [(OBWelcomeController *)self contentView];
    id v12 = [v11 topAnchor];
    v13 = [(OBWelcomeController *)self headerView];
    v14 = [v13 bottomAnchor];
    v15 = [v12 constraintEqualToAnchor:v14 constant:v9];
    [(OBWelcomeController *)self setContentViewTopOffsetConstraint:v15];

    v16 = [(OBWelcomeController *)self contentViewTopOffsetConstraint];
    [v16 setActive:1];

    objc_super v17 = [(OBWelcomeController *)self contentView];
    v18 = [v17 leadingAnchor];
    v19 = [(OBWelcomeController *)self bulletedList];
    v20 = [v19 leadingAnchor];
    v21 = [v18 constraintEqualToAnchor:v20];
    v22 = [(OBWelcomeController *)self bulletedList];
    [v22 setLeadingConstraint:v21];

    v23 = [(OBWelcomeController *)self contentView];
    v24 = [v23 trailingAnchor];
    v25 = [(OBWelcomeController *)self bulletedList];
    v26 = [v25 trailingAnchor];
    v27 = [v24 constraintEqualToAnchor:v26];
    v28 = [(OBWelcomeController *)self bulletedList];
    [v28 setTrailingConstraint:v27];

    v39 = (void *)MEMORY[0x1E4F28DC8];
    v44 = [(OBWelcomeController *)self bulletedList];
    v43 = [v44 leadingConstraint];
    v45[0] = v43;
    v42 = [(OBWelcomeController *)self bulletedList];
    v41 = [v42 trailingConstraint];
    v45[1] = v41;
    v40 = [(OBWelcomeController *)self contentView];
    v29 = [v40 topAnchor];
    v30 = [(OBWelcomeController *)self bulletedList];
    v31 = [v30 topAnchor];
    v32 = [v29 constraintEqualToAnchor:v31];
    v45[2] = v32;
    v33 = [(OBWelcomeController *)self contentView];
    v34 = [v33 bottomAnchor];
    v35 = [(OBWelcomeController *)self bulletedList];
    v36 = [v35 bottomAnchor];
    v37 = [v34 constraintEqualToAnchor:v36];
    v45[3] = v37;
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:4];
    [v39 activateConstraints:v38];
  }
}

- (void)addMultitaskingBulletedListItemWithTitle:(id)a3 description:(id)a4 symbolName:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(OBSetupAssistantMultitaskingViewController *)self loadViewIfNeeded];
  [(OBSetupAssistantMultitaskingViewController *)self setupBulletedListIfNeeded];
  id v11 = [(OBWelcomeController *)self bulletedList];
  [v11 addItemWithTitle:v10 description:v9 symbolName:v8];
}

- (double)_headerTopOffset
{
  objc_super v3 = +[OBDevice currentDevice];
  uint64_t v4 = [v3 type];

  if (v4 == 2)
  {
    v5 = +[OBDevice currentDevice];
    char v6 = [v5 isMiniPad];

    double v7 = 0.0;
    if ((v6 & 1) == 0)
    {
      id v8 = [(OBSetupAssistantMultitaskingViewController *)self view];
      [v8 bounds];
      double v7 = v9 * 0.045;
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)OBSetupAssistantMultitaskingViewController;
    [(OBWelcomeController *)&v12 _headerTopOffset];
    return v10;
  }
  return v7;
}

- (double)contentViewsTopPaddingFromBottomOfHeader
{
  objc_super v3 = +[OBDevice currentDevice];
  uint64_t v4 = [v3 templateType];

  double result = 22.0;
  if (v4 != 6)
  {
    v6.receiver = self;
    v6.super_class = (Class)OBSetupAssistantMultitaskingViewController;
    [(OBWelcomeController *)&v6 contentViewsTopPaddingFromBottomOfHeader];
  }
  return result;
}

@end