@interface OADLinkedMediaFile
- (BOOL)isExternal;
- (NSURL)url;
- (void)setIsExternal:(BOOL)a3;
- (void)setUrl:(id)a3;
@end

@implementation OADLinkedMediaFile

- (void)setUrl:(id)a3
{
}

- (void)setIsExternal:(BOOL)a3
{
  self->mIsExternal = a3;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)isExternal
{
  return self->mIsExternal;
}

- (void).cxx_destruct
{
}

@end