@interface UIScrollView(Workflow)
- (uint64_t)wf_scrollToTopAnimated:()Workflow;
@end

@implementation UIScrollView(Workflow)

- (uint64_t)wf_scrollToTopAnimated:()Workflow
{
  if (a3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    return [a1 _scrollToTopIfPossible:1];
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0 {
         && (objc_opt_respondsToSelector() & 1) != 0
  }
         && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [a1 _effectiveContentInset];
    double v6 = v5;
    [a1 _firstPageOffset];
    double v8 = v7 - v6;
    [a1 _revealableContentPadding];
    objc_msgSend(a1, "setContentOffset:", 0.0, v8 - v9);
    return 1;
  }
  else
  {
    return 0;
  }
}

@end