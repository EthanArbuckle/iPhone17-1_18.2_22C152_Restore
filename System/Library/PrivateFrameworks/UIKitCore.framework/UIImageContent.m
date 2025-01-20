@interface UIImageContent
@end

@implementation UIImageContent

uint64_t __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_2(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_4(uint64_t a1)
{
  if (-[_UIImageContentContextualEffect _shouldResolveNamedColorStyles](*(void *)(a1 + 32)))
  {
    double v2 = *(double *)(a1 + 64);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_5;
    v16[3] = &unk_1E52EC958;
    v3 = *(void **)(a1 + 40);
    id v17 = *(id *)(a1 + 32);
    uint64_t v4 = objc_msgSend(v3, "_provideVectorGlyphCGImageWithSize:scale:namedColorResolver:", v16, *(double *)(a1 + 48), *(double *)(a1 + 56), v2);
    v5 = v17;
LABEL_5:

    return v4;
  }
  if (-[_UIImageContentContextualEffect _shouldResolveHierarchicalColors](*(void *)(a1 + 32)))
  {
    double v6 = *(double *)(a1 + 64);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_6;
    v14[3] = &unk_1E52EC980;
    v7 = *(void **)(a1 + 40);
    id v15 = *(id *)(a1 + 32);
    uint64_t v4 = objc_msgSend(v7, "_provideVectorGlyphCGImageWithSize:scale:hierarchicalColorResolver:", v14, *(double *)(a1 + 48), *(double *)(a1 + 56), v6);
    v5 = v15;
    goto LABEL_5;
  }
  if (-[_UIImageContentContextualEffect _shouldResolvePaletteColors](*(void *)(a1 + 32)))
  {
    v9 = -[_UIImageContentContextualEffect _resolvedPaletteColors](*(id **)(a1 + 32));
    uint64_t v4 = objc_msgSend(*(id *)(a1 + 40), "_provideVectorGlyphCGImageWithSize:scale:paletteColors:", v9, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

    return v4;
  }
  v10 = *(void **)(a1 + 40);
  double v11 = *(double *)(a1 + 56);
  double v12 = *(double *)(a1 + 64);
  double v13 = *(double *)(a1 + 48);
  return objc_msgSend(v10, "_provideCGImageWithSize:scale:", v13, v11, v12);
}

id __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[_UIImageContentContextualEffect _resolvedHierarchicalColorForLayerLevel:](*(void *)(a1 + 32), a3);
}

id *__58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return -[_UIImageContentContextualEffect _resolvedColorForNamedStyle:](*(id **)(a1 + 32), a2);
}

void __24___UIImageContent_empty__block_invoke()
{
  v0 = [(_UIImageContent *)[_UIImageEmptyContent alloc] initWithScale:1.0];
  v1 = (void *)qword_1EB25B1A0;
  qword_1EB25B1A0 = (uint64_t)v0;
}

void __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke(uint64_t a1, CGContext *a2)
{
  double v4 = *(double *)(a1 + 40);
  [*(id *)(a1 + 32) scale];
  CGContextScaleCTM(a2, v4 / v5, v4 / v5);
  CGFloat v6 = *MEMORY[0x1E4F1DAD8];
  CGFloat v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v8 = *(double *)(a1 + 40);
  CGFloat v9 = *(double *)(a1 + 48) * v8;
  CGFloat v10 = v8 * *(double *)(a1 + 56);
  double v11 = +[UIColor orangeColor];
  double v12 = [v11 colorWithAlphaComponent:0.5];
  [v12 setFill];

  double v13 = +[UIColor brownColor];
  v14 = [v13 colorWithAlphaComponent:0.9];
  [v14 setStroke];

  v20.origin.x = v6;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v10;
  CGContextFillRect(a2, v20);
  CGFloat v15 = v6;
  CGFloat v16 = v7;
  CGFloat v17 = v9;
  CGFloat v18 = v10;
  CGContextStrokeRect(a2, *(CGRect *)&v15);
}

uint64_t __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_prepareForDrawingWithSize:scale:inContext:", a2, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
  double v4 = *(void **)(a1 + 32);
  double v5 = *(double *)(a1 + 48);
  double v6 = *(double *)(a1 + 56);
  double v7 = *(double *)(a1 + 40);
  return objc_msgSend(v4, "_drawWithSize:scale:inContext:effect:", a2, 0, v7, v5, v6);
}

