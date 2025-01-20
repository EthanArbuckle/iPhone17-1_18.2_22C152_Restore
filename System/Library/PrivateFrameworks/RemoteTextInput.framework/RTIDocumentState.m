@interface RTIDocumentState
+ (BOOL)supportsSecureCoding;
+ (RTIDocumentState)documentStateWithRequest:(id)a3;
- (BOOL)canSuggestSupplementalItemsForCurrentSelection;
- (BOOL)hasText;
- (BOOL)isEqual:(id)a3;
- (BOOL)originatedFromSource;
- (BOOL)scrolling;
- (CGRect)caretRectInWindow;
- (CGRect)clientFrameInEntitySpace;
- (CGRect)clientFrameInWindow;
- (CGRect)firstRectForCharacterRange:(_NSRange)a3;
- (CGRect)firstRectForCharacterRange:(_NSRange)a3 actualRange:(_NSRange *)a4;
- (CGRect)firstRectForCharacterRange:(_NSRange)a3 withGranularity:(int64_t)a4;
- (CGRect)firstRectForCharacterRange:(_NSRange)a3 withGranularity:(int64_t)a4 isVerticalOut:(BOOL *)a5;
- (CGRect)firstRectForCharacterRange:(_NSRange)a3 withGranularity:(int64_t)a4 isVerticalOut:(BOOL *)a5 actualRange:(_NSRange *)a6;
- (CGRect)firstSelectionRectInEntitySpace;
- (CGRect)firstSelectionRectInWindow;
- (NSAttributedString)textCheckingAnnotatedString;
- (NSMutableData)_documentRects;
- (RTIColor)autocorrectTextBackgroundColor;
- (RTIColor)autocorrectTextColor;
- (RTIColor)insertionPointColor;
- (RTIDocumentRequest)request;
- (RTIDocumentState)init;
- (RTIDocumentState)initWithCoder:(id)a3;
- (RTIRange)deltaRangeForSelection:(_NSRange)a3;
- (RTITextStyling)autocorrectBubbleStyling;
- (TIDocumentState)documentState;
- (_NSRange)deltaForSelectionRange:(_NSRange)a3;
- (_NSRange)documentStateRangeForSelectionRange:(_NSRange)a3;
- (_NSRange)markedTextRange;
- (_NSRange)selectedTextRange;
- (_NSRange)selectionRangeForDocumentStateRange:(_NSRange)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)rectsForCharacterRange:(_NSRange)a3 withGranularity:(int64_t)a4;
- (unint64_t)characterIndexForPoint:(CGPoint)a3;
- (void)_enumerateDocumentRectsWithOptions:(unint64_t)a3 block:(id)a4;
- (void)addTextRect:(CGRect)a3 forCharacterRange:(_NSRange)a4;
- (void)addTextRect:(CGRect)a3 forCharacterRange:(_NSRange)a4 granularity:(int64_t)a5;
- (void)addTextRect:(CGRect)a3 forCharacterRange:(_NSRange)a4 granularity:(int64_t)a5 isVertical:(BOOL)a6;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateRectsWithOptions:(unint64_t)a3 range:(_NSRange)a4 granularity:(int64_t)a5 block:(id)a6;
- (void)resetTextRects;
- (void)setAutocorrectBubbleStyling:(id)a3;
- (void)setAutocorrectTextBackgroundColor:(id)a3;
- (void)setAutocorrectTextColor:(id)a3;
- (void)setCanSuggestSupplementalItemsForCurrentSelection:(BOOL)a3;
- (void)setCaretRectInWindow:(CGRect)a3;
- (void)setClientFrameInEntitySpace:(CGRect)a3;
- (void)setClientFrameInWindow:(CGRect)a3;
- (void)setDocumentState:(id)a3;
- (void)setFirstSelectionRectInEntitySpace:(CGRect)a3;
- (void)setFirstSelectionRectInWindow:(CGRect)a3;
- (void)setHasText:(BOOL)a3;
- (void)setInsertionPointColor:(id)a3;
- (void)setOriginatedFromSource:(BOOL)a3;
- (void)setScrolling:(BOOL)a3;
- (void)setSelectedTextRange:(_NSRange)a3;
- (void)setTextCheckingAnnotatedString:(id)a3;
- (void)set_documentRects:(id)a3;
@end

