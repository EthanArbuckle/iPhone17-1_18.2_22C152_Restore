@interface VisionTagArbiter
+ (BOOL)isSceneNetTagAnObjectTagWithTag:(id)a3;
+ (BOOL)isSceneNetTagUninterestingWithTag:(id)a3;
- (_TtC27SmartRepliesMLRuntimePlugin16VisionTagArbiter)init;
@end

@implementation VisionTagArbiter

+ (BOOL)isSceneNetTagUninterestingWithTag:(id)a3
{
  return sub_1000046A0((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, &qword_100018BE0, (uint64_t)&qword_100018BE8);
}

+ (BOOL)isSceneNetTagAnObjectTagWithTag:(id)a3
{
  return sub_1000046A0((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, &qword_100018BF0, (uint64_t)&qword_100018BF8);
}

- (_TtC27SmartRepliesMLRuntimePlugin16VisionTagArbiter)init
{
  return (_TtC27SmartRepliesMLRuntimePlugin16VisionTagArbiter *)sub_100009684();
}

@end