@interface ISDefaultBehavior
- (int64_t)behaviorType;
- (void)_showPhoto;
- (void)activeDidChange;
@end

@implementation ISDefaultBehavior

- (void)_showPhoto
{
  v3 = [[ISPlayerState alloc] initWithPhotoBlurRadius:@"Default" videoAlpha:0.0 videoBlurRadius:0.0 label:0.0];
  [(ISBehavior *)self setOutputInfo:v3 withTransitionOptions:0 completion:0];
}

- (void)activeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)ISDefaultBehavior;
  [(ISBehavior *)&v3 activeDidChange];
  [(ISDefaultBehavior *)self _showPhoto];
}

- (int64_t)behaviorType
{
  return 0;
}

@end