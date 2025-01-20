@interface VUIScorecardView
- (BOOL)delegateRespondsToBackgroundBlendModeForScoreValueInRowAtIndex;
- (BOOL)delegateRespondsToBackgroundImageForScorecardViewMaterial;
- (BOOL)didCalculatedSize;
- (CGSize)_calculateMetricsOfScorecard;
- (CGSize)scorecardSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)columnWidths;
- (NSArray)rowHeights;
- (NSArray)rowScoreValueSizes;
- (UIImage)darkMaterialImage;
- (VUIScoreboardLayout)scoreboardLayout;
- (VUIScorecardViewDelegate)delegate;
- (double)interitemSpacing;
- (void)_calculateColumnSpacing;
- (void)drawRect:(CGRect)a3;
- (void)invalidateData;
- (void)setColumnWidths:(id)a3;
- (void)setDarkMaterialImage:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateRespondsToBackgroundBlendModeForScoreValueInRowAtIndex:(BOOL)a3;
- (void)setDelegateRespondsToBackgroundImageForScorecardViewMaterial:(BOOL)a3;
- (void)setDidCalculatedSize:(BOOL)a3;
- (void)setInteritemSpacing:(double)a3;
- (void)setRowHeights:(id)a3;
- (void)setRowScoreValueSizes:(id)a3;
- (void)setScoreboardLayout:(id)a3;
- (void)setScorecardSize:(CGSize)a3;
@end

@implementation VUIScorecardView

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  self->_delegateRespondsToBackgroundImageForScorecardViewMaterial = objc_opt_respondsToSelector() & 1;
  LOBYTE(p_delegate) = objc_opt_respondsToSelector();

  self->_delegateRespondsToBackgroundBlendModeForScoreValueInRowAtIndex = p_delegate & 1;
}

- (void)invalidateData
{
  self->_didCalculatedSize = 0;
  self->_scorecardSize = (CGSize)*MEMORY[0x1E4F1DB30];
  self->_interitemSpacing = 0.0;
  rowScoreValueSizes = self->_rowScoreValueSizes;
  self->_rowScoreValueSizes = 0;

  self->_delegateRespondsToBackgroundImageForScorecardViewMaterial = 0;
  self->_delegateRespondsToBackgroundBlendModeForScoreValueInRowAtIndex = 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (!self->_didCalculatedSize) {
    [(VUIScorecardView *)self _calculateMetricsOfScorecard];
  }
  double width = self->_scorecardSize.width;
  double height = self->_scorecardSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_calculateColumnSpacing
{
  id v19 = [(VUIScorecardView *)self delegate];
  if ([v19 styleForScorecardView:self] == 1)
  {
    NSUInteger v3 = [(NSArray *)self->_rowScoreValueSizes count];

    if (!v3) {
      return;
    }
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v4 = [(NSArray *)self->_rowScoreValueSizes objectAtIndexedSubscript:0];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      unint64_t v6 = 0;
      do
      {
        if ([(NSArray *)self->_rowScoreValueSizes count])
        {
          unint64_t v7 = 0;
          double v8 = 0.0;
          do
          {
            v9 = [(NSArray *)self->_rowScoreValueSizes objectAtIndexedSubscript:v7];
            v10 = [v9 objectAtIndexedSubscript:v6];
            [v10 CGSizeValue];
            double v12 = v11;

            if (v12 >= v8) {
              double v8 = v12;
            }
            ++v7;
          }
          while (v7 < [(NSArray *)self->_rowScoreValueSizes count]);
        }
        v13 = (void *)MEMORY[0x1E4F28ED0];
        VUIRoundValue();
        v14 = objc_msgSend(v13, "numberWithDouble:");
        [v19 setObject:v14 atIndexedSubscript:v6];

        ++v6;
        v15 = [(NSArray *)self->_rowScoreValueSizes objectAtIndexedSubscript:0];
        unint64_t v16 = [v15 count];
      }
      while (v6 < v16);
    }
    v17 = (NSArray *)[v19 copy];
    columnWidths = self->_columnWidths;
    self->_columnWidths = v17;
  }
}

