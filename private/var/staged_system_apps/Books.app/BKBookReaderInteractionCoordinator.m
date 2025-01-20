@interface BKBookReaderInteractionCoordinator
- (BKBookReaderInteractionCoordinator)init;
- (BKBookReaderInteractionCoordinator)initWithWindow:(id)a3;
- (UIWindow)window;
- (void)setWindow:(id)a3;
@end

@implementation BKBookReaderInteractionCoordinator

- (void)setWindow:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKBookReaderInteractionCoordinator_assetViewControllerTracker);
  v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = a3;
  id v7 = a3;
  v6 = self;
  sub_100028900(v5);
}

- (BKBookReaderInteractionCoordinator)initWithWindow:(id)a3
{
  id v4 = a3;
  return (BKBookReaderInteractionCoordinator *)BookReaderInteractionCoordinator.init(window:)(a3);
}

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue((*(id **)((char *)&self->super.isa
                                                               + OBJC_IVAR___BKBookReaderInteractionCoordinator_assetViewControllerTracker))[2]);
}

- (BKBookReaderInteractionCoordinator)init
{
  result = (BKBookReaderInteractionCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

@end