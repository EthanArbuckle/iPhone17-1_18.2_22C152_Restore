@interface ICAttributionsUpdater
+ (double)sidebarClosedRenderDelay;
+ (double)sidebarOpenedRenderDelay;
- (BOOL)isSidebarHidden;
- (ICAttributionLayoutManager)layoutManager;
- (ICAttributionsUpdater)init;
- (void)setIsSidebarHidden:(BOOL)a3;
@end

@implementation ICAttributionsUpdater

+ (double)sidebarOpenedRenderDelay
{
  return 0.2;
}

+ (double)sidebarClosedRenderDelay
{
  return 2.0;
}

- (ICAttributionLayoutManager)layoutManager
{
  return (ICAttributionLayoutManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                               + OBJC_IVAR___ICAttributionsUpdater_layoutManager));
}

- (BOOL)isSidebarHidden
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___ICAttributionsUpdater_isSidebarHidden);
}

- (void)setIsSidebarHidden:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___ICAttributionsUpdater_isSidebarHidden) = a3;
}

- (ICAttributionsUpdater)init
{
  result = (ICAttributionsUpdater *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end