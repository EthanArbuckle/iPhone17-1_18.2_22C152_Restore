@interface UISelectionTapRecognizer
- (BOOL)isCloseToSelection;
- (UITextInput)textView;
- (void)setState:(int64_t)a3;
- (void)setTextView:(id)a3;
@end

@implementation UISelectionTapRecognizer

- (BOOL)isCloseToSelection
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  v3 = [(UISelectionTapRecognizer *)self textView];
  v4 = [v3 interactionAssistant];
  v5 = [v4 activeSelection];

  v6 = [v5 selectedRange];

  if (v6)
  {
    v7 = [v5 selectedRange];
    int v8 = [v7 isEmpty];

    if (v8)
    {
      [v5 caretRect];
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      v17 = [(UISelectionTapRecognizer *)self textView];
      v18 = [v17 _proxyTextInput];
      v19 = [v18 textInputView];
      v20 = [(UIGestureRecognizer *)self view];
      objc_msgSend(v19, "convertRect:toView:", v20, v10, v12, v14, v16);
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;

      [(UITapGestureRecognizer *)self centroid];
      BOOL v31 = sqrt((v22 + v26 * 0.5 - v29) * (v22 + v26 * 0.5 - v29) + (v24 + v28 * 0.5 - v30) * (v24 + v28 * 0.5 - v30)) < 50.0;
    }
    else
    {
      v32 = [v5 selectionRects];
      if ([v32 count])
      {
        double v33 = *MEMORY[0x1E4F1DB28];
        double v34 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        double v35 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
        double v36 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        id v37 = v32;
        uint64_t v38 = [v37 countByEnumeratingWithState:&v67 objects:v71 count:16];
        if (v38)
        {
          uint64_t v39 = v38;
          int v40 = 0;
          uint64_t v41 = *(void *)v68;
          do
          {
            for (uint64_t i = 0; i != v39; ++i)
            {
              if (*(void *)v68 != v41) {
                objc_enumerationMutation(v37);
              }
              objc_msgSend(*(id *)(*((void *)&v67 + 1) + 8 * i), "rect", (void)v67);
              double v47 = v43;
              double v48 = v44;
              double v49 = v45;
              double v50 = v46;
              if (-v40 != i)
              {
                v73.origin.x = v33;
                v73.origin.y = v34;
                v73.size.width = v35;
                v73.size.height = v36;
                *(CGRect *)&double v43 = CGRectUnion(v73, *(CGRect *)&v47);
              }
              double v33 = v43;
              double v34 = v44;
              double v35 = v45;
              double v36 = v46;
            }
            v40 += v39;
            uint64_t v39 = [v37 countByEnumeratingWithState:&v67 objects:v71 count:16];
          }
          while (v39);
        }

        v51 = [(UISelectionTapRecognizer *)self textView];
        v52 = [v51 _proxyTextInput];
        v53 = [v52 textInputView];
        v54 = [(UIGestureRecognizer *)self view];
        objc_msgSend(v53, "convertRect:toView:", v54, v33, v34, v35, v36);
        CGFloat v56 = v55;
        CGFloat v58 = v57;
        CGFloat v60 = v59;
        CGFloat v62 = v61;

        [(UITapGestureRecognizer *)self centroid];
        UIDistanceBetweenPointAndRect(v63, v64, v56, v58, v60, v62);
        BOOL v31 = v65 < 20.0;
      }
      else
      {
        BOOL v31 = 0;
      }
    }
  }
  else
  {
    BOOL v31 = 0;
  }

  return v31;
}

- (void)setState:(int64_t)a3
{
  int64_t v3 = a3;
  if (self) {
    BOOL v5 = (unint64_t)(self->super.super.super._state - 1) < 3;
  }
  else {
    BOOL v5 = 0;
  }
  if ((unint64_t)(a3 - 4) >= 0xFFFFFFFFFFFFFFFDLL
    && !v5
    && ![(UISelectionTapRecognizer *)self isCloseToSelection])
  {
    int64_t v3 = 5;
  }
  v6.receiver = self;
  v6.super_class = (Class)UISelectionTapRecognizer;
  [(UIGestureRecognizer *)&v6 setState:v3];
}

- (UITextInput)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  self->_textView = (UITextInput *)a3;
}

@end