@interface ICTableColumnLayoutManager
- (ICTableColumnLayoutManager)initWithTableLayoutManager:(id)a3 columnID:(id)a4;
- (ICTableColumnTextStorage)columnTextStorage;
- (ICTableLayoutManager)tableLayoutManager;
- (NSArray)hiddenRows;
- (NSMutableSet)currentlyHiddenSubviews;
- (NSTextContainer)textContainer;
- (NSUUID)columnID;
- (_NSRange)glyphRangeForBoundingRect:(CGRect)a3 inTextContainer:(id)a4;
- (_NSRange)glyphRangeForRowID:(id)a3;
- (double)heightOfCellAtRowID:(id)a3;
- (double)width;
- (id)glyphRangesForRows:(id)a3;
- (id)rectsForGlyphRange:(_NSRange)a3;
- (void)drawGlyphsForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4;
- (void)ensureCellExistsAtRowID:(id)a3;
- (void)filterAttachmentsInTextStorage:(id)a3 range:(_NSRange)a4 targetAttachment:(id)a5;
- (void)removeRow:(id)a3;
- (void)setHiddenRows:(id)a3;
@end

@implementation ICTableColumnLayoutManager

- (ICTableColumnLayoutManager)initWithTableLayoutManager:(id)a3 columnID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)ICTableColumnLayoutManager;
  v8 = [(ICLayoutManager *)&v29 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_tableLayoutManager, v6);
    objc_storeStrong((id *)&v9->_columnID, a4);
    v28 = [v6 columnWidthManager];
    [v28 widthOfColumn:v7];
    double v11 = v10;
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_tableLayoutManager);
    v13 = [WeakRetained table];
    v14 = [v13 delegate];
    v15 = v14;
    if (!v14)
    {
      v15 = [v6 delegate];
    }
    id v16 = objc_loadWeakRetained((id *)&v9->_tableLayoutManager);
    v17 = [v16 table];
    [v17 setDelegate:v15];

    if (!v14) {
    id v18 = objc_loadWeakRetained((id *)&v9->_tableLayoutManager);
    }
    v19 = [v18 table];
    uint64_t v20 = [v19 textStorageForColumn:v7];
    columnTextStorage = v9->_columnTextStorage;
    v9->_columnTextStorage = (ICTableColumnTextStorage *)v20;

    [(ICTableColumnLayoutManager *)v9 setTextStorage:v9->_columnTextStorage];
    [(ICTableColumnLayoutManager *)v9 setAllowsNonContiguousLayout:1];
    v22 = -[ICTableColumnTextContainer initWithSize:]([ICTableColumnTextContainer alloc], "initWithSize:", v11, 1.79769313e308);
    textContainer = v9->_textContainer;
    v9->_textContainer = &v22->super.super;

    [(NSTextContainer *)v9->_textContainer setLineFragmentPadding:*MEMORY[0x263F5B180]];
    [(NSTextContainer *)v9->_textContainer setWidthTracksTextView:0];
    [(NSTextContainer *)v9->_textContainer setHeightTracksTextView:0];
    [(ICTableColumnLayoutManager *)v9 addTextContainer:v9->_textContainer];
    [(NSTextContainer *)v9->_textContainer setLayoutManager:v9];
    v24 = [(ICTableColumnLayoutManager *)v9 textStorage];
    [v24 addLayoutManager:v9];

    uint64_t v25 = [MEMORY[0x263EFF9C0] set];
    currentlyHiddenSubviews = v9->_currentlyHiddenSubviews;
    v9->_currentlyHiddenSubviews = (NSMutableSet *)v25;
  }
  return v9;
}

