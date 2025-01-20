@interface _UITextContainerView
- (BOOL)_ensureLayoutForCappedSize;
- (BOOL)_freezeTextContainerSize;
- (BOOL)_shouldCapSizeToFitLayoutRange:(_NSRange *)a3;
- (BOOL)drawTextInRectIfNeeded:(CGRect)a3;
- (BOOL)isEditable;
- (BOOL)isEditing;
- (BOOL)isHorizontallyResizable;
- (BOOL)isVerticallyResizable;
- (BOOL)reconfigureWithLayoutManager:(id)a3 triggeredBySelector:(SEL)a4;
- (BOOL)usesStandardTextScaling;
- (CGPoint)drawingScale;
- (CGPoint)textContainerOrigin;
- (CGRect)_clipRectForFadedEdges;
- (CGRect)visibleRect;
- (CGSize)maxSize;
- (CGSize)minSize;
- (NSCustomTextRendering)customRenderController;
- (NSDictionary)markedTextStyle;
- (NSDictionary)textHighlightAttributes;
- (NSLayoutManager)layoutManager;
- (NSString)description;
- (NSTextContainer)textContainer;
- (UIColor)textColor;
- (UIEdgeInsets)textContainerInset;
- (UIScrollView)enclosingScrollView;
- (UIView)selectionContainerView;
- (_NSRange)markedRange;
- (_UIAnimatedTextLayoutInfo)uniqueWritingToolsAnimatedLayoutInfo;
- (_UITextCanvas)canvasView;
- (_UITextContainerView)initWithFrame:(CGRect)a3;
- (_UITextContainerView)initWithFrame:(CGRect)a3 textLayoutController:(id)a4 textContainer:(id)a5 delegate:(id)a6;
- (_UITextContainerViewDelegate)delegate;
- (_UITextEmphasisBackgroundView)textEmphasisBackgroundView;
- (_UITextLayoutController)textLayoutController;
- (id)attributedSubstringForMarkedRange;
- (id)layoutManager:(id)a3 effectiveCUICatalogForTextEffect:(id)a4;
- (id)linkAttributesForLink:(id)a3 forCharacterAtIndex:(unint64_t)a4;
- (id)linkTextAttributes;
- (id)textHighlightRenderingAttributesForAttributes:(id)a3;
- (int64_t)layoutOrientation;
- (void)_ensureLayoutCompleteForRect:(CGRect)a3;
- (void)_ensureLayoutCompleteToEndOfCharacterRange:(_NSRange)a3;
- (void)_ensureMinAndMaxSizesConsistentWithBounds;
- (void)_setFrameOrBounds:(CGRect)a3 oldRect:(CGRect)a4 isFrameRect:(BOOL)a5 settingAction:(id)a6;
- (void)_setFreezeTextContainerSize:(BOOL)a3;
- (void)_setNeedsContentsFormatUpdate;
- (void)_sizeToConstrainedContainerUsedRect;
- (void)invalidateTextContainerOrigin;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setConstrainedFrameSize:(CGSize)a3;
- (void)setDelegate:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHorizontallyResizable:(BOOL)a3;
- (void)setLayoutOrientation:(int64_t)a3;
- (void)setMaxSize:(CGSize)a3;
- (void)setMinSize:(CGSize)a3;
- (void)setNeedsDisplay;
- (void)setNeedsDisplayInRect:(CGRect)a3;
- (void)setNeedsDisplayInRect:(CGRect)a3 avoidAdditionalLayout:(BOOL)a4;
- (void)setSelectionContainerView:(id)a3;
- (void)setTextContainer:(id)a3;
- (void)setTextContainerInset:(UIEdgeInsets)a3;
- (void)setTextEmphasisBackgroundView:(id)a3 withTextView:(id)a4;
- (void)setTextHighlightAttributes:(id)a3;
- (void)setUniqueWritingToolsAnimatedLayoutInfo:(id)a3;
- (void)setUsesStandardTextScaling:(BOOL)a3;
- (void)setVerticallyResizable:(BOOL)a3;
- (void)sizeToFit;
- (void)textContainerUsageDidChangeToSize:(CGSize)a3;
- (void)tintColorDidChange;
- (void)updateInsertionPointStateAndRestartTimer:(BOOL)a3;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation _UITextContainerView

- (void)_setNeedsContentsFormatUpdate
{
}

- (_UITextCanvas)canvasView
{
  return self->_canvasView;
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  -[UIView convertRect:toView:](self, "convertRect:toView:", self->_canvasView, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  canvasView = self->_canvasView;
  -[_UITextCanvas setNeedsDisplayInRect:](canvasView, "setNeedsDisplayInRect:");
}

- (_UITextLayoutController)textLayoutController
{
  return self->_textLayoutController;
}

- (void)textContainerUsageDidChangeToSize:(CGSize)a3
{
}

- (NSTextContainer)textContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textContainer);
  return (NSTextContainer *)WeakRetained;
}

- (NSCustomTextRendering)customRenderController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = [WeakRetained customRenderController];

  return (NSCustomTextRendering *)v3;
}

