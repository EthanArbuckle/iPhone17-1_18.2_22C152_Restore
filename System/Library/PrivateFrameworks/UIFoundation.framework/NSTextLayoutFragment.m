@interface NSTextLayoutFragment
+ (BOOL)coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled;
+ (BOOL)supportsSecureCoding;
+ (NSSet)_validCoreTextRenderingAttributes;
+ (id)layoutFragmentQueue;
- (BOOL)_isEnumerationGap;
- (BOOL)_isRenderingAttributesValidated;
- (BOOL)_updateRangeInElement;
- (BOOL)coreTypesetter:(id)a3 isSimpleRectangularTextContainerForStartingCharacterAtIndex:(int64_t)a4;
- (BOOL)hasPartialLayout;
- (BOOL)isCountableDataSource;
- (BOOL)rendersTextCorrectionMarkers;
- (BOOL)supportsSubelements;
- (CGFloat)bottomMargin;
- (CGFloat)leadingPadding;
- (CGFloat)topMargin;
- (CGFloat)trailingPadding;
- (CGRect)coreTypesetter:(id)a3 lineFragmentRectForProposedRect:(CGRect)a4 atIndex:(int64_t)a5 writingDirection:(int64_t)a6 remainingRect:(CGRect *)a7;
- (CGRect)destinationBoundingRect;
- (CGRect)frameForTextAttachmentAtLocation:(id)location;
- (CGRect)layoutFragmentFrame;
- (CGRect)renderingSurfaceBounds;
- (CGRect)sourceBoundingRect;
- (CGSize)layoutSize;
- (NSArray)forcedLineBreaks;
- (NSArray)textAttachmentViewProviders;
- (NSArray)textLineFragments;
- (NSArray)textLineFragmentsExcludingExtra;
- (NSArray)truncatedRanges;
- (NSDictionary)extraLineFragmentAttributes;
- (NSLayoutManager)destinationLayoutManager;
- (NSOperationQueue)layoutQueue;
- (NSString)description;
- (NSTextAnimationKeyframe)keyframe;
- (NSTextElement)textElement;
- (NSTextLayoutFragment)init;
- (NSTextLayoutFragment)initWithCoder:(NSCoder *)coder;
- (NSTextLayoutFragment)initWithLayoutManager:(id)a3 characterRange:(_NSRange)a4 animationType:(unint64_t)a5 boundingRect:(CGRect)a6;
- (NSTextLayoutFragment)initWithTextElement:(NSTextElement *)textElement range:(NSTextRange *)rangeInElement;
- (NSTextLayoutFragment)layoutFragmentWithKeyframe:(id)a3;
- (NSTextLayoutFragmentState)state;
- (NSTextLayoutManager)textLayoutManager;
- (NSTextLineFragment)textLineFragmentForTextLocation:(id)textLocation isUpstreamAffinity:(BOOL)isUpstreamAffinity;
- (NSTextLineFragment)textLineFragmentForVerticalOffset:(CGFloat)verticalOffset requiresExactMatch:(BOOL)requiresExactMatch;
- (NSTextLocation)baseLocation;
- (NSTextParagraph)textParagraph;
- (NSTextRange)rangeInElement;
- (NSTextStorage)destinationTextStorage;
- (_NSRange)characterRange;
- (_NSRange)destinationGlyphRange;
- (_NSTextAttachmentLayoutContext)textAttachmentLayoutContext;
- (double)destinationVerticalDelta;
- (double)verticalOffsetOfTextLocation:(id)a3 withAffinity:(int64_t)a4;
- (id)_coreTextAttributes;
- (id)_createTruncatedTextRangesFromRanges:(id)a3 characterIndexDelta:(int64_t)a4;
- (id)_layoutInfoForTextAttachmentAtLocation:(id)a3;
- (id)_renderingAttributesForTextAnimationContextComponent:(unint64_t)a3 range:(_NSRange)a4 attributes:(id)a5 effectiveRange:(_NSRange *)a6;
- (id)_resolvedRenderingAttributesForCharacterIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)_textAttributesAffectingLayout;
- (id)_textContainerAtStringIndex:(int64_t)a3;
- (id)attributedStringForTruncatedRange:(id)a3 attributes:(id)a4;
- (id)coreTypesetter:(id)a3 attributedStringForTruncatedCharacterRange:(_NSRange *)a4 attributes:(id)a5 originalLineRef:(__CTLine *)a6;
- (id)layoutManager;
- (id)lineBreaks;
- (id)locationFromLocation:(id)a3 withOffset:(int64_t)a4;
- (id)representedRangeAtPoint:(CGPoint)a3;
- (id)textAttachmentViewProviderForLocation:(id)a3;
- (id)textLineFragmentForVerticalOffset:(double)a3 allowsSucceeding:(BOOL)a4;
- (int64_t)_baseWritingDirection;
- (int64_t)offsetFromLocation:(id)a3 toLocation:(id)a4;
- (unint64_t)animationType;
- (void)_initializeTextAttachmentLayoutContext;
- (void)_layout;
- (void)_resetLayoutFragmentFrame;
- (void)_setRangeInElement:(id)a3;
- (void)_setup;
- (void)_setupResolvedTextAttachmentFrames;
- (void)dealloc;
- (void)drawAtPoint:(CGPoint)a3 contentType:(unint64_t)a4;
- (void)drawAtPoint:(CGPoint)point inContext:(CGContextRef)context;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateRenderingAttributesFromLocation:(id)a3 reverse:(BOOL)a4 usingBlock:(id)a5;
- (void)enumerateViewportElementsFromLocation:(id)a3 options:(int64_t)a4 usingBlock:(id)a5;
- (void)estimateSize;
- (void)invalidateExtraLineFragment;
- (void)invalidateLayout;
- (void)invalidateRenderingAttributesForTextRange:(id)a3;
- (void)layout;
- (void)layoutManagerDidSetTemporaryAttributes:(id)a3 forTextRange:(id)a4;
- (void)removeRenderingAttribute:(id)a3 forTextRange:(id)a4;
- (void)setDestinationBoundingRect:(CGRect)a3;
- (void)setDestinationGlyphRange:(_NSRange)a3;
- (void)setDestinationLayoutManager:(id)a3;
- (void)setDestinationTextStorage:(id)a3;
- (void)setDestinationVerticalDelta:(double)a3;
- (void)setExtraLineFragmentAttributes:(id)a3;
- (void)setForcedLineBreaks:(id)a3;
- (void)setHasPartialLayout:(BOOL)a3;
- (void)setKeyframe:(id)a3;
- (void)setLayoutFragmentFrame:(CGRect)a3;
- (void)setLayoutFragmentFrameOrigin:(CGPoint)a3;
- (void)setLayoutQueue:(NSOperationQueue *)layoutQueue;
- (void)setRenderingAttribute:(id)a3 value:(id)a4 forTextRange:(id)a5;
- (void)setRenderingAttributes:(id)a3 forTextRange:(id)a4;
- (void)setRendersTextCorrectionMarkers:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)setTextAttachmentLayoutContext:(id)a3;
- (void)setTextAttachmentProvider:(id)a3 forLocation:(id)a4;
- (void)setTextElement:(id)a3;
- (void)setTextLayoutManager:(id)a3;
- (void)setTextLineFragments:(id)a3;
- (void)setTextLineFragmentsExcludingExtra:(id)a3;
- (void)set_renderingAttributesValidated:(BOOL)a3;
@end

@implementation NSTextLayoutFragment

- (NSTextRange)rangeInElement
{
  rangeInElement = self->_rangeInElement;
  if (!rangeInElement)
  {
    id Weak = objc_loadWeak((id *)&self->_textElement);
    v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(Weak, "childElements"), "firstObject"), "elementRange"), "location");
    v6 = (NSTextRange *)[Weak elementRange];
    rangeInElement = v6;
    if (v5 && (objc_msgSend(v5, "isEqual:", -[NSTextRange location](v6, "location")) & 1) == 0)
    {
      if (objc_msgSend(-[NSTextRange location](self->_contentRange, "location"), "isEqual:", -[NSTextRange location](rangeInElement, "location"))&& objc_msgSend(-[NSTextRange endLocation](self->_contentRange, "endLocation"), "isEqual:", v5))
      {
        rangeInElement = self->_contentRange;
      }
      else
      {

        rangeInElement = [[NSTextRange alloc] initWithLocation:[(NSTextRange *)rangeInElement location] endLocation:v5];
        self->_contentRange = rangeInElement;
      }
    }
    if (!rangeInElement)
    {
      if (rangeInElement_onceToken != -1) {
        dispatch_once(&rangeInElement_onceToken, &__block_literal_global);
      }
      return (NSTextRange *)rangeInElement_emptyRange;
    }
  }
  return rangeInElement;
}

- (NSTextLayoutFragmentState)state
{
  return self->_state;
}

- (CGRect)layoutFragmentFrame
{
  objc_sync_enter(self);
  CGFloat x = self->_layoutFragmentFrame.origin.x;
  CGFloat y = self->_layoutFragmentFrame.origin.y;
  CGFloat width = self->_layoutFragmentFrame.size.width;
  CGFloat height = self->_layoutFragmentFrame.size.height;
  objc_sync_exit(self);
  double v7 = x;
  double v8 = y;
  double v9 = width;
  double v10 = height;
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v9;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v7;
  return result;
}

- (NSArray)textLineFragments
{
  return (NSArray *)objc_getProperty(self, a2, 400, 1);
}

- (void)layout
{
  if ([(NSTextLayoutFragment *)self state] != NSTextLayoutFragmentStateLayoutAvailable
    && [(NSTextLayoutFragment *)self textElement])
  {
    v3 = [(NSTextLayoutFragment *)self layoutQueue];
    if (v3)
    {
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __30__NSTextLayoutFragment_layout__block_invoke;
      v4[3] = &unk_1E55C5470;
      v4[4] = self;
      [(NSOperationQueue *)v3 addOperationWithBlock:v4];
    }
    else
    {
      [(NSTextLayoutFragment *)self _layout];
    }
  }
}

- (NSOperationQueue)layoutQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 408, 1);
}

- (BOOL)_updateRangeInElement
{
  objc_sync_enter(self);
  if (self->_rangeInElement
    && (v3 = [(NSTextLayoutFragment *)self textElement],
        v4 = [(NSTextElement *)v3 textContentManager],
        v5 = [(NSTextElement *)v3 elementRange],
        int64_t offsetFromElementLocation = self->_offsetFromElementLocation,
        (int64_t v7 = offsetFromElementLocation
            - [(NSTextContentManager *)v4 offsetFromLocation:[(NSTextRange *)v5 location] toLocation:[(NSTextRange *)self->_rangeInElement location]]) != 0))
  {
    uint64_t v9 = [(NSTextContentManager *)v4 locationFromLocation:[(NSTextRange *)self->_rangeInElement location] withOffset:v7];
    uint64_t v10 = [(NSTextContentManager *)v4 locationFromLocation:[(NSTextRange *)self->_rangeInElement endLocation] withOffset:v7];
    v11 = 0;
    if (v9 && v10) {
      v11 = [[NSTextRange alloc] initWithLocation:v9 endLocation:v10];
    }

    self->_rangeInElement = v11;
    self->_contentRange = 0;
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }
  objc_sync_exit(self);
  return v8;
}

+ (BOOL)coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled
{
  if (coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled_onceToken != -1) {
    dispatch_once(&coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled_onceToken, &__block_literal_global_36);
  }
  return coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled_coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled;
}

- (void)setTextLayoutManager:(id)a3
{
  p_textLayoutManager = &self->_textLayoutManager;
  if (objc_loadWeak((id *)&self->_textLayoutManager) != a3)
  {
    objc_storeWeak((id *)p_textLayoutManager, a3);
  }
}

- (void)dealloc
{
  [(NSTextLayoutFragment *)self setTextLayoutManager:0];
  [(NSTextLayoutFragment *)self setTextElement:0];

  objc_storeWeak((id *)&self->_layoutManager, 0);
  v3.receiver = self;
  v3.super_class = (Class)NSTextLayoutFragment;
  [(NSTextLayoutFragment *)&v3 dealloc];
}

- (NSTextLayoutFragment)initWithTextElement:(NSTextElement *)textElement range:(NSTextRange *)rangeInElement
{
  v9.receiver = self;
  v9.super_class = (Class)NSTextLayoutFragment;
  v6 = [(NSTextLayoutFragment *)&v9 init];
  int64_t v7 = v6;
  if (v6)
  {
    [(NSTextLayoutFragment *)v6 setTextElement:textElement];
    if (rangeInElement
      && ![(NSTextRange *)rangeInElement isEqual:[(NSTextElement *)textElement elementRange]])
    {
      [(NSTextLayoutFragment *)v7 _setRangeInElement:rangeInElement];
    }
    v7->_rendersTextCorrectionMarkers = 1;
  }
  return v7;
}

- (void)setTextElement:(id)a3
{
  p_textElement = &self->_textElement;
  if (objc_loadWeak((id *)&self->_textElement) != a3)
  {
    objc_storeWeak((id *)p_textElement, a3);
    id Weak = objc_loadWeak((id *)p_textElement);
    if (Weak)
    {
      objc_loadWeak((id *)p_textElement);
      objc_opt_class();
      LOBYTE(Weak) = objc_opt_isKindOfClass();
    }
    self->_isTextParagraph = Weak & 1;
    if (!a3)
    {
      [(NSTextLayoutFragment *)self _setRangeInElement:0];

      self->_contentRange = 0;
    }
  }
}

