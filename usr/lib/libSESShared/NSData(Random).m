@interface NSData(Random)
+ (id)randomData:()Random;
@end

@implementation NSData(Random)

+ (id)randomData:()Random
{
  [MEMORY[0x263EFF990] dataWithLength:];
  id v0 = objc_claimAutoreleasedReturnValue();
  arc4random_buf((void *)[v0 mutableBytes], [v0 length]);

  return v0;
}

@end