@interface ICTableSelectionKnob
- (BOOL)_accessibilityHasTextOperations;
- (BOOL)isAccessibilityElement;
- (BOOL)isEnd;
- (BOOL)isHovering;
- (BOOL)isStart;
- (BOOL)speakCurrentSelectionAXAction;
- (CGRect)circleRect;
- (ICTableAttachmentViewController)tableAttachmentViewController;
- (ICTableSelectionKnob)initWithFrame:(CGRect)a3;
- (ICTableSelectionKnob)initWithTableAttachmentViewController:(id)a3;
- (UIPointerInteraction)pointerInteraction;
- (id)_accessibilityTextOperations;
- (id)accessibilityContainer;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)aggregatedAttributedTextForCellRangeSelection;
- (id)axCopyString;
- (id)axCutString;
- (id)axLeftToRightString;
- (id)axMakeBoldString;
- (id)axMakeItalicString;
- (id)axMakeNotBoldString;
- (id)axMakeNotItalicString;
- (id)axMakeNotStrikethroughString;
- (id)axMakeNotUnderlinedString;
- (id)axMakeStrikethroughString;
- (id)axMakeUnderlinedString;
- (id)axPasteString;
- (id)axRightToLeftString;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityTextOperationAction:(id)a3;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)getBoldForSelection:(BOOL *)a3 italic:(BOOL *)a4 underline:(BOOL *)a5 strikethrough:(BOOL *)a6 rightToLeft:(BOOL *)a7;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)setFrame:(CGRect)a3;
- (void)setHovering:(BOOL)a3;
- (void)setPointerInteraction:(id)a3;
- (void)setTableAttachmentViewController:(id)a3;
@end

@implementation ICTableSelectionKnob

- (ICTableSelectionKnob)initWithTableAttachmentViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICTableSelectionKnob;
  v5 = [(ICTableSelectionKnob *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_tableAttachmentViewController, v4);
  }

  return v6;
}

- (ICTableSelectionKnob)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ICTableSelectionKnob;
  v3 = -[ICTableSelectionKnob initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263F82A70]) initWithDelegate:v3];
    pointerInteraction = v3->_pointerInteraction;
    v3->_pointerInteraction = (UIPointerInteraction *)v4;

    v6 = [MEMORY[0x263F825C8] clearColor];
    [(ICTableSelectionKnob *)v3 setBackgroundColor:v6];

    v7 = [(ICTableSelectionKnob *)v3 pointerInteraction];
    [(ICTableSelectionKnob *)v3 addInteraction:v7];

    objc_super v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v3 selector:sel_accessibilityDarkerSystemColorsStatusDidChange_ name:*MEMORY[0x263F831A0] object:0];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICTableSelectionKnob;
  [(ICTableSelectionKnob *)&v4 dealloc];
}

- (void)setFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICTableSelectionKnob;
  -[ICTableSelectionKnob setFrame:](&v5, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_super v4 = [(ICTableSelectionKnob *)self pointerInteraction];
  [v4 invalidate];
}

- (CGRect)circleRect
{
  [(ICTableSelectionKnob *)self bounds];
  double v4 = v3 * 0.5;
  [(ICTableSelectionKnob *)self bounds];
  double v6 = v5 * 0.5;
  double v7 = -*MEMORY[0x263F5B1B0];
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  double v10 = v4;

  return CGRectInset(*(CGRect *)&v10, v7, v7);
}

- (void)drawRect:(CGRect)a3
{
  CurrentContext = UIGraphicsGetCurrentContext();
  double v5 = [(ICTableSelectionKnob *)self tintColor];
  BOOL v6 = [(ICTableSelectionKnob *)self isHovering];
  [(ICTableSelectionKnob *)self circleRect];
  CGContextAddEllipseInRect(CurrentContext, v10);
  if (v6)
  {
    id v7 = [MEMORY[0x263F825C8] whiteColor];
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v7 CGColor]);

    CGContextFillPath(CurrentContext);
    [(ICTableSelectionKnob *)self circleRect];
    CGRect v12 = CGRectInset(v11, 1.0, 1.0);
    CGContextAddEllipseInRect(CurrentContext, v12);
  }
  id v8 = v5;
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v8 CGColor]);
  CGContextFillPath(CurrentContext);
}

