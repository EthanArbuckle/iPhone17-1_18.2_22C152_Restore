@interface UITextFieldEditingToken
@end

@implementation UITextFieldEditingToken

void __38___UITextFieldEditingToken_endEditing__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 length];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38___UITextFieldEditingToken_endEditing__block_invoke_2;
  v5[3] = &unk_1E52D9A30;
  id v6 = v2;
  id v4 = v2;
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", @"_UILastStoredDefaultTextAttributesName", 0, v3, 0x100000, v5);
}

uint64_t __38___UITextFieldEditingToken_endEditing__block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2) {
    return objc_msgSend(*(id *)(result + 32), "setAttributes:range:", a2, a3, a4);
  }
  return result;
}

void __38___UITextFieldEditingToken_endEditing__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 defaultAttributes];
  id v4 = [v3 objectForKeyedSubscript:@"_UILastStoredDefaultTextAttributesName"];

  [v2 setDefaultAttributes:v4];
}

@end