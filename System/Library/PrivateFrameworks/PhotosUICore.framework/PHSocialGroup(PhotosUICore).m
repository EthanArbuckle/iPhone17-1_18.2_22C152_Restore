@interface PHSocialGroup(PhotosUICore)
- (id)px_navigationURL;
@end

@implementation PHSocialGroup(PhotosUICore)

- (id)px_navigationURL
{
  v1 = NSString;
  v2 = [a1 localIdentifier];
  v3 = [v1 stringWithFormat:@"photos://social-groups?identifier=%@", v2];

  v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];

  return v4;
}

@end