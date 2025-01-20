@interface DigitalPresentmentListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC8coreidvd26DigitalPresentmentListener)init;
- (void)dealloc;
@end

@implementation DigitalPresentmentListener

- (void)dealloc
{
  v2 = self;
  sub_1004686B0();
}

- (void).cxx_destruct
{
  long long v3 = *(_OWORD *)&self->digitalPresentmentEnvironment[OBJC_IVAR____TtC8coreidvd26DigitalPresentmentListener_digitalPresentmentEnvironment
                                                     + 96];
  v8[6] = *(_OWORD *)&self->digitalPresentmentEnvironment[OBJC_IVAR____TtC8coreidvd26DigitalPresentmentListener_digitalPresentmentEnvironment
                                                        + 80];
  v8[7] = v3;
  long long v4 = *(_OWORD *)&self->digitalPresentmentEnvironment[OBJC_IVAR____TtC8coreidvd26DigitalPresentmentListener_digitalPresentmentEnvironment
                                                     + 128];
  v8[8] = *(_OWORD *)&self->digitalPresentmentEnvironment[OBJC_IVAR____TtC8coreidvd26DigitalPresentmentListener_digitalPresentmentEnvironment
                                                        + 112];
  v8[9] = v4;
  long long v5 = *(_OWORD *)&self->digitalPresentmentEnvironment[OBJC_IVAR____TtC8coreidvd26DigitalPresentmentListener_digitalPresentmentEnvironment
                                                     + 32];
  v8[2] = *(_OWORD *)&self->digitalPresentmentEnvironment[OBJC_IVAR____TtC8coreidvd26DigitalPresentmentListener_digitalPresentmentEnvironment
                                                        + 16];
  v8[3] = v5;
  long long v6 = *(_OWORD *)&self->digitalPresentmentEnvironment[OBJC_IVAR____TtC8coreidvd26DigitalPresentmentListener_digitalPresentmentEnvironment
                                                     + 64];
  v8[4] = *(_OWORD *)&self->digitalPresentmentEnvironment[OBJC_IVAR____TtC8coreidvd26DigitalPresentmentListener_digitalPresentmentEnvironment
                                                        + 48];
  v8[5] = v6;
  long long v7 = *(_OWORD *)&self->digitalPresentmentEnvironment[OBJC_IVAR____TtC8coreidvd26DigitalPresentmentListener_digitalPresentmentEnvironment];
  v8[0] = *(_OWORD *)((char *)&self->super.isa
                    + OBJC_IVAR____TtC8coreidvd26DigitalPresentmentListener_digitalPresentmentEnvironment);
  v8[1] = v7;
  sub_10003BDE0((uint64_t *)v8);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_10046D864(v7);

  return v9 & 1;
}

- (_TtC8coreidvd26DigitalPresentmentListener)init
{
  result = (_TtC8coreidvd26DigitalPresentmentListener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end