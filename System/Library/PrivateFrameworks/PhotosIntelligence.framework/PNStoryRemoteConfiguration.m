@interface PNStoryRemoteConfiguration
+ (NSString)personalTraitsEntityConfiguration;
- (PNStoryRemoteConfiguration)init;
- (id)fileURLForFactorKey:(id)a3 error:(id *)a4;
@end

@implementation PNStoryRemoteConfiguration

+ (NSString)personalTraitsEntityConfiguration
{
  static StoryRemoteConfiguration.personalTraitsEntityConfiguration.getter();
  v2 = (void *)sub_259844070();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (PNStoryRemoteConfiguration)init
{
  return (PNStoryRemoteConfiguration *)StoryRemoteConfiguration.init()();
}

- (id)fileURLForFactorKey:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_259842680();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2598440A0();
  v9 = self;
  sub_259571E64();
  swift_bridgeObjectRelease();

  v10 = (void *)sub_2598425F0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v10;
}

- (void).cxx_destruct
{
}

@end