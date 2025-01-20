@interface NSTextContainer
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)_containerObservesTextViewFrameChanges;
- (BOOL)_hasLayoutManager:(id)a3;
- (BOOL)_textViewAllowsMigratingToLayoutManager;
- (BOOL)containsPoint:(NSPoint)point;
- (BOOL)heightTracksTextView;
- (BOOL)isSimpleRectangularTextContainer;
- (BOOL)widthTracksTextView;
- (CGFloat)lineFragmentPadding;
- (CGPoint)textContainerOrigin;
- (CGRect)lineFragmentRectForProposedRect:(CGRect)a3 remainingRect:(CGRect *)a4;
- (CGRect)lineFragmentRectForProposedRect:(CGRect)proposedRect atIndex:(NSUInteger)characterIndex writingDirection:(NSWritingDirection)baseWritingDirection remainingRect:(CGRect *)remainingRect;
- (CGSize)size;
- (NSArray)exclusionPaths;
- (NSEdgeInsets)textContainerInsetsForView:(id)a3;
- (NSEdgeInsets)textContainerInsetsForView_iOS:(id)a3;
- (NSLayoutManager)layoutManager;
- (NSLineBreakMode)lineBreakMode;
- (NSTextContainer)init;
- (NSTextContainer)initWithCoder:(NSCoder *)coder;
- (NSTextContainer)initWithSize:(CGSize)size;
- (NSTextLayoutManager)textLayoutManager;
- (NSTextView)textView;
- (NSUInteger)maximumNumberOfLines;
- (double)minimumLineFragmentWidth;
- (id)attributesForExtraLineFragment;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultParagraphStyle;
- (id)description;
- (id)linkTextAttributes;
- (id)markedTextAttributesAtCharacterIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)renderingColorForDocumentColor:(id)a3;
- (id)selectedTextAttributes;
- (id)textHighlightRenderingAttributesForAttributes:(id)a3;
- (id)textViewportLayoutController;
- (int64_t)layoutOrientation;
- (unint64_t)_textLength;
- (void)_commonInit;
- (void)_containerTextViewFrameChanged:(id)a3;
- (void)_resizeAccordingToTextView:(id)a3;
- (void)coordinateAccess:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)invalidateTextContainerOrigin;
- (void)replaceLayoutManager:(NSLayoutManager *)newLayoutManager;
- (void)setAttributesForExtraLineFragment:(id)a3;
- (void)setExclusionPaths:(NSArray *)exclusionPaths;
- (void)setHeightTracksTextView:(BOOL)heightTracksTextView;
- (void)setLayoutManager:(NSLayoutManager *)layoutManager;
- (void)setLayoutOrientation:(int64_t)a3;
- (void)setLineBreakMode:(NSLineBreakMode)lineBreakMode;
- (void)setLineFragmentPadding:(CGFloat)lineFragmentPadding;
- (void)setMaximumNumberOfLines:(NSUInteger)maximumNumberOfLines;
- (void)setMinimumLineFragmentWidth:(double)a3;
- (void)setSize:(CGSize)size;
- (void)setTextLayoutManager:(id)a3;
- (void)setTextView:(NSTextView *)textView;
- (void)setWidthTracksTextView:(BOOL)widthTracksTextView;
@end

@implementation NSTextContainer

- (CGFloat)lineFragmentPadding
{
  return self->_lineFragmentPadding;
}

- (int64_t)layoutOrientation
{
  [(NSTextContainer *)self textView];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return self->_layoutOrientation;
  }
  v3 = [(NSTextContainer *)self textView];

  return [(NSTextView *)v3 layoutOrientation];
}

- (NSTextView)textView
{
  return (NSTextView *)objc_loadWeak((id *)&self->_textView);
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSUInteger)maximumNumberOfLines
{
  return self->_maximumLines;
}

- (BOOL)isSimpleRectangularTextContainer
{
  uint64_t v3 = __NSBaseLineFragmentIMP;
  if (v3 != [(NSTextContainer *)self methodForSelector:sel_lineFragmentRectForProposedRect_atIndex_writingDirection_remainingRect_]|| (*(_WORD *)&self->_tcFlags & 0x80) != 0|| [(NSArray *)[(NSTextContainer *)self exclusionPaths] count])
  {
    return 0;
  }
  if ([(NSTextContainer *)self maximumNumberOfLines]) {
    return [(NSTextContainer *)self textLayoutManager] != 0;
  }
  return 1;
}

- (NSArray)exclusionPaths
{
  if (self->_exclusionPaths) {
    return self->_exclusionPaths;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

uint64_t __53__NSTextContainer_setAttributesForExtraLineFragment___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 state] == 3)
  {
    v4 = (void *)[a2 extraLineFragmentAttributes];
    if (v4)
    {
      if (([v4 isEqualToDictionary:*(void *)(*(void *)(a1 + 32) + 136)] & 1) == 0) {
        [a2 invalidateLayout];
      }
    }
  }
  return 0;
}

- (void)setLineFragmentPadding:(CGFloat)lineFragmentPadding
{
  if (self->_lineFragmentPadding != lineFragmentPadding)
  {
    self->_lineFragmentPadding = lineFragmentPadding;
    if ([(NSTextContainer *)self textLayoutManager]) {
      v4 = [(NSTextContainer *)self textLayoutManager];
    }
    else {
      v4 = [(NSTextContainer *)self layoutManager];
    }
    [(NSTextLayoutManager *)v4 textContainerChangedGeometry:self];
  }
}

- (NSTextLayoutManager)textLayoutManager
{
  return (NSTextLayoutManager *)objc_loadWeak((id *)&self->_textLayoutManager);
}

