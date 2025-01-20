@interface MRTransitionChanges
- (MCTransitionTrigger)transition;
- (MRGesturePanZoomRotation)pzr;
- (MRLayer)currentSublayer;
- (MRLayer)nextSublayer;
- (void)dealloc;
- (void)setCurrentSublayer:(id)a3;
- (void)setNextSublayer:(id)a3;
- (void)setPzr:(id)a3;
- (void)setTransition:(id)a3;
@end

@implementation MRTransitionChanges

- (void)dealloc
{
  self->_currentSublayer = 0;
  self->_nextSublayer = 0;

  self->_transition = 0;
  self->_pzr = 0;
  v3.receiver = self;
  v3.super_class = (Class)MRTransitionChanges;
  [(MRTransitionChanges *)&v3 dealloc];
}

- (MRLayer)currentSublayer
{
  return (MRLayer *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCurrentSublayer:(id)a3
{
}

- (MRLayer)nextSublayer
{
  return (MRLayer *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNextSublayer:(id)a3
{
}

- (MCTransitionTrigger)transition
{
  return (MCTransitionTrigger *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTransition:(id)a3
{
}

- (MRGesturePanZoomRotation)pzr
{
  return (MRGesturePanZoomRotation *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPzr:(id)a3
{
}

@end