- (void)_setRangeInElement:(id)a3
{
  objc_sync_enter(self);
  if (![(NSTextRange *)self->_rangeInElement isEqual:a3])
  {
    v5 = [(NSTextLayoutFragment *)self textElement];

    v6 = (NSTextRange *)a3;
    self->_rangeInElement = v6;
    if (v6) {
      self->_int64_t offsetFromElementLocation = [(NSTextContentManager *)[(NSTextElement *)v5 textContentManager] offsetFromLocation:[(NSTextRange *)[(NSTextElement *)v5 elementRange] location] toLocation:[(NSTextRange *)self->_rangeInElement location]];
    }
  }

  objc_sync_exit(self);
}

- (void)_resetLayoutFragmentFrame
{
  [(NSTextLayoutFragment *)self invalidateLayout];
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);

  -[NSTextLayoutFragment setLayoutFragmentFrame:](self, "setLayoutFragmentFrame:", v3, v4, v5, v6);
}

- (void)setTextLineFragmentsExcludingExtra:(id)a3
{
}

- (void)invalidateLayout
{
  if ((unint64_t)[(NSTextLayoutFragment *)self state] >= NSTextLayoutFragmentStateCalculatedUsageBounds)
  {
    [(NSTextLayoutFragment *)self setTextLineFragments:MEMORY[0x1E4F1CBF0]];
    [(NSTextLayoutFragment *)self setState:0];
    [(_NSTextAttachmentLayoutContext *)self->_textAttachmentLayoutContext reset];
    [(NSTextLayoutManager *)[(NSTextLayoutFragment *)self textLayoutManager] updateLayoutWithTextLayoutFragment:self addition:0];
    [(NSTextViewportLayoutController *)[(NSTextLayoutManager *)[(NSTextLayoutFragment *)self textLayoutManager] textViewportLayoutController] setNeedsLayout];

    self->_extraLineFragmentAttributes = 0;
    self->_truncatedRanges = 0;
  }

  [(NSTextLayoutFragment *)self setTextLineFragmentsExcludingExtra:0];
}

- (_NSTextAttachmentLayoutContext)textAttachmentLayoutContext
{
  return (_NSTextAttachmentLayoutContext *)objc_getProperty(self, a2, 88, 1);
}

- (id)_renderingAttributesForTextAnimationContextComponent:(unint64_t)a3 range:(_NSRange)a4 attributes:(id)a5 effectiveRange:(_NSRange *)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (self->_textAnimationContextState._effectiveAnimationContext)
  {
    p_ranges = &self->_textAnimationContextState._ranges;
    if ((self->_textAnimationContextState._inlineAnimationRanges
       || (p_ranges = ($6A4D90F590AF09559E5C4CC41648CD56 *)p_ranges->_inline[0].location) != 0)
      && ((NSRange v13 = p_ranges->_inline[0], p_ranges->_inline[0].location == 0x7FFFFFFFFFFFFFFFLL)
        ? (BOOL v14 = v13.length == 0)
        : (BOOL v14 = 0),
          !v14))
    {
      NSUInteger v15 = location + a4.length;
      p_NSUInteger length = &p_ranges->_inline[1].length;
      uint64_t v17 = 128;
      while (1)
      {
        if (v13.location >= v15)
        {
LABEL_16:
          BOOL v20 = 1;
          goto LABEL_19;
        }
        v27.NSUInteger location = location;
        v27.NSUInteger length = length;
        NSRange v18 = NSIntersectionRange(v27, v13);
        if (v18.length) {
          break;
        }
        NSRange v13 = *(NSRange *)(p_length - 1);
        p_length += 2;
        if (v13.location == 0x7FFFFFFFFFFFFFFFLL && v13.length == 0) {
          goto LABEL_16;
        }
      }
      if (v18.location == location) {
        uint64_t v17 = 120;
      }
      else {
        uint64_t v17 = 128;
      }
      BOOL v20 = v18.location != location;
      if (v18.location == location) {
        NSUInteger length = v18.length;
      }
      else {
        NSUInteger length = v18.length - v15 + v18.location;
      }
      if (v18.location != location) {
        NSUInteger location = v18.location;
      }
    }
    else
    {
      BOOL v20 = 1;
      uint64_t v17 = 128;
    }
LABEL_19:
    uint64_t v21 = *(uint64_t *)((char *)&self->super.isa + v17);
  }
  else
  {
    BOOL v20 = 1;
    uint64_t v21 = 0xFFFFLL;
  }
  a6->NSUInteger location = location;
  a6->NSUInteger length = length;
  if ((v21 & a3) == 0) {
    return 0;
  }
  effectiveAnimationContext = self->_textAnimationContextState._effectiveAnimationContext;
  uint64_t v23 = [(NSTextAnimationContext *)effectiveAnimationContext snapshotAttributeOverrides];
  if (v23)
  {
    v24 = (void *)(*(uint64_t (**)(uint64_t, NSTextAnimationContext *, unint64_t, BOOL))(v23 + 16))(v23, effectiveAnimationContext, a3, v20);
    if ([v24 count])
    {
      a5 = (id)[a5 mutableCopy];
      [a5 addEntriesFromDictionary:v24];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __109__NSTextLayoutFragment__renderingAttributesForTextAnimationContextComponent_range_attributes_effectiveRange___block_invoke;
      v26[3] = &unk_1E55C5588;
      v26[4] = a5;
      [a5 enumerateKeysAndObjectsUsingBlock:v26];
    }
  }
  return a5;
}

- (NSTextParagraph)textParagraph
{
  if (self->_isTextParagraph) {
    return (NSTextParagraph *)objc_loadWeak((id *)&self->_textElement);
  }
  else {
    return 0;
  }
}

- (NSArray)truncatedRanges
{
  return (NSArray *)objc_getProperty(self, a2, 432, 1);
}

- (CGRect)renderingSurfaceBounds
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  [(NSTextLayoutFragment *)self layoutFragmentFrame];
  double v4 = v3;
  CGFloat width = v5;
  CGFloat height = v7;
  if ([(id)objc_opt_class() coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled])
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    objc_super v9 = [(NSTextLayoutFragment *)self textLineFragments];
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v39;
      CGFloat y = 0.0;
      double x = v4;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v39 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v38 + 1) + 8 * i) boundsWithType:2 options:0];
          v50.origin.double x = v16;
          v50.origin.CGFloat y = v17;
          v50.size.CGFloat width = v18;
          v50.size.CGFloat height = v19;
          v45.origin.double x = x;
          v45.origin.CGFloat y = y;
          v45.size.CGFloat width = width;
          v45.size.CGFloat height = height;
          CGRect v46 = CGRectUnion(v45, v50);
          double x = v46.origin.x;
          CGFloat y = v46.origin.y;
          CGFloat width = v46.size.width;
          CGFloat height = v46.size.height;
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v11);
    }
    else
    {
      CGFloat y = 0.0;
      double x = v4;
    }
    double v20 = x - v4;
  }
  else
  {
    double v20 = *MEMORY[0x1E4F28AD8];
    CGFloat y = *(double *)(MEMORY[0x1E4F28AD8] + 8);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v21 = [(NSTextLayoutFragment *)self textLineFragments];
    uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v35 != v24) {
            objc_enumerationMutation(v21);
          }
          [*(id *)(*((void *)&v34 + 1) + 8 * j) boundsWithType:2 options:0];
          v51.origin.double x = v26;
          v51.origin.CGFloat y = v27;
          v51.size.CGFloat width = v28;
          v51.size.CGFloat height = v29;
          v47.origin.double x = v20;
          v47.origin.CGFloat y = y;
          v47.size.CGFloat width = width;
          v47.size.CGFloat height = height;
          CGRect v48 = CGRectUnion(v47, v51);
          double v20 = v48.origin.x;
          CGFloat y = v48.origin.y;
          CGFloat width = v48.size.width;
          CGFloat height = v48.size.height;
        }
        uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v23);
    }
  }
  double v30 = v20;
  double v31 = y;
  double v32 = width;
  double v33 = height;
  result.size.CGFloat height = v33;
  result.size.CGFloat width = v32;
  result.origin.CGFloat y = v31;
  result.origin.double x = v30;
  return result;
}

- (id)_createTruncatedTextRangesFromRanges:(id)a3 characterIndexDelta:(int64_t)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = [(NSTextLayoutFragment *)self textParagraph];
  uint64_t v23 = [(NSTextElement *)[(NSTextLayoutFragment *)self textElement] textContentManager];
  unint64_t v22 = [(NSTextRange *)[(NSTextElement *)[(NSTextLayoutFragment *)self textElement] elementRange] location];
  if (!(v7 | v22)) {
    return 0;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v8) {
    return 0;
  }
  uint64_t v9 = v8;
  id v10 = 0;
  uint64_t v11 = *(void *)v26;
  obuint64_t j = a3;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v26 != v11) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = [*(id *)(*((void *)&v25 + 1) + 8 * i) rangeValue];
      uint64_t v15 = v14;
      uint64_t v16 = v13 + a4;
      if (v7)
      {
        uint64_t v17 = [(id)v7 locationForCharacterIndex:v16 dataSourceLocationsOnly:0 actualRange:0];
        uint64_t v18 = [(id)v7 locationForCharacterIndex:v16 + v15 dataSourceLocationsOnly:0 actualRange:0];
      }
      else
      {
        uint64_t v17 = [(NSTextContentManager *)v23 locationFromLocation:v22 withOffset:v16];
        uint64_t v18 = [(NSTextContentManager *)v23 locationFromLocation:v17 withOffset:v15];
      }
      if (v17) {
        BOOL v19 = v18 == 0;
      }
      else {
        BOOL v19 = 1;
      }
      if (!v19)
      {
        double v20 = [[NSTextRange alloc] initWithLocation:v17 endLocation:v18];
        if (!v10) {
          id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        [v10 addObject:v20];
      }
    }
    uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  }
  while (v9);
  return v10;
}