- (void)setHiddenRows:(id)a3
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v5 = a3;
  p_hiddenRows = &self->_hiddenRows;
  if (([(NSArray *)self->_hiddenRows isEqual:v5] & 1) == 0)
  {
    id v60 = v5;
    if ([(NSArray *)*p_hiddenRows count])
    {
      id v7 = [(ICTableColumnLayoutManager *)self glyphRangesForRows:*p_hiddenRows];
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v77 objects:v85 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v78;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v78 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = [*(id *)(*((void *)&v77 + 1) + 8 * i) rangeValue];
            if (v13) {
              -[ICTableColumnLayoutManager invalidateDisplayForGlyphRange:](self, "invalidateDisplayForGlyphRange:", v12, v13);
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v77 objects:v85 count:16];
        }
        while (v9);
      }
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      v14 = [(ICTableColumnLayoutManager *)self currentlyHiddenSubviews];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v73 objects:v84 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v74;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v74 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v73 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              [v19 setHidden:0];
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v73 objects:v84 count:16];
        }
        while (v16);
      }

      uint64_t v20 = [(ICTableColumnLayoutManager *)self currentlyHiddenSubviews];
      [v20 removeAllObjects];

      id v5 = v60;
    }
    objc_storeStrong((id *)&self->_hiddenRows, a3);
    if ([v5 count])
    {
      v59 = [(ICBaseLayoutManager *)self textView];
      v21 = [v59 containerViewForAttachments];
      CGFloat x = *MEMORY[0x263F001A8];
      CGFloat y = *(double *)(MEMORY[0x263F001A8] + 8);
      CGFloat width = *(double *)(MEMORY[0x263F001A8] + 16);
      CGFloat height = *(double *)(MEMORY[0x263F001A8] + 24);
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id v26 = v5;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v69 objects:v83 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v70;
        do
        {
          for (uint64_t k = 0; k != v28; ++k)
          {
            if (*(void *)v70 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = *(void *)(*((void *)&v69 + 1) + 8 * k);
            [(ICTableColumnLayoutManager *)self heightOfCellAtRowID:v31];
            CGFloat v33 = v32;
            v34 = [(ICTableColumnLayoutManager *)self tableLayoutManager];
            v35 = [v34 rowPositions];
            v36 = [v35 objectForKeyedSubscript:v31];
            [v36 doubleValue];
            CGFloat v38 = v37;
            [(ICTableColumnLayoutManager *)self width];
            CGFloat v40 = v39;

            v87.origin.CGFloat x = x;
            v87.origin.CGFloat y = y;
            v87.size.CGFloat width = width;
            v87.size.CGFloat height = height;
            if (CGRectIsEmpty(v87))
            {
              CGFloat height = v33;
              CGFloat width = v40;
              CGFloat y = v38;
              CGFloat x = 0.0;
            }
            else
            {
              v88.origin.CGFloat x = 0.0;
              v88.origin.CGFloat y = v38;
              v88.size.CGFloat width = v40;
              v88.size.CGFloat height = v33;
              v95.origin.CGFloat x = x;
              v95.origin.CGFloat y = y;
              v95.size.CGFloat width = width;
              v95.size.CGFloat height = height;
              CGRect v89 = CGRectUnion(v88, v95);
              CGFloat x = v89.origin.x;
              CGFloat y = v89.origin.y;
              CGFloat width = v89.size.width;
              CGFloat height = v89.size.height;
            }
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v69 objects:v83 count:16];
        }
        while (v28);
      }

      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      v41 = [v21 subviews];
      uint64_t v42 = [v41 countByEnumeratingWithState:&v65 objects:v82 count:16];
      if (v42)
      {
        uint64_t v43 = v42;
        uint64_t v44 = *(void *)v66;
        do
        {
          for (uint64_t m = 0; m != v43; ++m)
          {
            if (*(void *)v66 != v44) {
              objc_enumerationMutation(v41);
            }
            v46 = *(void **)(*((void *)&v65 + 1) + 8 * m);
            [v46 frame];
            v96.origin.CGFloat x = x;
            v96.origin.CGFloat y = y;
            v96.size.CGFloat width = width;
            v96.size.CGFloat height = height;
            if (CGRectIntersectsRect(v90, v96))
            {
              [v21 bounds];
              CGRect v92 = CGRectIntegral(v91);
              CGFloat v47 = v92.origin.x;
              CGFloat v48 = v92.origin.y;
              CGFloat v49 = v92.size.width;
              CGFloat v50 = v92.size.height;
              [v46 frame];
              CGRect v97 = CGRectIntegral(v93);
              v94.origin.CGFloat x = v47;
              v94.origin.CGFloat y = v48;
              v94.size.CGFloat width = v49;
              v94.size.CGFloat height = v50;
              if (!CGRectEqualToRect(v94, v97))
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  [v46 setHidden:1];
                  v51 = [(ICTableColumnLayoutManager *)self currentlyHiddenSubviews];
                  [v51 addObject:v46];
                }
              }
            }
          }
          uint64_t v43 = [v41 countByEnumeratingWithState:&v65 objects:v82 count:16];
        }
        while (v43);
      }

      v52 = [(ICTableColumnLayoutManager *)self glyphRangesForRows:*p_hiddenRows];
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      uint64_t v53 = [v52 countByEnumeratingWithState:&v61 objects:v81 count:16];
      if (v53)
      {
        uint64_t v54 = v53;
        uint64_t v55 = *(void *)v62;
        do
        {
          for (uint64_t n = 0; n != v54; ++n)
          {
            if (*(void *)v62 != v55) {
              objc_enumerationMutation(v52);
            }
            uint64_t v57 = [*(id *)(*((void *)&v61 + 1) + 8 * n) rangeValue];
            if (v58) {
              -[ICTableColumnLayoutManager invalidateDisplayForGlyphRange:](self, "invalidateDisplayForGlyphRange:", v57, v58);
            }
          }
          uint64_t v54 = [v52 countByEnumeratingWithState:&v61 objects:v81 count:16];
        }
        while (v54);
      }

      id v5 = v60;
    }
  }
}

