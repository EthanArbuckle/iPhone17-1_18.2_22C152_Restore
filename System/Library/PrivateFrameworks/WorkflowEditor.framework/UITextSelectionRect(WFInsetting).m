@interface UITextSelectionRect(WFInsetting)
- (WFInsetTextSelectionRect)wf_selectionRectByInsetting:()WFInsetting;
@end

@implementation UITextSelectionRect(WFInsetting)

- (WFInsetTextSelectionRect)wf_selectionRectByInsetting:()WFInsetting
{
  v5 = -[WFInsetTextSelectionRect initWithSelectionRect:insets:]([WFInsetTextSelectionRect alloc], "initWithSelectionRect:insets:", a1, a2, a3, a4, a5);
  return v5;
}

@end