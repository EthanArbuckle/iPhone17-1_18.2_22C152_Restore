@interface PLResourceDataStoreOptions
- (BOOL)assumeNoExistingResources;
- (void)setAssumeNoExistingResources:(BOOL)a3;
@end

@implementation PLResourceDataStoreOptions

- (void)setAssumeNoExistingResources:(BOOL)a3
{
  self->_assumeNoExistingResources = a3;
}

- (BOOL)assumeNoExistingResources
{
  return self->_assumeNoExistingResources;
}

@end