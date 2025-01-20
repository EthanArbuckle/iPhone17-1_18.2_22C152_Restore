@interface BAXTextAccessibilityElement
- (BAXObjectWrapper)referenceElement;
- (BAXTextAccessibilityElement)initWithReferenceElement:(id)a3 container:(id)a4;
- (BAXTextAccessibilityElement)initWithReferenceElement:(id)a3 container:(id)a4 attributedValue:(id)a5 accessibilityFrame:(CGRect)a6;
- (BAXTextAccessibilityElement)nextNavigableElement;
- (BAXTextAccessibilityElement)previousNavigableElement;
- (BOOL)_accessibilityHasTextOperations;
- (BOOL)_accessibilityIncludeDuringContentReading;
- (BOOL)_accessibilityIsSpeakThisElement;
- (BOOL)_accessibilitySpeakThisCanBeHighlighted;
- (BOOL)_accessibilityTextOperationAction:(id)a3;
- (BOOL)accessibilitySupportsTextSelection;
- (BOOL)isVisible;
- (CGRect)accessibilityBoundsForTextMarkers:(id)a3;
- (CGRect)accessibilityFrameForLineNumber:(int64_t)a3;
- (NSTimer)_baxIsSettingSelectionTimer;
- (_NSRange)_accessibilityRangeForLineNumber:(int64_t)a3;
- (_NSRange)_accessibilityRangeForTextMarker:(id)a3;
- (_NSRange)_accessibilitySelectedTextRange;
- (_NSRange)_rangeForVisibleContent;
- (id)_accessibilityLineEndMarker:(id)a3;
- (id)_accessibilityLineStartMarker:(id)a3;
- (id)_accessibilityNextMarker:(id)a3;
- (id)_accessibilityObjectForTextMarker:(id)a3;
- (id)_accessibilityPreviousMarker:(id)a3;
- (id)_accessibilitySpeakThisString;
- (id)_accessibilityTextMarkerForPosition:(int64_t)a3;
- (id)_accessibilityTextMarkerRange;
- (id)_accessibilityTextMarkerRangeForSelection;
- (id)_accessibilityTextOperations;
- (id)_accessibilityTextRectsForSpeakThisStringRange:(_NSRange)a3 string:(id)a4 wantsSentences:(BOOL)a5;
- (id)_stringForVisibleContent;
- (id)accessibilityArrayOfTextForTextMarkers:(id)a3;
- (id)accessibilityAttributedContentForLineNumber:(int64_t)a3;
- (id)accessibilityContentForLineNumber:(int64_t)a3;
- (id)accessibilityNextTextNavigationElement;
- (id)accessibilityPreviousTextNavigationElement;
- (id)accessibilityStringForTextMarkers:(id)a3;
- (id)accessibilityTextualContext;
- (id)stringForTextMarkers:(id)a3;
- (id)textMarkerForPoint:(CGPoint)a3;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityDecreaseSelection:(id)a3;
- (void)_accessibilityIncreaseSelection:(id)a3;
- (void)_accessibilityModifySelection:(id)a3 increase:(BOOL)a4;
- (void)_accessibilityMoveSelectionToMarker:(id)a3;
- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3;
- (void)_baxSetIsSettingSelectionTimer:(id)a3;
- (void)_checkActions;
- (void)setNextNavigableElement:(id)a3;
- (void)setPreviousNavigableElement:(id)a3;
- (void)setReferenceElement:(id)a3;
- (void)trimElementSpanningPageBoundary;
@end

@implementation BAXTextAccessibilityElement

- (NSTimer)_baxIsSettingSelectionTimer
{
  return (NSTimer *)__BAXGetAssociatedObject(self, &unk_27220);
}

- (void)_baxSetIsSettingSelectionTimer:(id)a3
{
}

- (BAXTextAccessibilityElement)initWithReferenceElement:(id)a3 container:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)BAXTextAccessibilityElement;
    v8 = [(BAXTextAccessibilityElement *)&v13 initWithAccessibilityContainer:v7];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)BAXTextAccessibilityElement;
    v8 = [(BAXTextAccessibilityElement *)&v12 init];
  }
  v9 = v8;
  if (v8)
  {
    [(BAXTextAccessibilityElement *)v8 setReferenceElement:v6];
    v10 = [v6 accessibilityAttributedValue];
    [(BAXTextAccessibilityElement *)v9 setAccessibilityAttributedValue:v10];

    [v6 accessibilityFrame];
    -[BAXTextAccessibilityElement setAccessibilityFrame:](v9, "setAccessibilityFrame:");
    -[BAXTextAccessibilityElement setAccessibilityTraits:](v9, "setAccessibilityTraits:", [v6 accessibilityTraits]);
  }

  return v9;
}

