@interface IdentityProofingDataSharingListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC8coreidvd35IdentityProofingDataSharingListener)init;
- (void)dealloc;
@end

@implementation IdentityProofingDataSharingListener

- (_TtC8coreidvd35IdentityProofingDataSharingListener)init
{
  return (_TtC8coreidvd35IdentityProofingDataSharingListener *)sub_100441F3C();
}

- (void)dealloc
{
  v2 = self;
  sub_100442160();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8coreidvd35IdentityProofingDataSharingListener_xpcListener));
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1004424E4(v7);

  return v9 & 1;
}

@end