@implementation RTIDocumentState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(RTIDocumentState);
  if (v5)
  {
    request = self->_request;
    if (request)
    {
      uint64_t v7 = [(RTIDocumentRequest *)request copy];
      v8 = v5->_request;
      v5->_request = (RTIDocumentRequest *)v7;
    }
    documentState = self->_documentState;
    if (documentState)
    {
      uint64_t v10 = [(TIDocumentState *)documentState copyWithZone:a3];
      v11 = v5->_documentState;
      v5->_documentState = (TIDocumentState *)v10;
    }
    if (self->_hasText) {
      v5->_hasText = 1;
    }
    documentRects = self->__documentRects;
    if (documentRects)
    {
      uint64_t v13 = [(NSMutableData *)documentRects copy];
      v14 = v5->__documentRects;
      v5->__documentRects = (NSMutableData *)v13;
    }
    textCheckingAnnotatedString = self->_textCheckingAnnotatedString;
    if (textCheckingAnnotatedString)
    {
      uint64_t v16 = [(NSAttributedString *)textCheckingAnnotatedString copy];
      v17 = v5->_textCheckingAnnotatedString;
      v5->_textCheckingAnnotatedString = (NSAttributedString *)v16;
    }
    autocorrectBubbleStyling = self->_autocorrectBubbleStyling;
    if (autocorrectBubbleStyling)
    {
      uint64_t v19 = [(RTITextStyling *)autocorrectBubbleStyling copy];
      v20 = v5->_autocorrectBubbleStyling;
      v5->_autocorrectBubbleStyling = (RTITextStyling *)v19;
    }
    autocorrectTextColor = self->_autocorrectTextColor;
    if (autocorrectTextColor)
    {
      uint64_t v22 = [(RTIColor *)autocorrectTextColor copy];
      v23 = v5->_autocorrectTextColor;
      v5->_autocorrectTextColor = (RTIColor *)v22;
    }
    autocorrectTextBackgroundColor = self->_autocorrectTextBackgroundColor;
    if (autocorrectTextBackgroundColor)
    {
      uint64_t v25 = [(RTIColor *)autocorrectTextBackgroundColor copy];
      v26 = v5->_autocorrectTextBackgroundColor;
      v5->_autocorrectTextBackgroundColor = (RTIColor *)v25;
    }
    insertionPointColor = self->_insertionPointColor;
    if (insertionPointColor)
    {
      uint64_t v28 = [(RTIColor *)insertionPointColor copy];
      v29 = v5->_insertionPointColor;
      v5->_insertionPointColor = (RTIColor *)v28;
    }
    CGSize size = self->_caretRectInWindow.size;
    v5->_caretRectInWindow.origin = self->_caretRectInWindow.origin;
    v5->_caretRectInWindow.CGSize size = size;
    CGSize v31 = self->_firstSelectionRectInWindow.size;
    v5->_firstSelectionRectInWindow.origin = self->_firstSelectionRectInWindow.origin;
    v5->_firstSelectionRectInWindow.CGSize size = v31;
    CGSize v32 = self->_clientFrameInWindow.size;
    v5->_clientFrameInWindow.origin = self->_clientFrameInWindow.origin;
    v5->_clientFrameInWindow.CGSize size = v32;
    CGSize v33 = self->_firstSelectionRectInEntitySpace.size;
    v5->_firstSelectionRectInEntitySpace.origin = self->_firstSelectionRectInEntitySpace.origin;
    v5->_firstSelectionRectInEntitySpace.CGSize size = v33;
    CGSize v34 = self->_clientFrameInEntitySpace.size;
    v5->_clientFrameInEntitySpace.origin = self->_clientFrameInEntitySpace.origin;
    v5->_clientFrameInEntitySpace.CGSize size = v34;
    v5->_scrolling = self->_scrolling;
    v5->_originatedFromSource = self->_originatedFromSource;
    v5->_canSuggestSupplementalItemsForCurrentSelection = self->_canSuggestSupplementalItemsForCurrentSelection;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v18 = a3;
  if (([v18 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
  }
  request = self->_request;
  if (request) {
    [v18 encodeObject:request forKey:@"docReq"];
  }
  documentState = self->_documentState;
  if (documentState) {
    [v18 encodeObject:documentState forKey:@"docSt"];
  }
  if (self->_hasText) {
    [v18 encodeBool:1 forKey:@"docHasText"];
  }
  if (!CGRectIsNull(self->_caretRectInWindow))
  {
    v6 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", self->_caretRectInWindow.origin.x, self->_caretRectInWindow.origin.y, self->_caretRectInWindow.size.width, self->_caretRectInWindow.size.height);
    [v18 encodeObject:v6 forKey:@"caretRect"];
  }
  if (!CGRectIsNull(self->_firstSelectionRectInWindow))
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", self->_firstSelectionRectInWindow.origin.x, self->_firstSelectionRectInWindow.origin.y, self->_firstSelectionRectInWindow.size.width, self->_firstSelectionRectInWindow.size.height);
    [v18 encodeObject:v7 forKey:@"firstRect"];
  }
  if (!CGRectIsNull(self->_clientFrameInWindow))
  {
    v8 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", self->_clientFrameInWindow.origin.x, self->_clientFrameInWindow.origin.y, self->_clientFrameInWindow.size.width, self->_clientFrameInWindow.size.height);
    [v18 encodeObject:v8 forKey:@"clientFrame"];
  }
  if (!CGRectIsNull(self->_firstSelectionRectInEntitySpace))
  {
    v9 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", self->_firstSelectionRectInEntitySpace.origin.x, self->_firstSelectionRectInEntitySpace.origin.y, self->_firstSelectionRectInEntitySpace.size.width, self->_firstSelectionRectInEntitySpace.size.height);
    [v18 encodeObject:v9 forKey:@"firstRectEntitySpace"];
  }
  if (!CGRectIsNull(self->_clientFrameInEntitySpace))
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", self->_clientFrameInEntitySpace.origin.x, self->_clientFrameInEntitySpace.origin.y, self->_clientFrameInEntitySpace.size.width, self->_clientFrameInEntitySpace.size.height);
    [v18 encodeObject:v10 forKey:@"clientFrameEntitySpace"];
  }
  if (self->_scrolling) {
    [v18 encodeBool:1 forKey:@"scrolling"];
  }
  documentRects = self->__documentRects;
  v12 = v18;
  if (documentRects)
  {
    [v18 encodeObject:documentRects forKey:@"docRects"];
    v12 = v18;
  }
  textCheckingAnnotatedString = self->_textCheckingAnnotatedString;
  if (textCheckingAnnotatedString)
  {
    [v18 encodeObject:textCheckingAnnotatedString forKey:@"textCheckingAnnotatedString"];
    v12 = v18;
  }
  autocorrectBubbleStyling = self->_autocorrectBubbleStyling;
  if (autocorrectBubbleStyling)
  {
    [v18 encodeObject:autocorrectBubbleStyling forKey:@"acBubbleStyling"];
    v12 = v18;
  }
  autocorrectTextColor = self->_autocorrectTextColor;
  if (autocorrectTextColor)
  {
    [v18 encodeObject:autocorrectTextColor forKey:@"acTextColor"];
    v12 = v18;
  }
  autocorrectTextBackgroundColor = self->_autocorrectTextBackgroundColor;
  if (autocorrectTextBackgroundColor)
  {
    [v18 encodeObject:autocorrectTextBackgroundColor forKey:@"acTextBGColor"];
    v12 = v18;
  }
  insertionPointColor = self->_insertionPointColor;
  if (insertionPointColor)
  {
    [v18 encodeObject:insertionPointColor forKey:@"insertionPointColor"];
    v12 = v18;
  }
  [v12 encodeBool:self->_originatedFromSource forKey:@"originatedFromSource"];
  if (self->_canSuggestSupplementalItemsForCurrentSelection) {
    [v18 encodeBool:1 forKey:@"supplementalLexiconForSelection"];
  }
}