- (BOOL)isStart
{
  double v3 = [(ICTableSelectionKnob *)self tableAttachmentViewController];
  if (v3)
  {
    double v4 = [(ICTableSelectionKnob *)self tableAttachmentViewController];
    double v5 = [v4 startKnob];
    BOOL v6 = v5 == self;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isEnd
{
  double v3 = [(ICTableSelectionKnob *)self tableAttachmentViewController];
  if (v3)
  {
    double v4 = [(ICTableSelectionKnob *)self tableAttachmentViewController];
    double v5 = [v4 endKnob];
    BOOL v6 = v5 == self;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  [(ICTableSelectionKnob *)self circleRect];
  CGRect v9 = CGRectInset(v8, -4.0, -4.0);
  double v5 = (void *)MEMORY[0x263F82A80];

  return (id)objc_msgSend(v5, "regionWithRect:identifier:", 0, v9.origin.x, v9.origin.y, v9.size.width, v9.size.height);
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  -[ICTableSelectionKnob setHovering:](self, "setHovering:", 1, a4, a5);

  [(ICTableSelectionKnob *)self setNeedsDisplay];
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  -[ICTableSelectionKnob setHovering:](self, "setHovering:", 0, a4, a5);

  [(ICTableSelectionKnob *)self setNeedsDisplay];
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  double v5 = (void *)[objc_alloc(MEMORY[0x263F82CC8]) initWithView:self];
  BOOL v6 = [MEMORY[0x263F82A78] effectWithPreview:v5];
  [(ICTableSelectionKnob *)self frame];
  double v8 = v7;
  [(ICTableSelectionKnob *)self circleRect];
  double v10 = v8 + v9;
  [(ICTableSelectionKnob *)self frame];
  double v12 = v11;
  [(ICTableSelectionKnob *)self circleRect];
  double v14 = v12 + v13;
  [(ICTableSelectionKnob *)self circleRect];
  double v16 = v15;
  [(ICTableSelectionKnob *)self circleRect];
  v17 = objc_msgSend(MEMORY[0x263F82A88], "shapeWithRoundedRect:cornerRadius:", v10, v14, v16);
  v18 = [MEMORY[0x263F82A90] styleWithEffect:v6 shape:v17];

  return v18;
}

- (ICTableAttachmentViewController)tableAttachmentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableAttachmentViewController);

  return (ICTableAttachmentViewController *)WeakRetained;
}

- (void)setTableAttachmentViewController:(id)a3
{
}

- (BOOL)isHovering
{
  return self->_hovering;
}

- (void)setHovering:(BOOL)a3
{
  self->_hovering = a3;
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setPointerInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerInteraction, 0);

  objc_destroyWeak((id *)&self->_tableAttachmentViewController);
}

- (BOOL)isAccessibilityElement
{
  v2 = [(ICTableSelectionKnob *)self superview];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)accessibilityLabel
{
  if ([(ICTableSelectionKnob *)self isStart])
  {
    BOOL v3 = [MEMORY[0x263F086E0] mainBundle];
    double v4 = v3;
    double v5 = @"Start selection handle";
LABEL_5:
    BOOL v6 = [v3 localizedStringForKey:v5 value:&stru_26C10E100 table:0];

    goto LABEL_7;
  }
  if ([(ICTableSelectionKnob *)self isEnd])
  {
    BOOL v3 = [MEMORY[0x263F086E0] mainBundle];
    double v4 = v3;
    double v5 = @"End selection handle";
    goto LABEL_5;
  }
  [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"__objc_no", "-[ICTableSelectionKnob(ICAccessibility_iOS) accessibilityLabel]", 1, 0, @"Couldn't determine AX label for %@, make sure we have a tableAttachmentViewController set", self functionName simulateCrash showAlert format];
  BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (id)accessibilityHint
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"Double tap and hold, then drag to modify selected cell range.", &stru_26C10E100, 0 value table];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)ICTableSelectionKnob;
  return *MEMORY[0x263F81380] | [(ICTableSelectionKnob *)&v3 accessibilityTraits];
}