- (NSLayoutManager)layoutManager
{
  if ([(NSTextContainer *)self _textViewAllowsMigratingToLayoutManager]) {
    [(NSTextContainerView *)self->_textView reconfigureWithLayoutManager:0 triggeredBySelector:sel_layoutManager];
  }
  return self->_layoutManager;
}

- (BOOL)_textViewAllowsMigratingToLayoutManager
{
  return self->_textViewSupportsDowngrade && self->_textLayoutManager != 0;
}

- (id)textViewportLayoutController
{
  uint64_t v3 = objc_sync_enter(self);
  textViewportLayoutController = self->_textViewportLayoutController;
  if (!textViewportLayoutController)
  {
    v5 = (void *)MEMORY[0x192FAE510](v3);
    self->_textViewportLayoutController = (NSTextViewportLayoutController *)[(NSTextLayoutManager *)[(NSTextContainer *)self textLayoutManager] _textViewportLayoutControllerForTextContainer:self];
    textViewportLayoutController = self->_textViewportLayoutController;
  }
  objc_sync_exit(self);
  return textViewportLayoutController;
}

- (void)dealloc
{
  p_textView = &self->_textView;
  [(NSTextContainerView *)self->_textView setTextContainer:0];
  objc_destroyWeak((id *)p_textView);

  v4 = p_textView[8];
  if (v4) {
    CFRelease(v4);
  }
  cachedClippingAttributes = self->_cachedClippingAttributes;
  if (cachedClippingAttributes) {
    CFRelease(cachedClippingAttributes);
  }
  cachedBounds = self->_cachedBounds;
  if (cachedBounds) {
    CFRelease(cachedBounds);
  }

  [(NSTextContainer *)self setTextLayoutManager:0];
  v7.receiver = self;
  v7.super_class = (Class)NSTextContainer;
  [(NSTextContainer *)&v7 dealloc];
}

- (void)setTextLayoutManager:(id)a3
{
  textLayoutManager = self->_textLayoutManager;
  p_textLayoutManager = &self->_textLayoutManager;
  if (textLayoutManager != a3)
  {
    objc_storeWeak((id *)p_textLayoutManager, a3);
    if (a3)
    {
      int64_t v7 = [a3 applicationFrameworkContext];
      self->_layoutManager = 0;
    }
    else
    {
      int64_t v7 = _NSTextScalingTypeForCurrentEnvironment();
    }
    self->_applicationFrameworkContext = v7;
    objc_sync_enter(self);
    textViewportLayoutController = self->_textViewportLayoutController;
    self->_textViewportLayoutController = 0;

    objc_sync_exit(self);
  }
  if ((NSTextContainer *)[(NSTextContainerView *)self->_textView textContainer] == self)
  {
    textView = self->_textView;
    [(NSTextContainerView *)textView setTextContainer:self];
  }
}

- (id)attributesForExtraLineFragment
{
  return self->_attributesForExtraLineFragment;
}

- (id)renderingColorForDocumentColor:(id)a3
{
  if (self->_textViewSupportsAdaptiveColor) {
    id result = (id)[(NSTextContainerView *)self->_textView renderingColorForDocumentColor:a3];
  }
  else {
    id result = 0;
  }
  if (!result) {
    return a3;
  }
  return result;
}

- (NSTextContainer)initWithSize:(CGSize)size
{
  CGFloat height = size.height;
  CGFloat width = size.width;
  v8.receiver = self;
  v8.super_class = (Class)NSTextContainer;
  v5 = [(NSTextContainer *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(NSTextContainer *)v5 _commonInit];
    v6->_size.CGFloat width = width;
    v6->_size.CGFloat height = height;
  }
  return v6;
}

- (void)_commonInit
{
  self->_layoutManager = 0;
  self->_lineFragmentPadding = 5.0;
  *(_WORD *)&self->_tcFlags &= 0xFFF8u;
  self->_minimumWidth = 15.0;
  self->_applicationFrameworkContext = _NSTextScalingTypeForCurrentEnvironment();
}

- (id)markedTextAttributesAtCharacterIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4
{
  int64_t v7 = [(NSTextContainer *)self textView];
  _NSRange v20 = (_NSRange)0;
  char v8 = objc_opt_respondsToSelector();
  id result = 0;
  if (v8)
  {
    unint64_t v10 = [(NSTextView *)v7 markedRange];
    if (v11)
    {
      NSUInteger v12 = v10;
      NSUInteger v13 = v11;
      unint64_t v14 = a3 - v10;
      if (a3 >= v10 && v14 < v11)
      {
        if (objc_opt_respondsToSelector())
        {
          v15 = (void *)[(NSTextView *)v7 attributedSubstringForMarkedRange];
          if (v15)
          {
            v16 = v15;
            if (v13 == [v15 length])
            {
              id result = (id)[v16 attributesAtIndex:v14 effectiveRange:&v20];
              v20.location += v12;
              goto LABEL_20;
            }
          }
        }
        if (objc_opt_respondsToSelector())
        {
          id result = [(NSTextView *)v7 markedTextAttributes];
LABEL_18:
          v20.location = v12;
          v20.length = v13;
          goto LABEL_20;
        }
        if (objc_opt_respondsToSelector())
        {
          id result = (id)[(NSTextView *)v7 markedTextStyle];
          goto LABEL_18;
        }
        goto LABEL_19;
      }
      NSUInteger v17 = v10 - a3;
      if (v10 > a3)
      {
        id result = 0;
        v20.location = a3;
        goto LABEL_15;
      }
      unint64_t v18 = [(NSTextContainer *)self _textLength];
      if (v18 != 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v19 = v18;
        id result = 0;
        NSUInteger v17 = v19 - (v12 + v13);
        v20.location = v12 + v13;
LABEL_15:
        v20.length = v17;
        goto LABEL_20;
      }
    }
LABEL_19:
    id result = 0;
  }
LABEL_20:
  if (a4) {
    *a4 = v20;
  }
  if (!result) {
    return (id)MEMORY[0x1E4F1CC08];
  }
  return result;
}