- (RTIDocumentState)initWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The decoder must allow keyed coding."];
  }
  v60.receiver = self;
  v60.super_class = (Class)RTIDocumentState;
  v5 = [(RTIDocumentState *)&v60 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"docReq"];
    request = v5->_request;
    v5->_request = (RTIDocumentRequest *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"docSt"];
    documentState = v5->_documentState;
    v5->_documentState = (TIDocumentState *)v8;

    v5->_hasText = [v4 decodeBoolForKey:@"docHasText"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"caretRect"];
    v11 = v10;
    if (v10)
    {
      [v10 rectValue];
      v5->_caretRectInWindow.origin.x = v12;
      v5->_caretRectInWindow.origin.y = v13;
      v5->_caretRectInWindow.size.width = v14;
      v5->_caretRectInWindow.size.height = v15;
    }
    else
    {
      CGSize v16 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
      v5->_caretRectInWindow.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
      v5->_caretRectInWindow.CGSize size = v16;
    }
    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstRect"];
    id v18 = v17;
    if (v17)
    {
      [v17 rectValue];
      v5->_firstSelectionRectInWindow.origin.x = v19;
      v5->_firstSelectionRectInWindow.origin.y = v20;
      v5->_firstSelectionRectInWindow.size.width = v21;
      v5->_firstSelectionRectInWindow.size.height = v22;
    }
    else
    {
      CGSize v23 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
      v5->_firstSelectionRectInWindow.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
      v5->_firstSelectionRectInWindow.CGSize size = v23;
    }
    v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientFrame"];
    uint64_t v25 = v24;
    if (v24)
    {
      [v24 rectValue];
      v5->_clientFrameInWindow.origin.x = v26;
      v5->_clientFrameInWindow.origin.y = v27;
      v5->_clientFrameInWindow.size.width = v28;
      v5->_clientFrameInWindow.size.height = v29;
    }
    else
    {
      CGSize v30 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
      v5->_clientFrameInWindow.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
      v5->_clientFrameInWindow.CGSize size = v30;
    }
    CGSize v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstRectEntitySpace"];
    CGSize v32 = v31;
    if (v31)
    {
      [v31 rectValue];
      v5->_firstSelectionRectInEntitySpace.origin.x = v33;
      v5->_firstSelectionRectInEntitySpace.origin.y = v34;
      v5->_firstSelectionRectInEntitySpace.size.width = v35;
      v5->_firstSelectionRectInEntitySpace.size.height = v36;
    }
    else
    {
      CGSize v37 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
      v5->_firstSelectionRectInEntitySpace.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
      v5->_firstSelectionRectInEntitySpace.CGSize size = v37;
    }
    v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientFrameEntitySpace"];
    v39 = v38;
    if (v38)
    {
      [v38 rectValue];
      v5->_clientFrameInEntitySpace.origin.x = v40;
      v5->_clientFrameInEntitySpace.origin.y = v41;
      v5->_clientFrameInEntitySpace.size.width = v42;
      v5->_clientFrameInEntitySpace.size.height = v43;
    }
    else
    {
      CGSize v44 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
      v5->_clientFrameInEntitySpace.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
      v5->_clientFrameInEntitySpace.CGSize size = v44;
    }
    v5->_scrolling = [v4 decodeBoolForKey:@"scrolling"];
    v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"docRects"];
    uint64_t v46 = [v45 mutableCopy];
    documentRects = v5->__documentRects;
    v5->__documentRects = (NSMutableData *)v46;

    uint64_t v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textCheckingAnnotatedString"];
    textCheckingAnnotatedString = v5->_textCheckingAnnotatedString;
    v5->_textCheckingAnnotatedString = (NSAttributedString *)v48;

    uint64_t v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"acBubbleStyling"];
    autocorrectBubbleStyling = v5->_autocorrectBubbleStyling;
    v5->_autocorrectBubbleStyling = (RTITextStyling *)v50;

    uint64_t v52 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"acTextColor"];
    autocorrectTextColor = v5->_autocorrectTextColor;
    v5->_autocorrectTextColor = (RTIColor *)v52;

    uint64_t v54 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"acTextBGColor"];
    autocorrectTextBackgroundColor = v5->_autocorrectTextBackgroundColor;
    v5->_autocorrectTextBackgroundColor = (RTIColor *)v54;

    v5->_originatedFromSource = [v4 decodeBoolForKey:@"originatedFromSource"];
    char v56 = [v4 decodeBoolForKey:@"supplementalLexiconForSelection"];
    v5->_canSuggestSupplementalItemsForCurrentSelection = v56;
    v5->_clearCanSuggestOnNextDocumentState = v56;
    uint64_t v57 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"insertionPointColor"];
    insertionPointColor = v5->_insertionPointColor;
    v5->_insertionPointColor = (RTIColor *)v57;
  }
  return v5;
}

+ (RTIDocumentState)documentStateWithRequest:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  uint64_t v6 = (void *)v5[2];
  v5[2] = v4;

  return (RTIDocumentState *)v5;
}

- (RTIDocumentState)init
{
  v11.receiver = self;
  v11.super_class = (Class)RTIDocumentState;
  v2 = [(RTIDocumentState *)&v11 init];
  v3 = v2;
  if (v2)
  {
    request = v2->_request;
    v2->_request = 0;

    documentState = v3->_documentState;
    v3->_documentState = 0;

    CGPoint v6 = (CGPoint)*MEMORY[0x1E4F1DB20];
    CGSize v7 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v3->_caretRectInWindow.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v3->_caretRectInWindow.CGSize size = v7;
    v3->_firstSelectionRectInWindow.origin = v6;
    v3->_firstSelectionRectInWindow.CGSize size = v7;
    v3->_clientFrameInWindow.origin = v6;
    v3->_clientFrameInWindow.CGSize size = v7;
    v3->_firstSelectionRectInEntitySpace.origin = v6;
    v3->_firstSelectionRectInEntitySpace.CGSize size = v7;
    v3->_clientFrameInEntitySpace.origin = v6;
    v3->_clientFrameInEntitySpace.CGSize size = v7;
    documentRects = v3->__documentRects;
    v3->__documentRects = 0;

    textCheckingAnnotatedString = v3->_textCheckingAnnotatedString;
    v3->_textCheckingAnnotatedString = 0;

    v3->_originatedFromSource = 0;
  }
  return v3;
}

