@interface _PUIDPointerControllerClientState
- (BOOL)isAssertingPointerHidden;
- (BOOL)isAssertingPointerVisible;
- (CATransform3D)transformFromClientContextToDisplay;
- (PSPointerHoverRegion)activeHoverRegion;
- (_PUIDPointerControllerClientState)init;
- (int64_t)previousPointerEventActiveHoverRegionHitTestState;
- (unint64_t)hoverRegionGenerationID;
- (void)invalidateAutomaticRegionExitTimer;
- (void)setActiveHoverRegion:(id)a3;
- (void)setAssertingPointerHidden:(BOOL)a3;
- (void)setAssertingPointerVisible:(BOOL)a3;
- (void)setHoverRegionGenerationID:(unint64_t)a3;
- (void)setPreviousPointerEventActiveHoverRegionHitTestState:(int64_t)a3;
- (void)setTransformFromClientContextToDisplay:(CATransform3D *)a3;
- (void)startAutomaticRegionExitTimerWithDelayInterval:(double)a3 fireHandler:(id)a4;
@end

@implementation _PUIDPointerControllerClientState

- (_PUIDPointerControllerClientState)init
{
  v7.receiver = self;
  v7.super_class = (Class)_PUIDPointerControllerClientState;
  result = [(_PUIDPointerControllerClientState *)&v7 init];
  if (result)
  {
    long long v3 = *(_OWORD *)&CATransform3DIdentity.m33;
    *(_OWORD *)&result->_transformFromClientContextToDisplay.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
    *(_OWORD *)&result->_transformFromClientContextToDisplay.m33 = v3;
    long long v4 = *(_OWORD *)&CATransform3DIdentity.m43;
    *(_OWORD *)&result->_transformFromClientContextToDisplay.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
    *(_OWORD *)&result->_transformFromClientContextToDisplay.m43 = v4;
    long long v5 = *(_OWORD *)&CATransform3DIdentity.m13;
    *(_OWORD *)&result->_transformFromClientContextToDisplay.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
    *(_OWORD *)&result->_transformFromClientContextToDisplay.m13 = v5;
    long long v6 = *(_OWORD *)&CATransform3DIdentity.m23;
    *(_OWORD *)&result->_transformFromClientContextToDisplay.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
    *(_OWORD *)&result->_transformFromClientContextToDisplay.m23 = v6;
  }
  return result;
}

- (void)invalidateAutomaticRegionExitTimer
{
  [(NSTimer *)self->_automaticHoverRegionExitTimer invalidate];
  automaticHoverRegionExitTimer = self->_automaticHoverRegionExitTimer;
  self->_automaticHoverRegionExitTimer = 0;
}

- (void)startAutomaticRegionExitTimerWithDelayInterval:(double)a3 fireHandler:(id)a4
{
  id v6 = a4;
  [(NSTimer *)self->_automaticHoverRegionExitTimer invalidate];
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100011120;
  v10[3] = &unk_100044F88;
  objc_copyWeak(&v12, &location);
  id v7 = v6;
  id v11 = v7;
  v8 = +[NSTimer scheduledTimerWithTimeInterval:1 repeats:v10 block:a3];
  automaticHoverRegionExitTimer = self->_automaticHoverRegionExitTimer;
  self->_automaticHoverRegionExitTimer = v8;

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (PSPointerHoverRegion)activeHoverRegion
{
  return self->_activeHoverRegion;
}

- (void)setActiveHoverRegion:(id)a3
{
}

- (unint64_t)hoverRegionGenerationID
{
  return self->_hoverRegionGenerationID;
}

- (void)setHoverRegionGenerationID:(unint64_t)a3
{
  self->_hoverRegionGenerationID = a3;
}

- (CATransform3D)transformFromClientContextToDisplay
{
  long long v3 = *(_OWORD *)&self[1].m11;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self->m43;
  *(_OWORD *)&retstr->m33 = v3;
  long long v4 = *(_OWORD *)&self[1].m21;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[1].m13;
  *(_OWORD *)&retstr->m43 = v4;
  long long v5 = *(_OWORD *)&self->m31;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self->m23;
  *(_OWORD *)&retstr->m13 = v5;
  long long v6 = *(_OWORD *)&self->m41;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self->m33;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (void)setTransformFromClientContextToDisplay:(CATransform3D *)a3
{
  long long v3 = *(_OWORD *)&a3->m11;
  long long v4 = *(_OWORD *)&a3->m13;
  long long v5 = *(_OWORD *)&a3->m23;
  *(_OWORD *)&self->_transformFromClientContextToDisplay.m21 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->_transformFromClientContextToDisplay.m23 = v5;
  *(_OWORD *)&self->_transformFromClientContextToDisplay.m11 = v3;
  *(_OWORD *)&self->_transformFromClientContextToDisplay.m13 = v4;
  long long v6 = *(_OWORD *)&a3->m31;
  long long v7 = *(_OWORD *)&a3->m33;
  long long v8 = *(_OWORD *)&a3->m43;
  *(_OWORD *)&self->_transformFromClientContextToDisplay.m41 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->_transformFromClientContextToDisplay.m43 = v8;
  *(_OWORD *)&self->_transformFromClientContextToDisplay.m31 = v6;
  *(_OWORD *)&self->_transformFromClientContextToDisplay.m33 = v7;
}

- (int64_t)previousPointerEventActiveHoverRegionHitTestState
{
  return self->_previousPointerEventActiveHoverRegionHitTestState;
}

- (void)setPreviousPointerEventActiveHoverRegionHitTestState:(int64_t)a3
{
  self->_previousPointerEventActiveHoverRegionHitTestState = a3;
}

- (BOOL)isAssertingPointerHidden
{
  return self->_assertingPointerHidden;
}

- (void)setAssertingPointerHidden:(BOOL)a3
{
  self->_assertingPointerHidden = a3;
}

- (BOOL)isAssertingPointerVisible
{
  return self->_assertingPointerVisible;
}

- (void)setAssertingPointerVisible:(BOOL)a3
{
  self->_assertingPointerVisible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeHoverRegion, 0);
  objc_storeStrong((id *)&self->_automaticHoverRegionExitTimer, 0);
}

@end