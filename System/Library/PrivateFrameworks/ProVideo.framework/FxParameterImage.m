@interface FxParameterImage
- (FxParameterImage)init;
- (void)dealloc;
@end

@implementation FxParameterImage

- (FxParameterImage)init
{
  v4.receiver = self;
  v4.super_class = (Class)FxParameterImage;
  v2 = [(FxPinParameter *)&v4 init];
  if (v2) {
    [(FxPin *)v2 setValueClass:objc_opt_class()];
  }
  return v2;
}

- (void)dealloc
{
  FxDebugAssert(self->_imagePriv != 0, &cfstr_ImageprivNull.isa, v2, v3, v4, v5, v6, v7, (char)v9.receiver);
  free(self->_imagePriv);
  v9.receiver = self;
  v9.super_class = (Class)FxParameterImage;
  [(FxPinParameter *)&v9 dealloc];
}

@end