@interface UIView(PLVideoOverlayButton)
+ (id)pl_videoOverlayButtonWithStyle:()PLVideoOverlayButton;
+ (uint64_t)pl_videoOverlayButtonSize;
@end

@implementation UIView(PLVideoOverlayButton)

+ (uint64_t)pl_videoOverlayButtonSize
{
  v0 = objc_msgSend(MEMORY[0x1E4F42A80], "imageNamed:inBundle:", @"PLVideoOverlayBackgroundMask", objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()));
  return [v0 size];
}

+ (id)pl_videoOverlayButtonWithStyle:()PLVideoOverlayButton
{
  v3 = &off_1E63D1960;
  if (a3 != 2) {
    v3 = &off_1E63D1970;
  }
  v4 = (void *)[objc_alloc(*v3) initWithStyle:a3];
  return v4;
}

@end