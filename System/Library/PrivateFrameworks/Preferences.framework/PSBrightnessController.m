@interface PSBrightnessController
+ (id)sharedController;
- (id)brightnessChangedExternally;
- (id)isTracking;
- (void)setBrightnessChangedExternally:(id)a3;
- (void)setIsTracking:(id)a3;
@end

@implementation PSBrightnessController

+ (id)sharedController
{
  v2 = (void *)sharedController___sharedController;
  if (!sharedController___sharedController)
  {
    v3 = objc_alloc_init(PSBrightnessController);
    v4 = (void *)sharedController___sharedController;
    sharedController___sharedController = (uint64_t)v3;

    v2 = (void *)sharedController___sharedController;
  }
  return v2;
}

- (id)isTracking
{
  return self->_isTracking;
}

- (void)setIsTracking:(id)a3
{
}

- (id)brightnessChangedExternally
{
  return self->_brightnessChangedExternally;
}

- (void)setBrightnessChangedExternally:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_brightnessChangedExternally, 0);
  objc_storeStrong(&self->_isTracking, 0);
}

@end