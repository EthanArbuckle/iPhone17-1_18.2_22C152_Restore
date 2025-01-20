@interface PKAppleCashCardView
- (PKAppleCashCardView)initWithDiffuse:(CGImage *)a3 metalness:(CGImage *)a4 normal:(CGImage *)a5;
@end

@implementation PKAppleCashCardView

- (PKAppleCashCardView)initWithDiffuse:(CGImage *)a3 metalness:(CGImage *)a4 normal:(CGImage *)a5
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__PKAppleCashCardView_initWithDiffuse_metalness_normal___block_invoke;
  v6[3] = &__block_descriptor_56_e51___PKTexturedCardRenderer_16__0__PKMetalRenderLoop_8l;
  v6[4] = a3;
  v6[5] = a4;
  v6[6] = a5;
  return (PKAppleCashCardView *)-[PKTexturedCardView _initWithPixelFormat:renderer:]((id *)&self->super.super.super.super.isa, 80, v6);
}

id *__56__PKAppleCashCardView_initWithDiffuse_metalness_normal___block_invoke(uint64_t *a1, void *a2)
{
  id v3 = a2;
  [v3 setColorSpace:PKColorSpaceStandardRGB()];
  v4 = -[PKTexturedCardRenderer initWithStyle:renderLoop:diffuse:metalness:normal:]((id *)[PKTexturedCardRenderer alloc], 0, v3, a1[4], a1[5], a1[6]);

  return v4;
}

@end