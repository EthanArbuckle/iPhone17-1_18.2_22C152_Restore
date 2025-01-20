@interface IMTransition
+ (id)transition;
+ (id)transitionWithAnimations:(id)a3 completion:(id)a4;
+ (void)initialize;
- (BOOL)_shouldUseTransactionForTransition;
- (BOOL)animated;
- (BOOL)animationsFinished;
- (BOOL)reverse;
- (BOOL)shouldAllowInterfaceRotation;
- (BOOL)shouldPerformTransition;
- (BOOL)started;
- (BOOL)useSnapshots;
- (CGRect)transitionRect;
- (IMTransition)init;
- (IMTransition)initWithAnimations:(id)a3 completion:(id)a4;
- (IMTransitionDelegate)delegate;
- (IMViewControllerContaining)parentViewController;
- (NSDictionary)userInfo;
- (NSMutableDictionary)mutableUserInfo;
- (NSMutableSet)animations;
- (NSString)identifier;
- (UIView)parentView;
- (UIView)view;
- (double)delay;
- (double)duration;
- (id)animationsBlock;
- (id)completion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableUserInfoCreateIfNeeded:(BOOL)a3;
- (id)setup;
- (int)roleForViewController:(id)a3;
- (void)_delayedBeginAnimation;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)animationEnded:(id)a3 finished:(BOOL)a4;
- (void)animationStarted:(id)a3;
- (void)beginAnimation;
- (void)beginTransition;
- (void)cleanupTransition;
- (void)cleanupViewControllers;
- (void)dealloc;
- (void)notifyTransitionDidEnd;
- (void)notifyTransitionDidStart;
- (void)notifyTransitionWillStart;
- (void)performAnimatedTransition;
- (void)performNonAnimatedTransition;
- (void)performTransition;
- (void)prepareTransition;
- (void)prepareViewControllers;
- (void)setAnimated:(BOOL)a3;
- (void)setAnimations:(id)a3;
- (void)setAnimationsBlock:(id)a3;
- (void)setAnimationsFinished:(BOOL)a3;
- (void)setCompletion:(id)a3;
- (void)setDelay:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDuration:(double)a3;
- (void)setIdentifier:(id)a3;
- (void)setMutableUserInfo:(id)a3;
- (void)setParentViewController:(id)a3;
- (void)setReverse:(BOOL)a3;
- (void)setSetup:(id)a3;
- (void)setShouldAllowInterfaceRotation:(BOOL)a3;
- (void)setStarted:(BOOL)a3;
- (void)setUseSnapshots:(BOOL)a3;
- (void)setUserInfoObject:(id)a3 forKey:(id)a4;
- (void)setView:(id)a3;
- (void)transitionDidEnd;
- (void)transitionDidStart;
@end

@implementation IMTransition

+ (void)initialize
{
  objc_opt_class();

  objc_opt_class();
}

+ (id)transition
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (id)transitionWithAnimations:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithAnimations:v7 completion:v6];

  return v8;
}

- (IMTransition)initWithAnimations:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IMTransition *)self init];
  v9 = v8;
  if (v8)
  {
    v8->_shouldAllowInterfaceRotation = 0;
    if (v6)
    {
      id v10 = [v6 copy];
      id v11 = objc_retainBlock(v10);
      id animationsBlock = v9->_animationsBlock;
      v9->_id animationsBlock = v11;
    }
    else
    {
      id v10 = v8->_animationsBlock;
      v8->_id animationsBlock = 0;
    }

    if (v7)
    {
      id v13 = [v7 copy];
      id v14 = objc_retainBlock(v13);
      id completion = v9->_completion;
      v9->_id completion = v14;
    }
    else
    {
      id v13 = v9->_completion;
      v9->_id completion = 0;
    }
  }
  return v9;
}

- (IMTransition)init
{
  v11.receiver = self;
  v11.super_class = (Class)IMTransition;
  id v2 = [(IMTransition *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_animated = 1;
    v2->_animationsFinished = 1;
    v4 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    animations = v3->_animations;
    v3->_animations = v4;

    v3->_duration = 0.300000012;
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    id v8 = (NSString *)[v7 copy];
    identifier = v3->_identifier;
    v3->_identifier = v8;
  }
  return v3;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_delegate, 0);
  id setup = self->_setup;
  self->_id setup = 0;

  id animationsBlock = self->_animationsBlock;
  self->_id animationsBlock = 0;

  id completion = self->_completion;
  self->_id completion = 0;

  v6.receiver = self;
  v6.super_class = (Class)IMTransition;
  [(IMTransition *)&v6 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_opt_class() allocWithZone:a3] init];
  v5 = v4;
  if (v4)
  {
    [v4 setIdentifier:self->_identifier];
    [v5 setParentViewController:self->_parentViewController];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [v5 setDelegate:WeakRetained];

    [v5 setDuration:self->_duration];
    [v5 setDelay:self->_delay];
    [v5 setUseSnapshots:self->_useSnapshots];
    [v5 setAnimated:self->_animated];
    [v5 setSetup:self->_setup];
    [v5 setAnimationsBlock:self->_animationsBlock];
    [v5 setCompletion:self->_completion];
    [v5 setMutableUserInfo:self->_mutableUserInfo];
    [v5 setShouldAllowInterfaceRotation:self->_shouldAllowInterfaceRotation];
  }
  return v5;
}