- (void)_layout
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  if (self->_isTextParagraph
    && [(NSTextLayoutFragment *)self state] != NSTextLayoutFragmentStateLayoutAvailable
    && [(NSTextLayoutFragment *)self textElement])
  {
    double v3 = [(NSTextLayoutFragment *)self textParagraph];
    NSUInteger v97 = [(NSArray *)self->_textLineFragmentsExcludingExtra count];
    if ([(NSTextParagraph *)v3 isEndOfParagraph]) {
      BOOL v95 = [(NSTextElement *)v3 isEndOfDocument];
    }
    else {
      BOOL v95 = 0;
    }
    unsigned int v96 = [(id)objc_opt_class() coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled];
    uint64_t v121 = 0;
    v122 = &v121;
    uint64_t v123 = 0x3052000000;
    v124 = __Block_byref_object_copy__0;
    v125 = __Block_byref_object_dispose__0;
    id v126 = 0;
    if (v97) {
      id v4 = (id)[(NSArray *)self->_textLineFragmentsExcludingExtra mutableCopy];
    }
    else {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    id v126 = v4;
    id v5 = [(NSTextLayoutManager *)[(NSTextLayoutFragment *)self textLayoutManager] textContainerForLocation:[(NSTextRange *)[(NSTextElement *)[(NSTextLayoutFragment *)self textElement] elementRange] location]];
    double v6 = v5;
    if (v5)
    {
      [v5 size];
      double v8 = v7;
      double v10 = v9;
      uint64_t v11 = [v6 layoutOrientation];
      [v6 lineFragmentPadding];
      double v94 = v12;
    }
    else
    {
      uint64_t v11 = 0;
      double v8 = *MEMORY[0x1E4F28AE0];
      double v10 = *(double *)(MEMORY[0x1E4F28AE0] + 8);
      double v94 = 0.0;
    }
    [(NSTextLayoutFragment *)self leadingPadding];
    double v14 = v13;
    [(NSTextLayoutFragment *)self trailingPadding];
    double v16 = v15;
    [(NSTextLayoutFragment *)self layoutFragmentFrame];
    double v18 = v17;
    BOOL v19 = [(NSTextLayoutFragment *)self textLayoutManager];
    id v87 = [(NSTextRange *)[(NSTextElement *)v3 elementRange] location];
    BOOL v20 = [(NSTextLayoutFragment *)self rendersTextCorrectionMarkers];
    BOOL v21 = [(NSTextLayoutManager *)v19 usesFontLeading];
    char v22 = objc_msgSend(-[NSTextRange location](-[NSTextElement elementRange](v3, "elementRange"), "location"), "isEqual:", -[NSTextRange location](-[NSTextLayoutFragment rangeInElement](self, "rangeInElement"), "location"));
    uint64_t v117 = 0;
    v118 = &v117;
    uint64_t v119 = 0x2020000000;
    char v120 = 0;
    [(NSTextLayoutFragment *)self topMargin];
    double v91 = v23;
    [(NSTextLayoutFragment *)self bottomMargin];
    double v25 = v24;
    long long v26 = [(NSTextParagraph *)v3 attributedString];
    uint64_t v111 = 0;
    v112 = (CGFloat *)&v111;
    uint64_t v113 = 0x4010000000;
    v114 = "";
    long long v27 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    long long v115 = *MEMORY[0x1E4F1DB28];
    long long v116 = v27;
    double v93 = v25;
    if (v97)
    {
      if (v95)
      {
        long long v28 = (void *)[objc_allocWithZone((Class)_NSCachedAttributedString) initWithAttributedString:v26];
        uint64_t v89 = [v28 length];
        objc_msgSend((id)objc_msgSend((id)v122[5], "lastObject"), "typographicBounds");
        uint64_t v90 = 0;
        double v18 = v18 + CGRectGetMaxY(v129);
      }
      else
      {
        uint64_t v89 = 0;
        uint64_t v90 = 0;
        long long v28 = 0;
      }
      [(NSTextLayoutFragment *)self layoutFragmentFrame];
      double MinX = CGRectGetMinX(v130);
      id v30 = [(NSAttributedString *)v26 attribute:@"NSParagraphStyle" atIndex:0 effectiveRange:0];
      double v31 = MinX - v94;
      if (v30)
      {
        [v30 paragraphSpacing];
        double v33 = v32;
        if (v32 != 0.0
          && [(NSTextParagraph *)v3 isEndOfParagraph]
          && objc_msgSend(-[NSTextRange endLocation](-[NSTextLayoutFragment rangeInElement](self, "rangeInElement"), "endLocation"), "isEqual:", -[NSTextRange endLocation](-[NSTextElement elementRange](v3, "elementRange"), "endLocation")))
        {
          BOOL v34 = [(NSTextElement *)v3 isEndOfDocument];
          uint64_t v92 = 0;
          double v35 = -0.0;
          if (!v34) {
            double v35 = v33;
          }
          double v93 = v25 + v35;
        }
        else
        {
          uint64_t v92 = 0;
        }
      }
      else
      {
        uint64_t v92 = 0;
        double v33 = 0.0;
      }
    }
    else
    {
      if (v22)
      {
        long long v28 = (void *)[objc_allocWithZone((Class)_NSCachedAttributedString) initWithAttributedString:v26];
        uint64_t v92 = 0;
      }
      else
      {
        uint64_t v92 = [(NSTextParagraph *)v3 rangeForLocation:[(NSTextRange *)[(NSTextLayoutFragment *)self rangeInElement] location] allowsTrailingEdge:1];
        long long v28 = objc_msgSend(objc_allocWithZone((Class)_NSCachedAttributedString), "initWithAttributedString:", -[NSAttributedString attributedSubstringFromRange:](v26, "attributedSubstringFromRange:", v92, -[NSAttributedString length](v26, "length") - v92));
      }
      uint64_t v90 = [v28 length];
      [v28 beginEditing];
      uint64_t v36 = [v28 length];
      v109[0] = MEMORY[0x1E4F143A8];
      v109[1] = 3221225472;
      v109[2] = __31__NSTextLayoutFragment__layout__block_invoke;
      v109[3] = &unk_1E55C53D0;
      v109[4] = v3;
      v109[5] = self;
      v109[6] = v28;
      v109[7] = v19;
      BOOL v110 = v21;
      objc_msgSend(v28, "enumerateAttributesInRange:options:usingBlock:", 0, v36, 0x100000, v109);
      [(NSTextLayoutManager *)v19 _prepareAttributedString:v28 forTextLayoutFragment:self];
      [v28 endEditing];
      uint64_t v89 = 0;
      double v33 = 0.0;
      if ([v28 length])
      {
        long long v37 = (void *)[v28 attribute:@"NSParagraphStyle" atIndex:0 effectiveRange:0];
        long long v38 = v37;
        if (v37)
        {
          [v37 paragraphSpacingBefore];
          double v40 = v39;
          if (v39 != 0.0
            && [(NSTextParagraph *)v3 isBeginningOfParagraph]
            && objc_msgSend(v87, "isEqual:", -[NSTextRange location](-[NSTextLayoutFragment rangeInElement](self, "rangeInElement"), "location")))
          {
            BOOL v41 = [(NSTextElement *)v3 isBeginningOfDocument];
            double v42 = -0.0;
            if (!v41) {
              double v42 = v40;
            }
            double v91 = v91 + v42;
          }
          [v38 paragraphSpacing];
          double v44 = v43;
          if (v43 != 0.0
            && [(NSTextParagraph *)v3 isEndOfParagraph]
            && objc_msgSend(-[NSTextRange endLocation](-[NSTextLayoutFragment rangeInElement](self, "rangeInElement"), "endLocation"), "isEqual:", -[NSTextRange endLocation](-[NSTextElement elementRange](v3, "elementRange"), "endLocation")))
          {
            BOOL v45 = [(NSTextElement *)v3 isEndOfDocument];
            double v46 = -0.0;
            if (!v45) {
              double v46 = v44;
            }
            double v93 = v25 + v46;
          }
        }
      }
      double v31 = 0.0;
    }
    if (v95)
    {
      id v47 = [(NSArray *)[(NSTextLayoutManager *)v19 textSelections] firstObject];
      CGRect v48 = objc_msgSend((id)objc_msgSend(v47, "textRanges"), "firstObject");
      uint64_t v49 = [(NSTextRange *)[(NSTextContentManager *)[(NSTextLayoutManager *)v19 textContentManager] documentRange] endLocation];
      if (v48)
      {
        uint64_t v50 = v49;
        if ([v48 isEmpty])
        {
          if (objc_msgSend((id)objc_msgSend(v48, "location"), "isEqual:", v50))
          {
            CGRect v51 = (void *)[v47 typingAttributes];
            if ([v51 count]) {
              [(NSTextLayoutFragment *)self setExtraLineFragmentAttributes:v51];
            }
          }
        }
      }
    }
    if (v14 == 0.0 && v16 == 0.0 || [(NSTextLayoutFragment *)self _baseWritingDirection])
    {
      double v52 = v18;
      double v53 = v14;
    }
    else
    {
      double v52 = v18;
      double v53 = v16;
      double v16 = v14;
    }
    BOOL v88 = v20;
    long long v107 = 0u;
    long long v108 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    v54 = (void *)v122[5];
    uint64_t v55 = [v54 countByEnumeratingWithState:&v105 objects:v127 count:16];
    if (v55)
    {
      uint64_t v56 = *(void *)v106;
      do
      {
        for (uint64_t i = 0; i != v55; ++i)
        {
          if (*(void *)v106 != v56) {
            objc_enumerationMutation(v54);
          }
          [*(id *)(*((void *)&v105 + 1) + 8 * i) typographicBounds];
          CGFloat updated = __NSTextLayoutFragmentUpdateTotalBoundsWithTypographicBounds(v58, v59, v60, v61, v112[4], v112[5], v112[6], v112[7]);
          v63 = v112;
          v112[4] = updated;
          *((void *)v63 + 5) = v64;
          *((void *)v63 + 6) = v65;
          *((void *)v63 + 7) = v66;
        }
        uint64_t v55 = [v54 countByEnumeratingWithState:&v105 objects:v127 count:16];
      }
      while (v55);
    }
    if (v28)
    {
      v67 = objc_alloc_init(NSCoreTypesetter);
      [(NSTextLayoutManager *)v19 _configureCoreTypesetter:v67 forTextParagraph:v3 textContainer:v6];
      [(NSTypesetter *)v67 setAttributedString:v28];
      -[NSCoreTypesetter setCharacterRange:](v67, "setCharacterRange:", v89, v90);
      -[NSCoreTypesetter setTextContainerSize:](v67, "setTextContainerSize:", v8 - (v53 + v16), v10);
      [(NSCoreTypesetter *)v67 setRequiresCTLineRef:[(NSTextLayoutManager *)v19 requiresCTLineRef]];
      [(NSCoreTypesetter *)v67 setWantsExtraLineFragment:v95];
      if ([(NSTextLayoutFragment *)self extraLineFragmentAttributes]) {
        [(NSCoreTypesetter *)v67 set_extraLineFragmentAttributes:[(NSTextLayoutFragment *)self extraLineFragmentAttributes]];
      }
      [(NSCoreTypesetter *)v67 setKeyframe:[(NSTextLayoutFragment *)self keyframe]];
      [(NSCoreTypesetter *)v67 setForcedLineBreaks:[(NSTextLayoutFragment *)self forcedLineBreaks]];
      uint64_t v68 = [v6 maximumNumberOfLines];
      if (v68 >= 1)
      {
        if ([(NSTextLayoutManager *)v19 _currentTextLayoutFragmentEnumerated] == self)
        {
          uint64_t v69 = [(NSTextLayoutManager *)v19 _numberOfLinesToCurrentlyEnumeratedTextLayoutFragment];
          uint64_t v68 = v68 - v69 - [(id)v122[5] count];
        }
        [(NSCoreTypesetter *)v67 setMaximumNumberOfLines:v68];
      }
      -[NSCoreTypesetter setContainerBreakMode:](v67, "setContainerBreakMode:", [v6 lineBreakMode]);
      -[NSCoreTypesetter setEnforcesMinimumTextLineFragment:](v67, "setEnforcesMinimumTextLineFragment:", objc_msgSend(-[NSTextRange location](-[NSTextLayoutFragment rangeInElement](self, "rangeInElement"), "location"), "isEqual:", -[NSTextRange location](-[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](v19, "textContentManager"), "documentRange"), "location")));
      [(NSCoreTypesetter *)v67 setTypographicBoundsIncludesLineFragmentPadding:v96];
      [(NSCoreTypesetter *)v67 setLayoutOrientation:v11];
      [(NSTypesetter *)v67 setLineFragmentPadding:v94];
      [(NSTextLayoutManager *)v19 delegate];
      if (objc_opt_respondsToSelector())
      {
        location[1] = (id)MEMORY[0x1E4F143A8];
        location[2] = (id)3221225472;
        location[3] = __31__NSTextLayoutFragment__layout__block_invoke_2;
        location[4] = &unk_1E55C53F8;
        location[5] = v19;
        location[6] = v3;
        location[7] = v87;
      }
      -[NSCoreTypesetter setValidateLineBreakIndex:](v67, "setValidateLineBreakIndex:");
      [(NSCoreTypesetter *)v67 setDelegate:self];
      objc_initWeak(location, self);
      v99[0] = MEMORY[0x1E4F143A8];
      v99[1] = 3221225472;
      v99[2] = __31__NSTextLayoutFragment__layout__block_invoke_3;
      v99[3] = &unk_1E55C5420;
      v100[1] = *(id *)&v16;
      v100[2] = *(id *)&v91;
      BOOL v101 = v97 != 0;
      char v102 = v96;
      v100[3] = *(id *)&v31;
      v100[4] = *(id *)&v33;
      v99[4] = &v121;
      v99[5] = &v117;
      objc_copyWeak(v100, location);
      BOOL v103 = v88;
      v99[6] = &v111;
      [(NSCoreTypesetter *)v67 setLaidOutLineFragment:v99];
      [(_NSTextAttachmentLayoutContext *)self->_textAttachmentLayoutContext setTextContainer:v6];
      [(NSCoreTypesetter *)v67 layoutWithYOrigin:v52];
      v70 = [(NSTextLayoutFragment *)self _createTruncatedTextRangesFromRanges:[(NSCoreTypesetter *)v67 truncatedRanges] characterIndexDelta:v92];

      objc_destroyWeak(v100);
      objc_destroyWeak(location);
    }
    else
    {
      v70 = 0;
    }
    [(NSTextLayoutFragment *)self setTextLineFragments:v122[5]];
    v71 = v112;
    double v72 = v53 + v112[6];
    double v73 = v93 + v112[7];
    v112[6] = v72;
    v71[7] = v73;
    if (v8 > 0.0)
    {
      if (v72 >= v8) {
        double v72 = v8;
      }
      v71[6] = v72;
    }
    if (v10 > 0.0)
    {
      if (v73 >= v10) {
        double v73 = v10;
      }
      v71[7] = v73;
    }
    if ([(id)v122[5] count])
    {
      if (v96)
      {
        v74 = v112;
        double v75 = v112[4];
      }
      else
      {
        v76 = (void *)v122[5];
        v98[0] = MEMORY[0x1E4F143A8];
        v98[1] = 3221225472;
        v98[2] = __31__NSTextLayoutFragment__layout__block_invoke_4;
        v98[3] = &unk_1E55C5448;
        v98[4] = &v111;
        [v76 enumerateObjectsUsingBlock:v98];
        v74 = v112;
        double v75 = v94 + v31 + v112[4];
        v112[4] = v75;
      }
      -[NSTextLayoutFragment setLayoutFragmentFrame:](self, "setLayoutFragmentFrame:", v75, v74[5], v74[6], v74[7]);
      [(NSTextLayoutFragment *)self setState:3];
      if ((v96 & 1) == 0) {
        [(_NSTextAttachmentLayoutContext *)self->_textAttachmentLayoutContext invalidateAttachmentFrames];
      }
      if (!v97)
      {
        v77 = (void *)[(id)v122[5] lastObject];
        uint64_t v78 = [(NSTextContentManager *)[(NSTextLayoutManager *)v19 textContentManager] offsetFromLocation:[(NSTextRange *)[(NSTextParagraph *)v3 paragraphContentRange] location] toLocation:[(NSTextRange *)[(NSTextParagraph *)v3 paragraphContentRange] endLocation]];
        if (*((unsigned char *)v118 + 24))
        {
          BOOL v79 = 1;
        }
        else
        {
          unint64_t v80 = v78;
          uint64_t v81 = [v77 characterRange];
          BOOL v79 = v82 + v92 + v81 < v80;
        }
        [(NSTextLayoutFragment *)self setHasPartialLayout:v79];
        if ([(NSTextLayoutFragment *)self hasPartialLayout])
        {
          uint64_t v83 = [v77 characterRange];
          uint64_t v85 = [(NSTextParagraph *)v3 locationForCharacterIndex:v84 + v92 + v83 actualRange:0];
          if (v85)
          {
            v86 = [[NSTextRange alloc] initWithLocation:[(NSTextRange *)[(NSTextLayoutFragment *)self rangeInElement] location] endLocation:v85];
            [(NSTextLayoutFragment *)self _setRangeInElement:v86];
          }
        }
      }
    }
    if (![(NSTextLayoutFragment *)self keyframe]) {
      [(NSTextLayoutManager *)v19 updateLayoutWithTextLayoutFragment:self addition:1];
    }

    self->_truncatedRanges = v70;
    _Block_object_dispose(&v111, 8);
    _Block_object_dispose(&v117, 8);
    _Block_object_dispose(&v121, 8);
  }
}

