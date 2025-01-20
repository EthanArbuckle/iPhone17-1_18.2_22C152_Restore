@interface PNPartOfDayCalculator
+ (id)partOfDayLocalizedNamesForLocalDate:(id)a3 error:(id *)a4;
- (PNPartOfDayCalculator)init;
@end

@implementation PNPartOfDayCalculator

+ (id)partOfDayLocalizedNamesForLocalDate:(id)a3 error:(id *)a4
{
  uint64_t v4 = sub_259955E10();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_259955DF0();
  static PNPartOfDayCalculator.partOfDayLocalizedNames(for:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v8 = (void *)sub_259956030();
  swift_bridgeObjectRelease();
  return v8;
}

- (PNPartOfDayCalculator)init
{
  return (PNPartOfDayCalculator *)PNPartOfDayCalculator.init()();
}

@end