- (BOOL)_shouldUseTransactionForTransition
{
  id v2 = +[UIDevice currentDevice];
  unsigned __int8 v3 = [v2 _supportsForceTouch];

  return v3;
}

- (void)_delayedBeginAnimation
{
  [(IMTransition *)self beginAnimation];
  if ([(IMTransition *)self _shouldUseTransactionForTransition])
  {
    +[CATransaction commit];
  }
}

- (void)beginTransition
{
  [(id)stopWatch reset];
  unsigned __int8 v3 = [(IMTransition *)self parentViewController];
  unsigned int v4 = [v3 isViewLoaded];

  if (v4)
  {
    id v5 = [objc_alloc((Class)NSArray) initWithObjects:NSRunLoopCommonModes, UITrackingRunLoopMode, 0];
    if ([(IMTransition *)self _shouldUseTransactionForTransition]) {
      +[CATransaction begin];
    }
    [(IMTransition *)self delay];
    -[IMTransition performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", "_delayedBeginAnimation", self, v5);
  }
  else
  {
    [(IMTransition *)self beginAnimation];
  }
}

- (void)prepareTransition
{
  id v3 = objc_alloc((Class)UIView);
  unsigned int v4 = [(IMTransition *)self parentView];
  [v4 bounds];
  id v5 = [v3 initWithFrame:];
  view = self->_view;
  self->_view = v5;

  id v7 = [(IMTransition *)self view];
  [v7 setClipsToBounds:1];

  id v9 = [(IMTransition *)self parentView];
  id v8 = [(IMTransition *)self view];
  [v9 addSubview:v8];
}

- (void)performTransition
{
}

- (void)cleanupTransition
{
  id v2 = [(IMTransition *)self view];
  [v2 removeFromSuperview];
}

- (int)roleForViewController:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = [v4 parentViewController];
  id v6 = [(IMTransition *)self parentViewController];

  if (v6 == v4)
  {
    int v7 = 3;
  }
  else if (v5)
  {
    int v7 = [(IMTransition *)self roleForViewController:v5];
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

- (void)setUserInfoObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(IMTransition *)self mutableUserInfoCreateIfNeeded:1];
  [v8 setObject:v7 forKey:v6];
}

- (void)transitionDidStart
{
  [(id)stopWatch reportWithMarker:@"transitionDidStart"];
  [(IMTransition *)self setStarted:1];

  [(IMTransition *)self notifyTransitionDidStart];
}

- (void)transitionDidEnd
{
  [(IMTransition *)self setStarted:0];
  BOOL v3 = [(IMTransition *)self animationsFinished];
  [(IMTransition *)self cleanupViewControllers];
  [(IMTransition *)self notifyTransitionDidEnd];
  id v4 = [(IMTransition *)self completion];

  if (v4)
  {
    id v5 = [(IMTransition *)self completion];
    v5[2](v5, v3);
  }

  [(IMTransition *)self setView:0];
}

- (CGRect)transitionRect
{
  BOOL v3 = [(IMTransition *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(IMTransition *)self parentView];
    [v3 transitionRectInView:v4 transition:self];
    CGFloat x = v5;
    CGFloat y = v7;
    CGFloat width = v9;
    CGFloat height = v11;
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }

  double v13 = x;
  double v14 = y;
  double v15 = width;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (void)performAnimatedTransition
{
  [(IMTransition *)self notifyTransitionWillStart];
  BOOL v3 = [(IMTransition *)self setup];

  if (v3)
  {
    id v4 = [(IMTransition *)self setup];
    ((void (**)(void, IMTransition *))v4)[2](v4, self);
  }
  [(IMTransition *)self prepareTransition];
  [(IMTransition *)self prepareViewControllers];
  [(IMTransition *)self duration];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_AE71C;
  v6[3] = &unk_2C3C50;
  v6[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_AE7B4;
  v5[3] = &unk_2C5968;
  v5[4] = self;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v6, v5);
}

- (void)performNonAnimatedTransition
{
  [(IMTransition *)self setAnimationsFinished:0];

  [(IMTransition *)self transitionDidEnd];
}

- (void)prepareViewControllers
{
  id v3 = [(IMTransition *)self parentViewController];
  [v3 prepareForTransition:self];
}

- (void)cleanupViewControllers
{
  id v3 = [(IMTransition *)self parentViewController];
  [v3 cleanupAfterTransition:self];
}

- (void)beginAnimation
{
  if ([(IMTransition *)self shouldPerformTransition])
  {
    if ([(IMTransition *)self animated])
    {
      [(IMTransition *)self performAnimatedTransition];
    }
    else
    {
      [(IMTransition *)self performNonAnimatedTransition];
    }
  }
}

- (BOOL)animated
{
  id v3 = [(IMTransition *)self parentViewController];
  unsigned int v4 = [v3 isViewLoaded];

  if (v4)
  {
    double v5 = [(IMTransition *)self parentViewController];
    id v6 = [v5 view];
    double v7 = [v6 window];
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }
  if (!self->_animated) {
    return 0;
  }
  [(IMTransition *)self duration];
  return v9 > 0.0 && v8;
}

- (double)duration
{
  id v3 = +[NSProcessInfo processInfo];
  unsigned int v4 = [v3 environment];
  double v5 = [v4 valueForKey:@"TRANSITION_DURATION_MULTIPLIER"];

  [v5 floatValue];
  double v7 = v6;
  BOOL v8 = v6 == 0.0;
  double v9 = 1.0;
  if (!v8) {
    double v9 = v7;
  }
  double v10 = self->_duration * v9;

  return v10;
}

- (UIView)parentView
{
  id v2 = [(IMTransition *)self parentViewController];
  id v3 = [v2 view];

  return (UIView *)v3;
}

- (BOOL)shouldPerformTransition
{
  id v3 = [(IMTransition *)self parentViewController];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 1;
  }
  double v5 = [(IMTransition *)self parentViewController];
  unsigned __int8 v6 = [v5 shouldPerformChildTransition:self];

  return v6;
}

