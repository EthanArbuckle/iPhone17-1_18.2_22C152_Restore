@interface DBTDuxburyFormatTCNode
+ (id)beginCode;
+ (id)endCode;
@end

@implementation DBTDuxburyFormatTCNode

+ (id)beginCode
{
  return @"tcs";
}

+ (id)endCode
{
  return @"tce";
}

@end