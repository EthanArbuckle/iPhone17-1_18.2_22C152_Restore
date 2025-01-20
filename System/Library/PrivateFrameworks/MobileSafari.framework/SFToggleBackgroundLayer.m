@interface SFToggleBackgroundLayer
- (id)implicitAnimationForKeyPath:(id)a3;
@end

@implementation SFToggleBackgroundLayer

- (id)implicitAnimationForKeyPath:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFToggleBackgroundLayer;
  v5 = [(SFToggleBackgroundLayer *)&v12 implicitAnimationForKeyPath:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else if ([v4 isEqualToString:@"path"])
  {
    id v7 = [MEMORY[0x1E4F39B48] animationWithKeyPath:v4];
    v8 = [(SFToggleBackgroundLayer *)self presentationLayer];
    v9 = [v8 valueForKeyPath:v4];
    [v7 setFromValue:v9];

    v10 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A480]];
    [v7 setTimingFunction:v10];

    [v7 setFillMode:*MEMORY[0x1E4F39F98]];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

@end