@interface PMOtpauthQRCodeScannerView.Coordinator
- (_TtCV17PasswordManagerUI26PMOtpauthQRCodeScannerView11Coordinator)init;
- (void)QRCodeScannerViewController:(id)a3 didScanQRCodeWithURLValue:(id)a4;
@end

@implementation PMOtpauthQRCodeScannerView.Coordinator

- (void)QRCodeScannerViewController:(id)a3 didScanQRCodeWithURLValue:(id)a4
{
  uint64_t v6 = sub_258D6B528();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_258D6B4D8();
  v10 = *(void (**)(char *))((char *)&self->super.isa
                                      + OBJC_IVAR____TtCV17PasswordManagerUI26PMOtpauthQRCodeScannerView11Coordinator_completion);
  id v11 = a3;
  v12 = self;
  swift_retain();
  v10(v9);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtCV17PasswordManagerUI26PMOtpauthQRCodeScannerView11Coordinator)init
{
  result = (_TtCV17PasswordManagerUI26PMOtpauthQRCodeScannerView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end