- (id)accessibilityContainer
{
  v2 = [(ICTableSelectionKnob *)self tableAttachmentViewController];
  objc_super v3 = [v2 tableAXController];
  double v4 = [v3 tableElement];

  return v4;
}

- (id)accessibilityCustomActions
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F823A0]);
  double v4 = [MEMORY[0x263F086E0] mainBundle];
  double v5 = [v4 localizedStringForKey:@"Speak current selection" value:&stru_26C10E100 table:0];
  BOOL v6 = (void *)[v3 initWithName:v5 target:self selector:sel_speakCurrentSelectionAXAction];

  v9[0] = v6;
  double v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];

  return v7;
}

- (BOOL)_accessibilityHasTextOperations
{
  return 1;
}

- (id)_accessibilityTextOperations
{
  id v3 = [MEMORY[0x263EFF980] array];
  __int16 v24 = 0;
  __int16 v23 = 0;
  unsigned __int8 v22 = 0;
  [(ICTableSelectionKnob *)self getBoldForSelection:(char *)&v24 + 1 italic:&v24 underline:(char *)&v23 + 1 strikethrough:&v23 rightToLeft:&v22];
  if (HIBYTE(v24)) {
    [(ICTableSelectionKnob *)self axMakeNotBoldString];
  }
  else {
  double v4 = [(ICTableSelectionKnob *)self axMakeBoldString];
  }
  if ((_BYTE)v24) {
    [(ICTableSelectionKnob *)self axMakeNotItalicString];
  }
  else {
  double v5 = [(ICTableSelectionKnob *)self axMakeItalicString];
  }
  if (HIBYTE(v23)) {
    [(ICTableSelectionKnob *)self axMakeNotUnderlinedString];
  }
  else {
  BOOL v6 = [(ICTableSelectionKnob *)self axMakeUnderlinedString];
  }
  if ((_BYTE)v23) {
    [(ICTableSelectionKnob *)self axMakeNotStrikethroughString];
  }
  else {
  double v7 = [(ICTableSelectionKnob *)self axMakeStrikethroughString];
  }
  if (v22) {
    [(ICTableSelectionKnob *)self axLeftToRightString];
  }
  else {
  double v8 = [(ICTableSelectionKnob *)self axRightToLeftString];
  }
  double v9 = [(ICTableSelectionKnob *)self tableAttachmentViewController];
  int v10 = [v9 canPerformAction:sel_cut_ withSender:self];

  if (v10)
  {
    double v11 = [(ICTableSelectionKnob *)self axCutString];
    [v3 addObject:v11];
  }
  double v12 = [(ICTableSelectionKnob *)self tableAttachmentViewController];
  int v13 = [v12 canPerformAction:sel_copy_ withSender:self];

  if (v13)
  {
    double v14 = [(ICTableSelectionKnob *)self axCopyString];
    [v3 addObject:v14];
  }
  double v15 = [(ICTableSelectionKnob *)self tableAttachmentViewController];
  int v16 = [v15 canPerformAction:sel_paste_ withSender:self];

  if (v16)
  {
    double v15 = [(ICTableSelectionKnob *)self axPasteString];
    [v3 addObject:v15];
  }
  [v3 addObject:v4];
  [v3 addObject:v5];
  [v3 addObject:v6];
  [v3 addObject:v7];
  int v17 = v22;
  if (v22)
  {
    double v15 = [(ICTableSelectionKnob *)self tableAttachmentViewController];
    if ([v15 canPerformAction:sel_makeTextWritingDirectionLeftToRight_ withSender:0])
    {

      goto LABEL_30;
    }
    if (v22)
    {

      goto LABEL_31;
    }
  }
  v18 = [(ICTableSelectionKnob *)self tableAttachmentViewController];
  int v19 = [v18 canPerformAction:sel_makeTextWritingDirectionRightToLeft_ withSender:0];

  if (v17)
  {

    if ((v19 & 1) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  if (v19) {
LABEL_30:
  }
    [v3 addObject:v8];
LABEL_31:
  v20 = (void *)[v3 copy];

  return v20;
}

- (void)_accessibilityTextOperationAction:(id)a3
{
  id v27 = a3;
  double v4 = [(ICTableSelectionKnob *)self axCutString];
  int v5 = [v27 isEqualToString:v4];

  if (v5)
  {
    BOOL v6 = [(ICTableSelectionKnob *)self tableAttachmentViewController];
    [v6 cut:self];
LABEL_23:

    goto LABEL_24;
  }
  double v7 = [(ICTableSelectionKnob *)self axCopyString];
  int v8 = [v27 isEqualToString:v7];

  if (v8)
  {
    BOOL v6 = [(ICTableSelectionKnob *)self tableAttachmentViewController];
    [v6 copy:self];
    goto LABEL_23;
  }
  double v9 = [(ICTableSelectionKnob *)self axPasteString];
  int v10 = [v27 isEqualToString:v9];

  if (v10)
  {
    BOOL v6 = [(ICTableSelectionKnob *)self tableAttachmentViewController];
    [v6 paste:self];
    goto LABEL_23;
  }
  double v11 = [(ICTableSelectionKnob *)self axMakeNotBoldString];
  if ([v27 isEqualToString:v11])
  {

LABEL_10:
    BOOL v6 = [(ICTableSelectionKnob *)self tableAttachmentViewController];
    [v6 toggleBoldface:self];
    goto LABEL_23;
  }
  double v12 = [(ICTableSelectionKnob *)self axMakeBoldString];
  int v13 = [v27 isEqualToString:v12];

  if (v13) {
    goto LABEL_10;
  }
  double v14 = [(ICTableSelectionKnob *)self axMakeNotItalicString];
  if ([v27 isEqualToString:v14])
  {

LABEL_14:
    BOOL v6 = [(ICTableSelectionKnob *)self tableAttachmentViewController];
    [v6 toggleItalics:self];
    goto LABEL_23;
  }
  double v15 = [(ICTableSelectionKnob *)self axMakeItalicString];
  int v16 = [v27 isEqualToString:v15];

  if (v16) {
    goto LABEL_14;
  }
  int v17 = [(ICTableSelectionKnob *)self axMakeNotUnderlinedString];
  if ([v27 isEqualToString:v17])
  {

LABEL_18:
    BOOL v6 = [(ICTableSelectionKnob *)self tableAttachmentViewController];
    [v6 toggleUnderline:self];
    goto LABEL_23;
  }
  v18 = [(ICTableSelectionKnob *)self axMakeUnderlinedString];
  int v19 = [v27 isEqualToString:v18];

  if (v19) {
    goto LABEL_18;
  }
  v20 = [(ICTableSelectionKnob *)self axMakeNotStrikethroughString];
  if ([v27 isEqualToString:v20])
  {

LABEL_22:
    BOOL v6 = [(ICTableSelectionKnob *)self tableAttachmentViewController];
    [v6 toggleStrikethrough:self];
    goto LABEL_23;
  }
  v21 = [(ICTableSelectionKnob *)self axMakeStrikethroughString];
  int v22 = [v27 isEqualToString:v21];

  if (v22) {
    goto LABEL_22;
  }
  __int16 v23 = [(ICTableSelectionKnob *)self axLeftToRightString];
  int v24 = [v27 isEqualToString:v23];

  if (v24)
  {
    BOOL v6 = [(ICTableSelectionKnob *)self tableAttachmentViewController];
    [v6 makeTextWritingDirectionLeftToRight:self];
    goto LABEL_23;
  }
  v25 = [(ICTableSelectionKnob *)self axRightToLeftString];
  int v26 = [v27 isEqualToString:v25];

  if (v26)
  {
    BOOL v6 = [(ICTableSelectionKnob *)self tableAttachmentViewController];
    [v6 makeTextWritingDirectionRightToLeft:self];
    goto LABEL_23;
  }
LABEL_24:
}

- (void)getBoldForSelection:(BOOL *)a3 italic:(BOOL *)a4 underline:(BOOL *)a5 strikethrough:(BOOL *)a6 rightToLeft:(BOOL *)a7
{
  int v13 = [(ICTableSelectionKnob *)self tableAttachmentViewController];
  double v14 = [v13 auxiliaryStylingController];
  char v15 = [v14 selectedStyleBIUS];

  *a3 = v15 & 1;
  *a4 = (v15 & 2) != 0;
  *a5 = (v15 & 4) != 0;
  *a6 = (v15 & 8) != 0;
  int v16 = [(ICTableSelectionKnob *)self aggregatedAttributedTextForCellRangeSelection];
  *a7 = 1;
  uint64_t v17 = *MEMORY[0x263F5AB28];
  uint64_t v18 = [v16 length];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __108__ICTableSelectionKnob_ICAccessibility_iOS__getBoldForSelection_italic_underline_strikethrough_rightToLeft___block_invoke;
  v19[3] = &__block_descriptor_40_e27_v40__0_8__NSRange_QQ_16_B32l;
  v19[4] = a7;
  objc_msgSend(v16, "enumerateAttribute:inRange:options:usingBlock:", v17, 0, v18, 0, v19);
}

void __108__ICTableSelectionKnob_ICAccessibility_iOS__getBoldForSelection_italic_underline_strikethrough_rightToLeft___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2)
  {
    id v7 = a2;
    objc_opt_class();
    ICDynamicCast();
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    if ([v8 writingDirection] != 1)
    {
      **(unsigned char **)(a1 + 32) = 0;
      *a5 = 1;
    }
  }
}

