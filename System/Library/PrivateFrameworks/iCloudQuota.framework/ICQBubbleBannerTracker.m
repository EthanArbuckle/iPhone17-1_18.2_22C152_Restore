@interface ICQBubbleBannerTracker
+ (ICQBubbleBannerTracker)shared;
- (BOOL)account:(id)a3 shouldDisplay:(id)a4 forReason:(id)a5 dismissedInSession:(BOOL)a6 supressUntil:(double)a7;
- (ICQBubbleBannerTracker)init;
- (id)account:(id)a3 lastUpdated:(id)a4 decayUntil:(double)a5;
- (void)trackLastDismissed:(id)a3 date:(id)a4 reason:(id)a5;
- (void)trackLastDisplayedAtTheTop:(id)a3 date:(id)a4 reason:(id)a5;
@end

@implementation ICQBubbleBannerTracker

+ (ICQBubbleBannerTracker)shared
{
  if (qword_1EB786E10 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EB786E38;
  return (ICQBubbleBannerTracker *)v2;
}

- (void)trackLastDisplayedAtTheTop:(id)a3 date:(id)a4 reason:(id)a5
{
}

- (void)trackLastDismissed:(id)a3 date:(id)a4 reason:(id)a5
{
}

- (BOOL)account:(id)a3 shouldDisplay:(id)a4 forReason:(id)a5 dismissedInSession:(BOOL)a6 supressUntil:(double)a7
{
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB786CC8);
  MEMORY[0x1F4188790](v12 - 8);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_1D58CC760();
    uint64_t v15 = sub_1D58CC790();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 0, 1, v15);
  }
  else
  {
    uint64_t v16 = sub_1D58CC790();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v14, 1, 1, v16);
  }
  uint64_t v17 = sub_1D58CCAF0();
  uint64_t v19 = v18;
  v20 = (void (*)(char *, char *, uint64_t))a3;
  v21 = self;
  char v23 = sub_1D58B046C(v20, a7, v22, v17, v19, a6);

  swift_bridgeObjectRelease();
  sub_1D58AC5C4((uint64_t)v14, &qword_1EB786CC8);
  return v23 & 1;
}

- (id)account:(id)a3 lastUpdated:(id)a4 decayUntil:(double)a5
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB786CC8);
  MEMORY[0x1F4188790](v8 - 8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1D58CCAF0();
  uint64_t v13 = v12;
  id v14 = a3;
  uint64_t v15 = self;
  sub_1D58B187C(v14, v11, v13, (uint64_t)v10, *(uint64_t *)&a5);

  swift_bridgeObjectRelease();
  uint64_t v16 = sub_1D58CC790();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v10, 1, v16) != 1)
  {
    uint64_t v18 = (void *)sub_1D58CC740();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v10, v16);
  }
  return v18;
}

- (ICQBubbleBannerTracker)init
{
  result = (ICQBubbleBannerTracker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end