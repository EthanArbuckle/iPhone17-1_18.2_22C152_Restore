@interface SBSaturatedIconView
- (CGSize)sizeThatFits:(CGSize)a3;
- (SBSaturatedIconView)initWithImage:(id)a3;
@end

@implementation SBSaturatedIconView

- (SBSaturatedIconView)initWithImage:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)SBSaturatedIconView;
  v3 = [(SBSaturatedIconView *)&v13 initWithImage:a3];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A040]];
    [v4 setValue:&unk_1F3348BD8 forKey:@"inputBias"];
    [v4 setValue:&unk_1F3348BE8 forKey:@"inputAmount"];
    [(SBSaturatedIconView *)v3 setContentMode:1];
    [(SBSaturatedIconView *)v3 setAlpha:0.899999976];
    v5 = [(SBSaturatedIconView *)v3 layer];
    v14[0] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [v5 setFilters:v6];

    v7 = [(SBSaturatedIconView *)v3 layer];
    [v7 setCompositingFilter:*MEMORY[0x1E4F3A2C8]];

    v8 = [(SBSaturatedIconView *)v3 layer];
    [v8 setShouldRasterize:1];

    v9 = [(SBSaturatedIconView *)v3 layer];
    [v9 setRasterizationScale:SBScreenScale()];

    v10 = [(SBSaturatedIconView *)v3 layer];
    [v10 setAllowsGroupOpacity:0];

    v11 = [(SBSaturatedIconView *)v3 layer];
    [v11 setAllowsGroupBlending:0];
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = [(SBSaturatedIconView *)self image];
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

@end