- (NSTextAnimationKeyframe)keyframe
{
  return (NSTextAnimationKeyframe *)objc_getProperty(self, a2, 224, 1);
}

- (void)setLayoutFragmentFrameOrigin:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  objc_sync_enter(self);
  -[NSTextLayoutFragment setLayoutFragmentFrame:](self, "setLayoutFragmentFrame:", x, y, self->_layoutFragmentFrame.size.width, self->_layoutFragmentFrame.size.height);

  objc_sync_exit(self);
}

- (void)setLayoutFragmentFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  objc_sync_enter(self);
  self->_layoutFragmentFrame.origin.CGFloat x = x;
  self->_layoutFragmentFrame.origin.CGFloat y = y;
  self->_layoutFragmentFrame.size.CGFloat width = width;
  self->_layoutFragmentFrame.size.CGFloat height = height;

  objc_sync_exit(self);
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (void)estimateSize
{
  double v3 = [(NSTextLayoutFragment *)self textLayoutManager];
  id v4 = [(NSTextLayoutManager *)v3 textContainerForLocation:[(NSTextRange *)[(NSTextElement *)[(NSTextLayoutFragment *)self textElement] elementRange] location]];
  if (v4)
  {
    [v4 size];
    double v6 = v5;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F28AE0];
  }
  NSTextLayoutFragmentState v7 = [(NSTextLayoutFragment *)self state];
  if (v3)
  {
    NSTextLayoutFragmentState v8 = v7;
    if (v7 <= NSTextLayoutFragmentStateEstimatedUsageBounds)
    {
      [(NSTextLayoutFragment *)self layoutFragmentFrame];
      CGFloat x = v23.origin.x;
      CGFloat y = v23.origin.y;
      CGFloat width = v23.size.width;
      CGFloat height = v23.size.height;
      if (CGRectEqualToRect(v23, *MEMORY[0x1E4F1DB28])
        || v8 == NSTextLayoutFragmentStateEstimatedUsageBounds
        && (v24.origin.CGFloat x = x,
            v24.origin.CGFloat y = y,
            v24.size.CGFloat width = width,
            v24.size.CGFloat height = height,
            CGRectGetWidth(v24) != v6)
        && ![(NSArray *)[(NSTextLayoutFragment *)self textLineFragmentsExcludingExtra] count])
      {
        [(NSTextLayoutFragment *)self layoutFragmentFrame];
        double v14 = v13;
        [(NSTextElement *)[(NSTextLayoutFragment *)self textElement] estimatedIntrinsicContentSizeForTextLayoutManager:v3];
        double v16 = v15;
        double v18 = v17;
        [(NSTextLayoutFragment *)self topMargin];
        double v20 = v19;
        [(NSTextLayoutFragment *)self bottomMargin];
        -[NSTextLayoutFragment setLayoutFragmentFrame:](self, "setLayoutFragmentFrame:", 0.0, v14, v16, v18 + v20 + v21);
      }
      [(NSTextLayoutFragment *)self setState:1];
    }
  }
}

- (id)_textContainerAtStringIndex:(int64_t)a3
{
  double v5 = [(NSTextLayoutFragment *)self textLayoutManager];
  if (!v5) {
    return 0;
  }
  double v6 = v5;
  NSTextLayoutFragmentState v7 = [(NSTextElement *)[(NSTextLayoutFragment *)self textElement] elementRange];
  uint64_t v8 = [(NSTextRange *)v7 location];
  id v9 = (id)v8;
  if (a3 >= 1)
  {
    if (self->_isTextParagraph) {
      id v10 = [(NSTextParagraph *)[(NSTextLayoutFragment *)self textParagraph] locationForCharacterIndex:a3 dataSourceLocationsOnly:0 actualRange:0];
    }
    else {
      id v10 = [(NSTextLayoutManager *)v6 locationFromLocation:v8 withOffset:a3];
    }
    id v9 = v10;
    if (v10 && [(NSTextRange *)v7 containsLocation:v10]) {
      goto LABEL_10;
    }
    return 0;
  }
  if (!v8) {
    return 0;
  }
LABEL_10:

  return [(NSTextLayoutManager *)v6 textContainerForLocation:v9];
}

- (NSTextElement)textElement
{
  return (NSTextElement *)objc_loadWeak((id *)&self->_textElement);
}

- (void)setTextLineFragments:(id)a3
{
}

- (BOOL)hasPartialLayout
{
  return self->_hasPartialLayout;
}

- (id)_resolvedRenderingAttributesForCharacterIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4
{
  NSTextLayoutFragmentState v7 = [(NSTextLayoutFragment *)self textParagraph];
  uint64_t v8 = [(NSTextLayoutFragment *)self textLayoutManager];
  id v9 = [(NSTextLayoutFragment *)self rangeInElement];
  id v10 = v9;
  if (v7) {
    uint64_t v11 = [(NSTextParagraph *)v7 locationForCharacterIndex:a3 dataSourceLocationsOnly:0 actualRange:0];
  }
  else {
    uint64_t v11 = [(NSTextLayoutManager *)v8 locationFromLocation:[(NSTextRange *)v9 location] withOffset:a3];
  }
  uint64_t v12 = v11;
  uint64_t v51 = 0;
  double v52 = &v51;
  uint64_t v53 = 0x3052000000;
  v54 = __Block_byref_object_copy__0;
  uint64_t v55 = __Block_byref_object_dispose__0;
  uint64_t v56 = 0;
  double v13 = &v45;
  uint64_t v45 = 0;
  double v46 = &v45;
  uint64_t v47 = 0x3052000000;
  CGRect v48 = __Block_byref_object_copy__0;
  uint64_t v49 = __Block_byref_object_dispose__0;
  uint64_t v50 = 0;
  uint64_t v41 = 0;
  double v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  if (!v11) {
    goto LABEL_26;
  }
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __85__NSTextLayoutFragment__resolvedRenderingAttributesForCharacterIndex_effectiveRange___block_invoke;
  v40[3] = &unk_1E55C54E8;
  v40[4] = v11;
  v40[5] = &v51;
  v40[6] = &v45;
  v40[7] = &v41;
  [(NSTextLayoutFragment *)self enumerateRenderingAttributesFromLocation:v11 reverse:0 usingBlock:v40];
  if (a3 >= 1 && !*((unsigned char *)v42 + 24))
  {
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __85__NSTextLayoutFragment__resolvedRenderingAttributesForCharacterIndex_effectiveRange___block_invoke_2;
    v39[3] = &unk_1E55C5510;
    v39[4] = v10;
    v39[5] = &v45;
    [(NSTextLayoutFragment *)self enumerateRenderingAttributesFromLocation:v12 reverse:1 usingBlock:v39];
  }
  long long v38 = v10;
  id v14 = [(NSTextLayoutManager *)v8 _selectionAndMarkedTextAttributesForLocation:v12 inTextRange:v10 effectiveTextRange:&v38];
  if (v38 && !-[NSTextRange isEmpty](v38, "isEmpty") && ([(id)v46[5] isEqual:v38] & 1) == 0)
  {
    uint64_t v15 = [v14 count];
    double v16 = v38;
    if (v15) {
      goto LABEL_12;
    }
    if (![(NSTextRange *)v10 isEqual:v38])
    {
      long long v37 = (void *)v46[5];
      if (v37 && ([v37 isEmpty] & 1) == 0) {
        double v16 = (NSTextRange *)[(id)v46[5] textRangeByIntersectingWithTextRange:v38];
      }
      else {
        double v16 = v38;
      }
LABEL_12:
      if (v16)
      {

        double v17 = v16;
        v46[5] = (uint64_t)v17;
      }
    }
  }
  if ([v14 count] && !objc_msgSend(v14, "objectForKeyedSubscript:", NSMarkedClauseSegmentAttributeName))
  {
    double v18 = (void *)[v14 objectForKeyedSubscript:@"NSBackgroundColor"];
    if (v18)
    {
      if (objc_msgSend(v18, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CA98], "null")))
      {
        double v18 = 0;
      }
      else
      {
        id v14 = (id)[v14 mutableCopy];
        objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"NSBackgroundColor");
        double v18 = v14;
      }
    }
    uint64_t v19 = [(id)v52[5] count];
    double v20 = (void *)v52[5];
    if (v19)
    {
      id v21 = (id)[v20 mutableCopy];
      [v21 addEntriesFromDictionary:v14];
    }
    else
    {

      id v21 = v14;
    }

    v52[5] = (uint64_t)v21;
  }
  double v13 = v46;
LABEL_26:
  if (a4)
  {
    *a4 = (_NSRange)xmmword_18E5F72A0;
    char v22 = (void *)v13[5];
    if (v22)
    {
      CGRect v23 = [(NSTextLayoutManager *)v8 textContentManager];
      uint64_t v24 = [(NSTextRange *)v10 location];
      uint64_t v25 = [v22 location];
      if (v7)
      {
        uint64_t v26 = [(NSTextParagraph *)v7 rangeForLocation:v25 allowsTrailingEdge:0];
        NSUInteger v27 = 0x7FFFFFFFFFFFFFFFLL;
        if (v26 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v28 = -[NSTextParagraph rangeForLocation:allowsTrailingEdge:](v7, "rangeForLocation:allowsTrailingEdge:", [v22 endLocation], 1);
LABEL_34:
          if (v28 == 0x7FFFFFFFFFFFFFFFLL) {
            NSUInteger v29 = 0;
          }
          else {
            NSUInteger v29 = v28 - v26;
          }
          if (v28 == 0x7FFFFFFFFFFFFFFFLL) {
            NSUInteger v27 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            NSUInteger v27 = v26;
          }
          goto LABEL_40;
        }
      }
      else
      {
        uint64_t v26 = [(NSTextContentManager *)v23 offsetFromLocation:v24 toLocation:v25];
        NSUInteger v27 = 0x7FFFFFFFFFFFFFFFLL;
        if (v26 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v28 = -[NSTextContentManager offsetFromLocation:toLocation:](v23, "offsetFromLocation:toLocation:", v24, [v22 endLocation]);
          goto LABEL_34;
        }
      }
      NSUInteger v29 = 0;
LABEL_40:
      a4->NSUInteger location = v27;
      a4->NSUInteger length = v29;
      double v13 = v46;
    }
  }

  if (v8)
  {
    BOOL v30 = [(NSTextLayoutManager *)v8 rendersBackgroundColorAttribute];
    double v31 = v52;
    if (!v30)
    {
      uint64_t v32 = [(id)v52[5] objectForKeyedSubscript:@"NSBackgroundColor"];
      double v31 = v52;
      if (!v32)
      {
        double v33 = (void *)[(id)v52[5] mutableCopy];
        objc_msgSend(v33, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"NSBackgroundColor");

        double v31 = v52;
        v52[5] = (uint64_t)v33;
      }
    }
  }
  else
  {
    double v31 = v52;
  }
  BOOL v34 = (void *)v31[5];
  if (v34) {
    id v35 = v34;
  }
  else {
    id v35 = (id)MEMORY[0x1E4F1CC08];
  }
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);
  return v35;
}

- (void)enumerateRenderingAttributesFromLocation:(id)a3 reverse:(BOOL)a4 usingBlock:(id)a5
{
  BOOL v6 = a4;
  id v9 = [(NSTextLayoutFragment *)self textLayoutManager];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__NSTextLayoutFragment_enumerateRenderingAttributesFromLocation_reverse_usingBlock___block_invoke;
  v10[3] = &unk_1E55C5498;
  v10[4] = self;
  v10[5] = a5;
  [(NSTextLayoutManager *)v9 enumerateTemporaryAttributesFromLocation:a3 reverse:v6 usingBlock:v10];
}

- (NSTextLayoutManager)textLayoutManager
{
  return (NSTextLayoutManager *)objc_loadWeak((id *)&self->_textLayoutManager);
}

- (NSDictionary)extraLineFragmentAttributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 424, 1);
}

- (void)setHasPartialLayout:(BOOL)a3
{
  self->_hasPartialLayout = a3;
}

- (BOOL)rendersTextCorrectionMarkers
{
  return self->_rendersTextCorrectionMarkers;
}

- (NSArray)forcedLineBreaks
{
  return (NSArray *)objc_getProperty(self, a2, 232, 1);
}

- (CGFloat)topMargin
{
  return 0.0;
}

- (CGFloat)bottomMargin
{
  return 0.0;
}

- (CGFloat)trailingPadding
{
  return 0.0;
}

- (CGFloat)leadingPadding
{
  return 0.0;
}

- (void)setExtraLineFragmentAttributes:(id)a3
{
}

