@interface _NSTextLayoutFragmentStorage
- (BOOL)revalidateLayoutFragmentRangeForLocation:(id)a3;
- (id)adjustedTextRangeWithTextRange:(id)a3 adjustment:(unint64_t)a4;
- (id)enumerateTextLayoutFragmentFromLocation:(id)a3 options:(int64_t)a4 usingBlock:(id)a5;
- (id)enumerateTextLayoutFragmentInTextRange:(id)a3 options:(int64_t)a4 usingBlock:(id)a5;
- (id)textLayoutFragmentForTextLocation:(id)a3 allowsTrailingEdge:(BOOL)a4;
- (int64_t)offsetDeltaForLastTextLayoutFragment;
- (void)invalidateTextLayoutFragmentsInTextRange:(id)a3 adjustTextRange:(BOOL)a4;
- (void)invalidateTextLayoutFragmentsInTextRange:(id)a3 delta:(int64_t)a4;
- (void)setTextLayoutFragments:(id)a3;
@end

@implementation _NSTextLayoutFragmentStorage

- (void)setTextLayoutFragments:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55___NSTextLayoutFragmentStorage_setTextLayoutFragments___block_invoke;
  v3[3] = &unk_1E55C6B20;
  v3[4] = self;
  [a3 enumerateObjectsUsingBlock:v3];
}

- (BOOL)revalidateLayoutFragmentRangeForLocation:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__5;
  v25 = __Block_byref_object_dispose__5;
  id v26 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__5;
  v19 = __Block_byref_object_dispose__5;
  id v20 = 0;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__5;
  v13 = __Block_byref_object_dispose__5;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73___NSTextLayoutFragmentStorage_revalidateLayoutFragmentRangeForLocation___block_invoke;
  v8[3] = &unk_1E55C6B70;
  v8[4] = &v21;
  v8[5] = &v15;
  v8[6] = &v9;
  id v5 = [(_NSTextRunStorage *)self enumerateObjectsFromLocation:v4 options:0 usingBlock:v8];
  uint64_t v6 = v22[5];
  if (v6)
  {
    [(_NSTextRunStorage *)self invalidateElementsInRange:v10[5] delta:0];
    [(_NSTextRunStorage *)self setObject:v22[5] forRange:v16[5]];
  }
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v6 != 0;
}

- (id)enumerateTextLayoutFragmentFromLocation:(id)a3 options:(int64_t)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ((a4 & 2) != 0)
  {
    BOOL v11 = 0;
    int64_t v12 = a4;
  }
  else
  {
    int64_t v10 = [(_NSTextLayoutFragmentStorage *)self offsetDeltaForLastTextLayoutFragment];
    BOOL v11 = v10 != 0;
    if (v10) {
      int64_t v12 = a4;
    }
    else {
      int64_t v12 = a4 | 2;
    }
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __91___NSTextLayoutFragmentStorage_enumerateTextLayoutFragmentFromLocation_options_usingBlock___block_invoke;
  v16[3] = &unk_1E55C6AA8;
  id v17 = v9;
  BOOL v18 = (a4 & 2) == 0;
  BOOL v19 = v11;
  id v13 = v9;
  id v14 = [(_NSTextRunStorage *)self enumerateObjectsFromLocation:v8 options:v12 usingBlock:v16];

  return v14;
}