- (CGPoint)textContainerOrigin
{
  if (*(unsigned char *)&self->_tcvFlags)
  {
    v3 = [(_UITextContainerView *)self textContainer];
    if (v3)
    {
      [(_UITextLayoutController *)self->_textLayoutController usedRectForTextContainer:v3];
      double v5 = v4;
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      [(UIView *)self bounds];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      [v3 size];
      double top = self->_textContainerInset.top;
      double left = self->_textContainerInset.left;
      double v24 = v9 + left + self->_textContainerInset.right;
      double v25 = v11 + top + self->_textContainerInset.bottom;
      if (v24 >= v17)
      {
        double v31 = v13 + left - v5;
      }
      else
      {
        double v26 = v17 - v24;
        double v27 = v20 - (v5 + v9);
        if (v26 + 0.001 >= v5 + v27)
        {
          double v31 = v13 + left;
        }
        else
        {
          double v28 = v26 * 0.5;
          if (v26 * 0.5 > v5 || v28 > v27)
          {
            double v31 = v13 + left;
            if (v28 > v27) {
              double v31 = v31 - v5 + v26 - v27;
            }
          }
          else
          {
            double v31 = v13 + left - v5 + v28;
          }
        }
      }
      if (v25 >= v19)
      {
        double v30 = v15 + top - v7;
      }
      else
      {
        double v32 = v19 - v25;
        double v33 = v21 - (v7 + v11);
        if (v32 >= v7 + v33)
        {
          double v30 = v15 + top;
        }
        else
        {
          double v34 = v32 * 0.5;
          if (v32 * 0.5 > v7 || v34 > v33)
          {
            double v30 = v15 + top;
            if (v34 > v33) {
              double v30 = v30 - v7 + v32 - v33;
            }
          }
          else
          {
            double v30 = v15 + top - v7 + v34;
          }
        }
      }
    }
    else
    {
      double v30 = self->_textContainerInset.top;
      double v31 = self->_textContainerInset.left;
    }
    if (self->_textContainerOrigin.x != v31 || self->_textContainerOrigin.y != v30)
    {
      self->_textContainerOrigin.double x = v31;
      self->_textContainerOrigin.double y = v30;
      [(_UITextContainerView *)self setNeedsDisplay];
    }
    *(unsigned char *)&self->_tcvFlags &= ~1u;
  }
  double x = self->_textContainerOrigin.x;
  double y = self->_textContainerOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGRect)_clipRectForFadedEdges
{
  double v2 = *MEMORY[0x1E4F1DB20];
  double v3 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (UIScrollView)enclosingScrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  return (UIScrollView *)WeakRetained;
}

- (_NSRange)markedRange
{
  double v2 = -[_UITextLayoutControllerBase textInputController]((UITextInputController *)self->_textLayoutController);
  uint64_t v3 = [v2 markedRange];
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canvasView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_textLayoutController, 0);
  objc_storeStrong((id *)&self->_textHighlightAttributes, 0);
  objc_destroyWeak((id *)&self->_textView);
  objc_storeStrong((id *)&self->_linkTextAttributes, 0);
  objc_destroyWeak((id *)&self->_textContainer);
}

- (int64_t)layoutOrientation
{
  return ((unint64_t)*(unsigned char *)&self->_tcvFlags >> 1) & 3;
}

- (BOOL)_freezeTextContainerSize
{
  return (*(unsigned char *)&self->_tcvFlags >> 5) & 1;
}

- (CGSize)minSize
{
  double width = self->_minSize.width;
  double height = self->_minSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)maxSize
{
  double width = self->_maxSize.width;
  double height = self->_maxSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setBackgroundColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UITextContainerView;
  id v4 = a3;
  [(UIView *)&v5 setBackgroundColor:v4];
  -[_UITextCanvas setBackgroundColor:](self->_canvasView, "setBackgroundColor:", v4, v5.receiver, v5.super_class);
}

- (void)setMaxSize:(CGSize)a3
{
  self->_maxSize = a3;
}

- (void)setVerticallyResizable:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_tcvFlags = *(unsigned char *)&self->_tcvFlags & 0xEF | v3;
}

- (void)setHorizontallyResizable:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_tcvFlags = *(unsigned char *)&self->_tcvFlags & 0xF7 | v3;
}

- (void)setTextEmphasisBackgroundView:(id)a3 withTextView:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (dyld_program_sdk_at_least())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textContainer);
    double v10 = [WeakRetained textLayoutManager];
    BOOL v11 = v10 != 0;

    if (!v7) {
      goto LABEL_7;
    }
  }
  else
  {
    BOOL v11 = 0;
    if (!v7) {
      goto LABEL_7;
    }
  }
  if (!v11)
  {
    double v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"_UITextContainerView.m" lineNumber:234 description:@"Not supported before iOS18 or for TextKit1. This is a UIKit bug."];
  }
LABEL_7:
  id v12 = v7;
  char v13 = _UITextViewAllowSelectionContainerInTextLayoutCanvas();
  double v14 = v12;
  if (v7)
  {
    double v14 = v12;
    if ((v13 & 1) == 0)
    {
      double v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextSelection", &setTextEmphasisBackgroundView_withTextView____s_category)+ 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)double v17 = 0;
        _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "Requested plumbing non-nil textEmphasisBackgroundView through _UITextContainerView with TextViewAllowSelectionContainerInTextLayoutCanvas preference off. Ignoring.", v17, 2u);
      }

      double v14 = 0;
    }
  }
  if (v11) {
    [(_UITextCanvas *)self->_canvasView setTextEmphasisBackgroundView:v14 withTextView:v8];
  }
}

- (_UITextContainerView)initWithFrame:(CGRect)a3 textLayoutController:(id)a4 textContainer:(id)a5 delegate:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v25.receiver = self;
  v25.super_class = (Class)_UITextContainerView;
  double v17 = -[UIView initWithFrame:](&v25, sel_initWithFrame_, x, y, width, height);
  double v18 = v17;
  if (v17)
  {
    p_textLayoutController = (uint64_t *)&v17->_textLayoutController;
    objc_storeStrong((id *)&v17->_textLayoutController, a4);
    double v20 = objc_opt_class();
    -[_UIHomeAffordanceObservationRecord setLegacyViewServiceSessionIdentifier:](*p_textLayoutController, v20);
    uint64_t v21 = [(id)*p_textLayoutController dequeueCanvasViewForTextContainer:v15];
    canvasView = v18->_canvasView;
    v18->_canvasView = (_UITextCanvas *)v21;

    [(_UITextCanvas *)v18->_canvasView setContext:v18];
    [(UIView *)v18 addSubview:v18->_canvasView];
    objc_storeWeak((id *)&v18->_delegate, v16);
    id v23 = objc_storeWeak((id *)&v18->_textContainer, v15);
    [v15 setTextView:v18];

    *(unsigned char *)&v18->_tcvFlags |= 1u;
    _UITextContainerViewResyncNSTextContainer(v18, x, y, width, height);
    [(UIView *)v18 setContentMode:9];
  }

  return v18;
}