- (id)description
{
  v12.receiver = self;
  v12.super_class = (Class)RTIDocumentState;
  v3 = [(RTIDocumentState *)&v12 description];
  id v4 = (void *)[v3 mutableCopy];

  if (self->_request) {
    [v4 appendFormat:@"; request = %@", self->_request];
  }
  if (self->_documentState) {
    [v4 appendFormat:@"; documentState = %@", self->_documentState];
  }
  if (self->_hasText) {
    [v4 appendFormat:@"; hasText = YES"];
  }
  if (!CGRectIsNull(self->_caretRectInWindow))
  {
    v5 = _RTI_NSStringFromCGRect(self->_caretRectInWindow.origin.x, self->_caretRectInWindow.origin.y, self->_caretRectInWindow.size.width, self->_caretRectInWindow.size.height);
    [v4 appendFormat:@"; caretRectInWindow = %@", v5];
  }
  if (!CGRectIsNull(self->_firstSelectionRectInWindow))
  {
    CGPoint v6 = _RTI_NSStringFromCGRect(self->_firstSelectionRectInWindow.origin.x, self->_firstSelectionRectInWindow.origin.y, self->_firstSelectionRectInWindow.size.width, self->_firstSelectionRectInWindow.size.height);
    [v4 appendFormat:@"; firstSelectionRectInWindow = %@", v6];
  }
  if (!CGRectIsNull(self->_clientFrameInWindow))
  {
    CGSize v7 = _RTI_NSStringFromCGRect(self->_clientFrameInWindow.origin.x, self->_clientFrameInWindow.origin.y, self->_clientFrameInWindow.size.width, self->_clientFrameInWindow.size.height);
    [v4 appendFormat:@"; clientFrameInWindow = %@", v7];
  }
  if (!CGRectIsNull(self->_firstSelectionRectInEntitySpace))
  {
    uint64_t v8 = _RTI_NSStringFromCGRect(self->_firstSelectionRectInEntitySpace.origin.x, self->_firstSelectionRectInEntitySpace.origin.y, self->_firstSelectionRectInEntitySpace.size.width, self->_firstSelectionRectInEntitySpace.size.height);
    [v4 appendFormat:@"; firstSelectionRectInEntitySpace = %@", v8];
  }
  if (!CGRectIsNull(self->_clientFrameInEntitySpace))
  {
    v9 = _RTI_NSStringFromCGRect(self->_clientFrameInEntitySpace.origin.x, self->_clientFrameInEntitySpace.origin.y, self->_clientFrameInEntitySpace.size.width, self->_clientFrameInEntitySpace.size.height);
    [v4 appendFormat:@"; clientFrameInEntitySpace = %@", v9];
  }
  if (self->_scrolling) {
    [v4 appendFormat:@"; scrolling"];
  }
  documentRects = self->__documentRects;
  if (documentRects) {
    objc_msgSend(v4, "appendFormat:", @"; documentRects = %lu rects",
  }
      [(NSMutableData *)documentRects length] >> 5);
  if (self->_textCheckingAnnotatedString) {
    objc_msgSend(v4, "appendFormat:", @"; textCheckingAnnotatedString = %p", self->_textCheckingAnnotatedString);
  }
  if (self->_autocorrectBubbleStyling) {
    [v4 appendFormat:@"; autocorrectBubbleStyling = %@", self->_autocorrectBubbleStyling];
  }
  if (self->_autocorrectTextColor) {
    [v4 appendFormat:@"; autocorrectTextColor = %@", self->_autocorrectTextColor];
  }
  if (self->_autocorrectTextBackgroundColor) {
    objc_msgSend(v4, "appendFormat:", @"; autocorrectTextBackgroundColor = %@",
  }
      self->_autocorrectTextBackgroundColor);
  if (self->_originatedFromSource) {
    [v4 appendString:@"; originatedFromSource = YES"];
  }
  if (self->_canSuggestSupplementalItemsForCurrentSelection) {
    [v4 appendString:@"; canSuggestSupplementalItemsForCurrentSelection = YES"];
  }
  if (self->_insertionPointColor) {
    [v4 appendFormat:@"; insertionPointColor = %@", self->_insertionPointColor];
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTIDocumentState *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      CGPoint v6 = [(RTIDocumentState *)self request];
      uint64_t v7 = [(RTIDocumentState *)v5 request];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        uint64_t v8 = (void *)v7;
        v9 = [(RTIDocumentState *)self request];
        uint64_t v10 = [(RTIDocumentState *)v5 request];
        int v11 = [v9 isEqual:v10];

        if (!v11) {
          goto LABEL_41;
        }
      }
      CGFloat v13 = [(RTIDocumentState *)self documentState];
      uint64_t v14 = [(RTIDocumentState *)v5 documentState];
      if (v13 == (void *)v14)
      {
      }
      else
      {
        CGFloat v15 = (void *)v14;
        CGSize v16 = [(RTIDocumentState *)self documentState];
        v17 = [(RTIDocumentState *)v5 documentState];
        int v18 = [v16 isEqual:v17];

        if (!v18) {
          goto LABEL_41;
        }
      }
      BOOL v19 = [(RTIDocumentState *)self hasText];
      if (v19 != [(RTIDocumentState *)v5 hasText]) {
        goto LABEL_41;
      }
      [(RTIDocumentState *)self caretRectInWindow];
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      CGFloat v27 = v26;
      [(RTIDocumentState *)v5 caretRectInWindow];
      v110.origin.x = v28;
      v110.origin.y = v29;
      v110.size.width = v30;
      v110.size.height = v31;
      v106.origin.x = v21;
      v106.origin.y = v23;
      v106.size.width = v25;
      v106.size.height = v27;
      if (!CGRectEqualToRect(v106, v110)) {
        goto LABEL_41;
      }
      [(RTIDocumentState *)self firstSelectionRectInWindow];
      CGFloat v33 = v32;
      CGFloat v35 = v34;
      CGFloat v37 = v36;
      CGFloat v39 = v38;
      [(RTIDocumentState *)v5 firstSelectionRectInWindow];
      v111.origin.x = v40;
      v111.origin.y = v41;
      v111.size.width = v42;
      v111.size.height = v43;
      v107.origin.x = v33;
      v107.origin.y = v35;
      v107.size.width = v37;
      v107.size.height = v39;
      if (!CGRectEqualToRect(v107, v111)) {
        goto LABEL_41;
      }
      [(RTIDocumentState *)self clientFrameInWindow];
      CGFloat v45 = v44;
      CGFloat v47 = v46;
      CGFloat v49 = v48;
      CGFloat v51 = v50;
      [(RTIDocumentState *)v5 clientFrameInWindow];
      v112.origin.x = v52;
      v112.origin.y = v53;
      v112.size.width = v54;
      v112.size.height = v55;
      v108.origin.x = v45;
      v108.origin.y = v47;
      v108.size.width = v49;
      v108.size.height = v51;
      if (!CGRectEqualToRect(v108, v112)) {
        goto LABEL_41;
      }
      [(RTIDocumentState *)self clientFrameInEntitySpace];
      CGFloat v57 = v56;
      CGFloat v59 = v58;
      CGFloat v61 = v60;
      CGFloat v63 = v62;
      [(RTIDocumentState *)v5 clientFrameInEntitySpace];
      v113.origin.x = v64;
      v113.origin.y = v65;
      v113.size.width = v66;
      v113.size.height = v67;
      v109.origin.x = v57;
      v109.origin.y = v59;
      v109.size.width = v61;
      v109.size.height = v63;
      if (!CGRectEqualToRect(v109, v113)) {
        goto LABEL_41;
      }
      BOOL v68 = [(RTIDocumentState *)self scrolling];
      if (v68 != [(RTIDocumentState *)v5 scrolling]) {
        goto LABEL_41;
      }
      v69 = [(RTIDocumentState *)self _documentRects];
      uint64_t v70 = [(RTIDocumentState *)v5 _documentRects];
      if (v69 == (void *)v70)
      {
      }
      else
      {
        v71 = (void *)v70;
        v72 = [(RTIDocumentState *)self _documentRects];
        v73 = [(RTIDocumentState *)v5 _documentRects];
        int v74 = [v72 isEqual:v73];

        if (!v74) {
          goto LABEL_41;
        }
      }
      v75 = [(RTIDocumentState *)self textCheckingAnnotatedString];
      uint64_t v76 = [(RTIDocumentState *)v5 textCheckingAnnotatedString];
      if (v75 == (void *)v76)
      {
      }
      else
      {
        v77 = (void *)v76;
        v78 = [(RTIDocumentState *)self textCheckingAnnotatedString];
        v79 = [(RTIDocumentState *)v5 textCheckingAnnotatedString];
        int v80 = [v78 isEqual:v79];

        if (!v80) {
          goto LABEL_41;
        }
      }
      v81 = [(RTIDocumentState *)self autocorrectBubbleStyling];
      uint64_t v82 = [(RTIDocumentState *)v5 autocorrectBubbleStyling];
      if (v81 == (void *)v82)
      {
      }
      else
      {
        v83 = (void *)v82;
        v84 = [(RTIDocumentState *)self autocorrectBubbleStyling];
        v85 = [(RTIDocumentState *)v5 autocorrectBubbleStyling];
        int v86 = [v84 isEqual:v85];

        if (!v86) {
          goto LABEL_41;
        }
      }
      v87 = [(RTIDocumentState *)self autocorrectTextColor];
      uint64_t v88 = [(RTIDocumentState *)v5 autocorrectTextColor];
      if (v87 == (void *)v88)
      {
      }
      else
      {
        v89 = (void *)v88;
        v90 = [(RTIDocumentState *)self autocorrectTextColor];
        v91 = [(RTIDocumentState *)v5 autocorrectTextColor];
        int v92 = [v90 isEqual:v91];

        if (!v92) {
          goto LABEL_41;
        }
      }
      v93 = [(RTIDocumentState *)self autocorrectTextBackgroundColor];
      uint64_t v94 = [(RTIDocumentState *)v5 autocorrectTextBackgroundColor];
      if (v93 == (void *)v94)
      {
      }
      else
      {
        v95 = (void *)v94;
        v96 = [(RTIDocumentState *)self autocorrectTextBackgroundColor];
        v97 = [(RTIDocumentState *)v5 autocorrectTextBackgroundColor];
        int v98 = [v96 isEqual:v97];

        if (!v98) {
          goto LABEL_41;
        }
      }
      BOOL v99 = [(RTIDocumentState *)self originatedFromSource];
      if (v99 == [(RTIDocumentState *)v5 originatedFromSource])
      {
        BOOL v100 = [(RTIDocumentState *)self canSuggestSupplementalItemsForCurrentSelection];
        if (v100 == [(RTIDocumentState *)v5 canSuggestSupplementalItemsForCurrentSelection])
        {
          v102 = [(RTIDocumentState *)self insertionPointColor];
          v103 = [(RTIDocumentState *)v5 insertionPointColor];
          if (v102 == v103)
          {
            char v12 = 1;
          }
          else
          {
            v104 = [(RTIDocumentState *)self insertionPointColor];
            v105 = [(RTIDocumentState *)v5 insertionPointColor];
            char v12 = [v104 isEqual:v105];
          }
          goto LABEL_42;
        }
      }
LABEL_41:
      char v12 = 0;
LABEL_42:

      goto LABEL_43;
    }
    char v12 = 0;
  }
