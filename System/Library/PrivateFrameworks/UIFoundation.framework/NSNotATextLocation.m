@interface NSNotATextLocation
+ (id)notATextLocation;
- (int64_t)compare:(id)a3;
@end

@implementation NSNotATextLocation

+ (id)notATextLocation
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__NSNotATextLocation_notATextLocation__block_invoke;
  block[3] = &unk_1E55C5470;
  block[4] = a1;
  if (notATextLocation_onceToken != -1) {
    dispatch_once(&notATextLocation_onceToken, block);
  }
  return (id)notATextLocation_notATextLocation;
}

id __38__NSNotATextLocation_notATextLocation__block_invoke()
{
  id result = objc_alloc_init((Class)objc_opt_class());
  notATextLocation_notATextLocation = (uint64_t)result;
  return result;
}

- (int64_t)compare:(id)a3
{
  return -1;
}

@end