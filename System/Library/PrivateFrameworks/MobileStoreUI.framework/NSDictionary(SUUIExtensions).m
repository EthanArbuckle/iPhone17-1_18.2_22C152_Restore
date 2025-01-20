@interface NSDictionary(SUUIExtensions)
+ (id)su_dictionaryWithSize:()SUUIExtensions;
@end

@implementation NSDictionary(SUUIExtensions)

+ (id)su_dictionaryWithSize:()SUUIExtensions
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = @"width";
  v3 = objc_msgSend(NSNumber, "numberWithDouble:");
  v7[1] = @"height";
  v8[0] = v3;
  v4 = [NSNumber numberWithDouble:a2];
  v8[1] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

@end