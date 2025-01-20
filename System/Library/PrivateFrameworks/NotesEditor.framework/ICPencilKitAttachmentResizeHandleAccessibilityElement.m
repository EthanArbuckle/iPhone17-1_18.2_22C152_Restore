@interface ICPencilKitAttachmentResizeHandleAccessibilityElement
- (BOOL)isAccessibilityElement;
- (BOOL)isEnabled;
- (BOOL)top;
- (CGPoint)accessibilityActivationPoint;
- (CGRect)accessibilityFrame;
- (ICPencilKitAttachmentAccessibilityElement)attachmentElement;
- (ICPencilKitAttachmentResizeHandleAccessibilityElement)initWithAttachmentAccessibilityElement:(id)a3 drawingResizeView:(id)a4;
- (UIView)drawingResizeView;
- (id)accessibilityContainer;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)setAttachmentElement:(id)a3;
- (void)setDrawingResizeView:(id)a3;
@end

@implementation ICPencilKitAttachmentResizeHandleAccessibilityElement

- (ICPencilKitAttachmentResizeHandleAccessibilityElement)initWithAttachmentAccessibilityElement:(id)a3 drawingResizeView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 textView];
  v9 = [v8 accessibilityContainer];
  v10 = ICAccessibilityFindReparentingTarget(v9);

  v14.receiver = self;
  v14.super_class = (Class)ICPencilKitAttachmentResizeHandleAccessibilityElement;
  v11 = [(ICPencilKitAttachmentResizeHandleAccessibilityElement *)&v14 initWithAccessibilityContainer:v10];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_attachmentElement, v6);
    objc_storeWeak((id *)&v12->_drawingResizeView, v7);
  }

  return v12;
}

- (BOOL)top
{
  v3 = [(ICPencilKitAttachmentResizeHandleAccessibilityElement *)self drawingResizeView];
  [v3 accessibilityFrame];
  double MidY = CGRectGetMidY(v8);
  v5 = [(ICPencilKitAttachmentResizeHandleAccessibilityElement *)self attachmentElement];
  [v5 accessibilityFrame];
  BOOL v6 = MidY < CGRectGetMidY(v9);

  return v6;
}

- (BOOL)isEnabled
{
  v2 = [(ICPencilKitAttachmentResizeHandleAccessibilityElement *)self drawingResizeView];
  char v3 = [v2 safeBoolForKey:@"enabled"];

  return v3;
}

- (BOOL)isAccessibilityElement
{
  char v3 = [(ICPencilKitAttachmentResizeHandleAccessibilityElement *)self drawingResizeView];
  if ([v3 safeBoolForKey:@"shown"])
  {
    v4 = [(ICPencilKitAttachmentResizeHandleAccessibilityElement *)self drawingResizeView];
    if ([v4 isHidden])
    {
      BOOL v5 = 0;
    }
    else
    {
      BOOL v6 = [(ICPencilKitAttachmentResizeHandleAccessibilityElement *)self drawingResizeView];
      [v6 alpha];
      BOOL v5 = v7 > 0.0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)ICPencilKitAttachmentResizeHandleAccessibilityElement;
  unint64_t v3 = [(ICPencilKitAttachmentResizeHandleAccessibilityElement *)&v7 accessibilityTraits];
  BOOL v4 = [(ICPencilKitAttachmentResizeHandleAccessibilityElement *)self isEnabled];
  uint64_t v5 = *MEMORY[0x263F83290];
  if (v4) {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

- (id)accessibilityLabel
{
  BOOL v2 = [(ICPencilKitAttachmentResizeHandleAccessibilityElement *)self top];
  unint64_t v3 = [MEMORY[0x263F086E0] mainBundle];
  BOOL v4 = v3;
  if (v2) {
    uint64_t v5 = @"Handwriting area top resize handle";
  }
  else {
    uint64_t v5 = @"Handwriting area bottom resize handle";
  }
  BOOL v6 = [v3 localizedStringForKey:v5 value:&stru_26C10E100 table:0];

  return v6;
}

- (id)accessibilityHint
{
  BOOL v2 = [MEMORY[0x263F086E0] mainBundle];
  unint64_t v3 = [v2 localizedStringForKey:@"Double tap and hold, then drag to resize handwriting area.", &stru_26C10E100, 0 value table];

  return v3;
}

- (CGRect)accessibilityFrame
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  CGFloat v2 = *MEMORY[0x263F001A0];
  CGFloat v3 = *(double *)(MEMORY[0x263F001A0] + 8);
  CGFloat v4 = *(double *)(MEMORY[0x263F001A0] + 16);
  CGFloat v5 = *(double *)(MEMORY[0x263F001A0] + 24);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  BOOL v6 = [(ICPencilKitAttachmentResizeHandleAccessibilityElement *)self drawingResizeView];
  objc_super v7 = [v6 subviews];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    CGFloat v11 = v5;
    CGFloat v12 = v4;
    CGFloat v13 = v3;
    CGFloat v14 = v2;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v32.origin.x = v14;
        v32.origin.y = v13;
        v32.size.width = v12;
        v32.size.height = v11;
        v34.origin.x = v2;
        v34.origin.y = v3;
        v34.size.width = v4;
        v34.size.height = v5;
        BOOL v17 = CGRectEqualToRect(v32, v34);
        [v16 accessibilityFrame];
        if (!v17)
        {
          v35.origin.x = v14;
          v35.origin.y = v13;
          v35.size.width = v12;
          v35.size.height = v11;
          *(CGRect *)&CGFloat v18 = CGRectUnion(*(CGRect *)&v18, v35);
        }
        CGFloat v14 = v18;
        CGFloat v13 = v19;
        CGFloat v12 = v20;
        CGFloat v11 = v21;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v9);
  }
  else
  {
    CGFloat v11 = v5;
    CGFloat v12 = v4;
    CGFloat v13 = v3;
    CGFloat v14 = v2;
  }

  double v22 = v14;
  double v23 = v13;
  double v24 = v12;
  double v25 = v11;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGPoint)accessibilityActivationPoint
{
  CGFloat v2 = [(ICPencilKitAttachmentResizeHandleAccessibilityElement *)self drawingResizeView];
  CGFloat v3 = [v2 safeValueForKey:@"knobView"];

  [v3 accessibilityActivationPoint];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (id)accessibilityContainer
{
  v5.receiver = self;
  v5.super_class = (Class)ICPencilKitAttachmentResizeHandleAccessibilityElement;
  CGFloat v2 = [(ICPencilKitAttachmentResizeHandleAccessibilityElement *)&v5 accessibilityContainer];
  CGFloat v3 = ICAccessibilityFindReparentingTarget(v2);

  return v3;
}

- (ICPencilKitAttachmentAccessibilityElement)attachmentElement
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attachmentElement);

  return (ICPencilKitAttachmentAccessibilityElement *)WeakRetained;
}

- (void)setAttachmentElement:(id)a3
{
}

- (UIView)drawingResizeView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_drawingResizeView);

  return (UIView *)WeakRetained;
}

- (void)setDrawingResizeView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_drawingResizeView);

  objc_destroyWeak((id *)&self->_attachmentElement);
}

@end