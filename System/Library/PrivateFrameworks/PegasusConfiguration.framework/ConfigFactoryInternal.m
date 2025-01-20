@interface ConfigFactoryInternal
- (_TtC20PegasusConfiguration21ConfigFactoryInternal)init;
- (id)loadWithData:(id)a3 userAgent:(id)a4 userDefaults:(id)a5;
- (id)loadWithUrl:(id)a3 userAgent:(id)a4 userDefaults:(id)a5;
@end

@implementation ConfigFactoryInternal

- (id)loadWithUrl:(id)a3 userAgent:(id)a4 userDefaults:(id)a5
{
  uint64_t v8 = sub_1B389BD00();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B389BC90();
  if (a4)
  {
    uint64_t v12 = sub_1B389C2B0();
    a4 = v13;
  }
  else
  {
    uint64_t v12 = 0;
  }
  v14 = self;
  id v15 = a5;
  id v16 = ConfigFactoryInternal.load(url:userAgent:userDefaults:)((uint64_t)v11, v12, (uint64_t)a4, a5);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

  return v16;
}

- (id)loadWithData:(id)a3 userAgent:(id)a4 userDefaults:(id)a5
{
  id v8 = a3;
  uint64_t v9 = self;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = sub_1B389BD40();
  unint64_t v14 = v13;

  if (v10)
  {
    uint64_t v15 = sub_1B389C2B0();
    uint64_t v17 = v16;
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v17 = 0;
  }
  id v18 = ConfigFactoryInternal.load(data:userAgent:userDefaults:)(v12, v14, v15, v17, v11);
  swift_bridgeObjectRelease();
  sub_1B386CE50(v12, v14);

  return v18;
}

- (_TtC20PegasusConfiguration21ConfigFactoryInternal)init
{
  return (_TtC20PegasusConfiguration21ConfigFactoryInternal *)ConfigFactoryInternal.init()();
}

@end