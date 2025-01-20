@interface _UIZoomEffect
+ (BOOL)supportsSecureCoding;
+ (id)_underlayZoomEffectWithMagnitude:(double)a3;
+ (id)zoomEffectWithMagnitude:(double)a3;
- (BOOL)isEqual:(id)a3;
- (id)_viewEntry;
- (id)description;
- (unint64_t)hash;
- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5;
@end

@implementation _UIZoomEffect

+ (id)zoomEffectWithMagnitude:(double)a3
{
  v4 = objc_alloc_init(_UIZoomEffect);
  v4->_zoomAmount = a3;
  return v4;
}

+ (id)_underlayZoomEffectWithMagnitude:(double)a3
{
  id result = (id)[a1 zoomEffectWithMagnitude:a3];
  *((unsigned char *)result + 16) = 1;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  return vcvtmd_u64_f64(self->_zoomAmount * 1000.0);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_UIZoomEffect *)a3;
  v5 = v4;
  BOOL v6 = v4 == self
    || v4
    && [(_UIZoomEffect *)v4 isMemberOfClass:objc_opt_class()]
    && self->_zoomAmount == v5->_zoomAmount
    && self->_isUnderlay == v5->_isUnderlay;

  return v6;
}

- (id)_viewEntry
{
  v3 = objc_alloc_init(_UIZoomEffectViewEntry);
  v4 = v3;
  if (self->_isUnderlay) {
    [(_UIVisualEffectViewEntry *)v3 setRequirements:2];
  }
  [(_UIZoomEffectViewEntry *)v4 setZoomAmount:self->_zoomAmount];
  return v4;
}

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  id v6 = a3;
  uint64_t v7 = [(_UIZoomEffect *)self _viewEntry];
  id v8 = (id)v7;
  if (self->_isUnderlay) {
    [v6 addUnderlay:v7];
  }
  else {
    [v6 addViewEffect:v7];
  }
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)_UIZoomEffect;
  v3 = [(_UIZoomEffect *)&v8 description];
  v4 = v3;
  if (self->_isUnderlay) {
    v5 = @" underlay";
  }
  else {
    v5 = &stru_1ED0E84C0;
  }
  id v6 = [v3 stringByAppendingFormat:@" zoom=%f%@", *(void *)&self->_zoomAmount, v5];

  return v6;
}

@end