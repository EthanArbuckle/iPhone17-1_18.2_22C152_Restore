@interface FunctionalInterfaceUtils
+ (id)stringForFunctionalInterfaceType:(unsigned __int8)a3;
+ (int64_t)nwInterfaceSubtypeForNWFunctionalInterfaceType:(unsigned __int8)a3;
+ (int64_t)nwInterfaceTypeForNWFunctionalInterfaceType:(unsigned __int8)a3;
+ (unsigned)nwFunctionalInterfaceTypeForNWInterface:(id)a3;
+ (unsigned)nwFunctionalInterfaceTypeForNWInterfaceSubtype:(int64_t)a3;
+ (unsigned)nwFunctionalInterfaceTypeForNWInterfaceType:(int64_t)a3;
+ (unsigned)nwFunctionalInterfaceTypeForNWInterfaceType:(int64_t)a3 nwInterfaceSubtype:(int64_t)a4;
@end

@implementation FunctionalInterfaceUtils

+ (int64_t)nwInterfaceTypeForNWFunctionalInterfaceType:(unsigned __int8)a3
{
  return nw_interface_functional_type_to_interface_type();
}

+ (int64_t)nwInterfaceSubtypeForNWFunctionalInterfaceType:(unsigned __int8)a3
{
  return nw_interface_functional_type_to_interface_subtype();
}

+ (id)stringForFunctionalInterfaceType:(unsigned __int8)a3
{
  if ((a3 - 1) > 6) {
    return @"Other";
  }
  else {
    return off_26552AD28[(char)(a3 - 1)];
  }
}

+ (unsigned)nwFunctionalInterfaceTypeForNWInterfaceType:(int64_t)a3 nwInterfaceSubtype:(int64_t)a4
{
  return MEMORY[0x270EF83C8](a3, a4);
}

+ (unsigned)nwFunctionalInterfaceTypeForNWInterfaceType:(int64_t)a3
{
  return +[FunctionalInterfaceUtils nwFunctionalInterfaceTypeForNWInterfaceType:a3 nwInterfaceSubtype:0];
}

+ (unsigned)nwFunctionalInterfaceTypeForNWInterface:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 type];
  uint64_t v5 = [v3 subtype];

  return +[FunctionalInterfaceUtils nwFunctionalInterfaceTypeForNWInterfaceType:v4 nwInterfaceSubtype:v5];
}

+ (unsigned)nwFunctionalInterfaceTypeForNWInterfaceSubtype:(int64_t)a3
{
  return +[FunctionalInterfaceUtils nwFunctionalInterfaceTypeForNWInterfaceType:0 nwInterfaceSubtype:a3];
}

@end