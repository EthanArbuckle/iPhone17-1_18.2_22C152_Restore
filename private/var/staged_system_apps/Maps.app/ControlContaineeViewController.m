@interface ControlContaineeViewController
+ (BOOL)wantsDefaultHeaderContentViews;
- (ActionCoordination)delegate;
- (int64_t)floatingControlsOptions;
- (void)setDelegate:(id)a3;
@end

@implementation ControlContaineeViewController

- (ActionCoordination)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ActionCoordination *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (int64_t)floatingControlsOptions
{
  return 251;
}

- (void).cxx_destruct
{
}

@end