- (void)invalidateTextContainerOrigin
{
}

- (NSLineBreakMode)lineBreakMode
{
  return ((unint64_t)*(_WORD *)&self->_tcFlags >> 3) & 0xF;
}

- (id)defaultParagraphStyle
{
  if (!self->_textViewHasDefaultParagraphStyle
    || (id result = (id)[(NSTextContainerView *)self->_textView defaultParagraphStyle]) == 0)
  {
    return +[NSParagraphStyle defaultParagraphStyle];
  }
  return result;
}

- (void)setAttributesForExtraLineFragment:(id)a3
{
  if (([a3 isEqualToDictionary:self->_attributesForExtraLineFragment] & 1) == 0)
  {
    v5 = [(NSTextContainer *)self textLayoutManager];
    v6 = v5;
    int64_t v7 = v5
       ? [(NSTextLayoutManager *)v5 textContainer]
       : [(NSLayoutManager *)self->_layoutManager extraLineFragmentTextContainer];
    char v8 = v7;
    v9 = (NSDictionary *)[a3 copyWithZone:0];

    self->_attributesForExtraLineFragment = v9;
    if (v8 == self)
    {
      if (v6)
      {
        if (![(NSArray *)[(NSTextLayoutManager *)v6 textSelections] count])
        {
          uint64_t v10 = [(NSTextRange *)[(NSTextContentManager *)[(NSTextLayoutManager *)v6 textContentManager] documentRange] endLocation];
          v12[0] = MEMORY[0x1E4F143A8];
          v12[1] = 3221225472;
          v12[2] = __53__NSTextContainer_setAttributesForExtraLineFragment___block_invoke;
          v12[3] = &unk_1E55C5D40;
          v12[4] = self;
          [(NSTextLayoutManager *)v6 enumerateTextLayoutFragmentsFromLocation:v10 options:1 usingBlock:v12];
          [(NSTextLayoutManager *)v6 _invalidateTextParagraphForEmptyDocument];
        }
      }
      else
      {
        [(NSLayoutManager *)self->_layoutManager extraLineFragmentRect];
        if (!NSEqualRects(v14, *MEMORY[0x1E4F28AD8]))
        {
          layoutManager = self->_layoutManager;
          [(NSLayoutManager *)layoutManager textContainerChangedGeometry:self];
        }
      }
    }
  }
}

- (BOOL)widthTracksTextView
{
  return *(_WORD *)&self->_tcFlags & 1;
}

- (BOOL)heightTracksTextView
{
  return (*(_WORD *)&self->_tcFlags >> 1) & 1;
}

- (NSTextContainer)init
{
  return -[NSTextContainer initWithSize:](self, "initWithSize:", 10000000.0, 10000000.0);
}

- (CGPoint)textContainerOrigin
{
  v2 = [(NSTextContainer *)self textView];
  if (objc_opt_respondsToSelector())
  {
    [(NSTextView *)v2 bounds];
    -[NSTextView textContainerFrameForBounds:](v2, "textContainerFrameForBounds:");
  }
  else if (objc_opt_respondsToSelector())
  {
    [(NSTextView *)v2 textContainerOrigin];
  }
  else
  {
    double v3 = *MEMORY[0x1E4F28AD0];
    double v4 = *(double *)(MEMORY[0x1E4F28AD0] + 8);
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)setSize:(CGSize)size
{
  CGFloat height = size.height;
  CGFloat width = size.width;
  if (!NSEqualSizes(self->_size, size))
  {
    v6 = [(NSTextContainer *)self textLayoutManager];
    if (v6)
    {
      int64_t v7 = 0;
      id v8 = 0;
    }
    else
    {
      int64_t v7 = [(NSTextContainer *)self layoutManager];
      id v8 = [(NSLayoutManager *)v7 delegate];
    }
    double v9 = self->_size.width;
    double v10 = self->_size.height;
    self->_size.CGFloat width = width;
    self->_size.CGFloat height = height;
    cachedBoundingPath = self->_cachedBoundingPath;
    if (cachedBoundingPath)
    {
      CFRelease(cachedBoundingPath);
      self->_cachedBoundingPath = 0;
    }
    if (!v6) {
      [(NSLayoutManager *)v7 textContainerChangedGeometry:self];
    }
    [(NSTextLayoutManager *)[(NSTextContainer *)self textLayoutManager] textContainerChangedGeometry:self];
    if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "layoutManager:textContainer:didChangeGeometryFromSize:", v7, self, v9, v10);
    }
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    [a1 setVersion:1];
    __NSBaseLineFragmentIMP = [a1 instanceMethodForSelector:sel_lineFragmentRectForProposedRect_atIndex_writingDirection_remainingRect_];
  }
}

- (void)setTextView:(NSTextView *)textView
{
  p_textView = &self->_textView;
  v5 = self->_textView;
  [(NSTextContainerView *)v5 setTextContainer:0];
  int64_t v7 = (NSTextContainerView *)objc_storeWeak((id *)p_textView, textView);
  *p_textView = v7;
  [(NSTextContainerView *)v7 setTextContainer:self];
  if (objc_opt_respondsToSelector()) {
    [(NSTextView *)textView setTextContainer:self];
  }
  layoutManager = self->_layoutManager;
  if (layoutManager) {
    [(NSLayoutManager *)layoutManager textContainerChangedTextView:self fromTextView:v5];
  }
  if (textView) {
    [(NSTextContainer *)self _resizeAccordingToTextView:textView];
  }
  self->_textViewSupportsAdaptiveColor = objc_opt_respondsToSelector() & 1;
  self->_textViewSupportsDowngrade = objc_opt_respondsToSelector() & 1;
  self->_textViewHasDefaultParagraphStyle = objc_opt_respondsToSelector() & 1;
  self->_textViewHasLinkTextAttributes = objc_opt_respondsToSelector() & 1;
  self->_textViewHasHighlightAttributes = objc_opt_respondsToSelector() & 1;
}