- (UIView)selectionContainerView
{
  if (_UITextViewAllowSelectionContainerInTextLayoutCanvas()
    && (id WeakRetained = objc_loadWeakRetained((id *)&self->_textContainer),
        [WeakRetained textLayoutManager],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        WeakRetained,
        v4))
  {
    objc_super v5 = [(_UITextCanvas *)self->_canvasView selectionContainerView];
  }
  else
  {
    objc_super v5 = 0;
  }
  return (UIView *)v5;
}

- (void)setSelectionContainerView:(id)a3
{
  id v5 = a3;
  if (dyld_program_sdk_at_least())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textContainer);
    id v7 = [WeakRetained textLayoutManager];
    BOOL v8 = v7 != 0;

    if (!v5) {
      goto LABEL_7;
    }
  }
  else
  {
    BOOL v8 = 0;
    if (!v5) {
      goto LABEL_7;
    }
  }
  if (!v8)
  {
    char v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"_UITextContainerView.m" lineNumber:214 description:@"Not supported before iOS18 or for TextKit1. This is a UIKit bug."];
  }
LABEL_7:
  id v9 = v5;
  char v10 = _UITextViewAllowSelectionContainerInTextLayoutCanvas();
  BOOL v11 = v9;
  if (v5)
  {
    BOOL v11 = v9;
    if ((v10 & 1) == 0)
    {
      id v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextSelection", &setSelectionContainerView____s_category) + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "Requested plumbing non-nil selectionContainerView through _UITextContainerView with TextViewAllowSelectionContainerInTextLayoutCanvas preference off. Ignoring.", v14, 2u);
      }

      BOOL v11 = 0;
    }
  }
  if (v8) {
    [(_UITextCanvas *)self->_canvasView setSelectionContainerView:v11];
  }
}

- (void)setTextContainer:(id)a3
{
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_UITextContainerView;
  [(UIView *)&v3 tintColorDidChange];
  [(_UITextCanvas *)self->_canvasView setNeedsDisplay];
  [(_UITextContainerView *)self setNeedsDisplay];
}

- (void)sizeToFit
{
  objc_super v3 = [(_UITextContainerView *)self textContainer];
  if (v3)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    if ([(_UITextContainerView *)self _shouldCapSizeToFitLayoutRange:&v5])
    {
      id v4 = [(_UITextContainerView *)self layoutManager];
      objc_msgSend(v4, "ensureLayoutForGlyphRange:", v5, v6);
    }
    else if (![(_UITextContainerView *)self _ensureLayoutForCappedSize])
    {
      [(_UITextLayoutController *)self->_textLayoutController ensureLayoutForTextContainer:v3];
    }
    [(_UITextContainerView *)self _sizeToConstrainedContainerUsedRect];
  }
}

- (BOOL)_shouldCapSizeToFitLayoutRange:(_NSRange *)a3
{
  uint64_t v5 = [(_UITextContainerView *)self layoutManager];
  if (!v5) {
    goto LABEL_13;
  }
  p_textView = &self->_textView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);

  if (!WeakRetained) {
    goto LABEL_13;
  }
  BOOL v8 = [(_UITextContainerView *)self textContainer];
  unint64_t v9 = [v5 glyphRangeForTextContainer:v8];
  if (!v10)
  {

LABEL_13:
    BOOL v32 = 0;
    goto LABEL_18;
  }
  NSUInteger location = v9;
  unint64_t v12 = v9 + v10;
  if (v9 >= v9 + v10)
  {
    unint64_t length = 0;
  }
  else
  {
    unint64_t length = 0;
    double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    CGFloat x = *MEMORY[0x1E4F1DB20];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    unint64_t v18 = v9;
    do
    {
      v35.NSUInteger location = 0;
      v35.unint64_t length = 0;
      [v5 lineFragmentRectForGlyphAtIndex:v18 effectiveRange:&v35 withoutAdditionalLayout:1];
      v39.origin.CGFloat x = v19;
      v39.origin.CGFloat y = v20;
      v39.size.double width = v21;
      v39.size.double height = v22;
      v37.origin.CGFloat x = x;
      v37.origin.CGFloat y = y;
      v37.size.double width = width;
      v37.size.double height = height;
      CGRect v38 = CGRectUnion(v37, v39);
      CGFloat x = v38.origin.x;
      CGFloat y = v38.origin.y;
      double width = v38.size.width;
      double height = v38.size.height;
      v36.NSUInteger location = location;
      v36.unint64_t length = length;
      NSRange v23 = NSUnionRange(v36, v35);
      NSUInteger location = v23.location;
      unint64_t length = v23.length;
      NSUInteger v24 = v35.location;
      NSUInteger v25 = v35.length;
      if (![v8 layoutOrientation])
      {
        id v26 = objc_loadWeakRetained((id *)p_textView);
        [v26 bounds];
        double v28 = v27;

        if (height > v28) {
          break;
        }
      }
      if ([v8 layoutOrientation] == 1)
      {
        id v29 = objc_loadWeakRetained((id *)p_textView);
        [v29 bounds];
        double v31 = v30;

        if (width > v31) {
          break;
        }
      }
      unint64_t v18 = v24 + v25 + 1;
    }
    while (v18 < v12);
  }
  double v33 = (double)(location + length) * 1.5;
  BOOL v32 = v33 < (double)v12;
  if (v33 < (double)v12)
  {
    a3->NSUInteger location = location;
    a3->unint64_t length = (unint64_t)((double)length * 1.5);
  }

LABEL_18:
  return v32;
}

- (NSLayoutManager)layoutManager
{
  p_textContainer = &self->_textContainer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textContainer);
  id v4 = [WeakRetained textLayoutManager];

  if (v4)
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v6 = objc_loadWeakRetained((id *)p_textContainer);
    uint64_t v5 = [v6 layoutManager];
  }
  return (NSLayoutManager *)v5;
}

