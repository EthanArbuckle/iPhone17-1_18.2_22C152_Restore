@interface ConfigInternal
+ (BOOL)supportsSecureCoding;
- (BOOL)configBoolForKey:(id)a3;
- (BOOL)isEnabled;
- (BOOL)isExpired;
- (NSString)clientName;
- (NSString)firstUseDescriptionText;
- (NSString)searchURLString;
- (NSString)userAgent;
- (_TtC20PegasusConfiguration14ConfigInternal)init;
- (_TtC20PegasusConfiguration14ConfigInternal)initWithCoder:(id)a3;
- (id)findConfigForUserAgent:(id)a3;
- (id)rawConfig;
- (id)valueForKey:(id)a3;
- (id)valueForKey:(id)a3 ofType:(Class)a4;
- (id)valueForKey:(id)a3 shouldConsiderOverrides:(BOOL)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ConfigInternal

- (NSString)userAgent
{
  return (NSString *)sub_1B3893EEC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC20PegasusConfiguration14ConfigInternal_userAgent);
}

- (NSString)clientName
{
  return (NSString *)sub_1B3893EEC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC20PegasusConfiguration14ConfigInternal_clientName);
}

- (BOOL)isEnabled
{
  v2 = self;
  BOOL v3 = sub_1B3893FB4();

  return v3;
}

- (NSString)firstUseDescriptionText
{
  return (NSString *)sub_1B38942AC(self, (uint64_t)a2, (void (*)(void))sub_1B3894020);
}

- (BOOL)isExpired
{
  v2 = self;
  BOOL v3 = sub_1B38941E8();

  return v3;
}

- (NSString)searchURLString
{
  return (NSString *)sub_1B38942AC(self, (uint64_t)a2, (void (*)(void))sub_1B389432C);
}

- (id)findConfigForUserAgent:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1B389C2B0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  id v8 = sub_1B3894840(v4, v6);

  swift_bridgeObjectRelease();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1B3894B20(v4);
}

- (_TtC20PegasusConfiguration14ConfigInternal)initWithCoder:(id)a3
{
  return (_TtC20PegasusConfiguration14ConfigInternal *)sub_1B3894CD8(a3);
}

- (id)valueForKey:(id)a3 shouldConsiderOverrides:(BOOL)a4
{
  uint64_t v5 = sub_1B389C2B0();
  uint64_t v7 = v6;
  id v8 = self;
  sub_1B3894ED8(v5, v7, &v16);

  swift_bridgeObjectRelease();
  uint64_t v9 = v17;
  if (v17)
  {
    v10 = __swift_project_boxed_opaque_existential_1(&v16, v17);
    uint64_t v11 = *(void *)(v9 - 8);
    MEMORY[0x1F4188790](v10);
    v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v11 + 16))(v13);
    v14 = (void *)sub_1B389C910();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v9);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v16);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)configBoolForKey:(id)a3
{
  uint64_t v4 = sub_1B389C2B0();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  LOBYTE(v4) = sub_1B3893FE8(v4, v6);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (id)valueForKey:(id)a3 ofType:(Class)a4
{
  uint64_t v5 = sub_1B389C2B0();
  uint64_t v7 = v6;
  swift_getObjCClassMetadata();
  id v8 = self;
  sub_1B3895D1C(v5, v7, (uint64_t)v16);

  swift_bridgeObjectRelease();
  uint64_t v9 = v17;
  if (v17)
  {
    v10 = __swift_project_boxed_opaque_existential_1(v16, v17);
    uint64_t v11 = *(void *)(v9 - 8);
    MEMORY[0x1F4188790](v10);
    v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v11 + 16))(v13);
    v14 = (void *)sub_1B389C910();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v9);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)valueForKey:(id)a3
{
  uint64_t v4 = sub_1B389C2B0();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  sub_1B3895E98(v4, v6, &v15);

  swift_bridgeObjectRelease();
  uint64_t v8 = v16;
  if (v16)
  {
    uint64_t v9 = __swift_project_boxed_opaque_existential_1(&v15, v16);
    uint64_t v10 = *(void *)(v8 - 8);
    MEMORY[0x1F4188790](v9);
    uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v12);
    v13 = (void *)sub_1B389C910();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v8);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v15);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (_TtC20PegasusConfiguration14ConfigInternal)init
{
}

- (void).cxx_destruct
{
  sub_1B386CE50(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC20PegasusConfiguration14ConfigInternal_data), *(void *)&self->data[OBJC_IVAR____TtC20PegasusConfiguration14ConfigInternal_data]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  BOOL v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC20PegasusConfiguration14ConfigInternal_userDefaults);
}

- (id)rawConfig
{
  v2 = self;
  id v3 = sub_1B38960F8();

  if (v3)
  {
    uint64_t v4 = (void *)sub_1B389C200();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

@end