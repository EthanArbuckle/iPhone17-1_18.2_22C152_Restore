@interface PFParallaxLayoutAlphabeticalTextOverlapParameters
- (double)bottomAreaHeight;
- (double)maxBottomOverlap;
- (double)maxTopOverlapForTopRect:(CGRect)a3 isInteractive:(BOOL)a4;
- (double)targetBottomOverlap;
@end

@implementation PFParallaxLayoutAlphabeticalTextOverlapParameters

- (double)maxTopOverlapForTopRect:(CGRect)a3 isInteractive:(BOOL)a4
{
  v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = [v4 objectForKey:@"PFAlphabeticalTextMaxTopAreaOverlap"];

  if (v5)
  {
    [v5 doubleValue];
    double v7 = v6;
  }
  else
  {
    double v7 = 0.001;
  }

  return v7;
}

- (double)maxBottomOverlap
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = [v2 objectForKey:@"PFAlphabeticalTextMaxBottomAreaOverlap"];

  if (v3)
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 1.0;
  }

  return v5;
}

- (double)targetBottomOverlap
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = [v2 objectForKey:@"PFAlphabeticalTextTargetBottomAreaOverlap"];

  if (v3)
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.5;
  }

  return v5;
}

- (double)bottomAreaHeight
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = [v2 objectForKey:@"PFAlphabeticalTextBottomAreaHeight"];

  if (v3)
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.25;
  }

  return v5;
}

@end