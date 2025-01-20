@interface _NSTextHighlightRun
- (BOOL)beginsOnSameLineAsPreviousRun;
- (BOOL)combinedPaths;
- (BOOL)isFirstRun;
- (BOOL)isLastRun;
- (BOOL)isSegmentFrameRenderable:(CGRect)a3 forIndex:(unint64_t)a4;
- (BOOL)textRangeIsInSameLine:(id)a3;
- (CGPath)_createUnionedPathFromArray:(id)a3;
- (double)cornerOutset;
- (double)cornerRadius;
- (id)description;
- (id)firstSegment;
- (id)initWithTextRange:(void *)a3 withCluster:;
- (id)lastSegment;
- (id)secondLastSegment;
- (id)secondSegment;
- (int64_t)drawRunUsingBlock:(int64_t)a1;
- (void)enumerateRunSegmentsUsingBlock:(id)a3;
- (void)getMetricsForTextSize:(double *)a3 cornerRadius:(double)a4 cornerOutset:(double)a5;
- (void)prevRun;
@end

@implementation _NSTextHighlightRun

- (double)cornerRadius
{
  if (!a1) {
    return 0.0;
  }
  v2 = (double *)(a1 + 64);
  if (*(double *)(a1 + 64) < 0.0 && [*(id *)(a1 + 56) count])
  {
    uint64_t v3 = [*(id *)(a1 + 56) firstObject];
    v4 = (void *)v3;
    if (v3)
    {
      double v5 = *(double *)(v3 + 144);
      double v6 = *(double *)(v3 + 152);
    }
    else
    {
      double v5 = 0.0;
      double v6 = 0.0;
    }
    [(_NSTextHighlightRun *)a1 getMetricsForTextSize:(double *)(a1 + 72) cornerRadius:v5 cornerOutset:v6];
  }
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  _UIFoundationAssert((void *)a1, v8, *(double *)(a1 + 64) >= 0.0, &__block_literal_global_13);

  return *(double *)(a1 + 64);
}

- (double)cornerOutset
{
  if (!a1) {
    return 0.0;
  }
  v2 = (double *)(a1 + 72);
  if (*(double *)(a1 + 72) < 0.0 && [*(id *)(a1 + 56) count])
  {
    uint64_t v3 = [*(id *)(a1 + 56) firstObject];
    v4 = (void *)v3;
    if (v3)
    {
      double v5 = *(double *)(v3 + 144);
      double v6 = *(double *)(v3 + 152);
    }
    else
    {
      double v5 = 0.0;
      double v6 = 0.0;
    }
    [(_NSTextHighlightRun *)a1 getMetricsForTextSize:v2 cornerRadius:v5 cornerOutset:v6];
  }
  return *v2;
}

- (void)getMetricsForTextSize:(double *)a3 cornerRadius:(double)a4 cornerOutset:(double)a5
{
  if (a1)
  {
    if (getMetricsForTextSize_cornerRadius_cornerOutset__onceToken != -1) {
      dispatch_once(&getMetricsForTextSize_cornerRadius_cornerOutset__onceToken, &__block_literal_global_67);
    }
    if (a5 >= 28.0)
    {
      unint64_t v11 = vcvtmd_u64_f64(a5 + -28.0) / 0xA;
      double v9 = (double)(v11 + 1) * 2.0 + 4.0;
      if (*(double *)&getMetricsForTextSize_cornerRadius_cornerOutset__outsetIncrement <= 0.0) {
        double v10 = 2.0;
      }
      else {
        double v10 = *(double *)&getMetricsForTextSize_cornerRadius_cornerOutset__outsetIncrement * (double)v11 + 2.0;
      }
    }
    else
    {
      double v9 = 4.0;
      double v10 = 2.0;
    }
    *(double *)(a1 + 64) = v9;
    *a2 = v9;
    *(double *)(a1 + 72) = v10;
    *a3 = v10;
  }
}

