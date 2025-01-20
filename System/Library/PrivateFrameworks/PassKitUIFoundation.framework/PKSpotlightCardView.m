@interface PKSpotlightCardView
- (BOOL)isLight;
- (PKSpotlightCardView)initWithDiffuse:(CGImage *)a3 contentInsets:(PKEdgeInsets)a4 averageColor:(CGColor *)a5;
@end

@implementation PKSpotlightCardView

- (PKSpotlightCardView)initWithDiffuse:(CGImage *)a3 contentInsets:(PKEdgeInsets)a4 averageColor:(CGColor *)a5
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  if (a5)
  {
    PKColorGetRelativeLuminance();
    BOOL v12 = v11 > 0.8;
  }
  else
  {
    BOOL v12 = 1;
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __66__PKSpotlightCardView_initWithDiffuse_contentInsets_averageColor___block_invoke;
  v16[3] = &__block_descriptor_73_e51___PKTexturedCardRenderer_16__0__PKMetalRenderLoop_8l;
  BOOL v17 = v12;
  v16[4] = a3;
  *(double *)&v16[5] = top;
  *(double *)&v16[6] = left;
  *(double *)&v16[7] = bottom;
  *(double *)&v16[8] = right;
  v13 = (float32x4_t *)-[PKTexturedCardView _initWithPixelFormat:renderer:]((id *)&self->super.super.super.super.isa, 80, v16);
  v14 = v13;
  if (v13)
  {
    v13[28].i8[0] = 1;
    -[PKTexturedCardView _setDeviceAttitude:]((uint64_t)v13, v13[26]);
    v14[28].i8[3] = v12;
  }
  return (PKSpotlightCardView *)v14;
}

id *__66__PKSpotlightCardView_initWithDiffuse_contentInsets_averageColor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setColorSpace:PKColorSpaceStandardRGB()];
  v4 = [PKTexturedCardRenderer alloc];
  if (*(unsigned char *)(a1 + 72)) {
    unint64_t v5 = 3;
  }
  else {
    unint64_t v5 = 4;
  }
  v6 = -[PKTexturedCardRenderer initWithStyle:renderLoop:diffuse:insets:]((id *)&v4->super.isa, v5, v3, *(void *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

  return v6;
}

- (BOOL)isLight
{
  return *(&self->super._motionEnabled + 1);
}

@end