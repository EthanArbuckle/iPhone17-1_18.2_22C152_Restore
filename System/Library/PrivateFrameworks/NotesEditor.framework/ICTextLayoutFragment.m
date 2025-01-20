@interface ICTextLayoutFragment
- (ICTextLayoutFragment)initWithTextElement:(id)a3 range:(id)a4;
- (_NSRange)nsRangeInTextStorage:(id)a3;
- (double)bottomMargin;
- (double)leadingPadding;
- (double)marginForTop:(BOOL)a3;
- (double)topMargin;
- (double)trailingPadding;
- (void)drawAtPoint:(CGPoint)a3 inContext:(CGContext *)a4;
@end

@implementation ICTextLayoutFragment

- (double)topMargin
{
  [(ICTextLayoutFragment *)self marginForTop:1];
  return result;
}

- (double)bottomMargin
{
  [(ICTextLayoutFragment *)self marginForTop:0];
  return result;
}

- (ICTextLayoutFragment)initWithTextElement:(id)a3 range:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ICTextLayoutFragment;
  return [(ICTextLayoutFragment *)&v5 initWithTextElement:a3 range:a4];
}

- (double)trailingPadding
{
  v3 = [(ICTextLayoutFragment *)self textElement];
  v4 = [v3 textContentManager];

  unint64_t v5 = [(ICTextLayoutFragment *)self nsRangeInTextStorage:v4];
  v6 = [v4 attributedString];
  unint64_t v7 = [v6 length];

  double v8 = 0.0;
  if (v5 < v7)
  {
    v9 = [v4 attributedString];
    v10 = [v9 attribute:*MEMORY[0x263F5AB28] atIndex:v5 effectiveRange:0];

    if ([v10 style] == 4) {
      double v8 = 4.0;
    }
    else {
      double v8 = 0.0;
    }
  }
  return v8;
}

- (double)leadingPadding
{
  v3 = [(ICTextLayoutFragment *)self textElement];
  v4 = [v3 textContentManager];

  unint64_t v5 = [(ICTextLayoutFragment *)self nsRangeInTextStorage:v4];
  v6 = [v4 attributedString];
  unint64_t v7 = [v6 length];

  double v8 = 0.0;
  if (v5 < v7)
  {
    v9 = [v4 attributedString];
    v10 = [v9 attribute:*MEMORY[0x263F814A0] atIndex:v5 effectiveRange:0];

    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      objc_opt_class();
      v11 = [(ICTextLayoutFragment *)self textLayoutManager];
      v12 = ICDynamicCast();

      objc_opt_class();
      v13 = [v12 textContainer];
      v14 = ICDynamicCast();

      objc_opt_class();
      v15 = ICDynamicCast();
      int v16 = [v15 effectiveAttachmentViewSizeForTextContainer:v14];
      if (v15 && v16 == 1)
      {

LABEL_12:
        goto LABEL_13;
      }
      v17 = [v14 tk2TextView];
      [v17 textContainerInset];
      double v19 = -v18;
      [v14 lineFragmentPadding];
      double v8 = v19 - v20;
    }
    v21 = [v4 attributedString];
    v12 = [v21 attribute:*MEMORY[0x263F5AB28] atIndex:v5 effectiveRange:0];

    if ([v12 style] == 4)
    {
      double v8 = (float)((float)(unint64_t)[v12 blockQuoteLevel] * 13.0) + 10.0;
    }
    else if ([v12 isBlockQuote])
    {
      double v8 = (double)(unint64_t)[v12 blockQuoteLevel] * 12.0;
    }
    goto LABEL_12;
  }
LABEL_13:

  return v8;
}

- (_NSRange)nsRangeInTextStorage:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ICTextLayoutFragment *)self textElement];
  v6 = [v5 textContentManager];
  unint64_t v7 = [v4 documentRange];

  double v8 = [v7 location];
  v9 = [(ICTextLayoutFragment *)self textElement];
  v10 = [v9 elementRange];
  v11 = [v10 location];
  uint64_t v12 = [v6 offsetFromLocation:v8 toLocation:v11];

  v13 = [(ICTextLayoutFragment *)self textElement];
  v14 = [v13 textContentManager];
  v15 = [(ICTextLayoutFragment *)self textElement];
  int v16 = [v15 elementRange];
  v17 = [v16 location];
  double v18 = [(ICTextLayoutFragment *)self textElement];
  double v19 = [v18 elementRange];
  double v20 = [v19 endLocation];
  uint64_t v21 = [v14 offsetFromLocation:v17 toLocation:v20];

  NSUInteger v22 = v12;
  NSUInteger v23 = v21;
  result.length = v23;
  result.location = v22;
  return result;
}

