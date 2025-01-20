@interface PXAnimatedCounter
- (CGSize)maxDigitSize;
- (CGSize)previousSize;
- (CGSize)requiredSizeForNumber:(unint64_t)a3;
- (NSMutableArray)digitLabels;
- (PXAnimatedCounter)initWithCoder:(id)a3;
- (PXAnimatedCounter)initWithFrame:(CGRect)a3;
- (PXAnimatedCounter)initWithNumber:(unint64_t)a3;
- (UIFont)font;
- (UILabel)backingLabel;
- (double)_xOffsetForBackingLabel:(id)a3;
- (id)_labelForDigit:(unint64_t)a3;
- (id)_numberStringForNumber:(int64_t)a3;
- (int64_t)preferredAnimationStyleForNumber:(unint64_t)a3;
- (unint64_t)_numDigitsForNumber:(int64_t)a3;
- (unint64_t)animationsInProgress;
- (unint64_t)number;
- (void)_calculateLargestDigitSize;
- (void)_setCounterToNumber:(unint64_t)a3;
- (void)_updateFramesForShownDigits;
- (void)_updateSizeIfNeeded;
- (void)commonInit;
- (void)layoutSubviews;
- (void)setAnimationsInProgress:(unint64_t)a3;
- (void)setFont:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setMaxDigitSize:(CGSize)a3;
- (void)setNumber:(unint64_t)a3;
- (void)setNumber:(unint64_t)a3 animated:(BOOL)a4;
- (void)setNumber:(unint64_t)a3 animated:(BOOL)a4 completionBlock:(id)a5;
- (void)setNumber:(unint64_t)a3 withAnimationStyle:(int64_t)a4 completionBlock:(id)a5;
- (void)setPreviousSize:(CGSize)a3;
@end

@implementation PXAnimatedCounter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingLabel, 0);
  objc_storeStrong((id *)&self->_digitLabels, 0);
  objc_storeStrong((id *)&self->_font, 0);
}

- (void)setPreviousSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_previousSize, &v3, 16, 1, 0);
}

- (CGSize)previousSize
{
  objc_copyStruct(v4, &self->_previousSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setAnimationsInProgress:(unint64_t)a3
{
  self->_animationsInProgress = a3;
}

- (unint64_t)animationsInProgress
{
  return self->_animationsInProgress;
}

- (void)setMaxDigitSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_maxDigitSize, &v3, 16, 1, 0);
}

- (CGSize)maxDigitSize
{
  objc_copyStruct(v4, &self->_maxDigitSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (UILabel)backingLabel
{
  return (UILabel *)objc_getProperty(self, a2, 432, 1);
}

- (NSMutableArray)digitLabels
{
  return (NSMutableArray *)objc_getProperty(self, a2, 424, 1);
}

- (unint64_t)number
{
  return self->_number;
}

- (UIFont)font
{
  return self->_font;
}

- (id)_labelForDigit:(unint64_t)a3
{
  v4 = [(PXAnimatedCounter *)self _numberStringForNumber:a3];
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v5 setText:v4];
  v6 = [(PXAnimatedCounter *)self font];
  if (v6) {
    [v5 setFont:v6];
  }
  [v5 sizeToFit];
  v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v5 setTextColor:v7];

  [(PXAnimatedCounter *)self addSubview:v5];
  return v5;
}

