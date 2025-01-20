@interface TSKSegmentedControl
- (BOOL)allowsEmptySelection;
- (BOOL)allowsMultipleSelection;
- (NSIndexSet)selectedSegmentIndices;
- (TSKSegmentedControl)initWithItems:(id)a3;
- (TSKSegmentedControl)initWithItems:(id)a3 style:(int)a4;
- (TSKSegmentedControl)initWithItems:(id)a3 style:(int)a4 target:(id)a5 action:(SEL)a6;
- (UIColor)selectedTintColor;
- (UIFont)font;
- (id)p_backgroundImageForButton:(id)a3 item:(id)a4 fillColor:(id)a5;
- (id)p_fullBleedBackgroundImageForButton:(id)a3 item:(id)a4 fillColor:(id)a5;
- (id)p_losengeBackgroundImageForButton:(id)a3 item:(id)a4 fillColor:(id)a5;
- (int)segmentedControlStyle;
- (int64_t)lastPressedSegmentIndex;
- (int64_t)tagForSegment:(unint64_t)a3;
- (unint64_t)numberOfSegments;
- (unint64_t)segmentWithTag:(int64_t)a3;
- (void)dealloc;
- (void)p_setButtonAttributedTitle:(id)a3 color:(id)a4 forState:(unint64_t)a5 button:(id)a6;
- (void)p_setSegmentedControlStyle:(int)a3;
- (void)p_setSelectedTintColor:(id)a3;
- (void)p_updateSegmentProperties;
- (void)setAllowsEmptySelection:(BOOL)a3;
- (void)setAllowsMultipleSelection:(BOOL)a3;
- (void)setBackgroundImage:(id)a3 forState:(unint64_t)a4 forSegment:(unint64_t)a5;
- (void)setEnabled:(BOOL)a3 forSegment:(unint64_t)a4;
- (void)setFont:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setImage:(id)a3 forSegment:(unint64_t)a4;
- (void)setSegmentedControlStyle:(int)a3;
- (void)setSelectedSegmentIndices:(id)a3;
- (void)setSelectedTintColor:(id)a3;
- (void)setTag:(int64_t)a3 forSegment:(unint64_t)a4;
- (void)setTitle:(id)a3 forSegment:(unint64_t)a4;
- (void)setUserData:(void *)a3;
- (void)sizeToFit;
- (void)sizeToFitWidth:(float)a3;
- (void)tappedSegment:(id)a3;
- (void)userData;
@end

@implementation TSKSegmentedControl

- (TSKSegmentedControl)initWithItems:(id)a3
{
  return [(TSKSegmentedControl *)self initWithItems:a3 style:0];
}

- (TSKSegmentedControl)initWithItems:(id)a3 style:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v11.receiver = self;
  v11.super_class = (Class)TSKSegmentedControl;
  v6 = -[TSKSegmentedControl initWithFrame:](&v11, sel_initWithFrame_, 0.0, 0.0, 0.0, 44.0);
  if (v6)
  {
    v6->mItems = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:a3];
    v6->mButtonSegments = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(a3, "count"));
    [(TSKSegmentedControl *)v6 setAllowsMultipleSelection:0];
    [(TSKSegmentedControl *)v6 setAllowsEmptySelection:0];
    v6->mLastPressedSegmentIndex = -1;
    uint64_t v7 = [a3 count];
    if (v7)
    {
      uint64_t v8 = v7;
      do
      {
        --v8;
        v9 = (void *)[MEMORY[0x263F1C488] buttonWithType:0];
        [v9 addTarget:v6 action:sel_tappedSegment_ forControlEvents:64];
        [v9 setAdjustsImageWhenHighlighted:0];
        [(TSKSegmentedControl *)v6 addSubview:v9];
        [(NSMutableArray *)v6->mButtonSegments addObject:v9];
      }
      while (v8);
    }
    [(TSKSegmentedControl *)v6 sizeToFit];
    [(TSKSegmentedControl *)v6 p_setSegmentedControlStyle:v4];
    [(TSKSegmentedControl *)v6 p_updateSegmentProperties];
    -[TSKSegmentedControl setSelectedSegmentIndices:](v6, "setSelectedSegmentIndices:", [MEMORY[0x263F088D0] indexSet]);
  }
  return v6;
}

