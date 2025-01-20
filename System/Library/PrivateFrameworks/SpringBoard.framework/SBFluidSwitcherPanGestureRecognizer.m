@interface SBFluidSwitcherPanGestureRecognizer
- (BOOL)installedAsSystemGesture;
- (CGPoint)averageTouchVelocityOverTimeDuration:(double)a3;
- (CGPoint)initialTouchLocation;
- (SBAppLayout)initialTouchLeafAppLayout;
- (SBFluidSwitcherPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (SBFluidSwitcherViewController)switcherViewController;
- (SBTouchHistory)touchHistory;
- (double)averageTouchPathAngleOverTimeDuration:(double)a3;
- (double)peakSpeed;
- (void)reset;
- (void)setInitialTouchLeafAppLayout:(id)a3;
- (void)setInstalledAsSystemGesture:(BOOL)a3;
- (void)setSwitcherViewController:(id)a3;
- (void)setTouchHistory:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation SBFluidSwitcherPanGestureRecognizer

- (SBFluidSwitcherPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SBFluidSwitcherPanGestureRecognizer;
  v4 = [(SBPanSystemGestureRecognizer *)&v8 initWithTarget:a3 action:a4];
  if (v4)
  {
    v5 = objc_alloc_init(SBTouchHistory);
    touchHistory = v4->_touchHistory;
    v4->_touchHistory = v5;

    [(SBFluidSwitcherPanGestureRecognizer *)v4 setMaximumNumberOfTouches:1];
    [(SBFluidSwitcherPanGestureRecognizer *)v4 setAllowedTouchTypes:&unk_1F3347E38];
    [(SBFluidSwitcherPanGestureRecognizer *)v4 sbf_setPencilTouchesAllowed:_os_feature_enabled_impl()];
  }
  return v4;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  p_switcherViewController = &self->_switcherViewController;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_switcherViewController);
  v10 = [WeakRetained view];

  touchHistory = self->_touchHistory;
  v12 = [v8 anyObject];
  v13 = [v7 coalescedTouchesForTouch:v12];
  _SBUpdateTouchHistoryWithCoalescedTouches(touchHistory, v13, self, v10, self->_installedAsSystemGesture);

  v16.receiver = self;
  v16.super_class = (Class)SBFluidSwitcherPanGestureRecognizer;
  [(SBPanSystemGestureRecognizer *)&v16 touchesBegan:v8 withEvent:v7];

  [(SBFluidSwitcherPanGestureRecognizer *)self locationInView:v10];
  self->_initialTouchLocation.x = v14;
  self->_initialTouchLocation.y = v15;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  touchHistory = self->_touchHistory;
  id v7 = a4;
  id v8 = a3;
  v9 = [v8 anyObject];
  v10 = [v7 coalescedTouchesForTouch:v9];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherViewController);
  v12 = [WeakRetained view];
  _SBUpdateTouchHistoryWithCoalescedTouches(touchHistory, v10, self, v12, self->_installedAsSystemGesture);

  v13.receiver = self;
  v13.super_class = (Class)SBFluidSwitcherPanGestureRecognizer;
  [(SBFluidSwitcherPanGestureRecognizer *)&v13 touchesMoved:v8 withEvent:v7];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  touchHistory = self->_touchHistory;
  id v7 = a4;
  id v8 = a3;
  v9 = [v8 anyObject];
  v10 = [v7 coalescedTouchesForTouch:v9];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherViewController);
  v12 = [WeakRetained view];
  _SBUpdateTouchHistoryWithCoalescedTouches(touchHistory, v10, self, v12, self->_installedAsSystemGesture);

  v13.receiver = self;
  v13.super_class = (Class)SBFluidSwitcherPanGestureRecognizer;
  [(SBFluidSwitcherPanGestureRecognizer *)&v13 touchesEnded:v8 withEvent:v7];
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)SBFluidSwitcherPanGestureRecognizer;
  [(SBPanSystemGestureRecognizer *)&v3 reset];
  [(SBTouchHistory *)self->_touchHistory reset];
  [(SBFluidSwitcherPanGestureRecognizer *)self setInitialTouchLeafAppLayout:0];
}

- (CGPoint)averageTouchVelocityOverTimeDuration:(double)a3
{
  [(SBTouchHistory *)self->_touchHistory averageTouchVelocityOverTimeDuration:a3];
  result.y = v4;
  result.x = v3;
  return result;
}

- (double)averageTouchPathAngleOverTimeDuration:(double)a3
{
  [(SBTouchHistory *)self->_touchHistory averageTouchPathAngleOverTimeDuration:a3];
  return result;
}

- (double)peakSpeed
{
  [(SBTouchHistory *)self->_touchHistory peakSpeed];
  return result;
}

- (SBFluidSwitcherViewController)switcherViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherViewController);
  return (SBFluidSwitcherViewController *)WeakRetained;
}

- (void)setSwitcherViewController:(id)a3
{
}

- (BOOL)installedAsSystemGesture
{
  return self->_installedAsSystemGesture;
}

- (void)setInstalledAsSystemGesture:(BOOL)a3
{
  self->_installedAsSystemGesture = a3;
}

- (CGPoint)initialTouchLocation
{
  double x = self->_initialTouchLocation.x;
  double y = self->_initialTouchLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (SBAppLayout)initialTouchLeafAppLayout
{
  return self->_initialTouchLeafAppLayout;
}

- (void)setInitialTouchLeafAppLayout:(id)a3
{
}

- (SBTouchHistory)touchHistory
{
  return self->_touchHistory;
}

- (void)setTouchHistory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchHistory, 0);
  objc_storeStrong((id *)&self->_initialTouchLeafAppLayout, 0);
  objc_destroyWeak((id *)&self->_switcherViewController);
}

@end