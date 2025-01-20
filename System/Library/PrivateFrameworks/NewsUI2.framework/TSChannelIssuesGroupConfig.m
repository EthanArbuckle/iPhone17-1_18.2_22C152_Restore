@interface TSChannelIssuesGroupConfig
- (TSChannelIssuesGroupConfig)init;
- (TSChannelIssuesGroupConfig)initWithIssueIDs:(id)a3 channel:(id)a4 title:(id)a5;
@end

@implementation TSChannelIssuesGroupConfig

- (TSChannelIssuesGroupConfig)initWithIssueIDs:(id)a3 channel:(id)a4 title:(id)a5
{
  ObjectType = (objc_class *)swift_getObjectType();
  v8 = (objc_class *)sub_1DFDFE220();
  uint64_t v9 = sub_1DFDFDD20();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TSChannelIssuesGroupConfig_issueIDs) = v8;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TSChannelIssuesGroupConfig_channel) = (Class)a4;
  v10 = (uint64_t *)((char *)self + OBJC_IVAR___TSChannelIssuesGroupConfig_title);
  uint64_t *v10 = v9;
  v10[1] = v11;
  v13.receiver = self;
  v13.super_class = ObjectType;
  swift_unknownObjectRetain();
  return [(TSChannelIssuesGroupConfig *)&v13 init];
}

- (TSChannelIssuesGroupConfig)init
{
  result = (TSChannelIssuesGroupConfig *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

@end