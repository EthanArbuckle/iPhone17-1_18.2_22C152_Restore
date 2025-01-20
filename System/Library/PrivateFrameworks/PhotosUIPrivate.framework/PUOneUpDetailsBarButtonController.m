@interface PUOneUpDetailsBarButtonController
+ (id)defaultGlyphNameFor:(id)a3;
- (PUOneUpDetailsBarButtonController)init;
- (PUOneUpDetailsBarButtonController)initWithBarButtonItem:(id)a3 browseViewModel:(id)a4;
- (void)currentAssetDidChange;
- (void)update;
@end

@implementation PUOneUpDetailsBarButtonController

- (PUOneUpDetailsBarButtonController)initWithBarButtonItem:(id)a3 browseViewModel:(id)a4
{
  return (PUOneUpDetailsBarButtonController *)sub_1AEA0D014((uint64_t)a3, (uint64_t)a4);
}

- (void)update
{
  v2 = self;
  sub_1AEA0D0BC();
}

+ (id)defaultGlyphNameFor:(id)a3
{
  id v3 = a3;
  sub_1AEA0D794(v3);

  v4 = (void *)sub_1AEF96DA0();
  swift_bridgeObjectRelease();
  return v4;
}

- (void)currentAssetDidChange
{
  v2 = self;
  sub_1AEA0D91C();
}

- (PUOneUpDetailsBarButtonController)init
{
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PUOneUpDetailsBarButtonController_revertTimer);
}

@end