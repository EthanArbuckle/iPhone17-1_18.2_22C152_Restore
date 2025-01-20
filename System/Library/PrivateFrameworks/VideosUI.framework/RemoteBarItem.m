@interface RemoteBarItem
- (BOOL)isEqual:(id)a3;
- (_TtC8VideosUI13RemoteBarItem)init;
@end

@implementation RemoteBarItem

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1E387DB08();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_1E343D5C8((uint64_t)v8);

  sub_1E2BEA314((uint64_t)v8, &qword_1EBF91570);
  return v6 & 1;
}

- (_TtC8VideosUI13RemoteBarItem)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_95_0();
  OUTLINED_FUNCTION_95_0();
  OUTLINED_FUNCTION_95_0();
  swift_release();
  OUTLINED_FUNCTION_95_0();
  OUTLINED_FUNCTION_95_0();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_95_0();

  swift_release();
}

@end