- (void)drawRect:(CGRect)a3
{
  if (self->_delegateRespondsToBackgroundImageForScorecardViewMaterial)
  {
    if (!self->_didCalculatedSize) {
      [(VUIScorecardView *)self _calculateMetricsOfScorecard];
    }
    id v49 = [(VUIScorecardView *)self delegate];
    v44 = [v49 backgroundImageForScorecardViewMaterial:self];
    if (v44)
    {
      objc_msgSend(v44, "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
      uint64_t v48 = [v49 styleForScorecardView:self];
      uint64_t v4 = [v49 numberOfRowsInScorecardView:self];
      [(VUIScoreboardLayout *)self->_scoreboardLayout padding];
      double v47 = v5;
      uint64_t v45 = v4;
      if (v4 >= 1)
      {
        uint64_t v6 = 0;
        uint64_t v46 = *MEMORY[0x1E4FB06F8];
        double v7 = 0.0;
        do
        {
          uint64_t v8 = [v49 numberOfScoreValuesForScorecardView:self inRow:v6];
          scoreboardLayout = self->_scoreboardLayout;
          if (v6 == 2) {
            [(VUIScoreboardLayout *)scoreboardLayout bottomRowLayout];
          }
          else {
          v10 = [(VUIScoreboardLayout *)scoreboardLayout topRowLayout];
          }
          if (v8 >= 1)
          {
            uint64_t v11 = 0;
            double v12 = 0.0;
            do
            {
              v13 = [v49 scoreValue:self inRow:v6 atIndex:v11];
              v14 = [(NSArray *)self->_rowScoreValueSizes objectAtIndexedSubscript:v6];
              v15 = [v14 objectAtIndexedSubscript:v11];
              [v15 CGSizeValue];
              double v17 = v16;
              double v19 = v18;

              if (v48)
              {
                v20 = [(NSArray *)self->_columnWidths objectAtIndexedSubscript:v11];
                [v20 floatValue];
                double v17 = v21;
              }
              else
              {
                if (v12 != 0.0)
                {
                  double width = self->_scorecardSize.width;
                  if (v12 + v17 < width) {
                    double v17 = width - v12;
                  }
                }
                if (v6 == 2) {
                  double v17 = self->_scorecardSize.width;
                }
              }
              if (self->_delegateRespondsToBackgroundBlendModeForScoreValueInRowAtIndex)
              {
                double v23 = v19 + v47 * 2.0;
                v24 = [v10 backgroundColor];

                if (v24)
                {
                  v25 = [v10 backgroundColor];
                  [v25 setFill];

                  CGBlendMode v26 = [v10 backgroundBlendMode];
                  v51.origin.x = v12;
                  v51.origin.y = v7;
                  v51.size.double width = v17;
                  v51.size.double height = v23;
                  UIRectFillUsingBlendMode(v51, v26);
                }
                v27 = [(VUIScoreboardLayout *)self->_scoreboardLayout textLayout];
                v28 = [v27 color];

                [v28 set];
                v29 = [(VUIScoreboardLayout *)self->_scoreboardLayout textLayout];
                v30 = v29;
                if (v6 == 2) {
                  uint64_t v31 = 1;
                }
                else {
                  uint64_t v31 = 2 * (v11 != 0);
                }
                [v29 setAlignment:v31];
                v32 = [v30 attributedStringWithString:v13 view:self];
                v33 = [v32 attribute:v46 atIndex:0 effectiveRange:0];
                [v49 marginsForRow:v6 atIndex:v11];
                double v37 = v36;
                if (v6 == 2) {
                  double v38 = 0.0;
                }
                else {
                  double v38 = v34;
                }
                double v39 = v12 + v38;
                if (v6 == 2) {
                  double v40 = 0.0;
                }
                else {
                  double v40 = v35;
                }
                [v33 ascender];
                VUIRoundValue();
                objc_msgSend(v32, "drawWithRect:options:context:", 32, 0, v39, v37 + v7 + v41, v17 - v40, v23);
              }
              double v12 = v12 + v17;

              ++v11;
            }
            while (v8 != v11);
          }
          v42 = [(NSArray *)self->_rowHeights objectAtIndexedSubscript:v6];
          [v42 doubleValue];
          double v7 = v7 + v43;

          ++v6;
        }
        while (v6 != v45);
      }
    }
  }
}

- (CGSize)_calculateMetricsOfScorecard
{
  if (self->_didCalculatedSize)
  {
    CGFloat width = self->_scorecardSize.width;
    CGFloat height = self->_scorecardSize.height;
  }
  else
  {
    id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    double v5 = [(VUIScorecardView *)self delegate];
    uint64_t v6 = [v5 numberOfRowsInScorecardView:self];
    v42 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v40 = v6;
    if (v6 < 1)
    {
      double v11 = 0.0;
      double v10 = 0.0;
    }
    else
    {
      uint64_t v7 = 0;
      double v8 = *MEMORY[0x1E4F1DB30];
      double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      double v10 = 0.0;
      double v11 = 0.0;
      do
      {
        double v44 = v11;
        id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v13 = [v5 numberOfScoreValuesForScorecardView:self inRow:v7];
        double v14 = 0.0;
        double v15 = 0.0;
        uint64_t v43 = v13 - 1;
        if (v13 >= 1)
        {
          uint64_t v16 = v13;
          for (uint64_t i = 0; i != v16; ++i)
          {
            double v18 = [v5 scoreValue:self inRow:v7 atIndex:i];
            double v19 = [(VUIScoreboardLayout *)self->_scoreboardLayout textLayout];
            v20 = [v19 attributedStringWithString:v18];

            objc_msgSend(v20, "boundingRectWithSize:options:context:", 41, 0, v8, v9);
            objc_msgSend(v20, "boundingRectWithSize:options:context:", 33, 0, v8, v9);
            [v5 marginsForRow:v7 atIndex:i];
            double v22 = v21;
            double v24 = v23;
            VUIRoundValue();
            double v26 = v24 + v25 + v22;
            VUIRoundValue();
            if (v15 <= v27) {
              double v15 = v27;
            }
            v28 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", v26, v27);
            [v12 addObject:v28];

            double v14 = v14 + v26;
          }
        }
        [v5 marginsForRow:v7 atIndex:0];
        double v31 = v30 + v15 + v29;
        v32 = [MEMORY[0x1E4F28ED0] numberWithDouble:v31];
        [v42 setObject:v32 atIndexedSubscript:v7];

        double v11 = v44 + v31;
        [v41 addObject:v12];
        if (v10 < v14 + (double)v43 * 8.0) {
          double v10 = v14 + (double)v43 * 8.0;
        }

        ++v7;
      }
      while (v7 != v40);
    }
    v33 = (NSArray *)[v42 copy];
    rowHeights = self->_rowHeights;
    self->_rowHeights = v33;

    for (j = 8.0; v10 < v11; double v10 = v10 + 1.0)
      double j = j + 1.0;
    self->_interitemSpacing = j;
    double v36 = (NSArray *)[v41 copy];
    rowScoreValueSizes = self->_rowScoreValueSizes;
    self->_rowScoreValueSizes = v36;

    self->_scorecardSize.CGFloat width = v10;
    self->_scorecardSize.CGFloat height = v11;
    [(VUIScorecardView *)self _calculateColumnSpacing];
    self->_didCalculatedSize = 1;
    CGFloat width = self->_scorecardSize.width;
    CGFloat height = self->_scorecardSize.height;
  }
  double v38 = width;
  double v39 = height;
  result.CGFloat height = v39;
  result.CGFloat width = v38;
  return result;
}

- (VUIScorecardViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUIScorecardViewDelegate *)WeakRetained;
}