LABEL_43:

  return v12;
}

- (void)setDocumentState:(id)a3
{
  if (self->_clearCanSuggestOnNextDocumentState)
  {
    self->_canSuggestSupplementalItemsForCurrentSelection = 0;
    self->_clearCanSuggestOnNextDocumentState = 0;
  }
}

- (_NSRange)selectionRangeForDocumentStateRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  if (a3.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    NSUInteger location = a3.location;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v6 = [(TIDocumentState *)self->_documentState truncatedRangeInSelectedText];
      if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v8 = v6;
        uint64_t v9 = v7;
        uint64_t v10 = [(TIDocumentState *)self->_documentState contextBeforeInput];
        NSUInteger v11 = [v10 length] + v8;

        if (v11 < location || v11 - location >= length)
        {
          if (v11 < location) {
            uint64_t v13 = v9;
          }
          else {
            uint64_t v13 = 0;
          }
          location += v13;
        }
        else
        {
          length += v9;
        }
      }
    }
  }
  NSUInteger v14 = location;
  NSUInteger v15 = length;
  result.NSUInteger length = v15;
  result.NSUInteger location = v14;
  return result;
}

- (_NSRange)documentStateRangeForSelectionRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (a3.location != 0x7FFFFFFFFFFFFFFFLL && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v6 = [(TIDocumentState *)self->_documentState truncatedRangeInSelectedText];
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v6 + v7 >= length) {
        uint64_t v8 = 0;
      }
      else {
        uint64_t v8 = v7;
      }
      length -= v8;
    }
  }
  NSUInteger v9 = location;
  NSUInteger v10 = length;
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (_NSRange)selectedTextRange
{
  v3 = [(TIDocumentState *)self->_documentState contextBeforeInput];
  uint64_t v4 = [v3 length];

  v5 = [(TIDocumentState *)self->_documentState selectedText];
  uint64_t v6 = [v5 length];

  NSUInteger v7 = v4;
  NSUInteger v8 = v6;
  result.NSUInteger length = v8;
  result.NSUInteger location = v7;
  return result;
}

- (void)setSelectedTextRange:(_NSRange)a3
{
  documentState = self->_documentState;
  if (a3.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_documentState = [(TIDocumentState *)documentState documentStateAfterCollapsingSelection];
  }
  else
  {
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    uint64_t v7 = [(TIDocumentState *)documentState contextBeforeInput];
    NSUInteger v8 = (void *)v7;
    if (v7) {
      NSUInteger v9 = (__CFString *)v7;
    }
    else {
      NSUInteger v9 = &stru_1EEAB1148;
    }
    double v24 = v9;

    uint64_t v10 = [(TIDocumentState *)self->_documentState selectedText];
    NSUInteger v11 = (void *)v10;
    if (v10) {
      char v12 = (__CFString *)v10;
    }
    else {
      char v12 = &stru_1EEAB1148;
    }
    uint64_t v13 = v12;

    uint64_t v14 = [(TIDocumentState *)self->_documentState contextAfterInput];
    NSUInteger v15 = (void *)v14;
    if (v14) {
      CGSize v16 = (__CFString *)v14;
    }
    else {
      CGSize v16 = &stru_1EEAB1148;
    }
    v17 = v16;

    int v18 = [NSString stringWithFormat:@"%@%@%@", v24, v13, v17];

    if (location >= [v18 length])
    {
      id v19 = v18;
      double v22 = 0;
      CGFloat v21 = 0;
    }
    else
    {
      id v19 = [v18 substringToIndex:location];
      NSUInteger v20 = location + length;
      if (location + length <= [v18 length])
      {
        if (length)
        {
          CGFloat v21 = objc_msgSend(v18, "substringWithRange:", location, length);
        }
        else
        {
          CGFloat v21 = 0;
        }
        double v22 = [v18 substringFromIndex:v20];
      }
      else
      {
        CGFloat v21 = [v18 substringFromIndex:location];
        double v22 = 0;
      }
    }
    CGFloat v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4FAE2A8]), "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:", v19, 0, v21, v22, 0x7FFFFFFFFFFFFFFFLL, 0);
    [(RTIDocumentState *)self setDocumentState:v23];
  }
  MEMORY[0x1F41817F8]();
}