- (void)_updateSizeIfNeeded
{
  [(PXAnimatedCounter *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(PXAnimatedCounter *)self previousSize];
  if (v8 != v12 || v10 != v11)
  {
    v14 = [(PXAnimatedCounter *)self backingLabel];
    objc_msgSend(v14, "setFrame:", v4, v6, v8, v10);

    [(PXAnimatedCounter *)self _updateFramesForShownDigits];
    -[PXAnimatedCounter setPreviousSize:](self, "setPreviousSize:", v8, v10);
  }
}

- (void)_updateFramesForShownDigits
{
  id v35 = [(PXAnimatedCounter *)self digitLabels];
  [(PXAnimatedCounter *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(PXAnimatedCounter *)self backingLabel];
  [(PXAnimatedCounter *)self _xOffsetForBackingLabel:v11];
  double v13 = v12;
  uint64_t v14 = [v35 count];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = 0;
    double v33 = v13;
    CGFloat v34 = v10;
    do
    {
      v17 = [v35 objectAtIndex:v16];
      objc_msgSend(v11, "boundingRectForCharacterRange:", v16, 1);
      double v19 = v18;
      double v21 = v20;
      CGFloat v22 = v8;
      double v23 = v6;
      double v24 = v4;
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      [v17 bounds];
      double Width = CGRectGetWidth(v37);
      v38.origin.x = v19;
      v38.origin.y = v21;
      v38.size.width = v26;
      CGFloat v4 = v24;
      CGFloat v6 = v23;
      double v8 = v22;
      v38.size.height = v28;
      double v30 = (Width - CGRectGetWidth(v38)) * -0.5;
      v39.origin.x = v4;
      v39.origin.y = v6;
      v39.size.width = v22;
      v39.size.height = v34;
      double Height = CGRectGetHeight(v39);
      float v32 = v33 + v19 + v30;
      objc_msgSend(v17, "setFrame:", roundf(v32), v21, Width, Height);

      ++v16;
    }
    while (v15 != v16);
  }
}

- (void)_calculateLargestDigitSize
{
  uint64_t v3 = 0;
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4FB06F8];
  double v5 = 0.0;
  double v6 = 0.0;
  do
  {
    double v7 = [(PXAnimatedCounter *)self _numberStringForNumber:v3];
    uint64_t v14 = v4;
    double v8 = [(PXAnimatedCounter *)self font];
    v15[0] = v8;
    double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    [v7 sizeWithAttributes:v9];
    double v11 = v10;
    double v13 = v12;

    if (v11 > v5)
    {
      double v6 = v13;
      double v5 = v11;
    }

    ++v3;
  }
  while (v3 != 10);
  -[PXAnimatedCounter setMaxDigitSize:](self, "setMaxDigitSize:", v5, v6);
}

- (void)_setCounterToNumber:(unint64_t)a3
{
  self->_number = a3;
  -[PXAnimatedCounter _numberStringForNumber:](self, "_numberStringForNumber:");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v4 = [v11 length];
  double v5 = [(PXAnimatedCounter *)self digitLabels];
  if ([v5 count] >= v4)
  {
    if (!v4) {
      goto LABEL_7;
    }
  }
  else
  {
    do
    {
      double v6 = [(PXAnimatedCounter *)self _labelForDigit:0];
      [v5 addObject:v6];
    }
    while ([v5 count] < v4);
  }
  uint64_t v7 = 0;
  do
  {
    double v8 = objc_msgSend(v11, "substringWithRange:", v7, 1);
    double v9 = [v5 objectAtIndex:v7];
    [v9 setText:v8];

    ++v7;
  }
  while (v4 != v7);
LABEL_7:
  double v10 = [(PXAnimatedCounter *)self backingLabel];
  [v10 setText:v11];

  [(PXAnimatedCounter *)self _updateFramesForShownDigits];
}

- (id)_numberStringForNumber:(int64_t)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28EE0];
  unint64_t v4 = [NSNumber numberWithInteger:a3];
  double v5 = [v3 localizedStringFromNumber:v4 numberStyle:0];

  return v5;
}

- (unint64_t)_numDigitsForNumber:(int64_t)a3
{
  uint64_t v3 = [(PXAnimatedCounter *)self _numberStringForNumber:a3];
  unint64_t v4 = [v3 length];

  return v4;
}

- (double)_xOffsetForBackingLabel:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(PXAnimatedCounter *)self bounds];
  double v14 = 0.0;
  if (v10 > v13)
  {
    double v14 = v13 - v10;
    objc_msgSend(v4, "setFrame:", v6, v8, v10 + v13 - v10, v12);
  }

  return v14;
}

- (void)setFont:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_font, a3);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v6 = [(PXAnimatedCounter *)self digitLabels];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v10++) setFont:v5];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  double v11 = [(PXAnimatedCounter *)self backingLabel];
  [v11 setFont:v5];

  [(PXAnimatedCounter *)self _calculateLargestDigitSize];
}

- (CGSize)requiredSizeForNumber:(unint64_t)a3
{
  [(PXAnimatedCounter *)self maxDigitSize];
  double v6 = v5;
  float v8 = v7 * (double)[(PXAnimatedCounter *)self _numDigitsForNumber:a3];
  double v9 = ceilf(v8);
  float v10 = v6;
  double v11 = ceilf(v10);
  result.height = v11;
  result.width = v9;
  return result;
}

- (int64_t)preferredAnimationStyleForNumber:(unint64_t)a3
{
  unint64_t number = self->_number;
  BOOL v4 = number >= a3;
  int64_t v5 = 2 * (number > a3);
  if (v4) {
    return v5;
  }
  else {
    return 1;
  }
}