- (VUIScoreboardLayout)scoreboardLayout
{
  return self->_scoreboardLayout;
}

- (void)setScoreboardLayout:(id)a3
{
}

- (BOOL)didCalculatedSize
{
  return self->_didCalculatedSize;
}

- (void)setDidCalculatedSize:(BOOL)a3
{
  self->_didCalculatedSize = a3;
}

- (CGSize)scorecardSize
{
  double width = self->_scorecardSize.width;
  double height = self->_scorecardSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setScorecardSize:(CGSize)a3
{
  self->_scorecardSize = a3;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (void)setInteritemSpacing:(double)a3
{
  self->_interitemSpacing = a3;
}

- (NSArray)rowScoreValueSizes
{
  return self->_rowScoreValueSizes;
}

- (void)setRowScoreValueSizes:(id)a3
{
}

- (NSArray)columnWidths
{
  return self->_columnWidths;
}

- (void)setColumnWidths:(id)a3
{
}

- (NSArray)rowHeights
{
  return self->_rowHeights;
}

- (void)setRowHeights:(id)a3
{
}

- (UIImage)darkMaterialImage
{
  return self->_darkMaterialImage;
}

- (void)setDarkMaterialImage:(id)a3
{
}

- (BOOL)delegateRespondsToBackgroundImageForScorecardViewMaterial
{
  return self->_delegateRespondsToBackgroundImageForScorecardViewMaterial;
}

- (void)setDelegateRespondsToBackgroundImageForScorecardViewMaterial:(BOOL)a3
{
  self->_delegateRespondsToBackgroundImageForScorecardViewMaterial = a3;
}

- (BOOL)delegateRespondsToBackgroundBlendModeForScoreValueInRowAtIndex
{
  return self->_delegateRespondsToBackgroundBlendModeForScoreValueInRowAtIndex;
}

- (void)setDelegateRespondsToBackgroundBlendModeForScoreValueInRowAtIndex:(BOOL)a3
{
  self->_delegateRespondsToBackgroundBlendModeForScoreValueInRowAtIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkMaterialImage, 0);
  objc_storeStrong((id *)&self->_rowHeights, 0);
  objc_storeStrong((id *)&self->_columnWidths, 0);
  objc_storeStrong((id *)&self->_rowScoreValueSizes, 0);
  objc_storeStrong((id *)&self->_scoreboardLayout, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end