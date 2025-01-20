@interface NCNotificationListCountIndicatorViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (CGRect)visibleFrame;
- (DNDModeConfiguration)activeDNDModeConfiguration;
- (NCNotificationListCountIndicatorViewController)initWithCoder:(id)a3;
- (NCNotificationListCountIndicatorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (NCNotificationListCountIndicatorViewControllerDelegate)delegate;
- (NSString)incomingTitle;
- (UIEdgeInsets)edgeInsets;
- (int64_t)count;
- (void)adjustForLegibilitySettingsChange:(id)a3;
- (void)loadView;
- (void)notificationListCountIndicatorViewLongPressed:(id)a3 presentingView:(id)a4;
- (void)notificationListCountIndicatorViewTapped:(id)a3;
- (void)setActiveDNDModeConfiguration:(id)a3;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setCount:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayStyleSetting:(int64_t)a3;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
- (void)setIncomingTitle:(id)a3;
- (void)setVisibleFrame:(CGRect)a3;
- (void)viewDidLoad;
@end

@implementation NCNotificationListCountIndicatorViewController

- (void)viewDidLoad
{
  v2 = self;
  NCNotificationListCountIndicatorViewController.viewDidLoad()();
}

- (void)loadView
{
  id v3 = objc_allocWithZone((Class)NCNotificationListCountIndicatorView);
  v4 = self;
  id v5 = objc_msgSend(v3, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  [(NCNotificationListCountIndicatorViewController *)v4 setView:v5];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NCNotificationListCountIndicatorViewControllerDelegate)delegate
{
  v2 = (void *)MEMORY[0x1D9481D00]((char *)self + OBJC_IVAR___NCNotificationListCountIndicatorViewController_delegate, a2);

  return (NCNotificationListCountIndicatorViewControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
}

- (DNDModeConfiguration)activeDNDModeConfiguration
{
  return (DNDModeConfiguration *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                         + OBJC_IVAR___NCNotificationListCountIndicatorViewController_activeDNDModeConfiguration));
}

- (void)setActiveDNDModeConfiguration:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1D7D6E328(a3);
}

- (int64_t)count
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR___NCNotificationListCountIndicatorViewController_count);
}

- (void)setCount:(int64_t)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR___NCNotificationListCountIndicatorViewController_count);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NCNotificationListCountIndicatorViewController_count) = (Class)a3;
  if (v3 != a3)
  {
    v4 = self;
    sub_1D7D6E3FC();
  }
}

- (NSString)incomingTitle
{
  if (*(void *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR___NCNotificationListCountIndicatorViewController_incomingTitle))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1D7D7F760();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setIncomingTitle:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1D7D7F790();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  sub_1D7D6E92C(v4, v6);
}

- (void)setDisplayStyleSetting:(int64_t)a3
{
  uint64_t v4 = self;
  sub_1D7D6E9B4((id)a3);
}

- (UIEdgeInsets)edgeInsets
{
  double v2 = *(double *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR___NCNotificationListCountIndicatorViewController_edgeInsets);
  double v3 = *(double *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR___NCNotificationListCountIndicatorViewController_edgeInsets);
  double v4 = *(double *)((char *)&self->super.super.__layeringSceneIdentity
                 + OBJC_IVAR___NCNotificationListCountIndicatorViewController_edgeInsets);
  double v5 = *(double *)((char *)&self->super._overrideTransitioningDelegate
                 + OBJC_IVAR___NCNotificationListCountIndicatorViewController_edgeInsets);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  v7 = self;
  sub_1D7D6EB28(top, left, bottom, right);
}