- (TSKSegmentedControl)initWithItems:(id)a3 style:(int)a4 target:(id)a5 action:(SEL)a6
{
  uint64_t v8 = [(TSKSegmentedControl *)self initWithItems:a3 style:*(void *)&a4];
  v9 = v8;
  if (a6 && v8) {
    [(TSKSegmentedControl *)v8 addTarget:a5 action:a6 forControlEvents:64];
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSKSegmentedControl;
  [(TSKSegmentedControl *)&v3 dealloc];
}

- (void)p_setSelectedTintColor:(id)a3
{
  id v5 = a3;

  self->mSelectedTintColor = (UIColor *)a3;
}

- (void)setSelectedTintColor:(id)a3
{
  [(TSKSegmentedControl *)self p_setSelectedTintColor:a3];

  [(TSKSegmentedControl *)self p_updateSegmentProperties];
}

- (UIColor)selectedTintColor
{
  mSelectedTintColor = self->mSelectedTintColor;
  if (mSelectedTintColor)
  {
    objc_super v3 = mSelectedTintColor;
    return v3;
  }
  else
  {
    return (UIColor *)[(TSKSegmentedControl *)self tintColor];
  }
}

- (void)p_setSegmentedControlStyle:(int)a3
{
  self->_segmentedControlStyle = a3;
}

- (void)setSegmentedControlStyle:(int)a3
{
  [(TSKSegmentedControl *)self p_setSegmentedControlStyle:*(void *)&a3];

  [(TSKSegmentedControl *)self p_updateSegmentProperties];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  uint64_t v24 = *MEMORY[0x263EF8340];
  v22.receiver = self;
  v22.super_class = (Class)TSKSegmentedControl;
  -[TSKSegmentedControl setFrame:](&v22, sel_setFrame_, a3.origin.x, a3.origin.y);
  double v6 = floor(width / (double)[(TSKSegmentedControl *)self numberOfSegments]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  mButtonSegments = self->mButtonSegments;
  uint64_t v8 = [(NSMutableArray *)mButtonSegments countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    double v11 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(mButtonSegments);
        }
        objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "setFrame:", v11, 0.0, v6, height);
        double v11 = v6 + v11;
      }
      uint64_t v9 = [(NSMutableArray *)mButtonSegments countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v9);
  }
  double v13 = width - v6 * (double)[(TSKSegmentedControl *)self numberOfSegments];
  unint64_t v14 = [(TSKSegmentedControl *)self numberOfSegments];
  if (v13 > 0.0)
  {
    unint64_t v15 = v14 - 1;
    do
    {
      v16 = (void *)[(NSMutableArray *)self->mButtonSegments objectAtIndex:v15];
      [v16 frame];
      double v13 = v13 + -1.0;
      [v16 setFrame:v13 + v17];
      --v15;
    }
    while (v13 > 0.0);
  }
  [(TSKSegmentedControl *)self p_updateSegmentProperties];
}

- (void)sizeToFit
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  mButtonSegments = self->mButtonSegments;
  uint64_t v4 = [(NSMutableArray *)mButtonSegments countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(mButtonSegments);
        }
        objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "imageForState:", 0), "size");
        double v7 = v7 + v9;
      }
      uint64_t v5 = [(NSMutableArray *)mButtonSegments countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
    *(float *)&double v10 = v7;
  }
  else
  {
    double v10 = 0.0;
  }
  [(TSKSegmentedControl *)self sizeToFitWidth:v10];
}

- (void)sizeToFitWidth:(float)a3
{
  [(TSKSegmentedControl *)self frame];

  -[TSKSegmentedControl setFrame:](self, "setFrame:");
}

- (unint64_t)numberOfSegments
{
  return [(NSMutableArray *)self->mItems count];
}

- (void)setTitle:(id)a3 forSegment:(unint64_t)a4
{
  if ([(TSKSegmentedControl *)self numberOfSegments] > a4) {
    [(NSMutableArray *)self->mItems replaceObjectAtIndex:a4 withObject:a3];
  }

  [(TSKSegmentedControl *)self p_updateSegmentProperties];
}