- (BOOL)_ensureLayoutForCappedSize
{
  p_textView = &self->_textView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  uint64_t v5 = [WeakRetained textContainer];

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_textView);
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;

    double v11 = *MEMORY[0x1E4F1DB28];
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    if ([v5 layoutOrientation]) {
      double v14 = v8;
    }
    else {
      double v14 = v10;
    }
    -[_UITextLayoutController ensureLayoutForBounds:inTextContainer:](self->_textLayoutController, "ensureLayoutForBounds:inTextContainer:", v5, v11, v12, v13, v14 * 1.5);
  }

  return v5 != 0;
}

- (void)_sizeToConstrainedContainerUsedRect
{
  objc_super v3 = [(_UITextContainerView *)self textContainer];
  if (v3)
  {
    double v9 = v3;
    [(_UITextLayoutController *)self->_textLayoutController usedRectForTextContainer:v3];
    double v5 = v4 + self->_textContainerInset.left + self->_textContainerInset.right;
    double v7 = v6 + self->_textContainerInset.top + self->_textContainerInset.bottom;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
    -[UIView convertSize:toView:](self, "convertSize:toView:", WeakRetained, v5, v7);
    -[_UITextContainerView setConstrainedFrameSize:](self, "setConstrainedFrameSize:");

    objc_super v3 = v9;
  }
}

- (void)setConstrainedFrameSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(UIView *)self frame];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  id v20 = [(UIView *)self superview];
  -[UIView convertRect:toView:](self, "convertRect:toView:", v20, 0.0, 0.0, self->_maxSize.width, self->_maxSize.height);
  double v11 = v10;
  double v13 = v12;
  -[UIView convertRect:toView:](self, "convertRect:toView:", v20, 0.0, 0.0, self->_minSize.width, self->_minSize.height);
  double v16 = v7;
  if ((*(unsigned char *)&self->_tcvFlags & 8) != 0)
  {
    double v17 = ceil(width);
    double v16 = v17 >= v14 ? v17 : v14;
    if (v16 > v11) {
      double v16 = v11;
    }
  }
  double v18 = v9;
  if ((*(unsigned char *)&self->_tcvFlags & 0x10) != 0)
  {
    double v19 = ceil(height);
    double v18 = v19 >= v15 ? v19 : v15;
    if (v18 > v13) {
      double v18 = v13;
    }
  }
  v22.double width = v7;
  v22.double height = v9;
  v23.double width = v16;
  v23.double height = v18;
  if (!NSEqualSizes(v22, v23))
  {
    [(UIView *)self frame];
    -[_UITextContainerView setFrame:](self, "setFrame:");
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self frame];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __33___UITextContainerView_setFrame___block_invoke;
  v12[3] = &unk_1E52DA520;
  *(double *)&v12[5] = x;
  *(double *)&v12[6] = y;
  *(double *)&v12[7] = width;
  *(double *)&v12[8] = height;
  v12[4] = self;
  -[_UITextContainerView _setFrameOrBounds:oldRect:isFrameRect:settingAction:](self, "_setFrameOrBounds:oldRect:isFrameRect:settingAction:", 1, v12, x, y, width, height, v8, v9, v10, v11);
}

- (void)_setFrameOrBounds:(CGRect)a3 oldRect:(CGRect)a4 isFrameRect:(BOOL)a5 settingAction:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v11 = a3.size.height;
  double v12 = a3.size.width;
  CGFloat v13 = a3.origin.y;
  CGFloat v14 = a3.origin.x;
  (*((void (**)(id, SEL))a6 + 2))(a6, a2);
  [(_UITextContainerView *)self _ensureMinAndMaxSizesConsistentWithBounds];
  if ((*(unsigned char *)&self->_tcvFlags & 0x20) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
    char v17 = [WeakRetained isZooming];

    if ((v17 & 1) == 0)
    {
      unint64_t v18 = self->_invalidationSeqNo + 1;
      self->_invalidationSeqNo = v18;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __76___UITextContainerView__setFrameOrBounds_oldRect_isFrameRect_settingAction___block_invoke;
      aBlock[3] = &unk_1E52D9CD0;
      aBlock[4] = self;
      aBlock[5] = v18;
      double v19 = _Block_copy(aBlock);
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __76___UITextContainerView__setFrameOrBounds_oldRect_isFrameRect_settingAction___block_invoke_2;
      v33[3] = &unk_1E530C078;
      id v20 = v19;
      id v34 = v20;
      unint64_t v35 = v18;
      v33[4] = self;
      CGFloat v36 = v14;
      CGFloat v37 = v13;
      double v38 = v12;
      double v39 = v11;
      BOOL v44 = a5;
      CGFloat v40 = x;
      CGFloat v41 = y;
      double v42 = width;
      double v43 = height;
      CGFloat v21 = (void (**)(void))_Block_copy(v33);
      if (!+[UIView _isInAnimationBlockWithAnimationsEnabled])
      {
        v21[2](v21);
LABEL_17:

        return;
      }
      char v22 = 1;
      if (v12 >= width && v11 >= height)
      {
        ((void (*)(void (**)(void), double))v21[2])(v21, height);
        char v22 = 0;
      }
      id v23 = objc_loadWeakRetained((id *)&self->_textView);
      if (([v23 isScrollEnabled] & 1) == 0)
      {
        id v24 = objc_loadWeakRetained((id *)&self->_textView);
        [v24 selectedRange];
        uint64_t v26 = v25;

        if (!v26)
        {
LABEL_11:
          if (!self->_invalidationSeqClipsToBounds)
          {
            BOOL v27 = [(UIView *)self clipsToBounds];
            int64_t v28 = 1;
            if (!v27) {
              int64_t v28 = 2;
            }
            self->_invalidationSeqClipsToBounds = v28;
          }
          -[UIView setClipsToBounds:](self, "setClipsToBounds:", 1, *(void *)&height);
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __76___UITextContainerView__setFrameOrBounds_oldRect_isFrameRect_settingAction___block_invoke_3;
          v29[3] = &unk_1E52F1738;
          char v32 = v22;
          double v30 = v21;
          id v31 = v20;
          +[UIViewAnimationState _addSystemPostAnimationAction:v29];

          goto LABEL_17;
        }
        id v23 = objc_loadWeakRetained((id *)&self->_textView);
        [v23 updateSelection];
      }

      goto LABEL_11;
    }
  }
}

