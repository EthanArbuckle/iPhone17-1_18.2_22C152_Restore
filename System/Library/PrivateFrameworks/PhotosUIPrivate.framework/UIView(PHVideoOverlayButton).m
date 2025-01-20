@interface UIView(PHVideoOverlayButton)
+ (id)ph_videoOverlayButton;
@end

@implementation UIView(PHVideoOverlayButton)

+ (id)ph_videoOverlayButton
{
  v0 = objc_msgSend(MEMORY[0x1E4FB1EB0], "px_videoOverlayButtonWithStyle:", 0);
  id v1 = 0;
  if (objc_opt_respondsToSelector()) {
    id v1 = v0;
  }

  return v1;
}

@end