- (id)initWithTextRange:(void *)a3 withCluster:
{
  id v6 = a2;
  v7 = a3;
  if (!a1)
  {
    id v39 = 0;
    goto LABEL_35;
  }
  v58.receiver = a1;
  v58.super_class = (Class)_NSTextHighlightRun;
  id v8 = objc_msgSendSuper2(&v58, sel_init);
  if (!v8)
  {
    id v39 = 0;
    goto LABEL_35;
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v10 = (void *)*((void *)v8 + 7);
  *((void *)v8 + 7) = v9;

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12 = (void *)*((void *)v8 + 1);
  *((void *)v8 + 1) = v11;

  objc_storeStrong((id *)v8 + 6, a2);
  objc_storeWeak((id *)v8 + 5, v7);
  if (v7) {
    v13 = (void *)v7[4];
  }
  else {
    v13 = 0;
  }
  id v14 = v13;
  *((void *)v8 + 2) = [v14 count];

  __asm { FMOV            V0.2D, #-1.0 }
  *((_OWORD *)v8 + 4) = _Q0;
  *((_WORD *)v8 + 16) = 257;
  v20 = -[_NSTextHighlightRun prevRun]((id *)v8);
  if (v20 && [v8 beginsOnSameLineAsPreviousRun])
  {
    id v21 = *((id *)v8 + 6);
    v22 = [v21 location];
    v23 = -[_NSTextHighlightRun prevRun]((id *)v8);
    v24 = v23;
    if (v23) {
      v23 = (void *)v23[6];
    }
    v25 = [v23 endLocation];
    uint64_t v26 = [v22 compare:v25];

    if (!v26)
    {
      -[_NSTextHighlightRun prevRun]((id *)v8);
      v27 = (unsigned char *)objc_claimAutoreleasedReturnValue();
      if (v27) {
        v27[33] = 0;
      }

      *((unsigned char *)v8 + 32) = 0;
    }
  }
  else
  {
  }
  if (*((void *)v8 + 2))
  {
    uint64_t v28 = -[_NSTextHighlightRun prevRun]((id *)v8);
    v29 = (void *)v28;
    if (v28)
    {
      WeakRetained = (id *)objc_loadWeakRetained((id *)(v28 + 40));
      v31 = WeakRetained;
      if (WeakRetained)
      {
        id v32 = objc_loadWeakRetained(WeakRetained + 3);
LABEL_18:
        uint64_t v33 = -[_NSTextHighlightRun prevRun]((id *)v8);
        v34 = (void *)v33;
        if (v33) {
          uint64_t v35 = *(void *)(v33 + 48);
        }
        else {
          uint64_t v35 = 0;
        }
        char v36 = [v32 modifyOptions:0 forLineBoundariesInRange:v35];

        -[_NSTextHighlightRun prevRun]((id *)v8);
        v37 = (unsigned char *)objc_claimAutoreleasedReturnValue();
        if (v37) {
          v37[32] = (v36 & 4 | (unint64_t)v37[32]) != 0;
        }

        -[_NSTextHighlightRun prevRun]((id *)v8);
        v38 = (unsigned char *)objc_claimAutoreleasedReturnValue();
        if (v38) {
          v38[33] = (v36 & 8 | (unint64_t)v38[33]) != 0;
        }

        goto LABEL_25;
      }
    }
    else
    {
      v31 = 0;
    }
    id v32 = 0;
    goto LABEL_18;
  }
LABEL_25:
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x3042000000;
  v56[3] = __Block_byref_object_copy__7;
  v56[4] = __Block_byref_object_dispose__7;
  objc_initWeak(&v57, v8);
  uint64_t v50 = MEMORY[0x1E4F143A8];
  uint64_t v51 = 3221225472;
  v52 = __53___NSTextHighlightRun_initWithTextRange_withCluster___block_invoke;
  v53 = &unk_1E55C6D68;
  v55 = v56;
  id v39 = v8;
  id v54 = v39;
  [v39 enumerateRunSegmentsUsingBlock:&v50];
  -[_NSTextHighlightRun prevRun]((id *)v39);
  v40 = (id *)objc_claimAutoreleasedReturnValue();
  uint64_t v41 = -[_NSTextHighlightRun lastSegment](v40);

  if (v41 && *(unsigned char *)(v41 + 8))
  {
    double v42 = *(double *)(v41 + 96);
    -[_NSTextHighlightRun firstSegment]((id *)v39);
    v43 = (double *)objc_claimAutoreleasedReturnValue();
    double v44 = v43 ? v43[12] : 0.0;

    if (v42 == v44)
    {
      uint64_t v45 = -[_NSTextHighlightRun prevRun]((id *)v39);
      v46 = (void *)v45;
      if (v45) {
        v47 = *(void **)(v45 + 56);
      }
      else {
        v47 = 0;
      }
      id v48 = v47;
      objc_msgSend(v48, "removeLastObject", v50, v51, v52, v53);

      *((unsigned char *)v8 + 32) = 1;
    }
  }

  _Block_object_dispose(v56, 8);
  objc_destroyWeak(&v57);
LABEL_35:

  return v39;
}

- (void)prevRun
{
  v1 = a1;
  if (a1)
  {
    if (a1[2])
    {
      WeakRetained = objc_loadWeakRetained(a1 + 5);
      uint64_t v3 = WeakRetained;
      if (WeakRetained) {
        WeakRetained = (void *)WeakRetained[4];
      }
      v1 = [WeakRetained objectAtIndex:v1[2] - 1];
    }
    else
    {
      v1 = 0;
    }
  }

  return v1;
}

- (id)lastSegment
{
  if (a1)
  {
    v2 = a1;
    a1 = (id *)[a1[7] count];
    if (a1)
    {
      objc_msgSend(v2[7], "objectAtIndex:", objc_msgSend(v2[7], "count") - 1);
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)firstSegment
{
  if (a1)
  {
    v2 = a1;
    a1 = (id *)[a1[7] count];
    if (a1)
    {
      a1 = [v2[7] objectAtIndex:0];
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)enumerateRunSegmentsUsingBlock:(id)a3
{
  id v4 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_cluster);
  id v6 = WeakRetained;
  if (WeakRetained) {
    id v7 = objc_loadWeakRetained(WeakRetained + 3);
  }
  else {
    id v7 = 0;
  }
  id v8 = [v7 textLayoutManager];

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  char v15 = 0;
  if (v8)
  {
    if (self) {
      textRange = self->_textRange;
    }
    else {
      textRange = 0;
    }
    double v10 = textRange;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __54___NSTextHighlightRun_enumerateRunSegmentsUsingBlock___block_invoke;
    v11[3] = &unk_1E55C6D90;
    v11[4] = self;
    id v12 = v4;
    v13 = v14;
    [v8 enumerateTextSegmentsInRange:v10 type:0 options:0 usingBlock:v11];
  }
  _Block_object_dispose(v14, 8);
}

- (BOOL)textRangeIsInSameLine:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    id v6 = [v4 location];
    if (self)
    {
      WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_cluster);
      id v8 = WeakRetained;
      if (WeakRetained)
      {
        id v9 = objc_loadWeakRetained(WeakRetained + 3);
        goto LABEL_5;
      }
    }
    else
    {
      id v8 = 0;
    }
    id v9 = 0;
LABEL_5:
    double v10 = [v9 textLayoutManager];

    id v11 = [v10 textContentManager];
    id v12 = [v10 textLayoutFragmentForLocation:v6];
    v13 = [v12 textParagraph];
    id v14 = v13;
    if (v13)
    {
      char v15 = [v13 paragraphContentRange];
      char v16 = [v15 containsLocation:v6];

      if ((v16 & 1) == 0)
      {
        v17 = [v14 paragraphSeparatorRange];
        v18 = [v17 endLocation];

        v19 = [v5 endLocation];
        uint64_t v20 = [v18 compare:v19];

        if (v20 != -1)
        {
          BOOL v21 = 0;
          id v6 = v18;
LABEL_13:

          goto LABEL_14;
        }
        id v6 = v18;
      }
      v22 = [v12 textLineFragmentForTextLocation:v6 isUpstreamAffinity:0];
      uint64_t v35 = 0;
      char v36 = &v35;
      uint64_t v37 = 0x3032000000;
      v38 = __Block_byref_object_copy__56;
      id v39 = __Block_byref_object_dispose__57;
      id v40 = 0;
      v23 = [v11 documentRange];
      v24 = [v23 endLocation];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __45___NSTextHighlightRun_textRangeIsInSameLine___block_invoke;
      v31[3] = &unk_1E55C6DB8;
      id v32 = v12;
      id v25 = v5;
      id v33 = v25;
      v34 = &v35;
      id v26 = (id)[v10 enumerateTextLayoutFragmentsFromLocation:v24 options:1 usingBlock:v31];

      v27 = (void *)v36[5];
      uint64_t v28 = [v25 endLocation];
      v29 = [v27 textLineFragmentForTextLocation:v28 isUpstreamAffinity:1];

      BOOL v21 = v22 == v29;
      _Block_object_dispose(&v35, 8);

      goto LABEL_13;
    }
    BOOL v21 = 0;
    goto LABEL_13;
  }
  BOOL v21 = 0;
LABEL_14:

  return v21;
}

- (BOOL)isSegmentFrameRenderable:(CGRect)a3 forIndex:(unint64_t)a4
{
  return a4
      || a3.size.width != 0.0
      || ![(_NSTextHighlightRun *)self beginsOnSameLineAsPreviousRun];
}

- (BOOL)beginsOnSameLineAsPreviousRun
{
  uint64_t v3 = -[_NSTextHighlightRun prevRun]((id *)&self->super.isa);
  if (v3)
  {
    uint64_t v4 = (NSTextRange *)v3;
    -[_NSTextHighlightRun prevRun]((id *)&self->super.isa);
    uint64_t v5 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = -[_NSTextHighlightRun lastSegment](v5);
    id v7 = (void *)v6;
    if (v6) {
      id v8 = *(void **)(v6 + 88);
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;
    uint64_t v10 = [v9 location];
    if (!v10)
    {

      BOOL v23 = 0;
LABEL_15:

      return v23;
    }
    id v11 = (void *)v10;
    if (self) {
      textRange = self->_textRange;
    }
    else {
      textRange = 0;
    }
    v13 = [(NSTextRange *)textRange location];

    if (v13)
    {
      id v14 = [NSTextRange alloc];
      -[_NSTextHighlightRun prevRun]((id *)&self->super.isa);
      char v15 = (id *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = -[_NSTextHighlightRun lastSegment](v15);
      v17 = (void *)v16;
      if (v16) {
        v18 = *(void **)(v16 + 88);
      }
      else {
        v18 = 0;
      }
      id v19 = v18;
      uint64_t v20 = [v19 location];
      if (self) {
        BOOL v21 = self->_textRange;
      }
      else {
        BOOL v21 = 0;
      }
      v22 = [(NSTextRange *)v21 location];
      uint64_t v4 = [(NSTextRange *)v14 initWithLocation:v20 endLocation:v22];

      BOOL v23 = [(_NSTextHighlightRun *)self textRangeIsInSameLine:v4];
      goto LABEL_15;
    }
  }
  return 0;
}

- (BOOL)isFirstRun
{
  return !self || self->_runIndex == 0;
}

- (BOOL)isLastRun
{
  if (self)
  {
    unint64_t runIndex = self->_runIndex;
    self = (_NSTextHighlightRun *)objc_loadWeakRetained((id *)&self->_cluster);
    uint64_t v3 = self;
    if (self) {
      self = *(_NSTextHighlightRun **)&self->_leadingRun;
    }
  }
  else
  {
    uint64_t v3 = 0;
    unint64_t runIndex = 0;
  }
  BOOL v4 = runIndex == [(_NSTextHighlightRun *)self count] - 1;

  return v4;
}

- (BOOL)combinedPaths
{
  if (result)
  {
    uint64_t v1 = result;
    if ((unint64_t)[*(id *)(result + 56) count] < 2)
    {
      return 0;
    }
    else
    {
      v2 = [*(id *)(v1 + 56) objectAtIndex:0];
      CGFloat v3 = 0.0;
      CGFloat v4 = 0.0;
      CGFloat v5 = 0.0;
      CGFloat v6 = 0.0;
      CGFloat v7 = 0.0;
      if (v2)
      {
        CGFloat v7 = v2[16];
        CGFloat v4 = v2[17];
        CGFloat v5 = v2[18];
        CGFloat v6 = v2[19];
      }

      id v8 = [*(id *)(v1 + 56) objectAtIndex:1];
      CGFloat v9 = 0.0;
      CGFloat v10 = 0.0;
      CGFloat v11 = 0.0;
      if (v8)
      {
        CGFloat v11 = v8[16];
        CGFloat v3 = v8[17];
        CGFloat v9 = v8[18];
        CGFloat v10 = v8[19];
      }

      v13.origin.x = v11;
      v13.origin.y = v3;
      v13.size.width = v9;
      v13.size.height = v10;
      double MinY = CGRectGetMinY(v13);
      v14.origin.x = v7;
      v14.origin.y = v4;
      v14.size.width = v5;
      v14.size.height = v6;
      return MinY - CGRectGetMaxY(v14) <= 0.0;
    }
  }
  return result;
}

- (id)secondSegment
{
  if (a1)
  {
    v2 = a1;
    if ((unint64_t)[a1[7] count] < 2)
    {
      a1 = 0;
    }
    else
    {
      a1 = [v2[7] objectAtIndex:1];
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)secondLastSegment
{
  if (a1)
  {
    v2 = a1;
    if ((unint64_t)[a1[7] count] < 2)
    {
      a1 = 0;
    }
    else
    {
      objc_msgSend(v2[7], "objectAtIndex:", objc_msgSend(v2[7], "count") - 2);
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (int64_t)drawRunUsingBlock:(int64_t)a1
{
  CGFloat v3 = a2;
  if (a1)
  {
    CGFloat v4 = *(void **)(a1 + 56);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __41___NSTextHighlightRun_drawRunUsingBlock___block_invoke;
    v16[3] = &unk_1E55C6DE0;
    v16[4] = a1;
    [v4 enumerateObjectsUsingBlock:v16];
    uint64_t v12 = 0;
    CGRect v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    BOOL v5 = -[_NSTextHighlightRun combinedPaths](a1);
    CGFloat v6 = *(void **)(a1 + 8);
    if (v5)
    {
      CGFloat v7 = (const void *)[(id)a1 _createUnionedPathFromArray:*(void *)(a1 + 8)];
      v3[2](v3, v7, v7, *(void *)(a1 + 16), (uint64_t)(v13 + 3));
      CFRelease(v7);
    }
    else
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __41___NSTextHighlightRun_drawRunUsingBlock___block_invoke_2;
      v9[3] = &unk_1E55C6E08;
      v9[4] = a1;
      CGFloat v10 = v3;
      CGFloat v11 = &v12;
      [v6 enumerateObjectsUsingBlock:v9];
    }
    a1 = *((unsigned char *)v13 + 24) != 0;
    _Block_object_dispose(&v12, 8);
  }

  return a1;
}

- (CGPath)_createUnionedPathFromArray:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    CGFloat v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        if (v6)
        {
          CGPathRef CopyByUnioningPath = CGPathCreateCopyByUnioningPath(v6, *(CGPathRef *)(*((void *)&v11 + 1) + 8 * i), 1);
          CFRelease(v6);
          CGFloat v6 = CopyByUnioningPath;
        }
        else
        {
          CGFloat v6 = (const CGPath *)CFRetain(*(CFTypeRef *)(*((void *)&v11 + 1) + 8 * i));
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    CGFloat v6 = 0;
  }

  return v6;
}

- (id)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  if (self)
  {
    uint64_t runIndex_low = LODWORD(self->_runIndex);
    uint64_t v5 = self->_textRange;
    segments = self->_segments;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t runIndex_low = 0;
    segments = 0;
  }
  uint64_t v7 = segments;
  id v8 = [v3 stringWithFormat:@"_NSTextHighlightRun\n\tRunIndex: %u\n\tRange: %@\n\tSegment Count: %u", runIndex_low, v5, -[NSMutableArray count](v7, "count")];

  if (self)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_cluster);
    CGFloat v10 = WeakRetained;
    if (WeakRetained)
    {
      id v11 = objc_loadWeakRetained(WeakRetained + 3);
      goto LABEL_6;
    }
  }
  else
  {
    CGFloat v10 = 0;
  }
  id v11 = 0;
LABEL_6:
  long long v12 = [v11 textLayoutManager];
  long long v13 = [v12 textContentManager];

  if (objc_opt_respondsToSelector())
  {
    long long v14 = [v13 attributedString];
    char v15 = [v14 string];

    uint64_t v16 = [v13 documentRange];
    v17 = [v16 location];
    if (self) {
      textRange = self->_textRange;
    }
    else {
      textRange = 0;
    }
    id v19 = [(NSTextRange *)textRange location];
    uint64_t v20 = [v13 offsetFromLocation:v17 toLocation:v19];

    BOOL v21 = [v13 documentRange];
    v22 = [v21 location];
    if (self) {
      BOOL v23 = self->_textRange;
    }
    else {
      BOOL v23 = 0;
    }
    v24 = [(NSTextRange *)v23 endLocation];
    uint64_t v25 = [v13 offsetFromLocation:v22 toLocation:v24];

    id v26 = objc_msgSend(v15, "substringWithRange:", v20, v25 - v20);
    [v8 appendFormat:@"\n\tText:\"%@\"", v26];
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_textRange, 0);
  objc_destroyWeak((id *)&self->_cluster);

  objc_storeStrong((id *)&self->_drawnSegmentCGPaths, 0);
}

@end