- (double)width
{
  v2 = [(ICTableColumnLayoutManager *)self textContainer];
  [v2 size];
  double v4 = v3;

  return v4;
}

- (void)removeRow:(id)a3
{
  id v4 = a3;
  id v5 = [(ICTableColumnLayoutManager *)self columnTextStorage];
  [v5 removeRow:v4];
}

- (void)ensureCellExistsAtRowID:(id)a3
{
  id v4 = a3;
  id v5 = [(ICTableColumnLayoutManager *)self columnTextStorage];
  [v5 characterRangeForRowID:v4];
}

- (_NSRange)glyphRangeForRowID:(id)a3
{
  id v4 = a3;
  id v5 = [(ICTableColumnLayoutManager *)self columnTextStorage];
  uint64_t v6 = [v5 characterRangeForRowID:v4];
  uint64_t v8 = v7;

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v9 = 0x7FFFFFFFFFFFFFFFLL;
    NSUInteger v10 = 0;
  }
  else
  {
    NSUInteger v9 = -[ICTableColumnLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", v6, v8, 0);
  }
  result.length = v10;
  result.locatiouint64_t n = v9;
  return result;
}

- (double)heightOfCellAtRowID:(id)a3
{
  uint64_t v4 = [(ICTableColumnLayoutManager *)self glyphRangeForRowID:a3];
  if (v5)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v5;
    -[ICTableColumnLayoutManager ensureLayoutForGlyphRange:](self, "ensureLayoutForGlyphRange:", v4, v5);
    uint64_t v8 = [(ICTableColumnLayoutManager *)self textContainer];
    -[ICLayoutManager boundingRectForGlyphRange:inTextContainer:](self, "boundingRectForGlyphRange:inTextContainer:", v6, v7, v8);
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    double v16 = v15;

    unint64_t v17 = v6 + v7;
    if (v17 >= [(ICTableColumnLayoutManager *)self numberOfGlyphs])
    {
      id v26 = [(ICTableColumnLayoutManager *)self textStorage];
      uint64_t v27 = [v26 attribute:*MEMORY[0x263F81540] atIndex:v17 - 1 effectiveRange:0];

      [v27 lineSpacing];
      double height = v16 + v28;
    }
    else
    {
      [(ICLayoutManager *)self lineFragmentRectForGlyphAtIndex:v17 effectiveRange:0];
      v32.origin.CGFloat x = v18;
      v32.origin.CGFloat y = v19;
      v32.size.CGFloat width = v20;
      v32.size.double height = v21;
      v30.origin.CGFloat x = v10;
      v30.origin.CGFloat y = v12;
      v30.size.CGFloat width = v14;
      v30.size.double height = v16;
      CGRect v31 = CGRectUnion(v30, v32);
      double height = v31.size.height;
    }
    double v25 = height + *MEMORY[0x263F5B188] + *MEMORY[0x263F5B170];
  }
  else
  {
    v23 = [(ICTableColumnLayoutManager *)self tableLayoutManager];
    [v23 emptyCellHeight];
    double v25 = v24;
  }
  return round(v25);
}