- (double)marginForTop:(BOOL)a3
{
  BOOL v3 = a3;
  objc_opt_class();
  unint64_t v5 = [(ICTextLayoutFragment *)self textElement];
  v6 = ICDynamicCast();

  unint64_t v7 = [v6 elementRange];
  double v8 = 0.0;
  if (([v7 isEmpty] & 1) == 0)
  {
    objc_opt_class();
    v9 = [v6 textContentManager];
    v10 = ICCheckedDynamicCast();

    v11 = [v10 documentRange];
    uint64_t v12 = [v11 location];
    v13 = [v7 location];
    uint64_t v14 = [v10 offsetFromLocation:v12 toLocation:v13];

    v15 = [v10 textStorage];
    int v16 = [v15 attribute:*MEMORY[0x263F814A0] atIndex:v14 effectiveRange:0];

    if (v3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && !v14)
      {
        double v8 = *MEMORY[0x263F5B1D0];
LABEL_29:

        goto LABEL_30;
      }
    }
    v17 = [v10 textStorage];
    double v18 = [v17 attribute:*MEMORY[0x263F5AB28] atIndex:v14 effectiveRange:0];

    if (v3 && [v18 style] == 103 && !v14)
    {
      double v19 = [(ICTextLayoutFragment *)self textElement];
      v41 = [v19 textContentManager];

      objc_opt_class();
      double v20 = [v41 textStorage];
      uint64_t v21 = [v20 styler];
      NSUInteger v22 = ICDynamicCast();

      NSUInteger v23 = [v22 zoomController];
      [v23 zoomFactor];
      double v25 = v24;

      if (v25 != 1.0)
      {
        double v8 = 2.0;
LABEL_28:

        goto LABEL_29;
      }
    }
    double v8 = 0.0;
    if ([v18 style] != 4) {
      goto LABEL_28;
    }
    unint64_t v26 = [(ICTextLayoutFragment *)self nsRangeInTextStorage:v10];
    uint64_t v28 = v27;
    v29 = [v10 attributedString];
    unint64_t v30 = [v29 length];

    if (v26 >= v30) {
      goto LABEL_28;
    }
    uint64_t v42 = v28;
    v31 = [v10 attributedString];
    v32 = [v31 attribute:*MEMORY[0x263F5AB28] atIndex:v26 effectiveRange:0];

    v33 = v32;
    if ([v32 style] != 4)
    {
LABEL_27:

      goto LABEL_28;
    }
    v34 = 0;
    uint64_t v35 = v42;
    if (v3) {
      uint64_t v35 = -1;
    }
    unint64_t v36 = v35 + v26;
    if ((uint64_t)(v35 + v26) >= 0 && v36 < v30)
    {
      v37 = v33;
      v38 = [v10 attributedString];
      v34 = [v38 attribute:*MEMORY[0x263F5AB28] atIndex:v36 effectiveRange:0];

      if (v34)
      {
        if ([v34 style] == 4)
        {
          v33 = v37;
          if ([v34 style] == 4)
          {
            uint64_t v39 = [v34 blockQuoteLevel];
            if (v39 == [v37 blockQuoteLevel]) {
              double v8 = 0.0;
            }
            else {
              double v8 = 10.0;
            }
          }
          goto LABEL_26;
        }
        double v8 = 10.0;
      }
      v33 = v37;
    }
LABEL_26:

    goto LABEL_27;
  }
LABEL_30:

  return v8;
}

- (void)drawAtPoint:(CGPoint)a3 inContext:(CGContext *)a4
{
  double y = a3.y;
  double x = a3.x;
  v31[1] = *MEMORY[0x263EF8340];
  objc_opt_class();
  double v8 = [(ICTextLayoutFragment *)self textLayoutManager];
  v9 = ICDynamicCast();

  objc_opt_class();
  v10 = [v9 textContainer];
  v11 = ICDynamicCast();

  uint64_t v12 = [MEMORY[0x263F82B60] mainScreen];
  [v12 bounds];
  double v14 = v13;

  if ([v11 insideSiriSnippet])
  {
    double v15 = v14 + v14;
    int v16 = [(ICTextLayoutFragment *)self textElement];
    v17 = [v16 elementRange];
    double v18 = [v17 location];
    double v19 = [v9 textLayoutFragmentForLocation:v18];
    [v19 layoutFragmentFrame];
    double v21 = v20;
    double v23 = v22;

    if (y + v21 < v15)
    {
      if (v23 + y + v21 <= v15)
      {
        v28.receiver = self;
        v28.super_class = (Class)ICTextLayoutFragment;
        -[ICTextLayoutFragment drawAtPoint:inContext:](&v28, sel_drawAtPoint_inContext_, a4, x, y);
      }
      else
      {
        unint64_t v30 = @"finalHeight";
        double v24 = objc_msgSend(NSNumber, "numberWithDouble:");
        v31[0] = v24;
        double v25 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];

        unint64_t v26 = [MEMORY[0x263F08A00] defaultCenter];
        [v26 postNotificationName:*MEMORY[0x263F5B548] object:0 userInfo:v25];

        v29.receiver = self;
        v29.super_class = (Class)ICTextLayoutFragment;
        -[ICTextLayoutFragment drawAtPoint:inContext:](&v29, sel_drawAtPoint_inContext_, a4, x, y);
      }
    }
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)ICTextLayoutFragment;
    -[ICTextLayoutFragment drawAtPoint:inContext:](&v27, sel_drawAtPoint_inContext_, a4, x, y);
  }
}

@end