- (NSArray)textAttachmentViewProviders
{
  CGRect result = [(_NSTextAttachmentLayoutContext *)self->_textAttachmentLayoutContext textAttachmentViewProviders];
  if (!result) {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return result;
}

- (void)setTextAttachmentProvider:(id)a3 forLocation:(id)a4
{
  id v5 = [(NSTextLayoutFragment *)self _layoutInfoForTextAttachmentAtLocation:a4];

  [v5 setTextAttachmentViewProvider:a3];
}

- (CGRect)frameForTextAttachmentAtLocation:(id)location
{
  id v4 = [(NSTextLayoutFragment *)self _layoutInfoForTextAttachmentAtLocation:location];
  if (v4)
  {
    id v5 = v4;
    [(NSTextLayoutFragment *)self _setupResolvedTextAttachmentFrames];
    [v5 resolvedAttachmentFrame];
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.CGFloat height = v9;
  result.size.CGFloat width = v8;
  result.origin.CGFloat y = v7;
  result.origin.CGFloat x = v6;
  return result;
}

- (void)_setupResolvedTextAttachmentFrames
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  double v3 = [(NSTextLayoutFragment *)self textParagraph];
  objc_initWeak(&location, self);
  textAttachmentLayoutContext = self->_textAttachmentLayoutContext;
  if (textAttachmentLayoutContext)
  {
    if (![(_NSTextAttachmentLayoutContext *)textAttachmentLayoutContext hasResolvedAttachmentFrame])
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v5 = [(NSTextLayoutFragment *)self textLineFragments];
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v20 != v7) {
              objc_enumerationMutation(v5);
            }
            double v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            [v9 typographicBounds];
            uint64_t v11 = v10;
            [v9 typographicBounds];
            double v13 = v12;
            uint64_t v14 = [v9 characterRange];
            uint64_t v16 = v15;
            v17[0] = MEMORY[0x1E4F143A8];
            v17[1] = 3221225472;
            v17[2] = __58__NSTextLayoutFragment__setupResolvedTextAttachmentFrames__block_invoke;
            v17[3] = &unk_1E55C5560;
            v17[4] = v3;
            objc_copyWeak(v18, &location);
            v18[1] = v11;
            v18[2] = v13;
            objc_msgSend(v9, "_enumerateTextAttachmentFramesInCharacterRange:usingBlock:", v14, v16, v17);
            objc_destroyWeak(v18);
          }
          uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v6);
      }
    }
  }
  objc_destroyWeak(&location);
}

void __58__NSTextLayoutFragment__setupResolvedTextAttachmentFrames__block_invoke(uint64_t a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12 = *(void **)(a1 + 32);
  if (v12) {
    double v13 = (NSCountableTextLocation *)(id)[v12 locationForCharacterIndex:a7 dataSourceLocationsOnly:0 actualRange:0];
  }
  else {
    double v13 = [[NSCountableTextLocation alloc] initWithIndex:a7];
  }
  uint64_t v15 = v13;
  uint64_t v14 = (void *)[objc_loadWeak((id *)(a1 + 40)) _layoutInfoForTextAttachmentAtLocation:v13];
  if (v14)
  {
    v17.origin.CGFloat x = a2 + *(double *)(a1 + 48);
    v17.origin.CGFloat y = a3;
    v17.size.CGFloat width = a4;
    v17.size.CGFloat height = a5;
    objc_msgSend(v14, "setAttachmentFrameOrigin:", v17.origin.x, a3 + *(double *)(a1 + 56) - CGRectGetHeight(v17));
  }
}

uint64_t __31__NSTextLayoutFragment__layout__block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = [a1[4] locationForCharacterIndex:a3 dataSourceLocationsOnly:0 actualRange:0];
  if (!*((void *)a1[5] + 11)
    && [a2 objectForKeyedSubscript:@"CTAdaptiveImageProvider"]
    && objc_msgSend((id)objc_msgSend(a1[6], "string"), "characterAtIndex:", a3) == 65532)
  {
    id v15 = a1[5];
    objc_sync_enter(v15);
    [a1[5] _initializeTextAttachmentLayoutContext];
    objc_sync_exit(v15);
  }
  else
  {
    uint64_t v9 = [a2 objectForKeyedSubscript:@"NSAttachment"];
    if (v9)
    {
      id v10 = (void *)v9;
      if (objc_msgSend((id)objc_msgSend(a1[6], "string"), "characterAtIndex:", a3) == 65532)
      {
        uint64_t v11 = (void *)[a1[5] _layoutInfoForTextAttachmentAtLocation:v8];
        if ([v10 _isEmojiImage])
        {
          id v12 = a1[6];
          uint64_t v13 = *MEMORY[0x1E4F243C0];
          uint64_t v14 = v10;
        }
        else
        {
          uint64_t v16 = [v10 adaptiveImageGlyph];
          if (v16)
          {
            uint64_t v14 = (void *)v16;
            id v12 = a1[6];
            CGRect v17 = (uint64_t *)MEMORY[0x1E4F243C0];
          }
          else
          {
            uint64_t v18 = [v11 runDelegate];
            if (!v18) {
              goto LABEL_15;
            }
            uint64_t v14 = (void *)v18;
            id v12 = a1[6];
            CGRect v17 = (uint64_t *)MEMORY[0x1E4F247B0];
          }
          uint64_t v13 = *v17;
        }
        objc_msgSend(v12, "addAttribute:value:range:", v13, v14, a3, a4);
      }
    }
  }
LABEL_15:
  uint64_t v19 = [a2 objectForKeyedSubscript:@"NSLink"];
  if (v19)
  {
    long long v20 = (void *)[a1[7] renderingAttributesForLink:v19 atLocation:v8];
    if (v20)
    {
      long long v21 = v20;
      long long v22 = objc_msgSend(v20, "allKeysForObject:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"));
      if ([v22 count])
      {
        long long v21 = (void *)[v21 mutableCopy];
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v41 count:16];
        if (v23)
        {
          uint64_t v24 = *(void *)v38;
          do
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v38 != v24) {
                objc_enumerationMutation(v22);
              }
              uint64_t v26 = *(void *)(*((void *)&v37 + 1) + 8 * i);
              [v21 removeObjectForKey:v26];
              objc_msgSend(a1[6], "removeAttribute:range:", v26, a3, a4);
            }
            uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v41 count:16];
          }
          while (v23);
        }
        NSUInteger v27 = v21;
      }
      else
      {
        NSUInteger v27 = 0;
      }
      objc_msgSend(a1[6], "addAttributes:range:", v21, a3, a4);
    }
  }
  uint64_t result = [a2 objectForKeyedSubscript:@"NSSuperScript"];
  NSUInteger v29 = (void *)result;
  if (result)
  {
    if (!a2) {
      goto LABEL_33;
    }
    BOOL v30 = (void *)[a2 objectForKey:@"NSFont"];
    if (objc_msgSend((id)objc_msgSend(a2, "objectForKey:", @"CTVerticalForms"), "BOOLValue")) {
      BOOL v30 = (void *)[v30 verticalFont];
    }
    if (!v30)
    {
LABEL_33:
      BOOL v30 = NSDefaultFont();
      if (!v30) {
        BOOL v30 = NSDefaultFont();
      }
    }
    [v30 _defaultLineHeightForUILayout];
    double v32 = v31;
    uint64_t v33 = [v29 integerValue];
    BOOL v34 = (void *)[a2 objectForKeyedSubscript:@"NSBaselineOffset"];
    double v35 = ceil((v32 + 0.0) * (double)v33 * 0.4);
    if (v34)
    {
      [v34 doubleValue];
      double v35 = v35 + v36;
    }
    return objc_msgSend(a1[6], "addAttribute:value:range:", @"NSBaselineOffset", objc_msgSend(NSNumber, "numberWithDouble:", v35), a3, a4);
  }
  return result;
}

- (id)textAttachmentViewProviderForLocation:(id)a3
{
  id v3 = [(NSTextLayoutFragment *)self _layoutInfoForTextAttachmentAtLocation:a3];

  return (id)[v3 textAttachmentViewProvider];
}

- (id)_layoutInfoForTextAttachmentAtLocation:(id)a3
{
  rangeInElement = self->_rangeInElement;
  if (!rangeInElement) {
    rangeInElement = [(NSTextElement *)[(NSTextLayoutFragment *)self textElement] elementRange];
  }
  if (![(NSTextRange *)rangeInElement containsLocation:a3]) {
    return 0;
  }
  uint64_t v6 = [(NSTextLayoutFragment *)self textParagraph];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = [(NSTextParagraph *)v6 rangeForLocation:a3 allowsTrailingEdge:0];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  uint64_t v9 = [(NSAttributedString *)[(NSTextParagraph *)v7 attributedString] attributesAtIndex:v8 effectiveRange:0];
  if (![(NSDictionary *)v9 objectForKeyedSubscript:@"NSAttachment"]) {
    return 0;
  }
  objc_sync_enter(self);
  [(NSTextLayoutFragment *)self _initializeTextAttachmentLayoutContext];
  id v10 = [(_NSTextAttachmentLayoutContext *)self->_textAttachmentLayoutContext textAttachmentLayoutInfoForLocation:a3 attributes:v9];
  objc_sync_exit(self);
  return v10;
}

- (void)_initializeTextAttachmentLayoutContext
{
  if (!self->_textAttachmentLayoutContext)
  {
    id v3 = objc_alloc_init(_NSTextAttachmentLayoutContext);
    self->_textAttachmentLayoutContext = v3;
    [(_NSTextAttachmentLayoutContext *)v3 setTextLayoutFragment:self];
  }
}

uint64_t __80__NSTextLayoutFragment_coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled__block_invoke()
{
  v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "valueForKey:", @"NSTextLayoutFragmentCoordinateSystemCompatibilityFor2022AndEarlierSDKEnabled");
  if (v0) {
    uint64_t result = [v0 BOOLValue];
  }
  else {
    uint64_t result = dyld_program_sdk_at_least() ^ 1;
  }
  coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled_coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled = result;
  return result;
}

- (BOOL)coreTypesetter:(id)a3 isSimpleRectangularTextContainerForStartingCharacterAtIndex:(int64_t)a4
{
  id v4 = [(NSTextLayoutFragment *)self _textContainerAtStringIndex:a4];
  if (!v4) {
    return 1;
  }

  return [v4 isSimpleRectangularTextContainer];
}

uint64_t __31__NSTextLayoutFragment__layout__block_invoke_3(uint64_t a1, void *a2, char a3)
{
  [a2 typographicBounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = *(double *)(a1 + 64) + v10;
  double v13 = v12 + *(double *)(a1 + 72);
  if ((a3 & 1) != 0 && *(unsigned char *)(a1 + 96))
  {
    uint64_t v14 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) lastObject];
    [a2 setIsExtra:1];
    if (!*(unsigned char *)(a1 + 97)) {
      double v11 = v11 - *(double *)(a1 + 80);
    }
    if (v14)
    {
      [v14 typographicBounds];
      double v13 = v13 + CGRectGetMaxY(v23) + *(double *)(a1 + 88);
    }
  }
  if ((a3 & 2) != 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  objc_msgSend(a2, "setTypographicBounds:", v11, v13, v7, v9);
  [a2 setTextLayoutFragment:objc_loadWeak((id *)(a1 + 56))];
  [a2 setRendersTextCorrectionMarkers:*(unsigned __int8 *)(a1 + 98)];
  CGFloat updated = __NSTextLayoutFragmentUpdateTotalBoundsWithTypographicBounds(v11, v13, v7, v9, *(CGFloat *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), *(CGFloat *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(CGFloat *)(*(void *)(*(void *)(a1 + 48) + 8) + 48), *(CGFloat *)(*(void *)(*(void *)(a1 + 48) + 8) + 56));
  uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
  *(CGFloat *)(v16 + 32) = updated;
  *(void *)(v16 + 40) = v17;
  *(void *)(v16 + 48) = v18;
  *(void *)(v16 + 56) = v19;
  long long v20 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);

  return [v20 addObject:a2];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textElement);

  objc_destroyWeak((id *)&self->_textLayoutManager);
}

uint64_t __31__NSTextLayoutFragment__layout__block_invoke_4(uint64_t a1, void *a2)
{
  [a2 typographicBounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10 - CGRectGetMinX(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32));

  return objc_msgSend(a2, "setTypographicBounds:", v11, v5, v7, v9);
}

- (void)drawAtPoint:(CGPoint)point inContext:(CGContextRef)context
{
  double y = point.y;
  double x = point.x;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([(NSTextLayoutFragment *)self textElement])
  {
    if ((unint64_t)[(NSTextLayoutFragment *)self state] <= NSTextLayoutFragmentStateCalculatedUsageBounds) {
      [(NSTextLayoutFragment *)self layout];
    }
    rangeInElement = self->_rangeInElement;
    if (!rangeInElement) {
      rangeInElement = [(NSTextElement *)[(NSTextLayoutFragment *)self textElement] elementRange];
    }
    double v9 = objc_msgSend(objc_loadWeak((id *)&self->_textLayoutManager), "_textAnimationContextForLocation:", -[NSTextRange location](rangeInElement, "location"));
    double v10 = v9;
    if (!v9 || [v9 _hasRenderableComponentsForRange:rangeInElement])
    {
      __NSTextLayoutFragmentConfigureForTextAnimationContext((uint64_t)self, v10);
      CGContextSaveGState(context);
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      double v11 = [(NSTextLayoutFragment *)self textLineFragments];
      uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v11);
            }
            id v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            if (!v10
              || objc_msgSend(v10, "_hasRenderableComponentsForRange:", objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "textLineFragmentRange")))
            {
              [v15 typographicBounds];
              double v17 = v16;
              [v15 typographicBounds];
              objc_msgSend(v15, "drawAtPoint:inContext:", context, x + v17, y + v18);
            }
          }
          uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v12);
      }
      __NSTextLayoutFragmentConfigureForTextAnimationContext((uint64_t)self, 0);
      CGContextRestoreGState(context);
    }
  }
}

