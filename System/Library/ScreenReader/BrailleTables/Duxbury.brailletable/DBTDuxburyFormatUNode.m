@interface DBTDuxburyFormatUNode
+ (id)beginCode;
+ (id)endCode;
@end

@implementation DBTDuxburyFormatUNode

+ (id)beginCode
{
  return @"us";
}

+ (id)endCode
{
  return @"ue";
}

@end