- (void)_ensureMinAndMaxSizesConsistentWithBounds
{
  [(UIView *)self bounds];
  if (self->_minSize.width > v3) {
    self->_minSize.double width = v3;
  }
  if (self->_maxSize.width < v3) {
    self->_maxSize.double width = v3;
  }
  if (self->_maxSize.height < v4) {
    self->_maxSize.double height = v4;
  }
}

- (void)setTextContainerInset:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  if (a3.left == self->_textContainerInset.left
    && a3.top == self->_textContainerInset.top
    && a3.right == self->_textContainerInset.right
    && a3.bottom == self->_textContainerInset.bottom)
  {
    return;
  }
  self->_textContainerInset = a3;
  id v24 = [(_UITextContainerView *)self textContainer];
  if (v24)
  {
    int v11 = [v24 widthTracksTextView];
    int v12 = [v24 heightTracksTextView];
    int v13 = v12;
    if ((v11 & 1) != 0 || v12)
    {
      [v24 size];
      double v15 = v14;
      double v17 = v16;
      [(UIView *)self bounds];
      double v20 = v19 - (left + right);
      if (!v11) {
        double v20 = v15;
      }
      double v21 = v18 - (top + bottom);
      if (!v13) {
        double v21 = v17;
      }
      if (v15 != v20 || v17 != v21)
      {
        objc_msgSend(v24, "setSize:");
        if (dyld_program_sdk_at_least()) {
          goto LABEL_30;
        }
        goto LABEL_29;
      }
      if ((dyld_program_sdk_at_least() & 1) == 0)
      {
LABEL_29:
        id v23 = [(_UITextContainerView *)self layoutManager];
        [v23 textContainerChangedGeometry:v24];

        goto LABEL_30;
      }
    }
    else if (!dyld_program_sdk_at_least())
    {
      goto LABEL_29;
    }
    [(_UITextContainerView *)self _sizeToConstrainedContainerUsedRect];
  }
LABEL_30:
  [(_UITextContainerView *)self invalidateTextContainerOrigin];
  [(_UITextContainerView *)self setNeedsDisplay];
  [(_UITextContainerView *)self updateInsertionPointStateAndRestartTimer:0];
}

- (void)invalidateTextContainerOrigin
{
  *(unsigned char *)&self->_tcvFlags |= 1u;
}

- (void)setNeedsDisplay
{
}

- (BOOL)isVerticallyResizable
{
  return (*(unsigned char *)&self->_tcvFlags >> 4) & 1;
}

- (BOOL)isHorizontallyResizable
{
  return (*(unsigned char *)&self->_tcvFlags >> 3) & 1;
}

- (UIEdgeInsets)textContainerInset
{
  double top = self->_textContainerInset.top;
  double left = self->_textContainerInset.left;
  double bottom = self->_textContainerInset.bottom;
  double right = self->_textContainerInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)updateInsertionPointStateAndRestartTimer:(BOOL)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [(UIView *)self bounds];
  if (!CGRectIsEmpty(v11)
    && WeakRetained
    && [WeakRetained isEditableForTextContainerView:self])
  {
    uint64_t v5 = [WeakRetained selectedRangeForTextContainerView:self];
    uint64_t v7 = v6;
    double v8 = [(_UITextContainerView *)self layoutManager];
    id v9 = objc_loadWeakRetained((id *)&self->_textContainer);
    v10[0] = 0;
    objc_msgSend(v8, "rectArrayForCharacterRange:withinSelectedCharacterRange:inTextContainer:rectCount:", v5, v7, v5, v7, v9, v10);

    [WeakRetained updateSelectionForTextContainerView:self];
  }
}

- (void)layoutSubviews
{
  v30.receiver = self;
  v30.super_class = (Class)_UITextContainerView;
  [(UIView *)&v30 layoutSubviews];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  [WeakRetained visibleTextRect];
  CGFloat v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  [(UIView *)self frame];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat rect = v5;
  v31.origin.CGFloat x = v5;
  v31.origin.CGFloat y = v7;
  v31.size.double width = v9;
  v31.size.double height = v11;
  double Width = CGRectGetWidth(v31);
  v32.origin.CGFloat x = v13;
  v32.origin.CGFloat y = v15;
  v32.size.double width = v17;
  v32.size.double height = v19;
  if (Width > CGRectGetWidth(v32)) {
    goto LABEL_3;
  }
  v33.origin.CGFloat x = rect;
  v33.origin.CGFloat y = v7;
  v33.size.double width = v9;
  v33.size.double height = v11;
  double Height = CGRectGetHeight(v33);
  v34.origin.CGFloat x = v13;
  v34.origin.CGFloat y = v15;
  v34.size.double width = v17;
  v34.size.double height = v19;
  if (Height > CGRectGetHeight(v34))
  {
LABEL_3:
    id v22 = objc_loadWeakRetained((id *)&self->_textView);
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", v22, rect, v7, v9, v11);
    [(_UITextContainerView *)self _ensureLayoutCompleteForRect:"_ensureLayoutCompleteForRect:"];
  }
  [(UIView *)self transform];
  CGFloat v23 = 1.0 / v28;
  [(UIView *)self transform];
  CGAffineTransformMakeScale(&v29, v23, 1.0 / v27);
  canvasView = self->_canvasView;
  CGAffineTransform rect_8 = v29;
  [(_UITextCanvas *)canvasView setTransform:&rect_8];
  [(UIView *)self bounds];
  -[_UITextCanvas setFrame:](self->_canvasView, "setFrame:");
}

- (void)willMoveToSuperview:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UITextContainerView;
  [(UIView *)&v6 willMoveToSuperview:v4];
  p_textView = &self->_textView;
  objc_storeWeak((id *)p_textView, 0);
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeWeak((id *)p_textView, v4);
    }
  }
}

- (_UITextContainerView)initWithFrame:(CGRect)a3
{
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Please use the designated initializer"];
  return 0;
}

