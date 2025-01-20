@interface TVZoomableTextView
@end

@implementation TVZoomableTextView

uint64_t __37___TVZoomableTextView_initWithFrame___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    WeakRetained = (id *)objc_msgSend(WeakRetained[78], "tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:", @"select", 1, 1, 0, WeakRetained, 0);
    v2 = v4;
  }
  return MEMORY[0x270F9A758](WeakRetained, v2);
}

uint64_t __37___TVZoomableTextView_initWithFrame___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    WeakRetained = (id *)objc_msgSend(WeakRetained[78], "tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:", @"play", 1, 1, 0, WeakRetained, 0);
    v2 = v4;
  }
  return MEMORY[0x270F9A758](WeakRetained, v2);
}

@end