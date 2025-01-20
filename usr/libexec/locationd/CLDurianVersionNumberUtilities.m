@interface CLDurianVersionNumberUtilities
+ (id)getStringFromNumber:(unint64_t)a3;
+ (unint64_t)constructVersionNumberWithMajor:(unint64_t)a3 minor:(unint64_t)a4 build:(unint64_t)a5;
+ (unint64_t)getBuild:(unint64_t)a3;
+ (unint64_t)getMajor:(unint64_t)a3;
+ (unint64_t)getMinor:(unint64_t)a3;
+ (unint64_t)getNumberFromString:(id)a3;
@end

@implementation CLDurianVersionNumberUtilities

+ (unint64_t)getNumberFromString:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@"."];
  if ([v3 count] != (id)3) {
    return 0;
  }
  id v4 = [[v3 objectAtIndexedSubscript:0] integerValue];
  id v5 = [[v3 objectAtIndexedSubscript:1] integerValue];
  id v6 = [[v3 objectAtIndexedSubscript:2] integerValue];

  return +[CLDurianVersionNumberUtilities constructVersionNumberWithMajor:v4 minor:v5 build:v6];
}

+ (id)getStringFromNumber:(unint64_t)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%llu.%llu.%llu", +[CLDurianVersionNumberUtilities getMajor:](CLDurianVersionNumberUtilities, "getMajor:"), +[CLDurianVersionNumberUtilities getMinor:](CLDurianVersionNumberUtilities, "getMinor:", a3), +[CLDurianVersionNumberUtilities getBuild:a3]);
}

+ (unint64_t)constructVersionNumberWithMajor:(unint64_t)a3 minor:(unint64_t)a4 build:(unint64_t)a5
{
  return ((a3 & 0xF) << 16) | ((a4 & 0xF) << 12) | a5 & 0xFFF;
}

+ (unint64_t)getMajor:(unint64_t)a3
{
  return (a3 >> 16) & 0xF;
}

+ (unint64_t)getMinor:(unint64_t)a3
{
  return (unsigned __int16)a3 >> 12;
}

+ (unint64_t)getBuild:(unint64_t)a3
{
  return a3 & 0xFFF;
}

@end