- (void)setEnabled:(BOOL)a3 forSegment:(unint64_t)a4
{
  BOOL v5 = a3;
  if ([(TSKSegmentedControl *)self numberOfSegments] > a4)
  {
    double v7 = (void *)[(NSMutableArray *)self->mButtonSegments objectAtIndex:a4];
    [v7 setEnabled:v5];
  }
}

- (void)setImage:(id)a3 forSegment:(unint64_t)a4
{
  if ([(TSKSegmentedControl *)self numberOfSegments] > a4) {
    [(NSMutableArray *)self->mItems replaceObjectAtIndex:a4 withObject:a3];
  }

  [(TSKSegmentedControl *)self p_updateSegmentProperties];
}

- (void)setBackgroundImage:(id)a3 forState:(unint64_t)a4 forSegment:(unint64_t)a5
{
  if ([(TSKSegmentedControl *)self numberOfSegments] > a5)
  {
    objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->mButtonSegments, "objectAtIndex:", a5), "setBackgroundImage:forState:", a3, a4);
    if (!a4)
    {
      [(NSMutableArray *)self->mItems objectAtIndex:a5];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        mItems = self->mItems;
        [(NSMutableArray *)mItems replaceObjectAtIndex:a5 withObject:a3];
      }
    }
  }
}

- (void)setTag:(int64_t)a3 forSegment:(unint64_t)a4
{
  if ([(TSKSegmentedControl *)self numberOfSegments] > a4)
  {
    double v7 = (void *)[(NSMutableArray *)self->mButtonSegments objectAtIndex:a4];
    [v7 setTag:a3];
  }
}

- (int64_t)tagForSegment:(unint64_t)a3
{
  if ([(TSKSegmentedControl *)self numberOfSegments] <= a3) {
    return 0;
  }
  BOOL v5 = (void *)[(NSMutableArray *)self->mButtonSegments objectAtIndex:a3];

  return [v5 tag];
}