- (BAXTextAccessibilityElement)initWithReferenceElement:(id)a3 container:(id)a4 attributedValue:(id)a5 accessibilityFrame:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (v14)
  {
    v20.receiver = self;
    v20.super_class = (Class)BAXTextAccessibilityElement;
    v16 = [(BAXTextAccessibilityElement *)&v20 initWithAccessibilityContainer:v14];
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)BAXTextAccessibilityElement;
    v16 = [(BAXTextAccessibilityElement *)&v19 init];
  }
  v17 = v16;
  if (v16)
  {
    [(BAXTextAccessibilityElement *)v16 setReferenceElement:v13];
    [(BAXTextAccessibilityElement *)v17 setAccessibilityAttributedValue:v15];
    -[BAXTextAccessibilityElement setAccessibilityFrame:](v17, "setAccessibilityFrame:", x, y, width, height);
    -[BAXTextAccessibilityElement setAccessibilityTraits:](v17, "setAccessibilityTraits:", [v13 accessibilityTraits]);
  }

  return v17;
}

- (unint64_t)accessibilityTraits
{
  v9.receiver = self;
  v9.super_class = (Class)BAXTextAccessibilityElement;
  unint64_t v3 = UIAccessibilityTraitWebContent | [(BAXTextAccessibilityElement *)&v9 accessibilityTraits];
  v4 = [(BAXTextAccessibilityElement *)self referenceElement];
  unint64_t v5 = (unint64_t)[v4 accessibilityTraits];
  UIAccessibilityTraits v6 = UIAccessibilityTraitHeader;

  if ((v6 & v5) != 0) {
    UIAccessibilityTraits v7 = v6;
  }
  else {
    UIAccessibilityTraits v7 = 0;
  }
  return v3 | v7;
}

- (id)accessibilityPreviousTextNavigationElement
{
  return [(BAXTextAccessibilityElement *)self previousNavigableElement];
}

- (id)accessibilityNextTextNavigationElement
{
  return [(BAXTextAccessibilityElement *)self nextNavigableElement];
}

- (_NSRange)_accessibilityRangeForTextMarker:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(BAXTextAccessibilityElement *)self referenceElement];
  id v6 = [v5 _accessibilityRangeForTextMarker:v4];
  NSUInteger v8 = v7;

  NSUInteger v9 = (NSUInteger)v6;
  NSUInteger v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (id)_accessibilityTextMarkerRange
{
  v2 = [(BAXTextAccessibilityElement *)self referenceElement];
  unint64_t v3 = [v2 _accessibilityTextMarkerRange];

  return v3;
}

- (id)stringForTextMarkers:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(BAXTextAccessibilityElement *)self referenceElement];
  id v6 = [v5 stringForTextMarkers:v4];

  return v6;
}

- (id)accessibilityStringForTextMarkers:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(BAXTextAccessibilityElement *)self referenceElement];
  id v6 = [v5 accessibilityStringForTextMarkers:v4];

  return v6;
}

- (_NSRange)_accessibilityRangeForLineNumber:(int64_t)a3
{
  unint64_t v5 = [(BAXTextAccessibilityElement *)self referenceElement];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    NSUInteger v7 = [(BAXTextAccessibilityElement *)self referenceElement];
    id v8 = [v7 _accessibilityRangeForLineNumber:a3];
    NSUInteger v10 = v9;

    NSUInteger v11 = (NSUInteger)v8;
    NSUInteger v12 = v10;
  }
  else
  {
    NSUInteger v11 = 0;
    NSUInteger v12 = 0;
  }
  result.length = v12;
  result.location = v11;
  return result;
}

- (id)accessibilityContentForLineNumber:(int64_t)a3
{
  unint64_t v5 = [(BAXTextAccessibilityElement *)self referenceElement];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    NSUInteger v7 = [(BAXTextAccessibilityElement *)self referenceElement];
    id v8 = [v7 accessibilityContentForLineNumber:a3];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)accessibilityAttributedContentForLineNumber:(int64_t)a3
{
  unint64_t v5 = [(BAXTextAccessibilityElement *)self referenceElement];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    NSUInteger v7 = [(BAXTextAccessibilityElement *)self referenceElement];
    id v8 = [v7 accessibilityAttributedContentForLineNumber:a3];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (CGRect)accessibilityFrameForLineNumber:(int64_t)a3
{
  unint64_t v5 = [(BAXTextAccessibilityElement *)self referenceElement];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    NSUInteger v7 = [(BAXTextAccessibilityElement *)self referenceElement];
    [v7 accessibilityFrameForLineNumber:a3];
    CGFloat x = v8;
    CGFloat y = v10;
    CGFloat width = v12;
    CGFloat height = v14;
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }
  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (CGRect)accessibilityBoundsForTextMarkers:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(BAXTextAccessibilityElement *)self referenceElement];
  [v5 accessibilityBoundsForTextMarkers:v4];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (id)_accessibilityLineEndMarker:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(BAXTextAccessibilityElement *)self referenceElement];
  double v6 = [v5 _accessibilityLineEndMarker:v4];

  return v6;
}

