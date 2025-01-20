@interface SUUIExternalResourceImage
- (BOOL)alwaysTemplate;
- (NSBundle)bundle;
- (NSString)imageName;
- (void)setAlwaysTemplate:(BOOL)a3;
- (void)setBundle:(id)a3;
- (void)setImageName:(id)a3;
@end

@implementation SUUIExternalResourceImage

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
}

- (BOOL)alwaysTemplate
{
  return self->_alwaysTemplate;
}

- (void)setAlwaysTemplate:(BOOL)a3
{
  self->_alwaysTemplate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
}

@end