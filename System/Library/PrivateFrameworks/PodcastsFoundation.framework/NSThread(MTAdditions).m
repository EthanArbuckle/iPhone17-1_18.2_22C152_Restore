@interface NSThread(MTAdditions)
+ (void)mainThread:()MTAdditions;
@end

@implementation NSThread(MTAdditions)

+ (void)mainThread:()MTAdditions
{
  v3 = (void *)MEMORY[0x1E4F29060];
  block = a3;
  if ([v3 isMainThread]) {
    block[2]();
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

@end