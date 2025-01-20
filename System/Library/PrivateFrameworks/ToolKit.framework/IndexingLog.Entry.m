@interface IndexingLog.Entry
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (unsigned)latestDataVersion;
- (_TtCC7ToolKit11IndexingLog5Entry)init;
- (id)serialize;
- (unsigned)dataVersion;
@end

@implementation IndexingLog.Entry

+ (unsigned)latestDataVersion
{
  return 1;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  uint64_t v6 = sub_25FFFD148();
  unint64_t v8 = v7;

  swift_getObjCClassMetadata();
  v9 = (void *)sub_25FB9D70C(v6, v8, a4);
  sub_25FB9CD08(v6, v8);
  return v9;
}

- (id)serialize
{
  v2 = self;
  uint64_t v3 = sub_25FB9D958();
  unint64_t v5 = v4;

  if (v5 >> 60 == 15)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = (void *)sub_25FFFD108();
    sub_25FB9CD60(v3, v5);
  }
  return v6;
}

- (_TtCC7ToolKit11IndexingLog5Entry)init
{
}

- (void).cxx_destruct
{
}

@end