- (void)_resizeAccordingToTextView:(id)a3
{
  if ((*(_WORD *)&self->_tcFlags & 3) != 0)
  {
    double width = self->_size.width;
    double height = self->_size.height;
    -[NSTextContainer textContainerInsetsForView:](self, "textContainerInsetsForView:");
    double v10 = v9;
    double v12 = v11;
    __int16 tcFlags = (__int16)self->_tcFlags;
    if (tcFlags)
    {
      double v14 = v7;
      double v15 = v8;
      [a3 bounds];
      double width = v16 - (v14 + v15);
      __int16 tcFlags = (__int16)self->_tcFlags;
    }
    if ((tcFlags & 2) != 0)
    {
      [a3 bounds];
      double height = v17 - (v10 + v12);
    }
    -[NSTextContainer setSize:](self, "setSize:", width, height);
  }
}

- (void)setWidthTracksTextView:(BOOL)widthTracksTextView
{
  *(_WORD *)&self->___int16 tcFlags = *(_WORD *)&self->_tcFlags & 0xFFFE | widthTracksTextView;
}

- (void)setHeightTracksTextView:(BOOL)heightTracksTextView
{
  if (heightTracksTextView) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 tcFlags = *(_WORD *)&self->_tcFlags & 0xFFFD | v3;
}

- (void)setMaximumNumberOfLines:(NSUInteger)maximumNumberOfLines
{
  if (self->_maximumLines != maximumNumberOfLines)
  {
    self->_maximumLines = maximumNumberOfLines;
    double v4 = [(NSTextContainer *)self textLayoutManager];
    if (!v4) {
      double v4 = [(NSTextContainer *)self layoutManager];
    }
    [(NSTextLayoutManager *)v4 textContainerChangedGeometry:self];
  }
}

- (void)setLineBreakMode:(NSLineBreakMode)lineBreakMode
{
  if ((((unint64_t)*(_WORD *)&self->_tcFlags >> 3) & 0xF) != lineBreakMode)
  {
    v5 = [(NSTextContainer *)self textLayoutManager];
    if (v5) {
      v6 = 0;
    }
    else {
      v6 = [(NSTextContainer *)self layoutManager];
    }
    __int16 v7 = 8 * (lineBreakMode & 0xF);
    if (lineBreakMode > NSLineBreakByTruncatingMiddle) {
      __int16 v7 = 0;
    }
    *(_WORD *)&self->___int16 tcFlags = *(_WORD *)&self->_tcFlags & 0xFF87 | v7;
    if (v5)
    {
      [(NSTextLayoutManager *)v5 textContainerChangedGeometry:self];
    }
    else
    {
      if ([(NSTextStorage *)[(NSLayoutManager *)v6 textStorage] length])
      {
        double v8 = [(NSLayoutManager *)v6 textContainers];
        uint64_t v15 = 0;
        uint64_t v16 = 0;
        uint64_t v9 = [(NSLayoutManager *)v6 textContainerForGlyphAtIndex:0 effectiveRange:&v15 withoutAdditionalLayout:1];
        if (v9)
        {
          double v10 = (NSTextContainer *)v9;
          if ([(NSArray *)v8 count] && v10 != self)
          {
            uint64_t v11 = v15;
            do
            {
              double v12 = [(NSLayoutManager *)v6 textContainerForGlyphAtIndex:v11 effectiveRange:&v15 withoutAdditionalLayout:1];
              double v10 = v12;
              uint64_t v11 = v16 + v15;
              v15 += v16;
            }
            while (v12 && v12 != self);
          }
          NSUInteger v13 = [(NSTextContainer *)v10 textView];
          if (v13)
          {
            double v14 = v13;
            [(NSTextView *)v13 bounds];
            -[NSTextView setNeedsDisplayInRect:avoidAdditionalLayout:](v14, "setNeedsDisplayInRect:avoidAdditionalLayout:", 0);
          }
        }
      }
      [(NSLayoutManager *)v6 textContainerChangedGeometry:self];
    }
  }
}

- (NSEdgeInsets)textContainerInsetsForView_iOS:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    [a3 textContainerInsets];
  }
  else if (objc_opt_respondsToSelector())
  {
    [a3 textContainerInset];
  }
  else
  {
    double v4 = *MEMORY[0x1E4F28250];
    double v5 = *(double *)(MEMORY[0x1E4F28250] + 8);
    double v6 = *(double *)(MEMORY[0x1E4F28250] + 16);
    double v7 = *(double *)(MEMORY[0x1E4F28250] + 24);
  }
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    __int16 tcFlags = (__int16)self->_tcFlags;
    [a3 encodeObject:self->_layoutManager forKey:@"NSLayoutManager"];
    [a3 encodeObject:self->_textLayoutManager forKey:@"NSTextLayoutManager"];
    if (self->_size.width != 10000000.0) {
      objc_msgSend(a3, "encodeDouble:forKey:", @"NSWidth");
    }
    if (self->_size.height != 10000000.0) {
      objc_msgSend(a3, "encodeDouble:forKey:", @"NSHeight");
    }
    uint64_t v6 = tcFlags & 3;
    if (self->_lineFragmentPadding != 5.0) {
      objc_msgSend(a3, "encodeDouble:forKey:", @"NSPadding");
    }
    if (self->_minimumWidth != 0.0) {
      objc_msgSend(a3, "encodeDouble:forKey:", @"NSMinWidth");
    }
    [a3 encodeInt:v6 forKey:@"NSTCFlags"];
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@ *** NSTextContainer does not support non-keyed coding.", _NSFullMethodName() format];
  }
}

