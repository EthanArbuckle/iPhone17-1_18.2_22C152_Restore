@interface UICascadingTextStorage
@end

@implementation UICascadingTextStorage

void __48___UICascadingTextStorage_setDefaultAttributes___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) mutableCopy];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 320);
  *(void *)(v3 + 320) = v2;
}

uint64_t __51___UICascadingTextStorage_Accessors__setTextColor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)off_1E52D2048;
  id v5 = *(id *)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v6 length];
  if (v5) {
    objc_msgSend(v6, "addAttribute:value:range:", v4, v5, 0, v7);
  }
  else {
    objc_msgSend(v6, "removeAttribute:range:", v4, 0, v7);
  }

  if (!*(void *)(a1 + 32))
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 40) file:@"_UICascadingTextStorage.m" lineNumber:275 description:@"color argument was nil and [UIColor blackColor] failed!"];
  }
  v8 = *(void **)(*(void *)(a1 + 40) + 320);
  return objc_msgSend(v8, "setObject:forKey:");
}

uint64_t __55___UICascadingTextStorage_Accessors__setLineBreakMode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)off_1E52D21B8;
  id v5 = *(id *)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v6 length];
  if (v5) {
    objc_msgSend(v6, "addAttribute:value:range:", v4, v5, 0, v7);
  }
  else {
    objc_msgSend(v6, "removeAttribute:range:", v4, 0, v7);
  }

  if (!*(void *)(a1 + 32))
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 40) file:@"_UICascadingTextStorage.m" lineNumber:330 description:@"failed to generate newParagraphStyle"];
  }
  v8 = *(void **)(*(void *)(a1 + 40) + 320);
  return objc_msgSend(v8, "setObject:forKey:");
}

uint64_t __46___UICascadingTextStorage_Accessors__setFont___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)off_1E52D2040;
  id v5 = *(id *)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v6 length];
  if (v5) {
    objc_msgSend(v6, "addAttribute:value:range:", v4, v5, 0, v7);
  }
  else {
    objc_msgSend(v6, "removeAttribute:range:", v4, 0, v7);
  }

  if (!*(void *)(a1 + 32))
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 40) file:@"_UICascadingTextStorage.m" lineNumber:170 description:@"font setting has failed in a bad way"];
  }
  v8 = *(void **)(*(void *)(a1 + 40) + 320);
  return objc_msgSend(v8, "setObject:forKey:");
}

uint64_t __55___UICascadingTextStorage_Accessors__setTextAlignment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)off_1E52D21B8;
  id v5 = *(id *)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v6 length];
  if (v5) {
    objc_msgSend(v6, "addAttribute:value:range:", v4, v5, 0, v7);
  }
  else {
    objc_msgSend(v6, "removeAttribute:range:", v4, 0, v7);
  }

  if (!*(void *)(a1 + 32))
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 40) file:@"_UICascadingTextStorage.m" lineNumber:308 description:@"failed to generate newParagraphStyle"];
  }
  v8 = *(void **)(*(void *)(a1 + 40) + 320);
  return objc_msgSend(v8, "setObject:forKey:");
}

uint64_t __56___UICascadingTextStorage__restoreOriginalFontAttribute__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_ui_restoreOriginalFontAttributes");
}

uint64_t __49___UICascadingTextStorage_Accessors___setShadow___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)off_1E52D2238;
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = v3;
  uint64_t v6 = [v5 length];
  if (v4) {
    objc_msgSend(v5, "addAttribute:value:range:", v2, v4, 0, v6);
  }
  else {
    objc_msgSend(v5, "removeAttribute:range:", v2, 0, v6);
  }

  if (!*(void *)(a1 + 40))
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"_UICascadingTextStorage.m" lineNumber:202 description:@"shadow argument was nil"];
  }
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 320);
  return objc_msgSend(v7, "setObject:forKey:");
}

uint64_t __51___UICascadingTextStorage_Accessors__setTextColor___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 320) setObject:*(void *)(a1 + 40) forKey:*(void *)off_1E52D2048];
}

@end