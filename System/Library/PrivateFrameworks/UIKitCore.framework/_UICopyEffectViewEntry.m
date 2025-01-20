@interface _UICopyEffectViewEntry
- (BOOL)canTransitionToEffect:(id)a3;
- (_UIVisualEffectViewBackdropCaptureGroup)captureGroup;
- (id)description;
- (void)addEffectToView:(id)a3;
- (void)removeEffectFromView:(id)a3;
- (void)setCaptureGroup:(id)a3;
@end

@implementation _UICopyEffectViewEntry

- (void)addEffectToView:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    captureGroup = self->_captureGroup;
    id v5 = v6;
    [v5 setCaptureGroup:captureGroup];
    [v5 setRenderMode:2];
  }
}

- (void)setCaptureGroup:(id)a3
{
}

- (void)removeEffectFromView:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 removeFromCurrentCaptureGroup];
  }
}

- (BOOL)canTransitionToEffect:(id)a3
{
  return 0;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)_UICopyEffectViewEntry;
  id v3 = [(_UIVisualEffectViewEntry *)&v6 description];
  v4 = [v3 stringByAppendingFormat:@" captureGroup=%@", self->_captureGroup];

  return v4;
}

- (_UIVisualEffectViewBackdropCaptureGroup)captureGroup
{
  return self->_captureGroup;
}

- (void).cxx_destruct
{
}

@end