- (NSTextContainer)initWithCoder:(NSCoder *)coder
{
  if ([(NSCoder *)coder allowsKeyedCoding])
  {
    [(NSTextContainer *)self _commonInit];
    self->_size = (CGSize)vdupq_n_s64(0x416312D000000000uLL);
    unsigned int v5 = [(NSCoder *)coder decodeIntForKey:@"NSTCFlags"];
    if ([(NSCoder *)coder containsValueForKey:@"NSWidth"])
    {
      [(NSCoder *)coder decodeDoubleForKey:@"NSWidth"];
      self->_size.double width = v6;
    }
    if ([(NSCoder *)coder containsValueForKey:@"NSHeight"])
    {
      [(NSCoder *)coder decodeDoubleForKey:@"NSHeight"];
      self->_size.double height = v7;
    }
    if ([(NSCoder *)coder containsValueForKey:@"NSPadding"])
    {
      [(NSCoder *)coder decodeDoubleForKey:@"NSPadding"];
      self->_lineFragmentPadding = v8;
    }
    BOOL v9 = [(NSCoder *)coder containsValueForKey:@"NSMinWidth"];
    double v10 = 0.0;
    if (v9) {
      [(NSCoder *)coder decodeDoubleForKey:@"NSMinWidth", 0.0];
    }
    self->_minimumWidth = v10;
    [(NSTextContainer *)self setWidthTracksTextView:v5 & 1];
    [(NSTextContainer *)self setHeightTracksTextView:(v5 >> 1) & 1];
    self->_layoutManager = (NSLayoutManager *)[(NSCoder *)coder decodeObjectOfClass:objc_opt_class() forKey:@"NSLayoutManager"];
    [(NSTextContainer *)self setTextLayoutManager:[(NSCoder *)coder decodeObjectOfClass:objc_opt_class() forKey:@"NSTextLayoutManager"]];
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@ *** NSTextContainer does not support non-keyed coding.", _NSFullMethodName() format];
  }
  return self;
}

- (void)setLayoutManager:(NSLayoutManager *)layoutManager
{
  if ([(NSTextContainer *)self _textViewAllowsMigratingToLayoutManager]) {
    [(NSTextContainerView *)self->_textView reconfigureWithLayoutManager:0 triggeredBySelector:sel_layoutManager];
  }
  self->_layoutManager = layoutManager;
  if (layoutManager)
  {
    self->_applicationFrameworkContext = [(NSLayoutManager *)layoutManager applicationFrameworkContext];
    objc_storeWeak((id *)&self->_textLayoutManager, 0);
  }
  else
  {
    self->_applicationFrameworkContext = _NSTextScalingTypeForCurrentEnvironment();
  }
  if ((NSTextContainer *)[(NSTextContainerView *)self->_textView textContainer] == self)
  {
    textView = self->_textView;
    [(NSTextContainerView *)textView setTextContainer:self];
  }
}

- (void)replaceLayoutManager:(NSLayoutManager *)newLayoutManager
{
  if (!newLayoutManager) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"*** %@: nil NSLayoutManager given.  You must supply a NSLayoutManager.", NSStringFromSelector(a2) format];
  }
  layoutManager = self->_layoutManager;
  if (layoutManager)
  {
    CGFloat v6 = [(NSLayoutManager *)layoutManager textContainers];
    uint64_t v7 = [(NSArray *)v6 count];
    double v8 = [(NSLayoutManager *)self->_layoutManager textStorage];
    if (v8)
    {
      BOOL v9 = v8;
      double v10 = v8;
      [(NSTextStorage *)v9 removeLayoutManager:self->_layoutManager];
      [(NSTextStorage *)v9 addLayoutManager:newLayoutManager];
    }
    while (v7)
    {
      --v7;
      uint64_t v11 = [(NSArray *)v6 objectAtIndex:0];
      [(NSLayoutManager *)self->_layoutManager removeTextContainerAtIndex:0];
      [(NSLayoutManager *)newLayoutManager addTextContainer:v11];
    }
  }
  else if (self->_textLayoutManager)
  {
    if ([(NSTextContainer *)self _textViewAllowsMigratingToLayoutManager])
    {
      textView = self->_textView;
      [(NSTextContainerView *)textView reconfigureWithLayoutManager:newLayoutManager triggeredBySelector:sel_replaceLayoutManager_];
    }
    else
    {
      NSUInteger v13 = [(NSTextLayoutManager *)self->_textLayoutManager textContentManager];
      double v14 = self;
      if (!v13
        || (objc_opt_respondsToSelector() & 1) == 0
        || (uint64_t v15 = (NSTextStorage *)(id)[(NSTextContentManager *)v13 textStorage]) == 0)
      {
        uint64_t v15 = objc_alloc_init(NSTextStorage);
      }
      [(NSTextContainer *)self setTextLayoutManager:0];
      [(NSTextStorage *)v15 addLayoutManager:newLayoutManager];
      [(NSLayoutManager *)newLayoutManager addTextContainer:self];

      uint64_t v16 = v15;
    }
  }
  else
  {
    [(NSLayoutManager *)newLayoutManager addTextContainer:self];
  }
}

- (BOOL)_hasLayoutManager:(id)a3
{
  return self->_layoutManager == a3;
}

