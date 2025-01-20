@interface SUICCheckGlyphSpringAnimationFactory
@end

@implementation SUICCheckGlyphSpringAnimationFactory

uint64_t __77___SUICCheckGlyphSpringAnimationFactory_springAnimationWithKeyPath_velocity___block_invoke(uint64_t a1)
{
  [(id)_SUICDefaultSpringAnimationFactory setVelocity:*(double *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [(id)_SUICDefaultSpringAnimationFactory springAnimationWithKeyPath:*(void *)(a1 + 32)];

  return MEMORY[0x1F41817F8]();
}

@end