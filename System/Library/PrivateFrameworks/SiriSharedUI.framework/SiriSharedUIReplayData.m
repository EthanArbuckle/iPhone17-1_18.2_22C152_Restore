@interface SiriSharedUIReplayData
+ (BOOL)supportsSecureCoding;
- (_TtC12SiriSharedUI22SiriSharedUIReplayData)init;
- (_TtC12SiriSharedUI22SiriSharedUIReplayData)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SiriSharedUIReplayData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20CA1FD2C(v4);
}

- (_TtC12SiriSharedUI22SiriSharedUIReplayData)initWithCoder:(id)a3
{
  return (_TtC12SiriSharedUI22SiriSharedUIReplayData *)sub_20CA1FEC4(a3);
}

- (_TtC12SiriSharedUI22SiriSharedUIReplayData)init
{
  result = (_TtC12SiriSharedUI22SiriSharedUIReplayData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12SiriSharedUI22SiriSharedUIReplayData_addViewsData);
  unint64_t v4 = *(void *)&self->utterance[OBJC_IVAR____TtC12SiriSharedUI22SiriSharedUIReplayData_addViewsData];
  sub_20CA0B4A0(v3, v4);
}

@end