- (_NSRange)markedTextRange
{
  v3 = [(TIDocumentState *)self->_documentState markedText];

  if (v3)
  {
    uint64_t v4 = [(TIDocumentState *)self->_documentState contextBeforeInput];
    uint64_t v5 = [v4 length];

    uint64_t v6 = [(TIDocumentState *)self->_documentState markedText];
    uint64_t v7 = [v6 length];
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  NSUInteger v8 = v5;
  NSUInteger v9 = v7;
  result.NSUInteger length = v9;
  result.NSUInteger location = v8;
  return result;
}

- (void)setTextCheckingAnnotatedString:(id)a3
{
  self->_textCheckingAnnotatedString = +[RTIUtilities _attributedStringWithoutDefaultAttributes:a3];
  MEMORY[0x1F41817F8]();
}

- (_NSRange)deltaForSelectionRange:(_NSRange)a3
{
  if (a3.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v3 = 0;
    NSUInteger v4 = 0;
  }
  else
  {
    NSUInteger length = a3.length;
    NSUInteger v4 = a3.location - [(RTIDocumentState *)self selectedTextRange];
    NSUInteger v3 = length - v6;
  }
  result.NSUInteger length = v3;
  result.NSUInteger location = v4;
  return result;
}

- (RTIRange)deltaRangeForSelection:(_NSRange)a3
{
  if (a3.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v3 = 0;
    int64_t v4 = 0;
  }
  else
  {
    NSUInteger length = a3.length;
    int64_t v4 = a3.location - [(RTIDocumentState *)self selectedTextRange];
    int64_t v3 = length - v6;
  }
  result.var1 = v3;
  result.var0 = v4;
  return result;
}

- (void)resetTextRects
{
}

- (void)addTextRect:(CGRect)a3 forCharacterRange:(_NSRange)a4
{
}

- (void)addTextRect:(CGRect)a3 forCharacterRange:(_NSRange)a4 granularity:(int64_t)a5
{
}

- (void)addTextRect:(CGRect)a3 forCharacterRange:(_NSRange)a4 granularity:(int64_t)a5 isVertical:(BOOL)a6
{
  int v7 = a5;
  unsigned int length = a4.length;
  unsigned int location = a4.location;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  NSUInteger v15 = [(RTIDocumentState *)self _documentRects];

  if (!v15)
  {
    CGSize v16 = [MEMORY[0x1E4F1CA58] dataWithCapacity:640];
    [(RTIDocumentState *)self set_documentRects:v16];
  }
  *(float *)&unsigned int v17 = x;
  *(float *)&unsigned int v18 = y;
  unint64_t v23 = __PAIR64__(v18, v17);
  *(float *)&unsigned int v19 = width;
  *(float *)&unsigned int v20 = height;
  LODWORD(v24) = v7;
  HIDWORD(v24) = a6;
  CGFloat v21 = [(RTIDocumentState *)self _documentRects];
  [v21 appendBytes:&v22 length:32];
}

- (void)_enumerateDocumentRectsWithOptions:(unint64_t)a3 block:(id)a4
{
  char v4 = a3;
  uint64_t v6 = a4;
  if (v6)
  {
    int v7 = [(RTIDocumentState *)self _documentRects];

    if (v7)
    {
      NSUInteger v8 = [(RTIDocumentState *)self _documentRects];
      unint64_t v9 = (unint64_t)(double)((unint64_t)[v8 length] >> 5);

      id v10 = [(RTIDocumentState *)self _documentRects];
      NSUInteger v11 = (long long *)[v10 bytes];

      char v26 = 0;
      if ((v4 & 2) != 0)
      {
        unint64_t v17 = v9 - 1;
        if ((uint64_t)(v9 - 1) >= 0)
        {
          unsigned int v18 = &v11[2 * v9 - 2];
          do
          {
            long long v19 = v18[1];
            long long v24 = *v18;
            long long v25 = v19;
            unsigned int v20 = (void (*)(void *, long long *, char *))v6[2];
            long long v22 = v24;
            long long v23 = v19;
            v20(v6, &v22, &v26);
            BOOL v16 = v17-- != 0;
            char v21 = v16;
            if (v26) {
              break;
            }
            v18 -= 2;
          }
          while ((v21 & 1) != 0);
        }
      }
      else if (v9)
      {
        unint64_t v12 = 1;
        do
        {
          long long v13 = *v11;
          long long v14 = v11[1];
          v11 += 2;
          long long v24 = v13;
          long long v25 = v14;
          NSUInteger v15 = (void (*)(void *, long long *, char *))v6[2];
          long long v22 = v13;
          long long v23 = v14;
          v15(v6, &v22, &v26);
          if (v26) {
            BOOL v16 = 1;
          }
          else {
            BOOL v16 = v12 >= v9;
          }
          ++v12;
        }
        while (!v16);
      }
    }
  }
}

- (CGRect)firstRectForCharacterRange:(_NSRange)a3
{
  -[RTIDocumentState firstRectForCharacterRange:withGranularity:isVerticalOut:](self, "firstRectForCharacterRange:withGranularity:isVerticalOut:", a3.location, a3.length, -1, 0);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)firstRectForCharacterRange:(_NSRange)a3 actualRange:(_NSRange *)a4
{
  -[RTIDocumentState firstRectForCharacterRange:withGranularity:isVerticalOut:actualRange:](self, "firstRectForCharacterRange:withGranularity:isVerticalOut:actualRange:", a3.location, a3.length, -1, 0, a4);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)firstRectForCharacterRange:(_NSRange)a3 withGranularity:(int64_t)a4
{
  -[RTIDocumentState firstRectForCharacterRange:withGranularity:isVerticalOut:](self, "firstRectForCharacterRange:withGranularity:isVerticalOut:", a3.location, a3.length, a4, 0);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)firstRectForCharacterRange:(_NSRange)a3 withGranularity:(int64_t)a4 isVerticalOut:(BOOL *)a5
{
  -[RTIDocumentState firstRectForCharacterRange:withGranularity:isVerticalOut:actualRange:](self, "firstRectForCharacterRange:withGranularity:isVerticalOut:actualRange:", a3.location, a3.length, a4, a5, 0);
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (CGRect)firstRectForCharacterRange:(_NSRange)a3 withGranularity:(int64_t)a4 isVerticalOut:(BOOL *)a5 actualRange:(_NSRange *)a6
{
  uint64_t v41 = 0;
  CGFloat v42 = &v41;
  uint64_t v43 = 0x4010000000;
  double v44 = &unk_19B021A19;
  long long v45 = 0u;
  long long v46 = 0u;
  *(float *)&unsigned int v8 = *MEMORY[0x1E4F1DB20];
  *(float *)&unsigned int v9 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  *((void *)&v45 + 1) = __PAIR64__(v9, v8);
  *(float *)&unsigned int v10 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  *(float *)&unsigned int v11 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  *(void *)&long long v46 = __PAIR64__(v11, v10);
  BYTE12(v46) = 0;
  uint64_t v31 = 0;
  double v32 = (float *)&v31;
  uint64_t v33 = 0x4010000000;
  double v34 = &unk_19B021A19;
  uint64_t v35 = 0;
  uint64_t v40 = 0;
  unsigned int v36 = v8;
  unsigned int v37 = v9;
  unsigned int v38 = v10;
  unsigned int v39 = v11;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __89__RTIDocumentState_firstRectForCharacterRange_withGranularity_isVerticalOut_actualRange___block_invoke;
  v29[3] = &unk_1E583C788;
  v29[6] = a4;
  _NSRange v30 = a3;
  v29[4] = &v41;
  v29[5] = &v31;
  [(RTIDocumentState *)self _enumerateDocumentRectsWithOptions:0 block:v29];
  double v12 = v32[10];
  double v13 = v32[11];
  double v14 = v32[12];
  double v15 = v32[13];
  v47.origin.double x = v12;
  v47.origin.double y = v13;
  v47.size.double width = v14;
  v47.size.double height = v15;
  if (CGRectIsInfinite(v47)
    || (v48.origin.x = v12, v48.origin.y = v13, v48.size.width = v14, v48.size.double height = v15, CGRectIsEmpty(v48)))
  {
    BOOL v16 = RTILogFacility();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[RTIDocumentState firstRectForCharacterRange:withGranularity:isVerticalOut:actualRange:](v16);
    }

    unint64_t v17 = v32;
    long long v18 = *((_OWORD *)v42 + 3);
    *((_OWORD *)v32 + 2) = *((_OWORD *)v42 + 2);
    *((_OWORD *)v17 + 3) = v18;
    if (a5) {
      goto LABEL_6;
    }
  }
  else
  {
    unint64_t v17 = v32;
    if (a5) {
LABEL_6:
    }
      *a5 = *((unsigned char *)v17 + 60);
  }
  if (a6)
  {
    uint64_t v19 = *((void *)v17 + 4);
    v20.unsigned int location = v19;
    v20.unsigned int length = HIDWORD(v19);
    *a6 = v20;
  }
  double v21 = v17[10];
  double v22 = v17[11];
  double v23 = v17[12];
  double v24 = v17[13];
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v41, 8);
  double v25 = v21;
  double v26 = v22;
  double v27 = v23;
  double v28 = v24;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

__n128 __89__RTIDocumentState_firstRectForCharacterRange_withGranularity_isVerticalOut_actualRange___block_invoke(void *a1, unsigned int *a2, unsigned char *a3)
{
  double v6 = *(float **)(a1[4] + 8);
  v15.origin.double x = v6[10];
  v15.origin.double y = v6[11];
  v15.size.double width = v6[12];
  v15.size.double height = v6[13];
  if (CGRectIsNull(v15))
  {
    uint64_t v8 = *(void *)(a1[4] + 8);
    __n128 result = *(__n128 *)a2;
    long long v9 = *((_OWORD *)a2 + 1);
    *(_OWORD *)(v8 + 32) = *(_OWORD *)a2;
    *(_OWORD *)(v8 + 48) = v9;
  }
  uint64_t v10 = a1[6];
  if (v10 == -1 || v10 == a2[6])
  {
    v11.unsigned int location = *a2;
    v12.unsigned int location = a1[7];
    if (v12.location == v11.location || (v11.unsigned int length = a2[1], v12.unsigned int length = a1[8], NSIntersectionRange(v12, v11).length))
    {
      uint64_t v13 = *(void *)(a1[5] + 8);
      __n128 result = *(__n128 *)a2;
      long long v14 = *((_OWORD *)a2 + 1);
      *(_OWORD *)(v13 + 32) = *(_OWORD *)a2;
      *(_OWORD *)(v13 + 48) = v14;
      *a3 = 1;
    }
  }
  return result;
}

- (id)rectsForCharacterRange:(_NSRange)a3 withGranularity:(int64_t)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v11 = 0;
  NSRange v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__0;
  CGRect v15 = __Block_byref_object_dispose__0;
  id v16 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__RTIDocumentState_rectsForCharacterRange_withGranularity___block_invoke;
  v10[3] = &unk_1E583C7B0;
  v10[6] = location;
  v10[7] = length;
  v10[4] = &v11;
  v10[5] = a4;
  [(RTIDocumentState *)self _enumerateDocumentRectsWithOptions:0 block:v10];
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __59__RTIDocumentState_rectsForCharacterRange_withGranularity___block_invoke(NSRange a1)
{
  NSUInteger length = (float *)a1.length;
  NSUInteger location = a1.location;
  uint64_t v3 = *(void *)(a1.location + 40);
  if (v3 == -1 || v3 == *(_DWORD *)(a1.length + 24))
  {
    v4.NSUInteger location = *(unsigned int *)a1.length;
    a1.NSUInteger location = *(void *)(a1.location + 48);
    if (a1.location == v4.location
      || (v4.NSUInteger length = *(unsigned int *)(a1.length + 4),
          a1.NSUInteger length = *(void *)(location + 56),
          NSIntersectionRange(a1, v4).length))
    {
      objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", length[2], length[3], length[4], length[5]);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      [*(id *)(*(void *)(*(void *)(location + 32) + 8) + 40) addObject:v5];
    }
  }
}

- (void)enumerateRectsWithOptions:(unint64_t)a3 range:(_NSRange)a4 granularity:(int64_t)a5 block:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v11 = a6;
  NSRange v12 = v11;
  if (v11)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __70__RTIDocumentState_enumerateRectsWithOptions_range_granularity_block___block_invoke;
    v13[3] = &unk_1E583C7D8;
    int64_t v15 = a5;
    NSUInteger v16 = location;
    NSUInteger v17 = length;
    id v14 = v11;
    [(RTIDocumentState *)self _enumerateDocumentRectsWithOptions:a3 block:v13];
  }
}

