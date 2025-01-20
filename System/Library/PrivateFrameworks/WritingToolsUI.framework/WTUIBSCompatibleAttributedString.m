@interface WTUIBSCompatibleAttributedString
+ (id)allowedClasses;
@end

@implementation WTUIBSCompatibleAttributedString

+ (id)allowedClasses
{
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___WTUIBSCompatibleAttributedString;
  v2 = objc_msgSendSuper2(&v9, sel_allowedClasses);
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  v7 = [v2 setByAddingObjectsFromSet:v6];

  return v7;
}

@end