void __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_7(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v3, "_prepareForDrawingWithSize:scale:inContext:", a2, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    if (-[_UIImageContentContextualEffect _shouldResolveNamedColorStyles](*(void *)(a1 + 40)))
    {
      double v5 = *(double *)(a1 + 64);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_8;
      v17[3] = &unk_1E52EC958;
      double v6 = *(void **)(a1 + 32);
      id v18 = *(id *)(a1 + 40);
      objc_msgSend(v6, "_drawVectorGlyphWithSize:scale:inContext:namedColorResolver:", a2, v17, *(double *)(a1 + 48), *(double *)(a1 + 56), v5);
      double v7 = v18;
LABEL_6:

      return;
    }
    if (-[_UIImageContentContextualEffect _shouldResolveHierarchicalColors](*(void *)(a1 + 40)))
    {
      double v8 = *(double *)(a1 + 64);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_9;
      v15[3] = &unk_1E52EC980;
      CGFloat v9 = *(void **)(a1 + 32);
      id v16 = *(id *)(a1 + 40);
      objc_msgSend(v9, "_drawVectorGlyphWithSize:scale:inContext:hierarchicalColorResolver:", a2, v15, *(double *)(a1 + 48), *(double *)(a1 + 56), v8);
      double v7 = v16;
      goto LABEL_6;
    }
    if (-[_UIImageContentContextualEffect _shouldResolvePaletteColors](*(void *)(a1 + 40)))
    {
      -[_UIImageContentContextualEffect _resolvedPaletteColors](*(id **)(a1 + 40));
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_drawVectorGlyphWithSize:scale:inContext:paletteColors:", a2, v14, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    }
    else
    {
      CGFloat v10 = *(void **)(a1 + 32);
      double v11 = *(double *)(a1 + 56);
      double v12 = *(double *)(a1 + 64);
      double v13 = *(double *)(a1 + 48);
      objc_msgSend(v10, "_drawWithSize:scale:inContext:effect:", a2, 0, v13, v11, v12);
    }
  }
}

id *__58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return -[_UIImageContentContextualEffect _resolvedColorForNamedStyle:](*(id **)(a1 + 32), a2);
}

id __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[_UIImageContentContextualEffect _resolvedHierarchicalColorForLayerLevel:](*(void *)(a1 + 32), a3);
}