- (void)setNumber:(unint64_t)a3 withAnimationStyle:(int64_t)a4 completionBlock:(id)a5
{
  id v8 = a5;
  int64_t v112 = a4;
  if (a4)
  {
    unint64_t number = self->_number;
    double v9 = -[PXAnimatedCounter _numberStringForNumber:](self, "_numberStringForNumber:");
    self->_unint64_t number = a3;
    float v10 = [(PXAnimatedCounter *)self _numberStringForNumber:a3];
    double v11 = (double)(unint64_t)[v9 length];
    unint64_t v12 = [v10 length];
    if ((double)v12 >= v11) {
      double v13 = 0.0;
    }
    else {
      double v13 = v11 - (double)v12;
    }
    unint64_t v14 = [v9 length];
    unint64_t v107 = a3;
    v98 = v8;
    unint64_t v15 = 0;
    if (v14 < [v10 length])
    {
      uint64_t v16 = v9;
      do
      {
        double v9 = [@"0" stringByAppendingString:v16];

        ++v15;
        unint64_t v17 = [v9 length];
        uint64_t v16 = v9;
      }
      while (v17 < [v10 length]);
    }
    double v18 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", v10, v10);
    unint64_t v19 = [v18 length];
    if (v19 < [v9 length])
    {
      do
      {
        [v18 insertString:@"0" atIndex:0];
        unint64_t v20 = [v18 length];
      }
      while (v20 < [v9 length]);
    }
    unint64_t v21 = (unint64_t)v13;
    uint64_t v22 = [v18 length];
    double v23 = [(PXAnimatedCounter *)self backingLabel];
    v110 = v18;
    [v23 setText:v18];
    v97 = [(PXAnimatedCounter *)self digitLabels];
    [(PXAnimatedCounter *)self bounds];
    CGFloat v104 = v25;
    CGFloat v105 = v24;
    CGFloat v102 = v27;
    CGFloat v103 = v26;
    CGFloat v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v24, v25, v26, v27);
    [v28 setText:v9];
    [v28 setTextAlignment:2];
    v29 = [(PXAnimatedCounter *)self font];
    [v28 setFont:v29];

    double v30 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v109 = v28;
    [v28 setTextColor:v30];

    v116 = self;
    v113 = v23;
    [(PXAnimatedCounter *)self _xOffsetForBackingLabel:v23];
    double v123 = v31;
    float v32 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v22];
    v111 = v9;
    v115 = v32;
    uint64_t v108 = v22;
    if (v22)
    {
      unint64_t v33 = 0;
      uint64_t v34 = v112;
      if (v112 != 1) {
        uint64_t v34 = -1;
      }
      uint64_t v35 = -1;
      if (v112 != 1) {
        uint64_t v35 = 1;
      }
      double v124 = (double)v34;
      unint64_t v100 = (unint64_t)v13;
      unint64_t v101 = v15;
      double v122 = (double)v35;
      do
      {
        v36 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:11];
        v119 = objc_msgSend(v110, "substringWithRange:", v33, 1);
        uint64_t v37 = [v119 integerValue];
        v118 = objc_msgSend(v9, "substringWithRange:", v33, 1);
        uint64_t v38 = [v118 integerValue];
        if (v33 < v15) {
          uint64_t v39 = -1;
        }
        else {
          uint64_t v39 = v38;
        }
        uint64_t v40 = v37 - v39;
        uint64_t v114 = v39;
        uint64_t v41 = v39 - v37;
        if (v112 != 1) {
          uint64_t v40 = v41;
        }
        if (v40 >= 0) {
          uint64_t v42 = v40;
        }
        else {
          uint64_t v42 = v40 + 10;
        }
        objc_msgSend(v109, "boundingRectForCharacterRange:", v33, 1);
        CGFloat v44 = v43;
        CGFloat v46 = v45;
        CGFloat v48 = v47;
        CGFloat v50 = v49;
        objc_msgSend(v113, "boundingRectForCharacterRange:", v33, 1);
        CGFloat v128 = v51;
        CGFloat v126 = v52;
        CGFloat v54 = v53;
        CGFloat v56 = v55;
        v135.origin.x = v44;
        v135.origin.y = v46;
        v135.size.width = v48;
        v135.size.height = v50;
        double MinX = CGRectGetMinX(v135);
        v136.origin.x = v44;
        v136.origin.y = v46;
        v136.size.width = v48;
        v136.size.height = v50;
        CGFloat MinY = CGRectGetMinY(v136);
        v137.origin.y = v104;
        v137.origin.x = v105;
        v137.size.height = v102;
        v137.size.width = v103;
        double Height = CGRectGetHeight(v137);
        double v59 = -0.0;
        if (v33 < v21) {
          double v59 = Height;
        }
        double v60 = v59 + Height * (double)v42;
        double v125 = MinY;
        if (v33 >= v15)
        {
          v61 = [v97 objectAtIndex:v33 - v15];
          [v61 frame];
          double v120 = v64;
          double v99 = v65;
          if (v60 == 0.0)
          {
            double v96 = v63;
            [v61 bounds];
            double Width = CGRectGetWidth(v138);
            v139.origin.x = v128;
            v139.origin.y = v126;
            v139.size.width = v54;
            v139.size.height = v56;
            double v69 = (Width - CGRectGetWidth(v139)) * -0.5;
            v140.origin.x = v128;
            v140.origin.y = v126;
            v140.size.width = v54;
            v140.size.height = v56;
            CGFloat v70 = CGRectGetMinX(v140);
            double v63 = v96;
            double v66 = v60;
            *(float *)&CGFloat v70 = v123 + v70 + v69;
            double v67 = roundf(*(float *)&v70);
          }
          else
          {
            double v66 = v60;
            double v67 = v62;
          }
          v71 = -[PXLabelAnimationContext initWithLabel:andDestinationRect:]([PXLabelAnimationContext alloc], "initWithLabel:andDestinationRect:", v61, v67, v63 + v66 * v124, v99, v120);
          [v36 addObject:v71];
        }
        unint64_t v121 = v33;
        CGFloat v72 = v56;
        CGFloat v73 = v128;
        if (v42)
        {
          uint64_t v74 = -1;
          unint64_t v75 = 1;
          CGFloat v127 = v72;
          do
          {
            if (number >= v107) {
              unint64_t v76 = v74;
            }
            else {
              unint64_t v76 = v75;
            }
            v77 = [(PXAnimatedCounter *)self _labelForDigit:(uint64_t)(v114 + 10 + v76) % 10];
            [v77 sizeToFit];
            [v77 bounds];
            double v78 = CGRectGetWidth(v141);
            v142.origin.x = v73;
            v142.origin.y = v126;
            v142.size.width = v54;
            v142.size.height = v72;
            double v79 = (v78 - CGRectGetWidth(v142)) * -0.5;
            [v77 bounds];
            double v81 = v80;
            v143.size.height = v127;
            v143.origin.x = v128;
            v143.origin.y = v126;
            v143.size.width = v54;
            float v82 = v123 + MinX + (CGRectGetMinX(v143) - MinX) / (double)v42 * (double)v75 + v79;
            double v83 = roundf(v82);
            objc_msgSend(v77, "setFrame:", v83, v125 + Height * (double)v75 * v122, v81, Height);
            v84 = [PXLabelAnimationContext alloc];
            double v85 = v83;
            CGFloat v72 = v127;
            CGFloat v73 = v128;
            v86 = -[PXLabelAnimationContext initWithLabel:andDestinationRect:](v84, "initWithLabel:andDestinationRect:", v77, v85, v125 + Height * (double)v75 * v122 + v60 * v124, v81, Height);
            [v36 addObject:v86];

            ++v75;
            --v74;
          }
          while (v75 <= v42);
        }
        float v32 = v115;
        [v115 addObject:v36];

        ++v33;
        double v9 = v111;
        unint64_t v21 = v100;
        unint64_t v15 = v101;
      }
      while (v121 + 1 != v108);
    }
    [v113 setText:v95];
    v87 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v108];
    if ([v32 count])
    {
      unint64_t v88 = 0;
      do
      {
        if (v88 >= v21)
        {
          v89 = [v32 objectAtIndex:v88];
          v90 = [v89 lastObject];
          v91 = [v90 label];

          [v87 addObject:v91];
        }
        ++v88;
      }
      while (v88 < [v32 count]);
    }
    [v97 removeAllObjects];
    [v97 addObjectsFromArray:v87];
    [MEMORY[0x1E4F39CF8] flush];
    if ([v32 count])
    {
      unint64_t v92 = 0;
      do
      {
        v93 = [v32 objectAtIndex:v92];
        if ([v93 count])
        {
          [(PXAnimatedCounter *)v116 setAnimationsInProgress:[(PXAnimatedCounter *)v116 animationsInProgress] + 1];
          v94 = (void *)MEMORY[0x1E4FB1EB0];
          v133[0] = MEMORY[0x1E4F143A8];
          v133[1] = 3221225472;
          v133[2] = __66__PXAnimatedCounter_setNumber_withAnimationStyle_completionBlock___block_invoke;
          v133[3] = &unk_1E5DD36F8;
          id v134 = v93;
          v129[0] = MEMORY[0x1E4F143A8];
          v129[1] = 3221225472;
          v129[2] = __66__PXAnimatedCounter_setNumber_withAnimationStyle_completionBlock___block_invoke_2;
          v129[3] = &unk_1E5DCB4D0;
          v129[4] = v116;
          float v32 = v115;
          id v130 = v134;
          id v131 = v87;
          id v132 = v98;
          [v94 animateWithDuration:0x10000 delay:v133 usingSpringWithDamping:v129 initialSpringVelocity:0.660000026 options:(double)v92 * 0.1 animations:0.83 completion:0.0];
        }
        ++v92;
      }
      while (v92 < [v32 count]);
    }

    id v8 = v98;
  }
  else
  {
    [(PXAnimatedCounter *)self _setCounterToNumber:a3];
    if (v8) {
      (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
    }
  }
}