NSUInteger __70__RTIDocumentState_enumerateRectsWithOptions_range_granularity_block___block_invoke(NSUInteger result, float *a2)
{
  NSUInteger v3 = result;
  uint64_t v4 = *(void *)(result + 40);
  if (v4 == -1 || v4 == *((_DWORD *)a2 + 6))
  {
    uint64_t v6 = *(unsigned int *)a2;
    uint64_t v5 = *((unsigned int *)a2 + 1);
    v15.NSUInteger location = *(void *)(result + 48);
    v15.NSUInteger length = *(void *)(v3 + 56);
    v16.NSUInteger location = *(unsigned int *)a2;
    v16.NSUInteger length = *((unsigned int *)a2 + 1);
    NSRange v11 = NSIntersectionRange(v15, v16);
    __n128 result = v11.location;
    if (v11.location == v6 && v11.length == v5)
    {
      v7.n128_f64[0] = a2[2];
      v8.n128_f64[0] = a2[3];
      v9.n128_f64[0] = a2[4];
      v10.n128_f64[0] = a2[5];
      uint64_t v13 = *(uint64_t (**)(__n128, __n128, __n128, __n128))(*(void *)(v3 + 32) + 16);
      return v13(v7, v8, v9, v10);
    }
  }
  return result;
}