- (id)_accessibilityLineStartMarker:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(BAXTextAccessibilityElement *)self referenceElement];
  double v6 = [v5 _accessibilityLineStartMarker:v4];

  return v6;
}

- (id)accessibilityArrayOfTextForTextMarkers:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(BAXTextAccessibilityElement *)self referenceElement];
  double v6 = [v5 accessibilityArrayOfTextForTextMarkers:v4];

  return v6;
}

- (id)_accessibilityNextMarker:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(BAXTextAccessibilityElement *)self referenceElement];
  double v6 = [v5 _accessibilityNextMarker:v4];

  return v6;
}

- (id)_accessibilityPreviousMarker:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(BAXTextAccessibilityElement *)self referenceElement];
  double v6 = [v5 _accessibilityPreviousMarker:v4];

  return v6;
}

- (id)_accessibilityObjectForTextMarker:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(BAXTextAccessibilityElement *)self referenceElement];
  double v6 = [v5 _accessibilityObjectForTextMarker:v4];

  return v6;
}

- (id)_accessibilityTextMarkerForPosition:(int64_t)a3
{
  id v4 = [(BAXTextAccessibilityElement *)self referenceElement];
  unint64_t v5 = [v4 _accessibilityTextMarkerForPosition:a3];

  return v5;
}

- (BOOL)accessibilitySupportsTextSelection
{
  return 1;
}

- (BOOL)_accessibilityHasTextOperations
{
  return 1;
}

- (BOOL)_accessibilityTextOperationAction:(id)a3
{
  id v3 = a3;
  id v4 = +[BEAccessibilityReadingState currentReadingState];
  unint64_t v5 = [v4 performableOperations];

  unsigned int v6 = [v5 containsObject:v3];
  if (v6) {
    +[BEAXWebContentUtilities performNativeAction:v3];
  }

  return v6;
}

- (id)_accessibilityTextOperations
{
  v2 = +[BEAccessibilityReadingState currentReadingState];
  id v3 = [v2 performableOperations];

  return v3;
}

- (void)_accessibilityIncreaseSelection:(id)a3
{
  id v4 = a3;
  id v5 = [(BAXTextAccessibilityElement *)self referenceElement];
  [v5 _accessibilityIncreaseSelection:v4];
}

- (void)_accessibilityDecreaseSelection:(id)a3
{
  id v4 = a3;
  id v5 = [(BAXTextAccessibilityElement *)self referenceElement];
  [v5 _accessibilityDecreaseSelection:v4];
}

- (void)_accessibilityModifySelection:(id)a3 increase:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(BAXTextAccessibilityElement *)self referenceElement];
  [v7 _accessibilityModifySelection:v6 increase:v4];
}

- (_NSRange)_accessibilitySelectedTextRange
{
  v2 = [(BAXTextAccessibilityElement *)self referenceElement];
  id v3 = [v2 _accessibilitySelectedTextRange];
  NSUInteger v5 = v4;

  NSUInteger v6 = (NSUInteger)v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v5 = [(BAXTextAccessibilityElement *)self referenceElement];
  [v5 _accessibilitySetSelectedTextRange:location length];
}

- (id)_accessibilityTextMarkerRangeForSelection
{
  v2 = [(BAXTextAccessibilityElement *)self referenceElement];
  id v3 = [v2 _accessibilityTextMarkerRangeForSelection];

  return v3;
}

- (id)textMarkerForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(BAXTextAccessibilityElement *)self referenceElement];
  NSUInteger v6 = [v5 textMarkerForPoint:x, y];

  return v6;
}

- (void)_accessibilityMoveSelectionToMarker:(id)a3
{
  id v4 = a3;
  [(BAXTextAccessibilityElement *)self _checkActions];
  id v5 = [(BAXTextAccessibilityElement *)self referenceElement];
  [v5 _accessibilityMoveSelectionToMarker:v4];
}

