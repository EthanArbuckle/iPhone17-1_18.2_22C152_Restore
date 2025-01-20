@interface RawUnifiedStreamMessage
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (_TtC13SiriAnalytics23RawUnifiedStreamMessage)init;
- (id)serialize;
- (unsigned)dataVersion;
@end

@implementation RawUnifiedStreamMessage

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  uint64_t v6 = sub_1A2C0CD30();
  unint64_t v8 = v7;

  swift_getObjCClassMetadata();
  id v9 = static RawUnifiedStreamMessage.event(with:dataVersion:)(v6, v8, a4);
  sub_1A2B3EB94(v6, v8);
  return v9;
}

- (id)serialize
{
  v2 = self;
  uint64_t v3 = RawUnifiedStreamMessage.serialize()();
  unint64_t v5 = v4;

  if (v5 >> 60 == 15)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = (void *)sub_1A2C0CD20();
    sub_1A2B48634(v3, v5);
  }
  return v6;
}

- (_TtC13SiriAnalytics23RawUnifiedStreamMessage)init
{
}

- (void).cxx_destruct
{
}

@end