- (_UITextEmphasisBackgroundView)textEmphasisBackgroundView
{
  if (_UITextViewAllowSelectionContainerInTextLayoutCanvas()
    && (id WeakRetained = objc_loadWeakRetained((id *)&self->_textContainer),
        [WeakRetained textLayoutManager],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        WeakRetained,
        v4))
  {
    CGFloat v5 = [(_UITextCanvas *)self->_canvasView textEmphasisBackgroundView];
  }
  else
  {
    CGFloat v5 = 0;
  }
  return (_UITextEmphasisBackgroundView *)v5;
}

- (void)setTextHighlightAttributes:(id)a3
{
  id v4 = a3;
  textHighlightAttributes = self->_textHighlightAttributes;
  double v11 = (NSDictionary *)v4;
  objc_super v6 = textHighlightAttributes;
  if (v6 == v11)
  {

    goto LABEL_10;
  }
  if (v11 && v6)
  {
    char v7 = [(NSDictionary *)v11 isEqual:v6];

    if (v7) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  double v8 = [(_UITextContainerView *)self textEmphasisBackgroundView];

  if (v8) {
    [(_UITextCanvas *)self->_canvasView setNeedsLayout];
  }
LABEL_10:
  double v9 = (NSDictionary *)[(NSDictionary *)v11 copy];
  double v10 = self->_textHighlightAttributes;
  self->_textHighlightAttributes = v9;
}

- (NSDictionary)textHighlightAttributes
{
  v13[2] = *MEMORY[0x1E4F143B8];
  double v3 = self->_textHighlightAttributes;
  if (!v3)
  {
    uint64_t v4 = [(UIView *)self tintColor];
    CGFloat v5 = (void *)v4;
    if (v4)
    {
      v12[0] = *(void *)off_1E52D2048;
      objc_super v6 = (void *)v4;
    }
    else
    {
      if (os_variant_has_internal_diagnostics())
      {
        double v10 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)double v11 = 0;
          _os_log_fault_impl(&dword_1853B0000, v10, OS_LOG_TYPE_FAULT, "No tint color available for foreground highlight. This should never happen but it did, so using yellow", v11, 2u);
        }
      }
      else
      {
        double v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &textHighlightAttributes___s_category) + 8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)double v11 = 0;
          _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "No tint color available for foreground highlight. This should never happen but it did, so using yellow", v11, 2u);
        }
      }
      v12[0] = *(void *)off_1E52D2048;
      objc_super v6 = +[UIColor systemYellowColor];
    }
    v13[0] = v6;
    v12[1] = *(void *)off_1E52D2310;
    char v7 = +[UIColor secondarySystemFillColor];
    v13[1] = v7;
    double v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

    if (!v5) {
  }
    }
  return v3;
}

- (id)textHighlightRenderingAttributesForAttributes:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CGFloat v5 = [v4 objectForKeyedSubscript:*(void *)off_1E52D2318];

  if (!v5) {
    goto LABEL_23;
  }
  id v6 = [v4 objectForKeyedSubscript:*(void *)off_1E52D22D8];
  char v7 = *(void **)off_1E52D22E8;
  if (!v6) {
    id v6 = v7;
  }
  if ([v6 isEqualToString:v7])
  {
    double v8 = [(_UITextContainerView *)self textHighlightAttributes];

    goto LABEL_24;
  }
  double v9 = objc_opt_class();
  objc_sync_enter(v9);
  double v10 = [(id)textHighlightRenderingAttributesForAttributes__colorSchemeTable objectForKeyedSubscript:v6];
  if (!v10)
  {
    if ([v6 isEqualToString:*(void *)off_1E52D2308])
    {
      uint64_t v11 = +[UIColor systemPurpleColor];
      goto LABEL_17;
    }
    if ([v6 isEqualToString:*(void *)off_1E52D2300])
    {
      uint64_t v11 = +[UIColor systemPinkColor];
      goto LABEL_17;
    }
    if ([v6 isEqualToString:*(void *)off_1E52D22F8])
    {
      uint64_t v11 = +[UIColor systemOrangeColor];
      goto LABEL_17;
    }
    if ([v6 isEqualToString:*(void *)off_1E52D22F0])
    {
      uint64_t v11 = +[UIColor systemMintColor];
      goto LABEL_17;
    }
    if ([v6 isEqualToString:*(void *)off_1E52D22E0])
    {
      uint64_t v11 = +[UIColor systemBlueColor];
LABEL_17:
      double v10 = (void *)v11;
      if (!v11) {
        goto LABEL_21;
      }
      goto LABEL_18;
    }
    uint64_t v16 = [v6 rangeOfString:@"NSTextHighlightColorScheme" options:8];
    if (v17)
    {
      double v18 = NSString;
      CGFloat v19 = [v6 substringFromIndex:v16 + v17];
      double v20 = [v18 stringWithFormat:@"system%@Color", v19];
    }
    else
    {
      double v20 = (NSString *)v6;
    }
    double v10 = NSSelectorFromString(v20);
    if (v10)
    {
      objc_opt_class();
      if (objc_opt_respondsToSelector())
      {
        double v10 = [(id)objc_opt_class() performSelector:v10];
      }
      else
      {
        double v10 = 0;
      }
    }

    if (v10)
    {
LABEL_18:
      double v12 = (void *)textHighlightRenderingAttributesForAttributes__colorSchemeTable;
      if (!textHighlightRenderingAttributesForAttributes__colorSchemeTable)
      {
        id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        double v14 = (void *)textHighlightRenderingAttributesForAttributes__colorSchemeTable;
        textHighlightRenderingAttributesForAttributes__colorSchemeTable = (uint64_t)v13;

        double v12 = (void *)textHighlightRenderingAttributesForAttributes__colorSchemeTable;
      }
      [v12 setObject:v10 forKeyedSubscript:v6];
    }
  }
LABEL_21:
  objc_sync_exit(v9);

  if (v10)
  {
    uint64_t v21 = *(void *)off_1E52D2048;
    v22[0] = v10;
    double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];

    goto LABEL_24;
  }
LABEL_23:
  double v8 = (void *)MEMORY[0x1E4F1CC08];
