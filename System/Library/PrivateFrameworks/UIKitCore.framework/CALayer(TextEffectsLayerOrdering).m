@interface CALayer(TextEffectsLayerOrdering)
- (uint64_t)compareTextEffectsOrdering:()TextEffectsLayerOrdering;
@end

@implementation CALayer(TextEffectsLayerOrdering)

- (uint64_t)compareTextEffectsOrdering:()TextEffectsLayerOrdering
{
  id v4 = a3;
  v5 = [a1 delegate];
  v6 = [v4 delegate];

  uint64_t v7 = [v5 compareTextEffectsOrdering:v6];
  return v7;
}

@end