- (CGRect)visibleFrame
{
  double v2 = *(double *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR___NCNotificationListCountIndicatorViewController_visibleFrame);
  double v3 = *(double *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR___NCNotificationListCountIndicatorViewController_visibleFrame);
  double v4 = *(double *)((char *)&self->super.super.__layeringSceneIdentity
                 + OBJC_IVAR___NCNotificationListCountIndicatorViewController_visibleFrame);
  double v5 = *(double *)((char *)&self->super._overrideTransitioningDelegate
                 + OBJC_IVAR___NCNotificationListCountIndicatorViewController_visibleFrame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setVisibleFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGFloat v7 = *(double *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR___NCNotificationListCountIndicatorViewController_visibleFrame);
  CGFloat v8 = *(double *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR___NCNotificationListCountIndicatorViewController_visibleFrame);
  CGFloat v9 = *(double *)((char *)&self->super.super.__layeringSceneIdentity
                 + OBJC_IVAR___NCNotificationListCountIndicatorViewController_visibleFrame);
  CGFloat v10 = *(double *)((char *)&self->super._overrideTransitioningDelegate
                  + OBJC_IVAR___NCNotificationListCountIndicatorViewController_visibleFrame);
  *(CGRect *)((char *)&self->super.super.super.isa
            + OBJC_IVAR___NCNotificationListCountIndicatorViewController_visibleFrame) = a3;
  v11 = self;
  v13.origin.CGFloat x = v7;
  v13.origin.CGFloat y = v8;
  v13.size.CGFloat width = v9;
  v13.size.CGFloat height = v10;
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  if (!CGRectEqualToRect(v13, v14)) {
    sub_1D7D6E3FC();
  }
}

- (void)adjustForLegibilitySettingsChange:(id)a3
{
  double v4 = self;
  id v5 = a3;
  [(NCNotificationListCountIndicatorViewController *)v4 loadViewIfNeeded];
  id v6 = [(NCNotificationListCountIndicatorViewController *)v4 view];
  if (v6)
  {
    self;
    objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_adjustForLegibilitySettingsChange_, v5);
  }
  else
  {
    __break(1u);
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  return sub_1D7D6ED08(self, (uint64_t)a2, (SEL *)&selRef_adjustForContentSizeCategoryChange);
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return sub_1D7D6ED08(self, (uint64_t)a2, (SEL *)&selRef_adjustsFontForContentSizeCategory);
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  BOOL v3 = a3;
  double v4 = self;
  [(NCNotificationListCountIndicatorViewController *)v4 loadViewIfNeeded];
  id v5 = [(NCNotificationListCountIndicatorViewController *)v4 view];
  if (v5)
  {
    self;
    objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_setAdjustsFontForContentSizeCategory_, v3);
  }
  else
  {
    __break(1u);
  }
}

- (NCNotificationListCountIndicatorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1D7D7F790();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (NCNotificationListCountIndicatorViewController *)NCNotificationListCountIndicatorViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (NCNotificationListCountIndicatorViewController)initWithCoder:(id)a3
{
  return (NCNotificationListCountIndicatorViewController *)NCNotificationListCountIndicatorViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_1D7D23880((uint64_t)self + OBJC_IVAR___NCNotificationListCountIndicatorViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___NCNotificationListCountIndicatorViewController_activeDNDModeConfiguration));

  swift_bridgeObjectRelease();
}

- (void)notificationListCountIndicatorViewTapped:(id)a3
{
  id v4 = a3;
  uint64_t v6 = self;
  uint64_t v5 = [(NCNotificationListCountIndicatorViewController *)v6 delegate];
  if (v5)
  {
    [(NCNotificationListCountIndicatorViewControllerDelegate *)v5 notificationListCountIndicatorViewControllerTapped:v6];

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)notificationListCountIndicatorViewLongPressed:(id)a3 presentingView:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  id v8 = [(NCNotificationListCountIndicatorViewController *)v7 activeDNDModeConfiguration];

  if (v8
    && (CGFloat v9 = [(NCNotificationListCountIndicatorViewController *)v7 delegate]) != 0)
  {
    [(NCNotificationListCountIndicatorViewControllerDelegate *)v9 notificationListCountIndicatorViewControllerLongPressed:v7 presentingView:v6];

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

@end