LABEL_24:

  return v8;
}

- (void)setUniqueWritingToolsAnimatedLayoutInfo:(id)a3
{
  id v6 = a3;
  if (dyld_program_sdk_at_least())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textContainer);
    CGFloat v5 = [WeakRetained textLayoutManager];

    if (v5) {
      [(_UITextCanvas *)self->_canvasView setUniqueWritingToolsAnimatedLayoutInfo:v6];
    }
  }
}

- (_UIAnimatedTextLayoutInfo)uniqueWritingToolsAnimatedLayoutInfo
{
  if (dyld_program_sdk_at_least()
    && (id WeakRetained = objc_loadWeakRetained((id *)&self->_textContainer),
        [WeakRetained textLayoutManager],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        WeakRetained,
        v4))
  {
    CGFloat v5 = [(_UITextCanvas *)self->_canvasView uniqueWritingToolsAnimatedLayoutInfo];
  }
  else
  {
    CGFloat v5 = 0;
  }
  return (_UIAnimatedTextLayoutInfo *)v5;
}

- (id)linkTextAttributes
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained linkTextAttributesForTextContainerView:self];

  return v4;
}

- (id)linkAttributesForLink:(id)a3 forCharacterAtIndex:(unint64_t)a4
{
  p_delegate = &self->_delegate;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  double v9 = [WeakRetained textContainerView:self linkTextAttributesForLink:v7 forCharacterAtIndex:a4];

  return v9;
}

- (void)_setFreezeTextContainerSize:(BOOL)a3
{
  char tcvFlags = (char)self->_tcvFlags;
  if (((((tcvFlags & 0x20) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v4 = 32;
    }
    else {
      char v4 = 0;
    }
    *(unsigned char *)&self->_char tcvFlags = tcvFlags & 0xDF | v4;
    textLayoutController = self->_textLayoutController;
    if (a3) {
      [(_UITextLayoutController *)textLayoutController suspendTiling];
    }
    else {
      [(_UITextLayoutController *)textLayoutController resumeTiling];
    }
  }
}

- (BOOL)reconfigureWithLayoutManager:(id)a3 triggeredBySelector:(SEL)a4
{
  p_textView = &self->_textView;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_textView);
  LOBYTE(a4) = [WeakRetained _reconfigureWithLayoutManager:v6 triggeredByLayoutManagerAccess:1 triggeringSelector:a4];

  return (char)a4;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __34___UITextContainerView_setBounds___block_invoke;
  v12[3] = &unk_1E52DA520;
  *(double *)&v12[5] = x;
  *(double *)&v12[6] = y;
  *(double *)&v12[7] = width;
  *(double *)&v12[8] = height;
  v12[4] = self;
  -[_UITextContainerView _setFrameOrBounds:oldRect:isFrameRect:settingAction:](self, "_setFrameOrBounds:oldRect:isFrameRect:settingAction:", 0, v12, x, y, width, height, v8, v9, v10, v11);
}

- (BOOL)usesStandardTextScaling
{
  return (*(unsigned char *)&self->_tcvFlags >> 6) & 1;
}

- (void)setUsesStandardTextScaling:(BOOL)a3
{
  if (((((*(unsigned char *)&self->_tcvFlags & 0x40) == 0) ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    [(_UITextContainerView *)self invalidateTextContainerOrigin];
    if (v3) {
      char v5 = 64;
    }
    else {
      char v5 = 0;
    }
    *(unsigned char *)&self->_char tcvFlags = *(unsigned char *)&self->_tcvFlags & 0xBF | v5;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
    id v7 = WeakRetained;
    if (v3)
    {
      [WeakRetained setMinimumZoomScale:1.29871];

      id v8 = objc_loadWeakRetained((id *)&self->_textView);
      [v8 setMaximumZoomScale:1.29871];

      id v9 = objc_loadWeakRetained((id *)&self->_textView);
      double v10 = v9;
      double v11 = 1.29871;
    }
    else
    {
      [WeakRetained setMinimumZoomScale:1.0];

      id v12 = objc_loadWeakRetained((id *)&self->_textView);
      [v12 setMaximumZoomScale:1.0];

      id v9 = objc_loadWeakRetained((id *)&self->_textView);
      double v10 = v9;
      double v11 = 1.0;
    }
    [v9 setZoomScale:v11];

    [(_UITextContainerView *)self setNeedsDisplay];
  }
}

- (void)setNeedsDisplayInRect:(CGRect)a3 avoidAdditionalLayout:(BOOL)a4
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if ([(_UITextLayoutController *)self->_textLayoutController usesTiledViews])
  {
    [(UIView *)self bounds];
    v12.origin.CGFloat x = x;
    v12.origin.double y = y - floor(height * 0.5);
    v12.size.CGFloat width = width;
    v12.size.double height = height + height;
    CGRect v11 = CGRectIntersection(v10, v12);
    -[_UITextContainerView setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:", v11.origin.x, v11.origin.y, v11.size.width, v11.size.height);
  }
  else
  {
    [(_UITextContainerView *)self setNeedsDisplay];
  }
}

- (UIColor)textColor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  BOOL v3 = [WeakRetained textColor];

  return (UIColor *)v3;
}

- (BOOL)isEditable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  char v3 = [WeakRetained isEditable];

  return v3;
}

- (BOOL)isEditing
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  char v3 = [WeakRetained isEditing];

  return v3;
}

- (CGPoint)drawingScale
{
  [(UIView *)self transform];
  [(UIView *)self transform];
  double v3 = v5;
  double v4 = v6;
  result.double y = v3;
  result.CGFloat x = v4;
  return result;
}

- (BOOL)drawTextInRectIfNeeded:(CGRect)a3
{
  return 0;
}

