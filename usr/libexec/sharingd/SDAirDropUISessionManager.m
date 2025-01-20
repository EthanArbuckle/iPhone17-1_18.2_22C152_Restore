@interface SDAirDropUISessionManager
- (_TtC16DaemoniOSLibrary25SDAirDropUISessionManager)init;
- (void)activate;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)removedTransfer:(id)a3;
- (void)updatedTransfer:(id)a3;
@end

@implementation SDAirDropUISessionManager

- (_TtC16DaemoniOSLibrary25SDAirDropUISessionManager)init
{
  return (_TtC16DaemoniOSLibrary25SDAirDropUISessionManager *)sub_100436E5C();
}

- (void)activate
{
  v2 = self;
  sub_100437214();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropUISessionManager_transferObserver));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropUISessionManager_airDropUISession));
  sub_100261080((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropUISessionManager_delegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropUISessionManager_airDropUIAssertion));
  sub_10000A7E8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropUISessionManager_ongoingWalletTransferStartDate, (uint64_t *)&unk_100975040);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropUISessionManager_queue);
}

- (void)updatedTransfer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10043D03C(v4);
}

- (void)removedTransfer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10043D778(v4);
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  uint64_t v4 = qword_100969E08;
  id v10 = a3;
  v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_10000B47C(v6, (uint64_t)qword_100974260);
  v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Wallet UI service deactivated", v9, 2u);
    swift_slowDealloc();
  }
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  sub_1004418D8((uint64_t)a4);
}

@end