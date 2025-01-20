@interface SiriSignalsServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC14siriinferenced26SiriSignalsServiceDelegate)init;
@end

@implementation SiriSignalsServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1000177A0((int)v8, v7);

  return v9 & 1;
}

- (_TtC14siriinferenced26SiriSignalsServiceDelegate)init
{
  return (_TtC14siriinferenced26SiriSignalsServiceDelegate *)sub_100017C20();
}

@end