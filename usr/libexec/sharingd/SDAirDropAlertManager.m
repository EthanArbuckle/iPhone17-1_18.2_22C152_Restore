@interface SDAirDropAlertManager
- (_TtC16DaemoniOSLibrary21SDAirDropAlertManager)init;
- (void)activate;
- (void)removedTransfer:(id)a3;
- (void)updatedTransfer:(id)a3;
@end

@implementation SDAirDropAlertManager

- (_TtC16DaemoniOSLibrary21SDAirDropAlertManager)init
{
  return (_TtC16DaemoniOSLibrary21SDAirDropAlertManager *)sub_1004D1C80();
}

- (void)activate
{
  v2 = self;
  sub_1004D1D90();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary21SDAirDropAlertManager_transferObserver));
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)updatedTransfer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1004D249C(v4);
}

- (void)removedTransfer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1004D44F8(v4);
}

@end