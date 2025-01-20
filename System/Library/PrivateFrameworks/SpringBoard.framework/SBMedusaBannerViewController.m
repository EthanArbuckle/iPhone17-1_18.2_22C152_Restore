@interface SBMedusaBannerViewController
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (SBMedusaBannerViewController)initWithType:(int64_t)a3 orientation:(int64_t)a4 peekConfiguration:(int64_t)a5;
- (id)_bannerView;
- (void)viewDidLoad;
@end

@implementation SBMedusaBannerViewController

- (SBMedusaBannerViewController)initWithType:(int64_t)a3 orientation:(int64_t)a4 peekConfiguration:(int64_t)a5
{
  v11.receiver = self;
  v11.super_class = (Class)SBMedusaBannerViewController;
  v8 = [(SBMedusaBannerViewController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    v8->_orientation = a4;
    v8->_peekConfiguration = a5;
    [(SBMedusaBannerViewController *)v8 loadViewIfNeeded];
    [(PLPillView *)v9->_pillView intrinsicContentSize];
    -[SBMedusaBannerViewController setPreferredContentSize:](v9, "setPreferredContentSize:");
  }
  return v9;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)SBMedusaBannerViewController;
  [(SBMedusaBannerViewController *)&v5 viewDidLoad];
  v3 = [(SBMedusaBannerViewController *)self view];
  v4 = [(SBMedusaBannerViewController *)self _bannerView];
  [v3 addSubview:v4];
  [v3 bounds];
  objc_msgSend(v4, "setFrame:");
  [v4 setAutoresizingMask:18];
}

- (id)_bannerView
{
  v43[2] = *MEMORY[0x1E4F143B8];
  pillView = self->_pillView;
  if (!pillView)
  {
    int64_t peekConfiguration = self->_peekConfiguration;
    if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = 2;
    }
    switch(self->_type)
    {
      case 0:
        v6 = [MEMORY[0x1E4F28B50] mainBundle];
        uint64_t v7 = [v6 localizedStringForKey:@"MEDUSA_BANNER_EDUCATION_TITLE_SPLIT" value:&stru_1F3084718 table:@"SpringBoard"];

        v8 = [MEMORY[0x1E4F28B50] mainBundle];
        v9 = [v8 localizedStringForKey:@"MEDUSA_BANNER_EDUCATION_DESCRIPTION" value:&stru_1F3084718 table:@"SpringBoard"];

        if ((unint64_t)(self->_orientation - 1) > 1)
        {
          v10 = @"rectangle.righthalf.inset.fill";
          objc_super v11 = @"rectangle.lefthalf.inset.fill";
        }
        else
        {
          v10 = @"rectangle.portrait.righthalf.inset.filled";
          objc_super v11 = @"rectangle.portrait.lefthalf.inset.filled";
        }
        if (peekConfiguration == v5) {
          v10 = v11;
        }
        v13 = v10;
        v12 = (void *)v7;
        break;
      case 1:
        v14 = @"rectangle.rightthird.inset.fill";
        if (peekConfiguration == v5) {
          v14 = @"rectangle.leftthird.inset.fill";
        }
        v15 = @"rectangle.portrait.leftthird.inset.filled";
        if (peekConfiguration != v5) {
          v15 = @"rectangle.portrait.rightthird.inset.filled";
        }
        if ((unint64_t)(self->_orientation - 1) >= 2) {
          v16 = v14;
        }
        else {
          v16 = v15;
        }
        v13 = v16;
        v17 = [MEMORY[0x1E4F28B50] mainBundle];
        uint64_t v18 = [v17 localizedStringForKey:@"MEDUSA_BANNER_EDUCATION_TITLE_SLIDE_OVER" value:&stru_1F3084718 table:@"SpringBoard"];

        v12 = (void *)v18;
        v19 = [MEMORY[0x1E4F28B50] mainBundle];
        v9 = [v19 localizedStringForKey:@"MEDUSA_BANNER_EDUCATION_DESCRIPTION" value:&stru_1F3084718 table:@"SpringBoard"];

        break;
      case 2:
        v20 = [MEMORY[0x1E4F28B50] mainBundle];
        uint64_t v21 = [v20 localizedStringForKey:@"MEDUSA_BANNER_ERROR_TITLE_SPLIT_VIEW" value:&stru_1F3084718 table:@"SpringBoard"];

        v22 = [MEMORY[0x1E4F28B50] mainBundle];
        v9 = [v22 localizedStringForKey:@"MEDUSA_BANNER_ERROR_SUBTITLE" value:&stru_1F3084718 table:@"SpringBoard"];

        v12 = (void *)v21;
        v13 = @"rectangle.split.2x1.slash";
        break;
      case 3:
        v23 = [MEMORY[0x1E4F28B50] mainBundle];
        uint64_t v24 = [v23 localizedStringForKey:@"MEDUSA_BANNER_ERROR_TITLE_MULTIPLE_WINDOWS" value:&stru_1F3084718 table:@"SpringBoard"];

        v25 = [MEMORY[0x1E4F28B50] mainBundle];
        v9 = [v25 localizedStringForKey:@"MEDUSA_BANNER_ERROR_SUBTITLE" value:&stru_1F3084718 table:@"SpringBoard"];

        v12 = (void *)v24;
        v13 = @"rectangle.on.rectangle.slash";
        break;
      default:
        v9 = 0;
        v12 = 0;
        v13 = 0;
        break;
    }
    v41 = v13;
    v42 = [MEMORY[0x1E4F42A98] configurationWithPointSize:5 weight:15.0];
    v26 = [MEMORY[0x1E4F42A80] systemImageNamed:v13 withConfiguration:v42];
    v40 = [v26 imageWithRenderingMode:2];

    v27 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v40];
    id v28 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [v27 bounds];
    v29 = objc_msgSend(v28, "initWithFrame:");
    v30 = (PLPillView *)[objc_alloc(MEMORY[0x1E4F91450]) initWithLeadingAccessoryView:v27 trailingAccessoryView:v29];
    v31 = self->_pillView;
    self->_pillView = v30;

    v32 = self->_pillView;
    v33 = [MEMORY[0x1E4F428B8] labelColor];
    [(PLPillView *)v32 setTintColor:v33];

    v34 = self->_pillView;
    v35 = (void *)[objc_alloc(MEMORY[0x1E4F91440]) initWithText:v12 style:1];
    v43[0] = v35;
    v36 = (void *)[objc_alloc(MEMORY[0x1E4F91440]) initWithText:v9 style:2];
    v43[1] = v36;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
    v38 = v37 = v12;
    [(PLPillView *)v34 setCenterContentItems:v38];

    pillView = self->_pillView;
  }
  return pillView;
}

- (NSString)requesterIdentifier
{
  return (NSString *)@"com.apple.SpringBoard.Medusa";
}

- (NSString)requestIdentifier
{
  return (NSString *)@"Medusa";
}

- (void).cxx_destruct
{
}

@end