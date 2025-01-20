@interface TVProgressView
@end

@implementation TVProgressView

void __43___TVProgressView__maskImageForProgressBar__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F1C550] blackColor];
  [v2 setFill];

  v3 = (void *)MEMORY[0x263F1C478];
  v4 = *(void **)(a1 + 32);
  v5 = (void *)v4[60];
  [v4 bounds];
  objc_msgSend(v5, "convertRect:fromView:", *(void *)(a1 + 32));
  objc_msgSend(v3, "bezierPathWithRoundedRect:cornerRadius:");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 fill];
}

@end