@interface ICActivityStreamDigest(UI)
- (id)initWithObject:()UI;
@end

@implementation ICActivityStreamDigest(UI)

- (id)initWithObject:()UI
{
  id v7 = 0;
  v3 = objc_msgSend(a1, "objc_initWithObject:error:", a3, &v7);
  id v4 = v7;
  id v5 = v3;
  if (!v5) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"digest != ((void *)0)", "-[ICActivityStreamDigest(UI) initWithObject:]", 1, 0, @"Failed to init ActivityStreamDigest: %@", v4 functionName simulateCrash showAlert format];
  }

  return v5;
}

@end