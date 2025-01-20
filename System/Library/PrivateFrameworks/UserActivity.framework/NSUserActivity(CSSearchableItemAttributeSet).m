@interface NSUserActivity(CSSearchableItemAttributeSet)
- (id)contentAttributeSet;
- (void)setContentAttributeSet:()CSSearchableItemAttributeSet;
@end

@implementation NSUserActivity(CSSearchableItemAttributeSet)

- (void)setContentAttributeSet:()CSSearchableItemAttributeSet
{
  id v5 = a3;
  v4 = [a1 _internalUserActivity];
  [v4 setContentAttributeSet:v5];
}

- (id)contentAttributeSet
{
  v1 = [a1 _internalUserActivity];
  v2 = [v1 contentAttributeSet];

  return v2;
}

@end