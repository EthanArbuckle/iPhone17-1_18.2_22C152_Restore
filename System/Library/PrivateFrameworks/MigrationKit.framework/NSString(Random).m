@interface NSString(Random)
+ (id)mk_randomAlphanumericStringWithLength:()Random;
@end

@implementation NSString(Random)

+ (id)mk_randomAlphanumericStringWithLength:()Random
{
  uint64_t v3 = a3;
  for (i = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithCapacity:a3]; v3; --v3)
    [i appendFormat:@"%c", objc_msgSend(@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789", "characterAtIndex:", arc4random_uniform(objc_msgSend(@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789", "length")))];
  return i;
}

@end