- (void)setExclusionPaths:(NSArray *)exclusionPaths
{
  if (!-[NSArray isEqualToArray:](self->_exclusionPaths, "isEqualToArray:"))
  {
    unsigned int v5 = [(NSTextContainer *)self textLayoutManager];
    if (v5) {
      CGFloat v6 = 0;
    }
    else {
      CGFloat v6 = [(NSTextContainer *)self layoutManager];
    }

    self->_exclusionPaths = (NSArray *)[(NSArray *)exclusionPaths copy];
    cachedClippingAttributes = self->_cachedClippingAttributes;
    if (cachedClippingAttributes)
    {
      CFRelease(cachedClippingAttributes);
      self->_cachedClippingAttributes = 0;
    }
    cachedBounds = self->_cachedBounds;
    if (cachedBounds)
    {
      CFRelease(cachedBounds);
      self->_cachedBounds = 0;
    }
    if (v5)
    {
      [(NSTextLayoutManager *)v5 textContainerChangedGeometry:self];
    }
    else
    {
      if ([(NSTextStorage *)[(NSLayoutManager *)v6 textStorage] length])
      {
        BOOL v9 = [(NSLayoutManager *)v6 textContainers];
        uint64_t v16 = 0;
        uint64_t v17 = 0;
        uint64_t v10 = [(NSLayoutManager *)v6 textContainerForGlyphAtIndex:0 effectiveRange:&v16 withoutAdditionalLayout:1];
        if (v10)
        {
          uint64_t v11 = (NSTextContainer *)v10;
          if ([(NSArray *)v9 count] && v11 != self)
          {
            uint64_t v12 = v16;
            do
            {
              NSUInteger v13 = [(NSLayoutManager *)v6 textContainerForGlyphAtIndex:v12 effectiveRange:&v16 withoutAdditionalLayout:1];
              uint64_t v11 = v13;
              uint64_t v12 = v17 + v16;
              v16 += v17;
            }
            while (v13 && v13 != self);
          }
          double v14 = [(NSTextContainer *)v11 textView];
          if (v14)
          {
            uint64_t v15 = v14;
            [(NSTextView *)v14 bounds];
            -[NSTextView setNeedsDisplayInRect:avoidAdditionalLayout:](v15, "setNeedsDisplayInRect:avoidAdditionalLayout:", 0);
          }
        }
      }
      [(NSLayoutManager *)v6 textContainerChangedGeometry:self];
    }
  }
}

