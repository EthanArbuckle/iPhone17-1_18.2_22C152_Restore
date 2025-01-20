@interface SiriInferenceServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC14siriinferenced28SiriInferenceServiceDelegate)init;
@end

@implementation SiriInferenceServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1000163CC((int)v8, v7);

  return v9 & 1;
}

- (_TtC14siriinferenced28SiriInferenceServiceDelegate)init
{
  return (_TtC14siriinferenced28SiriInferenceServiceDelegate *)sub_100016724();
}

@end