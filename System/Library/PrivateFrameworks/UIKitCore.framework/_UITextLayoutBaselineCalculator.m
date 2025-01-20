@interface _UITextLayoutBaselineCalculator
- (_UITextLayoutBaselineCalculator)initWithTextLayoutController:(id)a3 typingAttributes:(id)a4 usesLineFragmentOrigin:(BOOL)a5 coordinateSpace:(id)a6 scale:(double)a7 fallbackTextContainerOrigin:(CGPoint)a8;
- (double)_baselineOffsetAtPosition:(id)a3;
- (double)_convertOffset:(double)a3;
- (double)firstBaselineOffsetFromTop;
- (double)lastBaselineOffsetFromBottom;
@end

@implementation _UITextLayoutBaselineCalculator

- (_UITextLayoutBaselineCalculator)initWithTextLayoutController:(id)a3 typingAttributes:(id)a4 usesLineFragmentOrigin:(BOOL)a5 coordinateSpace:(id)a6 scale:(double)a7 fallbackTextContainerOrigin:(CGPoint)a8
{
  CGFloat y = a8.y;
  CGFloat x = a8.x;
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  v22.receiver = self;
  v22.super_class = (Class)_UITextLayoutBaselineCalculator;
  v19 = [(_UITextLayoutBaselineCalculator *)&v22 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_textLayoutController, a3);
    objc_storeStrong((id *)&v20->_typingAttributes, a4);
    objc_storeStrong((id *)&v20->_coordinateSpace, a6);
    v20->_scale = a7;
    v20->_usesLineFragmentOrigin = a5;
    v20->_fallbackTextContainerOrigin.CGFloat x = x;
    v20->_fallbackTextContainerOrigin.CGFloat y = y;
  }

  return v20;
}

- (double)_baselineOffsetAtPosition:(id)a3
{
  id v4 = a3;
  uint64_t v42 = 0;
  v43 = (CGRect *)&v42;
  uint64_t v44 = 0x4010000000;
  v45 = &unk_186D7DBA7;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v46 = *MEMORY[0x1E4F1DB28];
  long long v47 = v5;
  uint64_t v38 = 0;
  v39 = (double *)&v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__88;
  v36 = __Block_byref_object_dispose__88;
  id v37 = 0;
  textLayoutController = self->_textLayoutController;
  typingAttributes = self->_typingAttributes;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __61___UITextLayoutBaselineCalculator__baselineOffsetAtPosition___block_invoke;
  v31[3] = &unk_1E52EE1E8;
  v31[4] = &v32;
  v31[5] = &v42;
  v31[6] = &v38;
  [(_UITextLayoutController *)textLayoutController requestTextGeometryAtPosition:v4 typingAttributes:typingAttributes resultBlock:v31];
  if (CGRectIsNull(v43[1]))
  {
    v8 = self->_coordinateSpace;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v9 = _UIBaselineLayoutBoundsConsultingContentSizeConstraints(v8);
    }
    else {
      [(UICoordinateSpace *)v8 bounds];
    }
    double v13 = v9;
    uint64_t v14 = v10;
    uint64_t v15 = v11;
    uint64_t v16 = v12;

    p_CGFloat x = (void *)&v43->origin.x;
    v43[1].origin.CGFloat x = v13;
    p_x[5] = v14;
    p_x[6] = v15;
    p_x[7] = v16;
  }
  if (v39[3] == 0.0)
  {
    id v18 = [(_UITextLayoutController *)self->_textLayoutController textStorage];
    char v19 = objc_opt_respondsToSelector();
    coordinateSpace = v18;
    if ((v19 & 1) == 0)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_11;
      }
      coordinateSpace = self->_coordinateSpace;
    }
    v21 = [(UICoordinateSpace *)coordinateSpace font];
    if (v21)
    {
LABEL_12:
      double MinY = CGRectGetMinY(v43[1]);
      [v21 ascender];
      v39[3] = MinY + v23;

      goto LABEL_13;
    }
