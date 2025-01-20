@interface UIActivityGroupActivityCell
@end

@implementation UIActivityGroupActivityCell

void __64___UIActivityGroupActivityCell_initHighlightedImageViewIfNeeded__block_invoke(uint64_t a1)
{
  v13[4] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) imageView];
  id v3 = objc_alloc(MEMORY[0x1E4FB1838]);
  v4 = [v2 image];
  v5 = (void *)[v3 initWithImage:v4];

  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 setAlpha:0.0];
  [v5 setDrawMode:2];
  v6 = [*(id *)(a1 + 32) contentView];
  [v6 insertSubview:v5 belowSubview:v2];

  v7 = [*(id *)(a1 + 32) contentView];
  v8 = [MEMORY[0x1E4F28DC8] constraintWithItem:v5 attribute:9 relatedBy:0 toItem:v2 attribute:9 multiplier:1.0 constant:0.0];
  v13[0] = v8;
  v9 = [MEMORY[0x1E4F28DC8] constraintWithItem:v5 attribute:10 relatedBy:0 toItem:v2 attribute:10 multiplier:1.0 constant:0.0];
  v13[1] = v9;
  v10 = [MEMORY[0x1E4F28DC8] constraintWithItem:v5 attribute:8 relatedBy:0 toItem:v2 attribute:8 multiplier:1.0 constant:0.0];
  v13[2] = v10;
  v11 = [MEMORY[0x1E4F28DC8] constraintWithItem:v5 attribute:7 relatedBy:0 toItem:v2 attribute:7 multiplier:1.0 constant:0.0];
  v13[3] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:4];
  [v7 addConstraints:v12];

  [*(id *)(a1 + 32) setHighlightedImageView:v5];
}

@end