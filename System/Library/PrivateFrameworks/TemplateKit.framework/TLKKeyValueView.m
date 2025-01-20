@interface TLKKeyValueView
+ (unint64_t)visibleRowsInGrid:(id)a3;
- (BOOL)containerView:(id)a3 shouldRestartMeasurementDueToCompressionInAxis:(int64_t)a4 forReason:(int64_t)a5;
- (BOOL)leadingGridIsHidden;
- (BOOL)trailingGridIsHidden;
- (CGRect)containerView:(id)a3 layoutFrameForArrangedSubview:(id)a4 withProposedFrame:(CGRect)a5;
- (NSArray)leadingTuples;
- (NSArray)trailingTuples;
- (TLKImage)image;
- (TLKImageView)imageView;
- (TLKKeyValueGridView)leadingGrid;
- (TLKKeyValueGridView)trailingGrid;
- (double)lastMeasuredWidth;
- (id)leadingTextKeyLabels;
- (id)setupContentView;
- (int64_t)currentStackViewDistribution;
- (unint64_t)numberOfVisibleRowsForLeadingGrid;
- (unint64_t)numberOfVisibleRowsForTrailingGrid;
- (void)_reconfigureForCompressedState;
- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5;
- (void)observedPropertiesChanged;
- (void)setImage:(id)a3;
- (void)setImageView:(id)a3;
- (void)setLastMeasuredWidth:(double)a3;
- (void)setLeadingGrid:(id)a3;
- (void)setLeadingTuples:(id)a3;
- (void)setTrailingGrid:(id)a3;
- (void)setTrailingTuples:(id)a3;
@end

@implementation TLKKeyValueView

- (id)setupContentView
{
  v3 = objc_opt_new();
  [v3 setDelegate:self];
  v4 = objc_opt_new();
  [v3 addArrangedSubview:v4];
  [(TLKKeyValueView *)self setLeadingGrid:v4];
  v5 = objc_opt_new();
  [v3 addArrangedSubview:v5];
  [(TLKKeyValueView *)self setTrailingGrid:v5];
  v6 = objc_opt_new();
  +[TLKLayoutUtilities requireIntrinsicSizeForView:v6];
  [v3 addArrangedSubview:v6];
  [(TLKKeyValueView *)self setImageView:v6];

  return v3;
}

- (void)setLeadingTuples:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_leadingTuples = &self->_leadingTuples;
  if (objc_opt_respondsToSelector())
  {
    [(NSArray *)*p_leadingTuples setObserver:0];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v24 = v5;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      v7 = *p_leadingTuples;
      uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v30;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v30 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
            if (objc_opt_respondsToSelector()) {
              [v12 setObserver:0];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v9);
      }

      id v5 = v24;
    }
  }
  objc_storeStrong((id *)&self->_leadingTuples, a3);
  if (objc_opt_respondsToSelector())
  {
    [(NSArray *)*p_leadingTuples setObserver:self];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      v13 = *p_leadingTuples;
      uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v26;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v26 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v25 + 1) + 8 * v17);
            if (objc_opt_respondsToSelector()) {
              [v18 setObserver:self];
            }
            ++v17;
          }
          while (v15 != v17);
          uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
        }
        while (v15);
      }
    }
  }
  uint64_t v19 = [(TLKView *)self observer];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(TLKView *)self observer];
    uint64_t v22 = [v21 batchUpdateCount];

    if (!v22)
    {
      v23 = [(TLKView *)self observer];
      [v23 propertiesDidChange];
    }
  }
}

- (void)setTrailingTuples:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_trailingTuples = &self->_trailingTuples;
  if (objc_opt_respondsToSelector())
  {
    [(NSArray *)*p_trailingTuples setObserver:0];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v24 = v5;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      v7 = *p_trailingTuples;
      uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v30;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v30 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
            if (objc_opt_respondsToSelector()) {
              [v12 setObserver:0];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v9);
      }

      id v5 = v24;
    }
  }
  objc_storeStrong((id *)&self->_trailingTuples, a3);
  if (objc_opt_respondsToSelector())
  {
    [(NSArray *)*p_trailingTuples setObserver:self];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      v13 = *p_trailingTuples;
      uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v26;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v26 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v25 + 1) + 8 * v17);
            if (objc_opt_respondsToSelector()) {
              [v18 setObserver:self];
            }
            ++v17;
          }
          while (v15 != v17);
          uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
        }
        while (v15);
      }
    }
  }
  uint64_t v19 = [(TLKView *)self observer];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(TLKView *)self observer];
    uint64_t v22 = [v21 batchUpdateCount];

    if (!v22)
    {
      v23 = [(TLKView *)self observer];
      [v23 propertiesDidChange];
    }
  }
}

- (void)setImage:(id)a3
{
  uint64_t v10 = (TLKImage *)a3;
  if (self->_image != v10)
  {
    objc_storeStrong((id *)&self->_image, a3);
    uint64_t v5 = [(TLKView *)self observer];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [(TLKView *)self observer];
      uint64_t v8 = [v7 batchUpdateCount];

      if (!v8)
      {
        uint64_t v9 = [(TLKView *)self observer];
        [v9 propertiesDidChange];
      }
    }
  }
}

- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5
{
  double width = a4.width;
  if (self->_lastMeasuredWidth < a4.width) {
    [(TLKKeyValueView *)self observedPropertiesChanged];
  }
  self->_lastMeasuredWidth = width;
}

- (void)_reconfigureForCompressedState
{
  v3 = [(TLKKeyValueView *)self trailingGrid];
  [v3 setHidden:1];

  id v12 = (id)objc_opt_new();
  for (unint64_t i = 0; ; ++i)
  {
    uint64_t v5 = [(TLKKeyValueView *)self leadingTuples];
    uint64_t v6 = [v5 count];
    v7 = [(TLKKeyValueView *)self trailingTuples];
    unint64_t v8 = [v7 count] + v6;

    if (i >= v8) {
      break;
    }
    if (i) {
      [(TLKKeyValueView *)self trailingTuples];
    }
    else {
    uint64_t v9 = [(TLKKeyValueView *)self leadingTuples];
    }
    uint64_t v10 = [v9 objectAtIndex:i >> 1];
    [v12 addObject:v10];
  }
  uint64_t v11 = [(TLKKeyValueView *)self leadingGrid];
  [v11 updateWithTuples:v12 valueColumnIsTrailing:0 truncateKey:1];
}

- (BOOL)containerView:(id)a3 shouldRestartMeasurementDueToCompressionInAxis:(int64_t)a4 forReason:(int64_t)a5
{
  if (a5 | a4) {
    return 0;
  }
  v7 = [(TLKKeyValueView *)self trailingTuples];

  if (!v7) {
    return 0;
  }
  [(TLKKeyValueView *)self _reconfigureForCompressedState];
  return 1;
}

- (void)observedPropertiesChanged
{
  v3 = [(TLKKeyValueView *)self image];
  v4 = [(TLKKeyValueView *)self imageView];
  [v4 setTlkImage:v3];

  uint64_t v5 = [(TLKKeyValueView *)self image];
  uint64_t v6 = [(TLKKeyValueView *)self imageView];
  [v6 setHidden:v5 == 0];

  v7 = [(TLKKeyValueView *)self leadingTuples];
  unint64_t v8 = [(TLKKeyValueView *)self leadingGrid];
  [v8 setHidden:v7 == 0];

  uint64_t v9 = [(TLKKeyValueView *)self trailingTuples];
  uint64_t v10 = [(TLKKeyValueView *)self trailingGrid];
  [v10 setHidden:v9 == 0];

  uint64_t v11 = [(TLKKeyValueView *)self trailingTuples];
  BOOL v12 = v11 != 0;

  v13 = [(TLKKeyValueView *)self leadingGrid];
  uint64_t v14 = [(TLKKeyValueView *)self leadingTuples];
  [v13 updateWithTuples:v14 valueColumnIsTrailing:v12 truncateKey:v12];

  uint64_t v15 = [(TLKKeyValueView *)self trailingGrid];
  uint64_t v16 = [(TLKKeyValueView *)self trailingTuples];
  [v15 updateWithTuples:v16 valueColumnIsTrailing:v12 truncateKey:v12];

  uint64_t v17 = [(TLKKeyValueView *)self image];
  if (v17)
  {
    BOOL v18 = 0;
  }
  else
  {
    uint64_t v19 = [(TLKKeyValueView *)self leadingTuples];
    if (v19)
    {
      v20 = [(TLKKeyValueView *)self trailingTuples];
      BOOL v18 = v20 != 0;
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  v21 = [(TLKView *)self contentView];
  [v21 setDistribution:v18];

  uint64_t v22 = [(TLKView *)self contentView];
  v23 = v22;
  if (v18) {
    uint64_t v24 = 1;
  }
  else {
    uint64_t v24 = 3;
  }
  if (v18) {
    double v25 = 24.0;
  }
  else {
    double v25 = 10.0;
  }
  [v22 setAlignment:v24];

  id v26 = [(TLKView *)self contentView];
  [v26 setSpacing:v25];
}

- (CGRect)containerView:(id)a3 layoutFrameForArrangedSubview:(id)a4 withProposedFrame:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  double x = a5.origin.x;
  id v10 = a4;
  uint64_t v11 = [(TLKKeyValueView *)self imageView];
  if ((id)v11 == v10)
  {
    id v26 = v10;
LABEL_12:

    goto LABEL_13;
  }
  BOOL v12 = (void *)v11;
  v13 = [(TLKKeyValueView *)self trailingGrid];
  char v14 = [v13 isHidden];

  if ((v14 & 1) == 0)
  {
    v32.origin.double x = x;
    v32.origin.CGFloat y = y;
    v32.size.CGFloat width = width;
    v32.size.CGFloat height = height;
    double v15 = CGRectGetWidth(v32);
    uint64_t v16 = [(TLKKeyValueView *)self leadingGrid];
    double v17 = *MEMORY[0x1E4F1DB30];
    double v18 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    objc_msgSend(v16, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4F1DB30], v18);
    double v20 = v19;

    v21 = [(TLKKeyValueView *)self trailingGrid];
    objc_msgSend(v21, "systemLayoutSizeFittingSize:", v17, v18);
    double v23 = v22;

    if (v20 >= v23) {
      double v24 = v20;
    }
    else {
      double v24 = v23;
    }
    if (v15 >= v24) {
      double v15 = v24;
    }
    v33.origin.double x = x;
    v33.origin.CGFloat y = y;
    v33.size.CGFloat width = width;
    v33.size.CGFloat height = height;
    double v25 = CGRectGetWidth(v33) - v15;
    id v26 = [(TLKKeyValueView *)self trailingGrid];
    double v27 = 0.0;
    if (v26 == v10) {
      double v27 = v25;
    }
    double x = x + v27;
    CGFloat width = v15;
    goto LABEL_12;
  }
LABEL_13:

  double v28 = x;
  double v29 = y;
  double v30 = width;
  double v31 = height;
  result.size.CGFloat height = v31;
  result.size.CGFloat width = v30;
  result.origin.CGFloat y = v29;
  result.origin.double x = v28;
  return result;
}

