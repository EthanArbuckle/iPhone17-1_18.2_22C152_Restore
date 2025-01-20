@interface TLKManyTrailingGridLayoutManager
+ (id)computeTruncationForAlignments:(id)a3 indexForFirstTrailingColumn:(unint64_t)a4 totalEqualColumns:(unint64_t)a5;
- (CGSize)sizeForFittingSize:(CGSize)a3 forRow:(id)a4;
- (_NSRange)ignoreRange;
- (double)gridArrangement:(id)a3 widthOfColumnAtIndex:(int64_t)a4 spacingAfter:(double *)a5;
- (void)setIgnoreRange:(_NSRange)a3;
@end

@implementation TLKManyTrailingGridLayoutManager

- (CGSize)sizeForFittingSize:(CGSize)a3 forRow:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  [(TLKGridLayoutManager *)self cachedFittingSize];
  if (width != v9 || height != v8)
  {
    -[TLKGridLayoutManager setCachedFittingSize:](self, "setCachedFittingSize:", width, height);
    v11 = [(TLKGridLayoutManager *)self gridArrangement];
    objc_msgSend(v11, "layoutSizeFittingSize:", width, height);
    -[TLKGridLayoutManager setCachedGridSize:](self, "setCachedGridSize:");

    v12 = [(TLKGridLayoutManager *)self itemsForRows];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      unint64_t v14 = 0;
      double v15 = 0.0;
      do
      {
        v16 = [(TLKGridLayoutManager *)self itemsForRows];
        v17 = [v16 objectAtIndexedSubscript:v14];
        v18 = [v17 firstObject];

        objc_msgSend(v18, "sizeForTargetSize:", width, height);
        if (v15 < v19) {
          double v15 = v19;
        }

        ++v14;
        v20 = [(TLKGridLayoutManager *)self itemsForRows];
        unint64_t v21 = [v20 count];
      }
      while (v14 < v21);
    }
    else
    {
      double v15 = 0.0;
    }
    +[TLKLabelItem minimumWidthForLabelItem];
    unint64_t v23 = vcvtmd_u64_f64((width - v15) / v22);
    v24 = [(TLKGridLayoutManager *)self alignments];
    uint64_t v25 = [v24 count] - v23;

    if (v25 > 0) {
      uint64_t v26 = 1;
    }
    else {
      uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
    }
    -[TLKManyTrailingGridLayoutManager setIgnoreRange:](self, "setIgnoreRange:", v26, v25 & ~(v25 >> 63));
    v27 = [(TLKGridLayoutManager *)self gridArrangement];
    [v27 reloadData];
  }
  v34.receiver = self;
  v34.super_class = (Class)TLKManyTrailingGridLayoutManager;
  -[TLKGridLayoutManager sizeForFittingSize:forRow:](&v34, sel_sizeForFittingSize_forRow_, v7, width, height);
  double v29 = v28;
  double v31 = v30;

  double v32 = v29;
  double v33 = v31;
  result.double height = v33;
  result.double width = v32;
  return result;
}

- (double)gridArrangement:(id)a3 widthOfColumnAtIndex:(int64_t)a4 spacingAfter:(double *)a5
{
  v10.receiver = self;
  v10.super_class = (Class)TLKManyTrailingGridLayoutManager;
  [(TLKGridLayoutManager *)&v10 gridArrangement:a3 widthOfColumnAtIndex:a4 spacingAfter:a5];
  if ([(TLKManyTrailingGridLayoutManager *)self ignoreRange] == 0x7FFFFFFFFFFFFFFFLL) {
    return *MEMORY[0x1E4F4BEC8];
  }
  unint64_t v8 = [(TLKManyTrailingGridLayoutManager *)self ignoreRange];
  if (a4 < v8) {
    return *MEMORY[0x1E4F4BEC8];
  }
  double result = 0.0;
  if (a4 - v8 >= v9) {
    return *MEMORY[0x1E4F4BEC8];
  }
  return result;
}

+ (id)computeTruncationForAlignments:(id)a3 indexForFirstTrailingColumn:(unint64_t)a4 totalEqualColumns:(unint64_t)a5
{
  id v5 = a3;
  v6 = objc_opt_new();
  if ([v5 count])
  {
    unint64_t v7 = 0;
    do
    {
      if (v7)
      {
        unint64_t v8 = &unk_1F0965C30;
        unint64_t v9 = v7;
      }
      else
      {
        unint64_t v8 = &unk_1F0965C20;
        unint64_t v9 = 0;
      }
      [v6 setObject:v8 atIndexedSubscript:v9];
      ++v7;
    }
    while (v7 < [v5 count]);
  }

  return v6;
}

- (_NSRange)ignoreRange
{
  p_ignoreRange = &self->_ignoreRange;
  NSUInteger location = self->_ignoreRange.location;
  NSUInteger length = p_ignoreRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setIgnoreRange:(_NSRange)a3
{
  self->_ignoreRange = a3;
}

@end