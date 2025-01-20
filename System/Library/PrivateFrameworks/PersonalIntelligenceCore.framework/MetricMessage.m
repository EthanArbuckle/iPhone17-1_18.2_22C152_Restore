@interface MetricMessage
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (NSString)description;
- (_TtC24PersonalIntelligenceCore13MetricMessage)init;
- (id)json;
- (id)serialize;
- (unsigned)dataVersion;
@end

@implementation MetricMessage

- (unsigned)dataVersion
{
  return 1;
}

- (NSString)description
{
  v2 = self;
  sub_1CABEED8C();

  v3 = (void *)sub_1CABFC978();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  uint64_t v6 = sub_1CABFC778();
  unint64_t v8 = v7;

  swift_getObjCClassMetadata();
  v9 = (void *)sub_1CABEF048(v6, v8, a4);
  sub_1CABF0270(v6, v8);
  return v9;
}

- (id)serialize
{
  return sub_1CABEF8A0(self, (uint64_t)a2, (void (*)(void))sub_1CABEF680);
}

- (id)json
{
  return sub_1CABEF8A0(self, (uint64_t)a2, (void (*)(void))sub_1CABEF724);
}

- (_TtC24PersonalIntelligenceCore13MetricMessage)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end