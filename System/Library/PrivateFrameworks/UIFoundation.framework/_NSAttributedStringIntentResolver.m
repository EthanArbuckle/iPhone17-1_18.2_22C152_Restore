@interface _NSAttributedStringIntentResolver
+ (id)attributedStringByResolvingString:(id)a3;
+ (id)attributesByResolvingIntentsInAttributes:(id)a3;
+ (id)fontAttributeValueForInlineIntent:(int64_t)a3 suggestedBaseFont:(id)a4 suggestingTheDefaultFont:(BOOL)a5;
+ (id)fontAttributeValueForInlinePresentationIntent:(unint64_t)a3 suggestedBaseFont:(id)a4 suggestingTheDefaultFont:(BOOL)a5;
+ (void)_replaceInlinePresentationIntent:(id)a3 get:(id)a4 set:(id)a5;
+ (void)_replaceInlinePresentationIntentInString:(id)a3 range:(_NSRange)a4 value:(id)a5;
+ (void)resolveAttributedString:(id)a3 inRange:(_NSRange)a4;
@end

@implementation _NSAttributedStringIntentResolver

+ (void)resolveAttributedString:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if ([a3 _mayRequireIntentResolution])
  {
    uint64_t v8 = *MEMORY[0x1E4F28470];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __69___NSAttributedStringIntentResolver_resolveAttributedString_inRange___block_invoke;
    v9[3] = &unk_1E55C6990;
    v9[4] = a1;
    v9[5] = a3;
    objc_msgSend(a3, "enumerateAttribute:inRange:options:usingBlock:", v8, location, length, 0x100000, v9);
    if (!length && location == [a3 length]) {
      [a3 _markIntentsResolved];
    }
  }
}

+ (id)attributedStringByResolvingString:(id)a3
{
  if (![a3 _mayRequireIntentResolution]) {
    return a3;
  }
  v5 = [[_NSAttributedStringWithResolvedIntents alloc] initWithUnresolvedString:a3 resolver:a1];

  return v5;
}

+ (id)attributesByResolvingIntentsInAttributes:(id)a3
{
  id v3 = a3;
  uint64_t v5 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F28470]];
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__4;
  v13 = __Block_byref_object_dispose__4;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78___NSAttributedStringIntentResolver_attributesByResolvingIntentsInAttributes___block_invoke;
  v8[3] = &unk_1E55C69B8;
  v8[4] = v3;
  v8[5] = &v9;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78___NSAttributedStringIntentResolver_attributesByResolvingIntentsInAttributes___block_invoke_2;
  v7[3] = &unk_1E55C69E0;
  v7[4] = v3;
  v7[5] = &v9;
  [a1 _replaceInlinePresentationIntent:v5 get:v8 set:v7];
  if (v10[5]) {
    id v3 = (id)v10[5];
  }
  _Block_object_dispose(&v9, 8);
  return v3;
}

+ (void)_replaceInlinePresentationIntentInString:(id)a3 range:(_NSRange)a4 value:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __90___NSAttributedStringIntentResolver__replaceInlinePresentationIntentInString_range_value___block_invoke;
    v11[3] = &unk_1E55C6A08;
    v11[4] = a3;
    v11[5] = location;
    v11[6] = length;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __90___NSAttributedStringIntentResolver__replaceInlinePresentationIntentInString_range_value___block_invoke_2;
    v10[3] = &unk_1E55C6A30;
    v10[4] = a3;
    v10[5] = location;
    v10[6] = length;
    [a1 _replaceInlinePresentationIntent:a5 get:v11 set:v10];
  }
}

+ (void)_replaceInlinePresentationIntent:(id)a3 get:(id)a4 set:(id)a5
{
  uint64_t v8 = [a3 integerValue];
  uint64_t v9 = (*((uint64_t (**)(id, __CFString *))a4 + 2))(a4, @"NSFont");
  uint64_t v10 = v9;
  uint64_t v11 = v9;
  if (!v9) {
    uint64_t v11 = NSDefaultFont();
  }
  uint64_t v12 = [a1 fontAttributeValueForInlinePresentationIntent:v8 suggestedBaseFont:v11 suggestingTheDefaultFont:v9 == 0];
  if (v12)
  {
    (*((void (**)(id, __CFString *, uint64_t))a5 + 2))(a5, @"NSFont", v12);
    if (v8 != 32) {
      goto LABEL_14;
    }
LABEL_13:
    (*((void (**)(id, __CFString *, void *))a5 + 2))(a5, @"NSStrikethrough", &unk_1EDD68CA0);
    goto LABEL_14;
  }
  if ((unint64_t)(v8 - 1) >= 2)
  {
    if (v8 == 32) {
      goto LABEL_13;
    }
    if (v8 != 4) {
      goto LABEL_14;
    }
  }
  if (!v9) {
    uint64_t v10 = NSDefaultFont();
  }
  uint64_t v13 = [a1 fontAttributeValueForInlineIntent:v8 suggestedBaseFont:v10 suggestingTheDefaultFont:v9 == 0];
  if (v13) {
    (*((void (**)(id, __CFString *, uint64_t))a5 + 2))(a5, @"NSFont", v13);
  }
LABEL_14:
  uint64_t v14 = *MEMORY[0x1E4F28470];
  v15 = (void (*)(id, uint64_t, void))*((void *)a5 + 2);

  v15(a5, v14, 0);
}

+ (id)fontAttributeValueForInlineIntent:(int64_t)a3 suggestedBaseFont:(id)a4 suggestingTheDefaultFont:(BOOL)a5
{
  return 0;
}

+ (id)fontAttributeValueForInlinePresentationIntent:(unint64_t)a3 suggestedBaseFont:(id)a4 suggestingTheDefaultFont:(BOOL)a5
{
  return 0;
}

@end