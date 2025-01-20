@interface CUINamedVectorGlyph(UIKitAdditions)
- UIImageWithAsset:()UIKitAdditions configuration:flippedHorizontally:;
- (id)configuration;
@end

@implementation CUINamedVectorGlyph(UIKitAdditions)

- UIImageWithAsset:()UIKitAdditions configuration:flippedHorizontally:
{
  id v8 = a3;
  id v9 = a4;
  v10 = [_UIImageCUIVectorGlyphContent alloc];
  [a1 scale];
  v11 = -[_UIImageCUIVectorGlyphContent initWithCUIVectorGlyph:scale:](v10, "initWithCUIVectorGlyph:scale:", a1);
  v12 = [[UIImage alloc] _initWithContent:v11 orientation:0];
  [v12 _setRenderingMode:0];
  [v12 _setConfiguration:v9];

  if (a5)
  {
    [v12 _horizontallyFlipImageOrientation];
    v12[26] |= 0x20u;
  }
  if (v8)
  {
    [v12 _setNamed:1];
    [v12 _setImageAsset:v8];
  }
  [v12 _setSymbolMetricsFromNamedVectorGlyph:a1];

  return v12;
}

- (id)configuration
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__CUINamedVectorGlyph_UIKitAdditions__configuration__block_invoke;
  v5[3] = &unk_1E52F18A8;
  v5[4] = a1;
  v1 = +[UITraitCollection traitCollectionWithTraits:v5];
  v2 = v1;
  if (v1) {
    v1 = (void *)[v1 imageConfiguration];
  }
  id v3 = v1;

  return v3;
}

@end