- (unint64_t)segmentWithTag:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  mButtonSegments = self->mButtonSegments;
  uint64_t v5 = [(NSMutableArray *)mButtonSegments countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      uint64_t v9 = 0;
      uint64_t v10 = v7 + v6;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(mButtonSegments);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * v9) tag] == a3) {
          return v7 + v9;
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [(NSMutableArray *)mButtonSegments countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v7 = v10;
      if (v6) {
        continue;
      }
      break;
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)p_fullBleedBackgroundImageForButton:(id)a3 item:(id)a4 fillColor:(id)a5
{
  v10.double width = 3.0;
  v10.double height = 3.0;
  UIGraphicsBeginImageContextWithOptions(v10, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.double width = 3.0;
  v11.size.double height = 3.0;
  CGContextClearRect(CurrentContext, v11);
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[a5 CGColor]);
  v12.origin.x = 0.0;
  v12.origin.y = 0.0;
  v12.size.double width = 3.0;
  v12.size.double height = 3.0;
  CGContextFillRect(CurrentContext, v12);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return -[UIImage resizableImageWithCapInsets:](ImageFromCurrentImageContext, "resizableImageWithCapInsets:", 1.0, 1.0, 1.0, 1.0);
}

- (id)p_losengeBackgroundImageForButton:(id)a3 item:(id)a4 fillColor:(id)a5
{
  objc_opt_class();
  if (TSUDynamicCast())
  {
    [a3 bounds];
    objc_msgSend(a3, "contentRectForBounds:");
    objc_msgSend(a3, "imageRectForContentRect:");
    double v8 = v7;
  }
  else
  {
    double v8 = 0.0;
  }
  objc_opt_class();
  if (TSUDynamicCast())
  {
    [a3 bounds];
    objc_msgSend(a3, "contentRectForBounds:");
    objc_msgSend(a3, "titleRectForContentRect:");
    double v8 = v9;
  }
  [a3 bounds];
  objc_msgSend(a3, "backgroundRectForBounds:");
  double width = v17.size.width;
  double height = v17.size.height;
  if (CGRectIsEmpty(v17)) {
    return 0;
  }
  v16.double width = width;
  v16.double height = height;
  UIGraphicsBeginImageContextWithOptions(v16, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.double width = width;
  v18.size.double height = height;
  CGContextClearRect(CurrentContext, v18);
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[a5 CGColor]);
  double v14 = fmax(v8 + 15.0, 38.0);
  CGContextAddPath(CurrentContext, (CGPathRef)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:cornerRadius:", width * 0.5 - v14 * 0.5, height * 0.5 + -19.0, v14, 38.0, 19.0), "CGPath"));
  CGContextFillPath(CurrentContext);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return ImageFromCurrentImageContext;
}

- (id)p_backgroundImageForButton:(id)a3 item:(id)a4 fillColor:(id)a5
{
  if ([(TSKSegmentedControl *)self segmentedControlStyle] == 1)
  {
    return [(TSKSegmentedControl *)self p_losengeBackgroundImageForButton:a3 item:a4 fillColor:a5];
  }
  else
  {
    return [(TSKSegmentedControl *)self p_fullBleedBackgroundImageForButton:a3 item:a4 fillColor:a5];
  }
}

- (void)p_setButtonAttributedTitle:(id)a3 color:(id)a4 forState:(unint64_t)a5 button:(id)a6
{
  v14[2] = *MEMORY[0x263EF8340];
  mFont = self->mFont;
  if (!mFont) {
    mFont = (UIFont *)[MEMORY[0x263F1C658] systemFontOfSize:17.0];
  }
  uint64_t v11 = *MEMORY[0x263F1C240];
  v13[0] = *MEMORY[0x263F1C238];
  v13[1] = v11;
  v14[0] = mFont;
  v14[1] = a4;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  objc_msgSend(a6, "setAttributedTitle:forState:", (id)objc_msgSend(objc_alloc(MEMORY[0x263F086A0]), "initWithString:attributes:", a3, v12), a5);
}

- (void)p_updateSegmentProperties
{
  if ([(TSKSegmentedControl *)self numberOfSegments])
  {
    uint64_t v3 = [MEMORY[0x263F1C550] whiteColor];
    uint64_t v20 = [(TSKSegmentedControl *)self tintColor];
    uint64_t v19 = objc_msgSend((id)-[TSKSegmentedControl tintColor](self, "tintColor"), "colorWithAlphaComponent:", 0.4);
    long long v21 = [(TSKSegmentedControl *)self selectedTintColor];
    uint64_t v4 = objc_msgSend((id)-[TSKSegmentedControl tintColor](self, "tintColor"), "colorWithAlphaComponent:", 0.14);
    uint64_t v5 = [(UIColor *)[(TSKSegmentedControl *)self selectedTintColor] colorWithAlphaComponent:0.5];
    if ([(TSKSegmentedControl *)self numberOfSegments])
    {
      unint64_t v6 = 0;
      do
      {
        double v7 = (void *)[(NSMutableArray *)self->mButtonSegments objectAtIndex:v6];
        objc_msgSend(v7, "setTintColor:", -[TSKSegmentedControl tintColor](self, "tintColor"));
        objc_opt_class();
        [(NSMutableArray *)self->mItems objectAtIndex:v6];
        double v8 = (void *)TSUDynamicCast();
        if (v8)
        {
          double v9 = v8;
          [v8 size];
          CGFloat v11 = v10;
          [v9 size];
          CGFloat height = v22.height;
          v22.double width = v11;
          UIGraphicsBeginImageContextWithOptions(v22, 0, 0.0);
          CurrentContext = UIGraphicsGetCurrentContext();
          CGContextTranslateCTM(CurrentContext, 0.0, height);
          CGContextScaleCTM(CurrentContext, 1.0, -1.0);
          double v14 = (CGImage *)[v9 CGImage];
          v23.origin.x = 0.0;
          v23.origin.y = 0.0;
          v23.size.double width = v11;
          v23.size.CGFloat height = height;
          CGContextClipToMask(CurrentContext, v23, v14);
          CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend((id)-[TSKSegmentedControl tintColor](self, "tintColor"), "CGColor"));
          v24.origin.x = 0.0;
          v24.origin.y = 0.0;
          v24.size.double width = v11;
          v24.size.CGFloat height = height;
          CGContextClearRect(CurrentContext, v24);
          v25.origin.x = 0.0;
          v25.origin.y = 0.0;
          v25.size.double width = v11;
          v25.size.CGFloat height = height;
          CGContextFillRect(CurrentContext, v25);
          ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
          CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C550], "whiteColor"), "CGColor"));
          v26.origin.x = 0.0;
          v26.origin.y = 0.0;
          v26.size.double width = v11;
          v26.size.CGFloat height = height;
          CGContextClearRect(CurrentContext, v26);
          v27.origin.x = 0.0;
          v27.origin.y = 0.0;
          v27.size.double width = v11;
          v27.size.CGFloat height = height;
          CGContextFillRect(CurrentContext, v27);
          CGSize v16 = UIGraphicsGetImageFromCurrentImageContext();
          UIGraphicsEndImageContext();
          [v7 setImage:ImageFromCurrentImageContext forState:0];
          [v7 setImage:v16 forState:4];
          [v7 setImage:v16 forState:5];
        }
        objc_opt_class();
        [(NSMutableArray *)self->mItems objectAtIndex:v6];
        uint64_t v17 = TSUDynamicCast();
        if (v17)
        {
          uint64_t v18 = v17;
          [(TSKSegmentedControl *)self p_setButtonAttributedTitle:v17 color:v20 forState:0 button:v7];
          [(TSKSegmentedControl *)self p_setButtonAttributedTitle:v18 color:v3 forState:4 button:v7];
          [(TSKSegmentedControl *)self p_setButtonAttributedTitle:v18 color:v3 forState:5 button:v7];
          [(TSKSegmentedControl *)self p_setButtonAttributedTitle:v18 color:v19 forState:2 button:v7];
        }
        [v7 setBackgroundImage:0 forState:0];
        objc_msgSend(v7, "setBackgroundImage:forState:", -[TSKSegmentedControl p_backgroundImageForButton:item:fillColor:](self, "p_backgroundImageForButton:item:fillColor:", v7, -[NSMutableArray objectAtIndex:](self->mItems, "objectAtIndex:", v6), v21), 4);
        objc_msgSend(v7, "setBackgroundImage:forState:", -[TSKSegmentedControl p_backgroundImageForButton:item:fillColor:](self, "p_backgroundImageForButton:item:fillColor:", v7, -[NSMutableArray objectAtIndex:](self->mItems, "objectAtIndex:", v6), v4), 1);
        objc_msgSend(v7, "setBackgroundImage:forState:", -[TSKSegmentedControl p_backgroundImageForButton:item:fillColor:](self, "p_backgroundImageForButton:item:fillColor:", v7, -[NSMutableArray objectAtIndex:](self->mItems, "objectAtIndex:", v6++), v5), 5);
      }
      while (v6 < [(TSKSegmentedControl *)self numberOfSegments]);
    }
  }
}