- (id)glyphRangesForRows:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[ICTableColumnLayoutManager glyphRangeForRowID:](self, "glyphRangeForRowID:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        double v13 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v11, v12);
        [v5 addObject:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)drawGlyphsForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  NSUInteger length = a3.length;
  locatiouint64_t n = a3.location;
  uint64_t v44 = *MEMORY[0x263EF8340];
  uint64_t v9 = [(ICTableColumnLayoutManager *)self hiddenRows];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    uint64_t v11 = [(ICTableColumnLayoutManager *)self hiddenRows];
    uint64_t v12 = [(ICTableColumnLayoutManager *)self glyphRangesForRows:v11];

    double v13 = [v12 sortedArrayUsingComparator:&__block_literal_global_7];

    CGRect v31 = [MEMORY[0x263EFF980] array];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v39 != v17) {
            objc_enumerationMutation(v14);
          }
          v45.locatiouint64_t n = [*(id *)(*((void *)&v38 + 1) + 8 * i) rangeValue];
          NSUInteger v19 = v45.location;
          NSUInteger v20 = v45.length;
          v46.locatiouint64_t n = location;
          v46.NSUInteger length = length;
          if (NSIntersectionRange(v45, v46).length)
          {
            if (v19 > location)
            {
              CGFloat v21 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", location, v19 - location);
              [v31 addObject:v21];
            }
            BOOL v22 = location + length > v19 + v20;
            if (location + length >= v19 + v20) {
              NSUInteger length = location + length - (v19 + v20);
            }
            else {
              NSUInteger length = 0;
            }
            if (v22) {
              locatiouint64_t n = v19 + v20;
            }
            else {
              locatiouint64_t n = 0;
            }
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v16);
    }

    if (length)
    {
      v23 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", location, length);
      [v31 addObject:v23];
    }
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v24 = v31;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v35 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = [*(id *)(*((void *)&v34 + 1) + 8 * j) rangeValue];
          v33.receiver = self;
          v33.super_class = (Class)ICTableColumnLayoutManager;
          -[ICLayoutManager drawGlyphsForGlyphRange:atPoint:](&v33, sel_drawGlyphsForGlyphRange_atPoint_, v29, v30, x, y);
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v26);
    }
  }
  else
  {
    v32.receiver = self;
    v32.super_class = (Class)ICTableColumnLayoutManager;
    -[ICLayoutManager drawGlyphsForGlyphRange:atPoint:](&v32, sel_drawGlyphsForGlyphRange_atPoint_, location, length, x, y);
  }
}

uint64_t __62__ICTableColumnLayoutManager_drawGlyphsForGlyphRange_atPoint___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 rangeValue];
  uint64_t v6 = [v4 rangeValue];

  uint64_t v7 = [NSNumber numberWithUnsignedInteger:v5];
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:v6];
  uint64_t v9 = [v7 compare:v8];

  return v9;
}

- (_NSRange)glyphRangeForBoundingRect:(CGRect)a3 inTextContainer:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v48.receiver = self;
  v48.super_class = (Class)ICTableColumnLayoutManager;
  locatiouint64_t n = (NSUInteger)-[ICTableColumnLayoutManager glyphRangeForBoundingRect:inTextContainer:](&v48, sel_glyphRangeForBoundingRect_inTextContainer_, a4);
  NSUInteger length = v10;
  uint64_t v12 = [(ICTableColumnLayoutManager *)self hiddenRows];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    unint64_t v46 = -[ICTableColumnLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", location, length, 0);
    uint64_t v47 = v14;
    for (unint64_t i = v46 + v14; ; unint64_t i = v46 + v47)
    {
      unint64_t v16 = i + 1;
      uint64_t v17 = [(ICTableColumnLayoutManager *)self textStorage];
      unint64_t v18 = [v17 length];

      if (v16 >= v18) {
        break;
      }
      NSUInteger v19 = [(ICTableColumnLayoutManager *)self columnTextStorage];
      NSUInteger v20 = [v19 rowAtIndex:v46 + v47 + 1 rowRange:&v46];

      CGFloat v21 = [(ICTableColumnLayoutManager *)self hiddenRows];
      char v22 = [v21 containsObject:v20];

      if ((v22 & 1) == 0)
      {
        v23 = [(ICTableColumnLayoutManager *)self tableLayoutManager];
        id v24 = [v23 rowPositions];
        uint64_t v25 = [v24 objectForKeyedSubscript:v20];
        [v25 doubleValue];
        double v27 = v26;

        v54.origin.CGFloat x = x;
        v54.origin.CGFloat y = y;
        v54.size.CGFloat width = width;
        v54.size.CGFloat height = height;
        if (v27 > CGRectGetMaxY(v54))
        {

          break;
        }
        v52.locatiouint64_t n = [(ICTableColumnLayoutManager *)self glyphRangeForRowID:v20];
        v52.NSUInteger length = v28;
        v49.locatiouint64_t n = location;
        v49.NSUInteger length = length;
        NSRange v29 = NSUnionRange(v49, v52);
        locatiouint64_t n = v29.location;
        NSUInteger length = v29.length;
      }
    }
    unint64_t v46 = -[ICTableColumnLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", location, length, 0);
    uint64_t v47 = v30;
    while (v46 >= 2)
    {
      CGRect v31 = [(ICTableColumnLayoutManager *)self columnTextStorage];
      objc_super v32 = [v31 rowAtIndex:v46 - 1 rowRange:&v46];

      objc_super v33 = [(ICTableColumnLayoutManager *)self hiddenRows];
      char v34 = [v33 containsObject:v32];

      if ((v34 & 1) == 0)
      {
        long long v35 = [(ICTableColumnLayoutManager *)self tableLayoutManager];
        long long v36 = [v35 rowPositions];
        long long v37 = [v36 objectForKeyedSubscript:v32];
        [v37 doubleValue];
        double v39 = v38;
        [(ICTableColumnLayoutManager *)self heightOfCellAtRowID:v32];
        CGFloat v41 = v39 + v40;

        v55.origin.CGFloat x = x;
        v55.origin.CGFloat y = y;
        v55.size.CGFloat width = width;
        v55.size.CGFloat height = height;
        if (v41 < CGRectGetMinY(v55))
        {

          break;
        }
        v53.locatiouint64_t n = [(ICTableColumnLayoutManager *)self glyphRangeForRowID:v32];
        v53.NSUInteger length = v42;
        v50.locatiouint64_t n = location;
        v50.NSUInteger length = length;
        NSRange v43 = NSUnionRange(v50, v53);
        locatiouint64_t n = v43.location;
        NSUInteger length = v43.length;
      }
    }
  }
  NSUInteger v44 = location;
  NSUInteger v45 = length;
  result.NSUInteger length = v45;
  result.locatiouint64_t n = v44;
  return result;
}