- (CGRect)lineFragmentRectForProposedRect:(CGRect)proposedRect atIndex:(NSUInteger)characterIndex writingDirection:(NSWritingDirection)baseWritingDirection remainingRect:(CGRect *)remainingRect
{
  double height = proposedRect.size.height;
  double width = self->_size.width;
  double v11 = self->_size.height;
  CGFloat v12 = *MEMORY[0x1E4F28AD8];
  CGFloat v13 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
  CGFloat v15 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
  CGFloat v14 = *(double *)(MEMORY[0x1E4F28AD8] + 24);
  if (width <= 0.0) {
    double v16 = proposedRect.size.width;
  }
  else {
    double v16 = self->_size.width;
  }
  if (width <= 0.0) {
    double x = proposedRect.origin.x;
  }
  else {
    double x = 0.0;
  }
  if (proposedRect.origin.y < 0.0) {
    double y = proposedRect.origin.y + 0.0 - proposedRect.origin.y;
  }
  else {
    double y = proposedRect.origin.y;
  }
  if (v11 > 0.0) {
    double v19 = 0.0;
  }
  else {
    double v19 = proposedRect.origin.y;
  }
  if (v11 > 0.0) {
    proposedRect.origin.double y = y;
  }
  double v22 = NSTCIntersectionRect(proposedRect.origin.x, proposedRect.origin.y, proposedRect.size.width, height, x, v19, v16);
  double v24 = v23;
  if (height - v21 <= 0.0001)
  {
    double v25 = v21;
    double v26 = v20;
  }
  else
  {
    double v25 = v14;
    double v26 = v15;
    double v24 = v13;
    double v22 = v12;
  }
  v76.origin.double x = v22;
  v76.origin.double y = v24;
  v76.size.double width = v26;
  v76.size.double height = v25;
  if (NSIsEmptyRect(v76) || ![(NSArray *)self->_exclusionPaths count])
  {
    CGFloat v32 = v14;
    CGFloat v52 = v15;
    CGFloat v53 = v13;
    if (!remainingRect) {
      goto LABEL_66;
    }
LABEL_65:
    remainingRect->origin.double x = v12;
    remainingRect->origin.double y = v53;
    remainingRect->size.double width = v52;
    remainingRect->size.double height = v32;
    goto LABEL_66;
  }
  memset(&rect, 0, sizeof(rect));
  [(NSTextContainer *)self minimumLineFragmentWidth];
  double v67 = v26;
  if (v27 <= v26) {
    double v28 = v27;
  }
  else {
    double v28 = 0.0;
  }
  v77.origin.double x = v12;
  v77.origin.double y = v13;
  v77.size.double width = v15;
  v77.size.double height = v14;
  if (NSIsEmptyRect(v77))
  {
    CFIndex v29 = 0;
    CFIndex v30 = 0;
    double cacheBoundsMinY = v13;
    double v63 = v22;
    double v22 = v12;
    double v65 = v13;
    CGFloat v66 = v12;
    double v60 = v15;
    CGFloat v61 = v12;
    double v64 = v15;
    double v31 = v14;
    CGFloat v32 = v14;
    do
    {
      double v59 = v32;
      while (1)
      {
        double v33 = self->_size.height;
        if (v24 > v33) {
          goto LABEL_71;
        }
        cachedBounds = self->_cachedBounds;
        if (cachedBounds && v24 == self->_cacheBoundsMinY && v25 + v24 == self->_cacheBoundsMaxY) {
          goto LABEL_37;
        }
        if (!self->_cachedBoundingPath)
        {
          CGFloat v35 = self->_size.width;
          uint64_t v36 = 0;
          uint64_t v37 = 0;
          self->_cachedBoundingPath = CGPathCreateWithRect(*(CGRect *)(&v33 - 3), 0);
        }
        if (!self->_cachedClippingAttributes)
        {
          v38 = [(NSTextContainer *)self exclusionPaths];
          CFIndex Count = CFArrayGetCount((CFArrayRef)v38);
          double v70 = 0.0;
          v71 = &v70;
          uint64_t v72 = 0x3052000000;
          v73 = __Block_byref_object_copy__13;
          v74 = __Block_byref_object_dispose__13;
          uint64_t v75 = 0;
          Mutable = CFArrayCreateMutable(0, Count, MEMORY[0x1E4F1D510]);
          v69[0] = MEMORY[0x1E4F143A8];
          v69[1] = 3221225472;
          v69[2] = ____NSCreateClippingAttributesForExclusionPaths_block_invoke;
          v69[3] = &unk_1E55C79A8;
          v69[4] = &v70;
          v69[5] = Mutable;
          [(NSArray *)v38 enumerateObjectsUsingBlock:v69];

          _Block_object_dispose(&v70, 8);
          self->_cachedClippingAttributes = Mutable;
        }
        self->_double cacheBoundsMinY = v24;
        self->_cacheBoundsMaxY = v25 + v24;
        v41 = self->_cachedBounds;
        if (v41) {
          CFRelease(v41);
        }
        cachedBounds = (__CFArray *)CTFramesetterCreateCGRectArray();
        self->_cachedBounds = cachedBounds;
        if (cachedBounds)
        {
LABEL_37:
          CFIndex v29 = CFArrayGetCount(cachedBounds);
          CFIndex v30 = 0;
        }
        if (v30 < v29)
        {
          CFIndex v42 = ~v30 + v29;
          do
          {
            if (baseWritingDirection) {
              CFIndex v43 = v42;
            }
            else {
              CFIndex v43 = v30;
            }
            ValueAtIndedouble x = (const __CFDictionary *)CFArrayGetValueAtIndex(self->_cachedBounds, v43);
            CGRectMakeWithDictionaryRepresentation(ValueAtIndex, &rect);
            double v45 = NSTCIntersectionRect(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, v63, v24, v67);
            CGFloat v13 = v65;
            double v22 = v66;
            CGFloat v15 = v64;
            CGFloat v14 = v31;
            if (v47 >= v28)
            {
              double v22 = v45;
              CGFloat v13 = v46;
              CGFloat v15 = v47;
              CGFloat v14 = v48;
            }
            ++v30;
            v78.origin.double x = v22;
            v78.origin.double y = v13;
            v78.size.double width = v15;
            v78.size.double height = v14;
            if (!NSIsEmptyRect(v78)) {
              break;
            }
            --v42;
          }
          while (v30 < v29);
        }
        v79.origin.double x = v22;
        v79.origin.double y = v13;
        v79.size.double width = v15;
        v79.size.double height = v14;
        if (!NSIsEmptyRect(v79)) {
          break;
        }
        double v70 = 0.0;
        if (v28 <= 0.0 || !CTFramesetterFindRectPosition() || (double v24 = v70, v70 == self->_cacheBoundsMinY))
        {
          v58 = self->_cachedBounds;
          if (v58) {
            CFRelease(v58);
          }
          self->_cachedBounds = 0;
LABEL_71:
          CGFloat v32 = v59;
          goto LABEL_72;
        }
        v80.origin.double x = v22;
        v80.origin.double y = v13;
        v80.size.double width = v15;
        v80.size.double height = v14;
        if (!NSIsEmptyRect(v80)) {
          goto LABEL_71;
        }
      }
      if (remainingRect && v30 < v29)
      {
        CFIndex v49 = baseWritingDirection ? v29 + ~v30 : v30;
        CFDictionaryRef v50 = (const __CFDictionary *)CFArrayGetValueAtIndex(self->_cachedBounds, v49);
        CGRectMakeWithDictionaryRepresentation(v50, &rect);
        if (!NSIsEmptyRect(rect))
        {
          double cacheBoundsMinY = self->_cacheBoundsMinY;
          double v59 = self->_cacheBoundsMaxY - cacheBoundsMinY;
          if (baseWritingDirection)
          {
            double v60 = rect.origin.x + rect.size.width;
            CGFloat v61 = 0.0;
          }
          else
          {
            double v60 = self->_size.width - rect.origin.x;
            CGFloat v61 = rect.origin.x;
          }
        }
      }
      double v24 = v25 + v24;
      v81.origin.double x = v22;
      v81.origin.double y = v13;
      v81.size.double width = v15;
      v81.size.double height = v14;
      BOOL v51 = NSIsEmptyRect(v81);
      CGFloat v32 = v59;
    }
    while (v51);
  }
  else
  {
    CGFloat v32 = v14;
    double v60 = v15;
    CGFloat v61 = v12;
    double cacheBoundsMinY = v13;
    double v22 = v12;
  }
LABEL_72:
  CGFloat v52 = v60;
  CGFloat v12 = v61;
  CGFloat v53 = cacheBoundsMinY;
  double v25 = v14;
  double v26 = v15;
  double v24 = v13;
  if (remainingRect) {
    goto LABEL_65;
  }
LABEL_66:
  double v54 = v22;
  double v55 = v24;
  double v56 = v26;
  double v57 = v25;
  result.size.double height = v57;
  result.size.double width = v56;
  result.origin.double y = v55;
  result.origin.double x = v54;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = +[NSTextContainer allocWithZone:a3];
  [(NSTextContainer *)self size];
  unsigned int v5 = -[NSTextContainer initWithSize:](v4, "initWithSize:");
  [(NSTextContainer *)v5 setExclusionPaths:[(NSTextContainer *)self exclusionPaths]];
  [(NSTextContainer *)v5 setLineBreakMode:[(NSTextContainer *)self lineBreakMode]];
  [(NSTextContainer *)self lineFragmentPadding];
  -[NSTextContainer setLineFragmentPadding:](v5, "setLineFragmentPadding:");
  [(NSTextContainer *)v5 setMaximumNumberOfLines:[(NSTextContainer *)self maximumNumberOfLines]];
  [(NSTextContainer *)v5 setWidthTracksTextView:[(NSTextContainer *)self widthTracksTextView]];
  [(NSTextContainer *)v5 setHeightTracksTextView:[(NSTextContainer *)self heightTracksTextView]];
  return v5;
}

