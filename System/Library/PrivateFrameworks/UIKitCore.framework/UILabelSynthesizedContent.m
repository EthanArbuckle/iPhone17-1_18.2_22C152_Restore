@interface UILabelSynthesizedContent
@end

@implementation UILabelSynthesizedContent

uint64_t __58___UILabelSynthesizedContent__synthesizedAttributedString__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = [a2 isEqual:*(void *)(a1 + 32)];
  if (result)
  {
    v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)off_1E52D2048;
    return objc_msgSend(v8, "removeAttribute:range:", v9, a3, a4);
  }
  return result;
}

uint64_t __58___UILabelSynthesizedContent__synthesizedAttributedString__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = [a2 isEqual:*(void *)(a1 + 32)];
  if (result)
  {
    v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)off_1E52D2238;
    return objc_msgSend(v8, "removeAttribute:range:", v9, a3, a4);
  }
  return result;
}

void __84___UILabelSynthesizedContent__disablingHyphenationIfURLsDetectedInAttributedString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    id v7 = (id)[a2 mutableCopy];
    [v7 setHyphenationFactor:0.0];
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *(void *)off_1E52D21B8, v7, a3, a4);
  }
}

void __79___UILabelSynthesizedContent__isolateStringWritingDirectionInAttributedString___block_invoke(void *a1, void *a2)
{
  if (!a2) {
    a2 = (void *)a1[4];
  }
  id v6 = a2;
  uint64_t v3 = [v6 baseWritingDirection];
  if (v3) {
    int v4 = 8296;
  }
  else {
    int v4 = 8294;
  }
  if (v3 == 1) {
    int v4 = 8295;
  }
  uint64_t v5 = *(void *)(a1[5] + 8);
  if (v4 != *(unsigned __int16 *)(v5 + 24))
  {
    *(_WORD *)(v5 + 24) = v4;
    ++*(void *)(*(void *)(a1[6] + 8) + 24);
  }
}

void __79___UILabelSynthesizedContent__isolateStringWritingDirectionInAttributedString___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (!v7)
  {
    id v7 = [*(id *)(*(void *)(a1 + 32) + 8) paragraphStyle];
  }
  id v13 = v7;
  uint64_t v8 = [v7 baseWritingDirection];
  if (v8) {
    int v9 = 8296;
  }
  else {
    int v9 = 8294;
  }
  if (v8 == 1) {
    int v9 = 8295;
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  if (v9 != *(unsigned __int16 *)(v10 + 24))
  {
    *(_WORD *)(v10 + 24) = v9;
    uint64_t v11 = *(void *)(a1 + 64) + 16 * *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    *(_WORD *)uint64_t v11 = v9;
    *(_DWORD *)(v11 + 2) = 0;
    *(_WORD *)(v11 + 6) = 0;
    *(void *)(v11 + 8) = a3;
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  }
  v12 = (void *)[v13 mutableCopy];
  [v12 setBaseWritingDirection:*(void *)(a1 + 72)];
  objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *(void *)off_1E52D21B8, v12, a3, a4);
}

@end