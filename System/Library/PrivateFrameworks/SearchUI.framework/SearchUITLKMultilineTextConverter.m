@interface SearchUITLKMultilineTextConverter
+ (BOOL)richTextOverridesAsyncLoader:(id)a3;
+ (id)formattedTextForSearchUIText:(id)a3;
+ (id)richTextForSearchUIText:(id)a3;
+ (id)richTextForSearchUIText:(id)a3 withCompletionHandler:(id)a4;
+ (id)textForSearchUIString:(id)a3;
+ (id)textForSearchUIText:(id)a3;
+ (void)applyRichText:(id)a3 toTLKRichText:(id)a4 isAsync:(BOOL)a5;
@end

@implementation SearchUITLKMultilineTextConverter

+ (id)textForSearchUIText:(id)a3
{
  if (a3)
  {
    v3 = (void *)MEMORY[0x1E4FAE110];
    id v4 = a3;
    v5 = [v4 text];
    v6 = [v3 textWithString:v5];

    uint64_t v7 = [v4 maxLines];
    [v6 setMaxLines:v7];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)richTextForSearchUIText:(id)a3
{
  return (id)[a1 richTextForSearchUIText:a3 withCompletionHandler:0];
}

+ (id)textForSearchUIString:(id)a3
{
  if (a3)
  {
    v3 = objc_msgSend(MEMORY[0x1E4FAE110], "textWithString:");
    [v3 setMaxLines:1];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)richTextForSearchUIText:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    char v20 = [a1 richTextOverridesAsyncLoader:v6];
    v8 = objc_opt_new();
    if (*((unsigned char *)v18 + 24))
    {
      objc_initWeak(&location, v6);
      objc_initWeak(&from, v8);
      [a1 applyRichText:v6 toTLKRichText:v8 isAsync:1];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __83__SearchUITLKMultilineTextConverter_richTextForSearchUIText_withCompletionHandler___block_invoke;
      v10[3] = &unk_1E6E72708;
      objc_copyWeak(&v13, &location);
      objc_copyWeak(v14, &from);
      v14[1] = a1;
      id v11 = v7;
      v12 = &v17;
      [v6 loadRichTextWithCompletionHandler:v10];

      objc_destroyWeak(v14);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
    else
    {
      [a1 applyRichText:v6 toTLKRichText:v8 isAsync:0];
      if (v7) {
        (*((void (**)(id, id, void *, void))v7 + 2))(v7, v6, v8, *((unsigned __int8 *)v18 + 24));
      }
    }
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __83__SearchUITLKMultilineTextConverter_richTextForSearchUIText_withCompletionHandler___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83__SearchUITLKMultilineTextConverter_richTextForSearchUIText_withCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E6E72708;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  objc_copyWeak(v8, (id *)(a1 + 56));
  v8[1] = *(id *)(a1 + 64);
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  +[SearchUIUtilities dispatchMainIfNecessary:v4];

  objc_destroyWeak(v8);
  objc_destroyWeak(&v7);
}

void __83__SearchUITLKMultilineTextConverter_richTextForSearchUIText_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = objc_loadWeakRetained((id *)(a1 + 56));
  [*(id *)(a1 + 64) applyRichText:WeakRetained toTLKRichText:v2 isAsync:1];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, id, id, void))(v3 + 16))(v3, WeakRetained, v2, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  }
}

+ (void)applyRichText:(id)a3 toTLKRichText:(id)a4 isAsync:(BOOL)a5
{
  BOOL v30 = a5;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v31 = a4;
  v8 = objc_opt_new();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v9 = [v7 formattedTextPieces];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [a1 formattedTextForSearchUIText:*(void *)(*((void *)&v37 + 1) + 8 * i)];
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v11);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = [v7 icons];
  uint64_t v15 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v33 + 1) + 8 * j);
        char v20 = objc_opt_new();
        v21 = +[SearchUIImage imageWithSFImage:v19 variantForAppIcon:0];
        v22 = +[SearchUITLKImageConverter imageForSFImage:v21];
        [v20 setImage:v22];

        [v8 addObject:v20];
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v16);
  }

  [v7 starRating];
  if (v23 > 0.0)
  {
    v24 = objc_opt_new();
    [v7 starRating];
    objc_msgSend(v24, "setStarRating:");
    [v8 addObject:v24];
  }
  v25 = [v7 contentAdvisory];
  uint64_t v26 = [v25 length];

  if (v26)
  {
    v25 = objc_opt_new();
    v27 = [v7 contentAdvisory];
    [v25 setString:v27];

    [v8 addObject:v25];
  }
  [v31 setFormattedTextItems:v8];
  if (v30)
  {
    v25 = [v7 text];
    if (![v25 length])
    {
      [v31 setText:@" "];
      goto LABEL_24;
    }
  }
  v28 = [v7 text];
  [v31 setText:v28];

  if (v30)
  {
LABEL_24:

    uint64_t v29 = 1;
    goto LABEL_25;
  }
  uint64_t v29 = [v7 maxLines];
LABEL_25:
  [v31 setMaxLines:v29];
}

+ (BOOL)richTextOverridesAsyncLoader:(id)a3
{
  uint64_t v3 = [a3 methodForSelector:sel_loadRichTextWithCompletionHandler_];
  return v3 != [MEMORY[0x1E4F9A378] instanceMethodForSelector:sel_loadRichTextWithCompletionHandler_];
}

+ (id)formattedTextForSearchUIText:(id)a3
{
  id v3 = a3;
  id v4 = [v3 glyph];

  if (v4)
  {
    id v5 = objc_opt_new();
    uint64_t v6 = [v3 glyph];
    id v7 = +[SearchUIImage imageWithSFImage:v6 variantForAppIcon:0];

    if (TLKSnippetModernizationEnabled())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && ![v7 symbolScale]) {
        [v7 setSymbolScale:1];
      }
    }
    v8 = +[SearchUITLKImageConverter imageForSFImage:v7];
    [v5 setTlkImage:v8];
  }
  else
  {
    id v5 = objc_opt_new();
    v9 = [v3 text];
    [v5 setString:v9];

    objc_msgSend(v5, "setMaxLines:", objc_msgSend(v3, "maxLines"));
    int v10 = [v3 encapsulationStyle];
    if (v10 == 1) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = 2 * (v10 == 2);
    }
    [v5 setEncapsulationStyle:v11];
  }
  objc_msgSend(v5, "setColor:", +[SearchUITLKConverters colorForSFColor:](SearchUITLKConverters, "colorForSFColor:", objc_msgSend(v3, "textColor")));
  objc_msgSend(v5, "setIsBold:", objc_msgSend(v3, "isBold"));
  objc_msgSend(v5, "setIsEmphasized:", objc_msgSend(v3, "isEmphasized"));

  return v5;
}

@end