@interface UIColor(PersonaUI)
+ (id)pr_colorNamed:()PersonaUI;
+ (uint64_t)pr_backgroundColor;
+ (uint64_t)pr_darkAccentColor;
+ (uint64_t)pr_lightAccentColor;
@end

@implementation UIColor(PersonaUI)

+ (id)pr_colorNamed:()PersonaUI
{
  v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  v5 = [v3 bundleWithIdentifier:@"com.apple.PersonaUI"];
  v6 = [MEMORY[0x263F1C550] colorNamed:v4 inBundle:v5 compatibleWithTraitCollection:0];

  return v6;
}

+ (uint64_t)pr_lightAccentColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.97647059 green:0.97647059 blue:0.97647059 alpha:1.0];
}

+ (uint64_t)pr_darkAccentColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.952941179 green:0.952941179 blue:0.952941179 alpha:1.0];
}

+ (uint64_t)pr_backgroundColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.505882382 green:0.505882382 blue:0.505882382 alpha:1.0];
}

@end