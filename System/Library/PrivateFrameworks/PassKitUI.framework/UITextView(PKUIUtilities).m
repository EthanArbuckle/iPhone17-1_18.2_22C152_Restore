@interface UITextView(PKUIUtilities)
+ (id)pkui_plainInteractiveTextViewWithFrame:()PKUIUtilities;
+ (id)pkui_plainNonInteractiveTextViewWithFrame:()PKUIUtilities;
+ (void)pkui_styleTextView:()PKUIUtilities;
- (double)pkui_frameForTextFrame:()PKUIUtilities;
- (double)pkui_textFrame;
@end

@implementation UITextView(PKUIUtilities)

+ (void)pkui_styleTextView:()PKUIUtilities
{
  v3 = (void *)MEMORY[0x1E4FB1618];
  id v4 = a3;
  v5 = [v3 clearColor];
  [v4 setBackgroundColor:v5];

  objc_msgSend(v4, "setContentInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  id v6 = [v4 textContainer];

  [v6 setLineFragmentPadding:0.0];
}

+ (id)pkui_plainInteractiveTextViewWithFrame:()PKUIUtilities
{
  id v6 = objc_msgSend([a1 alloc], "initWithFrame:", a2, a3, a4, a5);
  [(objc_class *)a1 pkui_styleTextView:v6];

  return v6;
}

+ (id)pkui_plainNonInteractiveTextViewWithFrame:()PKUIUtilities
{
  id v6 = objc_msgSend([a1 alloc], "initReadonlyAndUnselectableWithFrame:textContainer:", 0, a2, a3, a4, a5);
  [(objc_class *)a1 pkui_styleTextView:v6];
  [v6 setUserInteractionEnabled:0];
  [v6 setScrollEnabled:0];

  return v6;
}

- (double)pkui_frameForTextFrame:()PKUIUtilities
{
  [a1 textContainerInset];
  return a2 - v3;
}

- (double)pkui_textFrame
{
  [a1 frame];
  double v3 = v2;
  [a1 textContainerInset];
  return v3 + v4;
}

@end