id __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_10(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  if (-[_UIImageContentContextualEffect _shouldResolveNamedColorStyles](*(void *)(a1 + 32)))
  {
    if (v2) {
      *(_DWORD *)(v2 + 8) = 2;
    }
    newValue[0] = MEMORY[0x1E4F143A8];
    newValue[1] = 3221225472;
    newValue[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_12;
    newValue[3] = &unk_1E52ECA40;
    id v3 = *(id *)(a1 + 32);
    double v5 = &__block_literal_global_25_2;
    id v26 = v3;
    v27 = &__block_literal_global_25_2;
    if (v2)
    {
      objc_setProperty_nonatomic_copy((id)v2, v4, newValue, 24);
      double v5 = v27;
    }

    id v6 = v26;
  }
  else if (-[_UIImageContentContextualEffect _shouldResolveHierarchicalColors](*(void *)(a1 + 32)))
  {
    if (v2) {
      *(_DWORD *)(v2 + 8) = 3;
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_14;
    v22[3] = &unk_1E52ECA40;
    id v7 = *(id *)(a1 + 32);
    CGFloat v9 = &__block_literal_global_25_2;
    id v23 = v7;
    v24 = &__block_literal_global_25_2;
    if (v2)
    {
      objc_setProperty_nonatomic_copy((id)v2, v8, v22, 24);
      CGFloat v9 = v24;
    }

    id v6 = v23;
  }
  else if (-[_UIImageContentContextualEffect _shouldResolvePaletteColors](*(void *)(a1 + 32)))
  {
    if (v2) {
      *(_DWORD *)(v2 + 8) = 4;
    }
    double v11 = -[_UIImageContentContextualEffect _resolvedPaletteColors](*(id **)(a1 + 32));
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_16;
    v19[3] = &unk_1E52ECA40;
    double v12 = &__block_literal_global_25_2;
    id v20 = v11;
    v21 = &__block_literal_global_25_2;
    id v6 = v11;
    if (v2)
    {
      objc_setProperty_nonatomic_copy((id)v2, v13, v19, 24);
      double v12 = v21;
    }
  }
  else
  {
    if (v2) {
      *(_DWORD *)(v2 + 8) = 1;
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_18;
    v17[3] = &unk_1E52ECA68;
    id v6 = &__block_literal_global_25_2;
    id v18 = &__block_literal_global_25_2;
    if (v2)
    {
      objc_setProperty_nonatomic_copy((id)v2, v10, v17, 24);
      id v6 = v18;
    }
  }

  id v14 = -[_UIImageContentContextualEffect vectorGlyph](*(void *)(a1 + 32));
  if (v2) {
    objc_storeWeak((id *)(v2 + 16), v14);
  }

  double v15 = -[_UIImageContentContextualEffect variableValue](*(void *)(a1 + 32));
  if (v2) {
    *(double *)(v2 + 32) = v15;
  }
  return (id)v2;
}

float __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_11(int a1, id a2)
{
  if (!a2) {
    return *MEMORY[0x1E4F96020];
  }
  [a2 CGColor];
  RBColorFromCGColor2();
  return result;
}

id __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_12(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_13;
  v4[3] = &unk_1E52ECA18;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  uint64_t v2 = _Block_copy(v4);

  return v2;
}

float __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v4 = -[_UIImageContentContextualEffect _resolvedColorForNamedStyle:](*(id **)(a1 + 32), a3);
  float v5 = (*(float (**)(void))(*(void *)(a1 + 40) + 16))();

  return v5;
}

id __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_14(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_15;
  v4[3] = &unk_1E52ECA18;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  uint64_t v2 = _Block_copy(v4);

  return v2;
}

float __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_15(uint64_t a1)
{
  uint64_t v2 = -[_UIImageContentContextualEffect _resolvedHierarchicalColorForLayerLevel:](*(void *)(a1 + 32), 0);
  float v3 = (*(float (**)(void))(*(void *)(a1 + 40) + 16))();

  return v3;
}

id __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_16(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_17;
  v4[3] = &unk_1E52ECA18;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  uint64_t v2 = _Block_copy(v4);

  return v2;
}

float __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_17(uint64_t a1, int a2)
{
  if (a2 == 6) {
    unint64_t v3 = 2;
  }
  else {
    unint64_t v3 = a2 == 5;
  }
  double v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v4 count];
  if (v3 >= v5 - 1) {
    unint64_t v6 = v5 - 1;
  }
  else {
    unint64_t v6 = v3;
  }
  id v7 = [v4 objectAtIndexedSubscript:v6];
  float v8 = (*(float (**)(void))(*(void *)(a1 + 40) + 16))();

  return v8;
}

id __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_18(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_19;
  v7[3] = &unk_1E52ECA18;
  id v8 = v3;
  id v9 = *(id *)(a1 + 32);
  id v4 = v3;
  uint64_t v5 = _Block_copy(v7);

  return v5;
}

float __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_19(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    id v3 = +[UIColor blackColor];
  }
  id v4 = v3;
  float v5 = (*(float (**)(void))(*(void *)(a1 + 40) + 16))();

  return v5;
}

uint64_t __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_20(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_prepareForDrawingWithSize:scale:inContext:", a2, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  unint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  double v8 = *(double *)(a1 + 48);
  return objc_msgSend(v6, "_drawWithSize:scale:inContext:effect:", a2, v7, v8, v4, v5);
}

CFTypeRef __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_29(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v2)
  {
    id v3 = +[UIGraphicsImageRendererFormat preferredFormat];
    [v3 setScale:*(double *)(a1 + 48)];
    double v4 = -[UIGraphicsImageRenderer initWithSize:format:]([UIGraphicsImageRenderer alloc], "initWithSize:format:", v3, *(double *)(a1 + 56), *(double *)(a1 + 64));
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_2_31;
    v10[3] = &unk_1E52ECAB8;
    id v11 = *(id *)(a1 + 32);
    uint64_t v5 = [(UIGraphicsImageRenderer *)v4 imageWithActions:v10];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  CGImageRef v8 = CGImageRetain((CGImageRef)[v2 CGImage]);
  return CFAutorelease(v8);
}

uint64_t __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_2_31(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2)
  {
    uint64_t v3 = [a2 CGContext];
    double v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
    return v4(v2, v3);
  }
  return result;
}

@end