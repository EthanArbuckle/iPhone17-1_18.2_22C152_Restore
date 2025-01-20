@interface SBHardwareButtonDropletAnimationEvent
- (SBHardwareButtonDropletAnimationEvent)initWithPreludeToken:(id)a3 zoomUpToken:(id)a4;
- (SBHardwareButtonLaunchPreludeAnimationToken)preludeToken;
- (SBHardwareButtonLaunchZoomUpAnimationToken)zoomUpToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (int64_t)type;
- (unint64_t)eventSubtype;
@end

@implementation SBHardwareButtonDropletAnimationEvent

- (int64_t)type
{
  return 39;
}

- (SBHardwareButtonDropletAnimationEvent)initWithPreludeToken:(id)a3 zoomUpToken:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if ((v8 == 0) != (v9 != 0))
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"SBHardwareButtonDropletAnimationEvent.m" lineNumber:28 description:@"Must have either preludeToken OR zoomUpToken"];
  }
  v14.receiver = self;
  v14.super_class = (Class)SBHardwareButtonDropletAnimationEvent;
  v10 = [(SBHardwareButtonDropletAnimationEvent *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_preludeToken, a3);
    objc_storeStrong((id *)&v11->_zoomUpToken, a4);
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SBHardwareButtonDropletAnimationEvent alloc];
  preludeToken = self->_preludeToken;
  zoomUpToken = self->_zoomUpToken;
  return [(SBHardwareButtonDropletAnimationEvent *)v4 initWithPreludeToken:preludeToken zoomUpToken:zoomUpToken];
}

- (unint64_t)eventSubtype
{
  return 0;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBHardwareButtonDropletAnimationEvent;
  v4 = [(SBSwitcherModifierEvent *)&v8 descriptionBuilderWithMultilinePrefix:a3];
  id v5 = (id)[v4 appendObject:self->_preludeToken withName:@"preludeToken"];
  id v6 = (id)[v4 appendObject:self->_zoomUpToken withName:@"zoomUpToken"];
  return v4;
}

- (SBHardwareButtonLaunchPreludeAnimationToken)preludeToken
{
  return self->_preludeToken;
}

- (SBHardwareButtonLaunchZoomUpAnimationToken)zoomUpToken
{
  return self->_zoomUpToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomUpToken, 0);
  objc_storeStrong((id *)&self->_preludeToken, 0);
}

@end