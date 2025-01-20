@interface PMMTypes
+ (id)consumerToString:(unint64_t)a3;
+ (id)predictedAnchorTypeToString:(int64_t)a3;
+ (id)predictionSourceToString:(unint64_t)a3;
@end

@implementation PMMTypes

+ (id)consumerToString:(unint64_t)a3
{
  if (a3 > 5) {
    return 0;
  }
  else {
    return off_2646DFBB0[a3];
  }
}

+ (id)predictionSourceToString:(unint64_t)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return off_2646DFBE0[a3];
  }
}

+ (id)predictedAnchorTypeToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x12) {
    return @"Unknown";
  }
  else {
    return off_2646DFBF8[a3 - 1];
  }
}

@end