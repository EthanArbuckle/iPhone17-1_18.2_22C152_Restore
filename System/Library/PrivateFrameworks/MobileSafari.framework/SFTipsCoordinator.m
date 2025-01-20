@interface SFTipsCoordinator
- (BOOL)webSearchTipAvailable;
- (SFTipsCoordinator)init;
- (SFTipsObserver)observer;
- (UIView)webSearchTipView;
- (UIViewController)webSearchTipViewController;
- (void)donatePerformSearchFromDefaultSearchEngineWebPageEvent;
- (void)invalidateWebSearchTip;
- (void)setObserver:(id)a3;
- (void)startObserving;
- (void)webSearchTipDidBecomeUnavailable;
@end

@implementation SFTipsCoordinator

- (void)startObserving
{
}

uint64_t __25__SFTipsCoordinator_init__block_invoke()
{
  return +[_SFTipsCoordinator configureTipsCenter];
}

- (void)setObserver:(id)a3
{
}

- (void)webSearchTipDidBecomeUnavailable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  [WeakRetained webSearchTipDidBecomeUnavailable];
}

- (SFTipsCoordinator)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFTipsCoordinator;
  v2 = [(SFTipsCoordinator *)&v7 init];
  if (v2)
  {
    if (init_once != -1) {
      dispatch_once(&init_once, &__block_literal_global_18);
    }
    v3 = objc_alloc_init(_SFTipsCoordinator);
    internal = v2->_internal;
    v2->_internal = v3;

    [(_SFTipsCoordinator *)v2->_internal setObserver:v2];
    v5 = v2;
  }

  return v2;
}

- (UIViewController)webSearchTipViewController
{
  return [(_SFTipsCoordinator *)self->_internal webSearchTipViewController];
}

- (UIView)webSearchTipView
{
  return [(_SFTipsCoordinator *)self->_internal webSearchTipView];
}

- (void)donatePerformSearchFromDefaultSearchEngineWebPageEvent
{
}

- (void)invalidateWebSearchTip
{
}

- (BOOL)webSearchTipAvailable
{
  return [(_SFTipsCoordinator *)self->_internal webSearchTipAvailable];
}

- (SFTipsObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (SFTipsObserver *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);

  objc_storeStrong((id *)&self->_internal, 0);
}

@end