- (id)mutableUserInfoCreateIfNeeded:(BOOL)a3
{
  if (a3 && !self->_mutableUserInfo)
  {
    char v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    mutableUserInfo = self->_mutableUserInfo;
    self->_mutableUserInfo = v4;
  }
  unsigned __int8 v6 = self->_mutableUserInfo;

  return v6;
}

- (NSDictionary)userInfo
{
  id v2 = [(IMTransition *)self mutableUserInfoCreateIfNeeded:0];
  id v3 = [v2 copy];

  return (NSDictionary *)v3;
}

- (void)notifyTransitionWillStart
{
  id v3 = [(IMTransition *)self parentViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    double v5 = [(IMTransition *)self parentViewController];
    [v5 childTransitionWillStart:self];
  }
  id v6 = [(IMTransition *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 transitionWillStart:self];
  }
}

- (void)notifyTransitionDidStart
{
  id v3 = [(IMTransition *)self parentViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    double v5 = [(IMTransition *)self parentViewController];
    [v5 childTransitionDidStart:self];
  }
  id v6 = [(IMTransition *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 transitionDidStart:self];
  }
}

- (void)notifyTransitionDidEnd
{
  id v2 = self;
  BOOL v3 = [(IMTransition *)v2 animationsFinished];
  char v4 = [(IMTransition *)v2 parentViewController];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(IMTransition *)v2 parentViewController];
    [v6 childTransitionDidComplete:v2 finished:v3];
  }
  id v8 = [(IMTransition *)v2 delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 transitionDidComplete:v2 finished:v3];
  }
  id v7 = self;
}

- (void)animationStarted:(id)a3
{
  id v4 = a3;
  char v5 = [(IMTransition *)self animations];
  [v5 addObject:v4];

  if (![(IMTransition *)self started])
  {
    [(IMTransition *)self transitionDidStart];
  }
}

- (void)animationEnded:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(IMTransition *)self setAnimationsFinished:[(IMTransition *)self animationsFinished] & v4];
  id v7 = [(IMTransition *)self animations];
  [v7 removeObject:v6];

  id v8 = [(IMTransition *)self animations];
  id v9 = [v8 count];

  if (!v9)
  {
    [(IMTransition *)self cleanupTransition];
    [(IMTransition *)self transitionDidEnd];
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (IMViewControllerContaining)parentViewController
{
  return self->_parentViewController;
}

- (void)setParentViewController:(id)a3
{
}

- (UIView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
}

- (IMTransitionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IMTransitionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (BOOL)useSnapshots
{
  return self->_useSnapshots;
}

- (void)setUseSnapshots:(BOOL)a3
{
  self->_useSnapshots = a3;
}

- (BOOL)reverse
{
  return self->_reverse;
}

- (void)setReverse:(BOOL)a3
{
  self->_reverse = a3;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delaCGFloat y = a3;
}

- (BOOL)shouldAllowInterfaceRotation
{
  return self->_shouldAllowInterfaceRotation;
}

- (void)setShouldAllowInterfaceRotation:(BOOL)a3
{
  self->_shouldAllowInterfaceRotation = a3;
}

- (NSMutableDictionary)mutableUserInfo
{
  return self->_mutableUserInfo;
}

- (void)setMutableUserInfo:(id)a3
{
}

- (NSMutableSet)animations
{
  return self->_animations;
}

- (void)setAnimations:(id)a3
{
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)animationsFinished
{
  return self->_animationsFinished;
}

- (void)setAnimationsFinished:(BOOL)a3
{
  self->_animationsFinished = a3;
}

- (id)setup
{
  return self->_setup;
}

- (void)setSetup:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (id)animationsBlock
{
  return self->_animationsBlock;
}

- (void)setAnimationsBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animationsBlock, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_setup, 0);
  objc_storeStrong((id *)&self->_animations, 0);
  objc_storeStrong((id *)&self->_mutableUserInfo, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_parentViewController, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end