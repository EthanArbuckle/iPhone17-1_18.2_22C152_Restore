@interface _UIBlurEffectVariableImpl
- (BOOL)isEqual:(id)a3;
- (_UIBlurEffectVariableImpl)initWithBaseRadius:(double)a3 imageMask:(id)a4 scale:(double)a5 allowAXAdaptation:(BOOL)a6;
- (unint64_t)hash;
- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5;
- (void)appendDescriptionTo:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIBlurEffectVariableImpl

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  v42[2] = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  id v7 = a4;
  if ([v7 reducedTransperancy] && self->_allowAXAdaptation)
  {
    _UIBlurEffectAddAverageColorFilterEntry(v36, v7, fmax(self->_blurScale, 0.25));
  }
  else
  {
    double blurRadius = self->_blurRadius;
    imageMask = self->_imageMask;
    double blurScale = self->_blurScale;
    id v11 = v36;
    id v12 = v7;
    v13 = imageMask;
    if ([v12 allowsBlurring])
    {
      v42[0] = (id)*MEMORY[0x1E4F3A1B8];
      v42[1] = (id)*MEMORY[0x1E4F3A170];
      long long v41 = xmmword_1E52DD1C0;
      v14 = (void *)MEMORY[0x1E4F1C9E8];
      if ([v12 allowsDithering]) {
        uint64_t v15 = 2;
      }
      else {
        uint64_t v15 = 1;
      }
      v35 = [v14 dictionaryWithObjects:&v41 forKeys:v42 count:v15];
      v16 = [v12 traitCollection];
      v17 = v13;
      v18 = [(UIImage *)v17 _primitiveImageAsset];
      v19 = v18;
      if (v18)
      {
        uint64_t v20 = [v18 imageWithTraitCollection:v16];

        v17 = (UIImage *)v20;
      }
      v21 = v17;
      uint64_t v22 = [(UIImage *)v21 CGImage];
      if (!v22)
      {
        v33 = [MEMORY[0x1E4F28B00] currentHandler];
        v34 = objc_msgSend(NSString, "stringWithUTF8String:", "CGImageRef _imageRefFromUIImage(UIImage *__strong, UITraitCollection *__strong)");
        [v33 handleFailureInFunction:v34, @"UIBlurEffect.m", 994, @"UIImage (%@) returned NULL from -CGImage.", v21 file lineNumber description];
      }
      v23 = [_UIVisualEffectFilterEntry alloc];
      uint64_t v24 = *MEMORY[0x1E4F3A348];
      v39[0] = *MEMORY[0x1E4F3A1D8];
      uint64_t v25 = v39[0];
      v26 = [NSNumber numberWithDouble:blurRadius];
      v39[1] = @"inputMaskImage";
      v40[0] = v26;
      v40[1] = v22;
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];
      v37[0] = v25;
      v37[1] = @"inputMaskImage";
      v38[0] = &unk_1ED3F1B08;
      v38[1] = v22;
      v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
      v29 = [(_UIVisualEffectFilterEntry *)v23 initWithFilterType:v24 configurationValues:v35 requestedValues:v27 identityValues:v28];

      [(_UIVisualEffectFilterEntry *)v29 setIdentityScaleHint:1.0];
      [(_UIVisualEffectFilterEntry *)v29 setUseRelaxedDiffingRule:1];
      double v30 = 0.5;
      if (blurScale > 0.0) {
        double v30 = blurScale;
      }
      [(_UIVisualEffectFilterEntry *)v29 setRequestedScaleHint:v30];
      [v11 addFilterEntry:v29];

      for (uint64_t i = 1; i != -1; --i)
      for (uint64_t j = 1; j != -1; --j)
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = (unsigned __int8 *)v4;
    v6 = v5;
    if (*((double *)v5 + 1) == self->_blurRadius && *((double *)v5 + 2) == self->_blurScale)
    {
      id v7 = (void *)*((void *)v5 + 3);
      v8 = self->_imageMask;
      v9 = v7;
      if (v8 == v9)
      {

LABEL_14:
        BOOL v12 = v6[32] == self->_allowAXAdaptation;
LABEL_16:

        goto LABEL_17;
      }
      v10 = v9;
      if (v8) {
        BOOL v11 = v9 == 0;
      }
      else {
        BOOL v11 = 1;
      }
      if (v11)
      {
      }
      else
      {
        BOOL v13 = [(UIImage *)v8 isEqual:v9];

        if (v13) {
          goto LABEL_14;
        }
      }
    }
    BOOL v12 = 0;
    goto LABEL_16;
  }
  BOOL v12 = 0;
LABEL_17:

  return v12;
}

- (_UIBlurEffectVariableImpl)initWithBaseRadius:(double)a3 imageMask:(id)a4 scale:(double)a5 allowAXAdaptation:(BOOL)a6
{
  id v11 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_UIBlurEffectVariableImpl;
  BOOL v12 = [(_UIBlurEffectVariableImpl *)&v16 init];
  BOOL v13 = v12;
  if (v12)
  {
    if (a3 >= 0.0) {
      double v14 = a3;
    }
    else {
      double v14 = 0.0;
    }
    v12->_double blurRadius = v14;
    v12->_double blurScale = fmax(fmin(a5, 1.0), 0.0);
    objc_storeStrong((id *)&v12->_imageMask, a4);
    v13->_allowAXAdaptation = a6;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (self->_blurRadius > 0.0) {
    objc_msgSend(v4, "encodeDouble:forKey:", @"UIBlurEffectRadius");
  }
  if (self->_blurScale > 0.0) {
    objc_msgSend(v4, "encodeDouble:forKey:", @"UIBlurEffectScale");
  }
  if (!self->_allowAXAdaptation) {
    [v4 encodeBool:0 forKey:@"UIBlurEffectAllowAXAdaptation"];
  }
  [v4 encodeObject:self->_imageMask forKey:@"UIBlurEffectImageMask"];
}

- (unint64_t)hash
{
  unint64_t v2 = vcvtmd_u64_f64(self->_blurRadius);
  return ([(UIImage *)self->_imageMask hash] + self->_allowAXAdaptation) * v2;
}

- (void)appendDescriptionTo:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "appendFormat:", @" blurRadius=%f", *(void *)&self->_blurRadius);
  if (self->_blurScale > 0.0) {
    objc_msgSend(v4, "appendFormat:", @" blurScale=%f", *(void *)&self->_blurScale);
  }
  [v4 appendFormat:@" imageMask=%@", self->_imageMask];
  if (!self->_allowAXAdaptation) {
    [v4 appendString:@" allowAXAdaptation=NO"];
  }
}

- (void).cxx_destruct
{
}

@end