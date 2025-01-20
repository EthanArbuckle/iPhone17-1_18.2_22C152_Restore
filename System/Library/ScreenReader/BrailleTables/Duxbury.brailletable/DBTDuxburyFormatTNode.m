@interface DBTDuxburyFormatTNode
+ (id)beginCode;
+ (id)endCode;
@end

@implementation DBTDuxburyFormatTNode

+ (id)beginCode
{
  return @"ts";
}

+ (id)endCode
{
  return @"te";
}

@end