@interface ForYouConfigRecord.HeadlineMetadata
- (NSDate)displayDate;
- (NSString)storyType;
- (NSString)title;
- (_TtCV10StocksCore18ForYouConfigRecordP33_FB30AEA7B56282916E4430A3993C597516HeadlineMetadata)init;
@end

@implementation ForYouConfigRecord.HeadlineMetadata

- (NSDate)displayDate
{
  sub_1AFD2C83C();
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AFD2D4A8((uint64_t)self+ OBJC_IVAR____TtCV10StocksCore18ForYouConfigRecordP33_FB30AEA7B56282916E4430A3993C597516HeadlineMetadata_displayDate, (uint64_t)v5, (uint64_t (*)(void))sub_1AFD2C83C);
  uint64_t v6 = sub_1AFFC98F8();
  uint64_t v7 = *(void *)(v6 - 8);
  v8 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
  {
    v8 = (void *)sub_1AFFC9838();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  }

  return (NSDate *)v8;
}

- (NSString)storyType
{
  return (NSString *)sub_1AFD2B8F4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtCV10StocksCore18ForYouConfigRecordP33_FB30AEA7B56282916E4430A3993C597516HeadlineMetadata_storyType);
}

- (NSString)title
{
  return (NSString *)sub_1AFD2B8F4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtCV10StocksCore18ForYouConfigRecordP33_FB30AEA7B56282916E4430A3993C597516HeadlineMetadata_title);
}

- (_TtCV10StocksCore18ForYouConfigRecordP33_FB30AEA7B56282916E4430A3993C597516HeadlineMetadata)init
{
  result = (_TtCV10StocksCore18ForYouConfigRecordP33_FB30AEA7B56282916E4430A3993C597516HeadlineMetadata *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AFD2D510((uint64_t)self+ OBJC_IVAR____TtCV10StocksCore18ForYouConfigRecordP33_FB30AEA7B56282916E4430A3993C597516HeadlineMetadata_displayDate, (uint64_t (*)(void))sub_1AFD2C83C);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end