@interface UIButton(SUScriptButtonAdditions)
- (uint64_t)configureFromScriptButton:()SUScriptButtonAdditions;
@end

@implementation UIButton(SUScriptButtonAdditions)

- (uint64_t)configureFromScriptButton:()SUScriptButtonAdditions
{
  objc_msgSend(a1, "setEnabled:", objc_msgSend(a3, "enabled"));
  [a3 image];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = [a3 image];
  }
  [a1 setImage:v5 forState:0];
  [a3 imageEdgeInsets];
  objc_msgSend(a1, "setImageEdgeInsets:");
  [a3 title];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = 0;
  if ((isKindOfClass & 1) == 0) {
    uint64_t v7 = objc_msgSend(a3, "title", 0);
  }
  [a1 setTitle:v7 forState:0];
  uint64_t result = [a3 tag];
  if (result)
  {
    return [a1 setTag:result];
  }
  return result;
}

@end