- (CGSize)layoutSize
{
  [(NSTextLayoutFragment *)self layoutFragmentFrame];
  double v3 = v2;
  double v5 = v4;
  result.CGFloat height = v5;
  result.CGFloat width = v3;
  return result;
}

- (NSTextLayoutFragment)init
{
  return 0;
}

NSCountableTextRange *__38__NSTextLayoutFragment_rangeInElement__block_invoke()
{
  CGSize result = -[NSCountableTextRange initWithRange:]([NSCountableTextRange alloc], "initWithRange:", 0, 0);
  rangeInElement_emptyRange = (uint64_t)result;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSTextLayoutFragment)initWithCoder:(NSCoder *)coder
{
  if ([(NSCoder *)coder allowsKeyedCoding])
  {
    [(NSTextLayoutFragment *)self setTextLayoutManager:[(NSCoder *)coder decodeObjectOfClass:objc_opt_class() forKey:@"NS.textLayoutManager"]];
    [(NSTextLayoutFragment *)self setTextElement:[(NSCoder *)coder decodeObjectOfClass:objc_opt_class() forKey:@"NS.textElement"]];
    [(NSTextLayoutFragment *)self _setRangeInElement:[(NSCoder *)coder decodeObjectOfClass:objc_opt_class() forKey:@"NS.rangeInElement"]];
    [(NSTextLayoutFragment *)self setLayoutQueue:[(NSCoder *)coder decodeObjectOfClass:objc_opt_class() forKey:@"NS.layoutQueue"]];
  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    double v5 = [(NSTextLayoutFragment *)self textElement];
    if (v5)
    {
      double v6 = v5;
      objc_msgSend(a3, "encodeObject:forKey:", -[NSTextLayoutFragment textLayoutManager](self, "textLayoutManager"), @"NS.textLayoutManager");
      [a3 encodeObject:v6 forKey:@"NS.textElement"];
      [a3 encodeObject:self->_rangeInElement forKey:@"NS.rangeInElement"];
      double v7 = [(NSTextLayoutFragment *)self layoutQueue];
      [a3 encodeObject:v7 forKey:@"NS.layoutQueue"];
    }
  }
}

- (NSTextLineFragment)textLineFragmentForTextLocation:(id)textLocation isUpstreamAffinity:(BOOL)isUpstreamAffinity
{
  BOOL v4 = isUpstreamAffinity;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if ([(NSTextLayoutFragment *)self state] != NSTextLayoutFragmentStateLayoutAvailable) {
    return 0;
  }
  double v7 = [(NSTextLayoutFragment *)self textLineFragments];
  unint64_t v8 = [(NSArray *)v7 count];
  if ([(NSTextRange *)[(NSTextLayoutFragment *)self rangeInElement] containsLocation:textLocation])
  {
    double v9 = [(NSTextLayoutFragment *)self textParagraph];
    double v10 = (NSTextLineFragment *)v9;
    if (v9) {
      uint64_t v11 = [(NSTextParagraph *)v9 rangeForLocation:textLocation allowsTrailingEdge:1];
    }
    else {
      uint64_t v11 = -[NSTextLayoutManager offsetFromLocation:toLocation:](-[NSTextLayoutFragment textLayoutManager](self, "textLayoutManager"), "offsetFromLocation:toLocation:", objc_msgSend(-[NSTextLayoutFragment representedRange](self, "representedRange"), "location"), textLocation);
    }
    unint64_t v14 = v11;
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v8 > 0xA)
      {
        if (v10)
        {
          CGRect v23 = [[__NSScratchTextLineFragment alloc] initWithString:[(NSAttributedString *)[(NSTextLineFragment *)v10 attributedString] string] characterIndex:v11];
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __75__NSTextLayoutFragment_textLineFragmentForTextLocation_isUpstreamAffinity___block_invoke;
          v25[3] = &unk_1E55C5380;
          v25[4] = v23;
          v25[5] = v14;
          BOOL v26 = v4;
          unint64_t v24 = -[NSArray indexOfObject:inSortedRange:options:usingComparator:](v7, "indexOfObject:inSortedRange:options:usingComparator:", v23, 0, v8, 256, v25);

          double v10 = 0;
          if (v24 < v8) {
            return (NSTextLineFragment *)[(NSArray *)v7 objectAtIndexedSubscript:v24];
          }
        }
        return v10;
      }
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v15 = [(NSTextLayoutFragment *)self textLineFragments];
      uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v28;
LABEL_20:
        uint64_t v19 = 0;
        while (1)
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(v15);
          }
          double v10 = *(NSTextLineFragment **)(*((void *)&v27 + 1) + 8 * v19);
          uint64_t v20 = [(NSTextLineFragment *)v10 characterRange];
          BOOL v22 = v14 == v20 + v21 && v4;
          if (v14 < v20 + v21 || v22) {
            return v10;
          }
          if (v17 == ++v19)
          {
            uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
            double v10 = 0;
            if (v17) {
              goto LABEL_20;
            }
            return v10;
          }
        }
      }
    }
    return 0;
  }
  if (!v4) {
    return 0;
  }
  if (!objc_msgSend(-[NSTextRange endLocation](-[NSTextLayoutFragment rangeInElement](self, "rangeInElement"), "endLocation"), "isEqual:", textLocation))return 0; {
  if (!objc_msgSend(-[NSTextRange endLocation](-[NSTextElement elementRange](-[NSTextLayoutFragment textElement](self, "textElement"), "elementRange"), "endLocation"), "isEqual:", -[NSTextRange endLocation](-[NSTextLayoutFragment rangeInElement](self, "rangeInElement"), "endLocation")))return 0;
  }
  uint64_t v12 = [(NSTextParagraph *)[(NSTextLayoutFragment *)self textParagraph] paragraphSeparatorRange];
  if (v12)
  {
    if (![(NSTextRange *)v12 isEmpty]) {
      return 0;
    }
  }

  return (NSTextLineFragment *)[(NSArray *)v7 lastObject];
}

uint64_t __75__NSTextLayoutFragment_textLineFragmentForTextLocation_isUpstreamAffinity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v6 = *(void **)(a1 + 32);
  if (v6 == a3) {
    double v7 = a2;
  }
  else {
    double v7 = 0;
  }
  if (v6 == a2) {
    unint64_t v8 = a3;
  }
  else {
    unint64_t v8 = v7;
  }
  if (v8)
  {
    unint64_t v9 = [v8 characterRange];
    unint64_t v11 = *(void *)(a1 + 40);
    BOOL v12 = v11 < v9 || v11 - v9 >= v10;
    if (!v12 || *(unsigned char *)(a1 + 48) && v11 == v9 + v10) {
      return 0;
    }
  }
  uint64_t v14 = [a3 characterRange];
  uint64_t v15 = [a2 characterRange];
  uint64_t v16 = 1;
  if (v14 - v15 >= 1) {
    uint64_t v16 = -1;
  }
  if (v14 == v15) {
    return 0;
  }
  else {
    return v16;
  }
}

- (NSTextLineFragment)textLineFragmentForVerticalOffset:(CGFloat)verticalOffset requiresExactMatch:(BOOL)requiresExactMatch
{
  BOOL v4 = requiresExactMatch;
  if ([(NSTextLayoutFragment *)self state] != NSTextLayoutFragmentStateLayoutAvailable) {
    return 0;
  }
  double v7 = [(NSTextLayoutFragment *)self textLineFragments];
  unint64_t v8 = [(NSArray *)v7 count];
  if (v8 - 1 > 1)
  {
    BOOL v26 = [[__NSScratchTextLineFragment alloc] initWithVerticalOffset:verticalOffset];
    long long v27 = v26;
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    uint64_t v33 = __77__NSTextLayoutFragment_textLineFragmentForVerticalOffset_requiresExactMatch___block_invoke;
    BOOL v34 = &unk_1E55C53A8;
    if (v4) {
      uint64_t v28 = 256;
    }
    else {
      uint64_t v28 = 1280;
    }
    double v35 = v26;
    CGFloat v36 = verticalOffset;
    unint64_t v29 = -[NSArray indexOfObject:inSortedRange:options:usingComparator:](v7, "indexOfObject:inSortedRange:options:usingComparator:", v26, 0, v8, v28, &v31);

    if (v29 < v8) {
      return (NSTextLineFragment *)-[NSArray objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", v29, v31, v32, v33, v34);
    }
    return 0;
  }
  unint64_t v9 = [(NSArray *)v7 firstObject];
  [(NSTextLineFragment *)v9 typographicBounds];
  CGFloat v14 = v10;
  CGFloat v15 = v11;
  CGFloat v16 = v12;
  CGFloat v17 = v13;
  if (v4 || CGRectGetMinY(*(CGRect *)&v10) <= verticalOffset)
  {
    v37.origin.double x = v14;
    v37.origin.double y = v15;
    v37.size.CGFloat width = v16;
    v37.size.CGFloat height = v17;
    if (CGRectGetMinY(v37) > verticalOffset
      || (v38.origin.double x = v14,
          v38.origin.double y = v15,
          v38.size.CGFloat width = v16,
          v38.size.CGFloat height = v17,
          CGRectGetMaxY(v38) <= verticalOffset))
    {
      if (v8 < 2) {
        return 0;
      }
      unint64_t v9 = [(NSArray *)v7 lastObject];
      [(NSTextLineFragment *)v9 typographicBounds];
      CGFloat v22 = v18;
      CGFloat v23 = v19;
      CGFloat v24 = v20;
      CGFloat v25 = v21;
      if (v4 || CGRectGetMinY(*(CGRect *)&v18) <= verticalOffset)
      {
        v39.origin.double x = v22;
        v39.origin.double y = v23;
        v39.size.CGFloat width = v24;
        v39.size.CGFloat height = v25;
        if (CGRectGetMinY(v39) > verticalOffset) {
          return 0;
        }
        v40.origin.double x = v22;
        v40.origin.double y = v23;
        v40.size.CGFloat width = v24;
        v40.size.CGFloat height = v25;
        if (CGRectGetMaxY(v40) <= verticalOffset) {
          return 0;
        }
      }
    }
  }
  return v9;
}

uint64_t __77__NSTextLayoutFragment_textLineFragmentForVerticalOffset_requiresExactMatch___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v6 = *(void **)(a1 + 32);
  if (v6 == a3) {
    double v7 = a2;
  }
  else {
    double v7 = 0;
  }
  if (v6 == a2) {
    unint64_t v8 = a3;
  }
  else {
    unint64_t v8 = v7;
  }
  if (v8)
  {
    [v8 typographicBounds];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
  }
  else
  {
    CGFloat v10 = *MEMORY[0x1E4F1DB28];
    CGFloat v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v17 = *(double *)(a1 + 40);
  v25.origin.double x = v10;
  v25.origin.double y = v12;
  v25.size.CGFloat width = v14;
  v25.size.CGFloat height = v16;
  if (v17 >= CGRectGetMinY(v25))
  {
    double v18 = *(double *)(a1 + 40);
    v26.origin.double x = v10;
    v26.origin.double y = v12;
    v26.size.CGFloat width = v14;
    v26.size.CGFloat height = v16;
    if (v18 < CGRectGetMaxY(v26)) {
      return 0;
    }
  }
  [a3 typographicBounds];
  double MinY = CGRectGetMinY(v27);
  [a2 typographicBounds];
  double v21 = CGRectGetMinY(v28);
  double v22 = MinY - v21;
  double v23 = vabdd_f64(MinY, v21);
  uint64_t v24 = -1;
  if (v22 <= 0.0) {
    uint64_t v24 = 1;
  }
  if (v23 <= 0.001) {
    return 0;
  }
  else {
    return v24;
  }
}

- (id)textLineFragmentForVerticalOffset:(double)a3 allowsSucceeding:(BOOL)a4
{
  return [(NSTextLayoutFragment *)self textLineFragmentForVerticalOffset:!a4 requiresExactMatch:a3];
}

- (double)verticalOffsetOfTextLocation:(id)a3 withAffinity:(int64_t)a4
{
  double v6 = [(NSTextLayoutFragment *)self textLineFragmentForTextLocation:a3 isUpstreamAffinity:a4 == 0];
  if (!v6)
  {
    if ((unint64_t)[(NSTextLayoutFragment *)self state] < NSTextLayoutFragmentStateLayoutAvailable
      || ![(NSArray *)[(NSTextLayoutFragment *)self textLineFragments] count]
      || objc_msgSend(a3, "compare:", objc_msgSend(-[NSTextLayoutFragment representedRange](self, "representedRange"), "location")) == -1)
    {
      return 0.0;
    }
    double v6 = [(NSArray *)[(NSTextLayoutFragment *)self textLineFragments] lastObject];
  }
  [(NSTextLineFragment *)v6 typographicBounds];

  return CGRectGetMinY(*(CGRect *)&v7);
}

- (id)representedRangeAtPoint:(CGPoint)a3
{
  return 0;
}

+ (NSSet)_validCoreTextRenderingAttributes
{
  if (_validCoreTextRenderingAttributes_onceToken != -1) {
    dispatch_once(&_validCoreTextRenderingAttributes_onceToken, &__block_literal_global_27);
  }
  return (NSSet *)_validCoreTextRenderingAttributes_coreTextAttributes;
}

uint64_t __57__NSTextLayoutFragment__validCoreTextRenderingAttributes__block_invoke()
{
  uint64_t result = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"NSColor", @"NSBackgroundColor", @"NSShadow", @"NSLink", 0);
  _validCoreTextRenderingAttributes_coreTextAttributes = result;
  return result;
}

