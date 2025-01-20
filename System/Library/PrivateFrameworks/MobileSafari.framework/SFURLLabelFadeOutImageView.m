@interface SFURLLabelFadeOutImageView
- (BOOL)_shouldAnimatePropertyAdditivelyWithKey:(id)a3;
@end

@implementation SFURLLabelFadeOutImageView

- (BOOL)_shouldAnimatePropertyAdditivelyWithKey:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SFURLLabelFadeOutImageView;
  if ([(SFURLLabelFadeOutImageView *)&v7 _shouldAnimatePropertyAdditivelyWithKey:v4])
  {
    char v5 = 1;
  }
  else
  {
    char v5 = [v4 isEqualToString:@"contentsTransform"];
  }

  return v5;
}

@end