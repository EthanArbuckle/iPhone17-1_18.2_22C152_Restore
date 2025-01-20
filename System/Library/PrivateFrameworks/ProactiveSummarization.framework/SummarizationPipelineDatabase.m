@interface SummarizationPipelineDatabase
- (_TtC22ProactiveSummarization29SummarizationPipelineDatabase)init;
- (id)databaseHandle;
- (id)migrations;
- (id)queriesToSkipFromEmptyToVersion:(unsigned int *)a3;
- (void)dealloc;
@end

@implementation SummarizationPipelineDatabase

- (void)dealloc
{
  v2 = self;
  sub_25A931C90();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC22ProactiveSummarization29SummarizationPipelineDatabase_database);
}

- (id)migrations
{
  v2 = self;
  sub_25A932700();

  sub_25A8DA81C(0, (unint64_t *)&qword_26B32D020);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B32D8B8);
  sub_25A937F60();
  OUTLINED_FUNCTION_54_3();
  v3 = (void *)sub_25A9DCEA8();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)queriesToSkipFromEmptyToVersion:(unsigned int *)a3
{
  sub_25A9328C8(a3);
  v3 = (void *)sub_25A9DD158();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)databaseHandle
{
  id v2 = sub_25A932934();
  return v2;
}

- (_TtC22ProactiveSummarization29SummarizationPipelineDatabase)init
{
}

@end