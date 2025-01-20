@interface UserProfileLinkFactory
- (id)createModelForType:(int64_t)a3;
@end

@implementation UserProfileLinkFactory

- (id)createModelForType:(int64_t)a3
{
  if ((unint64_t)a3 > 7)
  {
    v3 = 0;
  }
  else
  {
    v3 = [(__objc2_class *)*off_1013180F0[a3] sharedInstance];
  }
  v4 = [v3 createUserProfileLink];

  return v4;
}

@end