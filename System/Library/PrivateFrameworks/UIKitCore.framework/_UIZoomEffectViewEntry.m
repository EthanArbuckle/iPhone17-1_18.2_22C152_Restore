@interface _UIZoomEffectViewEntry
- (BOOL)canTransitionToEffect:(id)a3;
- (BOOL)shouldAnimateProperty:(id)a3;
- (double)zoomAmount;
- (id)description;
- (void)applyIdentityEffectToView:(id)a3;
- (void)applyRequestedEffectToView:(id)a3;
- (void)convertToIdentity;
- (void)removeEffectFromView:(id)a3;
- (void)setZoomAmount:(double)a3;
@end

@implementation _UIZoomEffectViewEntry

- (BOOL)shouldAnimateProperty:(id)a3
{
  return [@"zoom" isEqualToString:a3];
}

- (void)applyRequestedEffectToView:(id)a3
{
  double zoomAmount = self->_zoomAmount;
  v4 = [a3 layer];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  [v6 setZoom:zoomAmount];
}

- (void)applyIdentityEffectToView:(id)a3
{
  v3 = [a3 layer];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  [v5 setZoom:0.0];
}

- (void)removeEffectFromView:(id)a3
{
  v3 = [a3 layer];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  [v5 setZoom:0.0];
}

- (BOOL)canTransitionToEffect:(id)a3
{
  return 1;
}

- (void)convertToIdentity
{
  self->_double zoomAmount = 0.0;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)_UIZoomEffectViewEntry;
  v3 = [(_UIVisualEffectViewEntry *)&v6 description];
  v4 = objc_msgSend(v3, "stringByAppendingFormat:", @" zoomAmount=%f", *(void *)&self->_zoomAmount);

  return v4;
}

- (double)zoomAmount
{
  return self->_zoomAmount;
}

- (void)setZoomAmount:(double)a3
{
  self->_double zoomAmount = a3;
}

@end