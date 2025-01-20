@interface _SFTipsCoordinator
- (BOOL)webSearchTipAvailable;
- (UIView)webSearchTipView;
- (UIViewController)webSearchTipViewController;
- (_SFTipsCoordinator)init;
- (_SFTipsObserver)observer;
- (void)invalidateWebSearchTip;
- (void)setObserver:(id)a3;
- (void)setWebSearchTipAvailable:(BOOL)a3;
- (void)startObserving;
@end

@implementation _SFTipsCoordinator

- (_SFTipsCoordinator)init
{
  return (_SFTipsCoordinator *)SFTipsCoordinator.init()();
}

- (void)setObserver:(id)a3
{
}

- (void)startObserving
{
  v2 = self;
  _s12MobileSafari17SFTipsCoordinatorC14startObservingyyF_0();
}

- (BOOL)webSearchTipAvailable
{
  v2 = (BOOL *)self + OBJC_IVAR____SFTipsCoordinator_webSearchTipAvailable;
  swift_beginAccess();
  return *v2;
}

- (void)setWebSearchTipAvailable:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____SFTipsCoordinator_webSearchTipAvailable;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (_SFTipsObserver)observer
{
  v2 = (char *)self + OBJC_IVAR____SFTipsCoordinator_observer;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x192F967B0](v2);

  return (_SFTipsObserver *)v3;
}

- (void).cxx_destruct
{
  sub_18C57B508((uint64_t)self + OBJC_IVAR____SFTipsCoordinator_observer);

  swift_release();
}

- (UIViewController)webSearchTipViewController
{
  return (UIViewController *)sub_18C6416C8(self, (uint64_t)a2, (uint64_t (*)(void))sub_18C6414C0);
}

- (UIView)webSearchTipView
{
  return (UIView *)sub_18C6416C8(self, (uint64_t)a2, (uint64_t (*)(void))sub_18C641574);
}

- (void)invalidateWebSearchTip
{
  v2 = self;
  SFTipsCoordinator.invalidateWebSearchTip()();
}

@end