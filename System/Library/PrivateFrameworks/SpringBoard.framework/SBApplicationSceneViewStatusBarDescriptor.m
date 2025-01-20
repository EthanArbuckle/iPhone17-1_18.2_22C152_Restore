@interface SBApplicationSceneViewStatusBarDescriptor
+ (id)statusBarDescriptorWithForceHidden:(BOOL)a3;
- (BOOL)isForcedHidden;
- (SBApplicationSceneViewStatusBarDescriptor)initWithForceHidden:(BOOL)a3;
- (id)debugDescription;
- (void)setForceHidden:(BOOL)a3;
@end

@implementation SBApplicationSceneViewStatusBarDescriptor

- (BOOL)isForcedHidden
{
  return self->_forceHidden;
}

- (void)setForceHidden:(BOOL)a3
{
  self->_forceHidden = a3;
}

- (SBApplicationSceneViewStatusBarDescriptor)initWithForceHidden:(BOOL)a3
{
  result = [(SBApplicationSceneViewStatusBarDescriptor *)self init];
  if (result) {
    result->_forceHidden = a3;
  }
  return result;
}

+ (id)statusBarDescriptorWithForceHidden:(BOOL)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithForceHidden:a3];
  return v3;
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"%@: forceHidden: %d", self, -[SBApplicationSceneViewStatusBarDescriptor isForcedHidden](self, "isForcedHidden")];
}

@end