- (BOOL)_accessibilityIncludeDuringContentReading
{
  return 1;
}

- (id)accessibilityTextualContext
{
  return UIAccessibilityTextualContextNarrative;
}

- (void)_checkActions
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_108CC;
  block[3] = &unk_20798;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)trimElementSpanningPageBoundary
{
  id v3 = [(BAXTextAccessibilityElement *)self _rangeForVisibleContent];
  uint64_t v5 = v4;
  NSUInteger v6 = [(BAXTextAccessibilityElement *)self referenceElement];
  [v6 attributedStringForRange:v3, v5];
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  [(BAXTextAccessibilityElement *)self setAccessibilityAttributedValue:v8];
  NSUInteger v7 = [(BAXTextAccessibilityElement *)self referenceElement];
  [v7 frameForRange:v3, v5];
  -[BAXTextAccessibilityElement setAccessibilityFrame:](self, "setAccessibilityFrame:");
}

- (BOOL)isVisible
{
  [(BAXTextAccessibilityElement *)self accessibilityFrame];
  double v4 = v3;
  [(BAXTextAccessibilityElement *)self accessibilityFrame];
  double v6 = v4 + v5;
  NSUInteger v7 = [(BAXTextAccessibilityElement *)self referenceElement];
  [v7 accessibilityVisibleContentRect];
  BOOL v9 = v6 > v8;

  double v10 = +[BEAccessibilityReadingState currentReadingState];
  [v10 secondaryVisibleContentRect];
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  v27.origin.double x = CGRectZero.origin.x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  BOOL v14 = CGRectEqualToRect(v25, v27);

  if (!v14)
  {
    [(BAXTextAccessibilityElement *)self accessibilityFrame];
    double v16 = v15;
    [(BAXTextAccessibilityElement *)self accessibilityFrame];
    double v18 = v16 + v17;
    double v19 = [(BAXTextAccessibilityElement *)self referenceElement];
    [v19 accessibilityVisibleContentRect];
    BOOL v9 = v18 < v20;
  }
  [(BAXTextAccessibilityElement *)self accessibilityFrame];
  v28.origin.double x = CGRectZero.origin.x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  BOOL v21 = CGRectEqualToRect(v26, v28);
  if (!v21 && v9)
  {
    v22 = [(BAXTextAccessibilityElement *)self referenceElement];
    [v22 accessibilityFrame];
    BOOL v21 = v23 == 0.0;
  }
  return !v21;
}

- (BOOL)_accessibilitySpeakThisCanBeHighlighted
{
  return 1;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  return 1;
}

- (id)_accessibilitySpeakThisString
{
  return [(BAXTextAccessibilityElement *)self _stringForVisibleContent];
}

- (id)_accessibilityTextRectsForSpeakThisStringRange:(_NSRange)a3 string:(id)a4 wantsSentences:(BOOL)a5
{
  BOOL v5 = a5;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a4;
  double v10 = [(BAXTextAccessibilityElement *)self referenceElement];
  double v11 = [v10 _accessibilityTextRectsForSpeakThisStringRange:location string:length wantsSentences:v9];

  return v11;
}

- (_NSRange)_rangeForVisibleContent
{
  double v3 = [(BAXTextAccessibilityElement *)self referenceElement];
  id v4 = [v3 accessibilityVisibleCharacterRange];
  NSUInteger v6 = v5;

  NSUInteger v7 = [(BAXTextAccessibilityElement *)self referenceElement];
  id v8 = [v7 elementTextRange];

  NSUInteger v9 = (NSUInteger)v4 + (void)v8;
  NSUInteger v10 = v6;
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (id)_stringForVisibleContent
{
  double v3 = [(BAXTextAccessibilityElement *)self referenceElement];
  id v4 = [(BAXTextAccessibilityElement *)self _rangeForVisibleContent];
  NSUInteger v6 = [v3 attributedStringForRange:v4, v5];

  NSUInteger v7 = [v6 string];

  return v7;
}

- (BAXTextAccessibilityElement)previousNavigableElement
{
  return self->_previousNavigableElement;
}

- (void)setPreviousNavigableElement:(id)a3
{
}

- (BAXTextAccessibilityElement)nextNavigableElement
{
  return self->_nextNavigableElement;
}

- (void)setNextNavigableElement:(id)a3
{
}

- (BAXObjectWrapper)referenceElement
{
  return self->_referenceElement;
}

- (void)setReferenceElement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceElement, 0);
  objc_storeStrong((id *)&self->_nextNavigableElement, 0);

  objc_storeStrong((id *)&self->_previousNavigableElement, 0);
}

@end