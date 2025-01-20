@interface BKLibraryPriceTracker
- (BKLibraryPriceTracker)init;
- (BKLibraryPriceTracker)initWithLibraryManager:(id)a3 bdsPriceTracker:(id)a4;
- (void)setNeedsConfigurationUpdate;
@end

@implementation BKLibraryPriceTracker

- (BKLibraryPriceTracker)init
{
  swift_defaultActor_initialize();
  result = (BKLibraryPriceTracker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BKLibraryPriceTracker)initWithLibraryManager:(id)a3 bdsPriceTracker:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  return (BKLibraryPriceTracker *)PriceTracker.init(libraryManager:bdsPriceTracker:)(v5, (uint64_t)a4);
}

- (void)setNeedsConfigurationUpdate
{
  swift_retain();
  PriceTracker.objc_setNeedsConfigurationUpdate()();

  swift_release();
}

@end