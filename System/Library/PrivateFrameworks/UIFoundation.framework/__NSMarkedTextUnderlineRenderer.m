@interface __NSMarkedTextUnderlineRenderer
- (uint64_t)processMarkedTextUnderline:(void *)a3 textRange:(uint64_t)a4 adjustmentCallback:;
- (uint64_t)renderUnderline:(uint64_t)a1;
- (void)_renderUnderlineInTextRange:(id)a3 alphaValue:(double)a4 adjustmentCallback:(id)a5;
- (void)dealloc;
@end

@implementation __NSMarkedTextUnderlineRenderer

- (uint64_t)renderUnderline:(uint64_t)a1
{
  if (!a1 || !*(void *)(a1 + 48)) {
    return 0;
  }
  int v4 = [*(id *)(a1 + 72) isEqual:*(void *)(a1 + 64)];
  if ((v4 & 1) == 0)
  {
    uint64_t v5 = *(void *)(a1 + 64);
    int v6 = [*(id *)(a1 + 72) isNotEmpty];
    double v7 = 0.35;
    if (!v6) {
      double v7 = 1.0;
    }
    [(id)a1 _renderUnderlineInTextRange:v5 alphaValue:a2 adjustmentCallback:v7];
  }
  if ([*(id *)(a1 + 72) isNotEmpty])
  {
    [(id)a1 _renderUnderlineInTextRange:*(void *)(a1 + 72) alphaValue:a2 adjustmentCallback:1.0];
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = v4 ^ 1u;
  }
  *(void *)(a1 + 48) = 0;

  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  return v8;
}

- (uint64_t)processMarkedTextUnderline:(void *)a3 textRange:(uint64_t)a4 adjustmentCallback:
{
  if (!a1) {
    return 0;
  }
  uint64_t v8 = (void *)[a2 objectForKeyedSubscript:@"NSUnderline"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = [v8 unsignedIntegerValue];
  }
  else {
    uint64_t v9 = 0;
  }
  v10 = (void *)[a2 objectForKeyedSubscript:@"NSMarkedTextSelectionAttributeName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v11 = [v10 BOOLValue];
  }
  else {
    int v11 = (v9 & 3) != 1;
  }
  if (!*(void *)(a1 + 48)) {
    goto LABEL_16;
  }
  if (v9
    && (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "location"), "isEqual:", objc_msgSend(a3, "endLocation")) & 1) == 0
    && (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "endLocation"), "isEqual:", objc_msgSend(a3, "location")) & 1) == 0
    && ![*(id *)(a1 + 64) intersectsWithTextRange:a3])
  {
    uint64_t v16 = -[__NSMarkedTextUnderlineRenderer renderUnderline:](a1, a4);
    goto LABEL_19;
  }
  v12 = (void *)[*(id *)(a1 + 64) textRangeByFormingUnionWithTextRange:a3];

  *(void *)(a1 + 64) = v12;
  if (v11)
  {
    v13 = *(void **)(a1 + 72);
    if (v13)
    {
      v14 = (void *)[v13 textRangeByFormingUnionWithTextRange:a3];
      v15 = *(void **)(a1 + 72);
    }
    else
    {
      v15 = 0;
      v14 = a3;
    }

    id v17 = v14;
    uint64_t v16 = 0;
    *(void *)(a1 + 72) = v17;
  }
  else
  {
LABEL_16:
    uint64_t v16 = 0;
  }
LABEL_19:
  if (!*(void *)(a1 + 48) && v9)
  {
    v18 = (void *)[a2 objectForKeyedSubscript:@"NSUnderlineColor"];
    if (!v18)
    {
      v18 = (void *)[a2 objectForKeyedSubscript:@"NSColor"];
      if (!v18)
      {
        uint64_t v19 = [*(id *)(a1 + 8) applicationFrameworkContext];
        if (+[NSTextGraphicsContextProvider textGraphicsContextProviderClassRespondsToColorQuery])
        {
          v20 = (objc_class *)[(objc_class *)+[NSTextGraphicsContextProvider textGraphicsContextProviderClass] colorClassForApplicationFrameworkContext:v19];
        }
        else
        {
          v20 = +[NSTextGraphicsContextProvider __defaultColorClass];
        }
        v18 = (void *)[(objc_class *)v20 blackColor];
      }
    }
    *(void *)(a1 + 48) = v9;
    *(void *)(a1 + 56) = v18;
    id v21 = a3;
    *(void *)(a1 + 64) = v21;
    if (v11) {
      *(void *)(a1 + 72) = v21;
    }
  }
  return v16;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)__NSMarkedTextUnderlineRenderer;
  [(__NSMarkedTextUnderlineRenderer *)&v3 dealloc];
}

- (void)_renderUnderlineInTextRange:(id)a3 alphaValue:(double)a4 adjustmentCallback:(id)a5
{
  uint64_t v9 = [(NSTextGraphicsContext *)self->_graphicsContext CGContext];
  char v10 = [(NSTextGraphicsContext *)self->_graphicsContext isFlipped];
  if (v9)
  {
    textLineFragment = self->_textLineFragment;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __93____NSMarkedTextUnderlineRenderer__renderUnderlineInTextRange_alphaValue_adjustmentCallback___block_invoke;
    v12[3] = &unk_1E55C7520;
    v12[4] = self;
    v12[5] = a5;
    char v13 = v10;
    v12[6] = v9;
    *(double *)&v12[7] = a4;
    [(NSTextLineFragment *)textLineFragment enumerateTextSegmentBoundsInTextRange:a3 dataSourceLocationsOnly:1 usingBlock:v12];
  }
}

@end