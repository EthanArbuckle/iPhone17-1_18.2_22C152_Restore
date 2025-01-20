@interface TUIAssistantButtonSizeProvider
- (CGSize)_preferredTitleSizeForBarButtonItem:(id)a3;
- (CGSize)preferredSizeForButtonBarItem:(id)a3;
- (double)barButtonWidth;
- (void)setBarButtonWidth:(double)a3;
@end

@implementation TUIAssistantButtonSizeProvider

- (void)setBarButtonWidth:(double)a3
{
  self->_barButtonWidth = a3;
}

- (double)barButtonWidth
{
  return self->_barButtonWidth;
}

- (CGSize)preferredSizeForButtonBarItem:(id)a3
{
  id v4 = a3;
  [v4 width];
  v6 = (double *)MEMORY[0x1E4FB30D8];
  if (v5 != 0.0) {
    goto LABEL_12;
  }
  v7 = [v4 title];
  if ([v7 length])
  {
    v8 = [v4 image];

    if (!v8)
    {
      [(TUIAssistantButtonSizeProvider *)self _preferredTitleSizeForBarButtonItem:v4];
LABEL_12:
      double v17 = v5;
      goto LABEL_13;
    }
  }
  else
  {
  }
  v9 = [v4 customView];

  if (!v9)
  {
    if ([v4 systemItem] != 5)
    {
      [(TUIAssistantButtonSizeProvider *)self barButtonWidth];
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  v10 = [v4 customView];
  objc_msgSend(v10, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v12 = v11;
  double v14 = v13;

  if (v12 <= 0.0)
  {
LABEL_10:
    double v17 = *v6;
    goto LABEL_13;
  }
  v15 = [v4 customView];
  objc_msgSend(v15, "systemLayoutSizeFittingSize:", v12, v14);
  double v17 = v16;

LABEL_13:
  double v18 = *v6;

  double v19 = v17;
  double v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (CGSize)_preferredTitleSizeForBarButtonItem:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  double v4 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  double v5 = [a3 view];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      v6 = objc_msgSend(v5, "subviews", 0);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v18;
LABEL_5:
        uint64_t v10 = 0;
        while (1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          double v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            break;
          }
          if (v8 == ++v10)
          {
            uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
            if (v8) {
              goto LABEL_5;
            }
            goto LABEL_14;
          }
        }
        id v12 = v11;

        if (!v12) {
          goto LABEL_15;
        }
        objc_msgSend(v12, "sizeThatFits:", v4, v3);
        double v4 = v13;
        double v3 = v14;
        v6 = v12;
      }
LABEL_14:
    }
  }
LABEL_15:

  double v15 = v4;
  double v16 = v3;
  result.height = v16;
  result.width = v15;
  return result;
}

@end