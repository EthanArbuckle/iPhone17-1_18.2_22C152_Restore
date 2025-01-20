@interface _PUOneUpView
- (BOOL)canBecomeFocused;
- (id)focusEffect;
@end

@implementation _PUOneUpView

- (id)focusEffect
{
  return 0;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

@end