- (void)_ensureLayoutCompleteToEndOfCharacterRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  double v5 = [(_UITextContainerView *)self layoutManager];
  id v11 = v5;
  if (!length)
  {
    double v6 = [v5 textStorage];
    uint64_t v7 = [v6 length];

    double v5 = v11;
    if (!v7) {
      goto LABEL_7;
    }
    location -= location == v7;
    NSUInteger length = 1;
  }
  if ([v5 allowsNonContiguousLayout]) {
    objc_msgSend(v11, "ensureLayoutForCharacterRange:", location, length);
  }
  uint64_t v8 = objc_msgSend(v11, "glyphRangeForCharacterRange:actualCharacterRange:", location, length, 0);
  id v10 = (id)[v11 textContainerForGlyphAtIndex:v9 + v8 - 1 effectiveRange:0];
  double v5 = v11;
LABEL_7:
}

- (void)_ensureLayoutCompleteForRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v23 = [(_UITextContainerView *)self layoutManager];
  if ([v23 hasNonContiguousLayout])
  {
    uint64_t v8 = [(UIView *)self window];
    char v9 = [v8 isHidden];

    if ((v9 & 1) == 0)
    {
      id v10 = [(_UITextContainerView *)self textContainer];
      [(_UITextContainerView *)self textContainerOrigin];
      if (v23)
      {
        if (v10)
        {
          double v13 = v11;
          double v14 = v12;
          v25.origin.double x = x;
          v25.origin.double y = y;
          v25.size.double width = width;
          v25.size.double height = height;
          if (!NSIsEmptyRect(v25))
          {
            double v15 = x - v13;
            double v16 = y - v14;
            double v17 = height * 1.5;
            if (height * 1.5 < 0.0) {
              double v17 = 0.0;
            }
            if (v17 > v16) {
              double v17 = y - v14;
            }
            double v18 = v16 - v17;
            double v19 = height + v17;
            uint64_t v20 = objc_msgSend(v23, "glyphRangeForBoundingRect:inTextContainer:", v10, v15, v16 - v17, width, v19);
            if (v21)
            {
              uint64_t v22 = v20;
              if (v21 >= 0x400)
              {
                objc_msgSend(v23, "ensureLayoutForGlyphRange:", v20, v21 >> 3);
                uint64_t v22 = objc_msgSend(v23, "glyphRangeForBoundingRect:inTextContainer:", v10, v15, v18, width, v19);
              }
              objc_msgSend(v23, "ensureLayoutForGlyphRange:", v22, v21);
              [v23 usedRectForTextContainer:v10];
            }
          }
        }
      }
    }
  }
}

- (id)layoutManager:(id)a3 effectiveCUICatalogForTextEffect:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  uint64_t v8 = [WeakRetained textContainerView:self cuiCatalogForTextEffectName:v6];

  return v8;
}

- (void)setLayoutOrientation:(int64_t)a3
{
  if ((((unint64_t)*(unsigned char *)&self->_tcvFlags >> 1) & 3) != a3)
  {
    char v3 = a3;
    BOOL v5 = [(_UITextContainerView *)self layoutOrientation] == 0;
    *(unsigned char *)&self->_char tcvFlags = *(unsigned char *)&self->_tcvFlags & 0xF9 | (2 * (v3 & 3));
    int64_t v6 = [(_UITextContainerView *)self layoutOrientation];
    int64_t v7 = v6;
    if (((v5 ^ (v6 != 0)) & 1) == 0)
    {
      memset(&v29, 0, sizeof(v29));
      double v8 = 1.57079633;
      if (!v6) {
        double v8 = 0.0;
      }
      CGAffineTransformMakeRotation(&v29, v8);
      [(UIView *)self frame];
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      CGAffineTransform v28 = v29;
      [(UIView *)self setTransform:&v28];
      -[_UITextContainerView setFrame:](self, "setFrame:", v10, v12, v14, v16);
    }
    BOOL v17 = [(_UITextContainerView *)self isHorizontallyResizable];
    if (v17 != [(_UITextContainerView *)self isVerticallyResizable]
      && (((v7 != 0) ^ [(_UITextContainerView *)self isVerticallyResizable]) & 1) == 0)
    {
      BOOL v18 = v7 == 0;
      BOOL v19 = v7 == 0;
      uint64_t v20 = !v18;
      [(_UITextContainerView *)self setHorizontallyResizable:v20];
      [(_UITextContainerView *)self setVerticallyResizable:v19];
    }
    unint64_t v21 = [(_UITextContainerView *)self layoutManager];
    if (v21)
    {
      uint64_t v22 = [(_UITextContainerView *)self textContainer];
      uint64_t v23 = [v21 glyphRangeForTextContainer:v22];
      uint64_t v25 = v24;

      uint64_t v26 = objc_msgSend(v21, "characterRangeForGlyphRange:actualGlyphRange:", v23, v25, 0);
      objc_msgSend(v21, "invalidateGlyphsForCharacterRange:changeInLength:actualCharacterRange:", v26, v27, 0, 0);
    }
    [(_UITextContainerView *)self setNeedsDisplay];
  }
}

- (NSDictionary)markedTextStyle
{
  double v2 = -[_UITextLayoutControllerBase textInputController]((UITextInputController *)self->_textLayoutController);
  char v3 = [v2 markedTextStyle];

  return (NSDictionary *)v3;
}

- (id)attributedSubstringForMarkedRange
{
  double v2 = -[_UITextLayoutControllerBase textInputController]((UITextInputController *)self->_textLayoutController);
  char v3 = [v2 attributedSubstringForMarkedRange];

  return v3;
}

- (NSString)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)_UITextContainerView;
  double v4 = [(UIView *)&v11 description];
  BOOL v5 = NSStringFromCGSize(self->_minSize);
  int64_t v6 = NSStringFromCGSize(self->_maxSize);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textContainer);
  double v8 = [WeakRetained description];
  double v9 = [v3 stringWithFormat:@"<%@ minSize = %@, maxSize = %@, textContainer = %@>", v4, v5, v6, v8];

  return (NSString *)v9;
}

- (CGRect)visibleRect
{
  char v3 = [(UIView *)self superview];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 bounds];
    objc_msgSend(v3, "convertRect:toView:", self);
  }
  else
  {
    [(UIView *)self bounds];
  }
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;

  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (_UITextContainerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UITextContainerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setMinSize:(CGSize)a3
{
  self->_minSize = a3;
}

@end