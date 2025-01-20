@interface UIMenu(IC)
+ (id)ic_inlineMenuWithElementSize:()IC children:;
+ (uint64_t)ic_inlineMenuWithChildren:()IC;
@end

@implementation UIMenu(IC)

+ (uint64_t)ic_inlineMenuWithChildren:()IC
{
  return [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F0973378 image:0 identifier:0 options:1 children:a3];
}

+ (id)ic_inlineMenuWithElementSize:()IC children:
{
  v5 = objc_msgSend(a1, "ic_inlineMenuWithChildren:", a4);
  [v5 setPreferredElementSize:a3];
  return v5;
}

@end