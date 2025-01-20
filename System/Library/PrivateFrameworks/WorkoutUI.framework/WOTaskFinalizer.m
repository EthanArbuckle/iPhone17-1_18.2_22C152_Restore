@interface WOTaskFinalizer
+ (void)appendTaskWithIdentifier:(id)a3 task:(id)a4;
+ (void)finalizeWithIdentifier:(id)a3;
+ (void)replaceTasksWithIdentifier:(id)a3 with:(id)a4;
- (WOTaskFinalizer)init;
@end

@implementation WOTaskFinalizer

- (WOTaskFinalizer)init
{
  return (WOTaskFinalizer *)sub_261B23940();
}

+ (void)appendTaskWithIdentifier:(id)a3 task:(id)a4
{
  v4 = _Block_copy(a4);
  uint64_t v5 = sub_261B8F0F8();
  uint64_t v7 = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v4;
  if (qword_26A942EC8 != -1) {
    swift_once();
  }
  sub_261B23D04(v5, v7, (uint64_t)sub_261B2927C, v8);
  swift_bridgeObjectRelease();
  swift_release();
}

+ (void)replaceTasksWithIdentifier:(id)a3 with:(id)a4
{
  v4 = _Block_copy(a4);
  uint64_t v5 = sub_261B8F0F8();
  uint64_t v7 = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v4;
  if (qword_26A942EC8 != -1) {
    swift_once();
  }
  sub_261B24B8C(v5, v7, (uint64_t)sub_261B28C3C, v8);
  swift_bridgeObjectRelease();
  swift_release();
}

+ (void)finalizeWithIdentifier:(id)a3
{
  uint64_t v3 = sub_261B8F0F8();
  uint64_t v5 = v4;
  if (qword_26A942EC8 != -1) {
    swift_once();
  }
  sub_261B2529C(v3, v5);
  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end