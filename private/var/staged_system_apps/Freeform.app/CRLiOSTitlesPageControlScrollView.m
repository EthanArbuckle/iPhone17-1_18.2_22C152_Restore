@interface CRLiOSTitlesPageControlScrollView
- (BOOL)touchesShouldCancelInContentView:(id)a3;
@end

@implementation CRLiOSTitlesPageControlScrollView

- (BOOL)touchesShouldCancelInContentView:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CRLiOSTitlesPageControlScrollView;
    BOOL v5 = [(CRLiOSTitlesPageControlScrollView *)&v7 touchesShouldCancelInContentView:v4];
  }

  return v5;
}

@end