- (unint64_t)characterIndexForPoint:(CGPoint)a3
{
  uint64_t v7 = 0;
  __n128 v8 = &v7;
  uint64_t v9 = 0x3010000000;
  __n128 v10 = &unk_19B021A19;
  long long v11 = xmmword_19B01D570;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__RTIDocumentState_characterIndexForPoint___block_invoke;
  v5[3] = &unk_1E583C800;
  CGPoint v6 = a3;
  v5[4] = &v7;
  [(RTIDocumentState *)self _enumerateDocumentRectsWithOptions:0 block:v5];
  unint64_t v3 = v8[4];
  _Block_object_dispose(&v7, 8);
  return v3;
}

BOOL __43__RTIDocumentState_characterIndexForPoint___block_invoke(uint64_t a1, float *a2, unsigned char *a3)
{
  v8.origin.double x = a2[2];
  v8.origin.double y = a2[3];
  v8.size.double width = a2[4];
  v8.size.double height = a2[5];
  BOOL result = CGRectContainsPoint(v8, *(CGPoint *)(a1 + 40));
  if (result)
  {
    uint64_t v7 = *((unsigned int *)a2 + 1);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = *(unsigned int *)a2;
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = v7;
    *a3 = 1;
  }
  return result;
}

- (RTIDocumentRequest)request
{
  return self->_request;
}

- (TIDocumentState)documentState
{
  return self->_documentState;
}

- (BOOL)hasText
{
  return self->_hasText;
}

- (void)setHasText:(BOOL)a3
{
  self->_hasText = a3;
}

- (CGRect)caretRectInWindow
{
  double x = self->_caretRectInWindow.origin.x;
  double y = self->_caretRectInWindow.origin.y;
  double width = self->_caretRectInWindow.size.width;
  double height = self->_caretRectInWindow.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCaretRectInWindow:(CGRect)a3
{
  self->_caretRectInWindow = a3;
}

- (CGRect)firstSelectionRectInWindow
{
  double x = self->_firstSelectionRectInWindow.origin.x;
  double y = self->_firstSelectionRectInWindow.origin.y;
  double width = self->_firstSelectionRectInWindow.size.width;
  double height = self->_firstSelectionRectInWindow.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFirstSelectionRectInWindow:(CGRect)a3
{
  self->_firstSelectionRectInWindow = a3;
}

- (CGRect)clientFrameInWindow
{
  double x = self->_clientFrameInWindow.origin.x;
  double y = self->_clientFrameInWindow.origin.y;
  double width = self->_clientFrameInWindow.size.width;
  double height = self->_clientFrameInWindow.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setClientFrameInWindow:(CGRect)a3
{
  self->_clientFrameInWindow = a3;
}

- (CGRect)firstSelectionRectInEntitySpace
{
  double x = self->_firstSelectionRectInEntitySpace.origin.x;
  double y = self->_firstSelectionRectInEntitySpace.origin.y;
  double width = self->_firstSelectionRectInEntitySpace.size.width;
  double height = self->_firstSelectionRectInEntitySpace.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFirstSelectionRectInEntitySpace:(CGRect)a3
{
  self->_firstSelectionRectInEntitySpace = a3;
}

- (CGRect)clientFrameInEntitySpace
{
  double x = self->_clientFrameInEntitySpace.origin.x;
  double y = self->_clientFrameInEntitySpace.origin.y;
  double width = self->_clientFrameInEntitySpace.size.width;
  double height = self->_clientFrameInEntitySpace.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setClientFrameInEntitySpace:(CGRect)a3
{
  self->_clientFrameInEntitySpace = a3;
}

- (BOOL)scrolling
{
  return self->_scrolling;
}

- (void)setScrolling:(BOOL)a3
{
  self->_scrolling = a3;
}

- (BOOL)originatedFromSource
{
  return self->_originatedFromSource;
}

- (void)setOriginatedFromSource:(BOOL)a3
{
  self->_originatedFromSource = a3;
}

- (BOOL)canSuggestSupplementalItemsForCurrentSelection
{
  return self->_canSuggestSupplementalItemsForCurrentSelection;
}

- (void)setCanSuggestSupplementalItemsForCurrentSelection:(BOOL)a3
{
  self->_canSuggestSupplementalItemsForCurrentSelection = a3;
}

- (NSAttributedString)textCheckingAnnotatedString
{
  return self->_textCheckingAnnotatedString;
}

- (RTITextStyling)autocorrectBubbleStyling
{
  return self->_autocorrectBubbleStyling;
}

- (void)setAutocorrectBubbleStyling:(id)a3
{
}

- (RTIColor)autocorrectTextColor
{
  return self->_autocorrectTextColor;
}

- (void)setAutocorrectTextColor:(id)a3
{
}

- (RTIColor)autocorrectTextBackgroundColor
{
  return self->_autocorrectTextBackgroundColor;
}

- (void)setAutocorrectTextBackgroundColor:(id)a3
{
}

- (RTIColor)insertionPointColor
{
  return self->_insertionPointColor;
}

- (void)setInsertionPointColor:(id)a3
{
}

- (NSMutableData)_documentRects
{
  return self->__documentRects;
}

- (void)set_documentRects:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__documentRects, 0);
  objc_storeStrong((id *)&self->_insertionPointColor, 0);
  objc_storeStrong((id *)&self->_autocorrectTextBackgroundColor, 0);
  objc_storeStrong((id *)&self->_autocorrectTextColor, 0);
  objc_storeStrong((id *)&self->_autocorrectBubbleStyling, 0);
  objc_storeStrong((id *)&self->_textCheckingAnnotatedString, 0);
  objc_storeStrong((id *)&self->_documentState, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (void)firstRectForCharacterRange:(os_log_t)log withGranularity:isVerticalOut:actualRange:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[RTIDocumentState firstRectForCharacterRange:withGranularity:isVerticalOut:actualRange:]";
  _os_log_error_impl(&dword_19AFFA000, log, OS_LOG_TYPE_ERROR, "%s  ERROR: We are falling back to the first value. The client is not setting the range correctly.", (uint8_t *)&v1, 0xCu);
}

@end