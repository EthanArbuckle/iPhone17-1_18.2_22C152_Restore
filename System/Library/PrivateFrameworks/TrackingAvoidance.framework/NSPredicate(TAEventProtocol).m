@interface NSPredicate(TAEventProtocol)
+ (id)predicateForTAEventsClass:()TAEventProtocol;
+ (id)predicateForTAEventsClass:()TAEventProtocol andEventSubtype:;
+ (id)predicateForTAEventsInDateInterval:()TAEventProtocol;
@end

@implementation NSPredicate(TAEventProtocol)

+ (id)predicateForTAEventsInDateInterval:()TAEventProtocol
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x263F08A98];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __67__NSPredicate_TAEventProtocol__predicateForTAEventsInDateInterval___block_invoke;
  v8[3] = &unk_2646AAA40;
  id v9 = v3;
  id v5 = v3;
  v6 = [v4 predicateWithBlock:v8];

  return v6;
}

+ (id)predicateForTAEventsClass:()TAEventProtocol
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__NSPredicate_TAEventProtocol__predicateForTAEventsClass___block_invoke;
  v5[3] = &__block_descriptor_40_e25_B24__0_8__NSDictionary_16lu32l8;
  v5[4] = a3;
  id v3 = [MEMORY[0x263F08A98] predicateWithBlock:v5];
  return v3;
}

+ (id)predicateForTAEventsClass:()TAEventProtocol andEventSubtype:
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __74__NSPredicate_TAEventProtocol__predicateForTAEventsClass_andEventSubtype___block_invoke;
  v6[3] = &__block_descriptor_48_e25_B24__0_8__NSDictionary_16lu32l8;
  v6[4] = a3;
  v6[5] = a4;
  v4 = [MEMORY[0x263F08A98] predicateWithBlock:v6];
  return v4;
}

@end