- (int64_t)offsetDeltaForLastTextLayoutFragment
{
  uint64_t v9 = 0;
  int64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v3 = (void *)MEMORY[0x192FAE510](self, a2);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68___NSTextLayoutFragmentStorage_offsetDeltaForLastTextLayoutFragment__block_invoke;
  v8[3] = &unk_1E55C6B48;
  v8[4] = self;
  v8[5] = &v9;
  v7.receiver = self;
  v7.super_class = (Class)_NSTextLayoutFragmentStorage;
  id v4 = [(_NSTextRunStorage *)&v7 enumerateObjectsFromLocation:0 options:1 usingBlock:v8];
  int64_t v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

- (id)adjustedTextRangeWithTextRange:(id)a3 adjustment:(unint64_t)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74___NSTextLayoutFragmentStorage_adjustedTextRangeWithTextRange_adjustment___block_invoke;
  v9[3] = &unk_1E55C6A58;
  objc_copyWeak(&v10, &location);
  objc_super v7 = [v6 textRangeWithAdjustment:a4 rangeProvider:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

- (void)invalidateTextLayoutFragmentsInTextRange:(id)a3 adjustTextRange:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (v4) {
    int64_t v6 = [(_NSTextLayoutFragmentStorage *)self offsetDeltaForLastTextLayoutFragment];
  }
  else {
    int64_t v6 = 0;
  }
  [(_NSTextLayoutFragmentStorage *)self invalidateTextLayoutFragmentsInTextRange:v7 delta:v6];
}

- (void)invalidateTextLayoutFragmentsInTextRange:(id)a3 delta:(int64_t)a4
{
  uint64_t v6 = [(_NSTextLayoutFragmentStorage *)self adjustedTextRangeWithTextRange:a3 adjustment:6];
  if (v6) {
    [(_NSTextRunStorage *)self invalidateElementsInRange:v6 delta:a4];
  }

  MEMORY[0x1F41817F8]();
}

- (id)textLayoutFragmentForTextLocation:(id)a3 allowsTrailingEdge:(BOOL)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__5;
  v24 = __Block_byref_object_dispose__5;
  id v25 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __85___NSTextLayoutFragmentStorage_textLayoutFragmentForTextLocation_allowsTrailingEdge___block_invoke;
  v17[3] = &unk_1E55C6AD0;
  id v7 = v6;
  id v18 = v7;
  BOOL v19 = &v20;
  id v8 = [(_NSTextLayoutFragmentStorage *)self enumerateTextLayoutFragmentFromLocation:v7 options:0 usingBlock:v17];
  uint64_t v9 = (void *)v21[5];
  if (!v9)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __85___NSTextLayoutFragmentStorage_textLayoutFragmentForTextLocation_allowsTrailingEdge___block_invoke_2;
    v13[3] = &unk_1E55C6AF8;
    BOOL v16 = a4;
    id v14 = v7;
    uint64_t v15 = &v20;
    id v10 = [(_NSTextLayoutFragmentStorage *)self enumerateTextLayoutFragmentFromLocation:v14 options:1 usingBlock:v13];

    uint64_t v9 = (void *)v21[5];
  }
  id v11 = v9;

  _Block_object_dispose(&v20, 8);

  return v11;
}

- (id)enumerateTextLayoutFragmentInTextRange:(id)a3 options:(int64_t)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int64_t v10 = [(_NSTextLayoutFragmentStorage *)self offsetDeltaForLastTextLayoutFragment];
  if (a4)
  {
    id v11 = [v8 endLocation];
    [v8 location];
  }
  else
  {
    id v11 = [v8 location];
    [v8 endLocation];
  uint64_t v12 = };
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__5;
  v28 = __Block_byref_object_dispose__5;
  id v29 = 0;
  if (v10) {
    int64_t v13 = a4;
  }
  else {
    int64_t v13 = a4 | 2;
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __90___NSTextLayoutFragmentStorage_enumerateTextLayoutFragmentInTextRange_options_usingBlock___block_invoke;
  v19[3] = &unk_1E55C6A80;
  uint64_t v22 = &v24;
  char v23 = a4 & 1;
  id v14 = v12;
  id v20 = v14;
  id v15 = v9;
  id v21 = v15;
  id v16 = [(_NSTextRunStorage *)self enumerateObjectsFromLocation:v11 options:v13 usingBlock:v19];
  id v17 = (id)v25[5];

  _Block_object_dispose(&v24, 8);

  return v17;
}

@end