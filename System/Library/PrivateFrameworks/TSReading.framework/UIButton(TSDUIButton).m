@interface UIButton(TSDUIButton)
+ (void)tsdPlatformButtonWithFrame:()TSDUIButton;
- (uint64_t)setAlternateImageNamed:()TSDUIButton inBundle:;
- (uint64_t)setImageNamed:()TSDUIButton inBundle:;
- (uint64_t)setTarget:()TSDUIButton action:;
@end

@implementation UIButton(TSDUIButton)

+ (void)tsdPlatformButtonWithFrame:()TSDUIButton
{
  v8 = (void *)[MEMORY[0x263F1C488] buttonWithType:0];
  objc_msgSend(v8, "setFrame:", a1, a2, a3, a4);
  return v8;
}

- (uint64_t)setTarget:()TSDUIButton action:
{
  return [a1 addTarget:a3 action:a4 forControlEvents:64];
}

- (uint64_t)setImageNamed:()TSDUIButton inBundle:
{
  uint64_t v5 = [MEMORY[0x263F1C6B0] imageNamed:a3 inBundle:a4 compatibleWithTraitCollection:0];
  [a1 setImage:v5 forState:0];

  return [a1 setImage:v5 forState:2];
}

- (uint64_t)setAlternateImageNamed:()TSDUIButton inBundle:
{
  uint64_t v5 = [MEMORY[0x263F1C6B0] imageNamed:a3 inBundle:a4 compatibleWithTraitCollection:0];

  return [a1 setImage:v5 forState:1];
}

@end