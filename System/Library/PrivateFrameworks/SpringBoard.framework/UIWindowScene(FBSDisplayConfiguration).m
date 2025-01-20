@interface UIWindowScene(FBSDisplayConfiguration)
- (id)_fbsDisplayConfiguration;
- (id)_fbsDisplayIdentity;
@end

@implementation UIWindowScene(FBSDisplayConfiguration)

- (id)_fbsDisplayConfiguration
{
  v1 = [a1 screen];
  v2 = [v1 displayConfiguration];

  return v2;
}

- (id)_fbsDisplayIdentity
{
  v1 = [a1 screen];
  v2 = [v1 displayIdentity];

  return v2;
}

@end