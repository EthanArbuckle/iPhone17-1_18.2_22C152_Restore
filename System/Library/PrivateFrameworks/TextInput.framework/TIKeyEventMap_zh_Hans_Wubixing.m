@interface TIKeyEventMap_zh_Hans_Wubixing
+ (BOOL)supportsSecureCoding;
+ (id)sharedInstance;
- (id)punctuationMap;
@end

@implementation TIKeyEventMap_zh_Hans_Wubixing

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__TIKeyEventMap_zh_Hans_Wubixing_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance___onceToken_317 != -1) {
    dispatch_once(&sharedInstance___onceToken_317, block);
  }
  v2 = (void *)sharedInstance___keyEventMap_316;

  return v2;
}

- (id)punctuationMap
{
  v2 = objc_opt_class();

  return (id)objc_msgSend(v2, "punctuationMap_zh_Hans");
}

@end