@interface SBProductivityGestureEducationPillViewController
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (NSURL)actionURL;
- (SBProductivityGestureEducationItem)item;
- (SBProductivityGestureEducationPillViewController)initWithItem:(id)a3;
- (SBProductivityGestureEducationPillViewControllerDelegate)delegate;
- (id)_pillActionContentItem;
- (id)_pillLeadingImageView;
- (id)_pillTitleContentItem;
- (id)_titleForItemType:(int64_t)a3;
- (id)_titleKeyForEducationType:(int64_t)a3;
- (id)_titleString;
- (id)presentableDescription;
- (int64_t)presentableBehavior;
- (void)_handleSingleTap:(id)a3;
- (void)_marqueeStarted:(id)a3;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillAppearAsBanner:(id)a3;
- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation SBProductivityGestureEducationPillViewController

- (SBProductivityGestureEducationPillViewController)initWithItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBProductivityGestureEducationPillViewController;
  v6 = [(SBProductivityGestureEducationPillViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_item, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)SBProductivityGestureEducationPillViewController;
  [(SBProductivityGestureEducationPillViewController *)&v15 viewDidLoad];
  v3 = [(SBProductivityGestureEducationPillViewController *)self view];
  id v4 = objc_alloc(MEMORY[0x1E4F91450]);
  id v5 = [(SBProductivityGestureEducationPillViewController *)self _pillLeadingImageView];
  v6 = (PLPillView *)[v4 initWithLeadingAccessoryView:v5 trailingAccessoryView:0];
  pillView = self->_pillView;
  self->_pillView = v6;

  v8 = self->_pillView;
  objc_super v9 = [(SBProductivityGestureEducationPillViewController *)self _pillTitleContentItem];
  v16[0] = v9;
  v10 = [(SBProductivityGestureEducationPillViewController *)self _pillActionContentItem];
  v16[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  [(PLPillView *)v8 setCenterContentItems:v11];

  v12 = self->_pillView;
  [v3 bounds];
  -[PLPillView setFrame:](v12, "setFrame:");
  [(PLPillView *)self->_pillView setAutoresizingMask:18];
  [v3 addSubview:self->_pillView];
  [(PLPillView *)self->_pillView intrinsicContentSize];
  -[SBProductivityGestureEducationPillViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__handleSingleTap_];
  [v13 setNumberOfTouchesRequired:1];
  [v13 setNumberOfTapsRequired:1];
  [v3 addGestureRecognizer:v13];
  v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v14 addObserver:self selector:sel__marqueeStarted_ name:*MEMORY[0x1E4F440D0] object:0];
}

- (NSURL)actionURL
{
  int64_t v2 = [(SBProductivityGestureEducationItem *)self->_item type];
  if ((unint64_t)(v2 - 1) > 3)
  {
    v3 = @"prefs:root=com.apple.MultitaskingAndGesturesSettings";
  }
  else
  {
    [@"prefs:root=com.apple.MultitaskingAndGesturesSettings" stringByAppendingFormat:@"&path=%@", off_1E6B0D1C0[v2 - 1]];
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  id v4 = [(__CFString *)v3 stringByAppendingFormat:@"&referrer=%@", @"com.apple.SpringBoard.ProductivityGestureEducation"];

  id v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];

  return (NSURL *)v5;
}

- (id)_pillLeadingImageView
{
  int64_t v2 = [(SBProductivityGestureEducationItem *)self->_item type];
  if ((unint64_t)(v2 - 1) > 3)
  {
    objc_super v9 = 0;
  }
  else
  {
    v3 = off_1E6B0D1E0[v2 - 1];
    id v4 = (void *)MEMORY[0x1E4F42A80];
    id v5 = (void *)MEMORY[0x1E4F42A98];
    v6 = [MEMORY[0x1E4F428B8] labelColor];
    v7 = [v5 configurationWithHierarchicalColor:v6];
    v8 = [v4 systemImageNamed:v3 withConfiguration:v7];

    objc_super v9 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v8];
  }
  return v9;
}

- (id)_titleKeyForEducationType:(int64_t)a3
{
  if ((unint64_t)(a3 - 7) > 3) {
    return 0;
  }
  else {
    return off_1E6B0D200[a3 - 7];
  }
}

