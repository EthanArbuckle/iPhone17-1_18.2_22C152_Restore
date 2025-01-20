@interface PNPartOfWeekCalculator
+ (id)partOfWeekLocalizedNamesForLocalDate:(id)a3 error:(id *)a4;
- (PNPartOfWeekCalculator)init;
@end

@implementation PNPartOfWeekCalculator

+ (id)partOfWeekLocalizedNamesForLocalDate:(id)a3 error:(id *)a4
{
  uint64_t v4 = sub_259955E10();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_259955DF0();
  static PNPartOfWeekCalculator.partOfWeekLocalizedNames(for:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v8 = (void *)sub_259956030();
  swift_bridgeObjectRelease();
  return v8;
}

- (PNPartOfWeekCalculator)init
{
  return (PNPartOfWeekCalculator *)PNPartOfWeekCalculator.init()();
}

@end