- (id)rectsForGlyphRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  locatiouint64_t n = a3.location;
  uint64_t v6 = [MEMORY[0x263EFF980] array];
  -[ICTableColumnLayoutManager ensureLayoutForGlyphRange:](self, "ensureLayoutForGlyphRange:", location, length);
  uint64_t v7 = [(ICTableColumnLayoutManager *)self textContainer];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __49__ICTableColumnLayoutManager_rectsForGlyphRange___block_invoke;
  v12[3] = &unk_2640B9C20;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  -[ICTableColumnLayoutManager enumerateEnclosingRectsForGlyphRange:withinSelectedGlyphRange:inTextContainer:usingBlock:](self, "enumerateEnclosingRectsForGlyphRange:withinSelectedGlyphRange:inTextContainer:usingBlock:", location, length, 0x7FFFFFFFFFFFFFFFLL, 0, v7, v12);

  uint64_t v9 = v13;
  id v10 = v8;

  return v10;
}

void __49__ICTableColumnLayoutManager_rectsForGlyphRange___block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  id v10 = [*(id *)(a1 + 32) textView];
  [v10 textContainerInset];
  CGFloat v12 = v11;
  id v13 = [*(id *)(a1 + 32) textView];
  [v13 textContainerInset];
  CGFloat v15 = v14;
  v23.origin.double x = a2;
  v23.origin.double y = a3;
  v23.size.double width = a4;
  v23.size.double height = a5;
  CGRect v24 = CGRectOffset(v23, v12, v15);
  double x = v24.origin.x;
  double y = v24.origin.y;
  double width = v24.size.width;
  double height = v24.size.height;

  NSUInteger v20 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", x, y, width, height);
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  [v20 addObject:v21];
}

- (void)filterAttachmentsInTextStorage:(id)a3 range:(_NSRange)a4 targetAttachment:(id)a5
{
  NSUInteger length = a4.length;
  locatiouint64_t n = a4.location;
  id v8 = a5;
  id v9 = a3;
  objc_opt_class();
  ICCheckedDynamicCast();
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  id v10 = ICCheckedDynamicCast();

  if (v13) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    CGFloat v12 = [v13 parentAttachment];
    objc_msgSend(v12, "filterInlineAttachmentsInTableColumnTextStorage:range:", v10, location, length);
  }
}

- (ICTableLayoutManager)tableLayoutManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableLayoutManager);

  return (ICTableLayoutManager *)WeakRetained;
}

- (NSUUID)columnID
{
  return (NSUUID *)objc_getProperty(self, a2, 480, 1);
}

- (NSTextContainer)textContainer
{
  return self->_textContainer;
}

- (NSArray)hiddenRows
{
  return self->_hiddenRows;
}

- (NSMutableSet)currentlyHiddenSubviews
{
  return self->_currentlyHiddenSubviews;
}

- (ICTableColumnTextStorage)columnTextStorage
{
  return self->_columnTextStorage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnTextStorage, 0);
  objc_storeStrong((id *)&self->_currentlyHiddenSubviews, 0);
  objc_storeStrong((id *)&self->_hiddenRows, 0);
  objc_storeStrong((id *)&self->_textContainer, 0);
  objc_storeStrong((id *)&self->_columnID, 0);

  objc_destroyWeak((id *)&self->_tableLayoutManager);
}

@end