- (void)setSelectedSegmentIndices:(id)a3
{
  if (!-[NSIndexSet isEqualToIndexSet:](self->mSelectedSegmentIndices, "isEqualToIndexSet:"))
  {

    self->mSelectedSegmentIndices = (NSIndexSet *)[objc_alloc(MEMORY[0x263F088D0]) initWithIndexSet:a3];
    uint64_t v5 = [(NSMutableArray *)self->mButtonSegments count];
    if (v5)
    {
      uint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        [(NSMutableArray *)self->mButtonSegments objectAtIndex:i];
        objc_msgSend(MEMORY[0x263F1CB60], "transitionWithView:duration:options:animations:completion:", 0.2);
      }
    }
  }
}

uint64_t __49__TSKSegmentedControl_setSelectedSegmentIndices___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  uint64_t v2 = [*(id *)(a1[5] + 472) containsIndex:a1[6]];

  return [v1 setSelected:v2];
}

- (void)tappedSegment:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  self->int64_t mLastPressedSegmentIndex = [(NSMutableArray *)self->mButtonSegments indexOfObject:a3];
  if ([(TSKSegmentedControl *)self allowsMultipleSelection])
  {
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x263F089C8]), "initWithIndexSet:", -[TSKSegmentedControl selectedSegmentIndices](self, "selectedSegmentIndices"));
    int v5 = [v4 containsIndex:self->mLastPressedSegmentIndex];
    int64_t mLastPressedSegmentIndex = self->mLastPressedSegmentIndex;
    if (v5)
    {
      [v4 removeIndex:mLastPressedSegmentIndex];
      if (-[TSKSegmentedControl allowsEmptySelection](self, "allowsEmptySelection") || [v4 count]) {
        goto LABEL_7;
      }
      int64_t mLastPressedSegmentIndex = self->mLastPressedSegmentIndex;
    }
    [v4 addIndex:mLastPressedSegmentIndex];