- (id)_titleForItemType:(int64_t)a3
{
  if ((unint64_t)(a3 - 3) < 2)
  {
    v3 = [(SBProductivityGestureEducationPillViewController *)self _titleKeyForEducationType:[(SBProductivityGestureEducationItem *)self->_item lastActivatedEducationType]];
    if (v3) {
      goto LABEL_8;
    }
LABEL_6:
    id v4 = &stru_1F3084718;
    goto LABEL_9;
  }
  if (a3 == 1)
  {
    v3 = @"PRODUCTIVITY_GESTURE_EDUCATION_PRODUCTIVITY_GESTURES_OFF";
    goto LABEL_8;
  }
  if (a3 != 2) {
    goto LABEL_6;
  }
  v3 = @"PRODUCTIVITY_GESTURE_EDUCATION_SWIPE_APPS_OFF";
LABEL_8:
  id v5 = [MEMORY[0x1E4F28B50] mainBundle];
  id v4 = [v5 localizedStringForKey:v3 value:&stru_1F3084718 table:@"SpringBoard"];

LABEL_9:
  return v4;
}

- (id)_titleString
{
  int64_t v3 = [(SBProductivityGestureEducationItem *)self->_item type];
  return [(SBProductivityGestureEducationPillViewController *)self _titleForItemType:v3];
}

- (id)_pillTitleContentItem
{
  id v3 = objc_alloc(MEMORY[0x1E4F91440]);
  id v4 = [(SBProductivityGestureEducationPillViewController *)self _titleString];
  id v5 = (void *)[v3 initWithText:v4 style:1];

  return v5;
}

- (id)_pillActionContentItem
{
  int64_t v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v2 localizedStringForKey:@"PRODUCTIVITY_GESTURE_EDUCATION_ACTION_TEXT" value:&stru_1F3084718 table:@"SpringBoard"];

  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F91440]) initWithText:v3 style:5];
  return v4;
}

- (void)_marqueeStarted:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 text];
    v7 = [(SBProductivityGestureEducationPillViewController *)self _titleString];
    int v8 = [v6 isEqualToString:v7];

    if (v8)
    {
      objc_super v9 = [v4 userInfo];
      v10 = [v9 objectForKey:*MEMORY[0x1E4F440C8]];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [v10 doubleValue];
      objc_msgSend(WeakRetained, "gestureEducationPillViewControllerMarqueeStarted:duration:", self);

      v12 = SBLogSystemGesture();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = _SBFLoggingMethodProem();
        v14 = [(SBProductivityGestureEducationPillViewController *)self _titleString];
        int v15 = 138543874;
        v16 = v13;
        __int16 v17 = 2112;
        v18 = v14;
        __int16 v19 = 2112;
        v20 = v10;
        _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_INFO, "%{public}@ Education banner title marquee started: %@, duration: %@", (uint8_t *)&v15, 0x20u);
      }
    }
  }
}

- (NSString)requestIdentifier
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"%p-GestureEducation-%ld", self, -[SBProductivityGestureEducationItem type](self->_item, "type"));
}

- (NSString)requesterIdentifier
{
  return (NSString *)@"com.apple.SpringBoard.ProductivityGestureEducation";
}

- (int64_t)presentableBehavior
{
  return 1;
}

- (id)presentableDescription
{
  return (id)MEMORY[0x1F410C128](self, 0);
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained gestureEducationPillViewControllerWillAppear:self];
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained gestureEducationPillViewControllerDidDisappear:self];
}

- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = SBLogSystemGesture();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = _SBFLoggingMethodProem();
    int v8 = [(SBProductivityGestureEducationPillViewController *)self requestIdentifier];
    int v10 = 138543874;
    v11 = v7;
    __int16 v12 = 2112;
    v13 = v8;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ %@ will not display education banner: due to %@", (uint8_t *)&v10, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained gestureEducationPillViewControllerFailsToAppear:self];
}

- (void)_handleSingleTap:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained gestureEducationPillViewControllerDidReceiveUserTap:self];
}

- (SBProductivityGestureEducationPillViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBProductivityGestureEducationPillViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBProductivityGestureEducationItem)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pillView, 0);
}

@end