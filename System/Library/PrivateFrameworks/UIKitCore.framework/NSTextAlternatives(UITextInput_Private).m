@interface NSTextAlternatives(UITextInput_Private)
+ (id)attributedText:()UITextInput_Private withAlternativeTexts:style:;
+ (uint64_t)attributedText:()UITextInput_Private withAlternativeTexts:;
@end

@implementation NSTextAlternatives(UITextInput_Private)

+ (uint64_t)attributedText:()UITextInput_Private withAlternativeTexts:
{
  return [off_1E52D2EA8 attributedText:a3 withAlternativeTexts:a4 style:1];
}

+ (id)attributedText:()UITextInput_Private withAlternativeTexts:style:
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  if ([v7 count])
  {
    uint64_t v9 = [objc_alloc((Class)off_1E52D2EA8) initWithPrimaryString:v8 alternativeStrings:v7 isLowConfidence:a5 == 1];
    id v10 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v14 = *(void *)off_1E52D2288;
    v15[0] = v9;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    v12 = (void *)[v10 initWithString:v8 attributes:v11];

    id v8 = (id)v9;
  }
  else
  {
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v8];
  }

  return v12;
}

@end