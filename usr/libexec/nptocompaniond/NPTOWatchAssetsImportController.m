@interface NPTOWatchAssetsImportController
- (NPTOWatchAssetsImportController)init;
- (void)handleIncomingFile:(id)a3;
@end

@implementation NPTOWatchAssetsImportController

- (void)handleIncomingFile:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10004EBD0(v4);
}

- (NPTOWatchAssetsImportController)init
{
  return (NPTOWatchAssetsImportController *)sub_100050BA4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___NPTOWatchAssetsImportController_internalQueue);
}

@end