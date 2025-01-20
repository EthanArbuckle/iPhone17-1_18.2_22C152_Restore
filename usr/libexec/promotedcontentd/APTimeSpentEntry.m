@interface APTimeSpentEntry
- (APTimeSpentEntry)init;
- (APTimeSpentEntry)initWithContentId:(id)a3 timeStamp:(id)a4;
- (NSDate)timeStamp;
- (NSString)contentId;
@end

@implementation APTimeSpentEntry

- (NSString)contentId
{
  swift_bridgeObjectRetain();
  NSString v2 = sub_10019B0A0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSDate)timeStamp
{
  uint64_t v2 = sub_10019ABA0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10019AB40();
  v6.super.isa = sub_10019AAF0().super.isa;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);

  return (NSDate *)v6.super.isa;
}

- (APTimeSpentEntry)initWithContentId:(id)a3 timeStamp:(id)a4
{
  uint64_t v5 = sub_10019ABA0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10019B0B0();
  uint64_t v11 = v10;
  sub_10019AB70();
  v12 = (uint64_t *)((char *)self + OBJC_IVAR___APTimeSpentEntry_contentId);
  uint64_t *v12 = v9;
  v12[1] = v11;
  v13 = self;
  sub_10019AB50();
  *(Class *)((char *)&v13->super.isa + OBJC_IVAR___APTimeSpentEntry_timeInterval) = v14;

  v17.receiver = v13;
  v17.super_class = (Class)APTimeSpentEntry;
  v15 = [(APTimeSpentEntry *)&v17 init];
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v15;
}

- (APTimeSpentEntry)init
{
  result = (APTimeSpentEntry *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end