LABEL_7:
    [(TSKSegmentedControl *)self setSelectedSegmentIndices:v4];

    goto LABEL_14;
  }
  if (![(TSKSegmentedControl *)self allowsEmptySelection])
  {
    double v8 = (void *)MEMORY[0x263F088D0];
    goto LABEL_12;
  }
  BOOL v7 = [(NSIndexSet *)[(TSKSegmentedControl *)self selectedSegmentIndices] containsIndex:self->mLastPressedSegmentIndex];
  double v8 = (void *)MEMORY[0x263F088D0];
  if (!v7)
  {
LABEL_12:
    uint64_t v9 = [v8 indexSetWithIndex:self->mLastPressedSegmentIndex];
    goto LABEL_13;
  }
  uint64_t v9 = [MEMORY[0x263F088D0] indexSet];
LABEL_13:
  [(TSKSegmentedControl *)self setSelectedSegmentIndices:v9];
LABEL_14:
  double v10 = self;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obuint64_t j = (id)[(TSKSegmentedControl *)self allTargets];
  uint64_t v34 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v34)
  {
    uint64_t v33 = *(void *)v45;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v45 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v35 = v11;
        uint64_t v12 = *(void **)(*((void *)&v44 + 1) + 8 * v11);
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v13 = (void *)[(TSKSegmentedControl *)self actionsForTarget:v12 forControlEvent:4096];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v49 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v41;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v41 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(NSString **)(*((void *)&v40 + 1) + 8 * i);
              SEL v19 = NSSelectorFromString(v18);
              if (objc_opt_respondsToSelector())
              {
                [v12 performSelector:v19 withObject:self];
              }
              else
              {
                uint64_t v20 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
                uint64_t v21 = [NSString stringWithUTF8String:"-[TSKSegmentedControl tappedSegment:]"];
                [v20 handleFailureInFunction:v21, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKSegmentedControl.m"), 513, @"%@ does not respond to selector %@", v12, v18 file lineNumber description];
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v40 objects:v49 count:16];
          }
          while (v15);
        }
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        CGSize v22 = (void *)[(TSKSegmentedControl *)self actionsForTarget:v12 forControlEvent:64];
        uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v48 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v37;
          do
          {
            for (uint64_t j = 0; j != v24; ++j)
            {
              if (*(void *)v37 != v25) {
                objc_enumerationMutation(v22);
              }
              CGRect v27 = *(NSString **)(*((void *)&v36 + 1) + 8 * j);
              SEL v28 = NSSelectorFromString(v27);
              if (objc_opt_respondsToSelector())
              {
                [v12 performSelector:v28 withObject:self];
              }
              else
              {
                v29 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
                uint64_t v30 = [NSString stringWithUTF8String:"-[TSKSegmentedControl tappedSegment:]"];
                [v29 handleFailureInFunction:v30, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKSegmentedControl.m"), 522, @"%@ does not respond to selector %@", v12, v27 file lineNumber description];
              }
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v36 objects:v48 count:16];
          }
          while (v24);
        }
        uint64_t v11 = v35 + 1;
      }
      while (v35 + 1 != v34);
      uint64_t v34 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v34);
  }
  v31 = self;
}

- (UIFont)font
{
  return self->mFont;
}

- (void)setFont:(id)a3
{
}

- (NSIndexSet)selectedSegmentIndices
{
  return self->mSelectedSegmentIndices;
}

- (BOOL)allowsMultipleSelection
{
  return self->mAllowsMultipleSelection;
}

- (void)setAllowsMultipleSelection:(BOOL)a3
{
  self->mAllowsMultipleSelection = a3;
}

- (BOOL)allowsEmptySelection
{
  return self->mAllowsEmptySelection;
}

- (void)setAllowsEmptySelection:(BOOL)a3
{
  self->mAllowsEmptySelection = a3;
}

- (int64_t)lastPressedSegmentIndex
{
  return self->mLastPressedSegmentIndex;
}

- (void)userData
{
  return self->mUserData;
}

- (void)setUserData:(void *)a3
{
  self->mUserData = a3;
}

- (int)segmentedControlStyle
{
  return self->_segmentedControlStyle;
}

@end