+ (id)layoutFragmentQueue
{
  if (layoutFragmentQueue_onceToken != -1) {
    dispatch_once(&layoutFragmentQueue_onceToken, &__block_literal_global_30);
  }
  return (id)layoutFragmentQueue_queue;
}

uint64_t __43__NSTextLayoutFragment_layoutFragmentQueue__block_invoke()
{
  layoutFragmentQueue_queue = (uint64_t)objc_alloc_init(MEMORY[0x1E4F28F08]);
  [(id)layoutFragmentQueue_queue setName:@"com.apple.NSTextLayoutFragmentOperationQueue"];
  [(id)layoutFragmentQueue_queue setQualityOfService:17];
  v0 = (void *)layoutFragmentQueue_queue;

  return [v0 setMaxConcurrentOperationCount:1];
}

- (int64_t)_baseWritingDirection
{
  int64_t v3 = [(NSTextLayoutManager *)[(NSTextLayoutFragment *)self textLayoutManager] _fallbackWritingDirection];
  if (!self->_isTextParagraph
    || (int64_t result = [(NSTextParagraph *)[(NSTextLayoutFragment *)self textParagraph] _resolvedBaseWritingDirectionWithFallbackDirection:v3], result == -1))
  {
    return +[NSParagraphStyle defaultWritingDirectionForLanguage:0];
  }
  return result;
}

- (CGRect)coreTypesetter:(id)a3 lineFragmentRectForProposedRect:(CGRect)a4 atIndex:(int64_t)a5 writingDirection:(int64_t)a6 remainingRect:(CGRect *)a7
{
  int64_t v9 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v15 = [(NSTextLayoutFragment *)self _textContainerAtStringIndex:a5];
  if (v15)
  {
    CGFloat v16 = v15;
    double v17 = [(NSTextLayoutManager *)[(NSTextLayoutFragment *)self textLayoutManager] textContentManager];
    if (v17)
    {
      double v18 = v17;
      id v19 = [(NSTextParagraph *)[(NSTextLayoutFragment *)self textParagraph] locationForCharacterIndex:v9 actualRange:0];
      if (v19) {
        int64_t v9 = [(NSTextContentManager *)v18 offsetFromLocation:[(NSTextRange *)[(NSTextContentManager *)v18 documentRange] location] toLocation:v19];
      }
    }
    objc_msgSend(v16, "lineFragmentRectForProposedRect:atIndex:writingDirection:remainingRect:", v9, a6, a7, x, y, width, height);
  }
  else
  {
    double v20 = *MEMORY[0x1E4F1DB28];
    double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

uint64_t __31__NSTextLayoutFragment__layout__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  double v6 = *(void **)(a1 + 32);
  if (!v6) {
    return 1;
  }
  if (*(void *)(a1 + 40)) {
    uint64_t v8 = [*(id *)(a1 + 40) locationForCharacterIndex:a4 dataSourceLocationsOnly:0 actualRange:0];
  }
  else {
    uint64_t v8 = objc_msgSend(v6, "locationFromLocation:withOffset:", *(void *)(a1 + 48));
  }
  uint64_t v10 = v8;
  double v11 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v12 = *(void *)(a1 + 32);

  return [v11 textLayoutManager:v12 shouldBreakLineBeforeLocation:v10 hyphenating:a5];
}

uint64_t __30__NSTextLayoutFragment_layout__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layout];
}

- (void)invalidateExtraLineFragment
{
  if ((unint64_t)[(NSTextLayoutFragment *)self state] >= NSTextLayoutFragmentStateCalculatedUsageBounds
    && ![(NSArray *)self->_truncatedRanges count])
  {
    int64_t v3 = [(NSTextLayoutFragment *)self textLineFragments];
    unint64_t v4 = [(NSArray *)v3 count];
    [(NSTextLayoutFragment *)self setState:1];
    [(NSTextLayoutManager *)[(NSTextLayoutFragment *)self textLayoutManager] updateLayoutWithTextLayoutFragment:self addition:0];
    if (v4 >= 2)
    {
      if (objc_msgSend(-[NSArray lastObject](v3, "lastObject"), "isExtra"))
      {
        int64_t v3 = -[NSArray subarrayWithRange:](v3, "subarrayWithRange:", 0, v4 - 1);
        [(NSTextLayoutFragment *)self layoutFragmentFrame];
        double v6 = v5;
        double v8 = v7;
        double v10 = v9;
        objc_msgSend(-[NSArray lastObject](v3, "lastObject"), "typographicBounds");
        double MaxY = CGRectGetMaxY(v13);
        [(NSTextLayoutFragment *)self bottomMargin];
        -[NSTextLayoutFragment setLayoutFragmentFrame:](self, "setLayoutFragmentFrame:", v6, v8, v10, MaxY + v12);
      }
    }
    [(NSTextLayoutFragment *)self setTextLineFragmentsExcludingExtra:v3];
    [(NSTextLayoutFragment *)self setTextLineFragments:MEMORY[0x1E4F1CBF0]];
    [(NSTextViewportLayoutController *)[(NSTextLayoutManager *)[(NSTextLayoutFragment *)self textLayoutManager] textViewportLayoutController] setNeedsLayout];

    self->_extraLineFragmentAttributes = 0;
  }
}

- (NSString)description
{
  if ([(NSTextLayoutFragment *)self textElement])
  {
    int64_t v3 = NSString;
    uint64_t v4 = objc_opt_class();
    double v5 = [(NSTextLayoutFragment *)self rangeInElement];
    NSTextLayoutFragmentState v6 = [(NSTextLayoutFragment *)self state];
    if (v6 >= 4) {
      double v7 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"%lu", v6);
    }
    else {
      double v7 = off_1E55C55D0[v6];
    }
    if ([(NSTextLayoutFragment *)self state])
    {
      [(NSTextLayoutFragment *)self layoutFragmentFrame];
      CGRect v37 = NSStringFromRect(v43);
    }
    else
    {
      CGRect v37 = (NSString *)@"{}";
    }
    return (NSString *)[v3 stringWithFormat:@"%@: %p range=%@ layoutState=%@ frame=%@", v4, self, v5, v7, v37, v39];
  }
  else
  {
    [(NSTextLayoutFragment *)self sourceBoundingRect];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    [(NSTextLayoutFragment *)self destinationBoundingRect];
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    uint64_t v24 = NSString;
    uint64_t v25 = objc_opt_class();
    unint64_t v26 = [(NSTextLayoutFragment *)self animationType];
    CGRect v27 = &stru_1EDD49F70;
    if (v26)
    {
      if (v26) {
        CGRect v28 = @"Dissolve";
      }
      else {
        CGRect v28 = &stru_1EDD49F70;
      }
      BOOL v29 = (v26 & 6) == 0 || (v26 & 1) == 0;
      long long v30 = @"|";
      if (v29) {
        uint64_t v31 = &stru_1EDD49F70;
      }
      else {
        uint64_t v31 = @"|";
      }
      uint64_t v32 = @"Translate";
      if ((v26 & 2) == 0) {
        uint64_t v32 = &stru_1EDD49F70;
      }
      if ((v26 & 6) != 6) {
        long long v30 = &stru_1EDD49F70;
      }
      uint64_t v33 = @"Resize";
      if ((v26 & 4) == 0) {
        uint64_t v33 = &stru_1EDD49F70;
      }
      CGRect v27 = (__CFString *)[NSString stringWithFormat:@"[%@%@%@%@%@]", v28, v31, v32, v30, v33];
    }
    v40.id location = [(NSTextLayoutFragment *)self characterRange];
    BOOL v34 = NSStringFromRange(v40);
    [(NSTextLayoutFragment *)self sourceBoundingRect];
    double v35 = NSStringFromRect(v41);
    v42.origin.double x = v9;
    v42.origin.double y = v11;
    v42.size.double width = v13;
    v42.size.double height = v15;
    v45.origin.double x = v17;
    v45.origin.double y = v19;
    v45.size.double width = v21;
    v45.size.double height = v23;
    if (NSEqualRects(v42, v45))
    {
      CGFloat v36 = &stru_1EDD49F70;
    }
    else
    {
      v44.origin.double x = v17;
      v44.origin.double y = v19;
      v44.size.double width = v21;
      v44.size.double height = v23;
      CGFloat v36 = (__CFString *)[NSString stringWithFormat:@" destination=%@", NSStringFromRect(v44)];
    }
    return (NSString *)[v24 stringWithFormat:@"%@: %p %@ range=%@ source=%@%@", v25, self, v27, v34, v35, v36];
  }
}

- (BOOL)isCountableDataSource
{
  double v2 = [(NSTextLayoutFragment *)self textLayoutManager];

  return [(NSTextLayoutManager *)v2 isCountableDataSource];
}

- (id)locationFromLocation:(id)a3 withOffset:(int64_t)a4
{
  NSTextLayoutFragmentState v6 = [(NSTextLayoutFragment *)self textLayoutManager];

  return [(NSTextLayoutManager *)v6 locationFromLocation:a3 withOffset:a4];
}

- (int64_t)offsetFromLocation:(id)a3 toLocation:(id)a4
{
  NSTextLayoutFragmentState v6 = [(NSTextLayoutFragment *)self textLayoutManager];

  return [(NSTextLayoutManager *)v6 offsetFromLocation:a3 toLocation:a4];
}

- (NSTextLocation)baseLocation
{
  double v2 = [(NSTextLayoutFragment *)self rangeInElement];

  return (NSTextLocation *)[(NSTextRange *)v2 location];
}

uint64_t __84__NSTextLayoutFragment_enumerateRenderingAttributesFromLocation_reverse_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, unsigned char *a5)
{
  uint64_t result = objc_msgSend(a4, "textRangeByIntersectingWithTextRange:", objc_msgSend(*(id *)(a1 + 32), "rangeInElement"));
  if (result)
  {
    double v8 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v8();
  }
  else
  {
    *a5 = 1;
  }
  return result;
}

- (id)_coreTextAttributes
{
  if ([(NSTextLayoutFragment *)self rendersTextCorrectionMarkers])
  {
    [(NSTextLayoutFragment *)self textLayoutManager];
    int64_t v3 = objc_opt_class();
    return (id)[v3 validRenderingAttributes];
  }
  else
  {
    double v5 = objc_opt_class();
    return (id)[v5 _validCoreTextRenderingAttributes];
  }
}

- (id)_textAttributesAffectingLayout
{
  if (_textAttributesAffectingLayout_onceToken != -1) {
    dispatch_once(&_textAttributesAffectingLayout_onceToken, &__block_literal_global_68);
  }
  return (id)_textAttributesAffectingLayout_coreTextAttributes;
}

uint64_t __54__NSTextLayoutFragment__textAttributesAffectingLayout__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t result = objc_msgSend(v0, "initWithObjects:", @"NSFont", @"NSParagraphStyle", @"NSLigature", @"NSKern", @"CTTracking", @"NSAttachment", @"NSBaselineOffset", @"NSObliqueness", @"NSExpansion", @"NSWritingDirection", @"CTVerticalForms", @"NSSuperScript", NSGlyphInfoAttributeName, 0);
  _textAttributesAffectingLayout_coreTextAttributes = result;
  return result;
}

- (void)setRenderingAttribute:(id)a3 value:(id)a4 forTextRange:(id)a5
{
  renderingAttributesTable = self->_renderingAttributesTable;
  if (a4)
  {
    if (!renderingAttributesTable)
    {
      renderingAttributesTable = [(_NSTextRunStorage *)[_NSTextAttributeStorage alloc] initWithDataSource:self];
      self->_renderingAttributesTable = renderingAttributesTable;
    }
  }
  else if (!renderingAttributesTable)
  {
    return;
  }
  if (-[_NSTextAttributeStorage setAttribute:value:forTextRange:](renderingAttributesTable, "setAttribute:value:forTextRange:", a3, a4, a5)&& -[NSTextLayoutFragment state](self, "state") == NSTextLayoutFragmentStateLayoutAvailable&& objc_msgSend(-[NSTextLayoutFragment _textAttributesAffectingLayout](self, "_textAttributesAffectingLayout"), "containsObject:", a3))
  {
    [(NSTextLayoutFragment *)self invalidateLayout];
  }
}

- (void)removeRenderingAttribute:(id)a3 forTextRange:(id)a4
{
}

- (void)setRenderingAttributes:(id)a3 forTextRange:(id)a4
{
  if (!self->_renderingAttributesTable) {
    self->_renderingAttributesTable = [(_NSTextRunStorage *)[_NSTextAttributeStorage alloc] initWithDataSource:self];
  }
  if ([(NSTextLayoutFragment *)self state] == NSTextLayoutFragmentStateLayoutAvailable)
  {
    id v7 = [(NSTextLayoutFragment *)self _textAttributesAffectingLayout];
    uint64_t v10 = 0;
    CGFloat v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__NSTextLayoutFragment_setRenderingAttributes_forTextRange___block_invoke;
    v9[3] = &unk_1E55C54C0;
    v9[4] = v7;
    v9[5] = &v10;
    [a3 enumerateKeysAndObjectsWithOptions:1 usingBlock:v9];
    if (*((unsigned char *)v11 + 24)) {
      [(NSTextLayoutFragment *)self invalidateLayout];
    }
    _Block_object_dispose(&v10, 8);
  }
  id v8 = +[NSAttributeDictionary newWithDictionary:a3];
  [(_NSTextRunStorage *)self->_renderingAttributesTable setObject:v8 forRange:a4];
}