LABEL_11:
    [off_1E52D39B8 defaultFontSize];
    v21 = objc_msgSend(off_1E52D39B8, "systemFontOfSize:");
    goto LABEL_12;
  }
LABEL_13:
  [(id)v33[5] size];
  double y = 0.0;
  if (v25 > 0.0)
  {
    v26 = [(id)v33[5] textView];
    if (v26)
    {
      [(id)v33[5] textContainerOrigin];
      double y = v27;
    }
    else
    {
      double y = self->_fallbackTextContainerOrigin.y;
    }
  }
  [(_UITextLayoutBaselineCalculator *)self _convertOffset:y + CGRectGetMinY(v43[1]) + v39[3]];
  double v29 = v28;
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);

  return v29;
}

- (double)firstBaselineOffsetFromTop
{
  v3 = [(_UITextLayoutController *)self->_textLayoutController beginningOfDocument];
  [(_UITextLayoutBaselineCalculator *)self _baselineOffsetAtPosition:v3];
  double v5 = v4;

  v6 = self->_coordinateSpace;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v7 = _UIBaselineLayoutBoundsConsultingContentSizeConstraints(v6);
  }
  else {
    [(UICoordinateSpace *)v6 bounds];
  }
  CGFloat v11 = v7;
  CGFloat v12 = v8;
  CGFloat v13 = v9;
  CGFloat v14 = v10;

  v16.origin.CGFloat x = v11;
  v16.origin.double y = v12;
  v16.size.width = v13;
  v16.size.height = v14;
  return v5 + CGRectGetMinY(v16);
}

- (double)lastBaselineOffsetFromBottom
{
  v3 = [(_UITextLayoutController *)self->_textLayoutController endOfDocument];
  [(_UITextLayoutBaselineCalculator *)self _baselineOffsetAtPosition:v3];
  double v5 = v4;

  v6 = self->_coordinateSpace;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v7 = _UIBaselineLayoutBoundsConsultingContentSizeConstraints(v6);
  }
  else {
    [(UICoordinateSpace *)v6 bounds];
  }
  CGFloat v11 = v7;
  CGFloat v12 = v8;
  CGFloat v13 = v9;
  CGFloat v14 = v10;

  v18.origin.CGFloat x = v11;
  v18.origin.double y = v12;
  v18.size.width = v13;
  v18.size.height = v14;
  double MaxY = CGRectGetMaxY(v18);
  [(UICoordinateSpace *)self->_coordinateSpace bounds];
  double v16 = CGRectGetHeight(v19) - MaxY;
  if (v16 < 0.0) {
    double v16 = 0.0;
  }
  if (self->_usesLineFragmentOrigin) {
    double v16 = -0.0;
  }
  return MaxY - v5 + v16;
}

- (double)_convertOffset:(double)a3
{
  if (self->_coordinateSpace)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (-[UICoordinateSpace _baselineCalculatorSourceCoordinateSpace](self->_coordinateSpace, "_baselineCalculatorSourceCoordinateSpace"), (double v5 = (UICoordinateSpace *)objc_claimAutoreleasedReturnValue()) != 0)|| (-[_UITextLayoutController firstTextContainer](self->_textLayoutController, "firstTextContainer"), v6 = objc_claimAutoreleasedReturnValue(), [v6 textView], double v5 = (UICoordinateSpace *)objc_claimAutoreleasedReturnValue(), v6, v5))
    {
      if (v5 != self->_coordinateSpace)
      {
        [(UICoordinateSpace *)v5 convertPoint:0.0 toCoordinateSpace:a3];
        a3 = v7;
      }
    }
  }
  double scale = self->_scale;
  UIRoundToScale(a3, scale);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinateSpace, 0);
  objc_storeStrong((id *)&self->_typingAttributes, 0);
  objc_storeStrong((id *)&self->_textLayoutController, 0);
}

@end