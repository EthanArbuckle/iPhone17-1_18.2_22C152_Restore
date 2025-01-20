@interface SBApplicationIcon
- (id)application;
- (id)applicationPlaceholder;
@end

@implementation SBApplicationIcon

- (id)applicationPlaceholder
{
  v4.receiver = self;
  v4.super_class = (Class)SBApplicationIcon;
  v2 = [(SBHApplicationIcon *)&v4 applicationPlaceholder];
  return v2;
}

- (id)application
{
  v4.receiver = self;
  v4.super_class = (Class)SBApplicationIcon;
  v2 = [(SBHApplicationIcon *)&v4 application];
  return v2;
}

@end