- (int64_t)currentStackViewDistribution
{
  v2 = [(TLKView *)self contentView];
  int64_t v3 = [v2 distribution];

  return v3;
}

- (BOOL)leadingGridIsHidden
{
  v2 = [(TLKKeyValueView *)self leadingGrid];
  char v3 = [v2 isHidden];

  return v3;
}

- (BOOL)trailingGridIsHidden
{
  v2 = [(TLKKeyValueView *)self trailingGrid];
  char v3 = [v2 isHidden];

  return v3;
}

- (unint64_t)numberOfVisibleRowsForLeadingGrid
{
  char v3 = objc_opt_class();
  v4 = [(TLKKeyValueView *)self leadingGrid];
  unint64_t v5 = [v3 visibleRowsInGrid:v4];

  return v5;
}

- (unint64_t)numberOfVisibleRowsForTrailingGrid
{
  char v3 = objc_opt_class();
  v4 = [(TLKKeyValueView *)self trailingGrid];
  unint64_t v5 = [v3 visibleRowsInGrid:v4];

  return v5;
}

- (id)leadingTextKeyLabels
{
  char v3 = objc_opt_new();
  v4 = objc_opt_class();
  unint64_t v5 = [(TLKKeyValueView *)self leadingGrid];
  uint64_t v6 = [v4 visibleRowsInGrid:v5];

  if (v6)
  {
    unint64_t v7 = 0;
    do
    {
      unint64_t v8 = [(TLKKeyValueView *)self leadingGrid];
      uint64_t v9 = [v8 keyLabels];
      id v10 = [v9 objectAtIndexedSubscript:v7];
      uint64_t v11 = [v10 text];

      if (v11)
      {
        BOOL v12 = [(TLKKeyValueView *)self leadingGrid];
        v13 = [v12 keyLabels];
        char v14 = [v13 objectAtIndexedSubscript:v7];
        double v15 = [v14 text];
        [v3 addObject:v15];
      }
      else
      {
        [v3 addObject:&stru_1F0959D88];
      }
      ++v7;
      uint64_t v16 = objc_opt_class();
      double v17 = [(TLKKeyValueView *)self leadingGrid];
      unint64_t v18 = [v16 visibleRowsInGrid:v17];
    }
    while (v7 < v18);
  }
  return v3;
}

+ (unint64_t)visibleRowsInGrid:(id)a3
{
  id v3 = a3;
  if ([v3 numberOfRows])
  {
    unint64_t v4 = 0;
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = [v3 rowAtIndex:v4];
      int v7 = [v6 isHidden];

      v5 += v7 ^ 1u;
      ++v4;
    }
    while (v4 < [v3 numberOfRows]);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (NSArray)leadingTuples
{
  return self->_leadingTuples;
}

- (NSArray)trailingTuples
{
  return self->_trailingTuples;
}

- (TLKImage)image
{
  return self->_image;
}

- (TLKKeyValueGridView)leadingGrid
{
  return self->_leadingGrid;
}

- (void)setLeadingGrid:(id)a3
{
}

- (TLKKeyValueGridView)trailingGrid
{
  return self->_trailingGrid;
}

- (void)setTrailingGrid:(id)a3
{
}

- (TLKImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (double)lastMeasuredWidth
{
  return self->_lastMeasuredWidth;
}

- (void)setLastMeasuredWidth:(double)a3
{
  self->_lastMeasuredWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_trailingGrid, 0);
  objc_storeStrong((id *)&self->_leadingGrid, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_trailingTuples, 0);
  objc_storeStrong((id *)&self->_leadingTuples, 0);
}

@end