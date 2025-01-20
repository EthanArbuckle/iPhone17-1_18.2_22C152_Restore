@interface WFMutableWorkflowUser
- (NSString)email;
- (NSString)fullName;
- (NSString)twitter;
- (NSURL)profileImageURL;
- (NSURL)websiteURL;
- (int64_t)mainIdentity;
- (void)setEmail:(id)a3;
- (void)setFullName:(id)a3;
- (void)setMainIdentity:(int64_t)a3;
- (void)setProfileImageURL:(id)a3;
- (void)setTwitter:(id)a3;
- (void)setWebsiteURL:(id)a3;
@end

@implementation WFMutableWorkflowUser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->profileImageURL, 0);
  objc_storeStrong((id *)&self->websiteURL, 0);
  objc_storeStrong((id *)&self->twitter, 0);
  objc_storeStrong((id *)&self->fullName, 0);
  objc_storeStrong((id *)&self->email, 0);
}

- (void)setMainIdentity:(int64_t)a3
{
  self->mainIdentity = a3;
}

- (int64_t)mainIdentity
{
  return self->mainIdentity;
}

- (void)setProfileImageURL:(id)a3
{
}

- (NSURL)profileImageURL
{
  return self->profileImageURL;
}

- (void)setWebsiteURL:(id)a3
{
}

- (NSURL)websiteURL
{
  return self->websiteURL;
}

- (void)setTwitter:(id)a3
{
}

- (NSString)twitter
{
  return self->twitter;
}

- (void)setFullName:(id)a3
{
}

- (NSString)fullName
{
  return self->fullName;
}

- (void)setEmail:(id)a3
{
}

- (NSString)email
{
  return self->email;
}

@end