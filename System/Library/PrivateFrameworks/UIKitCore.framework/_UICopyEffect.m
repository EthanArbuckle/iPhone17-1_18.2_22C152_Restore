@interface _UICopyEffect
+ (id)copyEffectWithCaptureGroup:(id)a3;
- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5;
- (id)description;
- (int64_t)_expectedUsage;
- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UICopyEffect

- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5
{
  return 0;
}

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  id v6 = a3;
  id v7 = (id)objc_opt_new();
  [v7 setRequirements:2];
  [v7 setCaptureGroup:self->_captureGroup];
  [v6 addUnderlay:v7];
}

+ (id)copyEffectWithCaptureGroup:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = (id *)objc_opt_new();
    [v4 setDisableInPlaceFiltering:1];
    objc_storeStrong(v5 + 1, a3);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"_UICopyEffect.m" lineNumber:38 description:@"_UICopyEffect is not codable"];
}

- (int64_t)_expectedUsage
{
  return 1;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)_UICopyEffect;
  v3 = [(_UICopyEffect *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@" captureGroup=%@", self->_captureGroup];

  return v4;
}

- (void).cxx_destruct
{
}

@end