- (id)aggregatedAttributedTextForCellRangeSelection
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F089B8]);
  double v4 = [(ICTableSelectionKnob *)self tableAttachmentViewController];
  int v5 = [v4 tableSelection];
  int v24 = [v5 columns];

  BOOL v6 = [(ICTableSelectionKnob *)self tableAttachmentViewController];
  id v7 = [v6 tableSelection];
  id v8 = [v7 rows];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v8;
  uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v25)
  {
    uint64_t v23 = *(void *)v32;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v9;
        uint64_t v10 = *(void *)(*((void *)&v31 + 1) + 8 * v9);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v11 = v24;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v28;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v28 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * i);
              uint64_t v17 = [(ICTableSelectionKnob *)self tableAttachmentViewController];
              uint64_t v18 = [v17 tableAXController];
              int v19 = [v18 attributedContentStringForColumnID:v16 rowID:v10];

              if ([v19 length]) {
                [v3 appendAttributedString:v19];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
          }
          while (v13);
        }

        uint64_t v9 = v26 + 1;
      }
      while (v26 + 1 != v25);
      uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v25);
  }

  v20 = (void *)[v3 copy];

  return v20;
}

- (BOOL)speakCurrentSelectionAXAction
{
  id v3 = [(ICTableSelectionKnob *)self tableAttachmentViewController];
  double v4 = [v3 tableAXController];
  int v5 = [(ICTableSelectionKnob *)self tableAttachmentViewController];
  BOOL v6 = [v5 tableSelection];
  [v4 speakCellRangeSelection:v6];

  return 1;
}

- (id)axCutString
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"Cut" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)axCopyString
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"Copy" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)axPasteString
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"Paste" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)axRightToLeftString
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"Set right to left" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)axLeftToRightString
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"set left to right" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)axMakeBoldString
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"Set bold" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)axMakeNotBoldString
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"Set not bold" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)axMakeItalicString
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"Set italic" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)axMakeNotItalicString
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"Set not italic" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)axMakeUnderlinedString
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"Set underline" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)axMakeNotUnderlinedString
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"Set not underline" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)axMakeStrikethroughString
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"Set strike-through" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)axMakeNotStrikethroughString
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"Set not strike-through" value:&stru_26C10E100 table:0];

  return v3;
}

@end