void __66__PXAnimatedCounter_setNumber_withAnimationStyle_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        double v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        double v7 = objc_msgSend(v6, "label", (void)v8);
        [v6 destinationRect];
        objc_msgSend(v7, "setFrame:");
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
}

void __66__PXAnimatedCounter_setNumber_withAnimationStyle_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) animationsInProgress];
  uint64_t v3 = [*(id *)(a1 + 40) valueForKeyPath:@"label"];
  id v5 = (id)[v3 mutableCopy];

  [v5 removeObjectsInArray:*(void *)(a1 + 48)];
  [v5 makeObjectsPerformSelector:sel_removeFromSuperview];
  [*(id *)(a1 + 32) setAnimationsInProgress:--v2];
  if (!v2)
  {
    uint64_t v4 = *(void *)(a1 + 56);
    if (v4) {
      (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 1);
    }
  }
}

- (void)setNumber:(unint64_t)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  id v9 = a5;
  if (v5) {
    int64_t v8 = [(PXAnimatedCounter *)self preferredAnimationStyleForNumber:a3];
  }
  else {
    int64_t v8 = 0;
  }
  [(PXAnimatedCounter *)self setNumber:a3 withAnimationStyle:v8 completionBlock:v9];
}

- (void)setNumber:(unint64_t)a3 animated:(BOOL)a4
{
}

