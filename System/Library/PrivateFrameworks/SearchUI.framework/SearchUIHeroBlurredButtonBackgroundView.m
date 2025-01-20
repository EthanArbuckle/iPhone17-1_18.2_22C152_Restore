@interface SearchUIHeroBlurredButtonBackgroundView
- (SearchUIHeroBlurredButtonBackgroundView)init;
@end

@implementation SearchUIHeroBlurredButtonBackgroundView

- (SearchUIHeroBlurredButtonBackgroundView)init
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)SearchUIHeroBlurredButtonBackgroundView;
  v2 = [(SearchUIHeroBlurredButtonBackgroundView *)&v10 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4FB1EF8];
    v4 = [MEMORY[0x1E4FB1618] colorWithWhite:0.937254902 alpha:0.24];
    v5 = [v3 effectCompositingColor:v4];
    v11[0] = v5;
    v6 = [MEMORY[0x1E4FB14C8] effectWithBlurRadius:4.0];
    v11[1] = v6;
    v7 = [MEMORY[0x1E4FB1620] colorEffectSaturate:1.2];
    v11[2] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
    [(SearchUIHeroBlurredButtonBackgroundView *)v2 setBackgroundEffects:v8];
  }
  return v2;
}

@end