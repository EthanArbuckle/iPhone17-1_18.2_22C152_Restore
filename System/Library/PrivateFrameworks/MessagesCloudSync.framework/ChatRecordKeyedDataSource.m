@interface ChatRecordKeyedDataSource
- (_TtC17MessagesCloudSync25ChatRecordKeyedDataSource)init;
- (id)arrayForKey:(id)a3;
- (id)assetURLForKey:(id)a3;
- (id)dataForKey:(id)a3;
- (id)dictForKey:(id)a3;
- (id)numberForKey:(id)a3;
- (id)sourceRecordChangeTag;
- (id)sourceRecordName;
- (id)sourceRecordType;
- (id)stringForKey:(id)a3;
@end

@implementation ChatRecordKeyedDataSource

- (id)sourceRecordType
{
  uint64_t v3 = type metadata accessor for ChatRecord(0);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_223380354((uint64_t)self + OBJC_IVAR____TtC17MessagesCloudSync25ChatRecordKeyedDataSource_chatRecord, (uint64_t)v5);
  uint64_t v6 = *((void *)v5 + 9);
  swift_bridgeObjectRetain();
  sub_2233803B8((uint64_t)v5);
  if (v6)
  {
    v7 = (void *)sub_22342C2D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)sourceRecordName
{
  if (*(void *)&self->chatRecord[OBJC_IVAR____TtC17MessagesCloudSync25ChatRecordKeyedDataSource_chatRecord + 48])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_22342C2D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)sourceRecordChangeTag
{
  if (*(void *)&self->chatRecord[OBJC_IVAR____TtC17MessagesCloudSync25ChatRecordKeyedDataSource_chatRecord + 32])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_22342C2D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)stringForKey:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_22342C300();
    unint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v6 = 0;
  }
  v7 = self;
  sub_22339999C(v4, v6);
  uint64_t v9 = v8;

  swift_bridgeObjectRelease();
  if (v9)
  {
    v10 = (void *)sub_22342C2D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)numberForKey:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_22342C300();
    unint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v6 = 0;
  }
  v7 = self;
  uint64_t v8 = (void *)sub_223399F14(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (id)dictForKey:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_22342C300();
    unint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v6 = 0;
  }
  v7 = self;
  unint64_t v8 = sub_22339A3F0(v4, v6);

  swift_bridgeObjectRelease();
  if (v8)
  {
    uint64_t v9 = (void *)sub_22342C260();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = 0;
  }
  return v9;
}

- (id)dataForKey:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_22342C300();
    unint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v6 = 0;
  }
  v7 = self;
  uint64_t v8 = sub_22339A7B0(v4, v6);
  unint64_t v10 = v9;

  swift_bridgeObjectRelease();
  if (v10 >> 60 == 15)
  {
    v11 = 0;
  }
  else
  {
    v11 = (void *)sub_22342C050();
    sub_223322054(v8, v10);
  }
  return v11;
}

- (id)arrayForKey:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_22342C300();
    unint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v6 = 0;
  }
  v7 = self;
  uint64_t v8 = sub_22339AEB0(v4, v6);

  swift_bridgeObjectRelease();
  if (v8)
  {
    unint64_t v9 = (void *)sub_22342C490();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v9 = 0;
  }
  return v9;
}

- (id)assetURLForKey:(id)a3
{
  uint64_t v5 = sub_22331E640((uint64_t *)&unk_26AD5EFC0);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    uint64_t v8 = sub_22342C300();
    a3 = v9;
  }
  else
  {
    uint64_t v8 = 0;
  }
  unint64_t v10 = self;
  sub_22339B2E0(v8, (unint64_t)a3, (uint64_t)v7);

  swift_bridgeObjectRelease();
  uint64_t v11 = sub_22342C010();
  uint64_t v12 = *(void *)(v11 - 8);
  v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v7, 1, v11) != 1)
  {
    v13 = (void *)sub_22342BF80();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v11);
  }
  return v13;
}

- (_TtC17MessagesCloudSync25ChatRecordKeyedDataSource)init
{
  result = (_TtC17MessagesCloudSync25ChatRecordKeyedDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end