uint64_t __60__NSTextLayoutFragment_setRenderingAttributes_forTextRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) containsObject:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)invalidateRenderingAttributesForTextRange:(id)a3
{
  [(_NSTextRunStorage *)self->_renderingAttributesTable invalidateElementsInRange:a3 delta:0];

  [(NSTextLayoutFragment *)self set_renderingAttributesValidated:0];
}

- (void)layoutManagerDidSetTemporaryAttributes:(id)a3 forTextRange:(id)a4
{
  if ([(NSTextLayoutFragment *)self state] == NSTextLayoutFragmentStateLayoutAvailable)
  {
    id v6 = [(NSTextLayoutFragment *)self _textAttributesAffectingLayout];
    uint64_t v8 = 0;
    CGFloat v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __76__NSTextLayoutFragment_layoutManagerDidSetTemporaryAttributes_forTextRange___block_invoke;
    v7[3] = &unk_1E55C54C0;
    v7[4] = v6;
    v7[5] = &v8;
    [a3 enumerateKeysAndObjectsWithOptions:1 usingBlock:v7];
    if (*((unsigned char *)v9 + 24)) {
      [(NSTextLayoutFragment *)self invalidateLayout];
    }
    _Block_object_dispose(&v8, 8);
  }
}

uint64_t __76__NSTextLayoutFragment_layoutManagerDidSetTemporaryAttributes_forTextRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) containsObject:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

NSTextRange *__85__NSTextLayoutFragment__resolvedRenderingAttributesForCharacterIndex_effectiveRange___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, unsigned char *a5)
{
  if ([a4 containsLocation:*(void *)(a1 + 32)])
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a3;
    uint64_t result = a4;
LABEL_5:
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
    goto LABEL_6;
  }
  uint64_t result = (NSTextRange *)objc_msgSend(*(id *)(a1 + 32), "compare:", objc_msgSend(a4, "location"));
  if (result == (NSTextRange *)-1)
  {
    uint64_t result = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", *(void *)(a1 + 32), [a4 location]);
    goto LABEL_5;
  }
LABEL_6:
  *a5 = 1;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  return result;
}

NSTextRange *__85__NSTextLayoutFragment__resolvedRenderingAttributesForCharacterIndex_effectiveRange___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, unsigned char *a5)
{
  uint64_t result = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", [a4 endLocation], objc_msgSend(*(id *)(a1 + 32), "endLocation"));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  *a5 = 1;
  return result;
}

- (BOOL)_isEnumerationGap
{
  return 0;
}

- (BOOL)supportsSubelements
{
  return [(_NSTextAttachmentLayoutContext *)self->_textAttachmentLayoutContext hasViewProvider];
}

- (void)enumerateViewportElementsFromLocation:(id)a3 options:(int64_t)a4 usingBlock:(id)a5
{
  if ([(NSTextLayoutFragment *)self supportsSubelements])
  {
    textAttachmentLayoutContext = self->_textAttachmentLayoutContext;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __81__NSTextLayoutFragment_enumerateViewportElementsFromLocation_options_usingBlock___block_invoke;
    v10[3] = &unk_1E55C5538;
    v10[4] = a5;
    [(_NSTextAttachmentLayoutContext *)textAttachmentLayoutContext enumerateViewportElementsFromLocation:a3 options:a4 usingBlock:v10];
  }
}

uint64_t __81__NSTextLayoutFragment_enumerateViewportElementsFromLocation_options_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)attributedStringForTruncatedRange:(id)a3 attributes:(id)a4
{
  objc_sync_enter(self);
  id v7 = (void *)[(NSMutableDictionary *)self->_truncationTokenTable objectForKey:a4];
  if (!v7)
  {
    if ([a4 objectForKeyedSubscript:@"NSFont"]) {
      int IsVertical = CTFontIsVertical();
    }
    else {
      int IsVertical = 0;
    }
    id v9 = objc_alloc(MEMORY[0x1E4F28B18]);
    if (IsVertical) {
      uint64_t v10 = @"︙";
    }
    else {
      uint64_t v10 = @"…";
    }
    id v7 = (void *)[v9 initWithString:v10 attributes:a4];
    truncationTokenTable = self->_truncationTokenTable;
    if (!truncationTokenTable)
    {
      truncationTokenTable = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      self->_truncationTokenTable = truncationTokenTable;
    }
    [(NSMutableDictionary *)truncationTokenTable setObject:v7 forKey:a4];
  }
  objc_sync_exit(self);
  id result = [(NSTextLayoutManager *)[(NSTextLayoutFragment *)self textLayoutManager] attributedStringForTruncatedRange:a3 defaultAttributedString:v7];
  if (!result) {
    return v7;
  }
  return result;
}

- (id)coreTypesetter:(id)a3 attributedStringForTruncatedCharacterRange:(_NSRange *)a4 attributes:(id)a5 originalLineRef:(__CTLine *)a6
{
  id v9 = [(NSTextLayoutFragment *)self textParagraph];
  uint64_t v10 = [(NSTextElement *)[(NSTextLayoutFragment *)self textElement] textContentManager];
  id v11 = [(NSTextRange *)[(NSTextElement *)[(NSTextLayoutFragment *)self textElement] elementRange] location];
  if (!v10) {
    return 0;
  }
  NSUInteger location = a4->location;
  NSUInteger length = a4->length;
  if (v9)
  {
    uint64_t v14 = [(NSTextParagraph *)v9 locationForCharacterIndex:a4->location dataSourceLocationsOnly:0 actualRange:0];
    uint64_t v15 = [(NSTextParagraph *)v9 locationForCharacterIndex:length + location dataSourceLocationsOnly:0 actualRange:0];
  }
  else
  {
    uint64_t v14 = [(NSTextContentManager *)v10 locationFromLocation:v11 withOffset:a4->location];
    uint64_t v15 = [(NSTextContentManager *)v10 locationFromLocation:v14 withOffset:length];
  }
  if (!v14 || !v15) {
    return 0;
  }
  double v16 = [[NSTextRange alloc] initWithLocation:v14 endLocation:v15];
  id v17 = [(NSTextLayoutFragment *)self attributedStringForTruncatedRange:v16 attributes:a5];

  return v17;
}

- (id)lineBreaks
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(NSTextLayoutFragment *)self layout];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [(NSTextLayoutFragment *)self textLineFragments];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v10 = [v9 characterRange];
        uint64_t v12 = v10 + v11;
        char v13 = [v9 isHyphenated];
        v15[0] = v12;
        v15[1] = 0;
        char v16 = v13;
        memset(v17, 0, sizeof(v17));
        objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "UIF_valueWithLineBreakContext:", v15));
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
  return v3;
}

- (NSTextLayoutFragment)layoutFragmentWithKeyframe:(id)a3
{
  uint64_t v5 = [[NSTextLayoutFragment alloc] initWithTextElement:[(NSTextLayoutFragment *)self textElement] range:[(NSTextLayoutFragment *)self rangeInElement]];
  [(NSTextLayoutFragment *)v5 setKeyframe:a3];
  [(NSTextLayoutFragment *)self layoutFragmentFrameOrigin];
  [(NSTextLayoutFragment *)v5 setLayoutFragmentFrameOrigin:"setLayoutFragmentFrameOrigin:"];
  [(NSTextLayoutFragment *)v5 setTextLayoutManager:[(NSTextLayoutFragment *)self textLayoutManager]];
  [(NSTextLayoutFragment *)v5 setLayoutQueue:[(NSTextLayoutFragment *)self layoutQueue]];
  [(NSTextLayoutFragment *)v5 setForcedLineBreaks:[(NSTextLayoutFragment *)self lineBreaks]];
  [(NSTextLayoutFragment *)v5 layout];

  return v5;
}

uint64_t __109__NSTextLayoutFragment__renderingAttributesForTextAnimationContextComponent_range_attributes_effectiveRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = [MEMORY[0x1E4F1CA98] null];
  if (result == a3)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    return [v7 removeObjectForKey:a2];
  }
  return result;
}

- (void)setLayoutQueue:(NSOperationQueue *)layoutQueue
{
}

- (BOOL)_isRenderingAttributesValidated
{
  return self->_renderingAttributesValidated;
}

- (void)set_renderingAttributesValidated:(BOOL)a3
{
  self->_renderingAttributesValidated = a3;
}

- (void)setRendersTextCorrectionMarkers:(BOOL)a3
{
  self->_rendersTextCorrectionMarkers = a3;
}

- (void)setTextAttachmentLayoutContext:(id)a3
{
}

- (NSArray)textLineFragmentsExcludingExtra
{
  return (NSArray *)objc_getProperty(self, a2, 440, 1);
}

- (void)setKeyframe:(id)a3
{
}

- (void)setForcedLineBreaks:(id)a3
{
}

- (NSTextLayoutFragment)initWithLayoutManager:(id)a3 characterRange:(_NSRange)a4 animationType:(unint64_t)a5 boundingRect:(CGRect)a6
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v15 = objc_alloc_init(NSTextParagraph);
  char v16 = [(NSTextLayoutFragment *)self initWithTextElement:v15 range:0];

  if (v16)
  {
    objc_storeWeak((id *)&v16->_textElement, 0);
    objc_storeWeak((id *)&v16->_layoutManager, a3);
    v16->_characterRange.NSUInteger location = location;
    v16->_characterRange.NSUInteger length = length;
    v16->_sourceBoundingRect.origin.CGFloat x = x;
    v16->_sourceBoundingRect.origin.CGFloat y = y;
    v16->_sourceBoundingRect.size.CGFloat width = width;
    v16->_sourceBoundingRect.size.CGFloat height = height;
    v16->_destinationBoundingRect.origin.CGFloat x = x;
    v16->_destinationBoundingRect.origin.CGFloat y = y;
    v16->_destinationBoundingRect.size.CGFloat width = width;
    v16->_destinationBoundingRect.size.CGFloat height = height;
    v16->_animationType = a5;
  }
  return v16;
}

- (NSLayoutManager)destinationLayoutManager
{
  return self->_destinationLayoutManager;
}

- (void)setDestinationLayoutManager:(id)a3
{
  self->_destinationLayoutManager = (NSLayoutManager *)a3;
}

- (NSTextStorage)destinationTextStorage
{
  objc_sync_enter(self);
  id v3 = self->_destinationTextStorage;
  objc_sync_exit(self);
  return v3;
}

- (void)setDestinationTextStorage:(id)a3
{
  objc_sync_enter(self);
  destinationTextStorage = self->_destinationTextStorage;
  if (destinationTextStorage != a3)
  {

    self->_destinationTextStorage = (NSTextStorage *)[a3 copy];
  }

  objc_sync_exit(self);
}

- (double)destinationVerticalDelta
{
  return self->_destinationVerticalDelta;
}

- (void)setDestinationVerticalDelta:(double)a3
{
  self->_destinationVerticalDelta = a3;
}

- (_NSRange)destinationGlyphRange
{
  NSUInteger length = self->_destinationGlyphRange.length;
  NSUInteger location = self->_destinationGlyphRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setDestinationGlyphRange:(_NSRange)a3
{
  self->_destinationGlyphRange = a3;
}

- (void)setDestinationBoundingRect:(CGRect)a3
{
  self->_destinationBoundingRect = a3;
}

- (void)_setup
{
  [(NSTextLayoutFragment *)self animationType];
  [(NSTextLayoutFragment *)self sourceBoundingRect];
  self->_sourceVerticalDelta = (unint64_t)-v3;
  self->_sourceRangeDelta = 0;
}

- (void)drawAtPoint:(CGPoint)a3 contentType:(unint64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v8 = [(NSTextLayoutFragment *)self characterRange];
  uint64_t v10 = v9;
  [(NSTextLayoutFragment *)self _setup];
  char v11 = [(NSTextLayoutFragment *)self animationType];
  if (a4 && (v11 & 1) != 0)
  {
    uint64_t v12 = [(NSTextLayoutFragment *)self destinationLayoutManager];
    uint64_t v13 = [(NSTextLayoutFragment *)self destinationGlyphRange];
    uint64_t v15 = v14;
    [(NSTextLayoutFragment *)self destinationVerticalDelta];
  }
  else
  {
    uint64_t v12 = [(NSTextLayoutFragment *)self layoutManager];
    uint64_t v13 = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](v12, "glyphRangeForCharacterRange:actualCharacterRange:", self->_sourceRangeDelta + v8, v10, 0);
    uint64_t v15 = v17;
    double sourceVerticalDelta = (double)self->_sourceVerticalDelta;
  }

  -[NSLayoutManager drawGlyphsForGlyphRange:atPoint:](v12, "drawGlyphsForGlyphRange:atPoint:", v13, v15, x, y + sourceVerticalDelta);
}

- (id)layoutManager
{
  return objc_loadWeak((id *)&self->_layoutManager);
}

- (_NSRange)characterRange
{
  NSUInteger length = self->_characterRange.length;
  NSUInteger location = self->_characterRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (CGRect)sourceBoundingRect
{
  double x = self->_sourceBoundingRect.origin.x;
  double y = self->_sourceBoundingRect.origin.y;
  double width = self->_sourceBoundingRect.size.width;
  double height = self->_sourceBoundingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)destinationBoundingRect
{
  double x = self->_destinationBoundingRect.origin.x;
  double y = self->_destinationBoundingRect.origin.y;
  double width = self->_destinationBoundingRect.size.width;
  double height = self->_destinationBoundingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unint64_t)animationType
{
  return self->_animationType;
}

@end