- (void)setNumber:(unint64_t)a3
{
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXAnimatedCounter;
  -[PXAnimatedCounter setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(PXAnimatedCounter *)self _updateSizeIfNeeded];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXAnimatedCounter;
  [(PXAnimatedCounter *)&v3 layoutSubviews];
  [(PXAnimatedCounter *)self _updateSizeIfNeeded];
}

- (PXAnimatedCounter)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXAnimatedCounter;
  objc_super v3 = [(PXAnimatedCounter *)&v6 initWithCoder:a3];
  objc_super v4 = v3;
  if (v3) {
    [(PXAnimatedCounter *)v3 commonInit];
  }
  return v4;
}

- (PXAnimatedCounter)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXAnimatedCounter;
  objc_super v3 = -[PXAnimatedCounter initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_super v4 = v3;
  if (v3) {
    [(PXAnimatedCounter *)v3 commonInit];
  }
  return v4;
}

- (PXAnimatedCounter)initWithNumber:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXAnimatedCounter;
  objc_super v4 = [(PXAnimatedCounter *)&v7 init];
  BOOL v5 = v4;
  if (v4) {
    [(PXAnimatedCounter *)v4 _setCounterToNumber:a3];
  }
  return v5;
}

- (void)commonInit
{
  self->_unint64_t number = 0;
  self->_previousSize = (CGSize)*MEMORY[0x1E4F1DB30];
  objc_super v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  font = self->_font;
  self->_font = v3;

  BOOL v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  backingLabel = self->_backingLabel;
  self->_backingLabel = v5;

  objc_super v7 = self->_backingLabel;
  int64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  [(UILabel *)v7 setText:v8];

  [(UILabel *)self->_backingLabel setTextAlignment:2];
  [(UILabel *)self->_backingLabel setFont:self->_font];
  id v9 = self->_backingLabel;
  long long v10 = [MEMORY[0x1E4FB1618] magentaColor];
  [(UILabel *)v9 setTextColor:v10];

  long long v11 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:5];
  digitLabels = self->_digitLabels;
  self->_digitLabels = v11;

  uint64_t v13 = self->_digitLabels;
  unint64_t v14 = [(PXAnimatedCounter *)self _labelForDigit:0];
  [(NSMutableArray *)v13 addObject:v14];

  [(PXAnimatedCounter *)self _calculateLargestDigitSize];
}

@end