- (CGRect)lineFragmentRectForProposedRect:(CGRect)a3 remainingRect:(CGRect *)a4
{
  -[NSTextContainer lineFragmentRectForProposedRect:atIndex:writingDirection:remainingRect:](self, "lineFragmentRectForProposedRect:atIndex:writingDirection:remainingRect:", 0, 0, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (BOOL)containsPoint:(NSPoint)point
{
  v4.size.double width = self->_size.width;
  v4.size.double height = self->_size.height;
  v4.origin.double x = 0.0;
  v4.origin.double y = 0.0;
  return NSPointInRect(point, v4);
}

- (void)setLayoutOrientation:(int64_t)a3
{
  [(NSTextContainer *)self textView];
  if (objc_opt_respondsToSelector())
  {
    double v5 = [(NSTextContainer *)self textView];
    [(NSTextView *)v5 setLayoutOrientation:a3];
  }
  else
  {
    self->_layoutOrientation = a3;
  }
}

- (id)selectedTextAttributes
{
  v2 = [(NSTextContainer *)self textView];
  if (objc_opt_respondsToSelector()) {
    id result = [(NSTextView *)v2 selectedTextAttributes];
  }
  else {
    id result = 0;
  }
  if (!result) {
    return (id)MEMORY[0x1E4F1CC08];
  }
  return result;
}

- (unint64_t)_textLength
{
  if ([(NSTextContainer *)self textLayoutManager])
  {
    __int16 v3 = [(NSTextContentManager *)[(NSTextLayoutManager *)[(NSTextContainer *)self textLayoutManager] textContentManager] documentRange];
    NSRect v4 = [(NSTextLayoutManager *)[(NSTextContainer *)self textLayoutManager] textContentManager];
    uint64_t v5 = [(NSTextRange *)v3 location];
    uint64_t v6 = [(NSTextRange *)v3 endLocation];
    return [(NSTextContentManager *)v4 offsetFromLocation:v5 toLocation:v6];
  }
  else if ([(NSTextContainer *)self layoutManager])
  {
    double v8 = [(NSLayoutManager *)[(NSTextContainer *)self layoutManager] textStorage];
    return [(NSTextStorage *)v8 length];
  }
  else
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (id)linkTextAttributes
{
  if (self->_textViewHasLinkTextAttributes) {
    return (id)[(NSTextContainerView *)self->_textView linkTextAttributes];
  }
  else {
    return 0;
  }
}

- (id)textHighlightRenderingAttributesForAttributes:(id)a3
{
  if (self->_textViewHasHighlightAttributes) {
    return (id)[(NSTextContainerView *)self->_textView textHighlightRenderingAttributesForAttributes:a3];
  }
  else {
    return 0;
  }
}

- (id)description
{
  __int16 v3 = NSString;
  NSRect v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  float width = self->_size.width;
  double v7 = width;
  __int16 tcFlags = (__int16)self->_tcFlags;
  if (tcFlags) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  if ((tcFlags & 2) != 0) {
    double v11 = @"YES";
  }
  else {
    double v11 = @"NO";
  }
  float height = self->_size.height;
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<%@: %p size = (%f,%f); widthTracksTextView = %@; heightTracksTextView = %@>; exclusionPaths = %p; lineBreakMode = %ld",
               v5,
               self,
               *(void *)&v7,
               height,
               v10,
               v11,
               [(NSTextContainer *)self exclusionPaths],
               [(NSTextContainer *)self lineBreakMode]);
}

- (void)setMinimumLineFragmentWidth:(double)a3
{
  self->_minimumWidth = a3;
}

- (double)minimumLineFragmentWidth
{
  return self->_minimumWidth;
}

- (void)coordinateAccess:(id)a3
{
}

- (BOOL)_containerObservesTextViewFrameChanges
{
  if (self->_applicationFrameworkContext == 2) {
    return (*(_WORD *)&self->_tcFlags >> 2) & 1;
  }
  else {
    LOBYTE(v2) = 0;
  }
  return v2;
}

- (void)_containerTextViewFrameChanged:(id)a3
{
  if (self->_applicationFrameworkContext == 2)
  {
    if (self->_textView) {
      -[NSTextContainer _resizeAccordingToTextView:](self, "_resizeAccordingToTextView:");
    }
  }
}

- (NSEdgeInsets)textContainerInsetsForView:(id)a3
{
  if (self->_applicationFrameworkContext == 2) {
    [(NSTextContainer *)self textContainerInsetsForView_macOS:a3];
  }
  else {
    [(NSTextContainer *)self textContainerInsetsForView_iOS:a3];
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

@end