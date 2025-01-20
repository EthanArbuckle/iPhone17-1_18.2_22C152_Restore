@interface NSAttributedString(UIKitAdditions_Internal)
- (id)_ui_attributedStringAdjustedToTraitCollection:()UIKitAdditions_Internal;
- (id)_ui_rtfDataError:()UIKitAdditions_Internal;
- (id)_ui_rtfdFileWrapperError:()UIKitAdditions_Internal;
- (uint64_t)_ui_containsTables;
@end

@implementation NSAttributedString(UIKitAdditions_Internal)

- (id)_ui_attributedStringAdjustedToTraitCollection:()UIKitAdditions_Internal
{
  id v4 = a3;
  v5 = +[_NSAttributedStringIntentResolver attributedStringByResolvingString:a1];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  id v22 = 0;
  if (v4)
  {
    uint64_t v6 = [a1 length];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __93__NSAttributedString_UIKitAdditions_Internal___ui_attributedStringAdjustedToTraitCollection___block_invoke;
    v13[3] = &unk_1E52D9A58;
    id v14 = v4;
    v16 = &v17;
    id v15 = v5;
    objc_msgSend(v15, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0x100000, v13);

    v7 = (void *)v18[5];
  }
  else
  {
    v7 = 0;
  }
  uint64_t v8 = [v7 copy];
  v9 = (void *)v8;
  if (v8) {
    v10 = (void *)v8;
  }
  else {
    v10 = a1;
  }
  id v11 = v10;

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (id)_ui_rtfdFileWrapperError:()UIKitAdditions_Internal
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 length];
  uint64_t v9 = *(void *)off_1E52D1FC0;
  v10[0] = *(void *)off_1E52D2208;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = objc_msgSend(a1, "fileWrapperFromRange:documentAttributes:error:", 0, v5, v6, a3);

  return v7;
}

- (id)_ui_rtfDataError:()UIKitAdditions_Internal
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 length];
  uint64_t v9 = *(void *)off_1E52D1FC0;
  v10[0] = *(void *)off_1E52D2210;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = objc_msgSend(a1, "dataFromRange:documentAttributes:error:", 0, v5, v6, a3);

  return v7;
}

- (uint64_t)_ui_containsTables
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  uint64_t v2 = [a1 length];
  Class v3 = NSClassFromString(&cfstr_Nstexttableblo.isa);
  uint64_t v4 = *(void *)off_1E52D21B8;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__NSAttributedString_UIKitAdditions_Internal___ui_containsTables__block_invoke;
  v7[3] = &unk_1E52D9A80;
  v7[4] = &v8;
  v7[5] = v3;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v4, 0, v2, 0, v7);
  uint64_t v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

@end