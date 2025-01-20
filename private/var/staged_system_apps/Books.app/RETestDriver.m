@interface RETestDriver
+ (BOOL)closeBookWithViewController:(id)a3;
+ (BOOL)isValidWithViewController:(id)a3;
+ (BOOL)performScrollTestWithViewController:(id)a3 name:(id)a4 iterations:(int)a5 delta:(int)a6;
+ (BOOL)simulateManualPageTurnWithViewController:(id)a3 rtl:(BOOL)a4 time:(double)a5;
+ (BOOL)turnPageWithViewController:(id)a3 forward:(BOOL)a4;
+ (BOOL)turnToInitialPageWithViewController:(id)a3;
+ (id)getBookControllerLayoutWithViewController:(id)a3;
+ (void)setBookControllerLayout:(id)a3 viewController:(id)a4;
- (_TtC5Books12RETestDriver)init;
@end

@implementation RETestDriver

+ (BOOL)isValidWithViewController:(id)a3
{
  return swift_dynamicCastClass() != 0;
}

+ (BOOL)closeBookWithViewController:(id)a3
{
  type metadata accessor for BookReaderContainerViewController();
  swift_unknownObjectRetain();
  uint64_t v3 = swift_dynamicCastClass();
  if (v3) {
    sub_1005BC678(1);
  }
  swift_unknownObjectRelease();
  return v3 != 0;
}

+ (id)getBookControllerLayoutWithViewController:(id)a3
{
  swift_unknownObjectRetain();
  _s5Books12RETestDriverC23getBookControllerLayout04viewF0SSSgyXl_tFZ_0();
  uint64_t v4 = v3;
  swift_unknownObjectRelease();
  if (v4)
  {
    NSString v5 = sub_1007FDC30();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return v5;
}

+ (void)setBookControllerLayout:(id)a3 viewController:(id)a4
{
  uint64_t v4 = sub_1007FDC70();
  uint64_t v6 = v5;
  swift_unknownObjectRetain();
  _s5Books12RETestDriverC23setBookControllerLayout_04viewF0ySS_yXltFZ_0(v4, v6);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

+ (BOOL)turnPageWithViewController:(id)a3 forward:(BOOL)a4
{
  swift_unknownObjectRetain();
  BOOL v6 = _s5Books12RETestDriverC8turnPage14viewController7forwardSbyXl_SbtFZ_0((uint64_t)a3, a4);
  swift_unknownObjectRelease();
  return v6;
}

+ (BOOL)turnToInitialPageWithViewController:(id)a3
{
  type metadata accessor for BookReaderContainerViewController();
  swift_unknownObjectRetain();
  uint64_t v3 = swift_dynamicCastClass();
  if (v3)
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1007FC420();
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRelease();
  return v3 != 0;
}

+ (BOOL)performScrollTestWithViewController:(id)a3 name:(id)a4 iterations:(int)a5 delta:(int)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = sub_1007FDC70();
  uint64_t v10 = v9;
  type metadata accessor for BookReaderContainerViewController();
  swift_unknownObjectRetain();
  if (swift_dynamicCastClass()) {
    char v11 = sub_1005B8690(v8, v10, v7, a6);
  }
  else {
    char v11 = 0;
  }
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return v11 & 1;
}

+ (BOOL)simulateManualPageTurnWithViewController:(id)a3 rtl:(BOOL)a4 time:(double)a5
{
  type metadata accessor for BookReaderContainerViewController();
  swift_unknownObjectRetain();
  if (swift_dynamicCastClass()) {
    char v7 = sub_1005B88CC(a4, a5);
  }
  else {
    char v7 = 0;
  }
  swift_unknownObjectRelease();
  return v7 & 1;
}

- (_TtC5Books12RETestDriver)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RETestDriver();
  return [(RETestDriver *)&v3 init];
}

@end