@interface UIFont(Weather)
- (id)wa_bold;
@end

@implementation UIFont(Weather)

- (id)wa_bold
{
  v1 = [a1 fontDescriptor];
  v2 = [v1 fontDescriptorWithSymbolicTraits:2];

  v3 = [MEMORY[0x263F1C658] fontWithDescriptor:v2 size:0.0];

  return v3;
}

@end