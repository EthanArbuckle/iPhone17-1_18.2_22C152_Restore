@interface ICQAppLaunchLinkTracker
+ (ICQAppLaunchLinkTracker)shared;
+ (int64_t)neverShown;
- (BOOL)osUpgradeSinceLastShownForBundleID:(id)a3;
- (ICQAppLaunchLinkTracker)init;
- (id)allDaysSinceLastShown;
- (id)lastShownDateForBundleID:(id)a3;
- (int64_t)daysSinceLastShownForBundleID:(id)a3;
- (void)setLastShownDate:(id)a3 forBundleID:(id)a4;
@end

@implementation ICQAppLaunchLinkTracker

+ (int64_t)neverShown
{
  return -1;
}

+ (ICQAppLaunchLinkTracker)shared
{
  if (qword_1EB786DA8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EB786DA0;
  return (ICQAppLaunchLinkTracker *)v2;
}

- (id)lastShownDateForBundleID:(id)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB786CC8);
  MEMORY[0x1F4188790](v4 - 8);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1D58CCAF0();
  uint64_t v9 = v8;
  v10 = self;
  sub_1D58BEF20(v7, v9, (uint64_t)v6);

  swift_bridgeObjectRelease();
  uint64_t v11 = sub_1D58CC790();
  uint64_t v12 = *(void *)(v11 - 8);
  v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v6, 1, v11) != 1)
  {
    v13 = (void *)sub_1D58CC740();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v6, v11);
  }
  return v13;
}

- (int64_t)daysSinceLastShownForBundleID:(id)a3
{
  uint64_t v4 = sub_1D58CCAF0();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  int64_t v8 = sub_1D58BF730(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (id)allDaysSinceLastShown
{
  v2 = self;
  uint64_t v3 = sub_1D58BFF60();

  if (v3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723668);
    uint64_t v4 = (void *)sub_1D58CCB50();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (BOOL)osUpgradeSinceLastShownForBundleID:(id)a3
{
  uint64_t v4 = sub_1D58CCAF0();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  LOBYTE(v4) = sub_1D58C0B84(v4, v6);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (void)setLastShownDate:(id)a3 forBundleID:(id)a4
{
  uint64_t v5 = sub_1D58CC790();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  int64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D58CC760();
  uint64_t v9 = sub_1D58CCAF0();
  unint64_t v11 = v10;
  uint64_t v12 = self;
  sub_1D58C0FB4((uint64_t)v8, v9, v11);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (ICQAppLaunchLinkTracker)init
{
  result = (ICQAppLaunchLinkTracker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end