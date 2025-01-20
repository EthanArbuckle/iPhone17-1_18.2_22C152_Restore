@interface NSValue(NSValueGeometryExtensions)
+ (uint64_t)valueWithPoint:()NSValueGeometryExtensions;
+ (uint64_t)valueWithRect:()NSValueGeometryExtensions;
+ (uint64_t)valueWithSize:()NSValueGeometryExtensions;
@end

@implementation NSValue(NSValueGeometryExtensions)

+ (uint64_t)valueWithSize:()NSValueGeometryExtensions
{
  return objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:");
}

+ (uint64_t)valueWithRect:()NSValueGeometryExtensions
{
  return objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:");
}

+ (uint64_t)valueWithPoint:()NSValueGeometryExtensions
{
  return objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:");
}

@end